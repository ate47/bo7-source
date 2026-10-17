#using script_16ea1b94f0f381b3;
#using script_6c2f6a14fa53759e;
#using script_7b1e082b2533e255;
#using scripts\common\callbacks;
#using scripts\common\powerups;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\mp\agents\agent_utils;

#namespace insta_kill;

// Namespace insta_kill
// Params 0, eflags: 0x1
// Checksum 0x85bde10d, Offset: 0x16a
// Size: 0x9
function autoexec main()
{
    init_insta_kill();
}

// Namespace insta_kill
// Params 0
// Checksum 0xcc35f7ba, Offset: 0x17b
// Size: 0x4f
function init_insta_kill()
{
    powerups::register_powerup( "insta_kill", &grab_insta_kill );
    zombie_utils::function_dfae6a5bd222c586( &function_8e8b9036e138ae34 );
    agent_utils::register_soldier_damage_callback( &function_8e8b9036e138ae34 );
    
    if ( level.gametypebundle.var_607a73bd5b5baaa5 )
    {
        level.modifyplayerdamage = &function_fafd59130a575894;
    }
}

// Namespace insta_kill
// Params 2
// Checksum 0xb9bb0a76, Offset: 0x1d2
// Size: 0x148
function grab_insta_kill( str_powerup, ent_powerup )
{
    a_players = powerups::get_powerup_players( str_powerup );
    root = powerups::get_powerups_root();
    n_lifetime = root.powerups[ "insta_kill" ].var_3f03b937c69044df;
    
    if ( isdefined( level.powerup_timeout_override ) )
    {
        n_lifetime = self [[ level.powerup_timeout_override ]]( n_lifetime );
    }
    
    foreach ( player in a_players )
    {
        player thread set_insta_kill( n_lifetime, root );
    }
    
    if ( level.gametypebundle.var_67b864b1d6e73c7e )
    {
        var_13873fdda09a9241 = level.sharedfuncs[ #"hud" ][ #"teamplayercardsplash" ];
        
        if ( isdefined( var_13873fdda09a9241 ) )
        {
            level thread [[ var_13873fdda09a9241 ]]( "callout_powerup_insta_kill", self );
        }
    }
    
    level notify( #"hash_58daede90999d166" );
}

// Namespace insta_kill
// Params 2
// Checksum 0xa1014cb5, Offset: 0x322
// Size: 0xb3
function set_insta_kill( n_lifetime, root )
{
    self notify( #"hash_2051a89eff20c42b" );
    self endon( #"hash_2051a89eff20c42b" );
    utility::ent_flag_set( "powerup_insta_kill_active" );
    thread namespace_9d8e359c3b1041e5::showpoweruphudsharedfunc( "insta_kill", n_lifetime );
    
    if ( isdefined( level.var_3c27ca91f07da4e1 ) )
    {
        self [[ level.var_3c27ca91f07da4e1 ]]( n_lifetime, "end_insta_kill" );
    }
    else
    {
        utility::waittill_any_timeout( n_lifetime, "end_insta_kill" );
    }
    
    if ( isdefined( self ) )
    {
        utility::ent_flag_clear( "powerup_insta_kill_active" );
        params = { #ref:"insta_kill" };
        callback::callback( "powerup_insta_kill_end", params );
    }
}

// Namespace insta_kill
// Params 1
// Checksum 0x395831ff, Offset: 0x3dd
// Size: 0x9b
function function_8e8b9036e138ae34( params )
{
    if ( isdefined( params.eattacker ) && params.eattacker is_insta_kill_damage() )
    {
        if ( self._blackboard.var_1499c965638cbfd7 )
        {
            self._blackboard.var_1499c965638cbfd7 = 0;
        }
        
        return get_instakill_damage( params.idamage, params.eattacker, params.smeansofdeath, params.shitloc, params.sweapon );
    }
    
    return -1;
}

// Namespace insta_kill
// Params 0
// Checksum 0x3d75d20a, Offset: 0x481
// Size: 0x48, Type: bool
function is_insta_kill_damage()
{
    if ( isplayer( self ) && utility::ent_flag( "powerup_insta_kill_active" ) )
    {
        return true;
    }
    
    if ( isplayer( self.owner ) && self.owner utility::ent_flag( "powerup_insta_kill_active" ) )
    {
        return true;
    }
    
    return false;
}

// Namespace insta_kill
// Params 5
// Checksum 0xbe4241f4, Offset: 0x4d2
// Size: 0x1d7
function get_instakill_damage( idamage, eattacker, smeansofdeath, shitloc, sweapon )
{
    if ( level.headshots_only && !( "head" == shitloc || "helmet" == shitloc || "neck" == shitloc ) )
    {
        return -1;
    }
    
    if ( val::get( "ignore_instakill_powerup" ) )
    {
        return -1;
    }
    
    if ( isdefined( eattacker ) )
    {
        damage = self.health;
        
        if ( isdefined( self.aicategory ) )
        {
            if ( self.aicategory == "special" )
            {
                damage = idamage * powerups::get_powerup_info( "insta_kill" ).var_671ac0d1fe46529e;
            }
            else if ( self.aicategory == "elite" || self.aicategory == "hvt" )
            {
                damage = idamage * powerups::get_powerup_info( "insta_kill" ).var_fc9ad6805689bcfa;
            }
            else if ( self.aicategory == "boss" )
            {
                damage = idamage * powerups::get_powerup_info( "insta_kill" ).var_a32268be2724adb6;
            }
        }
        
        if ( !val::get( "damage" ) )
        {
            return -1;
        }
        
        if ( isdefined( self.instakill_func ) )
        {
            b_result = self [[ self.instakill_func ]]( eattacker, smeansofdeath, shitloc );
            
            if ( b_result )
            {
                return -1;
            }
        }
        
        if ( self.type == "zombie" && isdefined( sweapon ) && sweapon.basenamehash == %"t10_ar_p19_dg2_mp" )
        {
            return -1;
        }
        
        if ( damage == self.health )
        {
            val::set( "insta_kill", "kill_on_damage", 1 );
        }
        
        return damage;
    }
    
    return -1;
}

// Namespace insta_kill
// Params 11
// Checksum 0xd09a90ba, Offset: 0x6b2
// Size: 0xd1
function function_fafd59130a575894( einflictor, victim, eattacker, idamage, smeansofdeath, objweapon, vpoint, vdir, shitloc, idflags, var_cdd29ad5d1362c2 )
{
    attacker = eattacker;
    
    if ( !isplayer( eattacker ) )
    {
        attacker = eattacker.owner;
    }
    
    areenemies = player_utility::playersareenemies( victim, attacker );
    
    if ( isplayer( attacker ) && victim != attacker && areenemies && eattacker is_insta_kill_damage() )
    {
        return get_instakill_damage( idamage, eattacker, smeansofdeath, shitloc, objweapon );
    }
    
    return idamage;
}

