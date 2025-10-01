#namespace delete;

// Namespace delete/delete_entity
// Params 0, eflags: 0x20
// Checksum 0x19e24bc4, Offset: 0x81
// Size: 0x1c
function event_handler[delete_entity] main()
{
    assert( isdefined( self ) );
    wait 0;
    
    if ( isent( self ) )
    {
        self delete();
    }
}

