#using scripts\common\callbacks;
#using scripts\mp\compass;
#using scripts\mp\load;
#using scripts\mp\maps\mp_sat_roji\gen\mp_sat_roji_art;
#using scripts\mp\maps\mp_sat_roji\mp_sat_roji_fx;
#using scripts\mp\maps\mp_sat_roji\mp_sat_roji_lighting;

#namespace mp_sat_roji;

// Namespace mp_sat_roji
// Params 0
// Checksum 0x92a8acf8, Offset: 0x1ec
// Size: 0xed
function main()
{
    mp_sat_roji_art::main();
    namespace_ec7c6a5c94192392::main();
    namespace_3a0bde563326cf8::main();
    load::main();
    level.kill_border_triggers = getentarray( "kill_border_trigger", #targetname );
    level.outofboundstriggers = getentarray( "OutOfBounds", #targetname );
    level.var_750dbf45607817fd = getentarray( "Drone_OutOfBounds", #targetname );
    level.var_f11fa8013d4e241c = getentarray( "VTOL_OutOfBounds", #targetname );
    compass::setupminimap( "compass_map_mp_sat_roji" );
    game[ "attackers" ] = "allies";
    game[ "defenders" ] = "axis";
    game[ "allies_outfit" ] = "urban";
    game[ "axis_outfit" ] = "woodland";
    callback::add( #"player_spawn_init", &on_spawn_init );
    thread function_857e2bdd638407be();
    function_558522e53d1d2ae9();
}

// Namespace mp_sat_roji
// Params 1
// Checksum 0xca3771da, Offset: 0x2e1
// Size: 0xc
function on_spawn_init( params )
{
    
}

// Namespace mp_sat_roji
// Params 0
// Checksum 0x748927e6, Offset: 0x2f5
// Size: 0x105
function function_857e2bdd638407be()
{
    level endon( #"game_ended" );
    level endon( #"round_end" );
    level waittill( #"scriptables_ready" );
    damage_trigger = getent( "vent_ee_damage_trigger", "targetname" );
    cat_sound_origin = getent( "vent_ee_cat_sound_origin", "targetname" );
    
    if ( !isdefined( damage_trigger ) )
    {
        return;
    }
    
    while ( true )
    {
        damage_trigger waittill( #"damage", idamage, eattacker, direction_vec, damagelocation, smeansofdeath, modelname, tagname, partname, dflags, objweapon );
        
        if ( isplayer( eattacker ) && eattacker ismeleeing() && smeansofdeath == "MOD_MELEE" )
        {
            thread function_151034afae3b0749( eattacker, cat_sound_origin );
        }
        
        waitframe();
    }
}

// Namespace mp_sat_roji
// Params 2
// Checksum 0xadf97682, Offset: 0x402
// Size: 0x2a
function function_151034afae3b0749( attackingplayer, soundorigin )
{
    wait 0.8;
    attackingplayer playsoundtoplayer( "ee_mp_sat_roji_melee_vent_metalmeow", attackingplayer, soundorigin );
}

// Namespace mp_sat_roji
// Params 0
// Checksum 0x5106a10d, Offset: 0x434
// Size: 0xd0
function function_558522e53d1d2ae9()
{
    level waittill( #"scriptables_ready" );
    var_a0c435a81a1f44ef = getscriptablearray( "softtires_vehicle", "targetname" );
    
    foreach ( vehicle in var_a0c435a81a1f44ef )
    {
        if ( vehicle isscriptable() && vehicle getscriptablehaspart( "tire_manager" ) && vehicle getscriptableparthasstate( "tire_manager", "soft_tires" ) )
        {
            vehicle setscriptablepartstate( "tire_manager", "soft_tires" );
        }
    }
}

