#using scripts\common\active_env\moving_platforms;
#using scripts\common\active_env\utility;
#using scripts\mp\compass;
#using scripts\mp\load;
#using scripts\mp\maps\mp_sat_sm_sora\gen\mp_sat_sm_sora_art;
#using scripts\mp\maps\mp_sat_sm_sora\mp_sat_sm_sora_fx;
#using scripts\mp\maps\mp_sat_sm_sora\mp_sat_sm_sora_lighting;

#namespace mp_sat_sm_sora;

// Namespace mp_sat_sm_sora
// Params 0
// Checksum 0x7a2df89d, Offset: 0x183
// Size: 0xfb
function main()
{
    mp_sat_sm_sora_art::main();
    namespace_5c77a6248feb63ac::main();
    namespace_c6db11192842cd1a::main();
    load::main();
    level.kill_border_triggers = getentarray( "kill_border_trigger", #targetname );
    level.outofboundstriggers = getentarray( "OutOfBounds", #targetname );
    level.var_750dbf45607817fd = getentarray( "Drone_OutOfBounds", #targetname );
    level.var_f11fa8013d4e241c = getentarray( "VTOL_OutOfBounds", #targetname );
    compass::setupminimap( "compass_map_mp_sat_sm_sora" );
    game[ "attackers" ] = "allies";
    game[ "defenders" ] = "axis";
    game[ "allies_outfit" ] = "urban";
    game[ "axis_outfit" ] = "woodland";
    level thread moving_platforms::moving_platforms_init();
    weaponfilter = [ #"drone_launcher":1 ];
    utility::setup_no_deploy_zones( weaponfilter );
    function_d7f9958b36b16eff();
}

// Namespace mp_sat_sm_sora
// Params 0, eflags: 0x4
// Checksum 0xd018cd3e, Offset: 0x286
// Size: 0x15d
function private function_d7f9958b36b16eff()
{
    var_98c5c0a7dc9ff235 = getdvarint( @"hash_7bd6b0ac8e8cbff3", 0 );
    a_t_damage = getentarray( "sora_damage_trigger", #script_noteworthy );
    e_model = getent( "damage_trigger_model", #targetname );
    
    if ( !isdefined( e_model ) )
    {
        return;
    }
    
    e_model hide();
    e_model notsolid();
    
    if ( var_98c5c0a7dc9ff235 )
    {
        foreach ( t_damage in a_t_damage )
        {
            t_damage hide();
        }
        
        return;
    }
    
    foreach ( t_damage in a_t_damage )
    {
        t_damage show();
        t_damage.b_used = 0;
        t_damage thread watch_for_damage( e_model );
    }
}

// Namespace mp_sat_sm_sora
// Params 1, eflags: 0x4
// Checksum 0x82c356d, Offset: 0x3eb
// Size: 0x4a
function private watch_for_damage( e_model )
{
    level endon( #"game_ended" );
    
    while ( self.b_used === 0 )
    {
        self waittill( #"trigger" );
        self.b_used = 1;
        function_3f355b996a287ff7( e_model );
    }
}

// Namespace mp_sat_sm_sora
// Params 1, eflags: 0x4
// Checksum 0x29d0ef75, Offset: 0x43d
// Size: 0x8c
function private function_3f355b996a287ff7( e_model )
{
    level endon( #"game_ended" );
    e_new_model = spawn( "script_model", e_model.origin );
    e_new_model.angles = e_model.angles;
    e_new_model setscale( 10 );
    e_new_model setmodel( e_model.model );
    e_new_model notsolid();
    e_new_model linkto( e_model );
    moving_platforms::moving_platform_activate( e_model );
    wait 9;
    e_new_model hide();
}

