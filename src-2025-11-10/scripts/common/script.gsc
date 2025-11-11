#namespace script;

// Namespace script
// Params 2
// Checksum 0xe3df296d, Offset: 0x124
// Size: 0xa2
function waittillslowprocessallowed( allowloop, var_9cacc25b15fb0b32 )
{
    if ( level.lastslowprocessframe == gettime() )
    {
        if ( allowloop )
        {
            do
            {
                waitframe();
                
                if ( var_9cacc25b15fb0b32 )
                {
                    waittillframeend();
                }
            }
            while ( level.lastslowprocessframe == gettime() );
        }
        else
        {
            waitframe();
            
            if ( var_9cacc25b15fb0b32 )
            {
                waittillframeend();
            }
            
            if ( level.lastslowprocessframe == gettime() )
            {
                waitframe();
                
                if ( var_9cacc25b15fb0b32 )
                {
                    waittillframeend();
                }
                
                if ( level.lastslowprocessframe == gettime() )
                {
                    waitframe();
                    
                    if ( var_9cacc25b15fb0b32 )
                    {
                        waittillframeend();
                    }
                    
                    if ( level.lastslowprocessframe == gettime() )
                    {
                        waitframe();
                        
                        if ( var_9cacc25b15fb0b32 )
                        {
                            waittillframeend();
                        }
                    }
                }
            }
        }
    }
    
    level.lastslowprocessframe = gettime();
}

// Namespace script
// Params 0
// Checksum 0x83615f7, Offset: 0x1ce
// Size: 0x1c
function function_f82d6641490331a9()
{
    level.lastslowprocessframe = maxint( level.lastslowprocessframe, gettime() );
}

// Namespace script
// Params 0
// Checksum 0x44b6567e, Offset: 0x1f2
// Size: 0x14
function function_e1c5c030f026248c()
{
    return gettime() - ( level.lastslowprocessframe ?? 0 );
}

// Namespace script
// Params 0
// Checksum 0x492f979a, Offset: 0x20f
// Size: 0x10, Type: bool
function function_7cae34dfec48a6d1()
{
    return level.lastslowprocessframe === gettime();
}

// Namespace script
// Params 1
// Checksum 0xbb9b5aab, Offset: 0x228
// Size: 0x46
function queuecreate( queuename )
{
    if ( !isdefined( level.queues ) )
    {
        level.queues = [];
    }
    
    assert( !isdefined( level.queues[ queuename ] ) );
    level.queues[ queuename ] = [];
}

// Namespace script
// Params 2
// Checksum 0xe048aad5, Offset: 0x276
// Size: 0x46
function queueadd( queuename, entity )
{
    assert( isdefined( level.queues[ queuename ] ) );
    level.queues[ queuename ][ level.queues[ queuename ].size ] = entity;
}

// Namespace script
// Params 1
// Checksum 0x70c1695d, Offset: 0x2c4
// Size: 0xd9
function queueremovefirst( queuename )
{
    assert( isdefined( level.queues[ queuename ] ) );
    first = undefined;
    newqueue = [];
    
    foreach ( element in level.queues[ queuename ] )
    {
        if ( !isdefined( element ) )
        {
            continue;
        }
        
        if ( !isdefined( first ) )
        {
            first = element;
            continue;
        }
        
        newqueue[ newqueue.size ] = element;
    }
    
    level.queues[ queuename ] = newqueue;
    return first;
}

// Namespace script
// Params 2
// Checksum 0x195aa015, Offset: 0x3a6
// Size: 0x38
function limitdecimalplaces( value, places )
{
    modifier = int( pow( 10, places ) );
    return floor( value * modifier ) / modifier;
}

// Namespace script
// Params 3
// Checksum 0x4573ca38, Offset: 0x3e7
// Size: 0x9b
function rounddecimalplaces( value, places, style = "nearest" )
{
    modifier = int( pow( 10, places ) );
    newvalue = value * modifier;
    
    if ( style == "up" )
    {
        var_bf2d4b7e8cc853b8 = ceil( newvalue );
    }
    else if ( style == "down" )
    {
        var_bf2d4b7e8cc853b8 = floor( newvalue );
    }
    else
    {
        var_bf2d4b7e8cc853b8 = newvalue + 0.5;
    }
    
    newvalue = int( var_bf2d4b7e8cc853b8 ) / modifier;
    return newvalue;
}

// Namespace script
// Params 1
// Checksum 0x3b43630e, Offset: 0x48b
// Size: 0x96
function stringtofloat( stringval )
{
    floatelements = strtok( stringval, "." );
    floatval = int( floatelements[ 0 ] );
    
    if ( isdefined( floatelements[ 1 ] ) )
    {
        modifier = 1;
        
        for ( i = 0; i < floatelements[ 1 ].size ; i++ )
        {
            modifier *= 0.1;
        }
        
        floatval += int( floatelements[ 1 ] ) * modifier;
    }
    
    if ( stringval[ 0 ] == "-" )
    {
        floatval *= -1;
    }
    
    return floatval;
}

// Namespace script
// Params 1
// Checksum 0x8322ebb9, Offset: 0x52a
// Size: 0x22
function delayentdelete( time )
{
    self endon( "death" );
    wait time;
    
    if ( isdefined( self ) )
    {
        self delete();
    }
}

// Namespace script
// Params 3, eflags: 0x40 variadic
// Checksum 0xb9106b70, Offset: 0x554
// Size: 0x3e
function bufferednotify( notification, ... )
{
    thread bufferednotify_internal( notification, { #params:vararg, #count:varargcount } );
}

// Namespace script
// Params 0, eflags: 0x4
// Checksum 0x31894638, Offset: 0x59a
// Size: 0x69
function private function_284c2ae5583007bc()
{
    var_1f68bf13bc904879 = level.gametypebundle.var_d5a83b7f03ff465e ?? #"hash_dfcb6a2fdbc977b0";
    
    switch ( var_1f68bf13bc904879 )
    {
        case #"hash_dfcb6a2fdbc977b0":
        default:
            waittillframeend();
            return;
        case #"hash_16a4c2b6f68453e0":
            do
            {
                waitframe();
                waittillframeend();
            }
            while ( function_7cae34dfec48a6d1() );
            
            return;
    }
}

// Namespace script
// Params 0, eflags: 0x4
// Checksum 0xd81f8aa5, Offset: 0x60b
// Size: 0x69
function private function_de23bc0ca8d2eba()
{
    var_1f68bf13bc904879 = level.gametypebundle.var_d5a83b7f03ff465e ?? #"hash_dfcb6a2fdbc977b0";
    
    switch ( var_1f68bf13bc904879 )
    {
        case #"hash_dfcb6a2fdbc977b0":
        default:
            waitframe();
            return;
        case #"hash_16a4c2b6f68453e0":
            do
            {
                waitframe();
                waittillframeend();
            }
            while ( function_7cae34dfec48a6d1() );
            
            return;
    }
}

// Namespace script
// Params 2, eflags: 0x4
// Checksum 0xd86881d2, Offset: 0x67c
// Size: 0x106
function private bufferednotify_internal( notification, var_3e69b0b43bd155b7 )
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    uniqueendonnotify = "bufferedNotify_" + notification;
    self notify( uniqueendonnotify );
    self endon( uniqueendonnotify );
    
    if ( !isdefined( self.bufferednotifications ) )
    {
        self.bufferednotifications = [];
    }
    
    if ( !isdefined( self.bufferednotifications[ notification ] ) )
    {
        self.bufferednotifications[ notification ] = [];
    }
    
    self.bufferednotifications[ notification ][ self.bufferednotifications[ notification ].size ] = var_3e69b0b43bd155b7;
    function_284c2ae5583007bc();
    
    while ( isdefined( self ) && self.bufferednotifications[ notification ].size > 0 )
    {
        var_3e69b0b43bd155b7 = self.bufferednotifications[ notification ][ 0 ];
        self notify( notification, flat_args( var_3e69b0b43bd155b7.params, var_3e69b0b43bd155b7.count ) );
        self.bufferednotifications[ notification ][ 0 ] = undefined;
        function_cdc669dbc8ea2101( self.bufferednotifications[ notification ] );
        function_de23bc0ca8d2eba();
    }
}

// Namespace script
// Params 2
// Checksum 0x245943c9, Offset: 0x78a
// Size: 0x40
function notifyafterframeend( waittillmsg, var_e3a1804111bee4c8 )
{
    assert( isdefined( waittillmsg ), "<dev string:x24>" );
    assert( isdefined( var_e3a1804111bee4c8 ), "<dev string:x5f>" );
    self waittill( waittillmsg );
    waittillframeend();
    self notify( var_e3a1804111bee4c8 );
}

// Namespace script
// Params 3
// Checksum 0xce7e3a0, Offset: 0x7d2
// Size: 0x32
function delaysetclientomnvar( delaytime, omnvar, value )
{
    self endon( "disconnect" );
    wait delaytime;
    self setclientomnvar( omnvar, value );
}

// Namespace script
// Params 2
// Checksum 0x126799fb, Offset: 0x80c
// Size: 0x49
function strip_suffix( lookupstring, stripstring )
{
    if ( lookupstring.size <= stripstring.size )
    {
        return lookupstring;
    }
    
    if ( getsubstr( lookupstring, lookupstring.size - stripstring.size, lookupstring.size ) == stripstring )
    {
        return getsubstr( lookupstring, 0, lookupstring.size - stripstring.size );
    }
    
    return lookupstring;
}

// Namespace script
// Params 2
// Checksum 0x6c048696, Offset: 0x85e
// Size: 0x45
function vectortoanglessafe( forward, up )
{
    right = vectorcross( forward, up );
    up = vectorcross( right, forward );
    angles = axistoangles( forward, right, up );
    return angles;
}

// Namespace script
// Params 1
// Checksum 0xcb751d3c, Offset: 0x8ac
// Size: 0x94
function heap( type )
{
    assert( type == "<dev string:x97>" || type == "<dev string:x9e>", "<dev string:xa5>" );
    h = spawnstruct();
    h.nvals = 0;
    h.vals = [];
    
    if ( type == "max" )
    {
        h.swap = &_heaplessthan;
    }
    else if ( type == "min" )
    {
        h.swap = &_heapgreaterthan;
    }
    
    return h;
}

// Namespace script
// Params 0
// Checksum 0x72cac05c, Offset: 0x949
// Size: 0xb
function heapsize()
{
    return self.nvals;
}

// Namespace script
// Params 0
// Checksum 0x82e3540d, Offset: 0x95d
// Size: 0xe
function heappeek()
{
    return self.vals[ 1 ];
}

// Namespace script
// Params 0
// Checksum 0x8dec70ea, Offset: 0x974
// Size: 0xba
function heappop()
{
    if ( self.nvals == 0 )
    {
        return undefined;
    }
    
    if ( self.nvals == 1 )
    {
        val = self.vals[ 1 ];
        self.vals[ 1 ] = undefined;
        self.nvals = 0;
        return val;
    }
    
    val = self.vals[ 1 ];
    self.vals[ 1 ] = self.vals[ self.nvals ];
    self.vals[ self.nvals ] = undefined;
    _heapify( 1 );
    self.nvals -= 1;
    return val;
}

// Namespace script
// Params 1
// Checksum 0xed515bdd, Offset: 0xa36
// Size: 0xcf
function heapinsert( val )
{
    self.vals[ self.nvals + 1 ] = val;
    i = self.nvals + 1;
    parent = _heapparent( i );
    
    while ( isdefined( parent ) )
    {
        if ( [[ self.swap ]]( parent, i ) )
        {
            temp = self.vals[ parent ];
            self.vals[ parent ] = self.vals[ i ];
            self.vals[ i ] = temp;
            i = parent;
            parent = _heapparent( i );
            continue;
        }
        
        break;
    }
    
    self.nvals += 1;
}

/#

    // Namespace script
    // Params 0
    // Checksum 0x8b68121c, Offset: 0xb0d
    // Size: 0x98, Type: dev
    function printheap()
    {
        print( "<dev string:xc9>" );
        vals = [];
        size = self.nvals;
        
        for ( i = 0; i < size ; i++ )
        {
            vals[ i ] = heappop();
        }
        
        for ( i = 0; i < vals.size ; i++ )
        {
            heapinsert( vals[ i ] );
        }
        
        for ( i = 0; i < vals.size ; i++ )
        {
            print( vals[ i ] + "<dev string:xd0>" );
        }
        
        print( "<dev string:xc9>" );
    }

#/

// Namespace script
// Params 2
// Checksum 0xae5e35d1, Offset: 0xbad
// Size: 0x2e, Type: bool
function _heapgreaterthan( i, j )
{
    return self.vals[ i ] > self.vals[ j ];
}

// Namespace script
// Params 2
// Checksum 0xc66ba6ef, Offset: 0xbe4
// Size: 0x2e, Type: bool
function _heaplessthan( i, j )
{
    return self.vals[ i ] < self.vals[ j ];
}

// Namespace script
// Params 1
// Checksum 0x6f967da6, Offset: 0xc1b
// Size: 0x11b
function _heapify( i )
{
    lc = _heapleftchild( i );
    rc = _heaprightchild( i );
    newidx = undefined;
    swapleft = 0;
    
    if ( isdefined( lc ) )
    {
        swapleft = self [[ self.swap ]]( i, lc );
    }
    
    swapright = 0;
    
    if ( isdefined( rc ) )
    {
        swapright = self [[ self.swap ]]( i, rc );
    }
    
    if ( !swapleft && !swapright )
    {
        return;
    }
    else if ( swapleft && !swapright )
    {
        newidx = lc;
    }
    else if ( !swapleft && swapright )
    {
        newidx = rc;
    }
    else if ( self [[ self.swap ]]( lc, rc ) )
    {
        newidx = rc;
    }
    else
    {
        newidx = lc;
    }
    
    temp = self.vals[ i ];
    self.vals[ i ] = self.vals[ newidx ];
    self.vals[ newidx ] = temp;
    _heapify( newidx );
}

// Namespace script
// Params 1
// Checksum 0x78b24443, Offset: 0xd3e
// Size: 0x27
function _heapleftchild( i )
{
    if ( !isdefined( self.vals[ 2 * i ] ) )
    {
        return undefined;
    }
    
    return 2 * i;
}

// Namespace script
// Params 1
// Checksum 0xd056df93, Offset: 0xd6e
// Size: 0x2d
function _heaprightchild( i )
{
    if ( !isdefined( self.vals[ 2 * i + 1 ] ) )
    {
        return undefined;
    }
    
    return 2 * i + 1;
}

// Namespace script
// Params 1
// Checksum 0x5355d07, Offset: 0xda4
// Size: 0x23
function _heapparent( i )
{
    if ( i == 1 )
    {
        return undefined;
    }
    
    return int( floor( i / 2 ) );
}

// Namespace script
// Params 2
// Checksum 0xb31a7982, Offset: 0xdd0
// Size: 0x23, Type: bool
function isnumbermultipleof( number, factor )
{
    return number > 0 && number % factor == 0;
}

// Namespace script
// Params 1
// Checksum 0x51f2cf2, Offset: 0xdfc
// Size: 0x13
function demoforcesre( message )
{
    throw( message );
}

// Namespace script
// Params 1
// Checksum 0x3b98c46f, Offset: 0xe17
// Size: 0x1d
function function_2e2007575f92910d( message )
{
    recordeventforsreparser( "sre_error_event", "SRE LOGGING", message );
}

// Namespace script
// Params 2
// Checksum 0x53e699eb, Offset: 0xe3c
// Size: 0x30
function function_789a02669a1a12e9( dvar, message )
{
    if ( getdvarint( dvar, 0 ) )
    {
        recordeventforsreparser( "sre_error_event", "SRE LOGGING DVAR GATED", message );
    }
}

