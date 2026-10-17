#using scripts\common\ai\ai_spawn_director;
#using scripts\common\create_script_utility;
#using scripts\common\utility;
#using scripts\mp\compass;
#using scripts\mp\gametypes\ob;
#using scripts\mp\load;
#using scripts\mp\maps\mp_sat_lm_avalon\mp_sat_lm_avalon_fx;
#using scripts\mp\poi;

#namespace mp_sat_lm_avalon_ob;

// Namespace mp_sat_lm_avalon_ob
// Params 0
// Checksum 0x88eeaec7, Offset: 0x286
// Size: 0xd1
function main()
{
    transient_init();
    level thread poi::poi_init();
    create_script_utility::initialize_create_script();
    mp_sat_lm_avalon_fx::main();
    load::main();
    level.outofboundstriggers = getentarray( "OutOfBounds", #targetname );
    compass::setupminimap( "compass_map_mp_sat_lm_avalon_ob", undefined, 16 );
    
    if ( !isdefined( level.defaultcallbackplayerdamage ) )
    {
        ob::main();
    }
    
    game[ "attackers" ] = "allies";
    game[ "defenders" ] = "axis";
    game[ "allies_outfit" ] = "urban";
    game[ "axis_outfit" ] = "woodland";
    thread ob_ambient_init();
    setgameprops( "mp_sat_lm_avalon_ob_taurus" );
    var_bb86f77304f193c4 = ob::get_ob_settings();
    
    if ( var_bb86f77304f193c4.var_49178f6e5c220274 )
    {
        function_afe7a4424a1ecc51();
    }
}

// Namespace mp_sat_lm_avalon_ob
// Params 0, eflags: 0x4
// Checksum 0x8dc75423, Offset: 0x35f
// Size: 0x1f
function private transient_load_scorpio()
{
    loadinfiltransient( "mp_infil_ob_sat_avalon_endgame_scorpio_tr" );
    
    while ( !isinfiltransientloaded( "mp_infil_ob_sat_avalon_endgame_scorpio_tr" ) )
    {
        wait 1;
    }
}

// Namespace mp_sat_lm_avalon_ob
// Params 0, eflags: 0x4
// Checksum 0xfe68cbd0, Offset: 0x386
// Size: 0x1f
function private transient_load_phobos()
{
    loadinfiltransient( "mp_infil_ob_sat_avalon_endgame_phobos_tr" );
    
    while ( !isinfiltransientloaded( "mp_infil_ob_sat_avalon_endgame_phobos_tr" ) )
    {
        wait 1;
    }
}

// Namespace mp_sat_lm_avalon_ob
// Params 0, eflags: 0x4
// Checksum 0xf2a3a2b3, Offset: 0x3ad
// Size: 0x9c
function private transient_init()
{
    level.var_5611c21c9d9c23fb = &transient_load_scorpio;
    level.var_66d5e15cc9735435 = &transient_load_phobos;
    var_bb86f77304f193c4 = ob::get_ob_settings();
    
    if ( isdefined( var_bb86f77304f193c4 ) )
    {
        if ( !var_bb86f77304f193c4.var_49178f6e5c220274 )
        {
            if ( isinfiltransientloaded( "mp_infil_ob_sat_avalon_campaign_tr" ) )
            {
                unloadinfiltransient( "mp_infil_ob_sat_avalon_campaign_tr" );
            }
            
            if ( var_bb86f77304f193c4.var_69c82bbd1c5287e8 )
            {
                level thread [[ level.var_5611c21c9d9c23fb ]]();
                level thread [[ level.var_66d5e15cc9735435 ]]();
            }
            
            return;
        }
        
        if ( isinfiltransientloaded( "mp_infil_ob_sat_avalon_endgame_tr" ) )
        {
            unloadinfiltransient( "mp_infil_ob_sat_avalon_endgame_tr" );
        }
    }
}

// Namespace mp_sat_lm_avalon_ob
// Params 0
// Checksum 0x5572d461, Offset: 0x451
// Size: 0x3d
function ob_ambient_init()
{
    utility::flag_wait_all( "ai_spawn_director_initialized", "create_script_initialized" );
    ai_spawn_director::process_create_script();
    ai_spawn_director::function_ce4d6b81417e3b34();
    function_a25acb62ddab20e2( "difficulty_easy", 1 );
    setdvar( @"ai_spawn_director_dynamic_ambient_encounters", 1 );
}

// Namespace mp_sat_lm_avalon_ob
// Params 0, eflags: 0x4
// Checksum 0x3c752eca, Offset: 0x496
// Size: 0xb1
function private function_afe7a4424a1ecc51()
{
    utility::flag_wait( "scriptables_ready" );
    jbm_scriptable_array = getentitylessscriptablearray( "jbm_scriptable", "script_noteworthy" );
    
    foreach ( scriptable in jbm_scriptable_array )
    {
        scriptable setscriptablepartstate( "body", "invisible" );
        scriptable setscriptablepartstate( "jailbreak_icon", "off" );
    }
}

