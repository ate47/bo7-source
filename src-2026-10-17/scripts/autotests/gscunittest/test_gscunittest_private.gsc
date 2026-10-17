#using scripts\autotests\autotests;

#namespace gscunittest_private;

/#

    // Namespace gscunittest_private
    // Params 0, eflags: 0x4
    // Checksum 0x58234da, Offset: 0xcd
    // Size: 0xb, Type: dev
    function private dev_internal()
    {
        return "<dev string:x24>";
    }

#/

// Namespace gscunittest_private
// Params 0, eflags: 0x4
// Checksum 0x7989b9d3, Offset: 0xe0
// Size: 0x7
function private _internal()
{
    return "priv";
}

// Namespace gscunittest_private
// Params 0
// Checksum 0x205c416, Offset: 0xf0
// Size: 0x9b
function main()
{
    x = _internal();
    var_63a718d91714219d = autotests::function_e50d1006e5d65c04( "dev_internal:", x, "priv", "scripts/autotests/gscunittest/test_gscunittest_private.gsc", 22 );
    
    if ( !autotests::function_5a030dd4450c1448( var_63a718d91714219d ) )
    {
        if ( autotests::function_561cb32cd7469145() )
        {
            return;
        }
        
        autotests::test_assert_return( var_63a718d91714219d );
    }
    
    /#
        x = dev_internal();
        var_63a718d91714219d = autotests::function_e50d1006e5d65c04( "<dev string:x28>", x, "<dev string:x24>", "<dev string:x36>", 29 );
        
        if ( !autotests::function_5a030dd4450c1448( var_63a718d91714219d ) )
        {
            if ( autotests::function_561cb32cd7469145() )
            {
                return;
            }
            
            autotests::test_assert_return( var_63a718d91714219d );
        }
    #/
}

