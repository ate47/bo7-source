#using scripts\asm\gesture;

#namespace namespace_f9e15975f25db152;

// Namespace namespace_f9e15975f25db152
// Params 2
// Checksum 0x907c01ef, Offset: 0x81
// Size: 0xbf
function function_f5f982ce9e32c830( statename, params )
{
    id = self getinteractionid();
    
    if ( params.size == 1 )
    {
        thread gesture::ai_request_gesture( params[ 0 ], undefined, undefined, "gesture" );
        return;
    }
    
    if ( params.size == 2 )
    {
        thread gesture::ai_request_gesture( params[ 0 ], params[ 1 ], undefined, "gesture" );
        return;
    }
    
    if ( params.size == 3 )
    {
        thread gesture::ai_request_gesture( params[ 0 ], params[ 1 ], params[ 2 ], "gesture" );
        return;
    }
    
    if ( params.size == 4 )
    {
        thread gesture::ai_request_gesture( params[ 0 ], params[ 1 ], params[ 2 ], params[ 3 ] );
        return;
    }
    
    assertmsg( "<dev string:x24>" + params.size + "<dev string:x64>" );
}

