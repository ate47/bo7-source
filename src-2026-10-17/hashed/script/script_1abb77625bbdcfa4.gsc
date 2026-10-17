#using script_16ea1b94f0f381b3;
#using script_353e34c229ca1589;
#using script_4ca4a30b15eb95bb;
#using script_7b1e082b2533e255;
#using scripts\common\callbacks;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\mp\damagefeedback;

#namespace specialty_stun_resistance;

// Namespace specialty_stun_resistance
// Params 0, eflags: 0x1
// Checksum 0x6be10a7b, Offset: 0xdb
// Size: 0x36
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
    utility::registersharedfunc( #"specialty_stun_resistance", #"applystunresistence", &applystunresistence );
}

// Namespace specialty_stun_resistance
// Params 1
// Checksum 0x5d0c9347, Offset: 0x119
// Size: 0x43
function registerspecialty( params )
{
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_stun_resistance", &setstunresistance, &unsetstunresistance, [ "specialty_hard_shell" ] );
    }
}

// Namespace specialty_stun_resistance
// Params 0
// Checksum 0x4304dae3, Offset: 0x164
// Size: 0x4b
function setstunresistance()
{
    perks::function_70e4256c5fb41ada( "specialty_stun_resistance" );
    power = self.var_9842326056fd7207.var_d099cc5afc82d970 ?? 4;
    power = int( power );
    self.stunscalar = 1 - power / 10;
}

// Namespace specialty_stun_resistance
// Params 0
// Checksum 0x79f71d7b, Offset: 0x1b7
// Size: 0x10
function unsetstunresistance()
{
    self.stunscalar = 1;
}

// Namespace specialty_stun_resistance
// Params 3
// Checksum 0x33cc429a, Offset: 0x1cf
// Size: 0x168
function applystunresistence( attacker, victim, time )
{
    if ( isdefined( attacker ) )
    {
        var_b660048a0793257a = attacker == victim;
    }
    else
    {
        var_b660048a0793257a = 0;
    }
    
    if ( !var_b660048a0793257a && isdefined( victim.perks[ "specialty_stun_resistance" ] ) )
    {
        if ( isdefined( victim.stunscalar ) && isdefined( time ) )
        {
            time *= victim.stunscalar;
        }
        
        attackerowner = attacker.owner ?? attacker;
        victimowner = victim.owner ?? victim;
        
        if ( isplayer( attackerowner ) && attackerowner != victim )
        {
            attacker damagefeedback::updatedamagefeedback( "hittacresist", undefined, undefined, undefined, 1 );
        }
        
        if ( player_utility::playersareenemies( attackerowner, victimowner ) )
        {
            if ( isdefined( victim.var_773b81cf576594e5[ "specialty_stun_resistance" ] ) )
            {
                victim perks::function_ef056eae4d523635( victim.var_773b81cf576594e5[ "specialty_stun_resistance" ], 1 );
            }
            else if ( isdefined( victim.perks[ "specialty_veteran" ] ) )
            {
                victim namespace_9d8e359c3b1041e5::activateperksharedfunc( "specialty_veteran" );
            }
        }
    }
    else if ( !victim val::get( "stunned" ) )
    {
        time = 0;
    }
    
    if ( victim game_utility_mp::ismatchstartprotected() )
    {
        time *= 0.1;
    }
    
    return time;
}

