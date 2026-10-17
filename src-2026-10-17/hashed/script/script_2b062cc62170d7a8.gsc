#namespace namespace_9fd3ecf626067599;

// Namespace namespace_9fd3ecf626067599
// Params 1
// Checksum 0x46e7af70, Offset: 0x76
// Size: 0x9a
function onplayerjoinsquad( player )
{
    if ( !isdefined( level.onjoinsquadcallbacks ) )
    {
        level.onjoinsquadcallbacks = [];
    }
    
    foreach ( callback in level.onjoinsquadcallbacks )
    {
        self [[ callback ]]( player );
    }
}

// Namespace namespace_9fd3ecf626067599
// Params 1
// Checksum 0x7384c3d, Offset: 0x118
// Size: 0x39
function registeronplayerjoinsquadcallback( callback )
{
    if ( !isdefined( level.onjoinsquadcallbacks ) )
    {
        level.onjoinsquadcallbacks = [];
    }
    
    level.onjoinsquadcallbacks[ level.onjoinsquadcallbacks.size ] = callback;
}

// Namespace namespace_9fd3ecf626067599
// Params 1
// Checksum 0x34410870, Offset: 0x159
// Size: 0x9a
function function_3efb30390246d5d1( player )
{
    if ( !isdefined( level.var_a0608b4c1593ab84 ) )
    {
        level.var_a0608b4c1593ab84 = [];
    }
    
    foreach ( callback in level.var_a0608b4c1593ab84 )
    {
        self [[ callback ]]( player );
    }
}

// Namespace namespace_9fd3ecf626067599
// Params 1
// Checksum 0xdb3112c4, Offset: 0x1fb
// Size: 0x39
function function_ced28cc2c2efdabf( callback )
{
    if ( !isdefined( level.var_a0608b4c1593ab84 ) )
    {
        level.var_a0608b4c1593ab84 = [];
    }
    
    level.var_a0608b4c1593ab84[ level.var_a0608b4c1593ab84.size ] = callback;
}

