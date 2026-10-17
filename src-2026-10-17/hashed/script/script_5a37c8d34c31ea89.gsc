#using script_32d93a194074fa6a;

#namespace namespace_517be00f79c3b2d1;

// Namespace namespace_517be00f79c3b2d1
// Params 1
// Checksum 0xf8ba29bc, Offset: 0xaa
// Size: 0x67
function function_288799208b288538( var_30f5911682eef112 )
{
    assert( isplayer( self ) );
    var_eb5c8d8f1c731c88 = ftue_tip::function_cd5fd90805a9ca0c( var_30f5911682eef112 );
    
    if ( !isdefined( var_eb5c8d8f1c731c88 ) )
    {
        assertmsg( "<dev string:x24>" + var_30f5911682eef112 + "<dev string:x56>" + level.ftuetips_table );
        return;
    }
    
    self setftuehudvisibility( level.var_de493e132c51b355[ var_eb5c8d8f1c731c88 ] );
}

// Namespace namespace_517be00f79c3b2d1
// Params 0
// Checksum 0x45bb5bd4, Offset: 0x119
// Size: 0x16
function function_90936c636db04625()
{
    assert( isplayer( self ) );
    self setftuehudvisibility( 0 );
}

// Namespace namespace_517be00f79c3b2d1
// Params 0
// Checksum 0x6b844b29, Offset: 0x137
// Size: 0x9
function function_b3dcb6195a98434a()
{
    function_7a61f058b7ceec5();
}

// Namespace namespace_517be00f79c3b2d1
// Params 0, eflags: 0x4
// Checksum 0xb71cfcb9, Offset: 0x148
// Size: 0x117
function private function_7a61f058b7ceec5()
{
    level.var_de493e132c51b355 = [];
    visibilitylist = getscriptbundle( "ftuehudvisibilitylist:ftuehudvisibility_list_mgl" ).ftuehudvisibility_list;
    
    foreach ( tip in level.ftuetips_table )
    {
        var_539157e23b578d90 = getscriptbundlefieldvalue( hashcat( %"hash_6b016976aff9ae9f", tip.bundle ), #"visibilitybundle" );
        
        if ( isdefined( var_539157e23b578d90 ) )
        {
            for ( var_3bd7a8548033c7ca = 0; visibilitylist[ var_3bd7a8548033c7ca ].bundle != var_539157e23b578d90 && var_3bd7a8548033c7ca < visibilitylist.size ; var_3bd7a8548033c7ca++ )
            {
            }
            
            level.var_de493e132c51b355[ tip.bundle ] = var_3bd7a8548033c7ca + 1;
        }
    }
}

