#namespace string;

// Namespace string
// Params 1
// Checksum 0x9b874b46, Offset: 0x8c
// Size: 0x1e
function to_string( var )
{
    if ( isdefined( var ) )
    {
        return string( var );
    }
    
    return "";
}

// Namespace string
// Params 1
// Checksum 0xde5e4b60, Offset: 0xb3
// Size: 0x1c, Type: bool
function function_63338a5831bf61d9( str )
{
    return !isdefined( str ) || str == "none";
}

/#

    // Namespace string
    // Params 3
    // Checksum 0xc1c8dd72, Offset: 0xd8
    // Size: 0x5a, Type: dev
    function rjust( str_input, n_length, str_fill )
    {
        if ( !isdefined( str_fill ) )
        {
            str_fill = "<dev string:x24>";
        }
        
        str_input = to_string( str_input );
        n_fill_length = n_length - str_input.size;
        str_fill = fill( n_fill_length, str_fill );
        return str_fill + str_input;
    }

    // Namespace string
    // Params 3
    // Checksum 0x1e18f754, Offset: 0x13a
    // Size: 0x5a, Type: dev
    function ljust( str_input, n_length, str_fill )
    {
        if ( !isdefined( str_fill ) )
        {
            str_fill = "<dev string:x24>";
        }
        
        str_input = to_string( str_input );
        n_fill_length = n_length - str_input.size;
        str_fill = fill( n_fill_length, str_fill );
        return str_input + str_fill;
    }

    // Namespace string
    // Params 2
    // Checksum 0xeead1cd5, Offset: 0x19c
    // Size: 0x70, Type: dev
    function fill( n_length, str_fill )
    {
        if ( !isdefined( str_fill ) || str_fill == "<dev string:x29>" )
        {
            str_fill = "<dev string:x24>";
        }
        
        str_return = "<dev string:x29>";
        
        while ( n_length > 0 )
        {
            str = getsubstr( str_fill, 0, n_length );
            n_length -= str.size;
            str_return += str;
        }
        
        return str_return;
    }

#/
