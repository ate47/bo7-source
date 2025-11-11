#namespace callback;

// Namespace callback
// Params 2
// Checksum 0x77f3f507, Offset: 0x81
// Size: 0x29
function exec_callback( func, data )
{
    if ( isdefined( data ) )
    {
        [[ func ]]( data );
        return;
    }
    
    [[ func ]]();
}

