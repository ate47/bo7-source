#using script_1084adee4715e4bc;
#using scripts\autotests\autotests;
#using scripts\autotests\autotests_utility;
#using scripts\autotests\autotests_utility_bot;
#using scripts\autotests\autotests_utility_player;
#using scripts\autotests\mp\autotests_utility_equipment;
#using scripts\common\weapon;
#using scripts\mp\equipment;

#namespace test_mp_equip_smoke;

// Namespace test_mp_equip_smoke/testautomation
// Params 0, eflags: 0x20
// Checksum 0x1a18ab00, Offset: 0x184
// Size: 0x2b
function event_handler[testautomation] main()
{
    autotests::register_tests( "scripts/autotests/mp/test_mp_equip_smoke.gsc", #"test", &start_test, &setup, &cleanup, &parameterize );
}

// Namespace test_mp_equip_smoke
// Params 0
// Checksum 0xa805c7e0, Offset: 0x1b7
// Size: 0xbb
function start_test()
{
    autotests_utility_bot::kick_all_bots();
    player = autotests_utility_player::get_player();
    bot_data = autotests_utility_bot::get_spawn_data( player, 100 );
    bot = autotests_utility_bot::function_978126f411fc8a11( player, bot_data );
    var_63a718d91714219d = autotests::function_d84657f448aaeef6( "Bot spawned?", bot, "scripts/autotests/mp/test_mp_equip_smoke.gsc", 30 );
    
    if ( !autotests::function_5a030dd4450c1448( var_63a718d91714219d ) )
    {
        if ( autotests::function_561cb32cd7469145() )
        {
            return;
        }
        
        autotests::test_assert_return( var_63a718d91714219d );
    }
    
    autotests_utility_bot::set_bot_godmode( bot, 1 );
    bot autotests_utility_content::registercallbacks();
    equipmentref = self.parameters[ 0 ];
    test_equipment( bot, equipmentref );
    bot autotests_utility_content::removecallbacks();
}

// Namespace test_mp_equip_smoke
// Params 0, eflags: 0x4
// Checksum 0xe55d9802, Offset: 0x27a
// Size: 0xc6
function private setup()
{
    autotests::function_5c8c87763724c132();
    autotests_utility::setup();
    player = autotests_utility_player::get_player();
    player function_ffb0711adb6d8d0d();
    var_63a718d91714219d = autotests::function_d84657f448aaeef6( "Player is autopiloted?", isautopilot( player ), "scripts/autotests/mp/test_mp_equip_smoke.gsc", 47 );
    
    if ( !autotests::function_5a030dd4450c1448( var_63a718d91714219d ) )
    {
        if ( autotests::function_561cb32cd7469145() )
        {
            return;
        }
        
        autotests::test_assert_return( var_63a718d91714219d );
    }
    
    autotests_utility_bot::set_bot_godmode( player, 1 );
    autotests::push_function( "Prematch completed" );
    test_result_int = player autotests_utility::test_prematch_done() ?? 0;
    test_result_int = autotests::function_e496a326e5d58a25( "Prematch completed", test_result_int, undefined, undefined, "scripts/autotests/mp/test_mp_equip_smoke.gsc", 50 );
    autotests::pop_function( "Prematch completed" );
    autotests::test_assert_return( test_result_int );
    return 1;
}

// Namespace test_mp_equip_smoke
// Params 0, eflags: 0x4
// Checksum 0x92b5ced8, Offset: 0x349
// Size: 0x2c
function private cleanup()
{
    player = autotests_utility_player::get_player();
    autotests_utility_bot::set_bot_godmode( player, 0 );
    player playerexitautopilotmode();
    autotests_utility_bot::kick_all_bots();
}

// Namespace test_mp_equip_smoke
// Params 1, eflags: 0x4
// Checksum 0x205ac8d1, Offset: 0x37d
// Size: 0x37
function private parameterize( datasets )
{
    equipmentbundles = autotests_utility_equipment::function_d7fbf95af74b10e9( 0 );
    itemrefs = [];
    autotests_utility::function_8354eb3723f722f4( equipmentbundles, itemrefs, 0 );
    return itemrefs;
}

// Namespace test_mp_equip_smoke
// Params 2, eflags: 0x4
// Checksum 0xd7f578dd, Offset: 0x3bd
// Size: 0x1fa
function private test_equipment( bot, equipmentref )
{
    slot = equipment_mp::getdefaultslot( equipmentref );
    equipresult = autotests_utility_content::equipcontent( bot, equipmentref );
    
    if ( !equipresult.result )
    {
        autotests::report_info( "Unable to equip " + equipmentref );
        return 5;
    }
    
    ispowerweapon = issubstr( equipmentref, "equip_pw_" );
    
    if ( ispowerweapon )
    {
        originalweapon = bot getcurrentweapon();
        data = level.equipment.table[ equipmentref ];
        bundle = data.bundle;
        powerweapon = weapon::buildweapon( weapon::getweaponrootname( bundle.var_4675e1d6808cc3ec ) );
        bot giveweapon( powerweapon );
        bot setweaponammoclip( powerweapon, 1 );
        bot switchtoweaponimmediate( powerweapon );
        wait 1;
        bot botpressbutton( "attack", 2 );
        wait 2;
        
        if ( isdefined( originalweapon ) && bot hasweapon( originalweapon ) )
        {
            bot switchtoweaponimmediate( originalweapon );
        }
        
        wait 0.5;
        
        if ( bot hasweapon( powerweapon ) )
        {
            bot takeweapon( powerweapon );
        }
        
        wait 0.5;
    }
    else
    {
        usebutton = slot == "primary" ? "lethal" : "tactical";
        bot botpressbutton( usebutton, 1 );
        var_63a718d91714219d = autotests::test_wait_any( "Equipment used?", level, [ "equipment_used_" + bot.team ], 5, "scripts/autotests/mp/test_mp_equip_smoke.gsc", 115 );
        
        if ( !autotests::function_5a030dd4450c1448( var_63a718d91714219d ) )
        {
            if ( autotests::function_561cb32cd7469145() )
            {
                return;
            }
            
            autotests::test_assert_return( var_63a718d91714219d );
        }
    }
    
    wait 2;
    
    if ( equipmentref == "equip_molotov" || equipmentref == "equip_pressure_bomb" )
    {
        wait 5;
    }
    
    autotests::set_current_asset_name( "" );
}

