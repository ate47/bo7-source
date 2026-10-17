#using script_4bc38131d8ecd20b;
#using script_640b69521097c6a5;
#using scripts\asm\asm;

#namespace namespace_77f0670c8a2e733c;

// Namespace namespace_77f0670c8a2e733c
// Params 0
// Checksum 0xc2d8b93b, Offset: 0x85
// Size: 0x44
function function_d7144ac95cf9f789()
{
    if ( zombie_stun::is_stunned() )
    {
        return;
    }
    
    self clearbtgoal( 0 );
    
    /#
        if ( getdvarint( @"hash_98f8e4d931159c0f", 0 ) )
        {
            zombie_weyward_asm::function_f8aee546f5ed4cfb( "<dev string:x24>", "<dev string:x6a>" );
        }
    #/
    
    asm::function_7256f5ba459c840b( "bomb_attack" );
}

// Namespace namespace_77f0670c8a2e733c
// Params 0
// Checksum 0x188cdf32, Offset: 0xd1
// Size: 0x30, Type: bool
function function_37f4de727b08b964()
{
    if ( isalive( self ) && isai( self ) && asm::asm_getcurrentstatename( self.asmname ) == "bomb_attack" )
    {
        return true;
    }
    
    return false;
}

