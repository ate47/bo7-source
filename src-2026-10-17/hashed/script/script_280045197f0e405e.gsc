#using script_5925e714a9b193a8;
#using scripts\common\system;

#namespace namespace_9843df8802e465bd;

// Namespace namespace_9843df8802e465bd
// Params 0, eflags: 0x5
// Checksum 0xc571d186, Offset: 0x7a
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"hash_a38227944d70d472", undefined, undefined, &init );
}

// Namespace namespace_9843df8802e465bd
// Params 0, eflags: 0x4
// Checksum 0x366271cd, Offset: 0x9b
// Size: 0x3e
function private init()
{
    var_548b70c67b228f1c = level.gametypebundle.var_e46abc2387a838ba;
    
    if ( !isdefined( var_548b70c67b228f1c ) || var_548b70c67b228f1c == "" )
    {
        return;
    }
    
    function_dd84d5b492c2c32d( var_548b70c67b228f1c );
}

// Namespace namespace_9843df8802e465bd
// Params 1, eflags: 0x4
// Checksum 0x901ecd46, Offset: 0xe1
// Size: 0x60
function private function_dd84d5b492c2c32d( var_548b70c67b228f1c )
{
    var_6cad65724359c57b = getscriptbundle( var_548b70c67b228f1c );
    
    if ( !isdefined( var_6cad65724359c57b ) )
    {
        assertmsg( "<dev string:x24>" + var_548b70c67b228f1c );
        return;
    }
    
    level endon( #"game_ended" );
    
    while ( true )
    {
        level waittill( #"br_circle_set" );
        function_971b4b137e5a6f4d( var_6cad65724359c57b );
    }
}

// Namespace namespace_9843df8802e465bd
// Params 1, eflags: 0x4
// Checksum 0x452f6bbe, Offset: 0x149
// Size: 0x148
function private function_971b4b137e5a6f4d( var_6cad65724359c57b )
{
    circle_index = br_circle::function_2b56c0c1d9436a89();
    assert( circle_index < var_6cad65724359c57b.globaltags.size );
    global_tags = var_6cad65724359c57b.globaltags[ circle_index ];
    
    foreach ( tag in global_tags.to_activate )
    {
        function_a25acb62ddab20e2( tag.name, 1 );
    }
    
    foreach ( tag in global_tags.to_deactivate )
    {
        function_a25acb62ddab20e2( tag.name, 0 );
    }
}

