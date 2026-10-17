#using script_2b51dca51198db31;
#using script_49e4a4c208f44b76;
#using script_5ad24b30e5045cbe;
#using script_6ed201c5af7d130e;
#using scripts\common\callbacks;
#using scripts\common\game_utility;
#using scripts\common\system;
#using scripts\common\utility;
#using scripts\common\vehicle;
#using scripts\common\vehicle_occupancy;
#using scripts\mp\armor;
#using scripts\mp\damagefeedback;
#using scripts\mp\mp_agent_damage;

#namespace mp_damage;

// Namespace mp_damage
// Params 0, eflags: 0x5
// Checksum 0x66f9ac2b, Offset: 0x166
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"mp_damage", undefined, undefined, &init );
}

// Namespace mp_damage
// Params 0, eflags: 0x4
// Checksum 0xecdbad7e, Offset: 0x187
// Size: 0x6a
function private init()
{
    level callback::add( "on_zombie_ai_spawned", &zombie_damage_on_spawned );
    level callback::add( "on_agent_spawned", &agent_damage_on_spawned );
    level callback::add( "on_zombie_ai_killed", &on_zombie_ai_killed );
    level callback::add( #"on_ai_killed", &function_9238338f068b6568 );
    callback::get_template( "zombie" ) callback::add( "on_zombie_ai_damaged", &on_zombie_ai_damaged );
}

// Namespace mp_damage
// Params 1, eflags: 0x4
// Checksum 0x49e20e88, Offset: 0x1f9
// Size: 0x76
function private agent_damage_on_spawned( params )
{
    agent = params.agent;
    
    if ( agent.unittype != "soldier" )
    {
        return;
    }
    
    agent.agent_damage_callback = &soldier_damage;
    agent.var_57700436ec65d38c = [];
    agent.var_d4b7ed447e2bf50c = [];
    agent callback::add( "on_soldier_ai_damaged", &on_soldier_ai_damaged );
}

// Namespace mp_damage
// Params 1, eflags: 0x4
// Checksum 0xb9a01ed6, Offset: 0x277
// Size: 0x1a
function private zombie_damage_on_spawned( params )
{
    self.agent_damage_callback = &function_ddf5f982ca376898;
}

// Namespace mp_damage
// Params 14
// Checksum 0x7209a091, Offset: 0x299
// Size: 0x6d0
function function_ddf5f982ca376898( einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, objweapon, poisedamage )
{
    dmg_struct = zombie_damage::build_damage_struct( einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, objweapon );
    
    if ( isdefined( self.last_dmg_struct ) )
    {
        dmg_struct.num_hits = self.last_dmg_struct.num_hits;
    }
    else
    {
        dmg_struct.num_hits = 0;
    }
    
    dmg_struct.num_hits++;
    
    if ( zombie_damage::should_skip_damage( eattacker, objweapon, smeansofdeath ) )
    {
        if ( isplayer( eattacker ) && self.team != eattacker.team )
        {
            eattacker damagefeedback::updatedamagefeedback( "standard", 0 );
        }
        
        return 0;
    }
    
    if ( self.var_7037157e68c4992b == dmg_struct.idamage )
    {
        dmg_struct.var_d33b5d20cf3b0e9b = 1;
        self.var_7037157e68c4992b = undefined;
    }
    
    dmg_struct.idamage = zombie_damage::function_cef159ba09a96f98( dmg_struct );
    dmg_struct.idamage = zombie_damage::function_b9821f08dcbdc9d0( dmg_struct );
    dmg_struct.idamage = zombie_damage::function_881dfa87252ee0ea( dmg_struct );
    dmg_struct.idamage = zombie_damage::function_579261f41dfd0572( dmg_struct );
    dmg_struct.idamage = zombie_damage::function_e20f670a9518dbc0( dmg_struct );
    dmg_struct.idamage = zombie_damage::function_e06f2d26a28d8093( dmg_struct );
    dmg_struct.idamage = zombie_damage::function_2bf9dd60a4f921ca( dmg_struct );
    dmg_struct.idamage = zombie_damage::function_bccc7eb65bfbb479( dmg_struct );
    assert( dmg_struct.idamage > 0 && int( dmg_struct.idamage ) > 0 );
    dmg_struct.idamage = zombie_damage::function_23f0f83c55de1ad( dmg_struct );
    
    if ( isdefined( dmg_struct.eattacker ) && isplayer( dmg_struct.eattacker.owner ) )
    {
        dmg_struct.eattacker = dmg_struct.eattacker.owner;
    }
    
    if ( isexplosivedamagemod( smeansofdeath ) )
    {
        if ( utility::issharedfuncdefined( #"thermobaric_grenade", #"thermobaric_additional_explosive_damage" ) )
        {
            dmg_struct.idamage += [[ utility::getsharedfunc( #"thermobaric_grenade", #"thermobaric_additional_explosive_damage" ) ]]( self, eattacker, dmg_struct.idamage );
        }
    }
    
    zombie_damage::check_damaged_armor( dmg_struct );
    headshot = damage_utility::isheadshot( dmg_struct.shitloc, dmg_struct.smeansofdeath, dmg_struct.eattacker );
    
    if ( !headshot && isdefined( self.armorhealth ) && self.armorhealth > 0 && dmg_struct.smeansofdeath != "MOD_CRUSH" && ( !isdefined( self.var_f424a6135c1dd01f ) || !( isdefined( dmg_struct.einflictor ) && arraycontains( self.var_f424a6135c1dd01f, dmg_struct.einflictor ) ) ) )
    {
        initial_damage = dmg_struct.idamage;
        unmodifieddamage = dmg_struct.idamage;
        [ dmg_struct.idamage, lightarmordamage ] = armor::function_4875d04d69b22ae( dmg_struct.eattacker, dmg_struct.einflictor, self, dmg_struct.idamage, dmg_struct.objweapon, dmg_struct.smeansofdeath, dmg_struct.shitloc, dmg_struct.idflags, initial_damage, unmodifieddamage );
        
        if ( dmg_struct.idamage <= 0 && lightarmordamage > 0 )
        {
            dmg_struct.idamage = 1;
            self.health += 1;
        }
        
        if ( lightarmordamage > 0 )
        {
            dmg_struct.var_4f9d5587bf9a2b1e = 1;
        }
    }
    
    thread zombie_damage::check_armor_hitmarker( dmg_struct, "hitarmorlight" );
    zombie_damage::function_960f65c8626d199b( dmg_struct );
    zombie_damage::function_10e5fc0c6d63f99c( dmg_struct );
    zombie_damage::try_damage_metabone( dmg_struct );
    zombie_damage::function_1f965cbbc7f5d5e7( dmg_struct );
    zombie_damage::function_f02b21908b7bd90d( dmg_struct );
    
    if ( self.killondamage )
    {
        dmg_struct.idamage = self.health;
    }
    
    dmg_struct.bimmune = dmg_struct.idamage <= 0;
    
    if ( isdefined( eattacker ) && ( isplayer( eattacker ) || isplayer( eattacker.owner ) ) )
    {
        eplayer = eattacker;
        var_b67d4fdd1ab59745 = undefined;
        elementfeedback = undefined;
        
        if ( isplayer( eattacker.owner ) )
        {
            eplayer = eattacker.owner;
        }
        
        if ( level.gamemodebundle.var_7e288d244d3717ca || getdvarint( @"hash_1661f35e34f544eb", 0 ) )
        {
            mp_agent_damage::function_eb8ba16055d6da7c( eplayer, self, shitloc, smeansofdeath, objweapon, int( dmg_struct.idamage ), vpoint, dmg_struct.bimmune, undefined, dmg_struct.biscritical, dmg_struct.var_4f9d5587bf9a2b1e );
        }
        
        if ( isplayer( eattacker ) && dmg_struct.idamage > 0 && shitloc != "shield" && !isdefined( elementfeedback ) )
        {
            eattacker damagefeedback::updatedamagefeedback( "standard", dmg_struct.idamage >= self.health, dmg_struct.biscritical );
        }
    }
    
    self.last_dmg_struct = dmg_struct;
    callback::callback( "on_zombie_ai_damaged", dmg_struct );
    
    if ( isdefined( eattacker ) && isdefined( eattacker.is_quest_ai ) )
    {
        n_multiplier = 200;
        
        if ( isdefined( dmg_struct ) && isdefined( dmg_struct.idamage ) )
        {
            dmg_struct.idamage *= n_multiplier;
        }
    }
    
    idamagenew = int( dmg_struct.idamage );
    
    if ( !isdefined( idamagenew ) || idamagenew < 0 )
    {
        assert( 0 );
        idamagenew = 0;
    }
    
    return idamagenew;
}

// Namespace mp_damage
// Params 1, eflags: 0x4
// Checksum 0xc8175b25, Offset: 0x972
// Size: 0xf1
function private on_zombie_ai_damaged( dmg_struct )
{
    damage_utility::function_723dcec170ec23be( dmg_struct.eattacker );
    
    if ( isdefined( dmg_struct.einflictor ) && dmg_struct.einflictor vehicle::is_vehicle() && !dmg_struct.einflictor.var_1f9d76cca64c48f6 && dmg_struct.smeansofdeath == "MOD_CRUSH" )
    {
        vehicle = dmg_struct.einflictor;
        player = dmg_struct.eattacker;
        vehicle.b_collided = 1;
        
        if ( isdefined( dmg_struct.idamage ) && isdefined( self ) )
        {
            n_damage = int( dmg_struct.idamage * 0.1 );
            vehicle thread vehicle_collide( n_damage );
        }
    }
    
    thread zombie_damage::function_9238df0f5f57170a( dmg_struct );
}

// Namespace mp_damage
// Params 1
// Checksum 0x5da27c37, Offset: 0xa6b
// Size: 0xd8
function vehicle_collide( n_damage )
{
    self endon( #"death" );
    occupants = vehicle_occupancy::function_8ed9bcd8e9ea74f5( self, 0 );
    
    if ( isdefined( occupants ) )
    {
        foreach ( occupant in occupants )
        {
            if ( isplayer( occupant ) )
            {
                occupant playrumbleonpositionforclient( "artillery_rumble_heavy", self.origin );
            }
        }
    }
    
    self dodamage( n_damage, self.origin );
    wait 0.1;
    self.b_collided = undefined;
}

// Namespace mp_damage
// Params 3, eflags: 0x4
// Checksum 0xf56027ef, Offset: 0xb4b
// Size: 0x4e
function private function_fd5f6e73cbb5e11( dmg_struct, shitloc, n_pap_level )
{
    if ( shitloc == "head" || shitloc == "neck" )
    {
        dmg_struct.biscritical = 1;
    }
    
    return dmg_struct.idamage;
}

// Namespace mp_damage
// Params 14
// Checksum 0x925f0b5, Offset: 0xba2
// Size: 0x51e
function soldier_damage( einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, objweapon, poisedamage )
{
    if ( game_utility::getgametype() == "gwtdm" )
    {
        attackerishittingteammate = damage::attackerishittingteam( self, eattacker );
        
        if ( attackerishittingteammate )
        {
            return 0;
        }
    }
    
    if ( self.var_a6ecefe6814132d4 )
    {
        return 0;
    }
    
    dmg_struct = spawnstruct();
    dmg_struct.einflictor = einflictor;
    dmg_struct.eattacker = eattacker;
    dmg_struct.idamage = idamage;
    dmg_struct.idflags = idflags;
    dmg_struct.smeansofdeath = smeansofdeath;
    dmg_struct.sweapon = sweapon;
    dmg_struct.vpoint = vpoint;
    dmg_struct.vdir = vdir;
    dmg_struct.shitloc = shitloc;
    dmg_struct.timeoffset = timeoffset;
    dmg_struct.modelindex = modelindex;
    dmg_struct.partname = partname;
    dmg_struct.objweapon = objweapon;
    dmg_struct.biscritical = 0;
    dmg_struct.var_4f9d5587bf9a2b1e = 0;
    
    if ( isdefined( self.last_dmg_struct ) )
    {
        dmg_struct.num_hits = self.last_dmg_struct.num_hits;
    }
    else
    {
        dmg_struct.num_hits = 0;
    }
    
    dmg_struct.num_hits++;
    n_pap_level = 0;
    
    if ( utility::issharedfuncdefined( #"zombie", #"get_pap_level" ) && isplayer( dmg_struct.eattacker ) )
    {
        n_pap_level = dmg_struct.eattacker utility::callsharedfunc( #"zombie", #"get_pap_level", dmg_struct.objweapon );
    }
    
    if ( n_pap_level >= 1 )
    {
        dmg_struct.idamage /= 2;
    }
    
    dmg_struct.idamage = function_fd5f6e73cbb5e11( dmg_struct, shitloc, n_pap_level );
    
    if ( isplayer( eattacker ) && utility::issharedfuncdefined( #"player", #"hash_b0979c1a1f9ea686" ) )
    {
        adjusted_damage = eattacker [[ utility::getsharedfunc( #"player", #"hash_b0979c1a1f9ea686" ) ]]( dmg_struct );
        
        if ( adjusted_damage != -1 )
        {
            dmg_struct.idamage = adjusted_damage;
        }
    }
    
    final_damage = dmg_struct.idamage;
    
    if ( isarray( level.var_e8f6b03121a2f56d ) )
    {
        foreach ( func in level.var_e8f6b03121a2f56d )
        {
            new_damage = self [[ func ]]( dmg_struct );
            
            if ( new_damage != -1 )
            {
                final_damage = new_damage;
            }
        }
    }
    
    dmg_struct.bimmune = final_damage <= 0;
    
    if ( isdefined( eattacker ) && ( isplayer( eattacker ) || isplayer( eattacker.owner ) ) )
    {
        eplayer = eattacker;
        weaponelementtype = undefined;
        
        if ( isplayer( eattacker.owner ) )
        {
            eplayer = eattacker.owner;
        }
        
        if ( level.gamemodebundle.var_86012212da7b0935 || getdvarint( @"hash_5e1b3bfc576b756", 0 ) )
        {
            mp_agent_damage::function_eb8ba16055d6da7c( eplayer, self, shitloc, smeansofdeath, sweapon, int( final_damage ), vpoint, dmg_struct.bimmune, weaponelementtype, dmg_struct.biscritical, 0 );
        }
        
        if ( isplayer( eattacker ) && final_damage > 0 && shitloc != "shield" )
        {
            eattacker damagefeedback::updatedamagefeedback( "standard", final_damage >= self.health );
        }
    }
    
    self.last_dmg_struct = dmg_struct;
    
    if ( isplayer( dmg_struct.eattacker ) && level.gametypebundle.var_451ef421f1fcc5ad && utility::issharedfuncdefined( #"ammomod", #"hash_e25552f4fe9568b3" ) )
    {
        utility::callsharedfunc( #"ammomod", #"hash_e25552f4fe9568b3", dmg_struct );
        dmg_struct.var_bd22ba6c600a23a3 = self.var_bd22ba6c600a23a3;
    }
    
    callback::callback( "on_soldier_ai_damaged", dmg_struct );
    return int( final_damage );
}

// Namespace mp_damage
// Params 1, eflags: 0x4
// Checksum 0x9dffca1d, Offset: 0x10c9
// Size: 0x109
function private on_soldier_ai_damaged( dmg_struct )
{
    damage_utility::function_723dcec170ec23be( dmg_struct.eattacker );
    
    if ( isdefined( dmg_struct.einflictor ) && dmg_struct.einflictor vehicle::is_vehicle() && !isdefined( dmg_struct.einflictor.is_neutralizing ) && dmg_struct.smeansofdeath == "MOD_CRUSH" && !isdefined( dmg_struct.einflictor.b_collided ) && !level.var_36fe9de96e296f76 )
    {
        vehicle = dmg_struct.einflictor;
        vehicle.b_collided = 1;
        vehicle playrumbleonentity( "artillery_rumble_heavy" );
        
        if ( isdefined( dmg_struct.idamage ) && isdefined( self ) )
        {
            n_damage = int( dmg_struct.idamage * 0.1 );
            vehicle thread vehicle_collide( n_damage );
        }
    }
}

// Namespace mp_damage
// Params 1, eflags: 0x4
// Checksum 0x7a4590cb, Offset: 0x11da
// Size: 0x7d
function private on_zombie_ai_killed( params )
{
    playerattacker = params.eattacker;
    
    if ( isdefined( playerattacker ) && !isplayer( playerattacker ) && isplayer( playerattacker.owner ) )
    {
        playerattacker = playerattacker.owner;
    }
    
    if ( isplayer( playerattacker ) )
    {
        playerattacker thread mp_agent_damage::updaterecentagentkills( self, params.einflictor, params.objweapon );
    }
}

// Namespace mp_damage
// Params 1, eflags: 0x4
// Checksum 0x9970ec84, Offset: 0x125f
// Size: 0x13
function private function_9238338f068b6568( params )
{
    game_utility_common::removefromcharactersarray();
}

