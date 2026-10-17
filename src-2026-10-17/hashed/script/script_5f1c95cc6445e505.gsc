#using scripts\common\ai\ai_utility;
#using scripts\common\callbacks;
#using scripts\common\system;
#using scripts\common\utility;
#using scripts\common\weapon;
#using scripts\mp\challenges;
#using scripts\mp\challenges\ob_challenges;
#using scripts\mp\gametypes\ob;
#using scripts\mp\loot\common_item_weapon;
#using scripts\mp\ob\systems\ob_nightmare_portal;

#namespace ob_quests;

// Namespace ob_quests
// Params 0, eflags: 0x5
// Checksum 0x148bfa43, Offset: 0x2ae
// Size: 0x21
function private autoexec __init__system__()
{
    system::register( #"ob_quests_challenges", #"ob_quests", &function_552428f5ac9f6827, undefined );
}

// Namespace ob_quests
// Params 0, eflags: 0x4
// Checksum 0x4beb64da, Offset: 0x2d7
// Size: 0x18c
function private function_552428f5ac9f6827()
{
    if ( !ob::get_ob_settings().var_f5fa39823e8b379c )
    {
        return;
    }
    
    if ( !getdvarint( @"scr_ob_quests_enabled", 1 ) )
    {
        return;
    }
    
    utility::registersharedfunc( #"ob_quest", #"activity_complete", &activity_complete );
    utility::registersharedfunc( #"ai", #"hash_943a38c7079b79ec", &function_cd016242b32f0cbb );
    callback::add( #"ob_quest_start", &on_player_quest_start );
    callback::add( "on_tacmap_ping_scriptable_or_ent", &on_tacmap_ping_scriptable_or_ent );
    callback::add( #"hash_91f2a0e70afebfe1", &function_809beca7ddc8cb8a );
    callback::add( #"ob_exfil_success", &on_exfil_success );
    callback::add( #"on_ai_killed", &function_8c5e06ee1e60aeb7 );
    callback::add( #"player_used_item", &function_34da42d1c47d3917 );
    callback::add( #"skill_acquired", &function_9d441c0357f35500 );
    callback::add( #"leo_nm_complete", &nm_complete, #"leo_nm_complete" );
    callback::add( #"aries_nm_complete", &nm_complete, #"aries_nm_complete" );
    callback::add( #"virgo_nm_complete", &nm_complete, #"virgo_nm_complete" );
    callback::add( #"gemini_nm_complete", &nm_complete, #"gemini_nm_complete" );
    callback::add( #"libra_nm_complete", &nm_complete, #"libra_nm_complete" );
}

// Namespace ob_quests
// Params 1, eflags: 0x4
// Checksum 0x6b8dc7f8, Offset: 0x46b
// Size: 0x84
function private on_player_quest_start( sparams )
{
    assert( isplayer( self ) );
    player = self;
    player notify( #"quest_start", sparams );
    var_aed4d8ff7c73a952 = utility::callsharedfunc( #"ob_quest", #"get_active_quest", player );
    
    switch ( var_aed4d8ff7c73a952 )
    {
        case #"hash_d6e6bc790a472e53":
            player thread function_ac38c7090135bfae( #"sat_wc_quest_act1_quest10_exotic_weapon" );
            break;
    }
}

// Namespace ob_quests
// Params 1, eflags: 0xc
// Checksum 0x27fd4e61, Offset: 0x4f7
// Size: 0x150
function private function_ac38c7090135bfae( questhash )
{
    self notify( #"hash_1e64846a01a12692" );
    self endon( #"hash_1e64846a01a12692" );
    self endon( #"quest_start", #"disconnect" );
    
    while ( true )
    {
        wait 1;
        exotic = 0;
        
        foreach ( weapon in self.primaryweapons )
        {
            if ( weapon::function_52f1736c4c1b06d4( weapon ) || 5 == item_weapon::function_fb81bd2fe070faa6( weapon ) )
            {
                exotic = 1;
                break;
            }
        }
        
        if ( exotic || weapon::function_52f1736c4c1b06d4( self.meleeweapons[ 0 ] ) || 5 == item_weapon::function_fb81bd2fe070faa6( self.meleeweapons[ 0 ] ) )
        {
            level callback::callback( #"have_exotic_weapon", { #players:[ self ] } );
            utility::callsharedfunc( #"ob_quest", #"hash_ac975ab816f57494", self, questhash );
            return;
        }
    }
}

// Namespace ob_quests
// Params 3, eflags: 0x4
// Checksum 0xdef99695, Offset: 0x64f
// Size: 0x52e
function private activity_complete( player, activityinstance, contract = 0 )
{
    var_aed4d8ff7c73a952 = utility::callsharedfunc( #"ob_quest", #"get_active_quest", player );
    
    switch ( var_aed4d8ff7c73a952 )
    {
        case #"hash_123238699eeb90d1":
            if ( "REV_OB_MERC_CAMP" == activityinstance.type )
            {
                utility::callsharedfunc( #"ob_quest", #"hash_ac975ab816f57494", player, #"sat_wc_quest_act1_quest1_eliminate_checkpoint" );
            }
            else if ( "REV_OB_SUPPLY_DROP" == activityinstance.type )
            {
                utility::callsharedfunc( #"ob_quest", #"hash_ac975ab816f57494", player, #"sat_wc_quest_act1_quest1_collect_supplydrop" );
            }
            
            break;
        case #"hash_123235699eeb8bb8":
            if ( contract )
            {
                utility::callsharedfunc( #"ob_quest", #"hash_ac975ab816f57494", player, #"sat_wc_quest_act1_quest2_assignments" );
            }
            else
            {
                utility::callsharedfunc( #"ob_quest", #"hash_ac975ab816f57494", player, #"sat_wc_quest_act1_quest2_activities" );
            }
            
            break;
        case #"hash_123236699eeb8d6b":
            if ( "REV_OB_HARVESTERORB" == activityinstance.type )
            {
                utility::callsharedfunc( #"ob_quest", #"hash_ac975ab816f57494", player, #"sat_wc_quest_act1_quest3_drone_hunt" );
            }
            else if ( "REV_OB_TARGET_ELIMINATION" == activityinstance.type && activityinstance.var_6e8150083c0db71d )
            {
                utility::callsharedfunc( #"ob_quest", #"hash_ac975ab816f57494", player, #"sat_wc_quest_act1_quest3_target_elimination" );
            }
            
            break;
        case #"hash_12323b699eeb95ea":
            if ( "REV_OB_MERC_STRONGHOLD" == activityinstance.type )
            {
                utility::callsharedfunc( #"ob_quest", #"hash_ac975ab816f57494", player, #"sat_wc_quest_act1_quest4_merc_stronghold" );
            }
            
            break;
        case #"hash_12323c699eeb979d":
            if ( "REV_OB_SURPRISE_SHIPMENT" == activityinstance.type && player.region_difficulty != "difficulty_easy" )
            {
                utility::callsharedfunc( #"ob_quest", #"hash_ac975ab816f57494", player, #"sat_wc_quest_act1_quest5_surprise_shipment" );
            }
            else if ( "REV_OB_MYSTERY_CARGO" == activityinstance.type && player.region_difficulty != "difficulty_easy" )
            {
                utility::callsharedfunc( #"ob_quest", #"hash_ac975ab816f57494", player, #"sat_wc_quest_act1_quest5_mystery_cargo" );
            }
            
            break;
        case #"hash_123239699eeb9284":
            if ( "REV_OB_PRIME_TARGET" == activityinstance.type && !( player.region_difficulty == "difficulty_easy" || player.region_difficulty == "difficulty_normal" ) )
            {
                utility::callsharedfunc( #"ob_quest", #"hash_ac975ab816f57494", player, #"sat_wc_quest_act1_quest6_prime_target" );
            }
            else if ( "REV_OB_CONTRACT_HVT" == activityinstance.type && !( player.region_difficulty == "difficulty_easy" || player.region_difficulty == "difficulty_normal" ) )
            {
                utility::callsharedfunc( #"ob_quest", #"hash_ac975ab816f57494", player, #"sat_wc_quest_act1_quest6_hvt_assignment" );
            }
            
            break;
        case #"hash_123230699eeb8339":
            if ( "OB_SCORPIO_INTERIOR" == activityinstance.type || "REV_OB_POI_BOSS" == activityinstance.type || "REV_OB_VTOL_BOSS" == activityinstance.type || "REV_OB_CRADLE_BOMB" == activityinstance.type || "REV_OB_TOXIN_BOMB" == activityinstance.type )
            {
                utility::callsharedfunc( #"ob_quest", #"hash_ac975ab816f57494", player, #"sat_wc_quest_act1_quest9_world_event" );
            }
            
            break;
        case #"hash_d6e6bc790a472e53":
            if ( "REV_OB_STRIKE_BOSS" == activityinstance.type )
            {
                utility::callsharedfunc( #"ob_quest", #"hash_ac975ab816f57494", player, #"sat_wc_quest_act1_quest10_strike_boss" );
                level thread ob_nightmare_portal::enable_nightmare_portal( [ player ], "aries" );
            }
            
            break;
        case #"hash_ce158a6f1971f5ae":
            if ( "REV_OB_ABOM_HUNT" == activityinstance.type )
            {
                level thread ob_nightmare_portal::enable_nightmare_portal( [ player ], "virgo" );
            }
            
            break;
        case #"hash_726a81f83d96bc09":
            if ( "REV_OB_POSSESSED_CONVOY" == activityinstance.type )
            {
                level thread ob_nightmare_portal::enable_nightmare_portal( [ player ], "gemini" );
            }
            
            break;
        case #"hash_6bf025828351a44c":
            if ( "REV_OB_LOCKED_IN" == activityinstance.type )
            {
                level thread ob_nightmare_portal::enable_nightmare_portal( [ player ], "libra" );
            }
            
            break;
    }
}

// Namespace ob_quests
// Params 1, eflags: 0x4
// Checksum 0x35f17150, Offset: 0xb85
// Size: 0x87
function private on_exfil_success( sparams )
{
    assert( isplayer( self ) );
    player = self;
    var_aed4d8ff7c73a952 = utility::callsharedfunc( #"ob_quest", #"get_active_quest", player );
    
    switch ( var_aed4d8ff7c73a952 )
    {
        case #"hash_123235699eeb8bb8":
            utility::callsharedfunc( #"ob_quest", #"hash_ac975ab816f57494", player, #"sat_wc_quest_act1_quest2_exfil" );
            break;
    }
}

// Namespace ob_quests
// Params 1, eflags: 0x4
// Checksum 0x623ae34f, Offset: 0xc14
// Size: 0x379
function private function_8c5e06ee1e60aeb7( sparams )
{
    assistplayers = [];
    ai_tier = ai_utility::get_ai_tier();
    
    if ( isarray( self.var_57700436ec65d38c ) && ( ai_tier == 2 || ai_tier == 3 ) )
    {
        foreach ( player in self.var_57700436ec65d38c )
        {
            if ( !isplayer( player ) )
            {
                continue;
            }
            
            assistplayers[ assistplayers.size ] = player;
        }
        
        if ( !assistplayers.size )
        {
            return;
        }
    }
    else
    {
        if ( !isplayer( sparams.eattacker ) )
        {
            return;
        }
        
        assistplayers[ assistplayers.size ] = sparams.eattacker;
    }
    
    killingplayer = sparams.eattacker;
    
    foreach ( player in assistplayers )
    {
        var_aed4d8ff7c73a952 = utility::callsharedfunc( #"ob_quest", #"get_active_quest", player );
        
        switch ( var_aed4d8ff7c73a952 )
        {
            case #"hash_123235699eeb8bb8":
                if ( killingplayer == player && weapon::iskillstreakweaponname( sparams.sweapon.basename ) )
                {
                    utility::callsharedfunc( #"ob_quest", #"hash_ac975ab816f57494", player, #"sat_wc_quest_act1_quest2_killstreak_kills" );
                }
                
                break;
            case #"hash_12323a699eeb9437":
                if ( self.type == "zombie" && !( player.region_difficulty == "difficulty_easy" || player.region_difficulty == "difficulty_normal" ) )
                {
                    if ( killingplayer == player && self._blackboard.var_d922503bad49d017 && gettime() - self._blackboard.var_d922503bad49d017 == 0 )
                    {
                        utility::callsharedfunc( #"ob_quest", #"hash_ac975ab816f57494", player, #"sat_wc_quest_act1_quest7_critical_kill_fears" );
                    }
                    
                    if ( ai_tier == 2 )
                    {
                        utility::callsharedfunc( #"ob_quest", #"hash_ac975ab816f57494", player, #"sat_wc_quest_act1_quest7_kill_fear_specials" );
                    }
                    else if ( ai_tier == 3 )
                    {
                        utility::callsharedfunc( #"ob_quest", #"hash_ac975ab816f57494", player, #"sat_wc_quest_act1_quest7_kill_fear_elite" );
                    }
                }
                
                break;
            case #"hash_12322f699eeb8186":
                if ( !( player.region_difficulty == "difficulty_easy" || player.region_difficulty == "difficulty_normal" || player.region_difficulty == "difficulty_hard" ) )
                {
                    if ( ai_tier == 3 )
                    {
                        utility::callsharedfunc( #"ob_quest", #"hash_ac975ab816f57494", player, #"sat_wc_quest_act1_quest8_kill_elites" );
                    }
                }
                
                break;
        }
    }
}

// Namespace ob_quests
// Params 1, eflags: 0x4
// Checksum 0x6c668095, Offset: 0xf95
// Size: 0xed
function private on_tacmap_ping_scriptable_or_ent( sparams )
{
    var_aed4d8ff7c73a952 = utility::callsharedfunc( #"ob_quest", #"get_active_quest", self );
    
    switch ( var_aed4d8ff7c73a952 )
    {
        case #"hash_123238699eeb90d1":
            if ( "REV_OB_MERC_CAMP" == sparams.target.activity_instance.type )
            {
                var_f80a400bf692eb93 = ob_challenges::function_be2516732994b5d6();
                var_e251ab0e6629fbf3 = 0;
                var_e251ab0e6629fbf3 = challenges::function_a23641f33e985edb( var_e251ab0e6629fbf3, var_f80a400bf692eb93[ #"direct_line_ping" ] );
                utility::callsharedfunc( #"challenges", #"hash_2310b572de8d15ac", self, var_e251ab0e6629fbf3 );
                utility::callsharedfunc( #"ob_quest", #"hash_ac975ab816f57494", self, #"sat_wc_quest_act1_quest1_locate_checkpoint" );
            }
            
            break;
        default:
            break;
    }
}

// Namespace ob_quests
// Params 1, eflags: 0x4
// Checksum 0x49e6105e, Offset: 0x108a
// Size: 0x1f7
function private function_809beca7ddc8cb8a( sparams )
{
    var_aed4d8ff7c73a952 = utility::callsharedfunc( #"ob_quest", #"get_active_quest", sparams.player );
    
    switch ( var_aed4d8ff7c73a952 )
    {
        case #"hash_12323b699eeb95ea":
            if ( sparams.interactionevent && sparams.interactionevent == #"hash_51e40c907cc5dbce" )
            {
                utility::callsharedfunc( #"ob_quest", #"hash_ac975ab816f57494", sparams.player, #"sat_wc_quest_act1_quest4_jailbreak_weapon" );
            }
            
            break;
        case #"hash_12323c699eeb979d":
            if ( sparams.interactionevent && sparams.interactionevent == #"hash_3a14200176a3c4aa" && sparams.player.region_difficulty != "difficulty_easy" )
            {
                utility::callsharedfunc( #"ob_quest", #"hash_ac975ab816f57494", sparams.player, #"sat_wc_quest_act1_quest5_redeploy_drone" );
            }
            
            break;
        case #"hash_12322f699eeb8186":
            if ( sparams.interactionevent && sparams.interactionevent == #"on_obtain_elite_weapon" && !( sparams.player.region_difficulty == "difficulty_easy" || sparams.player.region_difficulty == "difficulty_normal" || sparams.player.region_difficulty == "difficulty_hard" ) )
            {
                utility::callsharedfunc( #"ob_quest", #"hash_ac975ab816f57494", sparams.player, #"sat_wc_quest_act1_quest8_obtain_elite_weapon" );
            }
            
            break;
        default:
            break;
    }
}

// Namespace ob_quests
// Params 1, eflags: 0x4
// Checksum 0x3d74fcc, Offset: 0x1289
// Size: 0x101
function private function_34da42d1c47d3917( sparams )
{
    assert( isplayer( self ) );
    player = self;
    var_aed4d8ff7c73a952 = utility::callsharedfunc( #"ob_quest", #"get_active_quest", player );
    
    switch ( var_aed4d8ff7c73a952 )
    {
        case #"hash_123238699eeb90d1":
            if ( isstring( sparams.item.type ) && issubstr( sparams.item.type, "killstreak" ) || isweapon( sparams.item.weaponobj ) && weapon::iskillstreakweapon( sparams.item.weaponobj ) )
            {
                utility::callsharedfunc( #"ob_quest", #"hash_ac975ab816f57494", player, #"sat_wc_quest_act1_quest1_collect_killstreak" );
            }
            
            break;
    }
}

// Namespace ob_quests
// Params 1, eflags: 0x4
// Checksum 0x4d1c62d8, Offset: 0x1392
// Size: 0x102
function private function_9d441c0357f35500( sparams )
{
    var_aed4d8ff7c73a952 = utility::callsharedfunc( #"ob_quest", #"get_active_quest", sparams.player );
    
    switch ( var_aed4d8ff7c73a952 )
    {
        case #"hash_123230699eeb8339":
            info = ob_challenges::function_414273e1142aa748( sparams );
            
            if ( info.rarity == 6 )
            {
                utility::callsharedfunc( #"ob_quest", #"hash_ac975ab816f57494", sparams.player, #"sat_wc_quest_act1_quest9_exotic_skill" );
            }
            
            break;
        case #"hash_d6e6bc790a472e53":
            info = ob_challenges::function_414273e1142aa748( sparams );
            
            if ( info.skillcategory == #"nightmare" )
            {
                utility::callsharedfunc( #"ob_quest", #"hash_ac975ab816f57494", sparams.player, #"sat_wc_quest_act1_quest10_nm_skill" );
            }
            
            break;
    }
}

// Namespace ob_quests
// Params 2, eflags: 0x4
// Checksum 0xfa478c2f, Offset: 0x149c
// Size: 0x113
function private nm_complete( sparams, missionbit )
{
    players = sparams.players;
    
    if ( !players || players.size == 0 )
    {
        return;
    }
    
    foreach ( player in players )
    {
        var_aed4d8ff7c73a952 = utility::callsharedfunc( #"ob_quest", #"get_active_quest", player );
        
        switch ( var_aed4d8ff7c73a952 )
        {
            case #"hash_d6e6bc790a472e53":
                if ( missionbit == #"aries_nm_complete" )
                {
                    utility::callsharedfunc( #"ob_quest", #"hash_ac975ab816f57494", player, #"sat_wc_quest_act1_quest10_glitch_boss" );
                }
                
                break;
        }
    }
}

// Namespace ob_quests
// Params 1
// Checksum 0x34e90649, Offset: 0x15b7
// Size: 0x17
function function_cd016242b32f0cbb( var_407c65c25802195b )
{
    self.var_407c65c25802195b = var_407c65c25802195b;
}

