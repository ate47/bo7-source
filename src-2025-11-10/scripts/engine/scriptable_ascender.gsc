#using scripts\common\values;

#namespace scriptable_ascender;

// Namespace scriptable_ascender
// Params 1
// Checksum 0x682b8290, Offset: 0xa0
// Size: 0x17
function function_959621fba91be23a( var_3ae5eb2fb5d3efbb )
{
    level.var_bb575808409344ee = var_3ae5eb2fb5d3efbb;
}

// Namespace scriptable_ascender
// Params 1
// Checksum 0xf2188888, Offset: 0xbf
// Size: 0x17
function function_432ef320b0c53fcd( canusecallback )
{
    level.var_8f06f4408d803602 = canusecallback;
}

// Namespace scriptable_ascender
// Params 1
// Checksum 0x5624183, Offset: 0xde
// Size: 0x3b
function function_784813a62abce5fe( usedcallback )
{
    if ( !isdefined( level.var_79d0243547ca5195 ) )
    {
        level.var_79d0243547ca5195 = [];
    }
    
    level.var_79d0243547ca5195[ level.var_79d0243547ca5195.size ] = usedcallback;
}

// Namespace scriptable_ascender
// Params 6
// Checksum 0x2cb62bd0, Offset: 0x121
// Size: 0xb4
function function_4b79d00966274afd( instance, player, edgeindex, isvertical, isinverted, isgoingup )
{
    if ( instance.forcedisabled || !player val::get( "ascender_use" ) )
    {
        s = spawnstruct();
        s.type = "HINT_NOBUTTON";
        s.string = &"";
        return s;
    }
    
    if ( isdefined( level.var_bb575808409344ee ) )
    {
        return [[ level.var_bb575808409344ee ]]( instance, player, edgeindex, isvertical, isinverted, isgoingup );
    }
    
    return undefined;
}

// Namespace scriptable_ascender
// Params 5
// Checksum 0x3cce1f07, Offset: 0x1de
// Size: 0x74
function function_3964a642425ff608( instance, player, edgeindex, isinverted, isvertical )
{
    if ( instance.forcedisabled || !player val::get( "ascender_use" ) )
    {
        return 0;
    }
    
    if ( isdefined( level.var_8f06f4408d803602 ) )
    {
        return [[ level.var_8f06f4408d803602 ]]( instance, player, edgeindex, isinverted, isvertical );
    }
    
    return 1;
}

// Namespace scriptable_ascender/event_89502489b930db54
// Params 6, eflags: 0x20
// Checksum 0x25b42a56, Offset: 0x25b
// Size: 0xc3
function event_handler[event_89502489b930db54] function_89502489b930db54( instance, player, edgeindex, isinverted, isvertical, ascendervec )
{
    if ( isdefined( level.var_79d0243547ca5195 ) )
    {
        foreach ( used_func in level.var_79d0243547ca5195 )
        {
            [[ used_func ]]( instance, player, edgeindex, isinverted, isvertical, ascendervec );
        }
    }
}

