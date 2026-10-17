#using script_4bc38131d8ecd20b;
#using script_640b69521097c6a5;
#using scripts\asm\asm;

#namespace namespace_f8b8d50b63bcec41;

// Namespace namespace_f8b8d50b63bcec41
// Params 0
// Checksum 0x22d0a59, Offset: 0x89
// Size: 0x44
function function_623484f9e2ef43f6()
{
    if ( zombie_stun::is_stunned() )
    {
        return;
    }
    
    self clearbtgoal( 0 );
    
    /#
        if ( getdvarint( @"hash_98f8e4d931159c0f", 0 ) )
        {
            zombie_weyward_asm::function_f8aee546f5ed4cfb( "<dev string:x24>", "<dev string:x70>" );
        }
    #/
    
    asm::function_7256f5ba459c840b( "summon_stingers" );
}

// Namespace namespace_f8b8d50b63bcec41
// Params 0
// Checksum 0xee9bbbb9, Offset: 0xd5
// Size: 0x30, Type: bool
function function_36394163e6e2ab8d()
{
    if ( isalive( self ) && isai( self ) && asm::asm_getcurrentstatename( self.asmname ) == "summon_stingers" )
    {
        return true;
    }
    
    return false;
}

