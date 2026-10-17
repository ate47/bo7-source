#using scripts\autotests\autotests;

#namespace test_spawns;

// Namespace test_spawns/testautomation
// Params 0, eflags: 0x20
// Checksum 0x604eb4b8, Offset: 0x13c
// Size: 0x21
function event_handler[testautomation] main()
{
    autotests::register_tests( "scripts/autotests/test_spawns.gsc", #"gp", &start_test, &setup );
}

// Namespace test_spawns
// Params 0
// Checksum 0xeb9868c, Offset: 0x165
// Size: 0xb, Type: bool
function setup()
{
    autotests::function_5c8c87763724c132();
    return true;
}

// Namespace test_spawns
// Params 0
// Checksum 0xac0590a6, Offset: 0x179
// Size: 0x2ea
function start_test()
{
    bundle = autotests::get_test_bundle( self.test.xhash_ref );
    var_1677fc3d920947c9 = [ "NO ERROR", "SPAWN IN SOLID", "SPAWN FREE FLOATING", "SPAWN ON ENTITY", "MISSING TAC POINT" ];
    
    /#
        str = "<dev string:x24>" + getxhashsourcename( level.gametypebundle.var_13262a698a5f782f.spawnpointkey ) + "<dev string:x2d>";
        var_63a718d91714219d = autotests::function_36ed835262a19e53( str, level.var_c28a44c6d6f41080, "<dev string:x36>", 28 );
        
        if ( !autotests::function_5a030dd4450c1448( var_63a718d91714219d ) )
        {
            if ( autotests::function_561cb32cd7469145() )
            {
                return;
            }
            
            autotests::test_assert_return( var_63a718d91714219d );
        }
    #/
    
    nspawns = 0;
    nfailed = 0;
    
    foreach ( spawns in level.var_c28a44c6d6f41080 )
    {
        foreach ( spawn in spawns )
        {
            if ( spawn.error_code )
            {
                foreach ( index, value in var_1677fc3d920947c9 )
                {
                    if ( index & spawn.error_code )
                    {
                        str = "SPAWN ERROR (" + value + ") at " + spawn.origin;
                        break;
                    }
                }
                
                autotests::function_e50d1006e5d65c04( str, spawn.error_code, 0, "scripts/autotests/test_spawns.gsc", 49 );
                nfailed++;
            }
        }
        
        nspawns += spawns.size;
    }
    
    npassed = nspawns - nfailed;
    str = "Spawns status (fail/pass): (" + nfailed + "/" + npassed + ")";
    var_63a718d91714219d = autotests::function_e50d1006e5d65c04( str, nfailed, 0, "scripts/autotests/test_spawns.gsc", 59 );
    
    if ( !autotests::function_5a030dd4450c1448( var_63a718d91714219d ) )
    {
        if ( autotests::function_561cb32cd7469145() )
        {
            return;
        }
        
        autotests::test_assert_return( var_63a718d91714219d );
    }
    
    return 0;
}

