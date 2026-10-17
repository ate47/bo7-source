#using script_16ea1b94f0f381b3;
#using script_6c2f6a14fa53759e;
#using scripts\common\system;

#namespace namespace_8af9e49601260c0f;

// Namespace namespace_8af9e49601260c0f
// Params 0, eflags: 0x5
// Checksum 0x8469e0f3, Offset: 0xa6
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"hash_d9d452697611cb28", undefined, undefined, &post_main );
}

// Namespace namespace_8af9e49601260c0f
// Params 0, eflags: 0x4
// Checksum 0x71745868, Offset: 0xc7
// Size: 0xf
function private post_main()
{
    level zombie_utils::function_dfae6a5bd222c586( &on_ai_damage );
}

// Namespace namespace_8af9e49601260c0f
// Params 1, eflags: 0x4
// Checksum 0x19431b71, Offset: 0xde
// Size: 0x11a
function private on_ai_damage( dmg_struct )
{
    if ( dmg_struct.sweapon.basename != "sat_sm_serval_mp" )
    {
        return dmg_struct.idamage;
    }
    
    if ( dmg_struct.smeansofdeath != "MOD_MELEE" )
    {
        return dmg_struct.idamage;
    }
    
    if ( !dmg_struct.objweapon hasattachmenthash( %"sat_bar_spike_sm_serval" ) )
    {
        return dmg_struct.idamage;
    }
    
    idamage = dmg_struct.idamage;
    current_round = namespace_9d8e359c3b1041e5::function_57de0ca2e80536a1( self.origin );
    boss_round = isalive( self ) ? zombie_utils::get_zombie_round_difficulty() : undefined;
    
    if ( isdefined( boss_round ) )
    {
        var_4feed796664d10af = int( max( current_round, boss_round ) );
    }
    else
    {
        var_4feed796664d10af = current_round;
    }
    
    var_bf311a89c929edce = namespace_9d8e359c3b1041e5::function_870440d8340968c0( "zombie_base", var_4feed796664d10af );
    
    if ( isdefined( var_bf311a89c929edce ) )
    {
        idamage = max( var_bf311a89c929edce * 1, idamage );
    }
    
    return idamage;
}

