#using script_16ea1b94f0f381b3;
#using script_5560f3066718e34c;
#using script_6802bb17a0c535f3;
#using scripts\common\callbacks;
#using scripts\common\utility;

#namespace deadliest_weapon_ai;

// Namespace deadliest_weapon_ai
// Params 0, eflags: 0x1
// Checksum 0xb1fd91b1, Offset: 0xf4
// Size: 0x35
function autoexec register_init()
{
    aar_tracking::function_e32d863f90d794a1( #"deadliest_weapon_ai", &init_deadliest_tracking );
    utility::registersharedfunc( #"deadliest_weapon_ai", #"add_deadliest_weapon", &add_deadliest_weapon );
}

// Namespace deadliest_weapon_ai
// Params 1, eflags: 0x4
// Checksum 0x18a66e01, Offset: 0x131
// Size: 0x56
function private init_deadliest_tracking( aar_tracking_ref )
{
    if ( level.gametypebundle.var_b8748c0cba9a9623 == #"versus_ai" )
    {
        callback::add( #"on_ai_killed", &function_8c5e06ee1e60aeb7 );
        callback::add( #"game_ended", &on_game_ended );
    }
}

// Namespace deadliest_weapon_ai
// Params 2, eflags: 0x4
// Checksum 0x7b35731d, Offset: 0x18f
// Size: 0x42
function private add_deadliest_weapon( var_eadb663a1292c9e8, can_track = 1 )
{
    if ( !isdefined( level.var_a4dd5273b76df16d ) )
    {
        level.var_a4dd5273b76df16d = [];
    }
    
    level.var_a4dd5273b76df16d[ var_eadb663a1292c9e8 ] = can_track;
}

// Namespace deadliest_weapon_ai
// Params 1, eflags: 0x4
// Checksum 0xfa47f771, Offset: 0x1d9
// Size: 0x4f
function private function_8c5e06ee1e60aeb7( params )
{
    if ( isplayer( params.eattacker ) )
    {
        params.eattacker track_elimination( params.sweapon, istrue( self.last_dmg_struct.biscritical ) );
    }
}

// Namespace deadliest_weapon_ai
// Params 1, eflags: 0x4
// Checksum 0x4a07bec7, Offset: 0x230
// Size: 0xf3
function private function_43fef757978b336b( weaponobj )
{
    if ( !isdefined( weaponobj ) )
    {
        return 0;
    }
    
    if ( weaponobj.basenamehash && isdefined( level.var_a4dd5273b76df16d[ weaponobj.basenamehash ] ) )
    {
        return level.var_a4dd5273b76df16d[ weaponobj.basenamehash ];
    }
    
    iskillstreakweaponfunc = level.sharedfuncs[ #"killstreak" ][ #"iskillstreakweapon" ];
    
    if ( isdefined( iskillstreakweaponfunc ) && self [[ iskillstreakweaponfunc ]]( weaponobj.basename ) )
    {
        return 0;
    }
    
    isbulletweaponfunc = level.sharedfuncs[ #"weapons" ][ #"isbulletweapon" ];
    
    if ( isdefined( isbulletweaponfunc ) && self [[ isbulletweaponfunc ]]( weaponobj ) )
    {
        return 1;
    }
    
    if ( weapon_utility::function_186e07887b6bbeb1( weaponobj ) )
    {
        return 1;
    }
    
    if ( weaponobj.ismelee )
    {
        return 1;
    }
    
    return 0;
}

// Namespace deadliest_weapon_ai
// Params 2, eflags: 0x4
// Checksum 0x9e730e1e, Offset: 0x32c
// Size: 0x1bd
function private track_elimination( weaponobj, iscritical )
{
    var_68c0794db78b3724 = self.pers[ #"deadliest_weapon_tracking" ];
    
    if ( !isdefined( var_68c0794db78b3724 ) )
    {
        self.pers[ #"deadliest_weapon_tracking" ] = spawnstruct();
        var_68c0794db78b3724 = self.pers[ #"deadliest_weapon_tracking" ];
    }
    
    if ( !isdefined( var_68c0794db78b3724.weaponstats ) )
    {
        var_68c0794db78b3724.weaponstats = [];
    }
    
    if ( function_43fef757978b336b( weaponobj ) )
    {
        attacker_weapon_stats = var_68c0794db78b3724.weaponstats[ weaponobj.basename ];
        
        if ( !isdefined( attacker_weapon_stats ) )
        {
            var_68c0794db78b3724.weaponstats[ weaponobj.basename ] = { #blueprintid:getweaponvariantindex( weaponobj ), #rarity:0, #paplvl:0, #elimspap:0, #criticals:0, #elims:1 };
            attacker_weapon_stats = var_68c0794db78b3724.weaponstats[ weaponobj.basename ];
        }
        else
        {
            attacker_weapon_stats.elims++;
        }
        
        n_pap_level = namespace_9d8e359c3b1041e5::function_1d4087075103b248( weaponobj );
        
        if ( n_pap_level )
        {
            attacker_weapon_stats.elimspap++;
            
            if ( n_pap_level > attacker_weapon_stats.paplvl )
            {
                attacker_weapon_stats.paplvl = n_pap_level;
            }
        }
        
        if ( iscritical )
        {
            attacker_weapon_stats.criticals++;
        }
        
        rarity = namespace_9d8e359c3b1041e5::getplayerweaponraritysharedfunc( weaponobj );
        
        if ( rarity > attacker_weapon_stats.rarity )
        {
            attacker_weapon_stats.rarity = rarity;
        }
    }
}

// Namespace deadliest_weapon_ai
// Params 2
// Checksum 0x63b4e6e5, Offset: 0x4f1
// Size: 0x266
function function_c588b98a77b1e36a( player, progressiongroup )
{
    if ( !isdefined( player ) )
    {
        return;
    }
    
    deadliest_weapon = "none";
    var_2b3dc51ef312a65e = 0;
    deadliest_weapon_elims = 0;
    var_70a41f09fefc93 = 0;
    var_33dd1720a5eb54bb = 0;
    var_992769da1fcb6f42 = player.pers[ #"deadliest_weapon_tracking" ].weaponstats;
    
    if ( isdefined( var_992769da1fcb6f42 ) )
    {
        foreach ( weaponname, weaponstats in var_992769da1fcb6f42 )
        {
            if ( !( isdefined( weaponstats.elims ) && isdefined( weaponstats.criticals ) ) )
            {
                continue;
            }
            
            if ( !isdefined( deadliest_weapon ) || weaponstats.elims > deadliest_weapon_elims || weaponstats.elims == deadliest_weapon_elims && var_33dd1720a5eb54bb < weaponstats.criticals )
            {
                deadliest_weapon = weaponname;
                var_2b3dc51ef312a65e = weaponstats.paplvl ?? 0;
                deadliest_weapon_elims = weaponstats.elims ?? 0;
                var_70a41f09fefc93 = weaponstats.elimspap ?? 0;
                var_33dd1720a5eb54bb = weaponstats.criticals ?? 0;
                deadliest_weapon_blueprint_id = weaponstats.blueprintid ?? 0;
            }
        }
    }
    
    player setplayerdata( progressiongroup, "aarData", "deadliestWeaponData", "eliminations", deadliest_weapon_elims ?? 0 );
    player setplayerdata( progressiongroup, "aarData", "deadliestWeaponData", "eliminationsPAP", var_70a41f09fefc93 ?? 0 );
    player setplayerdata( progressiongroup, "aarData", "deadliestWeaponData", "criticalKills", var_33dd1720a5eb54bb ?? 0 );
    player setplayerdata( progressiongroup, "aarData", "deadliestWeaponData", "PAPlvl", var_2b3dc51ef312a65e ?? 0 );
    player setplayerdata( progressiongroup, "aarData", "deadliestWeaponData", "ref", getxhash( deadliest_weapon ?? "none" ) );
    player setplayerdata( progressiongroup, "aarData", "deadliestWeaponData", "blueprintID", deadliest_weapon_blueprint_id ?? 0 );
}

// Namespace deadliest_weapon_ai
// Params 1, eflags: 0x4
// Checksum 0xf7404ab6, Offset: 0x75f
// Size: 0x99
function private on_game_ended( params )
{
    progressiongroup = level.progressiongroup;
    
    foreach ( player in level.players )
    {
        function_c588b98a77b1e36a( player, progressiongroup );
    }
}

