#using script_15ce43f40ea0fd2b;
#using script_16ea1b94f0f381b3;
#using script_3d65c29bb3088049;
#using script_6c2f6a14fa53759e;
#using script_6dfd03280678b65d;
#using scripts\common\callbacks;
#using scripts\common\devgui;
#using scripts\common\scene;
#using scripts\common\system;
#using scripts\common\throttle;
#using scripts\common\utility;
#using scripts\mp\armor;
#using scripts\mp\supers;

#namespace field_upgrades_frenzied_guard;

// Namespace field_upgrades_frenzied_guard
// Params 0, eflags: 0x5
// Checksum 0x7a2ad533, Offset: 0x3ad
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"frenzied_guard", undefined, undefined, &init );
}

// Namespace field_upgrades_frenzied_guard
// Params 0
// Checksum 0xc03447e8, Offset: 0x3ce
// Size: 0x1a9
function init()
{
    superbundle = field_upgrades::function_1fcc83f10e7752e5( "super_frenzied_guard" );
    
    if ( !isdefined( superbundle ) )
    {
        return;
    }
    
    supers_mp::function_cd1719a14d935a1c();
    var_41bf192ada44559a = field_upgrades::function_5f728868b18ef0c0( "super_frenzied_guard", #"hash_8adcece6f9625090" );
    var_d881ff74de58de57 = field_upgrades::function_5f728868b18ef0c0( "super_frenzied_guard", #"hash_4a48365785177b20" );
    var_9d9c7b953ee02aac = field_upgrades::function_5f728868b18ef0c0( "super_frenzied_guard", #"hash_44303def58ce1a91" );
    level._effect[ "frenzied_guard_1p_effect" ] = loadfxasset( var_41bf192ada44559a ?? "" );
    level._effect[ "frenzied_guard_3p_head_effect" ] = loadfxasset( var_d881ff74de58de57 ?? "" );
    level._effect[ "frenzied_guard_3p_torso_effect" ] = loadfxasset( var_9d9c7b953ee02aac ?? "" );
    utility::flag_wait( "supers_initialized" );
    supers_mp::function_48aaa60b2ce7b8a1( "super_frenzied_guard", &set_frenzied_guard, &unset_frenzied_guard, &begin_use_frenzied_guard, &function_684e6d5d7ad586e9, undefined, &set_frenzied_guard );
    level.super_frenzied_guard_throttle = throttle::throttle_initialize( "super_frenzied_guard", 2 );
    scene::function_85b13b837056bc8b( &function_7536a6014f720a67 );
    level callback::add( #"on_ai_killed", &on_ai_killed );
    level callback::add( #"on_ai_killed_medal", &on_killed_medal );
    callback::add( #"player_laststand", &on_last_stand_enter );
    
    /#
        devgui::function_9082edeb5db93280( "<dev string:x24>" );
        devgui::add_devgui_command( "<dev string:x3a>", "<dev string:x4e>" );
        devgui::add_devgui_command( "<dev string:x7e>", "<dev string:x95>" );
        devgui::function_77df7fe7dd273e10();
    #/
}

// Namespace field_upgrades_frenzied_guard
// Params 0
// Checksum 0x373c5a32, Offset: 0x57f
// Size: 0xaa
function set_frenzied_guard()
{
    if ( utility::callsharedfunc( #"zombie", #"hash_5b5c73998683a47", #"frenzied_guard_extension" ) )
    {
        base_duration = field_upgrades::function_5f728868b18ef0c0( "super_frenzied_guard", #"hash_66e98430fa91d10e" );
        
        if ( !isdefined( base_duration ) )
        {
            base_duration = 10;
        }
        
        self.var_87e9b1896b9a4e5f = base_duration;
        extend_amount = base_duration + base_duration * ( level.zombie_augments[ #"frenzied_guard_extension" ].var_2fde0f43ecda18e8 ?? 0 );
        self.super.staticdata.usetime = extend_amount;
    }
}

// Namespace field_upgrades_frenzied_guard
// Params 0
// Checksum 0xb4606dca, Offset: 0x631
// Size: 0x36
function unset_frenzied_guard()
{
    if ( isdefined( self.var_87e9b1896b9a4e5f ) )
    {
        self.super.staticdata.usetime = self.var_87e9b1896b9a4e5f;
    }
}

// Namespace field_upgrades_frenzied_guard
// Params 0
// Checksum 0xb63c0fb4, Offset: 0x66f
// Size: 0x8b
function function_7536a6014f720a67()
{
    foreach ( player in level.players )
    {
        if ( player utility::ent_flag( "frenzied_guard_active" ) )
        {
            player function_684e6d5d7ad586e9();
        }
    }
}

// Namespace field_upgrades_frenzied_guard
// Params 1
// Checksum 0x5ab0b044, Offset: 0x702
// Size: 0x21c
function on_ai_killed( params )
{
    if ( isplayer( params.eattacker ) && params.eattacker utility::ent_flag( "frenzied_guard_active" ) && !self.var_6b1845284e358d3e )
    {
        var_677f86e65485413b = 0;
        
        if ( params.eattacker utility::callsharedfunc( #"zombie", #"hash_5b5c73998683a47", #"frenzied_guard_repair_boost" ) )
        {
            var_677f86e65485413b = level.zombie_augments[ #"frenzied_guard_repair_boost" ].var_5ce853e88a85abcb;
        }
        
        var_72c3637a156b5679 = level.field_upgrade_bundles[ "super_frenzied_guard" ].var_72c3637a156b5679 ?? 0.25;
        var_61784cb9ef8a2c8d = level.field_upgrade_bundles[ "super_frenzied_guard" ].var_61784cb9ef8a2c8d ?? 50;
        repairamount = var_61784cb9ef8a2c8d * var_72c3637a156b5679;
        repairamount += repairamount * var_677f86e65485413b;
        params.eattacker armor::setarmorhealth( params.eattacker.armorhealth + repairamount );
    }
    
    if ( isplayer( params.eattacker ) && params.eattacker utility::ent_flag( "frenzied_guard_active" ) )
    {
        player = params.eattacker;
        
        if ( !isdefined( player.var_d08222fec6fc45a7 ) )
        {
            player.var_d08222fec6fc45a7 = 0;
        }
        
        if ( player utility::callsharedfunc( #"zombie", #"hash_5b5c73998683a47", #"frenzied_guard_fists_of_frenzy" ) && player.var_fb567d2e89888013 && player.var_d08222fec6fc45a7 < 20 )
        {
            player.var_d08222fec6fc45a7++;
            extend_amount = level.zombie_augments[ #"frenzied_guard_fists_of_frenzy" ].var_33cc8a1311e1ad67 ?? 0.1;
            player supers_mp::function_9f116b8da4a01a94( extend_amount );
        }
    }
}

// Namespace field_upgrades_frenzied_guard
// Params 0
// Checksum 0xc505995e, Offset: 0x926
// Size: 0x1e4
function begin_use_frenzied_guard()
{
    if ( isdefined( level.field_upgrade_bundles[ "super_frenzied_guard" ] ) )
    {
        var_32eccaa35fc708ea = level.field_upgrade_bundles[ "super_frenzied_guard" ].offhandweapon;
        deploysuccess = field_upgrades::field_upgrade_play_gesture( var_32eccaa35fc708ea, "super_frenzied_guard" );
        
        if ( deploysuccess )
        {
            if ( self.group_frenzied_guard_active )
            {
                if ( isplayer( self.parentfrenzy ) && isarray( self.parentfrenzy.var_77cb3def72f91ae8 ) )
                {
                    self.parentfrenzy.var_77cb3def72f91ae8 = arrayremove( self.parentfrenzy.var_77cb3def72f91ae8, self );
                }
                
                self.group_frenzied_guard_active = undefined;
            }
            
            currentweapon = self getcurrentweapon();
            
            if ( !currentweapon.isdualwield )
            {
                self setscriptablepartstate( "wand_fx", "wand_on_frenzied_guard", 0 );
            }
            
            base_duration = field_upgrades::function_5f728868b18ef0c0( "super_frenzied_guard", #"hash_66e98430fa91d10e" );
            
            if ( !isdefined( base_duration ) )
            {
                base_duration = 10;
            }
            
            if ( utility::callsharedfunc( #"zombie", #"hash_5b5c73998683a47", #"frenzied_guard_extension" ) )
            {
                extend_amount = self.super.staticdata.usetime * ( level.zombie_augments[ #"frenzied_guard_extension" ].var_2fde0f43ecda18e8 ?? 0 );
                base_duration += extend_amount;
            }
            
            self.solo_frenzied_guard_active = 1;
            callback::callback( "on_frenzied_guard_start" );
            
            if ( utility::callsharedfunc( #"zombie", #"hash_5b5c73998683a47", #"frenzied_guard_fists_of_frenzy" ) )
            {
                self.var_d08222fec6fc45a7 = 0;
            }
            
            thread frenzied_guard_active( base_duration );
            thread function_b99afac65fae6e5();
            return 1;
        }
    }
}

// Namespace field_upgrades_frenzied_guard
// Params 2
// Checksum 0xd756341, Offset: 0xb12
// Size: 0xe0, Type: bool
function function_684e6d5d7ad586e9( fromdeath, attacker )
{
    self notify( #"end_frenzied_guard" );
    utility::ent_flag_clear( "field_upgrade_in_use" );
    utility::ent_flag_clear( "frenzied_guard_active" );
    self.solo_frenzied_guard_active = undefined;
    callback::remove( #"player_damaged", &player_damaged_tracker );
    self.frenzied_guard_damage_taken = undefined;
    callback::callback( "field_upgrade_ended", { #ref:"super_frenzied_guard" } );
    callback::callback( "on_frenzied_guard_end" );
    
    if ( self.var_ca807c916c8cc459 && utility::issharedfuncdefined( #"sound", #"play_scoreevent_vo", 0 ) )
    {
        utility::callsharedfunc( #"sound", #"play_scoreevent_vo", self, #"bc_super_frenzied_guard_success" );
    }
    
    self.var_ca807c916c8cc459 = undefined;
    return false;
}

// Namespace field_upgrades_frenzied_guard
// Params 1
// Checksum 0x8dfca027, Offset: 0xbfb
// Size: 0x146
function frenzied_guard_active( n_duration )
{
    self endon( #"disconnect" );
    utility::ent_flag_init( "field_upgrade_in_use" );
    utility::ent_flag_set( "field_upgrade_in_use" );
    utility::ent_flag_init( "frenzied_guard_active" );
    utility::ent_flag_set( "frenzied_guard_active" );
    self.frenzied_zombies = [];
    self setentitysoundcontext( "zm_plr_impact_armored", "on" );
    thread apply_effects( n_duration );
    playernum = self getentitynumber();
    var_3d065c4e99e3d90f = "frenzied_guard_player_" + playernum;
    
    if ( !callback::exists( #"player_damaged", &player_damaged_tracker ) )
    {
        callback::add( #"player_damaged", &player_damaged_tracker );
    }
    
    thread function_ac9aeebaab42d377( n_duration, var_3d065c4e99e3d90f );
    s_waitresult = utility::waittill_any_timeout( 100, "last_stand_enter", "death", "end_frenzied_guard" );
    callback::callback( "end_group_frenzy" );
    self notify( #"end_frenzied_guard" );
    function_ba8f465d9a94f6a4( var_3d065c4e99e3d90f );
    thread remove_effects();
    self setentitysoundcontext( "zm_frenzied_guard", "" );
    self setentitysoundcontext( "zm_plr_impact_armored", "" );
    utility::ent_flag_clear( "field_upgrade_in_use" );
    utility::ent_flag_clear( "frenzied_guard_active" );
}

// Namespace field_upgrades_frenzied_guard
// Params 1, eflags: 0x4
// Checksum 0x84b44cac, Offset: 0xd49
// Size: 0x7b
function private player_damaged_tracker( params )
{
    if ( !isdefined( self.frenzied_guard_damage_taken ) )
    {
        self.frenzied_guard_damage_taken = 0;
    }
    
    self.frenzied_guard_damage_taken += params.idamage + params.lightarmordamage;
    
    if ( self.frenzied_guard_damage_taken >= 100 )
    {
        self.var_ca807c916c8cc459 = 1;
        callback::remove( #"player_damaged", &player_damaged_tracker );
    }
}

// Namespace field_upgrades_frenzied_guard
// Params 0
// Checksum 0x416d3f26, Offset: 0xdcc
// Size: 0x12
function function_b99afac65fae6e5()
{
    armor::setarmorhealth( self.maxarmorhealth );
}

// Namespace field_upgrades_frenzied_guard
// Params 1
// Checksum 0x47af1d0c, Offset: 0xde6
// Size: 0x193
function function_ba8f465d9a94f6a4( var_3d065c4e99e3d90f )
{
    foreach ( zombie in self.frenzied_zombies )
    {
        if ( isalive( zombie ) )
        {
            zombie zombie_utils::set_ai_target_priority( undefined, var_3d065c4e99e3d90f, 0 );
            
            if ( zombie isscriptable() && zombie getscriptablehaspart( "frenzied_guard" ) )
            {
                zombie setscriptablepartstate( "frenzied_guard", "frenzied_guard_off", 1 );
            }
            
            if ( !isdefined( zombie.frenzied_guard_attractors ) )
            {
                zombie.frenzied_guard_attractors = [];
            }
            
            foreach ( frenzied_guard_attractor in zombie.frenzied_guard_attractors )
            {
                if ( frenzied_guard_attractor.player == self )
                {
                    zombie zombie_attractor_manager::function_dcfb4c31f1d97cd2( frenzied_guard_attractor.attractor );
                }
                
                zombie.frenzied_guard_attractors = arrayremove( zombie.frenzied_guard_attractors, frenzied_guard_attractor );
            }
        }
    }
    
    self.frenzied_zombies = undefined;
}

// Namespace field_upgrades_frenzied_guard
// Params 2
// Checksum 0x46034eb4, Offset: 0xf81
// Size: 0x5e2
function function_ac9aeebaab42d377( n_duration, var_3d065c4e99e3d90f )
{
    self endon( #"death" );
    self endon( #"last_stand_enter" );
    self endon( #"end_frenzied_guard" );
    starttime = gettime();
    time = gettime();
    pull_radius = field_upgrades::function_5f728868b18ef0c0( "super_frenzied_guard", #"hash_ff3573675daf9e80" );
    
    if ( !isdefined( pull_radius ) )
    {
        pull_radius = 1000;
    }
    
    while ( time - starttime < n_duration * 1000 )
    {
        foreach ( zombie in self.frenzied_zombies )
        {
            if ( zombie.b_ignore_frenzied_guard )
            {
                continue;
            }
            
            if ( isalive( zombie ) && distance2d( self.origin, zombie.origin ) > pull_radius )
            {
                zombie zombie_utils::set_ai_target_priority( undefined, var_3d065c4e99e3d90f, 0 );
                
                if ( zombie isscriptable() && zombie getscriptablehaspart( "frenzied_guard" ) )
                {
                    zombie setscriptablepartstate( "frenzied_guard", "frenzied_guard_off", 1 );
                }
                
                if ( !isdefined( zombie.frenzied_guard_attractors ) )
                {
                    zombie.frenzied_guard_attractors = [];
                }
                
                foreach ( frenzied_guard_attractor in zombie.frenzied_guard_attractors )
                {
                    if ( frenzied_guard_attractor.player == self )
                    {
                        zombie zombie_attractor_manager::function_dcfb4c31f1d97cd2( frenzied_guard_attractor.attractor );
                    }
                    
                    zombie.frenzied_guard_attractors = arrayremove( zombie.frenzied_guard_attractors, frenzied_guard_attractor );
                }
                
                self.frenzied_zombies = arrayremove( self.frenzied_zombies, zombie );
            }
        }
        
        closezombies = getaiarrayinradius( self.origin, pull_radius );
        
        if ( utility::issharedfuncdefined( #"zm", #"hash_275603844e04e7ac" ) )
        {
            closezombies = level [[ utility::getsharedfunc( #"zm", #"hash_275603844e04e7ac" ) ]]( closezombies, self );
        }
        
        frenzied_zombies_number = self.frenzied_zombies.size;
        
        foreach ( zombie in closezombies )
        {
            if ( zombie.b_ignore_frenzied_guard )
            {
                continue;
            }
            
            if ( isalive( zombie ) && zombie.type == "zombie" && zombie.team != self.team )
            {
                if ( !isdefined( zombie.enemy ) && utility::flag( "level_stealth_initialized" ) )
                {
                    zombie aieventlistenerevent( "combat", self, self.origin );
                }
                
                self.frenzied_zombies = arraycombineunique( self.frenzied_zombies, [ zombie ] );
                playernum = self getentitynumber();
                priority = 9999 + playernum;
                
                if ( !zombie zombie_utils::function_acea107db537cb0f( self, priority ) )
                {
                    zombie zombie_utils::set_ai_target_priority( self, var_3d065c4e99e3d90f, priority );
                }
                
                if ( zombie isscriptable() && zombie getscriptablehaspart( "frenzied_guard" ) )
                {
                    if ( zombie zombie_base_dismemberment::is_crawling() && zombie getscriptableparthasstate( "frenzied_guard", "frenzied_guard_crawler_on" ) )
                    {
                        zombie setscriptablepartstate( "frenzied_guard", "frenzied_guard_crawler_on", 1 );
                    }
                    else
                    {
                        zombie setscriptablepartstate( "frenzied_guard", "frenzied_guard_on", 1 );
                    }
                }
                
                if ( !isdefined( zombie.frenzied_guard_attractors ) )
                {
                    zombie.frenzied_guard_attractors = [];
                }
                
                var_b7924ca2025f3765 = 0;
                
                foreach ( frenzied_guard_attractor in zombie.frenzied_guard_attractors )
                {
                    if ( frenzied_guard_attractor.player == self )
                    {
                        var_b7924ca2025f3765 = 1;
                        break;
                    }
                }
                
                if ( !var_b7924ca2025f3765 )
                {
                    frenzied_guard_attractor = zombie zombie_attractor_manager::function_7eb1aaa8bc7cc15( self, 9999, pull_radius, 1, undefined, &function_8d0aea4c5ef4b19d, 1 );
                    frenzied_guard_attractor.var_9bc09bc79f28a18e = 1;
                    frenzied_guard_info = spawnstruct();
                    frenzied_guard_info.attractor = frenzied_guard_attractor;
                    frenzied_guard_info.player = self;
                    zombie.frenzied_guard_attractors[ zombie.frenzied_guard_attractors.size ] = frenzied_guard_info;
                }
            }
        }
        
        if ( self.frenzied_zombies.size > frenzied_zombies_number )
        {
            count = self.frenzied_zombies.size - frenzied_zombies_number;
            callback::callback( "field_upgrade_stats_track", { #count:count, #stats:"taunts", #ref:"super_frenzied_guard", #player:self } );
        }
        
        throttle::throttle_wait_in_queue( level.super_frenzied_guard_throttle, self );
        time = gettime();
    }
}

// Namespace field_upgrades_frenzied_guard
// Params 2, eflags: 0x4
// Checksum 0xdc606628, Offset: 0x156b
// Size: 0x21, Type: bool
function private function_8d0aea4c5ef4b19d( attractor, ai )
{
    return !ai.var_840153567385cc6b;
}

// Namespace field_upgrades_frenzied_guard
// Params 1
// Checksum 0x1963fa5f, Offset: 0x1595
// Size: 0x5c
function apply_effects( n_duration )
{
    thread frenzied_guard_fov_change( n_duration );
    postfxbundle = level.field_upgrade_bundles[ "super_frenzied_guard" ].var_6a566dda6f666c3b;
    pbgpostfxbundlestart( self, postfxbundle );
    waitframe();
    
    if ( isalive( self ) )
    {
        self setscriptablepartstate( "frenzied_guard_fx", "super_fx_on", 0 );
    }
}

// Namespace field_upgrades_frenzied_guard
// Params 1
// Checksum 0x5077a516, Offset: 0x15f9
// Size: 0x64
function frenzied_guard_fov_change( n_duration )
{
    self endon( #"death_or_disconnect" );
    self notify( #"applyfovpresentation" );
    self endon( #"applyfovpresentation" );
    self lerpfovbypreset( "zombiedefault" );
    utility::waittill_any_timeout_no_endon_death( n_duration, "super_use_finished", "end_frenzied_guard" );
    self lerpfovbypreset( "default_2seconds" );
    self playlocalsound( "deadsilence_end" );
}

// Namespace field_upgrades_frenzied_guard
// Params 0
// Checksum 0x2222080d, Offset: 0x1665
// Size: 0x40
function remove_effects()
{
    postfxbundle = level.field_upgrade_bundles[ "super_frenzied_guard" ].var_6a566dda6f666c3b;
    pbgpostfxbundleend( self, postfxbundle );
    self setscriptablepartstate( "frenzied_guard_fx", "super_fx_deactivate", 0 );
}

// Namespace field_upgrades_frenzied_guard
// Params 1, eflags: 0x4
// Checksum 0x76aeb45f, Offset: 0x16ad
// Size: 0x1ef
function private on_killed_medal( params )
{
    player = params.attacker;
    
    if ( isdefined( params.victim.frenzied_guard_attractors ) )
    {
        foreach ( info in params.victim.frenzied_guard_attractors )
        {
            if ( player === info.player )
            {
                if ( utility::issharedfuncdefined( #"medal", #"track_rapid_kill", 0 ) )
                {
                    player utility::callsharedfunc( #"medal", #"track_rapid_kill", "frenzied_guard" );
                }
                
                if ( isdefined( player.rapidkill_data[ "frenzied_guard" ] ) && player.rapidkill_data[ "frenzied_guard" ].rapidkill_count == 10 )
                {
                    player namespace_9d8e359c3b1041e5::doscoreeventsharedfunc( #"medal_maintank" );
                    
                    if ( utility::issharedfuncdefined( #"challenges", #"hash_4dbee06d8fb19056" ) )
                    {
                        player utility::callsharedfunc( #"challenges", #"hash_4dbee06d8fb19056", #"medal_maintank" );
                    }
                }
                
                param = { #stats:"kills_while_active", #ref:"super_frenzied_guard", #field_upgrade:"frenzied_guard", #victim:params.victim, #player:player };
                player callback::callback( "on_field_upgrade_kill_track", param );
            }
        }
    }
}

// Namespace field_upgrades_frenzied_guard
// Params 1, eflags: 0x4
// Checksum 0x5d50b00a, Offset: 0x18a4
// Size: 0x13
function private on_last_stand_enter( sparams )
{
    function_684e6d5d7ad586e9();
}

