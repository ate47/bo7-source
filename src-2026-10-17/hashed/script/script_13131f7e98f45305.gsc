#using scripts\common\callbacks;

#namespace namespace_6107ae6ec81b3c5c;

// Namespace namespace_6107ae6ec81b3c5c
// Params 0
// Checksum 0xd877766, Offset: 0x76
// Size: 0x20
function init()
{
    if ( !isdefined( level.var_b46020f508530c15 ) )
    {
        level.var_b46020f508530c15 = [];
    }
    
    level thread function_c55f66d48e128bb4();
}

// Namespace namespace_6107ae6ec81b3c5c
// Params 0
// Checksum 0x3c619c97, Offset: 0x9e
// Size: 0x30
function function_c55f66d48e128bb4()
{
    for ( ;; )
    {
        level waittill( #"connected", player );
        player thread function_282245e2743f09e6();
        player thread function_7e73ef4f5b87017f();
    }
}

// Namespace namespace_6107ae6ec81b3c5c
// Params 1
// Checksum 0xdb9057b9, Offset: 0xd6
// Size: 0x39
function function_f13d6a76e92aeee1( callback )
{
    if ( !isdefined( level.var_b46020f508530c15 ) )
    {
        level.var_b46020f508530c15 = [];
    }
    
    level.var_b46020f508530c15[ level.var_b46020f508530c15.size ] = callback;
}

// Namespace namespace_6107ae6ec81b3c5c
// Params 1
// Checksum 0x887542c7, Offset: 0x117
// Size: 0xa0
function function_9dd73e8bda2a8f56( removecallback )
{
    temparray = [];
    
    foreach ( callback in level.var_b46020f508530c15 )
    {
        if ( removecallback != callback )
        {
            temparray[ temparray.size ] = callback;
        }
    }
    
    level.var_b46020f508530c15 = temparray;
}

// Namespace namespace_6107ae6ec81b3c5c
// Params 0
// Checksum 0x3fc79be7, Offset: 0x1bf
// Size: 0xaf
function function_282245e2743f09e6()
{
    self endon( #"disconnect" );
    
    for ( ;; )
    {
        self waittill( #"reload_start" );
        callback::callback( #"reload_start", { #player:self } );
        
        foreach ( callback in level.var_b46020f508530c15 )
        {
            self [[ callback ]]();
        }
    }
}

// Namespace namespace_6107ae6ec81b3c5c
// Params 0
// Checksum 0xb4890dc8, Offset: 0x276
// Size: 0x39
function function_7e73ef4f5b87017f()
{
    self endon( #"disconnect" );
    
    for ( ;; )
    {
        self waittill( #"hash_ef47b53296157ce6" );
        callback::callback( #"reload", { #player:self } );
    }
}

