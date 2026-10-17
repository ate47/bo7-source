#namespace br_keypad_util;

// Namespace br_keypad_util
// Params 0
// Checksum 0xd6a5e97c, Offset: 0xaa
// Size: 0x10
function getkeypadstatefromomnvar()
{
    return playerunpackdatafromomnvar( "ui_keypad_data", 0, 2 );
}

// Namespace br_keypad_util
// Params 0
// Checksum 0xca29ca4b, Offset: 0xc3
// Size: 0x11
function getkeypadcodelengthfromomnvar()
{
    return playerunpackdatafromomnvar( "ui_keypad_data", 2, 4 );
}

// Namespace br_keypad_util
// Params 1
// Checksum 0x922f7ae8, Offset: 0xdd
// Size: 0x16
function playersetkeypadstateindex( stateindex )
{
    playersetomnvarkeypad( 0, stateindex );
}

// Namespace br_keypad_util
// Params 1
// Checksum 0x6c54fddd, Offset: 0xfb
// Size: 0x17
function playersetkeypadcodelengthindex( codelengthindex )
{
    playersetomnvarkeypad( 1, codelengthindex );
}

// Namespace br_keypad_util
// Params 1
// Checksum 0x2cf9262c, Offset: 0x11a
// Size: 0x17
function function_1797b505e547da15( var_2bbe690744ba4ce6 )
{
    playersetomnvarkeypad( 2, var_2bbe690744ba4ce6 );
}

// Namespace br_keypad_util
// Params 1
// Checksum 0x22f6b0ae, Offset: 0x139
// Size: 0x44
function function_81e90d6b02c1f881( objid )
{
    if ( !isdefined( objid ) )
    {
        objid = 15;
    }
    else if ( objid > 14 )
    {
        assertmsg( "<dev string:x24>" + objid + "<dev string:x59>" );
        return;
    }
    
    playersetomnvarkeypad( 3, objid );
}

// Namespace br_keypad_util
// Params 1
// Checksum 0xb765738e, Offset: 0x185
// Size: 0x44
function function_be07302388f0b8ad( attemptsremaining )
{
    if ( !isdefined( attemptsremaining ) )
    {
        attemptsremaining = 3;
    }
    else if ( attemptsremaining > 14 )
    {
        assertmsg( "<dev string:x8b>" + attemptsremaining + "<dev string:xd2>" );
        return;
    }
    
    playersetomnvarkeypad( 4, attemptsremaining );
}

// Namespace br_keypad_util
// Params 3
// Checksum 0x51f0e247, Offset: 0x1d1
// Size: 0x142
function function_c687623ea57f1aea( var_b5f8506548207a1e, var_f7d2fe7c55c17076, objid )
{
    var_f063abde4346430c = 0;
    
    if ( !isdefined( objid ) )
    {
        objid = 15;
    }
    else if ( objid >= 15 )
    {
        assertmsg( "<dev string:x110>" + objid + "<dev string:x145>" + 15 + "<dev string:x176>" );
        return;
    }
    
    shift = 0;
    var_f063abde4346430c |= objid << shift;
    i = 0;
    
    foreach ( digit in var_b5f8506548207a1e )
    {
        shift = i * 4 + 4;
        
        if ( i < var_f7d2fe7c55c17076 )
        {
            var_f063abde4346430c |= digit << shift;
        }
        else
        {
            var_f063abde4346430c |= 10 << shift;
        }
        
        i++;
    }
    
    while ( i < 4 )
    {
        shift = i * 4 + 4;
        var_f063abde4346430c |= 15 << shift;
        i++;
    }
    
    self setclientomnvar( "ui_vault_code_known_digits", int( var_f063abde4346430c ) );
}

// Namespace br_keypad_util
// Params 2
// Checksum 0xe38774d6, Offset: 0x31b
// Size: 0x80
function playersetomnvarkeypad( dataref, value )
{
    assert( isplayer( self ) );
    [ bitoffset, bitwidth, omnvarref, value ] = getkeypadomnvarbitpackinginfo( dataref, value );
    
    if ( omnvarref == "" )
    {
        return;
    }
    
    playerpackdataintoomnvar( omnvarref, value, bitoffset, bitwidth );
}

// Namespace br_keypad_util
// Params 2
// Checksum 0xd7547c4a, Offset: 0x3a3
// Size: 0x1a0
function getkeypadomnvarbitpackinginfo( dataref, value )
{
    bitoffset = 0;
    bitwidth = 0;
    omnvarref = "";
    
    switch ( dataref )
    {
        case 0:
            [ bitoffset, bitwidth ] = [ 0, 2 ];
            omnvarref = "ui_keypad_data";
            break;
        case 1:
            [ bitoffset, bitwidth ] = [ 2, 4 ];
            omnvarref = "ui_keypad_data";
            break;
        case 2:
            [ bitoffset, bitwidth ] = [ 6, 4 ];
            omnvarref = "ui_keypad_data";
            break;
        case 3:
            [ bitoffset, bitwidth ] = [ 10, 8 ];
            omnvarref = "ui_keypad_data";
            break;
        case 4:
            [ bitoffset, bitwidth ] = [ 18, 4 ];
            omnvarref = "ui_keypad_data";
            break;
        default:
            assertmsg( "<dev string:x178>" + dataref + "<dev string:x18e>" );
            break;
    }
    
    return [ bitoffset, bitwidth, omnvarref, value ];
}

// Namespace br_keypad_util
// Params 4
// Checksum 0x6460f9b1, Offset: 0x54c
// Size: 0x98
function playerpackdataintoomnvar( omnvarref, value, bitoffset, bitwidth )
{
    mask = ( 1 << bitwidth ) - 1;
    shiftedvalue = ( value & mask ) << bitoffset;
    invertedmask = ~( mask << bitoffset );
    prevvalue = self getclientomnvar( omnvarref );
    cleanedbase = prevvalue & invertedmask;
    repackedvalue = cleanedbase + shiftedvalue;
    
    if ( repackedvalue != prevvalue )
    {
        self setclientomnvar( omnvarref, repackedvalue );
    }
}

// Namespace br_keypad_util
// Params 3
// Checksum 0x3bef70e0, Offset: 0x5ec
// Size: 0x61
function playerunpackdatafromomnvar( omnvarref, var_8e0a517bef5fb5a9, var_53c51112e5802e4 )
{
    prevvalue = self getclientomnvar( omnvarref );
    var_cea83b4cc1899b3b = ( 1 << var_53c51112e5802e4 ) - 1;
    bitarray = prevvalue >> var_8e0a517bef5fb5a9;
    extractedvalue = var_cea83b4cc1899b3b & bitarray;
    return extractedvalue;
}

