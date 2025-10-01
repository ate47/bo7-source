#using scripts\common\anim;
#using scripts\common\createfx;
#using scripts\common\exploder;
#using scripts\common\ui;
#using scripts\common\utility;
#using scripts\common\vehicle;
#using scripts\engine\flags;
#using scripts\engine\trace;

#namespace utility;

// Namespace utility
// Params 3, eflags: 0x40 variadic
// Checksum 0x61a7d75d, Offset: 0x903
// Size: 0x43
function noself_func( func, ... )
{
    if ( !isdefined( level.func[ func ] ) )
    {
        return;
    }
    
    builtin [[ level.func[ func ] ]]( flat_args( vararg, varargcount ) );
}

// Namespace utility
// Params 3, eflags: 0x40 variadic
// Checksum 0x7e588f19, Offset: 0x94e
// Size: 0x43
function noself_func_return( func, ... )
{
    if ( !isdefined( level.func[ func ] ) )
    {
        return undefined;
    }
    
    return builtin [[ level.func[ func ] ]]( flat_args( vararg, varargcount ) );
}

// Namespace utility
// Params 3, eflags: 0x40 variadic
// Checksum 0xce67973d, Offset: 0x99a
// Size: 0x43
function self_func( func, ... )
{
    if ( !isdefined( level.func[ func ] ) )
    {
        return;
    }
    
    return self builtin [[ level.func[ func ] ]]( flat_args( vararg, varargcount ) );
}

// Namespace utility
// Params 3, eflags: 0x40 variadic
// Checksum 0xb04dedc6, Offset: 0x9e6
// Size: 0x43
function script_func( func, ... )
{
    if ( !isdefined( level.func[ func ] ) )
    {
        return;
    }
    
    return self [[ level.func[ func ] ]]( flat_args( vararg, varargcount ) );
}

// Namespace utility
// Params 1
// Checksum 0x36ed32d4, Offset: 0xa32
// Size: 0x3a
function randomvector( num )
{
    return ( randomfloat( num ) - num * 0.5, randomfloat( num ) - num * 0.5, randomfloat( num ) - num * 0.5 );
}

// Namespace utility
// Params 2
// Checksum 0xefc0d358, Offset: 0xa75
// Size: 0x9b
function randomvectorrange( num_min, num_max )
{
    assert( isdefined( num_min ) );
    assert( isdefined( num_max ) );
    x = randomfloatrange( num_min, num_max );
    
    if ( randomint( 2 ) == 0 )
    {
        x *= -1;
    }
    
    y = randomfloatrange( num_min, num_max );
    
    if ( randomint( 2 ) == 0 )
    {
        y *= -1;
    }
    
    z = randomfloatrange( num_min, num_max );
    
    if ( randomint( 2 ) == 0 )
    {
        z *= -1;
    }
    
    return ( x, y, z );
}

// Namespace utility
// Params 2
// Checksum 0x60e6d79a, Offset: 0xb19
// Size: 0x62
function randomvectorrangeflat( num_min, num_max )
{
    x = randomfloatrange( num_min, num_max );
    
    if ( randomint( 2 ) == 0 )
    {
        x *= -1;
    }
    
    y = randomfloatrange( num_min, num_max );
    
    if ( randomint( 2 ) == 0 )
    {
        y *= -1;
    }
    
    return ( x, y, 0 );
}

// Namespace utility
// Params 1
// Checksum 0x1076f008, Offset: 0xb84
// Size: 0x1a
function sign( x )
{
    return x >= 0 ? 1 : -1;
}

// Namespace utility
// Params 1
// Checksum 0x5c257922, Offset: 0xba7
// Size: 0x2a
function vectorsign( vec )
{
    return ( sign( vec[ 0 ] ), sign( vec[ 1 ] ), sign( vec[ 2 ] ) );
}

// Namespace utility
// Params 0
// Checksum 0xd9c16105, Offset: 0xbda
// Size: 0x68
function randomonunitsphere()
{
    theta = randomfloat( 180 );
    phi = randomfloat( 360 );
    x = cos( phi ) * cos( theta );
    y = cos( phi ) * sin( theta );
    z = sin( phi );
    return ( x, y, z );
}

// Namespace utility
// Params 0
// Checksum 0x3d57d908, Offset: 0xc4b
// Size: 0x50
function function_9e0df7b136ab833c()
{
    angle = randomfloat( 360 );
    dist = randomfloat( 1 );
    x = cos( angle ) * dist;
    y = sin( angle ) * dist;
    return ( x, y, 0 );
}

// Namespace utility
// Params 0
// Checksum 0x62cc201c, Offset: 0xca4
// Size: 0x45
function function_d8f5310928e6277f()
{
    while ( true )
    {
        x = randomfloatrange( -1, 1 );
        y = randomfloatrange( -1, 1 );
        
        if ( x * x + y * y < 1 )
        {
            return ( x, y, 0 );
        }
    }
}

// Namespace utility
// Params 1
// Checksum 0xf1a5f8db, Offset: 0xcf1
// Size: 0x4c
function get_enemy_team( team )
{
    assert( team != "<dev string:x24>", "<dev string:x2f>" );
    teams = [];
    teams[ "axis" ] = "allies";
    teams[ "allies" ] = "axis";
    return teams[ team ];
}

// Namespace utility
// Params 1
// Checksum 0x92b1f14, Offset: 0xd46
// Size: 0x37
function clear_exception( type )
{
    assert( isdefined( self.exception[ type ] ) );
    self.exception[ type ] = anim.defaultexception;
}

// Namespace utility
// Params 0
// Checksum 0x557efc74, Offset: 0xd85
// Size: 0xb, Type: bool
function cointoss()
{
    return randomint( 100 ) >= 50;
}

// Namespace utility
// Params 1
// Checksum 0x4c07b527, Offset: 0xd99
// Size: 0x25, Type: bool
function percent_chance( probability )
{
    assert( isdefined( probability ), "<dev string:x4e>" );
    return randomfloat( 100 ) < probability;
}

// Namespace utility
// Params 2
// Checksum 0x65c5d36f, Offset: 0xdc7
// Size: 0x66
function choose_from_weighted_array( values, weights )
{
    assert( values.size == weights.size );
    randomval = randomint( weights[ weights.size - 1 ] + 1 );
    
    for ( i = 0; i < weights.size ; i++ )
    {
        if ( randomval <= weights[ i ] )
        {
            return values[ i ];
        }
    }
}

// Namespace utility
// Params 3
// Checksum 0xb5bf56e2, Offset: 0xe35
// Size: 0x5e
function function_e7229273e829f2f9( minimums, maximums, weights )
{
    assert( minimums.size == maximums.size );
    assert( minimums.size == weights.size );
    return { #weights:weights, #maximums:maximums, #minimums:minimums };
}

// Namespace utility
// Params 0
// Checksum 0x53ab9312, Offset: 0xe9c
// Size: 0x10b
function function_6bc2a113a01b4ad3()
{
    totalweight = array_sum( self.weights );
    pivotvalue = randomfloat( totalweight );
    pivotlowerbound = 0;
    pivotupperbound = 0;
    
    for ( i = 0; i < self.weights.size ; i++ )
    {
        weight = self.weights[ i ];
        minimum = self.minimums[ i ];
        maximum = self.maximums[ i ];
        pivotupperbound += weight;
        
        if ( pivotlowerbound <= pivotvalue && pivotvalue < pivotupperbound )
        {
            return randomfloatrange( minimum, maximum );
        }
        
        pivotlowerbound = pivotupperbound;
    }
    
    throw( "histogramSample() did not select any range. This should not be possible." );
    return randomfloatrange( self.minimums[ self.minimums.size - 1 ], self.maximums[ self.maximums.size - 1 ] );
}

// Namespace utility
// Params 2
// Checksum 0x3c312d4e, Offset: 0xfb0
// Size: 0x41
function waittill_string( msg, ent )
{
    if ( msg != "death" )
    {
        self endon( "death" );
    }
    
    ent endon( "die" );
    self waittill( msg );
    ent notify( "returned", msg );
}

// Namespace utility
// Params 2
// Checksum 0x32653004, Offset: 0xff9
// Size: 0x2e
function waittill_string_no_endon_death( msg, ent )
{
    ent endon( "die" );
    self waittill( msg );
    ent notify( "returned", msg );
}

// Namespace utility
// Params 2
// Checksum 0x43383018, Offset: 0x102f
// Size: 0x3a
function function_cbd0402bd3cd13f1( string, ent )
{
    ent endon( "die" );
    self waittill( string, msg );
    ent notify( "returned", msg );
}

// Namespace utility
// Params 2, eflags: 0x40 variadic
// Checksum 0xa0af02a8, Offset: 0x1071
// Size: 0xe6
function waittill_multiple( ... )
{
    self endon( "death" );
    ent = spawnstruct();
    ent.threads = 0;
    
    foreach ( varstring in vararg )
    {
        childthread waittill_string( varstring, ent );
        ent.threads++;
    }
    
    while ( ent.threads )
    {
        ent waittill( "returned" );
        ent.threads--;
    }
    
    ent notify( "die" );
}

// Namespace utility
// Params 3
// Checksum 0xe05f42ad, Offset: 0x115f
// Size: 0x59
function waittillmatch_string( stringmatch, msg, ent )
{
    if ( stringmatch != "death" && msg != "death" )
    {
        self endon( "death" );
    }
    
    ent endon( "die" );
    self waittillmatch( stringmatch, msg );
    ent notify( "returned", msg );
}

// Namespace utility
// Params 3
// Checksum 0xe8f20a90, Offset: 0x11c0
// Size: 0x3a
function function_8037626f98cd5225( stringmatch, msg, ent )
{
    ent endon( "die" );
    self waittillmatch( stringmatch, msg );
    ent notify( "returned", msg );
}

// Namespace utility
// Params 3
// Checksum 0x1305e156, Offset: 0x1202
// Size: 0x33
function waittillmatch_notify( anim_name, match_msg, notify_str )
{
    self endon( "death" );
    self waittillmatch( anim_name, match_msg );
    self notify( notify_str );
}

// Namespace utility
// Params 2, eflags: 0x40 variadic
// Checksum 0x13154af0, Offset: 0x123d
// Size: 0xd8
function waittill_any_return( ... )
{
    assert( varargcount >= 1 );
    
    if ( !arraycontains( vararg, "death" ) )
    {
        self endon( "death" );
    }
    
    ent = spawnstruct();
    
    foreach ( varstring in vararg )
    {
        childthread waittill_string( varstring, ent );
    }
    
    ent waittill( "returned", msg );
    ent notify( "die" );
    return msg;
}

// Namespace utility
// Params 3, eflags: 0x40 variadic
// Checksum 0xf6cc4761, Offset: 0x131e
// Size: 0xd1
function waittillmatch_any_return( stringmatch, ... )
{
    if ( stringmatch != "death" )
    {
        self endon( "death" );
    }
    
    ent = spawnstruct();
    
    foreach ( varstring in vararg )
    {
        childthread function_8037626f98cd5225( stringmatch, varstring, ent );
    }
    
    ent waittill( "returned", msg );
    ent notify( "die" );
    return msg;
}

// Namespace utility
// Params 2, eflags: 0x40 variadic
// Checksum 0x7d530981, Offset: 0x13f8
// Size: 0xb4
function waittill_any_return_no_endon_death( ... )
{
    ent = spawnstruct();
    
    foreach ( varstring in vararg )
    {
        childthread waittill_string_no_endon_death( varstring, ent );
    }
    
    ent waittill( "returned", msg );
    ent notify( "die" );
    return msg;
}

// Namespace utility
// Params 1
// Checksum 0xa913cf80, Offset: 0x14b5
// Size: 0x4e
function waittill_any_in_array( string_array )
{
    assert( string_array.size > 0, "<dev string:x75>" );
    
    for ( i = 0; i < string_array.size - 1 ; i++ )
    {
        self endon( string_array[ i ] );
    }
    
    self waittill( string_array[ string_array.size - 1 ] );
}

// Namespace utility
// Params 1
// Checksum 0xc4c0cd09, Offset: 0x150b
// Size: 0xc2
function function_86c5bdf01bdba64e( var_926e6a33547a89f5 )
{
    assert( isdefined( var_926e6a33547a89f5 ) );
    assert( var_926e6a33547a89f5.size > 0 );
    ent = spawnstruct();
    ent.threads = 0;
    
    for ( i = 0; i < var_926e6a33547a89f5.size ; i++ )
    {
        pair = var_926e6a33547a89f5[ i ];
        pair.ent childthread function_b7a2c61114d584c7( pair.msg_array, ent );
        ent.threads++;
    }
    
    while ( ent.threads )
    {
        ent waittill( "returned" );
        ent.threads--;
    }
    
    ent notify( "die" );
}

// Namespace utility
// Params 2
// Checksum 0xc9b1ca96, Offset: 0x15d5
// Size: 0x4d
function function_b7a2c61114d584c7( msg_array, ent )
{
    assert( isdefined( msg_array ) && isdefined( ent ) );
    assert( msg_array.size > 0 );
    self endon( "die" );
    waittill_any_in_array( msg_array );
    ent notify( "returned" );
}

// Namespace utility
// Params 1
// Checksum 0xa6b8ab64, Offset: 0x162a
// Size: 0xd3
function waittill_any_in_array_return( string_array )
{
    ent = spawnstruct();
    hasdeath = 0;
    
    foreach ( string in string_array )
    {
        childthread waittill_string( string, ent );
        
        if ( string == "death" )
        {
            hasdeath = 1;
        }
    }
    
    if ( !hasdeath )
    {
        self endon( "death" );
    }
    
    ent waittill( "returned", msg );
    ent notify( "die" );
    return msg;
}

// Namespace utility
// Params 1
// Checksum 0xf10160f1, Offset: 0x1706
// Size: 0xab
function waittill_any_in_array_return_no_endon_death( string_array )
{
    ent = spawnstruct();
    
    foreach ( string in string_array )
    {
        childthread waittill_string_no_endon_death( string, ent );
    }
    
    ent waittill( "returned", msg );
    ent notify( "die" );
    return msg;
}

// Namespace utility
// Params 2
// Checksum 0x3d2d568a, Offset: 0x17ba
// Size: 0xe6
function waittill_any_in_array_or_timeout( string_array, timeout )
{
    ent = spawnstruct();
    hasdeath = 0;
    
    foreach ( string in string_array )
    {
        childthread waittill_string( string, ent );
        
        if ( string == "death" )
        {
            hasdeath = 1;
        }
    }
    
    if ( !hasdeath )
    {
        self endon( "death" );
    }
    
    ent childthread timeout_struct( timeout );
    ent waittill( "returned", msg );
    ent notify( "die" );
    return msg;
}

// Namespace utility
// Params 2
// Checksum 0x8318147a, Offset: 0x18a9
// Size: 0xbe
function waittill_any_in_array_or_timeout_no_endon_death( string_array, timeout )
{
    ent = spawnstruct();
    
    foreach ( string in string_array )
    {
        childthread waittill_string_no_endon_death( string, ent );
    }
    
    ent thread timeout_struct( timeout );
    ent waittill( "returned", msg );
    ent notify( "die" );
    return msg;
}

// Namespace utility
// Params 1
// Checksum 0x45f8a230, Offset: 0x1970
// Size: 0x4b
function waittill_all_in_array( string_array )
{
    assert( isdefined( string_array ) );
    assert( isarray( string_array ) );
    
    while ( string_array.size )
    {
        msg = waittill_any_in_array_return( string_array );
        string_array = arrayremove( string_array, msg );
    }
}

// Namespace utility
// Params 3, eflags: 0x40 variadic
// Checksum 0x87022c7, Offset: 0x19c3
// Size: 0xde
function waittill_any_timeout( timeout, ... )
{
    if ( !arraycontains( vararg, "death" ) )
    {
        self endon( "death" );
    }
    
    ent = spawnstruct();
    
    foreach ( varstring in vararg )
    {
        childthread waittill_string( varstring, ent );
    }
    
    ent childthread timeout_struct( timeout );
    ent waittill( "returned", msg );
    ent notify( "die" );
    return msg;
}

// Namespace utility
// Params 1
// Checksum 0x92027ed9, Offset: 0x1aaa
// Size: 0x2f
function timeout_struct( delay )
{
    self endon( "die" );
    
    if ( delay > 0 )
    {
        wait delay;
    }
    else
    {
        waitframe();
    }
    
    self notify( "returned", "timeout" );
}

// Namespace utility
// Params 3, eflags: 0x40 variadic
// Checksum 0x55979eb5, Offset: 0x1ae1
// Size: 0xc7
function waittill_any_timeout_no_endon_death( timeout, ... )
{
    ent = spawnstruct();
    
    foreach ( varstring in vararg )
    {
        childthread waittill_string_no_endon_death( varstring, ent );
    }
    
    ent childthread timeout_struct( timeout );
    ent waittill( "returned", msg );
    ent notify( "die" );
    return msg;
}

// Namespace utility
// Params 3, eflags: 0x40 variadic
// Checksum 0xd41bf6ad, Offset: 0x1bb1
// Size: 0x9c
function waittill_any( string1, ... )
{
    assert( isdefined( string1 ) );
    
    foreach ( otherstring in vararg )
    {
        self endon( otherstring );
    }
    
    self waittill( string1 );
}

// Namespace utility
// Params 4, eflags: 0x40 variadic
// Checksum 0xd018d6ec, Offset: 0x1c55
// Size: 0x8e
function waittill_any_ents( ent1, string1, ... )
{
    assert( isdefined( ent1 ) );
    assert( isdefined( string1 ) );
    
    /#
        function_8ae6ad9600816017( flat_args( vararg, varargcount ) );
    #/
    
    i = 0;
    
    while ( i < varargcount )
    {
        if ( isdefined( vararg[ i ] ) && isdefined( vararg[ i + 1 ] ) )
        {
            vararg[ i ] endon( vararg[ i + 1 ] );
        }
        
        i += 2;
    }
    
    ent1 waittill( string1 );
}

// Namespace utility
// Params 3, eflags: 0x40 variadic
// Checksum 0x172c2db5, Offset: 0x1ceb
// Size: 0x78
function function_1e67f95b5bdb410( delay, ... )
{
    assert( isdefined( delay ) );
    
    /#
        function_8ae6ad9600816017( flat_args( vararg, varargcount ) );
    #/
    
    i = 0;
    
    while ( i < varargcount )
    {
        if ( isdefined( vararg[ i ] ) && isdefined( vararg[ i + 1 ] ) )
        {
            vararg[ i ] endon( vararg[ i + 1 ] );
        }
        
        i += 2;
    }
    
    wait delay;
}

// Namespace utility
// Params 2, eflags: 0x40 variadic
// Checksum 0x474007fd, Offset: 0x1d6b
// Size: 0x9b
function waittill_any_ents_return( ... )
{
    /#
        function_8ae6ad9600816017( flat_args( vararg, varargcount ) );
    #/
    
    self endon( "death" );
    ent = spawnstruct();
    i = 0;
    
    while ( i < varargcount )
    {
        if ( isdefined( vararg[ i ] ) && isdefined( vararg[ i + 1 ] ) )
        {
            vararg[ i ] childthread waittill_string( vararg[ i + 1 ], ent );
        }
        
        i += 2;
    }
    
    ent waittill( "returned", msg );
    ent notify( "die" );
    return msg;
}

// Namespace utility
// Params 2, eflags: 0x40 variadic
// Checksum 0x8ccaa878, Offset: 0x1e0f
// Size: 0x9b
function function_cbf292967d35439( ... )
{
    /#
        function_8ae6ad9600816017( flat_args( vararg, varargcount ) );
    #/
    
    self endon( "death" );
    ent = spawnstruct();
    i = 0;
    
    while ( i < varargcount )
    {
        if ( isdefined( vararg[ i ] ) && isdefined( vararg[ i + 1 ] ) )
        {
            vararg[ i ] childthread waittill_string_no_endon_death( vararg[ i + 1 ], ent );
        }
        
        i += 2;
    }
    
    ent waittill( "returned", msg );
    ent notify( "die" );
    return msg;
}

// Namespace utility
// Params 2
// Checksum 0x254694b, Offset: 0x1eb3
// Size: 0xd3
function function_247f4cc1c6c325d1( ents, string )
{
    assert( isdefined( ents ) );
    assert( isdefined( string ) );
    self endon( "death" );
    dummyent = spawnstruct();
    
    foreach ( ent in ents )
    {
        ent childthread function_cbd0402bd3cd13f1( string, dummyent );
    }
    
    dummyent waittill( "returned", msg );
    dummyent notify( "die" );
    return msg;
}

// Namespace utility
// Params 4, eflags: 0x40 variadic
// Checksum 0x6992948e, Offset: 0x1f8f
// Size: 0x141
function waittill_any_ents_array( ents, string1, ... )
{
    assert( isdefined( ents ) );
    assert( isarray( ents ) );
    assert( isdefined( ents[ 0 ] ) );
    assert( isdefined( string1 ) );
    
    foreach ( ent in ents )
    {
        if ( ent != ents[ 0 ] )
        {
            ent endon( string1 );
        }
        
        foreach ( varstring in vararg )
        {
            ent endon( varstring );
        }
    }
    
    ents[ 0 ] waittill( string1 );
}

// Namespace utility
// Params 1
// Checksum 0x3f79d106, Offset: 0x20d8
// Size: 0x2d
function wait_time_in_ms( waittimems )
{
    endtimems = gettime() + waittimems;
    
    while ( gettime() < endtimems )
    {
        waitframe();
    }
}

// Namespace utility
// Params 3
// Checksum 0xa7bb8a25, Offset: 0x210d
// Size: 0x1e1
function function_f87fb88f9c5add54( var_ab9ec058017ae13, var_2d0993b24a32cf26, time )
{
    level endon( "game_ended" );
    ent = spawnstruct();
    ent.threads = 0;
    
    foreach ( endonnotify in var_2d0993b24a32cf26 )
    {
        self endon( endonnotify );
    }
    
    foreach ( stringnotify in var_ab9ec058017ae13 )
    {
        childthread waittill_string_no_endon_death( stringnotify, ent );
        ent.threads++;
    }
    
    while ( ent.threads )
    {
        if ( ent.threads == 1 )
        {
            if ( isdefined( time ) )
            {
                ent childthread timeout_struct( time );
                ent waittill( "returned", msg );
                
                if ( msg == "timeout" )
                {
                    self notify( "monitorNotify", "timeout" );
                    return "timeout";
                }
                else
                {
                    self notify( "monitorNotify", "success" );
                    return "success";
                }
                
                ent.threads--;
            }
            
            continue;
        }
        
        ent waittill( "returned", message );
        ent.threads--;
    }
    
    ent notify( "die" );
    return "timeout";
}

// Namespace utility
// Params 0
// Checksum 0xaeab3916, Offset: 0x22f7
// Size: 0x54, Type: bool
function script_delay()
{
    if ( isdefined( self.script_delay ) )
    {
        wait self.script_delay;
        return true;
    }
    else if ( isdefined( self.script_delay_min ) && isdefined( self.script_delay_max ) )
    {
        wait randomfloatrange( self.script_delay_min, self.script_delay_max );
        return true;
    }
    
    return false;
}

// Namespace utility
// Params 0
// Checksum 0xcda31dc3, Offset: 0x2354
// Size: 0xd2
function script_wait()
{
    starttime = gettime();
    
    if ( isdefined( self.script_wait ) )
    {
        wait self.script_wait;
        
        if ( isdefined( self.script_wait_add ) )
        {
            self.script_wait += self.script_wait_add;
        }
    }
    else if ( isdefined( self.script_wait_min ) && isdefined( self.script_wait_max ) )
    {
        wait randomfloatrange( self.script_wait_min, self.script_wait_max );
        
        if ( isdefined( self.script_wait_add ) )
        {
            self.script_wait_min += self.script_wait_add;
            self.script_wait_max += self.script_wait_add;
        }
    }
    
    return gettime() - starttime;
}

// Namespace utility
// Params 1
// Checksum 0xf55937bf, Offset: 0x242f
// Size: 0x35
function ispointinwater( point )
{
    excludearray = [];
    return physics_querypoint( point, 0, physics_createcontents( [ "physicscontents_water" ] ), excludearray, "physicsquery_any" );
}

// Namespace utility
// Params 0
// Checksum 0xd5455cc0, Offset: 0x246d
// Size: 0x20, Type: bool
function isflashed()
{
    if ( !isdefined( self.flashendtime ) )
    {
        return false;
    }
    
    return gettime() < self.flashendtime;
}

// Namespace utility
// Params 0
// Checksum 0x3cb8aa2d, Offset: 0x2496
// Size: 0x20, Type: bool
function isstunned()
{
    if ( !isdefined( self.stunendtime ) )
    {
        return false;
    }
    
    return gettime() < self.stunendtime;
}

// Namespace utility
// Params 1
// Checksum 0xb17e8e07, Offset: 0x24bf
// Size: 0x19, Type: bool
function flag_exist( message )
{
    return isdefined( level.flag[ message ] );
}

// Namespace utility
// Params 1
// Checksum 0x17be4d8d, Offset: 0x24e1
// Size: 0x29, Type: bool
function flag( message )
{
    assert( isdefined( message ), "<dev string:xa0>" );
    return istrue( level.flag[ message ] );
}

// Namespace utility
// Params 1
// Checksum 0xa47f6d46, Offset: 0x2513
// Size: 0x85
function flag_init( message )
{
    if ( !isdefined( level.flag ) )
    {
        flags::init_flags();
    }
    
    /#
        if ( level.first_frame == -1 )
        {
            assert( !isdefined( level.flag[ message ] ), "<dev string:xd5>" + message );
        }
    #/
    
    level.flag[ message ] = 0;
    init_trigger_flags();
    
    if ( !isdefined( level.trigger_flags[ message ] ) )
    {
        level.trigger_flags[ message ] = [];
    }
}

// Namespace utility
// Params 2, eflags: 0x40 variadic
// Checksum 0xfd747325, Offset: 0x25a0
// Size: 0x15
function empty_init_func( ... )
{
    
}

// Namespace utility
// Params 2
// Checksum 0xe7f9ecd1, Offset: 0x25bd
// Size: 0x56
function flag_set( message, setter )
{
    if ( !flag_exist( message ) )
    {
        flag_init( message );
    }
    
    level.flag[ message ] = 1;
    set_trigger_flag_permissions( message );
    
    if ( isdefined( setter ) )
    {
        level notify( message, setter );
        return;
    }
    
    level notify( message );
}

// Namespace utility
// Params 5, eflags: 0x40 variadic
// Checksum 0x7f41cb31, Offset: 0x261b
// Size: 0x68
function function_5085f5ebc9b25c97( flags, delay, condition, ... )
{
    level endon( "game_ended" );
    
    while ( ![[ condition ]]( flat_args( vararg, varargcount ) ) )
    {
        wait delay;
    }
    
    if ( isarray( flags ) )
    {
        function_9f52c96b219c89ad( flags );
        return;
    }
    
    flag_set( flags );
}

// Namespace utility
// Params 1
// Checksum 0x136ded59, Offset: 0x268b
// Size: 0x7e
function function_9f52c96b219c89ad( flag_array )
{
    foreach ( flg in flag_array )
    {
        flag_set( flg );
    }
}

// Namespace utility
// Params 1
// Checksum 0x8890e882, Offset: 0x2711
// Size: 0x20
function flag_wait( msg )
{
    while ( !flag( msg ) )
    {
        level waittill( msg );
    }
}

// Namespace utility
// Params 1
// Checksum 0xcf75cc2d, Offset: 0x2739
// Size: 0x35
function flag_clear( message )
{
    if ( !flag( message ) )
    {
        return;
    }
    
    level.flag[ message ] = 0;
    set_trigger_flag_permissions( message );
    level notify( message );
}

// Namespace utility
// Params 1
// Checksum 0xb604ec86, Offset: 0x2776
// Size: 0x1f
function flag_waitopen( msg )
{
    while ( flag( msg ) )
    {
        level waittill( msg );
    }
}

// Namespace utility
// Params 1
// Checksum 0x7e1fc97c, Offset: 0x279d
// Size: 0xaa
function function_3bac2711d6c0a58f( flags )
{
    flags = function_5713d46873b29625( flags );
    
    foreach ( f in flags )
    {
        if ( !flag( f ) )
        {
            return;
        }
    }
    
    while ( true )
    {
        f = level waittill_any_in_array_return( flags );
        
        if ( !flag( f ) )
        {
            return;
        }
    }
}

// Namespace utility
// Params 2, eflags: 0x40 variadic
// Checksum 0xb1285d7c, Offset: 0x284f
// Size: 0x1e
function function_4aa7e07e71040519( ... )
{
    function_3bac2711d6c0a58f( vararg );
}

// Namespace utility
// Params 2
// Checksum 0x99a57f13, Offset: 0x2875
// Size: 0x6b
function trigger_on( name, type )
{
    if ( isdefined( name ) && isdefined( type ) )
    {
        ents = getentarray( name, type );
        array_thread( ents, &trigger_on_proc );
        vols = function_34bfb90dc1ed652d( name, type );
        array_thread( vols, &trigger_on_proc );
        return;
    }
    
    trigger_on_proc();
}

// Namespace utility
// Params 0
// Checksum 0x160c1a4e, Offset: 0x28e8
// Size: 0x12
function trigger_on_proc()
{
    self triggerenable();
    self.trigger_off = undefined;
}

// Namespace utility
// Params 2
// Checksum 0x5f70e8e7, Offset: 0x2902
// Size: 0x6b
function trigger_off( name, type )
{
    if ( isdefined( name ) && isdefined( type ) )
    {
        ents = getentarray( name, type );
        array_thread( ents, &trigger_off_proc );
        vols = function_34bfb90dc1ed652d( name, type );
        array_thread( vols, &trigger_off_proc );
        return;
    }
    
    trigger_off_proc();
}

// Namespace utility
// Params 0
// Checksum 0xc50386e7, Offset: 0x2975
// Size: 0x30
function trigger_off_proc()
{
    if ( issubstr( self.classname, "trigger" ) )
    {
        self triggerdisable();
    }
    
    self.trigger_off = 1;
    self notify( "trigger_off" );
}

// Namespace utility
// Params 1
// Checksum 0x7692481e, Offset: 0x29ad
// Size: 0x50
function set_trigger_flag_permissions( msg )
{
    if ( !isdefined( level.trigger_flags ) )
    {
        return;
    }
    
    level.trigger_flags[ msg ] = function_5713d46873b29625( level.trigger_flags[ msg ] );
    array_thread( level.trigger_flags[ msg ], &update_trigger_based_on_flags );
}

// Namespace utility
// Params 0
// Checksum 0x799f5ff4, Offset: 0x2a05
// Size: 0x176
function update_trigger_based_on_flags()
{
    true_on = 1;
    
    if ( isdefined( self.script_flag_true ) )
    {
        true_on = 0;
        tokens = create_flags_and_return_tokens( self.script_flag_true );
        
        foreach ( token in tokens )
        {
            if ( flag( token ) )
            {
                true_on = 1;
                break;
            }
        }
    }
    
    false_on = 1;
    
    if ( isdefined( self.script_flag_false ) )
    {
        tokens = create_flags_and_return_tokens( self.script_flag_false );
        
        foreach ( token in tokens )
        {
            if ( flag( token ) )
            {
                false_on = 0;
                break;
            }
        }
    }
    
    value = true_on && false_on ? 1 : 0;
    [[ level.trigger_func[ value ] ]]();
}

// Namespace utility
// Params 1
// Checksum 0x1ad399ce, Offset: 0x2b83
// Size: 0x5c
function create_flags_and_return_tokens( flags )
{
    tokens = strtok( flags, " " );
    
    for ( i = 0; i < tokens.size ; i++ )
    {
        if ( !isdefined( level.flag[ tokens[ i ] ] ) )
        {
            flag_init( tokens[ i ] );
        }
    }
    
    return tokens;
}

// Namespace utility
// Params 0
// Checksum 0x62ff56cd, Offset: 0x2be8
// Size: 0x44
function init_trigger_flags()
{
    if ( !add_init_script( "trigger_flags", &init_trigger_flags ) )
    {
        return;
    }
    
    level.trigger_flags = [];
    level.trigger_func[ 1 ] = &trigger_on;
    level.trigger_func[ 0 ] = &trigger_off;
}

// Namespace utility
// Params 1
// Checksum 0x477f4930, Offset: 0x2c34
// Size: 0x593
function addstruct( struct )
{
    assert( isdefined( level.struct_class_names ), "<dev string:x100>" );
    
    if ( isdefined( struct.targetname ) )
    {
        if ( !isdefined( level.struct_class_names[ "targetname" ][ struct.targetname ] ) )
        {
            level.struct_class_names[ "targetname" ][ struct.targetname ] = [];
        }
        
        size = level.struct_class_names[ "targetname" ][ struct.targetname ].size;
        level.struct_class_names[ "targetname" ][ struct.targetname ][ size ] = struct;
    }
    
    if ( isdefined( struct.target ) )
    {
        if ( !isdefined( level.struct_class_names[ "target" ][ struct.target ] ) )
        {
            level.struct_class_names[ "target" ][ struct.target ] = [];
        }
        
        size = level.struct_class_names[ "target" ][ struct.target ].size;
        level.struct_class_names[ "target" ][ struct.target ][ size ] = struct;
    }
    
    if ( isdefined( struct.script_noteworthy ) )
    {
        if ( !isdefined( level.struct_class_names[ "script_noteworthy" ][ struct.script_noteworthy ] ) )
        {
            level.struct_class_names[ "script_noteworthy" ][ struct.script_noteworthy ] = [];
        }
        
        size = level.struct_class_names[ "script_noteworthy" ][ struct.script_noteworthy ].size;
        level.struct_class_names[ "script_noteworthy" ][ struct.script_noteworthy ][ size ] = struct;
    }
    
    if ( isdefined( struct.script_linkname ) )
    {
        if ( !isdefined( level.struct_class_names[ "script_linkname" ][ struct.script_linkname ] ) )
        {
            level.struct_class_names[ "script_linkname" ][ struct.script_linkname ] = [];
        }
        
        size = level.struct_class_names[ "script_linkname" ][ struct.script_linkname ].size;
        level.struct_class_names[ "script_linkname" ][ struct.script_linkname ][ size ] = struct;
    }
    
    if ( isdefined( struct.script_vehicleref ) )
    {
        if ( !isdefined( level.struct_class_names[ "script_vehicleref" ][ struct.script_vehicleref ] ) )
        {
            level.struct_class_names[ "script_vehicleref" ][ struct.script_vehicleref ] = [];
        }
        
        size = level.struct_class_names[ "script_vehicleref" ][ struct.script_vehicleref ].size;
        level.struct_class_names[ "script_vehicleref" ][ struct.script_vehicleref ][ size ] = struct;
    }
    
    if ( isdefined( struct.script_vehiclebundle ) )
    {
        if ( !isdefined( level.struct_class_names[ "script_vehiclebundle" ][ struct.script_vehiclebundle ] ) )
        {
            level.struct_class_names[ "script_vehiclebundle" ][ struct.script_vehiclebundle ] = [];
        }
        
        size = level.struct_class_names[ "script_vehiclebundle" ][ struct.script_vehiclebundle ].size;
        level.struct_class_names[ "script_vehiclebundle" ][ struct.script_vehiclebundle ][ size ] = struct;
    }
    
    if ( isdefined( struct.vehicletype ) )
    {
        hash = getxhashasset( struct.vehicletype );
        struct.vehicletype = hash;
        
        if ( !isdefined( level.struct_class_names[ "vehicletype" ][ hash ] ) )
        {
            level.struct_class_names[ "vehicletype" ][ hash ] = [];
        }
        
        size = level.struct_class_names[ "vehicletype" ][ hash ].size;
        level.struct_class_names[ "vehicletype" ][ hash ][ size ] = struct;
    }
    
    if ( isdefined( struct.variantname ) )
    {
        if ( !isdefined( level.struct_class_names[ "variantname" ][ struct.variantname ] ) )
        {
            level.struct_class_names[ "variantname" ][ struct.variantname ] = [];
        }
        
        size = level.struct_class_names[ "variantname" ][ struct.variantname ].size;
        level.struct_class_names[ "variantname" ][ struct.variantname ][ size ] = struct;
    }
    
    if ( isdefined( struct.agent_noteworthy ) )
    {
        if ( !isdefined( level.struct_class_names[ "script_agent_noteworthy" ][ struct.agent_noteworthy ] ) )
        {
            level.struct_class_names[ "script_agent_noteworthy" ][ struct.agent_noteworthy ] = [];
        }
        
        size = level.struct_class_names[ "script_agent_noteworthy" ][ struct.agent_noteworthy ].size;
        level.struct_class_names[ "script_agent_noteworthy" ][ struct.agent_noteworthy ][ size ] = struct;
    }
    
    if ( isdefined( struct.script_agent_noteworthy ) )
    {
        if ( !isdefined( level.struct_class_names[ "script_agent_noteworthy" ][ struct.script_agent_noteworthy ] ) )
        {
            level.struct_class_names[ "script_agent_noteworthy" ][ struct.script_agent_noteworthy ] = [];
        }
        
        size = level.struct_class_names[ "script_agent_noteworthy" ][ struct.script_agent_noteworthy ].size;
        level.struct_class_names[ "script_agent_noteworthy" ][ struct.script_agent_noteworthy ][ size ] = struct;
    }
}

// Namespace utility
// Params 0
// Checksum 0x855637e5, Offset: 0x31cf
// Size: 0x17
function function_a56cf359233cf85b()
{
    level.var_13b70b3b5724494f = 1;
    level.struct_class_names = undefined;
}

// Namespace utility
// Params 2
// Checksum 0x30574464, Offset: 0x31ee
// Size: 0x148
function getstruct( name, type = "targetname" )
{
    assert( isdefined( name ), "<dev string:x133>" );
    
    /#
        if ( !isdefined( level.struct_class_names ) )
        {
            if ( level.var_13b70b3b5724494f )
            {
                assertmsg( "<dev string:x14b>" );
            }
            else
            {
                assertmsg( "<dev string:x17e>" );
            }
        }
    #/
    
    array = level.struct_class_names[ type ][ name ];
    
    if ( !isdefined( array ) )
    {
        return undefined;
    }
    
    if ( array.size > 1 )
    {
        if ( isdefined( array[ 0 ] ) && isdefined( array[ 0 ].origin ) )
        {
            originstr1 = "" + array[ 0 ].origin;
        }
        else
        {
            originstr1 = "<UNKNOWN>";
        }
        
        if ( isdefined( array[ 1 ] ) && isdefined( array[ 1 ].origin ) )
        {
            originstr2 = "" + array[ 1 ].origin;
        }
        else
        {
            originstr2 = "<UNKNOWN>";
        }
        
        assertmsg( "<dev string:x1b1>" + type + "<dev string:x1e6>" + name + "<dev string:x1f4>" + originstr1 + "<dev string:x22a>" + originstr2 );
        return undefined;
    }
    
    return array[ 0 ];
}

// Namespace utility
// Params 2
// Checksum 0x41759321, Offset: 0x333f
// Size: 0x9a
function getstructarray( name, type = "targetname" )
{
    /#
        if ( !isdefined( level.struct_class_names ) )
        {
            if ( level.var_13b70b3b5724494f )
            {
                assertmsg( "<dev string:x14b>" );
            }
            else
            {
                assertmsg( "<dev string:x17e>" );
            }
        }
    #/
    
    if ( !isdefined( level.struct_class_names ) )
    {
        return [];
    }
    
    if ( !( isdefined( type ) && isdefined( name ) ) )
    {
        return [];
    }
    
    array = level.struct_class_names[ type ][ name ] ?? [];
    return array;
}

// Namespace utility
// Params 4
// Checksum 0x68e581ea, Offset: 0x33e2
// Size: 0x121
function function_b7f3d374aa10aa51( name, type, origin, radius )
{
    assert( isdefined( name ) && isdefined( type ), "<dev string:x233>" );
    assert( isdefined( origin ) && isdefined( radius ), "<dev string:x255>" );
    
    if ( !( isdefined( origin ) && isdefined( radius ) ) )
    {
        return [];
    }
    
    structarray = getstructarray( name, type );
    
    if ( structarray.size == 0 )
    {
        return [];
    }
    
    radiussquared = radius * radius;
    var_2f8bcafcfeb23a45 = [];
    
    foreach ( struct in structarray )
    {
        if ( distance2dsquared( origin, struct.origin ) <= radiussquared )
        {
            var_2f8bcafcfeb23a45[ var_2f8bcafcfeb23a45.size ] = struct;
        }
    }
    
    return var_2f8bcafcfeb23a45;
}

// Namespace utility
// Params 4
// Checksum 0xd7d2924b, Offset: 0x350c
// Size: 0x12d
function function_10d135e2ebebca29( name, type, origin, radius )
{
    assert( isdefined( name ) && isdefined( type ), "<dev string:x233>" );
    assert( isdefined( origin ) && isdefined( radius ), "<dev string:x255>" );
    
    if ( !( isdefined( origin ) && isdefined( radius ) ) )
    {
        return undefined;
    }
    
    structarray = getstructarray( name, type );
    
    if ( structarray.size == 0 )
    {
        return undefined;
    }
    
    bestdistance = radius * radius;
    beststruct = undefined;
    
    foreach ( struct in structarray )
    {
        distancesquared = distancesquared( origin, struct.origin );
        
        if ( distancesquared <= bestdistance )
        {
            bestdistance = distancesquared;
            beststruct = struct;
        }
    }
    
    return beststruct;
}

// Namespace utility
// Params 1
// Checksum 0x8b7fe1eb, Offset: 0x3642
// Size: 0x14b
function function_d25424f1ac9f1290( struct )
{
    if ( !isdefined( struct.var_a86c7b90ea136b4 ) )
    {
        return;
    }
    
    if ( !isdefined( level._fx ) )
    {
        level._fx = {};
    }
    
    if ( !isdefined( level._fx.ambientwar ) )
    {
        level._fx.ambientwar = {};
    }
    
    if ( !isdefined( level._fx.ambientwar.nodes ) )
    {
        level._fx.ambientwar.nodes = [];
    }
    
    if ( !isdefined( level._fx.ambientwar.nodes[ struct.var_a86c7b90ea136b4 ] ) )
    {
        level._fx.ambientwar.nodes[ struct.var_a86c7b90ea136b4 ] = [];
    }
    
    level._fx.ambientwar.nodes[ struct.var_a86c7b90ea136b4 ][ level._fx.ambientwar.nodes[ struct.var_a86c7b90ea136b4 ].size ] = struct;
}

// Namespace utility
// Params 3
// Checksum 0xd0a01528, Offset: 0x3795
// Size: 0x3d
function deletestructarray( value, key, delay )
{
    structs = getstructarray( value, key );
    deletestructarray_ref( structs, delay );
}

// Namespace utility
// Params 1
// Checksum 0xa9dbebb1, Offset: 0x37da
// Size: 0x3ce
function deletestruct_ref( struct )
{
    if ( !isdefined( struct ) )
    {
        return;
    }
    
    value = struct.script_linkname;
    
    if ( isdefined( level.struct_class_names[ "script_linkname" ] ) && isdefined( value ) && isdefined( level.struct_class_names[ "script_linkname" ][ value ] ) )
    {
        foreach ( i, _struct in level.struct_class_names[ "script_linkname" ][ value ] )
        {
            if ( struct == _struct )
            {
                level.struct_class_names[ "script_linkname" ][ value ][ i ] = undefined;
            }
        }
        
        if ( level.struct_class_names[ "script_linkname" ][ value ].size == 0 )
        {
            level.struct_class_names[ "script_linkname" ][ value ] = undefined;
        }
    }
    
    value = struct.script_noteworthy;
    
    if ( isdefined( level.struct_class_names[ "script_noteworthy" ] ) && isdefined( value ) && isdefined( level.struct_class_names[ "script_noteworthy" ][ value ] ) )
    {
        foreach ( i, _struct in level.struct_class_names[ "script_noteworthy" ][ value ] )
        {
            if ( struct == _struct )
            {
                level.struct_class_names[ "script_noteworthy" ][ value ][ i ] = undefined;
            }
        }
        
        if ( level.struct_class_names[ "script_noteworthy" ][ value ].size == 0 )
        {
            level.struct_class_names[ "script_noteworthy" ][ value ] = undefined;
        }
    }
    
    value = struct.target;
    
    if ( isdefined( level.struct_class_names[ "target" ] ) && isdefined( value ) && isdefined( level.struct_class_names[ "target" ][ value ] ) )
    {
        foreach ( i, _struct in level.struct_class_names[ "target" ][ value ] )
        {
            if ( struct == _struct )
            {
                level.struct_class_names[ "target" ][ value ][ i ] = undefined;
            }
        }
        
        if ( level.struct_class_names[ "target" ][ value ].size == 0 )
        {
            level.struct_class_names[ "target" ][ value ] = undefined;
        }
    }
    
    value = struct.targetname;
    
    if ( isdefined( level.struct_class_names[ "targetname" ] ) && isdefined( value ) && isdefined( level.struct_class_names[ "targetname" ][ value ] ) )
    {
        foreach ( i, _struct in level.struct_class_names[ "targetname" ][ value ] )
        {
            if ( struct == _struct )
            {
                level.struct_class_names[ "targetname" ][ value ][ i ] = undefined;
            }
        }
        
        if ( level.struct_class_names[ "targetname" ][ value ].size == 0 )
        {
            level.struct_class_names[ "targetname" ][ value ] = undefined;
        }
    }
}

// Namespace utility
// Params 2
// Checksum 0xf601440, Offset: 0x3bb0
// Size: 0x12f
function deletestructarray_ref( structs, delay )
{
    if ( !isdefined( structs ) || !isarray( structs ) || structs.size == 0 )
    {
        return;
    }
    
    if ( !isdefined( delay ) )
    {
        delay = 0;
    }
    
    delay = delay > 0 ? delay : 0;
    
    if ( delay > 0 )
    {
        foreach ( struct in structs )
        {
            deletestruct_ref( struct );
            wait delay;
        }
        
        return;
    }
    
    foreach ( struct in structs )
    {
        deletestruct_ref( struct );
    }
}

// Namespace utility
// Params 3
// Checksum 0xfb866458, Offset: 0x3ce7
// Size: 0x3f
function getstructarray_delete( value, key, delay )
{
    structs = getstructarray( value, key );
    deletestructarray_ref( structs, delay );
    return structs;
}

// Namespace utility
// Params 3
// Checksum 0x4f029e7, Offset: 0x3d2f
// Size: 0x57
function function_461c2723a6988991( name, key, ignore_spawners )
{
    ents = getentarray( name, key, ignore_spawners ?? 0 );
    
    if ( isdefined( level.struct_class_names ) )
    {
        ents = arraycombine( ents, getstructarray( name, key ) );
    }
    
    return ents;
}

// Namespace utility
// Params 3
// Checksum 0x22673475, Offset: 0x3d8f
// Size: 0x49
function getent_or_struct( name, key, ignore_spawners )
{
    var_7237854e3be197ca = getent( name, key, ignore_spawners ?? 0 );
    
    if ( isdefined( var_7237854e3be197ca ) )
    {
        return var_7237854e3be197ca;
    }
    
    return getstruct( name, key );
}

/#

    // Namespace utility
    // Params 1
    // Checksum 0x4448647f, Offset: 0x3de1
    // Size: 0x3d, Type: dev
    function fileprint_start( file )
    {
        filename = file;
        level.fileprint = 1;
        level.fileprintlinecount = 0;
        level.fileprint_filename = filename;
    }

    // Namespace utility
    // Params 0
    // Checksum 0x5cb85c24, Offset: 0x3e26
    // Size: 0x18, Type: dev
    function fileprint_map_start()
    {
        level.fileprint_mapentcount = 0;
        fileprint_map_header( 1 );
    }

    // Namespace utility
    // Params 1
    // Checksum 0x8a680af3, Offset: 0x3e46
    // Size: 0x61, Type: dev
    function fileprint_map_header( binclude_blank_worldspawn = 0 )
    {
        fileprint_launcher( "<dev string:x27d>" );
        fileprint_launcher( "<dev string:x288>" );
        fileprint_launcher( "<dev string:x2a6>" );
        
        if ( !binclude_blank_worldspawn )
        {
            return;
        }
        
        fileprint_map_entity_start();
        fileprint_map_keypairprint( "<dev string:x2b9>", "<dev string:x2c6>" );
        fileprint_map_entity_end();
    }

    // Namespace utility
    // Params 2
    // Checksum 0x8ded9be5, Offset: 0x3eaf
    // Size: 0x36, Type: dev
    function fileprint_map_keypairprint( key1, key2 )
    {
        fileprint_launcher( "<dev string:x2d4>" + key1 + "<dev string:x2d9>" + key2 + "<dev string:x2d4>" );
    }

    // Namespace utility
    // Params 0
    // Checksum 0xd0787339, Offset: 0x3eed
    // Size: 0x66, Type: dev
    function fileprint_map_entity_start()
    {
        assert( isdefined( level.fileprint_mapentcount ), "<dev string:x2e0>" );
        assert( !isdefined( level.fileprint_entitystart ) );
        level.fileprint_entitystart = 1;
        fileprint_launcher( "<dev string:x318>" + level.fileprint_mapentcount );
        fileprint_launcher( "<dev string:x323>" );
        level.fileprint_mapentcount++;
    }

    // Namespace utility
    // Params 0
    // Checksum 0xeb9d779e, Offset: 0x3f5b
    // Size: 0x1b, Type: dev
    function fileprint_map_entity_end()
    {
        fileprint_launcher( "<dev string:x328>" );
        level.fileprint_entitystart = undefined;
    }

    // Namespace utility
    // Params 1
    // Checksum 0xcaff2903, Offset: 0x3f7e
    // Size: 0x43, Type: dev
    function fileprint_radiant_vec( vector )
    {
        string = "<dev string:x32d>" + vector[ 0 ] + "<dev string:x331>" + vector[ 1 ] + "<dev string:x331>" + vector[ 2 ] + "<dev string:x32d>";
        return string;
    }

#/

// Namespace utility
// Params 4, eflags: 0x40 variadic
// Checksum 0x628c1541, Offset: 0x3fc9
// Size: 0x34
function call_on_notify_no_endon_death( notifystring, method, ... )
{
    childthread call_on_notify_proc( notifystring, method, varargcount, vararg );
}

// Namespace utility
// Params 4, eflags: 0x40 variadic
// Checksum 0xbe830d77, Offset: 0x4005
// Size: 0x3c
function call_on_notify( notifystring, method, ... )
{
    self endon( "death_or_disconnect" );
    childthread call_on_notify_proc( notifystring, method, varargcount, vararg );
}

// Namespace utility
// Params 4
// Checksum 0x9cb99f01, Offset: 0x4049
// Size: 0x36
function call_on_notify_proc( notifystring, method, varargcount, vararg )
{
    self waittill( notifystring );
    self builtin [[ method ]]( flat_args( vararg, varargcount ) );
}

// Namespace utility
// Params 4, eflags: 0x40 variadic
// Checksum 0x18e0ff6, Offset: 0x4087
// Size: 0x3c
function function_d228b3fda22249de( notifystring, function, ... )
{
    self endon( "death_or_disconnect" );
    childthread function_b1d5a03ab2e75b1b( notifystring, function, varargcount, vararg );
}

// Namespace utility
// Params 4, eflags: 0x4
// Checksum 0x353a12f8, Offset: 0x40cb
// Size: 0x35
function private function_b1d5a03ab2e75b1b( notifystring, function, varargcount, vararg )
{
    self waittill( notifystring );
    builtin [[ function ]]( flat_args( vararg, varargcount ) );
}

// Namespace utility
// Params 5, eflags: 0x40 variadic
// Checksum 0x67b5b03a, Offset: 0x4108
// Size: 0x3f
function thread_on_notify_no_endon_death( notifystring, function, ent, ... )
{
    childthread thread_on_notify_proc( notifystring, function, ent, flat_args( vararg, varargcount ) );
}

// Namespace utility
// Params 7, eflags: 0x40 variadic
// Checksum 0x1a0bd272, Offset: 0x414f
// Size: 0x160
function thread_on_notify( notifystring, function, ent, endonentities, endonmessages, ... )
{
    self endon( "death" );
    
    if ( isdefined( endonentities ) && isdefined( endonmessages ) )
    {
        if ( !isarray( endonentities ) )
        {
            endonentities = [ endonentities ];
        }
        
        if ( !isarray( endonmessages ) )
        {
            endonmessages = [ endonmessages ];
        }
        
        foreach ( entity in endonentities )
        {
            foreach ( message in endonmessages )
            {
                entity endon( message );
            }
        }
    }
    
    childthread thread_on_notify_proc( notifystring, function, ent, flat_args( vararg, varargcount ) );
}

// Namespace utility
// Params 5, eflags: 0x44 variadic
// Checksum 0x3cb096d0, Offset: 0x42b7
// Size: 0x47
function private thread_on_notify_proc( notifystring, function, ent, ... )
{
    self waittill( notifystring );
    
    if ( !isdefined( ent ) )
    {
        ent = self;
    }
    
    ent thread [[ function ]]( flat_args( vararg, varargcount ) );
}

// Namespace utility
// Params 6
// Checksum 0x6bf00b3f, Offset: 0x4306
// Size: 0x155
function function_eaba0102563031d1( notifystring, function, params, ent, endonentities, endonmessages )
{
    self endon( "death" );
    
    if ( isdefined( endonentities ) && isdefined( endonmessages ) )
    {
        if ( !isarray( endonentities ) )
        {
            endonentities = [ endonentities ];
        }
        
        if ( !isarray( endonmessages ) )
        {
            endonmessages = [ endonmessages ];
        }
        
        foreach ( entity in endonentities )
        {
            foreach ( message in endonmessages )
            {
                entity endon( message );
            }
        }
    }
    
    childthread function_5f1fa003b5b6a326( notifystring, function, params, ent );
}

// Namespace utility
// Params 4
// Checksum 0xa26215aa, Offset: 0x4463
// Size: 0x50
function function_5f1fa003b5b6a326( notifystring, function, params, ent )
{
    self waittill( notifystring );
    
    if ( !isdefined( ent ) )
    {
        ent = self;
    }
    
    if ( !isdefined( params ) )
    {
        ent thread [[ function ]]();
        return;
    }
    
    ent thread [[ function ]]( flat_args( params, params.size ) );
}

// Namespace utility
// Params 4, eflags: 0x40 variadic
// Checksum 0x39fea88a, Offset: 0x44bb
// Size: 0x35
function delaycall( timer, func, ... )
{
    thread delaycall_proc( func, undefined, timer, varargcount, vararg );
}

// Namespace utility
// Params 5, eflags: 0x40 variadic
// Checksum 0x159a3164, Offset: 0x44f8
// Size: 0x3e
function delaycallendon( timer, endonevent, func, ... )
{
    thread delaycall_proc( func, endonevent, timer, varargcount, vararg );
}

// Namespace utility
// Params 5, eflags: 0x4
// Checksum 0x1e84022, Offset: 0x453e
// Size: 0xe8
function private delaycall_proc( func, endonevent, timer, varargcount, vararg )
{
    if ( issp() )
    {
        self endon( "death" );
        self endon( "stop_delay_call" );
    }
    
    if ( isdefined( endonevent ) )
    {
        if ( !isarray( endonevent ) )
        {
            endonevent = [ endonevent ];
        }
        
        foreach ( endonname in endonevent )
        {
            self endon( endonname );
        }
    }
    
    wait timer;
    
    if ( isdefined( self ) && isdefined( func ) )
    {
        self builtin [[ func ]]( flat_args( vararg, varargcount ) );
    }
}

// Namespace utility
// Params 4
// Checksum 0xc5557bf8, Offset: 0x462e
// Size: 0xbd
function string_replace( string, find, replace, n = 1 )
{
    start_index = 0;
    
    for ( i = 0; i < n ; i++ )
    {
        if ( !issubstr( string, find ) )
        {
            return string;
        }
        
        for ( j = start_index; j < string.size ; j++ )
        {
            if ( getsubstr( string, j, j + find.size ) == find )
            {
                string = getsubstr( string, 0, j ) + replace + getsubstr( string, j + find.size );
                start_index = replace.size - find.size + j + 1;
                break;
            }
        }
    }
    
    return string;
}

// Namespace utility
// Params 5
// Checksum 0x3f94230e, Offset: 0x46f4
// Size: 0x98
function plot_points( plotpoints, r, g, b, timer )
{
    lastpoint = plotpoints[ 0 ];
    
    if ( !isdefined( r ) )
    {
        r = 1;
    }
    
    if ( !isdefined( g ) )
    {
        g = 1;
    }
    
    if ( !isdefined( b ) )
    {
        b = 1;
    }
    
    if ( !isdefined( timer ) )
    {
        timer = 0.05;
    }
    
    for ( i = 1; i < plotpoints.size ; i++ )
    {
        thread draw_line_for_time( lastpoint, plotpoints[ i ], r, g, b, timer );
        lastpoint = plotpoints[ i ];
    }
}

// Namespace utility
// Params 7
// Checksum 0x37d3a3e7, Offset: 0x4794
// Size: 0x7a
function draw_line_for_time( org1, org2, r, g, b, timer, endonevent )
{
    if ( isdefined( endonevent ) )
    {
        level endon( endonevent );
    }
    
    timer = gettime() + timer * 1000;
    
    while ( gettime() < timer )
    {
        /#
            line( org1, org2, ( r, g, b ), 1 );
        #/
        
        waitframe();
    }
}

/#

    // Namespace utility
    // Params 3
    // Checksum 0x5d0ca61c, Offset: 0x4816
    // Size: 0xf7, Type: dev
    function function_9f777c9a7fffb9fc( splineid, splinetotaltime, endonevent )
    {
        if ( isdefined( endonevent ) )
        {
            self endon( endonevent );
        }
        
        color = ( 1, 1, 0 );
        lastposition = undefined;
        var_a0a1d7792d2fe4e2 = [];
        t = 0;
        t = 0;
        
        while ( t <= splinetotaltime )
        {
            origin = function_2bf2352736fc6ac8( splineid, t );
            origin += ( 0, 0, 15 );
            var_a0a1d7792d2fe4e2[ var_a0a1d7792d2fe4e2.size ] = origin;
            t += 0.2;
        }
        
        while ( true )
        {
            lastposition = var_a0a1d7792d2fe4e2[ 0 ];
            
            for ( i = 0; i <= var_a0a1d7792d2fe4e2.size - 1 ; i++ )
            {
                if ( lastposition != var_a0a1d7792d2fe4e2[ 0 ] )
                {
                    line( lastposition, var_a0a1d7792d2fe4e2[ i ], color, 1, 0 );
                }
                
                lastposition = var_a0a1d7792d2fe4e2[ i ];
            }
            
            waitframe();
        }
    }

    // Namespace utility
    // Params 8
    // Checksum 0x9ae81ccf, Offset: 0x4915
    // Size: 0xac, Type: dev
    function function_95445a6684f51c52( text, origin, color, alpha, scale, duration, var_5bf65afe54040850, endonevent )
    {
        if ( !isdefined( var_5bf65afe54040850 ) )
        {
            var_5bf65afe54040850 = 1;
        }
        
        if ( isdefined( endonevent ) )
        {
            level endon( endonevent );
        }
        
        endtime = gettime() + duration * 1000;
        
        while ( gettime() < endtime )
        {
            print3d( origin, text, color, alpha, scale, var_5bf65afe54040850 );
            timesec = var_5bf65afe54040850 * level.framedurationseconds;
            wait timesec;
        }
    }

#/

// Namespace utility
// Params 6
// Checksum 0x32614b16, Offset: 0x49c9
// Size: 0x13c
function draw_circle( center, radius, color, alpha, depthtest, duration )
{
    circle_sides = 16;
    anglefrac = 360 / circle_sides;
    circlepoints = [];
    
    for ( i = 0; i < circle_sides ; i++ )
    {
        angle = anglefrac * i;
        xadd = cos( angle ) * radius;
        yadd = sin( angle ) * radius;
        x = center[ 0 ] + xadd;
        y = center[ 1 ] + yadd;
        z = center[ 2 ];
        circlepoints[ circlepoints.size ] = ( x, y, z );
    }
    
    for ( i = 0; i < circlepoints.size ; i++ )
    {
        start = circlepoints[ i ];
        
        if ( i + 1 >= circlepoints.size )
        {
            end = circlepoints[ 0 ];
        }
        else
        {
            end = circlepoints[ i + 1 ];
        }
        
        /#
            line( start, end, color, alpha, depthtest, duration );
        #/
    }
}

// Namespace utility
// Params 11
// Checksum 0xcbef422, Offset: 0x4b0d
// Size: 0x279
function draw_cone( coneorigin, coneforward, conelen, coneang, color, alpha, depthtest, duration, var_d5eea15182c0d3fb = 0, var_4901db0fa1b73461 = 16, var_76315c3a3742278 = 10 )
{
    if ( var_d5eea15182c0d3fb )
    {
        endpoint_center = coneorigin + coneforward * conelen;
        
        /#
            line( coneorigin, endpoint_center, color, alpha, depthtest, duration );
        #/
    }
    
    var_a14f1eefa11db062 = coneforward * conelen;
    x = var_a14f1eefa11db062[ 0 ];
    y = var_a14f1eefa11db062[ 1 ];
    z = var_a14f1eefa11db062[ 2 ];
    y = max( 1e-06, y );
    radius = conelen * tan( coneang );
    xvec = vectornormalize( ( y, x * -1, 0 ) );
    yvec = vectornormalize( ( x * z, y * z, squared( x ) * -1 - squared( y ) ) );
    anglefrac = 360 / var_4901db0fa1b73461;
    edgevecs = [];
    
    for ( i = 0; i < var_4901db0fa1b73461 ; i++ )
    {
        angle = anglefrac * i;
        xadd = cos( angle ) * radius;
        yadd = sin( angle ) * radius;
        vec = var_a14f1eefa11db062 + xvec * xadd + yvec * yadd;
        
        /#
            line( coneorigin, vec + coneorigin, color, alpha, depthtest, duration );
        #/
        
        edgevecs[ i ] = vec;
    }
    
    if ( !isdefined( var_76315c3a3742278 ) || var_76315c3a3742278 < 1 )
    {
        return;
    }
    
    for ( i = 0; i < var_4901db0fa1b73461 ; i++ )
    {
        var_b89dc0f8c8534128 = edgevecs[ i ];
        var_5a00f829c922b370 = undefined;
        
        if ( i == edgevecs.size - 1 )
        {
            var_5a00f829c922b370 = edgevecs[ 0 ];
        }
        else
        {
            var_5a00f829c922b370 = edgevecs[ i + 1 ];
        }
        
        for ( j = 0; j < var_76315c3a3742278 ; j++ )
        {
            var_94cd0067430f6194 = coneorigin + var_b89dc0f8c8534128 - var_b89dc0f8c8534128 * j / var_76315c3a3742278;
            var_2c57358c698fe40c = coneorigin + var_5a00f829c922b370 - var_5a00f829c922b370 * j / var_76315c3a3742278;
            
            /#
                line( var_94cd0067430f6194, var_2c57358c698fe40c, color, alpha, depthtest, duration );
            #/
        }
    }
}

// Namespace utility
// Params 1
// Checksum 0xfd2f46ee, Offset: 0x4d8e
// Size: 0x82
function array_delete( array )
{
    foreach ( ent in array )
    {
        if ( isdefined( ent ) )
        {
            ent delete();
        }
    }
}

// Namespace utility
// Params 3
// Checksum 0xd0545270, Offset: 0x4e18
// Size: 0x92
function function_a29adc1232d07a43( array1, array2, index )
{
    assert( index >= 0, "<dev string:x336>" );
    
    for ( i = array1.size + array2.size - 1; true ; i-- )
    {
        if ( i < index + array2.size )
        {
            for ( j = array2.size - 1; j >= 0 ; j-- )
            {
                array1[ i ] = array2[ j ];
                i--;
            }
            
            return array1;
        }
        
        array1[ i ] = array1[ i - array2.size ];
    }
}

// Namespace utility
// Params 1
// Checksum 0xf1e52075, Offset: 0x4eb2
// Size: 0x8b
function array_combine_multiple( arr2d )
{
    arr1d = [];
    
    foreach ( arr in arr2d )
    {
        arr1d = arraycombine( arr1d, arr );
    }
    
    return arr1d;
}

// Namespace utility
// Params 2
// Checksum 0xe333dff8, Offset: 0x4f46
// Size: 0xbe
function array_map( array, mapfunction )
{
    assert( isarray( array ), "<dev string:x361>" );
    assert( isfunction( mapfunction ), "<dev string:x38e>" );
    newarray = [];
    
    foreach ( arrayobject in array )
    {
        newarray[ newarray.size ] = self [[ mapfunction ]]( arrayobject );
    }
    
    return newarray;
}

// Namespace utility
// Params 1
// Checksum 0x918435a1, Offset: 0x500d
// Size: 0x31
function array_random( array )
{
    size = array.size;
    
    if ( size > 0 )
    {
        return array[ getarraykey( array, randomint( size ) ) ];
    }
}

// Namespace utility
// Params 2
// Checksum 0xee2b0375, Offset: 0x5046
// Size: 0x146
function function_8d2a14bc0152e2ee( array, slicesize )
{
    assert( array.size > slicesize, "<dev string:x3bf>" );
    randomindices = [];
    returnarr = [];
    counter = 0;
    totalchecks = 0;
    maxchecks = slicesize * 10;
    
    while ( counter < slicesize )
    {
        rndidx = randomint( array.size );
        totalchecks++;
        
        if ( totalchecks == maxchecks )
        {
            break;
        }
        
        if ( arraycontains( randomindices, rndidx ) )
        {
            continue;
        }
        
        randomindices[ randomindices.size ] = rndidx;
        counter++;
    }
    
    if ( randomindices.size < slicesize )
    {
        return undefined;
    }
    
    currindex = 0;
    
    foreach ( object in array )
    {
        if ( returnarr.size == slicesize )
        {
            break;
        }
        
        if ( arraycontains( randomindices, currindex ) )
        {
            returnarr[ returnarr.size ] = object;
        }
        
        currindex++;
    }
    
    return returnarr;
}

// Namespace utility
// Params 1
// Checksum 0x7b7202d5, Offset: 0x5195
// Size: 0x64
function array_randomize( array )
{
    array = arraycopy( array );
    
    for ( i = 0; i < array.size - 1 ; i++ )
    {
        j = randomintrange( i, array.size );
        temp = array[ i ];
        array[ i ] = array[ j ];
        array[ j ] = temp;
    }
    
    return array;
}

// Namespace utility
// Params 5
// Checksum 0x2c871eb3, Offset: 0x5202
// Size: 0xdb
function function_bf3235e60a7a3f60( array, seed, a, c, m )
{
    if ( !( isdefined( array ) && isdefined( seed ) ) )
    {
        assertmsg( "<dev string:x3ff>" );
        return [];
    }
    
    array = arraycopy( array );
    x = seed;
    
    if ( !isdefined( a ) )
    {
        a = 29;
    }
    
    if ( !isdefined( c ) )
    {
        c = 19;
    }
    
    if ( !isdefined( m ) )
    {
        m = int( max( array.size, 41 ) );
    }
    
    for ( i = 0; i < array.size ; i++ )
    {
        x = ( x * a + c ) % m;
        randval = x % array.size;
        tmp = array[ i ];
        array[ i ] = array[ randval ];
        array[ randval ] = tmp;
    }
    
    return array;
}

// Namespace utility
// Params 1
// Checksum 0xdaf8144c, Offset: 0x52e6
// Size: 0xfe
function array_randomize_objects( array )
{
    randomarray = [];
    
    for ( temparray = array; temparray.size > 0 ; temparray = newarray )
    {
        randomindex = randomintrange( 0, temparray.size );
        newarray = [];
        arraycount = 0;
        
        foreach ( key, object in temparray )
        {
            if ( arraycount == randomindex )
            {
                randomarray[ isstring( key ) ? key : randomarray.size ] = object;
            }
            else
            {
                newarray[ isstring( key ) ? key : newarray.size ] = object;
            }
            
            arraycount++;
        }
    }
    
    return randomarray;
}

// Namespace utility
// Params 1
// Checksum 0x1be16e48, Offset: 0x53ed
// Size: 0x50
function array_reverse( array )
{
    assert( isarray( array ) );
    array2 = [];
    
    for ( i = array.size - 1; i >= 0 ; i-- )
    {
        array2[ array2.size ] = array[ i ];
    }
    
    return array2;
}

// Namespace utility
// Params 3
// Checksum 0xc5276ff0, Offset: 0x5446
// Size: 0x9b
function array_slice( array, startindex, endindex )
{
    assert( isarray( array ) );
    assert( isdefined( startindex ) );
    
    if ( array.size <= 0 )
    {
        return [];
    }
    
    if ( !isdefined( endindex ) || endindex > array.size )
    {
        endindex = array.size;
    }
    
    if ( startindex == 0 && endindex == array.size )
    {
        return array;
    }
    
    slicedarray = [];
    
    for ( index = startindex; index < endindex ; index++ )
    {
        slicedarray[ slicedarray.size ] = array[ index ];
    }
    
    return slicedarray;
}

// Namespace utility
// Params 2
// Checksum 0x8a34b6de, Offset: 0x54ea
// Size: 0x68
function function_b76f394c95aedbfc( array, var_129d621c51f58393 )
{
    array = arraycopy( array );
    
    for ( i = 0; i < var_129d621c51f58393 ; i++ )
    {
        if ( array.size > 0 )
        {
            indextoremove = randomint( array.size );
            array[ indextoremove ] = array[ array.size - 1 ];
            array[ array.size - 1 ] = undefined;
        }
    }
    
    return array;
}

// Namespace utility
// Params 2
// Checksum 0xa08776a6, Offset: 0x555b
// Size: 0xc2
function function_5fdf0884f9b2d470( array, var_5de849e01abd2013 )
{
    assert( isarray( array ), "<dev string:x361>" );
    assert( isfunction( var_5de849e01abd2013 ), "<dev string:x38e>" );
    result = [];
    
    foreach ( test in array )
    {
        if ( self [[ var_5de849e01abd2013 ]]( test ) )
        {
            result[ result.size ] = test;
        }
    }
    
    return result;
}

// Namespace utility
// Params 3
// Checksum 0x502d5014, Offset: 0x5626
// Size: 0xc2
function function_6ed29b1b786df49a( array, condition, keepkeys )
{
    if ( !array || !isdefined( condition ) )
    {
        return;
    }
    
    newarray = [];
    
    foreach ( key, val in array )
    {
        if ( ![[ condition ]]( key, val ) )
        {
            if ( keepkeys )
            {
                newarray[ key ] = val;
                continue;
            }
            
            newarray[ newarray.size ] = val;
        }
    }
    
    return newarray;
}

// Namespace utility
// Params 2
// Checksum 0x273a87ff, Offset: 0x56f1
// Size: 0x129
function function_6ecd4587ed2bf80c( array, keepkeys )
{
    newarray = [];
    
    if ( keepkeys )
    {
        foreach ( i, member in array )
        {
            if ( !isdefined( member ) || member.destroyed )
            {
                continue;
            }
            
            newarray[ i ] = member;
        }
    }
    else
    {
        foreach ( i, member in array )
        {
            if ( !isdefined( member ) || member.destroyed )
            {
                continue;
            }
            
            newarray[ newarray.size ] = member;
        }
    }
    
    return newarray;
}

// Namespace utility
// Params 2
// Checksum 0x571055fa, Offset: 0x5823
// Size: 0x13f
function function_8391781ea0784541( array, keepkeys )
{
    newarray = [];
    
    if ( keepkeys )
    {
        foreach ( i, member in array )
        {
            if ( !isdefined( member ) || !isalive( member ) || member.destroyed )
            {
                continue;
            }
            
            newarray[ i ] = member;
        }
    }
    else
    {
        foreach ( i, member in array )
        {
            if ( !isdefined( member ) || !isalive( member ) || member.destroyed )
            {
                continue;
            }
            
            newarray[ newarray.size ] = member;
        }
    }
    
    return newarray;
}

// Namespace utility
// Params 1
// Checksum 0xe6df291d, Offset: 0x596b
// Size: 0x81
function array_get_first_item( array = [] )
{
    foreach ( item in array )
    {
        return item;
    }
    
    return undefined;
}

// Namespace utility
// Params 1
// Checksum 0x2d6a80e7, Offset: 0x59f5
// Size: 0x8e
function function_f1933af772476229( array = [] )
{
    last_item = undefined;
    
    foreach ( item in array )
    {
        last_item = item;
    }
    
    return last_item;
}

// Namespace utility
// Params 2
// Checksum 0xe6332c0b, Offset: 0x5a8c
// Size: 0xbe
function function_d751969553a4bddd( array, remover )
{
    result = [];
    removed = 0;
    
    foreach ( item in array_reverse( array ) )
    {
        if ( !removed && item == remover )
        {
            removed = 1;
            continue;
        }
        
        result[ result.size ] = item;
    }
    
    return array_reverse( result );
}

// Namespace utility
// Params 4, eflags: 0x40 variadic
// Checksum 0xa7af4e3e, Offset: 0x5b53
// Size: 0x9a
function array_levelthread( array, process, ... )
{
    foreach ( ent in array )
    {
        thread [[ process ]]( ent, flat_args( vararg, varargcount ) );
    }
}

// Namespace utility
// Params 1
// Checksum 0xa26f51d5, Offset: 0x5bf5
// Size: 0xcd
function array_sort_by_script_index( array )
{
    sortedarray = [];
    
    for ( index = 0; index < array.size ; index++ )
    {
        foreach ( item in array )
        {
            if ( item.script_index == index )
            {
                sortedarray[ sortedarray.size ] = item;
            }
        }
    }
    
    remainingitems = arrayremove( array, sortedarray );
    sortedarray = arraycombine( sortedarray, remainingitems );
    return sortedarray;
}

// Namespace utility
// Params 1
// Checksum 0xb3d9d715, Offset: 0x5ccb
// Size: 0x18
function array_average( array )
{
    return array_sum( array ) / array.size;
}

// Namespace utility
// Params 1
// Checksum 0xb09e4c36, Offset: 0x5cec
// Size: 0x88
function array_sum( array )
{
    sum = 0;
    
    foreach ( item in array )
    {
        sum += item;
    }
    
    return sum;
}

// Namespace utility
// Params 2, eflags: 0x40 variadic
// Checksum 0x14967683, Offset: 0x5d7d
// Size: 0x4f
function sum( ... )
{
    assert( varargcount >= 1 );
    
    if ( isarray( vararg[ 0 ] ) )
    {
        assert( varargcount == 1 );
        return array_sum( vararg[ 0 ] );
    }
    
    return array_sum( vararg );
}

// Namespace utility
// Params 1
// Checksum 0xc28bdebb, Offset: 0x5dd4
// Size: 0x98
function array_max( array )
{
    maximum = undefined;
    
    foreach ( item in array )
    {
        if ( isdefined( maximum ) )
        {
            maximum = max( maximum, item );
            continue;
        }
        
        maximum = item;
    }
    
    return maximum;
}

// Namespace utility
// Params 2, eflags: 0x40 variadic
// Checksum 0xc6461af0, Offset: 0x5e75
// Size: 0x4f
function maximum( ... )
{
    assert( varargcount >= 1 );
    
    if ( isarray( vararg[ 0 ] ) )
    {
        assert( varargcount == 1 );
        return array_max( vararg[ 0 ] );
    }
    
    return array_max( vararg );
}

// Namespace utility
// Params 6
// Checksum 0x1eeb05d, Offset: 0x5ecc
// Size: 0x21b
function function_a38b3ca4783bca3b( array, var_88397eced8b3629c, var_8e0831c9133f47d9, var_297c33ed3c94cefd, iterationtimeinseconds = 5, shouldthread = 0 )
{
    assert( isarray( array ), "<dev string:x361>" );
    assert( isfunction( var_88397eced8b3629c ), "<dev string:x38e>" );
    var_bf7b7ad6fd69e36a = 0;
    
    if ( isfunction( var_8e0831c9133f47d9 ) )
    {
        var_bf7b7ad6fd69e36a = 1;
    }
    
    var_49d4677a21b1ab3b = array.size;
    var_f1b01d788e6d3db4 = max( iterationtimeinseconds / level.framedurationseconds, 1 );
    var_2397229ee106724a = max( var_49d4677a21b1ab3b / var_f1b01d788e6d3db4, 1 );
    var_2397229ee106724a = ceil( var_2397229ee106724a );
    var_856c40ba487440b = 0;
    
    if ( shouldthread )
    {
        foreach ( arraykey, arrayobject in array )
        {
            var_c9255c447cc081c0 = !var_bf7b7ad6fd69e36a || var_bf7b7ad6fd69e36a && self [[ var_8e0831c9133f47d9 ]]( arrayobject );
            
            if ( var_c9255c447cc081c0 )
            {
                self thread [[ var_88397eced8b3629c ]]( arrayobject, arraykey );
            }
            
            var_856c40ba487440b++;
            
            if ( var_856c40ba487440b >= var_2397229ee106724a )
            {
                waitframe();
                var_856c40ba487440b = 0;
            }
        }
    }
    else
    {
        foreach ( arraykey, arrayobject in array )
        {
            var_c9255c447cc081c0 = !var_bf7b7ad6fd69e36a || var_bf7b7ad6fd69e36a && self [[ var_8e0831c9133f47d9 ]]( arrayobject );
            
            if ( var_c9255c447cc081c0 )
            {
                self [[ var_88397eced8b3629c ]]( arrayobject, arraykey );
            }
            
            var_856c40ba487440b++;
            
            if ( var_856c40ba487440b >= var_2397229ee106724a )
            {
                waitframe();
                var_856c40ba487440b = 0;
            }
        }
    }
    
    if ( isfunction( var_297c33ed3c94cefd ) )
    {
        self [[ var_297c33ed3c94cefd ]]();
    }
}

// Namespace utility
// Params 2
// Checksum 0x9aea6b79, Offset: 0x60ef
// Size: 0x8d, Type: bool
function function_1048967191f5b394( a_ents, e_volume )
{
    foreach ( e_ent in a_ents )
    {
        if ( !e_ent istouching( e_volume ) )
        {
            return false;
        }
    }
    
    return true;
}

// Namespace utility
// Params 1
// Checksum 0xf5449481, Offset: 0x6185
// Size: 0x12
function function_1cb108307e3b6491( object )
{
    return isplayer( object );
}

// Namespace utility
// Params 1
// Checksum 0xb028d14, Offset: 0x61a0
// Size: 0x1e, Type: bool
function function_bf6b797c73abc9df( object )
{
    return function_1cb108307e3b6491( object ) && isalive( object );
}

// Namespace utility
// Params 4
// Checksum 0x27e21e56, Offset: 0x61c7
// Size: 0x13c
function create_deck( item_array, autoshuffle, var_4a5b8543826fe61b, prevent_redraw )
{
    if ( !isdefined( item_array ) )
    {
        item_array = [];
    }
    else if ( !isarray( item_array ) )
    {
        item_array = [ item_array ];
    }
    
    deck = spawnstruct();
    deck.items = [];
    deck.index = 0;
    deck.cycle = 0;
    deck.autoshuffle = !isdefined( autoshuffle ) || autoshuffle;
    deck.prevent_redraw = !isdefined( prevent_redraw ) || prevent_redraw;
    
    foreach ( item in item_array )
    {
        deck.items[ deck.items.size ] = item;
    }
    
    if ( var_4a5b8543826fe61b )
    {
        deck deck_shuffle();
    }
    
    return deck;
}

// Namespace utility
// Params 0
// Checksum 0x734e280d, Offset: 0x630c
// Size: 0x5c
function deck_draw()
{
    assert( isdefined( self.items ) && isstruct( self ) && isdefined( self.index ), "<dev string:x444>" );
    deck = self;
    drawn_item = deck deck_top();
    deck.index++;
    return drawn_item;
}

// Namespace utility
// Params 0
// Checksum 0x8a8eb65e, Offset: 0x6371
// Size: 0xb4
function deck_top()
{
    assert( isdefined( self.items ) && isstruct( self ) && isdefined( self.index ), "<dev string:x480>" );
    deck = self;
    
    if ( deck.items.size == 0 )
    {
        return undefined;
    }
    
    if ( deck.index >= deck.items.size )
    {
        if ( deck.autoshuffle )
        {
            deck deck_shuffle();
        }
        else
        {
            deck.index = 0;
            deck.cycle++;
        }
    }
    
    return deck.items[ deck.index ];
}

// Namespace utility
// Params 0
// Checksum 0xc78484ad, Offset: 0x642e
// Size: 0x1af
function deck_shuffle()
{
    assert( isdefined( self.items ) && isstruct( self ) && isdefined( self.index ), "<dev string:x4bb>" );
    deck = self;
    
    if ( deck.index == 0 || !deck.prevent_redraw || deck.items.size <= 1 )
    {
        deck.items = array_randomize( deck.items );
        deck.index = 0;
        deck.cycle++;
        return;
    }
    
    j = randomintrange( 0, deck.items.size - 1 );
    
    if ( j == deck.index - 1 )
    {
        j++;
    }
    
    temp = deck.items[ 0 ];
    deck.items[ 0 ] = deck.items[ j ];
    deck.items[ j ] = temp;
    
    for ( i = 1; i < deck.items.size - 1 ; i++ )
    {
        j = randomintrange( i, deck.items.size );
        temp = deck.items[ i ];
        deck.items[ i ] = deck.items[ j ];
        deck.items[ j ] = temp;
    }
    
    deck.index = 0;
    deck.cycle++;
}

// Namespace utility
// Params 1
// Checksum 0x66cc5ea4, Offset: 0x65e5
// Size: 0x14
function random( array )
{
    return array_random( array );
}

// Namespace utility
// Params 1
// Checksum 0xb832658b, Offset: 0x6602
// Size: 0x2f
function random_key( array )
{
    size = array.size;
    
    if ( size > 0 )
    {
        return getarraykey( array, randomint( size ) );
    }
}

// Namespace utility
// Params 2
// Checksum 0x4e0d6870, Offset: 0x6639
// Size: 0x143
function random_weighted( array, weights )
{
    assert( array.size == weights.size, "<dev string:x4fa>" );
    totalweight = 0;
    
    foreach ( value in weights )
    {
        totalweight += value;
    }
    
    if ( totalweight == 0 )
    {
        return undefined;
    }
    
    weight = randomint( totalweight );
    chosenvalue = undefined;
    
    foreach ( i, value in array )
    {
        if ( weight < weights[ i ] )
        {
            chosenvalue = value;
            break;
        }
        
        weight -= weights[ i ];
    }
    
    return chosenvalue;
}

// Namespace utility
// Params 1
// Checksum 0x22acfe16, Offset: 0x6785
// Size: 0x13e
function function_6dfbe161e911da41( struct_array )
{
    totalweight = 0;
    
    foreach ( struct in struct_array )
    {
        totalweight += struct.weight;
    }
    
    if ( totalweight == 0 )
    {
        return undefined;
    }
    
    choosenweight = randomint( totalweight );
    cumulativeweight = 0;
    selectedstruct = undefined;
    
    foreach ( struct in struct_array )
    {
        cumulativeweight += struct.weight;
        
        if ( cumulativeweight > choosenweight )
        {
            selectedstruct = struct;
            break;
        }
    }
    
    return selectedstruct;
}

// Namespace utility
// Params 1
// Checksum 0xcfc1e4a8, Offset: 0x68cc
// Size: 0xb8
function random_weight_sorted( array )
{
    newarray = [];
    
    foreach ( value in array )
    {
        newarray[ newarray.size ] = value;
    }
    
    if ( !newarray.size )
    {
        return undefined;
    }
    
    var_d23377414f51df8b = randomint( newarray.size * newarray.size );
    return newarray[ newarray.size - 1 - int( sqrt( var_d23377414f51df8b ) ) ];
}

// Namespace utility
// Params 1
// Checksum 0xbef0172a, Offset: 0x698d
// Size: 0xac
function alphabetize( array )
{
    if ( array.size <= 1 )
    {
        return array;
    }
    
    array = arraycopy( array );
    
    for ( asize = array.size - 1; asize >= 1 ; asize-- )
    {
        largest = array[ asize ];
        largestindex = asize;
        
        for ( i = 0; i < asize ; i++ )
        {
            string1 = array[ i ];
            
            if ( stricmp( string1, largest ) > 0 )
            {
                largest = string1;
                largestindex = i;
            }
        }
        
        if ( largestindex != asize )
        {
            array[ largestindex ] = array[ asize ];
            array[ asize ] = largest;
        }
    }
    
    return array;
}

// Namespace utility
// Params 5, eflags: 0x40 variadic
// Checksum 0xbac7c770, Offset: 0x6a42
// Size: 0x3f
function array_thread_amortized( entities, process, var_b01eab2eb5e7d0ec, ... )
{
    thread function_9dadaaadd9701645( entities, process, var_b01eab2eb5e7d0ec, flat_args( vararg, varargcount ) );
}

// Namespace utility
// Params 5, eflags: 0x40 variadic
// Checksum 0xc088bb0b, Offset: 0x6a89
// Size: 0xc5
function function_9dadaaadd9701645( entities, process, var_b01eab2eb5e7d0ec, ... )
{
    foreach ( ent in entities )
    {
        if ( isai( ent ) && !isalive( ent ) || !isdefined( ent ) )
        {
            continue;
        }
        
        ent thread [[ process ]]( flat_args( vararg, varargcount ) );
        wait var_b01eab2eb5e7d0ec;
    }
}

// Namespace utility
// Params 4, eflags: 0x40 variadic
// Checksum 0x1298b93d, Offset: 0x6b56
// Size: 0x9a
function array_thread( entities, process, ... )
{
    foreach ( ent in entities )
    {
        ent thread [[ process ]]( flat_args( vararg, varargcount ) );
    }
}

// Namespace utility
// Params 4, eflags: 0x40 variadic
// Checksum 0xf7e66923, Offset: 0x6bf8
// Size: 0x9a
function function_287100922a30cebe( entities, process, ... )
{
    foreach ( ent in entities )
    {
        ent childthread [[ process ]]( flat_args( vararg, varargcount ) );
    }
}

// Namespace utility
// Params 4, eflags: 0x40 variadic
// Checksum 0xc736a401, Offset: 0x6c9a
// Size: 0x9a
function array_call( entities, process, ... )
{
    foreach ( ent in entities )
    {
        ent builtin [[ process ]]( flat_args( vararg, varargcount ) );
    }
}

// Namespace utility
// Params 4, eflags: 0x40 variadic
// Checksum 0x79e64db6, Offset: 0x6d3c
// Size: 0x3d
function function_835738fa8c7c4066( entities, process, ... )
{
    entities = function_5713d46873b29625( entities );
    array_call( entities, process, flat_args( vararg, varargcount ) );
}

// Namespace utility
// Params 2
// Checksum 0xb5d725b2, Offset: 0x6d81
// Size: 0xb3
function function_bc06a8c564f539e5( job_funcs, arg_array )
{
    assert( isarray( job_funcs ) );
    
    if ( !isdefined( arg_array ) )
    {
        arg_array = [];
    }
    
    jobpool = spawnstruct();
    jobpool.alldonenotify = "all_workers_done";
    jobpool.pendingcount = job_funcs.size;
    
    for ( i = 0; i < job_funcs.size ; i++ )
    {
        assert( isfunction( job_funcs[ i ] ) );
        jobpool childthread function_f847fdaebc753c59( self, job_funcs[ i ], arg_array );
    }
    
    if ( jobpool.pendingcount == 0 )
    {
        return;
    }
    
    jobpool waittill( jobpool.alldonenotify );
}

// Namespace utility
// Params 3, eflags: 0x4
// Checksum 0x25d65cfe, Offset: 0x6e3c
// Size: 0x58
function private function_f847fdaebc753c59( ent, func, arg_array )
{
    single_func_argarray( ent, func, arg_array );
    self.pendingcount -= 1;
    
    if ( self.pendingcount == 0 )
    {
        self notify( self.alldonenotify );
    }
}

// Namespace utility
// Params 4, eflags: 0x40 variadic
// Checksum 0x24fd87db, Offset: 0x6e9c
// Size: 0x4d
function function_bf6bc5af32465d3c( time_seconds, func, ... )
{
    if ( !isfunction( func ) )
    {
        assertmsg( "<dev string:x529>" );
        return;
    }
    
    thread function_df28a485be61386e( time_seconds, func, flat_args( vararg, varargcount ) );
}

// Namespace utility
// Params 4, eflags: 0x44 variadic
// Checksum 0xaeb12080, Offset: 0x6ef1
// Size: 0x55
function private function_df28a485be61386e( time_seconds, func, ... )
{
    level endon( "game_ended" );
    
    if ( isplayer( self ) )
    {
        self endon( "disconnect" );
    }
    
    wait max( int( time_seconds ), 0 );
    self thread [[ func ]]( flat_args( vararg, varargcount ) );
}

// Namespace utility
// Params 1
// Checksum 0xcacf5ce6, Offset: 0x6f4e
// Size: 0x21
function flat_angle( angle )
{
    rangle = ( 0, angle[ 1 ], 0 );
    return rangle;
}

// Namespace utility
// Params 1
// Checksum 0xc3735a10, Offset: 0x6f78
// Size: 0x23
function flat_origin( org )
{
    rorg = ( org[ 0 ], org[ 1 ], 0 );
    return rorg;
}

// Namespace utility
// Params 2
// Checksum 0xca0a32ee, Offset: 0x6fa4
// Size: 0x48
function flatten_vector( var_88d7b9388f725cee, up_vector = ( 0, 0, 1 ) )
{
    flat_vec = vectornormalize( var_88d7b9388f725cee - vectordot( up_vector, var_88d7b9388f725cee ) * up_vector );
    return flat_vec;
}

// Namespace utility
// Params 5
// Checksum 0x1de3751f, Offset: 0x6ff5
// Size: 0x175
function draw_arrow_time( start, end, color, duration, endonevent )
{
    if ( isdefined( endonevent ) )
    {
        level endon( endonevent );
    }
    
    level endon( "newpath" );
    angles = vectortoangles( start - end );
    right = anglestoright( angles );
    forward = anglestoforward( angles );
    up = anglestoup( angles );
    dist = distance( start, end );
    arrow = [];
    range = 0.1;
    arrow[ 0 ] = start;
    arrow[ 1 ] = start + right * dist * range + forward * dist * -0.1;
    arrow[ 2 ] = end;
    arrow[ 3 ] = start + right * dist * -1 * range + forward * dist * -0.1;
    arrow[ 4 ] = start;
    arrow[ 5 ] = start + up * dist * range + forward * dist * -0.1;
    arrow[ 6 ] = end;
    arrow[ 7 ] = start + up * dist * -1 * range + forward * dist * -0.1;
    arrow[ 8 ] = start;
    r = color[ 0 ];
    g = color[ 1 ];
    b = color[ 2 ];
    plot_points( arrow, r, g, b, duration );
}

// Namespace utility
// Params 6
// Checksum 0xc71659ad, Offset: 0x7172
// Size: 0x13a
function draw_arrow( start, end, color, scale, depthtest, duration )
{
    level endon( "newpath" );
    angles = vectortoangles( start - end );
    right = anglestoright( angles );
    forward = anglestoforward( angles );
    dist = distance( start, end );
    arrow = [];
    range = 0.05;
    arrow[ 0 ] = start;
    arrow[ 1 ] = start + right * dist * range + forward * dist * -0.2;
    arrow[ 2 ] = end;
    arrow[ 3 ] = start + right * dist * -1 * range + forward * dist * -0.2;
    
    for ( p = 0; p < 4 ; p++ )
    {
        nextpoint = p + 1;
        
        if ( nextpoint >= 4 )
        {
            nextpoint = 0;
        }
        
        /#
            line( arrow[ p ], arrow[ nextpoint ], color, scale ?? 1, istrue( depthtest ), duration ?? 1 );
        #/
    }
}

// Namespace utility
// Params 11
// Checksum 0x41f34c93, Offset: 0x72b4
// Size: 0x1f5
function function_f0123538526f6652( start, end, line_color = ( 0, 0, 1 ), arrow_color = line_color, arrow_angle = 45, arrow_length = 30, num_arrows = 2, connect_arrow = 1, alpha, depthtest, duration )
{
    angles = vectortoangles( end - start );
    right = anglestoright( angles );
    forward = anglestoforward( angles );
    dist = distance( start, end );
    yadd = sin( arrow_angle ) * forward;
    xadd = cos( arrow_angle ) * right;
    displacement_right = vectornormalize( xadd + yadd ) * -1 * arrow_length;
    displacement_left = vectornormalize( xadd * -1 + yadd ) * -1 * arrow_length;
    var_d46ee22ae490d134 = num_arrows + 1;
    var_151a069d6f09add4 = dist / var_d46ee22ae490d134;
    
    for ( i = 1; i < var_d46ee22ae490d134 ; i++ )
    {
        var_d3810399a0556ac0 = var_151a069d6f09add4 * i;
        arrowhead_point = start + var_d3810399a0556ac0 * forward;
        var_6cd7a09a0a9ec7fc = arrowhead_point + displacement_right;
        var_445ee280843a7973 = arrowhead_point + displacement_left;
        
        /#
            line( arrowhead_point, var_6cd7a09a0a9ec7fc, arrow_color, alpha, depthtest, duration );
            line( arrowhead_point, var_445ee280843a7973, arrow_color, alpha, depthtest, duration );
            
            if ( connect_arrow )
            {
                line( var_445ee280843a7973, var_6cd7a09a0a9ec7fc, arrow_color, alpha, depthtest, duration );
            }
        #/
    }
    
    /#
        line( start, end, line_color, alpha, depthtest, duration );
    #/
}

// Namespace utility
// Params 7
// Checksum 0x1397cb28, Offset: 0x74b1
// Size: 0x1a0
function draw_capsule( pos, radius, height, angles = ( 0, 0, 0 ), color, depthtest = 0, duration = 1 )
{
    forward = anglestoforward( angles );
    right = anglestoright( angles );
    up = anglestoup( angles );
    
    /#
        cap_base = pos + up * radius;
        sphere( cap_base, radius, color, depthtest, duration );
        cap_top = pos + up * height;
        cap_top -= up * radius;
        sphere( cap_top, radius, color, depthtest, duration );
        var_4cbbb83facf3df31 = cap_base + forward * radius;
        var_14aa1f435f1e37e7 = cap_top + forward * radius;
        line( var_4cbbb83facf3df31, var_14aa1f435f1e37e7, color, 1, depthtest, duration );
        var_b0909247cbb9a9fd = cap_base - forward * radius;
        var_724fe8e3ccb97753 = cap_top - forward * radius;
        line( var_b0909247cbb9a9fd, var_724fe8e3ccb97753, color, 1, depthtest, duration );
        var_dab792ab7bea104d = cap_base + right * radius;
        var_18230b6cd04fb063 = cap_top + right * radius;
        line( var_dab792ab7bea104d, var_18230b6cd04fb063, color, 1, depthtest, duration );
        var_6ba71c7d59bcd637 = cap_base - right * radius;
        var_235e3e9c39d3545d = cap_top - right * radius;
        line( var_6ba71c7d59bcd637, var_235e3e9c39d3545d, color, 1, depthtest, duration );
    #/
}

// Namespace utility
// Params 3
// Checksum 0x3e087bbc, Offset: 0x7659
// Size: 0x59
function draw_character_capsule( color, depthtest, duration )
{
    capsule_data = self physics_getcharactercollisioncapsule();
    draw_capsule( self getorigin(), capsule_data[ "radius" ], capsule_data[ "half_height" ] * 2, self.angles, color, depthtest, duration );
}

// Namespace utility
// Params 3
// Checksum 0xd602efec, Offset: 0x76ba
// Size: 0x55
function draw_player_capsule( color, depthtest, duration )
{
    capsule_data = self physics_getcharactercollisioncapsule();
    draw_capsule( self getorigin(), capsule_data[ "radius" ], capsule_data[ "half_height" ] * 2, self getplayerangles(), color, depthtest, duration );
}

// Namespace utility
// Params 2
// Checksum 0x8d70734c, Offset: 0x7717
// Size: 0x5d
function draw_ent_bone_forever( bone_name, origin_color )
{
    self endon( "stop_drawing_axis" );
    self endon( "death" );
    
    while ( true )
    {
        bone_origin = self gettagorigin( bone_name );
        bone_angles = self gettagangles( bone_name );
        draw_angles( bone_angles, bone_origin, origin_color );
        waitframe();
    }
}

// Namespace utility
// Params 2
// Checksum 0x9be195e3, Offset: 0x777c
// Size: 0x3a
function draw_ent_axis_forever( origin_color, scale )
{
    self endon( "stop_drawing_axis" );
    self endon( "death" );
    
    while ( true )
    {
        draw_ent_axis( origin_color, undefined, scale );
        waitframe();
    }
}

// Namespace utility
// Params 3
// Checksum 0x9df5ab54, Offset: 0x77be
// Size: 0x44
function draw_tag_axis_forever( tag, origin_color, scale )
{
    self endon( "stop_drawing_axis" );
    self endon( "death" );
    
    while ( true )
    {
        draw_tag_axis( tag, origin_color, undefined, scale );
        waitframe();
    }
}

// Namespace utility
// Params 3
// Checksum 0x9ca59d4b, Offset: 0x780a
// Size: 0x5a
function draw_ent_axis( origin_color, duration, scale )
{
    waittillframeend();
    angles = self.angles ?? ( 0, 0, 0 );
    draw_angles( angles, self.origin, origin_color, duration, scale );
}

// Namespace utility
// Params 4
// Checksum 0x5c3705ce, Offset: 0x786c
// Size: 0x5a
function draw_tag_axis( tag, origin_color, duration, scale )
{
    waittillframeend();
    angles = self gettagangles( tag );
    origin = self gettagorigin( tag );
    draw_angles( angles, origin, origin_color, duration, scale );
}

// Namespace utility
// Params 5
// Checksum 0xea2c5dbb, Offset: 0x78ce
// Size: 0x12d
function draw_angles( angles, origin, origin_color, duration, scale )
{
    waittillframeend();
    forward = anglestoforward( angles );
    right = anglestoright( angles );
    up = anglestoup( angles );
    assert( vectordot( forward, right ) == 0 );
    assert( vectordot( forward, up ) == 0 );
    assert( vectordot( up, right ) == 0 );
    
    if ( !isdefined( origin_color ) )
    {
        origin_color = ( 1, 0, 1 );
    }
    
    if ( !isdefined( duration ) )
    {
        duration = 1;
    }
    
    if ( !isdefined( scale ) )
    {
        scale = 10;
    }
    
    /#
        sphere( origin, 1, origin_color, 0, duration );
        line( origin, origin + forward * scale, ( 1, 0, 0 ), 1, 0, duration );
        line( origin, origin + right * scale, ( 0, 1, 0 ), 1, 0, duration );
        line( origin, origin + up * scale, ( 0, 0, 1 ), 1, 0, duration );
    #/
}

// Namespace utility
// Params 5
// Checksum 0x81d76c24, Offset: 0x7a03
// Size: 0x1f5
function draw_entity_bounds( ent, time_sec, color, dynamic, var_6a2940883cf7f705 )
{
    assert( isdefined( ent ) );
    assert( time_sec > 0 );
    
    if ( !isdefined( color ) )
    {
        color = ( 0, 1, 0 );
    }
    
    if ( !isdefined( dynamic ) )
    {
        dynamic = 0;
    }
    
    if ( !isdefined( var_6a2940883cf7f705 ) )
    {
        var_6a2940883cf7f705 = level.framedurationseconds;
    }
    
    if ( dynamic )
    {
        num_frames = int( var_6a2940883cf7f705 / level.framedurationseconds );
    }
    else
    {
        num_frames = int( time_sec / level.framedurationseconds );
    }
    
    var_b997226e65e9c8a1 = [];
    var_b9971f6e65e9c208 = [];
    current = gettime();
    end = current + time_sec * 1000;
    
    while ( current < end && isdefined( ent ) )
    {
        var_b997226e65e9c8a1[ 0 ] = ent getpointinbounds( 1, 1, 1 );
        var_b997226e65e9c8a1[ 1 ] = ent getpointinbounds( 1, 1, -1 );
        var_b997226e65e9c8a1[ 2 ] = ent getpointinbounds( -1, 1, -1 );
        var_b997226e65e9c8a1[ 3 ] = ent getpointinbounds( -1, 1, 1 );
        var_b9971f6e65e9c208[ 0 ] = ent getpointinbounds( 1, -1, 1 );
        var_b9971f6e65e9c208[ 1 ] = ent getpointinbounds( 1, -1, -1 );
        var_b9971f6e65e9c208[ 2 ] = ent getpointinbounds( -1, -1, -1 );
        var_b9971f6e65e9c208[ 3 ] = ent getpointinbounds( -1, -1, 1 );
        
        /#
            for ( i = 0; i < 4 ; i++ )
            {
                j = i + 1;
                
                if ( j == 4 )
                {
                    j = 0;
                }
                
                line( var_b997226e65e9c8a1[ i ], var_b997226e65e9c8a1[ j ], color, 1, 0, num_frames );
                line( var_b9971f6e65e9c208[ i ], var_b9971f6e65e9c208[ j ], color, 1, 0, num_frames );
                line( var_b997226e65e9c8a1[ i ], var_b9971f6e65e9c208[ i ], color, 1, 0, num_frames );
            }
        #/
        
        if ( !dynamic )
        {
            return;
        }
        
        wait var_6a2940883cf7f705;
        current = gettime();
    }
}

// Namespace utility
// Params 1
// Checksum 0xafbe5ca4, Offset: 0x7c00
// Size: 0x54
function getfx( fx )
{
    /#
        if ( !isdefined( level._effect[ fx ] ) )
        {
            assertmsg( "<dev string:x54e>" + ( isxhash( fx ) ? getxhashsourcename( fx ) : fx ) + "<dev string:x555>" );
        }
    #/
    
    return level._effect[ fx ];
}

// Namespace utility
// Params 1
// Checksum 0xd827a9b9, Offset: 0x7c5d
// Size: 0x19, Type: bool
function fxexists( fx )
{
    return isdefined( level._effect[ fx ] );
}

/#

    // Namespace utility
    // Params 0
    // Checksum 0xfe584fc9, Offset: 0x7c7f
    // Size: 0xf1, Type: dev
    function playerunlimitedammothread()
    {
        if ( !isdefined( self ) || self == level || isdefined( self.code_classname ) && self.code_classname != "<dev string:x57a>" )
        {
            player = level.player;
        }
        else
        {
            player = self;
        }
        
        assert( isdefined( player ) );
        
        while ( true )
        {
            wait 0.5;
            
            if ( getdvarint( @"unlimitedammooff" ) == 1 )
            {
                continue;
            }
            
            currentweapon = player getcurrentweapon();
            
            if ( !isnullweapon( currentweapon ) )
            {
                currentammo = player getfractionmaxammo( currentweapon );
                
                if ( currentammo < 0.2 )
                {
                    player givemaxammo( currentweapon );
                }
            }
            
            currentoffhand = player getcurrentoffhand();
            
            if ( !isnullweapon( currentoffhand ) )
            {
                currentammo = player getfractionmaxammo( currentoffhand );
                
                if ( currentammo < 0.4 )
                {
                    player givemaxammo( currentoffhand );
                }
            }
        }
    }

#/

// Namespace utility
// Params 2
// Checksum 0x9fad3ccc, Offset: 0x7d78
// Size: 0xa9
function spawn_tag_origin( org, ang )
{
    if ( !isdefined( ang ) && isdefined( self.angles ) )
    {
        ang = self.angles;
    }
    
    if ( !isdefined( org ) && isdefined( self.origin ) )
    {
        org = self.origin;
    }
    
    if ( !isdefined( org ) )
    {
        org = ( 0, 0, 0 );
    }
    
    tag_origin = spawn( "script_model", org );
    tag_origin setmodel( "tag_origin" );
    tag_origin hide();
    
    if ( isdefined( ang ) )
    {
        tag_origin.angles = ang;
    }
    
    return tag_origin;
}

// Namespace utility
// Params 2
// Checksum 0xd8d47cab, Offset: 0x7e2a
// Size: 0x33
function function_1808878d1c511ce8( org, ang )
{
    tag_origin = spawn_tag_origin( org, ang );
    tag_origin show();
    return tag_origin;
}

// Namespace utility
// Params 2
// Checksum 0x76e540c, Offset: 0x7e66
// Size: 0x1d
function waittill_notify_or_timeout( msg, timer )
{
    self endon( msg );
    wait timer;
}

// Namespace utility
// Params 2
// Checksum 0xccde5dc0, Offset: 0x7e8b
// Size: 0x25
function function_7ce22801650d61d4( msg, timer )
{
    level endon( "game_ended" );
    self endon( msg );
    wait timer;
}

// Namespace utility
// Params 2
// Checksum 0x92f4293e, Offset: 0x7eb8
// Size: 0x4e
function waittill_notify_or_timeout_return( notifymessage, timer )
{
    notifystruct = spawnstruct();
    thread waittill_notify_proc( notifystruct, notifymessage );
    thread waittill_timeout_proc( notifystruct, timer );
    notifystruct waittill( "waittill_proc", result );
    return result;
}

// Namespace utility
// Params 2
// Checksum 0x3dc673fd, Offset: 0x7f0f
// Size: 0x2e
function waittill_notify_proc( notifystruct, notifymessage )
{
    notifystruct endon( "waittill_proc" );
    self waittill( notifymessage );
    notifystruct notify( "waittill_proc", notifymessage );
}

// Namespace utility
// Params 2
// Checksum 0x8d9e4ed5, Offset: 0x7f45
// Size: 0x2f
function waittill_timeout_proc( notifystruct, timeout )
{
    notifystruct endon( "waittill_proc" );
    wait timeout;
    notifystruct notify( "waittill_proc", "timeout" );
}

// Namespace utility
// Params 2
// Checksum 0xe2385beb, Offset: 0x7f7c
// Size: 0x66
function waittill_notify_and_time( msg, time )
{
    starttime = gettime();
    self waittill( msg );
    endtime = starttime + time * 1000;
    timeleft = endtime - starttime;
    
    if ( timeleft > 0 )
    {
        waittime = timeleft / 1000;
        wait waittime;
    }
}

// Namespace utility
// Params 2
// Checksum 0xfeee8ae4, Offset: 0x7fea
// Size: 0x1d
function function_3be250f0ba0da4f6( msg, time )
{
    self waittill( msg );
    wait time;
}

// Namespace utility
// Params 3
// Checksum 0x1139ba8d, Offset: 0x800f
// Size: 0xe3
function array_wait( array, message, timeout )
{
    notifystruct = spawnstruct();
    
    if ( timeout )
    {
        thread array_wait_timeout_proc( notifystruct, timeout );
        notifystruct endon( "array_wait_timeout" );
    }
    
    foreach ( element in array )
    {
        thread array_wait_proc( notifystruct, element, message );
    }
    
    for ( i = 0; i < array.size ; i++ )
    {
        notifystruct waittill( "array_wait_proc" );
    }
    
    notifystruct notify( "array_wait_success" );
}

// Namespace utility
// Params 3
// Checksum 0x5076b05f, Offset: 0x80fa
// Size: 0x3f
function array_wait_proc( notifystruct, element, message )
{
    notifystruct endon( "array_wait_success" );
    element waittill_any( message, "death" );
    notifystruct notify( "array_wait_proc" );
}

// Namespace utility
// Params 2
// Checksum 0x9f054eab, Offset: 0x8141
// Size: 0x2a
function array_wait_timeout_proc( notifystruct, timeout )
{
    notifystruct endon( "array_wait_success" );
    wait timeout;
    notifystruct notify( "array_wait_timeout" );
}

// Namespace utility
// Params 2
// Checksum 0x2f6996c0, Offset: 0x8173
// Size: 0xac
function array_any_wait( array, message )
{
    notifystruct = spawnstruct();
    
    foreach ( element in array )
    {
        thread array_any_wait_proc( notifystruct, element, message );
    }
    
    notifystruct waittill( "array_wait_proc", result );
    return result;
}

// Namespace utility
// Params 3
// Checksum 0x95cd7208, Offset: 0x8228
// Size: 0xbf
function array_any_wait_timeout( array, message, timeout )
{
    notifystruct = spawnstruct();
    thread array_any_wait_timeout_proc( notifystruct, timeout );
    
    foreach ( element in array )
    {
        thread array_any_wait_proc( notifystruct, element, message );
    }
    
    notifystruct waittill( "array_wait_proc", result );
    return result;
}

// Namespace utility
// Params 3
// Checksum 0x958277e0, Offset: 0x82f0
// Size: 0x43
function array_any_wait_proc( notifystruct, element, message )
{
    result = element waittill_any_return_no_endon_death( message, "death" );
    notifystruct notify( "array_wait_proc", result );
}

// Namespace utility
// Params 2
// Checksum 0xdea8c483, Offset: 0x833b
// Size: 0x2f
function array_any_wait_timeout_proc( notifystruct, timeout )
{
    notifystruct endon( "array_wait_proc" );
    wait timeout;
    notifystruct notify( "array_wait_proc", "timeout" );
}

// Namespace utility
// Params 2
// Checksum 0xa613a55, Offset: 0x8372
// Size: 0xa4
function array_any_wait_return( array, message )
{
    notifystruct = spawnstruct();
    
    foreach ( element in array )
    {
        thread array_any_wait_return_proc( notifystruct, element, message );
    }
    
    notifystruct waittill( "array_wait_proc", element );
    return element;
}

// Namespace utility
// Params 3
// Checksum 0x50b49f98, Offset: 0x841f
// Size: 0x43
function array_any_wait_return_proc( notifystruct, element, message )
{
    result = element waittill_any_return( message, "death" );
    notifystruct notify( "array_wait_proc", element );
}

// Namespace utility
// Params 0
// Checksum 0xb9e85bf, Offset: 0x846a
// Size: 0x3b
function fileprint_launcher_start_file()
{
    assert( !isdefined( level.fileprint_launcher ), "<dev string:x584>" );
    level.fileprintlauncher_linecount = 0;
    level.fileprint_launcher = 1;
    fileprint_launcher( "GAMEPRINTSTARTFILE:" );
}

// Namespace utility
// Params 1
// Checksum 0xf5f739fc, Offset: 0x84ad
// Size: 0x57
function fileprint_launcher( string )
{
    assert( isdefined( level.fileprintlauncher_linecount ) );
    level.fileprintlauncher_linecount++;
    
    if ( level.fileprintlauncher_linecount > 200 )
    {
        wait 0.05;
        level.fileprintlauncher_linecount = 0;
    }
    
    println( "<dev string:x5ca>" + string );
}

// Namespace utility
// Params 2
// Checksum 0x20b0b051, Offset: 0x850c
// Size: 0x18a, Type: bool
function fileprint_launcher_end_file( var_5756f07f5c4d9982, var_390f5c13316351df = 0 )
{
    /#
        setdevdvarifuninitialized( @"hash_d84b138e7aa2f2df", "<dev string:x5de>" );
        setdevdvarifuninitialized( @"hash_afbeda0efab5bd5e", "<dev string:x5de>" );
    #/
    
    if ( var_390f5c13316351df )
    {
        fileprint_launcher( "GAMEPRINTENDFILE:GAMEPRINTP4ENABLED:" + var_5756f07f5c4d9982 );
    }
    else
    {
        fileprint_launcher( "GAMEPRINTENDFILE:" + var_5756f07f5c4d9982 );
    }
    
    timeout = gettime() + 4000;
    
    while ( getdvarint( @"hash_afbeda0efab5bd5e" ) == 0 && getdvar( @"hash_d84b138e7aa2f2df" ) == "0" && gettime() < timeout )
    {
        wait 0.05;
    }
    
    if ( !( gettime() < timeout ) )
    {
        iprintlnbold( "LAUNCHER_PRINT_FAIL:( TIMEOUT ): launcherconflict? restart launcher and try again? " );
        
        /#
            setdevdvar( @"hash_d84b138e7aa2f2df", "<dev string:x5de>" );
        #/
        
        level.fileprint_launcher = undefined;
        return false;
    }
    
    failvar = getdvar( @"hash_d84b138e7aa2f2df" );
    
    if ( failvar != "0" )
    {
        iprintlnbold( "LAUNCHER_PRINT_FAIL:( " + failvar + " ): launcherconflict? restart launcher and try again? " );
        
        /#
            setdevdvar( @"hash_d84b138e7aa2f2df", "<dev string:x5de>" );
        #/
        
        level.fileprint_launcher = undefined;
        return false;
    }
    
    /#
        setdevdvar( @"hash_d84b138e7aa2f2df", "<dev string:x5de>" );
        setdevdvar( @"hash_afbeda0efab5bd5e", "<dev string:x5de>" );
    #/
    
    iprintlnbold( "Launcher write to file successful!" );
    level.fileprint_launcher = undefined;
    return true;
}

// Namespace utility
// Params 1
// Checksum 0x1390abc7, Offset: 0x869f
// Size: 0x25
function launcher_write_clipboard( str )
{
    level.fileprintlauncher_linecount = 0;
    fileprint_launcher( "LAUNCHER_CLIP:" + str );
}

// Namespace utility
// Params 0
// Checksum 0x83267c1f, Offset: 0x86cc
// Size: 0x9
function activate_individual_exploder()
{
    exploder::activate_individual_exploder_proc();
}

// Namespace utility
// Params 1
// Checksum 0xab5653d6, Offset: 0x86dd
// Size: 0xe1
function get_target_ent( target = self.target )
{
    assert( isdefined( target ), "<dev string:x5e3>" );
    var_7237854e3be197ca = getent( target, #targetname );
    
    if ( isdefined( var_7237854e3be197ca ) )
    {
        return var_7237854e3be197ca;
    }
    
    if ( issp() )
    {
        var_7237854e3be197ca = builtin [[ level.getnodefunction ]]( target, "targetname" );
        
        if ( isdefined( var_7237854e3be197ca ) )
        {
            return var_7237854e3be197ca;
        }
        
        var_7237854e3be197ca = builtin [[ level.func[ "getspawner" ] ]]( target, "targetname" );
        
        if ( isdefined( var_7237854e3be197ca ) )
        {
            return var_7237854e3be197ca;
        }
    }
    
    var_7237854e3be197ca = getstruct( target, "targetname" );
    
    if ( isdefined( var_7237854e3be197ca ) )
    {
        return var_7237854e3be197ca;
    }
    
    var_7237854e3be197ca = getvehiclenode( target, #targetname );
    
    if ( isdefined( var_7237854e3be197ca ) )
    {
        return var_7237854e3be197ca;
    }
    
    assertmsg( "<dev string:x5fa>" + target + "<dev string:x60f>" );
}

// Namespace utility
// Params 0
// Checksum 0xc4a8e285, Offset: 0x87c6
// Size: 0x14
function get_links()
{
    return strtok( self.script_linkto, " " );
}

// Namespace utility
// Params 0
// Checksum 0xeccfe02, Offset: 0x87e3
// Size: 0x64
function get_linked_ents()
{
    array = [];
    
    if ( isdefined( self.script_linkto ) )
    {
        linknames = get_links();
        
        if ( linknames.size == 1 )
        {
            return getentarray( linknames[ 0 ], #script_linkname );
        }
        else if ( linknames.size > 1 )
        {
            return function_92805cf2b0baa4ca( linknames, #script_linkname );
        }
    }
    
    return array;
}

// Namespace utility
// Params 0
// Checksum 0xa5aecd26, Offset: 0x8850
// Size: 0x31
function get_linked_ent()
{
    array = get_linked_ents();
    assert( array.size == 1 );
    assert( isdefined( array[ 0 ] ) );
    return array[ 0 ];
}

// Namespace utility
// Params 0
// Checksum 0x3ccab980, Offset: 0x888a
// Size: 0x58
function get_linked_nodes()
{
    if ( isdefined( self.script_linkto ) )
    {
        linknames = get_links();
        
        if ( linknames.size == 1 )
        {
            return getnodearray( linknames[ 0 ], #script_linkname );
        }
        else if ( linknames.size > 1 )
        {
            return function_42ca83289e883f89( linknames, #script_linkname );
        }
    }
    
    return [];
}

// Namespace utility
// Params 0
// Checksum 0xd944b126, Offset: 0x88eb
// Size: 0x3a
function function_3b7b402e203142e7()
{
    array = get_linked_nodes();
    
    if ( !array.size )
    {
        return undefined;
    }
    
    assert( array.size == 1 );
    assert( isdefined( array[ 0 ] ) );
    return array[ 0 ];
}

// Namespace utility
// Params 0
// Checksum 0xdfe24f2e, Offset: 0x892e
// Size: 0x6f
function function_e1bb0bf82dab729e()
{
    array = [];
    
    if ( isdefined( self.script_linkto ) )
    {
        linknames = get_links();
        
        for ( i = 0; i < linknames.size ; i++ )
        {
            scriptables = getentitylessscriptablearray( linknames[ i ], "script_linkname" );
            
            if ( scriptables.size > 0 )
            {
                array = arraycombine( array, scriptables );
            }
        }
    }
    
    return array;
}

// Namespace utility
// Params 2
// Checksum 0xfa7ecf8d, Offset: 0x89a6
// Size: 0x7b
function do_earthquake( name, origin )
{
    eq = level.earthquake[ name ];
    earthquake( eq[ "magnitude" ], eq[ "duration" ], origin, eq[ "radius" ] );
    
    if ( isdefined( level.var_2d9450b396fc7d4d ) )
    {
        level thread [[ level.var_2d9450b396fc7d4d ]]( name, origin, eq[ "magnitude" ], eq[ "duration" ], eq[ "radius" ] );
    }
}

// Namespace utility
// Params 2
// Checksum 0x8a5285db, Offset: 0x8a29
// Size: 0x72
function play_loopsound_in_space( alias, origin )
{
    org = spawn( "script_origin", ( 0, 0, 0 ) );
    org.targetname = "play_loopsound_in_space";
    
    if ( !isdefined( origin ) )
    {
        origin = self.origin;
    }
    
    org.origin = origin;
    org playloopsound( alias );
    return org;
}

// Namespace utility
// Params 4
// Checksum 0x64599a9b, Offset: 0x8aa4
// Size: 0xdf
function play_sound_in_space_with_angles( alias, origin, angles, parent )
{
    org = spawn( "script_origin", ( 0, 0, 1 ) );
    org.targetname = "play_sound_in_space_with_angles";
    org.origin = origin ?? self.origin;
    org.angles = angles;
    
    if ( isdefined( parent ) )
    {
        org linkto( parent );
    }
    
    /#
        if ( isdefined( self.v ) )
        {
            org.createfx_ent = 1;
        }
    #/
    
    if ( issp() )
    {
        org playsound( alias, "sounddone" );
        org waittill( "sounddone" );
    }
    else
    {
        org playsound( alias );
    }
    
    org delete();
}

// Namespace utility
// Params 3
// Checksum 0x77c8b78b, Offset: 0x8b8b
// Size: 0x37
function play_sound_in_space( alias, origin, parent )
{
    play_sound_in_space_with_angles( alias, origin, ( 0, 0, 0 ), parent );
}

// Namespace utility
// Params 5
// Checksum 0x92fcf6bf, Offset: 0x8bca
// Size: 0x153
function play_loop_sound_on_tag( alias, tag, bstopsoundondeath, var_af7c308ffd7e030e, release_sound )
{
    org = spawn( "script_origin", ( 0, 0, 0 ) );
    org.targetname = "play_loop_soun_on_tag";
    org endon( "death" );
    
    if ( !isdefined( bstopsoundondeath ) )
    {
        bstopsoundondeath = 1;
    }
    
    if ( bstopsoundondeath )
    {
        thread delete_on_death( org );
    }
    
    if ( !isdefined( var_af7c308ffd7e030e ) )
    {
        var_af7c308ffd7e030e = 0;
    }
    
    if ( var_af7c308ffd7e030e )
    {
        thread delete_on_removed( org );
    }
    
    if ( isdefined( tag ) )
    {
        org linkto( self, tag, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    }
    else
    {
        org.origin = self.origin;
        org.angles = self.angles;
        org linkto( self );
    }
    
    org playloopsound( alias );
    self waittill( "stop sound" + alias );
    
    if ( isdefined( release_sound ) )
    {
        org playsound( release_sound, "sounddone" );
        org delaycall( 0.15, &stoploopsound, alias );
        org waittill( "sounddone" );
        org delete();
        return;
    }
    
    org stoploopsound( alias );
    org delete();
}

// Namespace utility
// Params 1
// Checksum 0xf2aa8b8a, Offset: 0x8d25
// Size: 0x30
function delete_on_removed( ent )
{
    ent endon( "death" );
    
    while ( isdefined( self ) )
    {
        wait 0.05;
    }
    
    if ( isdefined( ent ) )
    {
        ent delete();
    }
}

// Namespace utility
// Params 5
// Checksum 0x23f54458, Offset: 0x8d5d
// Size: 0x4b
function loop_fx_sound( alias, origin, culled, ender, createfx_ent )
{
    loop_fx_sound_with_angles( alias, origin, ( 0, 0, 0 ), culled, ender, createfx_ent );
}

// Namespace utility
// Params 7
// Checksum 0xf760c62, Offset: 0x8db0
// Size: 0x14b
function loop_fx_sound_with_angles( alias, origin, angles, culled, ender, createfx_ent, shape )
{
    if ( culled )
    {
        if ( !isdefined( level.first_frame ) || level.first_frame == 1 )
        {
            spawnloopingsound( alias, origin, angles );
        }
        
        return;
    }
    
    if ( level.createfx_enabled && isdefined( createfx_ent.loopsound_ent ) )
    {
        org = createfx_ent.loopsound_ent;
    }
    else
    {
        org = spawn( "script_origin", ( 0, 0, 0 ) );
        org.targetname = "loop_fx_sound_with_angles";
    }
    
    /#
        if ( isdefined( self.v ) )
        {
            org.createfx_ent = 1;
        }
    #/
    
    if ( isdefined( ender ) )
    {
        thread loop_sound_delete( ender, org );
        self endon( ender );
    }
    
    org.origin = origin;
    org.angles = angles;
    org playloopsound( alias );
    
    if ( level.createfx_enabled )
    {
        createfx_ent.loopsound_ent = org;
        return;
    }
    
    org willneverchange();
}

// Namespace utility
// Params 6
// Checksum 0xb3a3e7e5, Offset: 0x8f03
// Size: 0x56
function loop_fx_sound_interval( alias, origin, ender, timeout, delay_min, delay_max )
{
    loop_fx_sound_interval_with_angles( alias, origin, ( 0, 0, 0 ), ender, timeout, delay_min, delay_max );
}

// Namespace utility
// Params 7
// Checksum 0x71ca34d0, Offset: 0x8f61
// Size: 0x117
function loop_fx_sound_interval_with_angles( alias, origin, angles, ender, timeout, delay_min, delay_max )
{
    self.origin = origin;
    self.angles = angles;
    
    if ( isdefined( ender ) )
    {
        self endon( ender );
    }
    
    if ( delay_min >= delay_max )
    {
        while ( true )
        {
            /#
                print3d( origin, "<dev string:x62a>", ( 1, 0, 0 ), 1, 1 );
            #/
            
            wait 0.05;
        }
    }
    
    if ( !soundexists( alias ) )
    {
        while ( true )
        {
            /#
                print3d( origin, "<dev string:x644>" + alias, ( 1, 0, 0 ), 1, 1 );
            #/
            
            wait 0.05;
        }
    }
    
    while ( true )
    {
        wait randomfloatrange( delay_min, delay_max );
        lock( "createfx_looper" );
        thread play_sound_in_space_with_angles( alias, self.origin, self.angles, undefined );
        unlock( "createfx_looper" );
    }
}

// Namespace utility
// Params 2
// Checksum 0x39f37c13, Offset: 0x9080
// Size: 0x2a
function loop_sound_delete( ender, ent )
{
    ent endon( "death" );
    self waittill( ender );
    ent delete();
}

// Namespace utility
// Params 1
// Checksum 0x714571, Offset: 0x90b2
// Size: 0x3f
function createloopeffect( fxid )
{
    ent = createfx::createeffect( "loopfx", fxid );
    ent.v[ "delay" ] = createfx::getloopeffectdelaydefault();
    return ent;
}

// Namespace utility
// Params 1
// Checksum 0xb6d4bc47, Offset: 0x90fa
// Size: 0x3f
function createoneshoteffect( fxid )
{
    ent = createfx::createeffect( "oneshotfx", fxid );
    ent.v[ "delay" ] = createfx::getoneshoteffectdelaydefault();
    return ent;
}

// Namespace utility
// Params 2
// Checksum 0x20a5ad8f, Offset: 0x9142
// Size: 0x60
function createexploder( fxid, islevelexploder )
{
    ent = createfx::createeffect( "exploder", fxid, islevelexploder );
    ent.v[ "delay" ] = createfx::getexploderdelaydefault();
    ent.v[ "exploder_type" ] = "normal";
    return ent;
}

// Namespace utility
// Params 2
// Checksum 0x60acca80, Offset: 0x91ab
// Size: 0xec
function play_loop_sound_on_entity( alias, offset )
{
    org = spawn( "script_origin", ( 0, 0, 0 ) );
    org.targetname = "loop_sound_on_entity";
    org endon( "death" );
    thread delete_on_death( org );
    
    if ( isdefined( offset ) )
    {
        org.origin = self.origin + offset;
        org.angles = self.angles;
        org linkto( self );
    }
    else
    {
        org.origin = self.origin;
        org.angles = self.angles;
        org linkto( self );
    }
    
    org playloopsound( alias );
    self waittill( "stop sound" + alias );
    org stoploopsound( alias );
    org delete();
}

// Namespace utility
// Params 1
// Checksum 0x90236bbb, Offset: 0x929f
// Size: 0x17
function stop_loop_sound_on_entity( alias )
{
    self notify( "stop sound" + alias );
}

// Namespace utility
// Params 1
// Checksum 0x998144b7, Offset: 0x92be
// Size: 0x2a
function delete_on_death( ent )
{
    ent endon( "death" );
    self waittill( "death" );
    
    if ( isdefined( ent ) )
    {
        ent delete();
    }
}

// Namespace utility
// Params 1
// Checksum 0x4ed334c7, Offset: 0x92f0
// Size: 0x2a
function function_90c4cadf70686d3d( ent )
{
    ent endon( "death" );
    self waittill( "death" );
    
    if ( isdefined( ent ) )
    {
        ent destroy();
    }
}

// Namespace utility
// Params 0
// Checksum 0x25803d1b, Offset: 0x9322
// Size: 0x10
function delete_on_sounddone()
{
    self waittill( "sounddone" );
    self delete();
}

// Namespace utility
// Params 1
// Checksum 0xf83e2f1c, Offset: 0x933a
// Size: 0x17
function delete_on_notify( msg )
{
    self waittill( msg );
    self delete();
}

// Namespace utility
// Params 2
// Checksum 0xf64ac0dc, Offset: 0x9359
// Size: 0x27
function function_9a9165839779317f( ent, msg )
{
    self waittill( msg );
    
    if ( isdefined( ent ) )
    {
        ent delete();
    }
}

// Namespace utility
// Params 1
// Checksum 0xb79ef5e4, Offset: 0x9388
// Size: 0x1a
function function_439f7faeb95d2028( delay )
{
    wait delay;
    
    if ( isdefined( self ) )
    {
        self delete();
    }
}

/#

    // Namespace utility
    // Params 1
    // Checksum 0xd19263db, Offset: 0x93aa
    // Size: 0x3e, Type: dev
    function error( msg )
    {
        println( "<dev string:x652>", msg );
        
        if ( getdvarint( @"scr_debug" ) != 1 )
        {
            assertmsg( "<dev string:x663>" + msg );
        }
    }

#/

// Namespace utility
// Params 5
// Checksum 0x1e848fab, Offset: 0x93f0
// Size: 0x8c
function exploder( num, players, starttime, radius, origin )
{
    if ( level.var_630c046b7e8fcc54 == gettime() )
    {
        delaythread( level.framedurationseconds, level._fx.exploderfunction, num, players, starttime, radius, origin );
        return;
    }
    
    self [[ level._fx.exploderfunction ]]( num, players, starttime, radius, origin );
}

// Namespace utility
// Params 1
// Checksum 0xd08c9ab, Offset: 0x9484
// Size: 0x15
function delete_exploder( num )
{
    exploder::delete_exploder_proc( num );
}

// Namespace utility
// Params 1
// Checksum 0x9a29e55, Offset: 0x94a1
// Size: 0x15
function hide_exploder_models( num )
{
    exploder::hide_exploder_models_proc( num );
}

// Namespace utility
// Params 1
// Checksum 0x324e5492, Offset: 0x94be
// Size: 0x15
function show_exploder_models( num )
{
    exploder::show_exploder_models_proc( num );
}

// Namespace utility
// Params 4
// Checksum 0x5d09a439, Offset: 0x94db
// Size: 0x35
function stop_exploder( num, players, radius, origin )
{
    exploder::stop_exploder_proc( num, players, 0, radius, origin );
}

// Namespace utility
// Params 4
// Checksum 0x85ca3a15, Offset: 0x9518
// Size: 0x36
function kill_exploder( num, players, radius, origin )
{
    exploder::stop_exploder_proc( num, players, 1, radius, origin );
}

// Namespace utility
// Params 1
// Checksum 0x89605656, Offset: 0x9556
// Size: 0x14
function get_exploder_array( msg )
{
    return exploder::get_exploder_array_proc( msg );
}

// Namespace utility
// Params 3
// Checksum 0x31d8b17c, Offset: 0x9573
// Size: 0x3a
function function_e153375527829ec3( value, default_value, err_msg )
{
    if ( !isdefined( value ) )
    {
        if ( isdefined( err_msg ) )
        {
            assertmsg( err_msg );
        }
        
        return default_value;
    }
    
    return value;
}

// Namespace utility
// Params 2
// Checksum 0x9b8a1fc7, Offset: 0x95b6
// Size: 0x78
function create_lock( msg, count = 1 )
{
    assert( isdefined( msg ) );
    
    if ( !isdefined( level.lock ) )
    {
        level.lock = [];
    }
    
    lock_struct = spawnstruct();
    lock_struct.max_count = count;
    lock_struct.count = 0;
    level.lock[ msg ] = lock_struct;
}

// Namespace utility
// Params 1
// Checksum 0x187d57b6, Offset: 0x9636
// Size: 0x7d
function lock( msg )
{
    assert( isdefined( level.lock ) );
    assert( isdefined( level.lock[ msg ] ) );
    lock = level.lock[ msg ];
    
    while ( lock.count >= lock.max_count )
    {
        lock waittill( "unlocked" );
    }
    
    lock.count++;
}

// Namespace utility
// Params 1
// Checksum 0x1a1303e9, Offset: 0x96bb
// Size: 0x15
function unlock( msg )
{
    thread unlock_thread( msg );
}

// Namespace utility
// Params 1
// Checksum 0x8bcf341d, Offset: 0x96d8
// Size: 0x7b
function unlock_thread( msg )
{
    wait 0.05;
    assert( isdefined( level.lock ) );
    assert( isdefined( level.lock[ msg ] ) );
    lock = level.lock[ msg ];
    lock.count--;
    assert( lock.count >= 0 );
    lock notify( "unlocked" );
}

// Namespace utility
// Params 1
// Checksum 0xeb7f7548, Offset: 0x975b
// Size: 0x1b
function unlock_wait( msg )
{
    thread unlock_thread( msg );
    wait 0.05;
}

// Namespace utility
// Params 0
// Checksum 0xa67d7ff9, Offset: 0x977e
// Size: 0x2b
function is_player_gamepad_enabled()
{
    var_cfeeac0e68c399bc = self usinggamepad();
    
    if ( isdefined( var_cfeeac0e68c399bc ) )
    {
        return var_cfeeac0e68c399bc;
    }
    else if ( self ispcplayer() )
    {
        return 0;
    }
    
    return 1;
}

// Namespace utility
// Params 3
// Checksum 0xea1f1c3b, Offset: 0x97b2
// Size: 0x3d
function player_prestream_camera( position, duration = 5, altposition = undefined )
{
    thread function_6aed4101339d998e( position, duration, altposition );
}

// Namespace utility
// Params 3, eflags: 0x4
// Checksum 0xc368c071, Offset: 0x97f7
// Size: 0xa7
function private function_6aed4101339d998e( position, duration = 5, altposition = undefined )
{
    assert( isplayer( self ) );
    player = self;
    player notify( "player_prestream_camera" );
    player endon( "player_prestream_camera" );
    player endon( "death_or_disconnect" );
    player clearadditionalstreampos();
    
    if ( isdefined( altposition ) )
    {
        player function_e6041d36d91ce843( altposition );
    }
    
    player function_fa0ccd6d13222597( position );
    
    if ( duration > 0 )
    {
        wait duration;
    }
    else if ( duration < 0 )
    {
        return;
    }
    
    player clearadditionalstreampos();
    player clearpredictedstreampos();
}

// Namespace utility
// Params 2
// Checksum 0x6844e54b, Offset: 0x98a6
// Size: 0x8d
function function_e40bca834d4122cf( position, timeoutsec = 2 )
{
    assert( isplayer( self ) );
    player = self;
    player clearadditionalstreampos();
    player function_fa0ccd6d13222597( position );
    endtime = gettime() + timeoutsec * 1000;
    
    while ( isdefined( player ) && gettime() < endtime )
    {
        waitframe();
        
        if ( player ispredictedstreamposready() )
        {
            break;
        }
    }
    
    if ( isdefined( player ) )
    {
        player clearpredictedstreampos();
    }
}

// Namespace utility
// Params 4
// Checksum 0x43913beb, Offset: 0x993b
// Size: 0xe4
function player_prestream_assets( assettype, assets, distances, duration = 5 )
{
    if ( !isarray( assets ) )
    {
        assets = [ assets ];
    }
    
    if ( !isdefined( distances ) )
    {
        distances = [];
        
        foreach ( asset in assets )
        {
            distances[ distances.size ] = 50;
        }
    }
    else if ( !isarray( distances ) )
    {
        distances = [ distances ];
    }
    
    thread player_prestream_assets_thread( assettype, assets, distances, duration );
}

// Namespace utility
// Params 4, eflags: 0x4
// Checksum 0x16c8b460, Offset: 0x9a27
// Size: 0x125
function private player_prestream_assets_thread( assettype, assets, distances, duration )
{
    assert( isplayer( self ) );
    player = self;
    player notify( "player_prestream_assets_thread_" + assettype );
    player endon( "player_prestream_assets_thread_" + assettype );
    player endon( "disconnect" );
    player prestreamclear( assettype );
    
    if ( duration != 0 )
    {
        foreach ( idx, asset in assets )
        {
            if ( self function_72b767355af09ad8() >= 32 )
            {
                /#
                    iprintln( "<dev string:x696>" + 32 );
                #/
                
                break;
            }
            
            if ( isdefined( asset ) )
            {
                player prestreamasset( assettype, asset, distances[ idx ] );
            }
        }
        
        if ( duration < 0 )
        {
            return;
        }
        
        wait duration;
        
        if ( isplayer( player ) )
        {
            player prestreamclear( assettype );
        }
    }
}

// Namespace utility
// Params 3
// Checksum 0xa2b48a55, Offset: 0x9b54
// Size: 0x32
function function_b616dec377c0b1c5( assettype, asset, dist = 50 )
{
    thread function_f23e597bf8ac79da( assettype, asset, dist );
}

// Namespace utility
// Params 3, eflags: 0xc
// Checksum 0x51d34bce, Offset: 0x9b8e
// Size: 0x227
function private function_f23e597bf8ac79da( assettype, asset, dist )
{
    self notify( "de4251ec5ab56fa6" );
    self endon( "de4251ec5ab56fa6" );
    player = self;
    player endon( "disconnect" );
    
    if ( !isdefined( player.prestreamtouch ) )
    {
        player.prestreamtouch = [];
    }
    
    if ( !isdefined( player.prestreamtouch[ assettype ] ) )
    {
        player.prestreamtouch[ assettype ] = [];
    }
    
    if ( isdefined( player.prestreamtouch[ assettype ][ asset ] ) )
    {
        player.prestreamtouch[ assettype ][ asset ] = min( player.prestreamtouch[ assettype ][ asset ], dist );
    }
    else
    {
        player.prestreamtouch[ assettype ][ asset ] = dist;
    }
    
    waittillframeend();
    cleartypes = [];
    
    foreach ( assettype, assets in player.prestreamtouch )
    {
        cleartypes[ cleartypes.size ] = assettype;
        player prestreamclear( assettype );
        
        foreach ( asset, dist in assets )
        {
            player prestreamasset( assettype, asset, dist );
        }
    }
    
    player.prestreamtouch = undefined;
    waitframe();
    
    foreach ( assettype in cleartypes )
    {
        player prestreamclear( assettype );
    }
}

// Namespace utility
// Params 2
// Checksum 0x145ee545, Offset: 0x9dbd
// Size: 0x1d
function distance_2d_squared( a, b )
{
    return length2dsquared( a - b );
}

// Namespace utility
// Params 6
// Checksum 0x8c7113d2, Offset: 0x9de3
// Size: 0x5f
function get_array_of_farthest( org, array, excluders, max, maxdist, mindist )
{
    aarray = get_array_of_closest( org, array, excluders, max, maxdist, mindist );
    aarray = array_reverse( aarray );
    return aarray;
}

// Namespace utility
// Params 7
// Checksum 0xc4fdb52f, Offset: 0x9e4b
// Size: 0x228
function get_array_of_closest( org, array, excluders = [], max = array.size, maxdist, mindist, reversesort = 0 )
{
    maxdist2rd = undefined;
    
    if ( isdefined( maxdist ) )
    {
        maxdist2rd = maxdist * maxdist;
    }
    
    mindist2rd = 0;
    
    if ( isdefined( mindist ) )
    {
        mindist2rd = mindist * mindist;
    }
    
    if ( excluders.size == 0 && max >= array.size && mindist2rd == 0 && !isdefined( maxdist2rd ) )
    {
        return sortbydistance( array, org );
    }
    
    newarray = [];
    
    foreach ( ent in array )
    {
        excluded = 0;
        
        foreach ( excluder in excluders )
        {
            if ( ent == excluder )
            {
                excluded = 1;
                break;
            }
        }
        
        if ( excluded )
        {
            continue;
        }
        
        dist2rd = distancesquared( org, ent.origin );
        
        if ( dist2rd > maxdist2rd )
        {
            continue;
        }
        
        if ( dist2rd < mindist2rd )
        {
            continue;
        }
        
        newarray[ newarray.size ] = ent;
    }
    
    newarray = sortbydistance( newarray, org, reversesort );
    
    if ( max >= newarray.size )
    {
        return newarray;
    }
    
    finalarray = [];
    
    for ( i = 0; i < max ; i++ )
    {
        finalarray[ i ] = newarray[ i ];
    }
    
    return finalarray;
}

// Namespace utility
// Params 3
// Checksum 0xac2abedb, Offset: 0xa07c
// Size: 0xc0
function function_6827a4ce28e62b74( org, array, maxdist )
{
    maxdistsquared = maxdist * maxdist;
    finalarray = [];
    
    foreach ( ent in array )
    {
        if ( distance2dsquared( org, ent.origin ) < maxdistsquared )
        {
            finalarray[ finalarray.size ] = ent;
        }
    }
    
    return finalarray;
}

// Namespace utility
// Params 7
// Checksum 0x188fd50e, Offset: 0xa145
// Size: 0x11b
function drop_to_ground( pos, updist, downdist, upvector, contents, ignore, var_6349832b72dd54b0 )
{
    if ( issharedfuncdefined( #"UTILITY", #"drop_to_ground" ) )
    {
        return callsharedfunc( #"UTILITY", #"drop_to_ground", pos, updist, downdist, upvector, contents );
    }
    
    assert( isdefined( pos ), "<dev string:x6cd>" );
    
    if ( !isdefined( updist ) )
    {
        updist = 1500;
    }
    
    if ( !isdefined( downdist ) )
    {
        downdist = -12000;
    }
    
    if ( !isdefined( contents ) )
    {
        contents = trace::create_solid_ai_contents( 1 );
    }
    
    if ( isdefined( upvector ) )
    {
        result = trace::ray_trace( pos + updist * upvector, pos + downdist * upvector, ignore, contents );
    }
    else
    {
        result = trace::ray_trace( pos + ( 0, 0, updist ), pos + ( 0, 0, downdist ), ignore, contents );
    }
    
    if ( var_6349832b72dd54b0 )
    {
        return [ result[ "position" ], result[ "normal" ] ];
    }
    
    return result[ "position" ];
}

// Namespace utility
// Params 5
// Checksum 0x59300504, Offset: 0xa268
// Size: 0x9e
function player_drop_to_ground( pos, radius, updist = 1500, downdist = -12000, upvector )
{
    contents = trace::create_solid_ai_contents( 1 );
    
    if ( isdefined( upvector ) )
    {
        return trace::sphere_trace( pos + updist * upvector, pos + downdist * upvector, radius, undefined, contents )[ "position" ];
    }
    
    return trace::sphere_trace( pos + ( 0, 0, updist ), pos + ( 0, 0, downdist ), radius, undefined, contents )[ "position" ];
}

// Namespace utility
// Params 4
// Checksum 0x917164d3, Offset: 0xa30e
// Size: 0xae
function function_5918594658d3ffba( pos, up_dist, down_dist, z_tolerance = 32 )
{
    ground_pos = drop_to_ground( pos, up_dist, down_dist );
    navmesh_pos = getclosestpointonnavmesh( ground_pos, undefined, 0, 0, 0 );
    
    if ( isdefined( navmesh_pos ) )
    {
        max_z = max( ground_pos[ 2 ], navmesh_pos[ 2 ] );
        min_z = min( ground_pos[ 2 ], navmesh_pos[ 2 ] );
        
        if ( max_z - min_z <= z_tolerance )
        {
            final_pos = ( navmesh_pos[ 0 ], navmesh_pos[ 1 ], max_z );
            return final_pos;
        }
    }
    
    return undefined;
}

// Namespace utility
// Params 4
// Checksum 0x6aa56abb, Offset: 0xa3c5
// Size: 0x31
function within_fov( start_origin, start_angles, end_origin, fov )
{
    return withinfov( start_origin, start_angles, end_origin, fov );
}

// Namespace utility
// Params 3
// Checksum 0x3a342fd0, Offset: 0xa3ff
// Size: 0x10e
function function_4325398d215ecda5( org, array, maxdist )
{
    closestent = undefined;
    closestdistancesq = isdefined( maxdist ) ? squared( maxdist ) : undefined;
    
    foreach ( ent in array )
    {
        if ( isent( ent ) )
        {
            point = ent.origin;
        }
        else if ( isvector( ent ) )
        {
            point = ent;
        }
        
        if ( !isdefined( point ) )
        {
            continue;
        }
        
        distancesq = distance2dsquared( point, org );
        
        if ( !isdefined( closestdistancesq ) || distancesq < closestdistancesq )
        {
            closestent = ent;
            closestdistancesq = distancesq;
        }
    }
    
    return closestent;
}

// Namespace utility
// Params 4
// Checksum 0xa3372ff5, Offset: 0xa516
// Size: 0x10f
function function_c8d94894e1fd8fc8( org, array, max_dist, filter )
{
    closest_ent = undefined;
    var_9306de61005fc497 = isdefined( max_dist ) ? squared( max_dist ) : undefined;
    
    foreach ( ent in array )
    {
        if ( !isdefined( ent.origin ) )
        {
            continue;
        }
        
        if ( isdefined( filter ) && ![[ filter ]]( ent ) )
        {
            continue;
        }
        
        dist_sqr = distancesquared( ent.origin, org );
        
        if ( !isdefined( var_9306de61005fc497 ) || dist_sqr < var_9306de61005fc497 )
        {
            closest_ent = ent;
            var_9306de61005fc497 = dist_sqr;
        }
    }
    
    return closest_ent;
}

// Namespace utility
// Params 1
// Checksum 0xe8b7bcb4, Offset: 0xa62e
// Size: 0x10f
function get_closest_player( needenemyplayer = 0 )
{
    closestplayer = undefined;
    closestdistsq = undefined;
    
    foreach ( player in level.players )
    {
        if ( player == self || !isalive( player ) )
        {
            continue;
        }
        
        if ( needenemyplayer && !isenemyteam( self.team, player.team ) )
        {
            continue;
        }
        
        distsq = distancesquared( self.origin, player.origin );
        
        if ( !isdefined( closestdistsq ) || distsq < closestdistsq )
        {
            closestdistsq = distsq;
            closestplayer = player;
        }
    }
    
    return closestplayer;
}

// Namespace utility
// Params 1
// Checksum 0xe458eb82, Offset: 0xa746
// Size: 0xfc
function function_6e6f301423539d40( needenemyplayer = 0 )
{
    farthestdistsq = 0;
    
    foreach ( player in level.players )
    {
        if ( player == self || !isalive( player ) )
        {
            continue;
        }
        
        if ( needenemyplayer && !isenemyteam( self.team, player.team ) )
        {
            continue;
        }
        
        distsq = distancesquared( self.origin, player.origin );
        
        if ( distsq > farthestdistsq )
        {
            farthestdistsq = distsq;
        }
    }
    
    return farthestdistsq;
}

// Namespace utility
// Params 0
// Checksum 0x69c439d2, Offset: 0xa84b
// Size: 0x9b
function get_alive_players()
{
    a_players = level.players;
    a_alive_players = [];
    
    foreach ( player in a_players )
    {
        if ( isalive( player ) )
        {
            a_alive_players[ a_alive_players.size ] = player;
        }
    }
    
    return a_alive_players;
}

// Namespace utility
// Params 3
// Checksum 0xac5e1b50, Offset: 0xa8ef
// Size: 0x85
function missile_settargetandflightmode( target, mode, offset )
{
    assert( isdefined( target ) );
    assert( isdefined( mode ) );
    
    if ( !isdefined( offset ) )
    {
        offset = ( 0, 0, 0 );
    }
    
    self missile_settargetent( target, offset );
    
    switch ( mode )
    {
        case #"hash_da8b50286ccc05fc":
            self missile_setflightmodedirect();
            break;
        case #"hash_6d308d6c437ce11c":
            self missile_setflightmodetop();
            break;
    }
}

// Namespace utility
// Params 1
// Checksum 0x42a09cd3, Offset: 0xa97c
// Size: 0x2b
function load_fx( effect )
{
    if ( isstartstr( effect, "vfx/" ) )
    {
        return loadfx( effect );
    }
    
    return loadfxasset( effect );
}

// Namespace utility
// Params 2
// Checksum 0x4eed4478, Offset: 0xa9af
// Size: 0xed
function add_fx( fx_id, fx_path )
{
    if ( !isdefined( level._effect ) )
    {
        level._effect = [];
    }
    
    if ( !isdefined( fx_id ) || !isdefined( fx_path ) )
    {
        /#
            var_f188ea89c86785f4 = fx_id ? isxhash( fx_id ) ? getxhashsourcename( fx_id ) : fx_id : "<dev string:x707>";
            var_689ced0ab6b84b5a = fx_path ? isxhash( fx_path ) ? getxhashsourcename( fx_path ) : fx_path : "<dev string:x707>";
            println( "<dev string:x714>" + var_f188ea89c86785f4 + "<dev string:x72e>" + var_689ced0ab6b84b5a + "<dev string:x73e>" );
            assert( isdefined( fx_id ), "<dev string:x74f>" + var_689ced0ab6b84b5a );
            assert( isdefined( fx_path ), "<dev string:x77a>" + var_f188ea89c86785f4 );
        #/
        
        return;
    }
    
    level._effect[ fx_id ] = load_fx( fx_path );
}

// Namespace utility
// Params 2
// Checksum 0xb76b65a7, Offset: 0xaaa4
// Size: 0x39
function create_func_ref( name, func )
{
    if ( !isdefined( level.func ) )
    {
        level.func = [];
    }
    
    level.func[ name ] = func;
}

// Namespace utility
// Params 1
// Checksum 0x119e7b22, Offset: 0xaae5
// Size: 0x41
function create_empty_func_ref( name )
{
    if ( !isdefined( level.func ) )
    {
        level.func = [];
    }
    
    if ( !isdefined( level.func[ name ] ) )
    {
        create_func_ref( name, &empty_init_func );
    }
}

// Namespace utility
// Params 1
// Checksum 0x8a072113, Offset: 0xab2e
// Size: 0x26, Type: bool
function func_ref_exist( name )
{
    return isdefined( level.func ) && isdefined( level.func[ name ] );
}

// Namespace utility
// Params 2
// Checksum 0x53a57c1f, Offset: 0xab5d
// Size: 0x4d, Type: bool
function add_init_script( name, init_function )
{
    if ( !isdefined( level.init_script ) )
    {
        level.init_script = [];
    }
    
    if ( isdefined( level.init_script[ name ] ) )
    {
        return false;
    }
    
    level.init_script[ name ] = init_function;
    return true;
}

// Namespace utility
// Params 1
// Checksum 0xe16a2455, Offset: 0xabb3
// Size: 0x4b
function add_frame_event( event )
{
    if ( !isdefined( self.frame_events ) )
    {
        self.frame_events = [ event ];
        thread process_frame_events();
        return;
    }
    
    self.frame_events[ self.frame_events.size ] = event;
}

// Namespace utility
// Params 0
// Checksum 0x966e3e96, Offset: 0xac06
// Size: 0x8a
function process_frame_events()
{
    while ( true )
    {
        if ( !isdefined( self ) )
        {
            break;
        }
        
        foreach ( event in self.frame_events )
        {
            self thread [[ event ]]();
        }
        
        waitframe();
    }
}

// Namespace utility
// Params 4, eflags: 0x40 variadic
// Checksum 0x941baec2, Offset: 0xac98
// Size: 0x35
function delaythread( timer, func, ... )
{
    thread delaythread_internal( timer, undefined, func, varargcount, vararg );
}

// Namespace utility
// Params 5, eflags: 0x40 variadic
// Checksum 0x72ddf6e7, Offset: 0xacd5
// Size: 0x3e
function delaythreadendon( timer, endonevent, func, ... )
{
    thread delaythread_internal( timer, endonevent, func, varargcount, vararg );
}

// Namespace utility
// Params 5
// Checksum 0xb7f82f54, Offset: 0xad1b
// Size: 0xe2
function delaythread_internal( timer, endonevent, func, varargcount, vararg )
{
    if ( isdefined( self ) && !isarray( self ) )
    {
        self endon( "stop_delay_thread" );
        self endon( "death_or_disconnect" );
        
        if ( isdefined( endonevent ) )
        {
            if ( !isarray( endonevent ) )
            {
                endonevent = [ endonevent ];
            }
            
            foreach ( endonname in endonevent )
            {
                self endon( endonname );
            }
        }
    }
    
    wait timer;
    thread [[ func ]]( flat_args( vararg, varargcount ) );
}

// Namespace utility
// Params 2, eflags: 0x40 variadic
// Checksum 0xb3054e0, Offset: 0xae05
// Size: 0xa7
function damagelocationisany( ... )
{
    if ( isdefined( self.damagelocation ) )
    {
        foreach ( damagelocation in vararg )
        {
            if ( self.damagelocation == damagelocation )
            {
                return 1;
            }
        }
    }
    
    return damagesubpartlocationisany( flat_args( vararg, varargcount ) );
}

// Namespace utility
// Params 2, eflags: 0x40 variadic
// Checksum 0xf970e030, Offset: 0xaeb5
// Size: 0xa1, Type: bool
function damagesubpartlocationisany( ... )
{
    if ( !isdefined( self.damagedsubpart ) )
    {
        return false;
    }
    
    foreach ( damagelocation in vararg )
    {
        if ( self.damagedsubpart == damagelocation )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace utility
// Params 1
// Checksum 0x69687b28, Offset: 0xaf5f
// Size: 0x61
function isbulletdamage( meansofdeath )
{
    if ( !isdefined( meansofdeath ) )
    {
        assertmsg( "<dev string:x7a5>" );
        return 0;
    }
    
    switch ( meansofdeath )
    {
        case #"hash_590bdb04e515167b":
        case #"hash_5f1054c48d66fd1c":
        case #"hash_966768b3f0c94767":
            return 1;
        default:
            return 0;
    }
}

// Namespace utility
// Params 1
// Checksum 0xc29ac108, Offset: 0xafc8
// Size: 0x2a, Type: bool
function isfiredamage( meansofdeath )
{
    if ( !isdefined( meansofdeath ) )
    {
        assertmsg( "<dev string:x7cd>" );
        return false;
    }
    
    return meansofdeath == "MOD_FIRE";
}

// Namespace utility
// Params 1
// Checksum 0x67ddce8, Offset: 0xaffb
// Size: 0x2a, Type: bool
function isimpactdamage( meansofdeath )
{
    if ( !isdefined( meansofdeath ) )
    {
        assertmsg( "<dev string:x7f3>" );
        return false;
    }
    
    return meansofdeath == "MOD_IMPACT";
}

// Namespace utility
// Params 1
// Checksum 0x3bed31a4, Offset: 0xb02e
// Size: 0x2a, Type: bool
function ismeleedamage( meansofdeath )
{
    if ( !isdefined( meansofdeath ) )
    {
        assertmsg( "<dev string:x81b>" );
        return false;
    }
    
    return meansofdeath == "MOD_MELEE";
}

// Namespace utility
// Params 1
// Checksum 0x2f4da46a, Offset: 0xb061
// Size: 0x2a, Type: bool
function ismeatshielddamage( meansofdeath )
{
    if ( !isdefined( meansofdeath ) )
    {
        assertmsg( "<dev string:x81b>" );
        return false;
    }
    
    return meansofdeath == "MOD_MEATSHIELD";
}

// Namespace utility
// Params 2
// Checksum 0x8dcc1a1, Offset: 0xb094
// Size: 0x32, Type: bool
function isvehiclecrushdamage( inflictor, meansofdeath )
{
    if ( !( isdefined( inflictor ) && isdefined( inflictor vehicle::get_ref() ) ) )
    {
        return false;
    }
    
    return meansofdeath == "MOD_CRUSH";
}

// Namespace utility
// Params 1
// Checksum 0x4a701f14, Offset: 0xb0cf
// Size: 0x9b, Type: bool
function isvalidpeekoutdir( dir )
{
    node = self;
    peekouts = node getvalidcoverpeekouts();
    
    foreach ( peekout in peekouts )
    {
        if ( peekout == dir )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace utility
// Params 1
// Checksum 0x894d159f, Offset: 0xb173
// Size: 0x216
function getbestcovermultinodetype( node )
{
    assert( isai( self ) );
    nodetypelist = node getvalidcovermultinodetypes();
    
    if ( nodetypelist.size <= 0 )
    {
        return undefined;
    }
    
    yaw_diff = 0;
    
    if ( isdefined( self.enemy ) )
    {
        enemy_pos = self.enemy.origin;
        
        if ( issentient( self.enemy ) && self lastknowntime( self.enemy ) > 0 )
        {
            enemy_pos = self lastknownpos( self.enemy );
        }
        
        var_a4ac6ca439b08589 = vectortoangles( enemy_pos - node.origin );
        yaw_diff = angleclamp180( var_a4ac6ca439b08589[ 1 ] - node.angles[ 1 ] );
    }
    
    foreach ( nodetypeit in nodetypelist )
    {
        switch ( nodetypeit )
        {
            case #"hash_78b110033ccb68b0":
            case #"hash_c3b74422dec48736":
                if ( abs( yaw_diff ) < 30 )
                {
                    return nodetypeit;
                }
                
                break;
            case #"hash_55ed607005f12d49":
            case #"hash_e1d8e1adebed5a61":
                if ( yaw_diff > 30 )
                {
                    return "Cover Left";
                }
                
                break;
            case #"hash_667bc7e605903a6c":
            case #"hash_cd3ffe799551db82":
                if ( yaw_diff < -30 )
                {
                    return "Cover Right";
                }
                
                break;
            default:
                assertmsg( "<dev string:x842>" );
                break;
        }
    }
    
    nodetype = nodetypelist[ 0 ];
    
    switch ( nodetype )
    {
        case #"hash_55ed607005f12d49":
            return "Cover Left";
        case #"hash_667bc7e605903a6c":
            return "Cover Right";
    }
    
    return nodetype;
}

// Namespace utility
// Params 1
// Checksum 0x6640dd2, Offset: 0xb392
// Size: 0x37, Type: bool
function isnodecoverleft( node )
{
    assert( isdefined( node ) && isdefined( node.type ) );
    return node.type == "Cover Left";
}

// Namespace utility
// Params 1
// Checksum 0x61c4a9f2, Offset: 0xb3d2
// Size: 0x37, Type: bool
function isnodecoverright( node )
{
    assert( isdefined( node ) && isdefined( node.type ) );
    return node.type == "Cover Right";
}

// Namespace utility
// Params 2
// Checksum 0x2a4d0da6, Offset: 0xb412
// Size: 0x64, Type: bool
function isnodecovercrouchtype( node, type )
{
    assert( isdefined( node ) );
    
    if ( node.type == "Cover Crouch" && isdefined( self._blackboard.croucharrivaltype ) )
    {
        return ( self._blackboard.croucharrivaltype == type );
    }
    
    return false;
}

// Namespace utility
// Params 1
// Checksum 0x2a4a894a, Offset: 0xb47f
// Size: 0x20, Type: bool
function isnode3d( node )
{
    return isnodecover3d( node ) || isnodeexposed3d( node );
}

// Namespace utility
// Params 1
// Checksum 0x8a1d96a6, Offset: 0xb4a8
// Size: 0x4c, Type: bool
function isnodecover3d( node )
{
    assert( isdefined( node ) && isdefined( node.type ) );
    return node.type == "Cover Stand 3D" || node.type == "Cover 3D";
}

// Namespace utility
// Params 1
// Checksum 0x44b99513, Offset: 0xb4fd
// Size: 0x4c, Type: bool
function isnodeexposed3d( node )
{
    assert( isdefined( node ) && isdefined( node.type ) );
    return node.type == "Exposed 3D" || node.type == "Path 3D";
}

// Namespace utility
// Params 1
// Checksum 0xc9d82454, Offset: 0xb552
// Size: 0x61, Type: bool
function isnodecovercrouch( node )
{
    assert( isdefined( node ) && isdefined( node.type ) );
    return node.type == "Cover Crouch" || node.type == "Cover Crouch Window" || node.type == "Conceal Crouch";
}

// Namespace utility
// Params 1
// Checksum 0x7d18deda, Offset: 0xb5bc
// Size: 0x64
function getaimyawtopoint( point )
{
    yaw = getyawtospot( point );
    dist = distance( self.origin, point );
    
    if ( dist > 3 )
    {
        anglefudge = asin( -3 / dist );
        yaw -= anglefudge;
    }
    
    yaw = angleclamp180( yaw );
    return yaw;
}

// Namespace utility
// Params 1
// Checksum 0xcebe87cc, Offset: 0xb629
// Size: 0x90
function getyawtospot( spot )
{
    if ( actor_is3d() )
    {
        forward = anglestoforward( self.angles );
        rotatedpos = rotatepointaroundvector( forward, spot - self.origin, self.angles[ 2 ] * -1 );
        spot = rotatedpos + self.origin;
    }
    
    yaw = getyaw( spot ) - self.angles[ 1 ];
    yaw = angleclamp180( yaw );
    return yaw;
}

// Namespace utility
// Params 1
// Checksum 0xb70d54a9, Offset: 0xb6c2
// Size: 0x1c
function getyaw( org )
{
    return vectortoyaw( org - self.origin );
}

// Namespace utility
// Params 1
// Checksum 0x1b63ce70, Offset: 0xb6e7
// Size: 0x64
function getaimyawtopoint3d( point )
{
    yaw = getyawtospot3d( point );
    dist = distance( self.origin, point );
    
    if ( dist > 3 )
    {
        anglefudge = asin( -3 / dist );
        yaw -= anglefudge;
    }
    
    yaw = angleclamp180( yaw );
    return yaw;
}

// Namespace utility
// Params 1
// Checksum 0x72810d45, Offset: 0xb754
// Size: 0x5f
function getyawtospot3d( spot )
{
    var_40b69a03e72b5bb9 = spot - self.origin;
    var_a96e0316adc12c5f = rotatevectorinverted( var_40b69a03e72b5bb9, self.angles );
    yaw = vectortoyaw( var_a96e0316adc12c5f );
    yaw_clamped = angleclamp180( yaw );
    return yaw_clamped;
}

// Namespace utility
// Params 1
// Checksum 0xaf291375, Offset: 0xb7bc
// Size: 0x64
function getaimpitchtopoint3d( point )
{
    pitch = getpitchtospot3d( point );
    dist = distance( self.origin, point );
    
    if ( dist > 3 )
    {
        anglefudge = asin( -3 / dist );
        pitch -= anglefudge;
    }
    
    pitch = angleclamp180( pitch );
    return pitch;
}

// Namespace utility
// Params 1
// Checksum 0x886ee499, Offset: 0xb829
// Size: 0x5f
function getpitchtospot3d( spot )
{
    var_40b69a03e72b5bb9 = spot - self.origin;
    var_a96e0316adc12c5f = rotatevectorinverted( var_40b69a03e72b5bb9, self.angles );
    pitch = vectortopitch( var_a96e0316adc12c5f );
    pitch_clamped = angleclamp180( pitch );
    return pitch_clamped;
}

// Namespace utility
// Params 1
// Checksum 0x409a95eb, Offset: 0xb891
// Size: 0x46
function getplayerpitch( player )
{
    assert( isplayer( player ) );
    playerangles = player getplayerangles();
    assert( isnumber( playerangles[ 0 ] ) );
    return ( playerangles[ 0 ] + 360 ) % 360;
}

// Namespace utility
// Params 1
// Checksum 0xf4111041, Offset: 0xb8e0
// Size: 0x48
function getplayeryaw( player )
{
    assert( isplayer( player ) );
    playerangles = player getplayerangles();
    assert( isnumber( playerangles[ 1 ] ) );
    return ( playerangles[ 1 ] + 360 ) % 360;
}

// Namespace utility
// Params 0
// Checksum 0xea4394e, Offset: 0xb931
// Size: 0xc, Type: bool
function actor_isspace()
{
    return istrue( self.space );
}

// Namespace utility
// Params 0
// Checksum 0x1bd77c20, Offset: 0xb946
// Size: 0x8, Type: bool
function actor_is3d()
{
    return actor_isspace();
}

// Namespace utility
// Params 3
// Checksum 0xba204e6c, Offset: 0xb957
// Size: 0x9c
function getpredictedaimyawtoshootentorpos( time, shootent, shootpos )
{
    if ( !isdefined( shootent ) )
    {
        if ( !isdefined( shootpos ) )
        {
            return 0;
        }
        
        return getaimyawtopoint( shootpos );
    }
    
    v = ( 0, 0, 0 );
    
    if ( isplayer( shootent ) )
    {
        v = shootent getvelocity();
    }
    else if ( isai( shootent ) )
    {
        v = shootent.velocity;
    }
    
    predictedpos = shootent.origin + v * time;
    return getaimyawtopoint( predictedpos );
}

// Namespace utility
// Params 3
// Checksum 0xe2062a77, Offset: 0xb9fc
// Size: 0x9c
function getpredictedaimyawtoshootentorpos3d( time, shootent, shootpos )
{
    if ( !isdefined( shootent ) )
    {
        if ( !isdefined( shootpos ) )
        {
            return 0;
        }
        
        return getaimyawtopoint3d( shootpos );
    }
    
    v = ( 0, 0, 0 );
    
    if ( isplayer( shootent ) )
    {
        v = shootent getvelocity();
    }
    else if ( isai( shootent ) )
    {
        v = shootent.velocity;
    }
    
    predictedpos = shootent.origin + v * time;
    return getaimyawtopoint3d( predictedpos );
}

// Namespace utility
// Params 3
// Checksum 0xfc9b0bb9, Offset: 0xbaa1
// Size: 0x9c
function getpredictedaimpitchtoshootentorpos3d( time, shootent, shootpos )
{
    if ( !isdefined( shootent ) )
    {
        if ( !isdefined( shootpos ) )
        {
            return 0;
        }
        
        return getaimpitchtopoint3d( shootpos );
    }
    
    v = ( 0, 0, 0 );
    
    if ( isplayer( shootent ) )
    {
        v = shootent getvelocity();
    }
    else if ( isai( shootent ) )
    {
        v = shootent.velocity;
    }
    
    predictedpos = shootent.origin + v * time;
    return getaimpitchtopoint3d( predictedpos );
}

// Namespace utility
// Params 0
// Checksum 0xa9c9f80d, Offset: 0xbb46
// Size: 0x3, Type: bool
function player_is_in_jackal()
{
    return false;
}

// Namespace utility
// Params 0
// Checksum 0x23bb02f9, Offset: 0xbb52
// Size: 0x2f
function set_createfx_enabled()
{
    if ( !isdefined( level.createfx_enabled ) )
    {
        level.createfx_enabled = getdvar( @"createfx", "" ) != "";
    }
}

// Namespace utility
// Params 3
// Checksum 0x5d40bfb5, Offset: 0xbb89
// Size: 0x2b
function flag_set_delayed( message, delay, setter )
{
    wait delay;
    flag_set( message, setter );
}

// Namespace utility
// Params 4, eflags: 0x40 variadic
// Checksum 0x6924b774, Offset: 0xbbbc
// Size: 0x9a
function noself_array_call( entities, process, ... )
{
    foreach ( ent in entities )
    {
        builtin [[ process ]]( ent, flat_args( vararg, varargcount ) );
    }
}

/#

    // Namespace utility
    // Params 1
    // Checksum 0x44c69776, Offset: 0xbc5e
    // Size: 0x2b, Type: dev
    function flag_assert( msg )
    {
        assert( !flag( msg ), "<dev string:x87b>" + msg + "<dev string:x884>" );
    }

#/

// Namespace utility
// Params 1
// Checksum 0x29bc7cc0, Offset: 0xbc91
// Size: 0x61
function function_438248c9d72fbbb3( flags )
{
    assert( isarray( flags ), "<dev string:x896>" );
    flags = function_5713d46873b29625( flags );
    
    for ( ;; )
    {
        for ( i = 0; i < flags.size ; i++ )
        {
            if ( flag( flags[ i ] ) )
            {
                return flags[ i ];
            }
        }
        
        level waittill_any_in_array( flags );
    }
}

// Namespace utility
// Params 1
// Checksum 0x9e525870, Offset: 0xbcfa
// Size: 0x14
function function_b50230bef1a7445a( flags )
{
    return function_438248c9d72fbbb3( flags );
}

// Namespace utility
// Params 2, eflags: 0x40 variadic
// Checksum 0xdba5f269, Offset: 0xbd17
// Size: 0xaf
function flag_wait_any( ... )
{
    if ( varargcount < 2 )
    {
        assertmsg( "<dev string:x8d5>" );
        return;
    }
    
    for ( ;; )
    {
        foreach ( varflag in vararg )
        {
            if ( flag( varflag ) )
            {
                return;
            }
        }
        
        level waittill_any( flat_args( vararg, varargcount ) );
    }
}

// Namespace utility
// Params 3, eflags: 0x40 variadic
// Checksum 0xa4f73f3b, Offset: 0xbdce
// Size: 0x11f
function flag_wait_any_timeout( timer, ... )
{
    if ( varargcount < 2 )
    {
        assertmsg( "<dev string:x90c>" );
        return;
    }
    
    assert( timer > 0, "<dev string:x94b>" );
    timerms = timer * 1000;
    start_time = gettime();
    
    for ( ;; )
    {
        foreach ( varflag in vararg )
        {
            if ( flag( varflag ) )
            {
                return;
            }
        }
        
        curr_time = gettime();
        
        if ( curr_time >= start_time + timerms )
        {
            break;
        }
        
        timeremaining = timerms - curr_time - start_time;
        timeremainingsecs = timeremaining / 1000;
        internal_wait_for_any_flag_or_time_elapses( vararg, timeremainingsecs );
    }
}

// Namespace utility
// Params 2
// Checksum 0x18ab09a, Offset: 0xbef5
// Size: 0x86
function internal_wait_for_any_flag_or_time_elapses( flag_arr, timer )
{
    foreach ( flag_msg in flag_arr )
    {
        level endon( flag_msg );
    }
    
    wait timer;
}

// Namespace utility
// Params 2, eflags: 0x40 variadic
// Checksum 0xdb8a0383, Offset: 0xbf83
// Size: 0xb9
function flag_wait_any_return( ... )
{
    if ( varargcount < 2 )
    {
        assertmsg( "<dev string:x999>" );
        return;
    }
    
    foreach ( varflag in vararg )
    {
        if ( flag( varflag ) )
        {
            return varflag;
        }
    }
    
    msg = level waittill_any_return( flat_args( vararg, varargcount ) );
    return msg;
}

// Namespace utility
// Params 2, eflags: 0x40 variadic
// Checksum 0xa58c6ff, Offset: 0xc048
// Size: 0x87
function flag_wait_all( ... )
{
    foreach ( varflag in vararg )
    {
        flag_wait( varflag );
    }
}

// Namespace utility
// Params 1
// Checksum 0x48eaba35, Offset: 0xc0d7
// Size: 0x10c
function function_30789810ab278dd6( flags )
{
    flags = function_5713d46873b29625( flags );
    
    for ( ;; )
    {
        foreach ( flagname in flags )
        {
            flag_wait( flagname );
        }
        
        flagsetcount = 0;
        
        foreach ( flagname in flags )
        {
            if ( flag( flagname ) )
            {
                flagsetcount++;
            }
        }
        
        if ( flagsetcount == flags.size )
        {
            break;
        }
    }
}

// Namespace utility
// Params 1
// Checksum 0x118067ba, Offset: 0xc1eb
// Size: 0x10d
function flag_waitopen_all_array( flags )
{
    flags = function_5713d46873b29625( flags );
    
    for ( ;; )
    {
        foreach ( flagname in flags )
        {
            flag_waitopen( flagname );
        }
        
        var_9527b70f552d82a8 = 0;
        
        foreach ( flagname in flags )
        {
            if ( !flag( flagname ) )
            {
                var_9527b70f552d82a8++;
            }
        }
        
        if ( var_9527b70f552d82a8 == flags.size )
        {
            break;
        }
    }
}

// Namespace utility
// Params 2
// Checksum 0x3a05d9fc, Offset: 0xc300
// Size: 0x83
function flag_wait_or_timeout( flagname, timer )
{
    timerms = timer * 1000;
    start_time = gettime();
    
    for ( ;; )
    {
        if ( flag( flagname ) )
        {
            break;
        }
        
        if ( gettime() >= start_time + timerms )
        {
            break;
        }
        
        timeremaining = timerms - gettime() - start_time;
        timeremainingsecs = timeremaining / 1000;
        wait_for_flag_or_time_elapses( flagname, timeremainingsecs );
    }
}

// Namespace utility
// Params 2
// Checksum 0x3ee89a, Offset: 0xc38b
// Size: 0x54
function flag_waitopen_or_timeout( flagname, timer )
{
    start_time = gettime();
    
    for ( ;; )
    {
        if ( !flag( flagname ) )
        {
            break;
        }
        
        if ( gettime() >= start_time + timer * 1000 )
        {
            break;
        }
        
        wait_for_flag_or_time_elapses( flagname, timer );
    }
}

// Namespace utility
// Params 2
// Checksum 0xf0138525, Offset: 0xc3e7
// Size: 0x1d
function wait_for_flag_or_time_elapses( flagname, timer )
{
    level endon( flagname );
    wait timer;
}

// Namespace utility
// Params 4, eflags: 0x40 variadic
// Checksum 0x64cd4b25, Offset: 0xc40c
// Size: 0x34
function noself_delaycall( timer, func, ... )
{
    thread noself_delaycall_proc( func, timer, varargcount, vararg );
}

// Namespace utility
// Params 4, eflags: 0x4
// Checksum 0x14407c88, Offset: 0xc448
// Size: 0x33
function private noself_delaycall_proc( func, timer, varargcount, vararg )
{
    wait timer;
    builtin [[ func ]]( flat_args( vararg, varargcount ) );
}

// Namespace utility
// Params 1
// Checksum 0x602ae38, Offset: 0xc483
// Size: 0xd7
function get_target_array( target = self.target )
{
    assert( isdefined( target ), "<dev string:x5e3>" );
    ents = getentarray( target, #targetname );
    
    if ( ents.size > 0 )
    {
        return ents;
    }
    
    if ( issp() )
    {
        ents = builtin [[ level.getnodearrayfunction ]]( target, #targetname );
        
        if ( ents.size > 0 )
        {
            return ents;
        }
    }
    
    if ( isdefined( level.struct_class_names ) )
    {
        ents = getstructarray( target, "targetname" );
        
        if ( ents.size > 0 )
        {
            return ents;
        }
    }
    
    ents = getvehiclenodearray( target, #targetname );
    
    if ( ents.size > 0 )
    {
        return ents;
    }
    
    assertmsg( "<dev string:x5fa>" + target + "<dev string:x9d7>" );
}

// Namespace utility
// Params 0
// Checksum 0x9a1c6246, Offset: 0xc562
// Size: 0x9
function pauseeffect()
{
    createfx::stop_fx_looper();
}

// Namespace utility
// Params 2
// Checksum 0xedb1bd88, Offset: 0xc573
// Size: 0xa7
function spawn_script_origin( org, ang )
{
    if ( !isdefined( ang ) && isdefined( self.angles ) )
    {
        ang = self.angles;
    }
    
    if ( !isdefined( org ) && isdefined( self.origin ) )
    {
        org = self.origin;
    }
    
    if ( !isdefined( org ) )
    {
        org = ( 0, 0, 0 );
    }
    
    script_origin = spawn( "script_origin", org );
    script_origin.targetname = "spawn_script_origin";
    
    if ( isdefined( ang ) )
    {
        script_origin.angles = ang;
    }
    
    return script_origin;
}

// Namespace utility
// Params 1
// Checksum 0xced55d84, Offset: 0xc623
// Size: 0xc7
function get_noteworthy_array( noteworthy )
{
    assert( isdefined( noteworthy ), "<dev string:x9f3>" );
    ents = getentarray( noteworthy, #script_noteworthy );
    
    if ( ents.size > 0 )
    {
        return ents;
    }
    
    if ( issp() )
    {
        ents = builtin [[ level.getnodearrayfunction ]]( noteworthy, #script_noteworthy );
        
        if ( ents.size > 0 )
        {
            return ents;
        }
    }
    
    if ( isdefined( level.struct_class_names ) )
    {
        ents = getstructarray( noteworthy, "script_noteworthy" );
        
        if ( ents.size > 0 )
        {
            return ents;
        }
    }
    
    ents = getvehiclenodearray( noteworthy, #script_noteworthy );
    
    if ( ents.size > 0 )
    {
        return ents;
    }
    
    assert( "<dev string:xa15>" + noteworthy + "<dev string:xa3a>" );
}

// Namespace utility
// Params 1
// Checksum 0xde393d99, Offset: 0xc6f2
// Size: 0x4d
function get_cumulative_weights( weights )
{
    cumulative_weights = [];
    sum = 0;
    
    for ( i = 0; i < weights.size ; i++ )
    {
        sum += weights[ i ];
        cumulative_weights[ i ] = sum;
    }
    
    return cumulative_weights;
}

// Namespace utility
// Params 1
// Checksum 0xa20a2005, Offset: 0xc748
// Size: 0x5d
function getanim( anime )
{
    assert( isdefined( self.animname ), "<dev string:xa54>" );
    assert( isdefined( level.scr_anim[ self.animname ][ anime ] ), "<dev string:xa80>" );
    return level.scr_anim[ self.animname ][ anime ];
}

// Namespace utility
// Params 1
// Checksum 0x6ef7885e, Offset: 0xc7ae
// Size: 0x3a, Type: bool
function hasanim( anime )
{
    assert( isdefined( self.animname ), "<dev string:xaa8>" );
    return isdefined( level.scr_anim[ self.animname ][ anime ] );
}

// Namespace utility
// Params 2
// Checksum 0x7693ed76, Offset: 0xc7f1
// Size: 0x4f
function getanim_from_animname( anime, animname )
{
    assert( isdefined( animname ), "<dev string:xad4>" );
    assert( isdefined( level.scr_anim[ animname ][ anime ] ), "<dev string:xaef>" );
    return level.scr_anim[ animname ][ anime ];
}

// Namespace utility
// Params 1
// Checksum 0xa9820059, Offset: 0xc849
// Size: 0x3e
function getanim_generic( anime )
{
    assert( isdefined( level.scr_anim[ "<dev string:xb25>" ][ anime ] ), "<dev string:xb30>" );
    return level.scr_anim[ "generic" ][ anime ];
}

// Namespace utility
// Params 1
// Checksum 0x8ad116e9, Offset: 0xc890
// Size: 0x1f, Type: bool
function hasanim_generic( anime )
{
    return isdefined( level.scr_anim[ "generic" ][ anime ] );
}

// Namespace utility
// Params 2
// Checksum 0x3f19d3c8, Offset: 0xc8b8
// Size: 0x104
function getanim_starts( anime, ent )
{
    startpositions = [];
    
    if ( animation::function_b8e0e318104693fb( anime ) )
    {
        foreach ( animation in level.scr_anim[ ent.animname ][ anime ] )
        {
            newanime = animation::function_179fdcb8d53829fe( anime, ent.animname, animation );
            animation::anim_first_frame_solo( ent, newanime );
            startpositions[ startpositions.size ] = ent.origin;
        }
    }
    else
    {
        animation::anim_first_frame_solo( ent, anime );
        startpositions[ startpositions.size ] = ent.origin;
    }
    
    return startpositions;
}

// Namespace utility
// Params 3
// Checksum 0x5aaabedc, Offset: 0xc9c5
// Size: 0x53
function waittill_match_or_timeout( msg, match, timer )
{
    ent = spawnstruct();
    ent endon( "complete" );
    ent delaythread( timer, &send_notify, "complete" );
    self waittillmatch( msg, match );
}

// Namespace utility
// Params 3
// Checksum 0x387eb85e, Offset: 0xca20
// Size: 0x2b
function function_1c579064b3fda85d( msg, match, endonmsg )
{
    self endon( endonmsg );
    self waittillmatch( msg, match );
}

// Namespace utility
// Params 3
// Checksum 0x10191e02, Offset: 0xca53
// Size: 0x54
function waittill_match_or_timeout_return( msg, match, timer )
{
    ent = spawnstruct();
    ent endon( "complete" );
    ent delaythread( timer, &send_notify, "complete" );
    self waittill( msg, match );
    return match;
}

// Namespace utility
// Params 2
// Checksum 0x60193ed8, Offset: 0xcab0
// Size: 0x29
function send_notify( msg, optional_param )
{
    if ( isdefined( optional_param ) )
    {
        self notify( msg, optional_param );
        return;
    }
    
    self notify( msg );
}

// Namespace utility
// Params 2
// Checksum 0xb314c69d, Offset: 0xcae1
// Size: 0x3e
function get_notetrack_time( animation, notetrack )
{
    notetracktimes = getnotetracktimes( animation, notetrack );
    animlength = getanimlength( animation );
    return notetracktimes[ 0 ] * animlength;
}

// Namespace utility
// Params 1
// Checksum 0x69527b22, Offset: 0xcb28
// Size: 0x14
function mph_to_ips( mph )
{
    return mph * 17.6;
}

// Namespace utility
// Params 2
// Checksum 0x262f5192, Offset: 0xcb45
// Size: 0x31
function mph_travel_time( speed, dist )
{
    speed = mph_to_ips( speed );
    time = dist / speed;
    return time;
}

// Namespace utility
// Params 2
// Checksum 0x1da9945f, Offset: 0xcb7f
// Size: 0x10c
function wrap_text( text, line_limit )
{
    tokenized = strtok( text, " " );
    checked_words = "";
    lines = [];
    i = 0;
    total_characters = 0;
    
    foreach ( word in tokenized )
    {
        if ( total_characters > line_limit )
        {
            lines[ lines.size ] = checked_words;
            checked_words = "";
            total_characters = 0;
        }
        
        total_characters += word.size;
        checked_words += word;
        
        if ( i != tokenized.size - 1 )
        {
            checked_words += " ";
        }
        else
        {
            lines[ lines.size ] = checked_words;
        }
        
        i++;
    }
    
    return lines;
}

// Namespace utility
// Params 3
// Checksum 0x9d7a1a51, Offset: 0xcc94
// Size: 0x65
function function_b104528d84ca3561( string, delim, var_a4f640302ae7e692 )
{
    strings = strtok( string, delim, var_a4f640302ae7e692 );
    ints = [];
    
    for ( i = 0; i < strings.size ; i++ )
    {
        ints[ i ] = int( strings[ i ] );
    }
    
    return ints;
}

// Namespace utility
// Params 3
// Checksum 0xdd4e58c1, Offset: 0xcd02
// Size: 0x65
function function_d2db822aceef856a( string, delim, var_a4f640302ae7e692 )
{
    strings = strtok( string, delim, var_a4f640302ae7e692 );
    floats = [];
    
    for ( i = 0; i < strings.size ; i++ )
    {
        floats[ i ] = float( strings[ i ] );
    }
    
    return floats;
}

// Namespace utility
// Params 4
// Checksum 0xb69b3101, Offset: 0xcd70
// Size: 0x214
function closestdistancebetweenlines( p1, p2, p3, p4 )
{
    p13 = p1 - p3;
    p43 = p4 - p3;
    
    if ( abs( p43[ 0 ] ) < 1e-06 && abs( p43[ 1 ] ) < 1e-06 && abs( p43[ 2 ] ) < 1e-06 )
    {
        return undefined;
    }
    
    p21 = p2 - p1;
    
    if ( abs( p21[ 0 ] ) < 1e-06 && abs( p21[ 1 ] ) < 1e-06 && abs( p21[ 2 ] ) < 1e-06 )
    {
        return undefined;
    }
    
    d1343 = p13[ 0 ] * p43[ 0 ] + p13[ 1 ] * p43[ 1 ] + p13[ 2 ] * p43[ 2 ];
    d4321 = p43[ 0 ] * p21[ 0 ] + p43[ 1 ] * p21[ 1 ] + p43[ 2 ] * p21[ 2 ];
    d1321 = p13[ 0 ] * p21[ 0 ] + p13[ 1 ] * p21[ 1 ] + p13[ 2 ] * p21[ 2 ];
    d4343 = p43[ 0 ] * p43[ 0 ] + p43[ 1 ] * p43[ 1 ] + p43[ 2 ] * p43[ 2 ];
    d2121 = p21[ 0 ] * p21[ 0 ] + p21[ 1 ] * p21[ 1 ] + p21[ 2 ] * p21[ 2 ];
    denom = d2121 * d4343 - d4321 * d4321;
    
    if ( abs( denom ) < 1e-06 )
    {
        return undefined;
    }
    
    numer = d1343 * d4321 - d1321 * d4343;
    mua = numer / denom;
    mub = ( d1343 + d4321 * mua ) / d4343;
    pa = p1 + mua * p21;
    pb = p3 + mub * p43;
    var_152611eabe5a5256 = [ pa, pb, distance( pa, pb ) ];
    return var_152611eabe5a5256;
}

// Namespace utility
// Params 4
// Checksum 0x50342676, Offset: 0xcf8d
// Size: 0x251
function closestdistancebetweensegments( p1, p2, p3, p4 )
{
    pdir = p2 - p1;
    qdir = p4 - p3;
    segdelta = p1 - p3;
    pdp = vectordot( pdir, pdir );
    pdq = vectordot( pdir, qdir );
    qdq = vectordot( qdir, qdir );
    pdw = vectordot( pdir, segdelta );
    qdw = vectordot( qdir, segdelta );
    commondenominator = pdp * qdq - pdq * pdq;
    denominatorp = commondenominator;
    denominatorq = commondenominator;
    scalarp = 0;
    numeratorp = 0;
    scalarq = 0;
    numeratorq = 0;
    
    if ( commondenominator < 1e-08 )
    {
        numeratorp = 0;
        denominatorp = 1;
        numeratorq = qdw;
        denominatorq = qdq;
    }
    else
    {
        numeratorp = pdq * qdw - qdq * pdw;
        numeratorq = pdp * qdw - pdq * pdw;
        
        if ( numeratorp < 0 )
        {
            numeratorp = 0;
            numeratorq = qdw;
            denominatorq = qdq;
        }
        else if ( numeratorp > denominatorp )
        {
            numeratorp = denominatorp;
            numeratorq = qdw + pdq;
            denominatorq = qdq;
        }
    }
    
    if ( numeratorq < 0 )
    {
        numeratorq = 0;
        
        if ( pdw * -1 < 0 )
        {
            numeratorp = 0;
        }
        else if ( pdw * -1 > pdp )
        {
            numeratorp = denominatorp;
        }
        else
        {
            numeratorp = pdw * -1;
            denominatorp = pdp;
        }
    }
    else if ( numeratorq > denominatorq )
    {
        numeratorq = denominatorq;
        
        if ( pdq - pdw < 0 )
        {
            numeratorp = 0;
        }
        else if ( pdq - pdw > pdp )
        {
            numeratorp = denominatorp;
        }
        else
        {
            numeratorp = pdq - pdw;
            denominatorp = pdp;
        }
    }
    
    if ( abs( numeratorp ) > 1e-08 )
    {
        scalarp = numeratorp / denominatorp;
    }
    
    if ( abs( numeratorq ) > 1e-08 )
    {
        scalarq = numeratorq / denominatorq;
    }
    
    pa = p1 + scalarp * pdir;
    pb = p3 + scalarq * qdir;
    var_152611eabe5a5256 = [ pa, pb, distance( pa, pb ) ];
    return var_152611eabe5a5256;
}

// Namespace utility
// Params 0
// Checksum 0xe517ede0, Offset: 0xd1e7
// Size: 0x11, Type: bool
function is_dead_sentient()
{
    return issentient( self ) && !isalive( self );
}

// Namespace utility
// Params 2
// Checksum 0xd1e1a34e, Offset: 0xd201
// Size: 0xe1
function hastag( model, tag )
{
    if ( !isdefined( model ) || model == "" )
    {
        return 0;
    }
    
    if ( !isdefined( level.has_tag ) )
    {
        level.has_tag = [];
    }
    
    key = model + "_" + tag;
    
    if ( isdefined( level.has_tag[ key ] ) )
    {
        return level.has_tag[ key ];
    }
    
    partcount = getnumparts( model );
    
    if ( partcount > 0 )
    {
        for ( i = 0; i < partcount ; i++ )
        {
            partname = getpartname( model, i );
            
            if ( partname == tolower( tag ) )
            {
                level.has_tag[ key ] = 1;
                return 1;
            }
        }
        
        level.has_tag[ key ] = 0;
    }
    
    return 0;
}

// Namespace utility
// Params 0
// Checksum 0xa03134dc, Offset: 0xd2eb
// Size: 0x49
function flashbanggettimeleftsec()
{
    assert( isdefined( self ) );
    assert( isdefined( self.flashendtime ) );
    durationms = self.flashendtime - gettime();
    
    if ( durationms < 0 )
    {
        return 0;
    }
    
    return durationms * 0.001;
}

// Namespace utility
// Params 0
// Checksum 0x669d1c00, Offset: 0xd33d
// Size: 0xa, Type: bool
function flashbangisactive()
{
    return flashbanggettimeleftsec() > 0;
}

// Namespace utility
// Params 5
// Checksum 0x51882176, Offset: 0xd350
// Size: 0x55
function playsoundontag( alias, tag, ends_on_death, var_e70fce3b333b2ca9, radio_dialog )
{
    assert( isdefined( level.fnplaysoundontag ) );
    [[ level.fnplaysoundontag ]]( alias, tag, ends_on_death, var_e70fce3b333b2ca9, radio_dialog );
}

// Namespace utility
// Params 2
// Checksum 0xc0137c00, Offset: 0xd3ad
// Size: 0x36
function playsoundonentity( alias, var_e70fce3b333b2ca9 )
{
    assert( isdefined( level.fnplaysoundonentity ) );
    [[ level.fnplaysoundonentity ]]( alias, var_e70fce3b333b2ca9 );
}

// Namespace utility
// Params 1
// Checksum 0x71cf13fb, Offset: 0xd3eb
// Size: 0x2a
function set_movement_speed( desiredspeed )
{
    self._blackboard.requestedspeed = desiredspeed;
    self aisetdesiredspeed( desiredspeed );
}

// Namespace utility
// Params 1
// Checksum 0xe8d0a030, Offset: 0xd41d
// Size: 0x17
function set_cautious_navigation( enabled )
{
    self.cautiousnavigation = enabled;
}

// Namespace utility
// Params 0
// Checksum 0x866d1d22, Offset: 0xd43c
// Size: 0x19, Type: bool
function doinglongdeath()
{
    assert( isai( self ) );
    return istrue( self.doinglongdeath );
}

// Namespace utility
// Params 1
// Checksum 0xd7494d5f, Offset: 0xd45e
// Size: 0x48, Type: bool
function is_dead_or_dying( guy )
{
    if ( !isdefined( guy ) )
    {
        return true;
    }
    
    if ( isai( guy ) )
    {
        return ( !isalive( guy ) || guy doinglongdeath() );
    }
    else if ( issentient( guy ) )
    {
        return !isalive( guy );
    }
    
    return false;
}

// Namespace utility
// Params 7
// Checksum 0x125baa5c, Offset: 0xd4af
// Size: 0xd5
function motionwarpwithnotetracks( anime, targetpos, targetangles, notetrackstart, notetrackend, duration, updateanimrate )
{
    if ( isdefined( notetrackstart ) )
    {
        animstartfrac = getnotetracktimes( anime, notetrackstart )[ 0 ];
        
        if ( !isdefined( animstartfrac ) )
        {
            assertmsg( "<dev string:xb60>" + notetrackstart + "<dev string:xb76>" );
            animstartfrac = 0;
        }
    }
    else
    {
        animstartfrac = 0;
    }
    
    if ( isdefined( notetrackend ) )
    {
        animendfrac = getnotetracktimes( anime, notetrackend )[ 0 ];
        
        if ( !isdefined( animendfrac ) )
        {
            assertmsg( "<dev string:xb9b>" + notetrackend + "<dev string:xb76>" );
            animendfrac = 1;
        }
    }
    else
    {
        animendfrac = 1;
    }
    
    motionwarpwithtimes( anime, targetpos, targetangles, animstartfrac, animendfrac, duration, updateanimrate );
}

// Namespace utility
// Params 7
// Checksum 0x39956147, Offset: 0xd58c
// Size: 0x158
function motionwarpwithtimes( anime, targetpos, targetangles, animstartfrac, animendfrac, duration, updateanimrate = 1 )
{
    animyawdelta = getangledelta( anime, animstartfrac, animendfrac );
    animtranslationdelta = getmovedelta( anime, animstartfrac, animendfrac );
    animtranslationdelta = rotatevector( animtranslationdelta, ( 0, targetangles[ 1 ] - animyawdelta, 0 ) );
    animstartpos = targetpos - animtranslationdelta;
    animstartyaw = targetangles[ 1 ] - animyawdelta;
    animstartangles = ( targetangles[ 0 ], animstartyaw, targetangles[ 2 ] );
    animrate = 1;
    var_620f711ebce0ce12 = length( targetpos - self.origin );
    
    if ( updateanimrate && var_620f711ebce0ce12 > 0 )
    {
        animrate = length( animtranslationdelta ) / var_620f711ebce0ce12;
        animrate = clamp( animrate, 0.75, 1.25 );
        self aisetanimrate( anime, animrate );
    }
    
    if ( !isdefined( duration ) )
    {
        animlength = getanimlength( anime ) / animrate;
        duration = int( ( animendfrac - animstartfrac ) * animlength * 1000 );
    }
    
    if ( duration < 50 )
    {
        duration = 50;
    }
    
    self motionwarpwithanim( animstartpos, animstartangles, targetpos, targetangles, duration );
    return animrate;
}

// Namespace utility
// Params 9
// Checksum 0xfbaa2929, Offset: 0xd6ed
// Size: 0x286
function function_1e0fdc2ddb427044( anime, parentent, tag, localtargetpos, var_82b26273be843388, animstartfrac, animendfrac, duration, updateanimrate )
{
    assert( isdefined( anime ) );
    assert( animstartfrac >= 0 );
    assert( animendfrac <= 1 );
    assert( isdefined( parentent ) );
    assert( isdefined( localtargetpos ) );
    assert( isdefined( var_82b26273be843388 ) );
    
    if ( !isdefined( updateanimrate ) )
    {
        updateanimrate = 1;
    }
    
    if ( isdefined( tag ) )
    {
        linkpos = parentent gettagorigin( tag );
        linkang = parentent gettagangles( tag );
    }
    else
    {
        linkpos = parentent.origin;
        linkang = parentent.angles;
        tag = "";
    }
    
    worldtargetpos = linkpos + rotatevector( localtargetpos, linkang );
    var_6bf8560b5195147d = combineangles( var_82b26273be843388, linkang );
    var_67ba0a3949a64d89 = getangledelta3d( anime, animstartfrac, animendfrac );
    animposdelta = getmovedelta( anime, animstartfrac, animendfrac );
    var_2ab9898ceeb10a7a = invertangles( var_67ba0a3949a64d89 );
    var_51e2c41e6b52bf9f = combineangles( var_6bf8560b5195147d, var_2ab9898ceeb10a7a );
    var_1ed21a6d35a9c58e = rotatevector( -1 * animposdelta, var_2ab9898ceeb10a7a );
    var_7401a6e768cf2cb1 = rotatevector( var_1ed21a6d35a9c58e, var_6bf8560b5195147d );
    worldanimstartpos = worldtargetpos + var_7401a6e768cf2cb1;
    var_ff32d80ea94a704a = self.origin - linkpos;
    invlinkang = invertangles( linkang );
    localtargetpos = rotatevector( var_ff32d80ea94a704a, invlinkang );
    var_82b26273be843388 = combineangles( self.angles, invlinkang );
    animrate = 1;
    var_620f711ebce0ce12 = length( worldtargetpos - self.origin );
    
    if ( updateanimrate && var_620f711ebce0ce12 > 0 )
    {
        animrate = length( animposdelta ) / var_620f711ebce0ce12;
        animrate = clamp( animrate, 0.5, 2 );
        self aisetanimrate( anime, animrate );
    }
    
    if ( !isdefined( duration ) )
    {
        animlength = getanimlength( anime ) / animrate;
        duration = int( ( animendfrac - animstartfrac ) * animlength * 1000 );
    }
    
    if ( duration < 50 )
    {
        duration = 50;
    }
    
    self linktomoveoffset( parentent, tag, localtargetpos, var_82b26273be843388 );
    self motionwarpwithanim( worldanimstartpos, var_51e2c41e6b52bf9f, worldtargetpos, var_6bf8560b5195147d, duration );
}

// Namespace utility
// Params 3, eflags: 0x40 variadic
// Checksum 0x28c72dd9, Offset: 0xd97b
// Size: 0xb9
function waittill_any_ents_or_timeout_return( timeout, ... )
{
    assert( isdefined( timeout ) );
    
    /#
        function_8ae6ad9600816017( flat_args( vararg, varargcount ) );
    #/
    
    self endon( "death" );
    ent = spawnstruct();
    i = 0;
    
    while ( i < varargcount )
    {
        if ( isdefined( vararg[ i ] ) && isdefined( vararg[ i + 1 ] ) )
        {
            vararg[ i ] childthread waittill_string( vararg[ i + 1 ], ent );
        }
        
        i += 2;
    }
    
    ent childthread timeout_struct( timeout );
    ent waittill( "returned", msg );
    ent notify( "die" );
    return msg;
}

// Namespace utility
// Params 2
// Checksum 0x124351b9, Offset: 0xda3d
// Size: 0x3e, Type: bool
function time_has_passed( timestamp, seconds )
{
    if ( !isdefined( timestamp ) )
    {
        return false;
    }
    
    if ( !isdefined( seconds ) || seconds == 0 )
    {
        return true;
    }
    
    return gettime() - timestamp >= seconds * 1000;
}

// Namespace utility
// Params 1
// Checksum 0xa468b7a9, Offset: 0xda84
// Size: 0x24
function reacttolightifpossible( lightorigin )
{
    self.lightreaction_lightorigin = lightorigin;
    self.lightreaction_requesttime = gettime();
}

// Namespace utility
// Params 1
// Checksum 0xdef04319, Offset: 0xdab0
// Size: 0x76
function setcovercrouchtype( covertype )
{
    switch ( covertype )
    {
        case #"hash_96815ce4f2a3dbc5":
            self.covercrouchtype = "Cover Right Crouch";
            break;
        case #"hash_c9b3133a17a3b2d0":
            self.covercrouchtype = "Cover Left Crouch";
            break;
        case #"hash_3fed0cbd303639eb":
        default:
            self.covercrouchtype = "Cover Crouch";
            break;
    }
}

// Namespace utility
// Params 1
// Checksum 0x60389c34, Offset: 0xdb2e
// Size: 0x18
function setcornerstepoutsdisabled( disabled )
{
    self.cornerstepoutsdisabled = istrue( disabled );
}

// Namespace utility
// Params 0
// Checksum 0xc392f168, Offset: 0xdb4e
// Size: 0xc, Type: bool
function getcornerstepoutsdisabled()
{
    return istrue( self.cornerstepoutsdisabled );
}

// Namespace utility
// Params 4
// Checksum 0x925d9a18, Offset: 0xdb63
// Size: 0x8a
function can_trace_to_ai( start, ai, ignoreentarray, contentoverride )
{
    if ( isent( self ) || isai( self ) )
    {
        ignoregroup = [ self, ai ];
    }
    else
    {
        ignoregroup = [ ai ];
    }
    
    if ( isdefined( ignoreentarray ) )
    {
        ignoregroup = arraycombine( ignoregroup, ignoreentarray );
    }
    
    content = contentoverride ?? trace::create_default_contents();
    return cantracetoai( ai, start, ignoreentarray, content );
}

// Namespace utility
// Params 2
// Checksum 0x2040ddd0, Offset: 0xdbf6
// Size: 0xd9
function array_removedead_or_dying( array, var_d617f2628e8fa9d3 )
{
    if ( !isdefined( var_d617f2628e8fa9d3 ) )
    {
        var_d617f2628e8fa9d3 = 1;
    }
    
    newarray = [];
    
    foreach ( member in array )
    {
        if ( !isalive( member ) )
        {
            continue;
        }
        
        if ( isai( member ) && var_d617f2628e8fa9d3 && ( member doinglongdeath() || member ent_flag( "death_engaged" ) ) )
        {
            continue;
        }
        
        newarray[ newarray.size ] = member;
    }
    
    return newarray;
}

// Namespace utility
// Params 0
// Checksum 0x5d348d4d, Offset: 0xdcd8
// Size: 0x34
function disable_pain()
{
    assert( isai( self ), "<dev string:xbaf>" );
    self.a.disablepain = 1;
    self.allowpain = 0;
}

// Namespace utility
// Params 0
// Checksum 0xbe783504, Offset: 0xdd14
// Size: 0x34
function enable_pain()
{
    assert( isai( self ), "<dev string:xbd4>" );
    self.a.disablepain = 0;
    self.allowpain = 1;
}

// Namespace utility
// Params 0
// Checksum 0xcc65b104, Offset: 0xdd50
// Size: 0x20
function get_ai_number()
{
    if ( !isdefined( self.unique_id ) )
    {
        set_ai_number();
    }
    
    return self.unique_id;
}

// Namespace utility
// Params 0
// Checksum 0xb8db5a82, Offset: 0xdd79
// Size: 0x3a
function set_ai_number()
{
    if ( !isdefined( level.ai_number ) )
    {
        level.ai_number = 0;
    }
    
    self.unique_id = "ai" + level.ai_number;
    level.ai_number++;
}

// Namespace utility
// Params 0
// Checksum 0x37782e26, Offset: 0xddbb
// Size: 0x1a
function function_15cfbb3a3522e14b()
{
    self.var_f474b977e993e09 = "ai" + function_f4f71b263d0368e4();
    function_c04127d91364a69d();
}

// Namespace utility
// Params 1
// Checksum 0xb5b6bcfc, Offset: 0xdddd
// Size: 0x35
function ent_flag_wait( msg )
{
    assert( isdefined( self ), "<dev string:xbf8>" );
    
    while ( isdefined( self ) && !ent_flag( msg ) )
    {
        self waittill( msg );
    }
}

// Namespace utility
// Params 2
// Checksum 0xd84b6a0c, Offset: 0xde1a
// Size: 0xd4
function array_ent_flag_wait( entities, flag )
{
    notifystruct = spawnstruct();
    
    foreach ( entity in entities )
    {
        if ( entity ent_flag( flag ) )
        {
            entities = arrayremove( entities, entity );
        }
    }
    
    array_thread( entities, &array_ent_flag_wait_proc, notifystruct, flag );
    
    for ( i = 0; i < entities.size ; i++ )
    {
        notifystruct waittill( "notify" );
    }
}

// Namespace utility
// Params 2
// Checksum 0x46d22809, Offset: 0xdef6
// Size: 0x27
function array_ent_flag_wait_proc( notifystruct, flag )
{
    ent_flag_wait( flag );
    notifystruct notify( "notify" );
}

// Namespace utility
// Params 1
// Checksum 0x1ad4d31d, Offset: 0xdf25
// Size: 0x35
function ent_flag_wait_vehicle_node( msg )
{
    assert( isdefined( self ), "<dev string:xc2a>" );
    
    while ( isdefined( self ) && !ent_flag( msg ) )
    {
        self waittill( msg );
    }
}

// Namespace utility
// Params 2, eflags: 0x40 variadic
// Checksum 0x5a16030f, Offset: 0xdf62
// Size: 0x1e
function function_4ba3bcb5ce492dc3( ... )
{
    function_bcfbbdb86d349f29( vararg );
}

// Namespace utility
// Params 1
// Checksum 0x66b399a4, Offset: 0xdf88
// Size: 0x10c
function function_c8aa9ca39ac53bd0( flags )
{
    flags = function_5713d46873b29625( flags );
    
    for ( ;; )
    {
        foreach ( flagname in flags )
        {
            ent_flag_wait( flagname );
        }
        
        flagsetcount = 0;
        
        foreach ( flagname in flags )
        {
            if ( ent_flag( flagname ) )
            {
                flagsetcount++;
            }
        }
        
        if ( flagsetcount == flags.size )
        {
            break;
        }
    }
}

// Namespace utility
// Params 1
// Checksum 0xf4720008, Offset: 0xe09c
// Size: 0x10d
function function_37e590263bad2630( flags )
{
    flags = function_5713d46873b29625( flags );
    
    for ( ;; )
    {
        foreach ( flagname in flags )
        {
            function_adae3a467e19ce3( flagname );
        }
        
        var_617a1ae12383b183 = 0;
        
        foreach ( flagname in flags )
        {
            if ( !ent_flag( flagname ) )
            {
                var_617a1ae12383b183++;
            }
        }
        
        if ( var_617a1ae12383b183 == flags.size )
        {
            break;
        }
    }
}

// Namespace utility
// Params 1
// Checksum 0xe8ef4845, Offset: 0xe1b1
// Size: 0xab
function function_bcfbbdb86d349f29( flags )
{
    flags = function_5713d46873b29625( flags );
    assert( isdefined( self ), "<dev string:xbf8>" );
    
    while ( isdefined( self ) )
    {
        foreach ( flagname in flags )
        {
            if ( ent_flag( flagname ) )
            {
                return flagname;
            }
        }
        
        waittill_any_in_array( flags );
    }
}

// Namespace utility
// Params 1
// Checksum 0x306451fd, Offset: 0xe264
// Size: 0x14
function function_e2baa5896d5756cc( flags )
{
    return function_bcfbbdb86d349f29( flags );
}

// Namespace utility
// Params 1
// Checksum 0xc8d56aa9, Offset: 0xe281
// Size: 0xaa
function function_63726cf876765909( flags )
{
    flags = function_5713d46873b29625( flags );
    assert( isdefined( self ), "<dev string:xbf8>" );
    
    while ( isdefined( self ) )
    {
        foreach ( flagname in flags )
        {
            if ( !ent_flag( flagname ) )
            {
                return;
            }
        }
        
        waittill_any_in_array_return( flags );
    }
}

// Namespace utility
// Params 2
// Checksum 0x7d78cd12, Offset: 0xe333
// Size: 0x6b
function function_1041a862fb65668a( flagname, timer )
{
    assert( isdefined( self ), "<dev string:xbf8>" );
    start_time = gettime();
    
    while ( isdefined( self ) )
    {
        if ( !ent_flag( flagname ) )
        {
            return flagname;
        }
        
        if ( gettime() >= start_time + timer * 1000 )
        {
            return "timeout";
        }
        
        ent_wait_for_flag_or_time_elapses( flagname, timer );
    }
}

// Namespace utility
// Params 2
// Checksum 0xbd49a9f1, Offset: 0xe3a6
// Size: 0x6a
function ent_flag_wait_or_timeout( flagname, timer )
{
    assert( isdefined( self ), "<dev string:xbf8>" );
    start_time = gettime();
    
    while ( isdefined( self ) )
    {
        if ( ent_flag( flagname ) )
        {
            return flagname;
        }
        
        if ( gettime() >= start_time + timer * 1000 )
        {
            return "timeout";
        }
        
        ent_wait_for_flag_or_time_elapses( flagname, timer );
    }
}

// Namespace utility
// Params 2
// Checksum 0x8aad62a, Offset: 0xe418
// Size: 0x1d
function ent_wait_for_flag_or_time_elapses( flagname, timer )
{
    self endon( flagname );
    wait timer;
}

/#

    // Namespace utility
    // Params 1
    // Checksum 0xfacf86fa, Offset: 0xe43d
    // Size: 0x2b, Type: dev
    function ent_flag_assert( msg )
    {
        assert( !ent_flag( msg ), "<dev string:x87b>" + msg + "<dev string:xc64>" );
    }

#/

// Namespace utility
// Params 2, eflags: 0x40 variadic
// Checksum 0xb8cb9d2e, Offset: 0xe470
// Size: 0xb6
function function_adae3a467e19ce3( ... )
{
    assert( isdefined( self ), "<dev string:xbf8>" );
    
    if ( varargcount != vararg.size )
    {
        return;
    }
    
    while ( isdefined( self ) )
    {
        foreach ( varflag in vararg )
        {
            if ( !ent_flag( varflag ) )
            {
                return;
            }
        }
        
        waittill_any( flat_args( vararg, varargcount ) );
    }
}

// Namespace utility
// Params 1
// Checksum 0x2fe48cd4, Offset: 0xe52e
// Size: 0x7e
function ent_flag_init( message )
{
    if ( !isdefined( self.ent_flag ) )
    {
        self.ent_flag = [];
        self.ent_flags_lock = [];
    }
    
    /#
        if ( level.first_frame == -1 )
        {
            assert( !ent_flag_exist( message ), "<dev string:xd5>" + message + "<dev string:xc7f>" );
        }
    #/
    
    self.ent_flag[ message ] = 0;
    
    /#
        self.ent_flags_lock[ message ] = 0;
    #/
}

// Namespace utility
// Params 1
// Checksum 0xb32e52be, Offset: 0xe5b4
// Size: 0x2d, Type: bool
function ent_flag_exist( message )
{
    if ( isdefined( self.ent_flag ) && isdefined( self.ent_flag[ message ] ) )
    {
        return true;
    }
    
    return false;
}

// Namespace utility
// Params 2
// Checksum 0xb0483f7, Offset: 0xe5ea
// Size: 0x29
function ent_flag_set_delayed( message, delay )
{
    self endon( "death" );
    wait delay;
    ent_flag_set( message );
}

// Namespace utility
// Params 1
// Checksum 0x6595fbda, Offset: 0xe61b
// Size: 0x8e
function ent_flag_set( message )
{
    assert( isdefined( self ), "<dev string:xc8e>" );
    assert( isdefined( message ), "<dev string:xa0>" );
    
    if ( !isdefined( self ) )
    {
        return;
    }
    
    if ( !ent_flag_exist( message ) )
    {
        ent_flag_init( message );
    }
    
    /#
        assert( self.ent_flag[ message ] == self.ent_flags_lock[ message ] );
        self.ent_flags_lock[ message ] = 1;
    #/
    
    self.ent_flag[ message ] = 1;
    self notify( message );
}

// Namespace utility
// Params 2
// Checksum 0xcd2554fc, Offset: 0xe6b1
// Size: 0xab
function ent_flag_clear( message, remove )
{
    /#
        assert( isdefined( self ), "<dev string:xcc5>" );
        
        if ( ent_flag_exist( message ) )
        {
            assert( self.ent_flag[ message ] == self.ent_flags_lock[ message ] );
        }
        
        self.ent_flags_lock[ message ] = 0;
    #/
    
    if ( ent_flag( message ) )
    {
        self.ent_flag[ message ] = 0;
        self notify( message );
    }
    
    if ( ent_flag_exist( message ) && remove )
    {
        self.ent_flag[ message ] = undefined;
        
        /#
            self.ent_flags_lock[ message ] = undefined;
        #/
    }
}

// Namespace utility
// Params 2
// Checksum 0xef216529, Offset: 0xe764
// Size: 0x26
function ent_flag_clear_delayed( message, delay )
{
    wait delay;
    
    if ( isdefined( self ) )
    {
        ent_flag_clear( message );
    }
}

// Namespace utility
// Params 1
// Checksum 0x8c175a67, Offset: 0xe792
// Size: 0x34, Type: bool
function ent_flag( message )
{
    assert( isdefined( message ), "<dev string:xa0>" );
    return ent_flag_exist( message ) && self.ent_flag[ message ];
}

// Namespace utility
// Params 0
// Checksum 0xe399e56e, Offset: 0xe7cf
// Size: 0x71
function get_linked_structs()
{
    array = [];
    
    if ( isdefined( self.script_linkto ) )
    {
        linknames = get_links();
        
        for ( i = 0; i < linknames.size ; i++ )
        {
            structs = getstructarray( linknames[ i ], "script_linkname" );
            
            if ( structs.size > 0 )
            {
                array = arraycombine( array, structs );
            }
        }
    }
    
    return array;
}

// Namespace utility
// Params 3
// Checksum 0x2e0fc6c5, Offset: 0xe849
// Size: 0x6f, Type: bool
function ispointinsidecircle( point, circlecenter, circleradius )
{
    assert( isvector( point ) );
    assert( isvector( circlecenter ) );
    assert( isnumber( circleradius ) );
    
    if ( squared( point[ 0 ] - circlecenter[ 0 ] ) + squared( point[ 1 ] - circlecenter[ 1 ] ) <= squared( circleradius ) )
    {
        return true;
    }
    
    return false;
}

// Namespace utility
// Params 1
// Checksum 0x9af0b165, Offset: 0xe8c1
// Size: 0xa0
function requestgamerprofile( var_26cc343082007a73 )
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    frameswaited = 0;
    var_1732b50a7ff34a5f = 1000;
    
    while ( self.var_e8ea309192bf4aa0 && frameswaited < var_1732b50a7ff34a5f )
    {
        waitframe();
        frameswaited++;
    }
    
    self.var_e8ea309192bf4aa0 = 1;
    self sendrequestgamerprofilecmd( var_26cc343082007a73 );
    
    while ( true )
    {
        self waittill( "luinotifyserver", channel, value );
        
        if ( channel == "gamerprofile_request" )
        {
            self.var_e8ea309192bf4aa0 = 0;
            return value;
        }
    }
}

// Namespace utility
// Params 0
// Checksum 0xa6034832, Offset: 0xe969
// Size: 0xb3
function function_d43a7e1cc86b52b0()
{
    sharedsettings = getscriptbundle( %"hash_5d2895ef18b1a537" );
    self.pers[ "sharedGamerProfiles" ] = [];
    
    foreach ( gamerprofile in sharedsettings.optionslist )
    {
        ui::lui_registercallback( gamerprofile.var_f630dcfe4eb48860, &function_e181ee0008ac136f );
    }
}

// Namespace utility
// Params 1, eflags: 0x4
// Checksum 0x82a2d305, Offset: 0xea24
// Size: 0x59
function private function_e181ee0008ac136f( value )
{
    if ( isdefined( self.pers[ "sharedGamerProfiles" ] ) )
    {
        gamerprofile = self.var_b458a7ace288c777;
        self.pers[ "sharedGamerProfiles" ][ gamerprofile ] = value;
        ui::lui_notify_callback( gamerprofile + "_updated", value, undefined );
    }
}

// Namespace utility
// Params 2
// Checksum 0x93b8da9c, Offset: 0xea85
// Size: 0x8e
function function_e16c621f95fe3acf( callback, var_2d80b16b6b6c2a4c )
{
    foreach ( gamerprofile in var_2d80b16b6b6c2a4c )
    {
        ui::lui_registercallback( gamerprofile + "_updated", callback );
    }
}

// Namespace utility
// Params 0
// Checksum 0xdaee8b32, Offset: 0xeb1b
// Size: 0x45, Type: bool
function ismountconfigenabled()
{
    var_474e97b8c11833e3 = 1;
    mountconfig = 0;
    
    if ( is_player_gamepad_enabled() )
    {
        mountconfig = requestgamerprofile( "mountButtonConfig" );
    }
    else
    {
        mountconfig = requestgamerprofile( "mountButtonConfigKBM" );
    }
    
    return mountconfig != var_474e97b8c11833e3;
}

// Namespace utility
// Params 0
// Checksum 0x7d22dc31, Offset: 0xeb69
// Size: 0x45, Type: bool
function function_86834fb1defeac4e()
{
    var_1a1c710637f9cd7f = 1;
    toggletacticaladsconfig = 0;
    
    if ( is_player_gamepad_enabled() )
    {
        toggletacticaladsconfig = requestgamerprofile( "toggleTacticalADSConfig" );
    }
    else
    {
        toggletacticaladsconfig = requestgamerprofile( "toggleTacticalADSConfigKBM" );
    }
    
    return toggletacticaladsconfig != var_1a1c710637f9cd7f;
}

// Namespace utility
// Params 1
// Checksum 0x6b81d3b4, Offset: 0xebb7
// Size: 0x54, Type: bool
function function_c5f97a59345cc2a3( player )
{
    if ( !isdefined( player ) )
    {
        assertmsg( "<dev string:xcfe>" );
        return false;
    }
    
    if ( player usinggamepad() )
    {
        var_bc32b8612e4579a9 = player getcurrentusereloadconfig();
        return ( var_bc32b8612e4579a9 == 0 || var_bc32b8612e4579a9 == 3 );
    }
    
    return player getuseholdkbmprofile() == 1;
}

// Namespace utility
// Params 1
// Checksum 0xb47fa517, Offset: 0xec14
// Size: 0x5f
function stringtovec3( input )
{
    output = ( 0, 0, 0 );
    values = strtok( input, " " );
    
    if ( values.size == 3 )
    {
        output = ( float( values[ 0 ] ), float( values[ 1 ] ), float( values[ 2 ] ) );
    }
    
    return output;
}

// Namespace utility
// Params 1
// Checksum 0x3a3f8cd9, Offset: 0xec7c
// Size: 0x54
function queue_create( capacity )
{
    queue = spawnstruct();
    queue.capacity = capacity;
    queue.array = [];
    queue.front = 0;
    queue.rear = -1;
    return queue;
}

// Namespace utility
// Params 2
// Checksum 0x224b30a1, Offset: 0xecd9
// Size: 0xb2
function function_9e6c656b55f983f8( queue, object )
{
    if ( queue.array.size == queue.capacity )
    {
        assert( 0, "<dev string:xd39>" );
        return queue;
    }
    
    if ( queue.array.size != queue.capacity && queue.rear + 1 >= queue.capacity )
    {
        queue.rear = 0;
    }
    else
    {
        queue.rear++;
    }
    
    queue.array[ queue.rear ] = object;
    return queue;
}

// Namespace utility
// Params 1
// Checksum 0x6ef959c7, Offset: 0xed94
// Size: 0xbe
function function_6aa5e41ca11dd304( queue )
{
    if ( queue.array.size == 0 )
    {
        assert( 0, "<dev string:xd6d>" );
        return queue;
    }
    
    queue.array[ queue.front ] = undefined;
    
    if ( queue.array.size > 0 && queue.front + 1 >= queue.capacity )
    {
        queue.front = 0;
    }
    else
    {
        queue.front++;
    }
    
    if ( queue.array.size == 0 )
    {
        queue.front = 0;
        queue.rear = -1;
    }
    
    return queue;
}

// Namespace utility
// Params 1
// Checksum 0x132a6a97, Offset: 0xee5b
// Size: 0x44
function queue_peek( queue )
{
    if ( queue.array.size == 0 )
    {
        assert( 0, "<dev string:xda2>" );
        return undefined;
    }
    
    return queue.array[ queue.front ];
}

// Namespace utility
// Params 1
// Checksum 0x2267b1db, Offset: 0xeea8
// Size: 0x18
function queue_size( queue )
{
    return queue.array.size;
}

// Namespace utility
// Params 1
// Checksum 0x413f3903, Offset: 0xeec9
// Size: 0x40
function queue_clear( queue )
{
    queue.array = [];
    queue.front = 0;
    queue.rear = -1;
    return queue.array.size;
}

// Namespace utility
// Params 1
// Checksum 0x74a96844, Offset: 0xef12
// Size: 0x24, Type: bool
function queue_isfull( queue )
{
    return queue.array.size == queue.capacity;
}

// Namespace utility
// Params 1
// Checksum 0xf3a50d1a, Offset: 0xef3f
// Size: 0x1a, Type: bool
function queue_isempty( queue )
{
    return queue.array.size == 0;
}

// Namespace utility
// Params 2
// Checksum 0x8f4fe39b, Offset: 0xef62
// Size: 0xa9, Type: bool
function function_9dac7ef683ed0e52( queue, object )
{
    if ( !( isdefined( queue ) && isdefined( object ) ) )
    {
        return false;
    }
    
    tempcount = 0;
    i = queue.front;
    
    while ( tempcount < queue.array.size )
    {
        if ( !isdefined( queue.array[ i ] ) )
        {
        }
        else
        {
            if ( queue.array[ i ] == object )
            {
                return true;
            }
            
            if ( i + 1 >= queue.capacity )
            {
                i = 0;
            }
            else
            {
                i++;
            }
        }
        
        tempcount++;
    }
    
    return false;
}

// Namespace utility
// Params 1
// Checksum 0x4c5e6fd2, Offset: 0xf014
// Size: 0x14
function function_6f5d2e1f1ff70482( milliseconds )
{
    return milliseconds * 0.001;
}

// Namespace utility
// Params 1
// Checksum 0xadc9c615, Offset: 0xf031
// Size: 0x14
function function_4b74c15943231980( seconds )
{
    return seconds * 1000;
}

// Namespace utility
// Params 4, eflags: 0x40 variadic
// Checksum 0xc90a24f9, Offset: 0xf04e
// Size: 0x4a
function single_thread( entity, func, ... )
{
    if ( !isfunction( func ) )
    {
        assert( 0, "<dev string:xdd3>" );
        return;
    }
    
    entity thread [[ func ]]( flat_args( vararg, varargcount ) );
}

// Namespace utility
// Params 3
// Checksum 0xb5a08fb, Offset: 0xf0a0
// Size: 0x28
function single_func_argarray( entity, func, a_vars )
{
    return function_838764575b0dd877( entity, func, a_vars );
}

// Namespace utility
// Params 3, eflags: 0x4
// Checksum 0x6b88e0ba, Offset: 0xf0d1
// Size: 0x31
function private function_838764575b0dd877( entity, func, a_vars )
{
    a_vars = function_5713d46873b29625( a_vars );
    return entity [[ func ]]( flat_args( a_vars, a_vars.size ) );
}

// Namespace utility
// Params 3, eflags: 0x40 variadic
// Checksum 0xfdf099c5, Offset: 0xf10b
// Size: 0x30
function function_704b6016a179b4ab( func, ... )
{
    if ( !isdefined( func ) )
    {
        return undefined;
    }
    
    return self [[ func ]]( flat_args( vararg, varargcount ) );
}

// Namespace utility
// Params 1
// Checksum 0x67766f46, Offset: 0xf144
// Size: 0x3d
function vtos( vector )
{
    return "(" + int( vector[ 0 ] ) + " " + int( vector[ 1 ] ) + " " + int( vector[ 2 ] ) + ")";
}

// Namespace utility
// Params 3
// Checksum 0x7c7cbf83, Offset: 0xf18a
// Size: 0xd9
function create_partition( array, cell_size, optimized )
{
    assert( isdefined( array ), "<dev string:xe02>" );
    assert( isarray( array ), "<dev string:xe31>" );
    assert( isdefined( cell_size ), "<dev string:xe74>" );
    assert( isfloat( cell_size ) || isint( cell_size ), "<dev string:xea7>" );
    partition = { #coordinate_add:int( 150000 / 2 * cell_size ), #cell_size:cell_size, #array:[] };
    
    if ( !optimized || getdvarint( @"hash_b2f246425a6afd15", 0 ) > 0 )
    {
        function_8868380bd929827a( partition, array );
    }
    else
    {
        function_aa703f04592736d7( partition, array );
    }
    
    return partition;
}

// Namespace utility
// Params 2, eflags: 0x4
// Checksum 0xf68a0f80, Offset: 0xf26c
// Size: 0x8a
function private function_8868380bd929827a( partition, array )
{
    foreach ( object in array )
    {
        partition function_d554cd5ddb12b9a6( object );
    }
    
    return partition;
}

// Namespace utility
// Params 0
// Checksum 0x64855dab, Offset: 0xf2ff
// Size: 0x1f
function clear_partition()
{
    assert( is_partition(), "<dev string:xef3>" );
    self.array = [];
}

// Namespace utility
// Params 0
// Checksum 0xe9b6229e, Offset: 0xf326
// Size: 0x2b, Type: bool
function is_partition()
{
    return isdefined( self.cell_size ) && isdefined( self.array ) && isdefined( self ) && isdefined( self.coordinate_add );
}

// Namespace utility
// Params 0
// Checksum 0x3657535b, Offset: 0xf35a
// Size: 0x18, Type: bool
function function_b48c0fc44dad5699()
{
    return is_partition() && self.array.size == 0;
}

// Namespace utility
// Params 1
// Checksum 0xdda78db1, Offset: 0xf37b
// Size: 0xfa
function function_d554cd5ddb12b9a6( object )
{
    assert( is_partition(), "<dev string:xf51>" );
    assert( isdefined( object ), "<dev string:xfb0>" );
    assert( isdefined( object.origin ), "<dev string:xfe0>" );
    [ x, y ] = function_890559684b1ecb60( object.origin );
    var_d428faa5fdd41d4f = self.array[ x ];
    
    if ( !isdefined( var_d428faa5fdd41d4f ) )
    {
        self.array[ x ] = [];
        var_d428faa5fdd41d4f = [];
    }
    
    var_1e8357156b843e8b = var_d428faa5fdd41d4f[ y ];
    
    if ( !isdefined( var_1e8357156b843e8b ) )
    {
        self.array[ x ][ y ] = [];
        var_bcb2a3b8f4f86415 = 0;
    }
    else
    {
        var_bcb2a3b8f4f86415 = var_1e8357156b843e8b.size;
    }
    
    self.array[ x ][ y ][ var_bcb2a3b8f4f86415 ] = object;
}

// Namespace utility
// Params 1
// Checksum 0xbbe666e9, Offset: 0xf47d
// Size: 0xba
function function_890559684b1ecb60( vector )
{
    assert( is_partition(), "<dev string:x1020>" );
    assert( isdefined( vector ), "<dev string:x108d>" );
    assert( isvector( vector ), "<dev string:x10cb>" );
    cell_size = self.cell_size;
    coordinate_add = self.coordinate_add;
    x = int( vector[ 0 ] / cell_size ) + coordinate_add;
    
    if ( x < 0 )
    {
        x = 0;
    }
    
    y = int( vector[ 1 ] / cell_size ) + coordinate_add;
    
    if ( y < 0 )
    {
        y = 0;
    }
    
    return [ x, y ];
}

// Namespace utility
// Params 1
// Checksum 0x966de8c7, Offset: 0xf540
// Size: 0xfd
function function_a4a8a4c917fab476( object )
{
    assert( is_partition(), "<dev string:x111c>" );
    assert( isdefined( object ), "<dev string:x1180>" );
    assert( isdefined( object.origin ), "<dev string:x11b5>" );
    [ x, y ] = function_890559684b1ecb60( object.origin );
    var_d428faa5fdd41d4f = self.array[ x ];
    
    if ( isdefined( var_d428faa5fdd41d4f ) && isdefined( var_d428faa5fdd41d4f[ y ] ) )
    {
        self.array[ x ][ y ] = arrayremove( var_d428faa5fdd41d4f[ y ], object );
        
        if ( self.array[ x ][ y ].size == 0 )
        {
            self.array[ x ][ y ] = undefined;
            
            if ( self.array[ x ].size == 0 )
            {
                self.array[ x ] = undefined;
            }
        }
    }
}

// Namespace utility
// Params 1
// Checksum 0xca5659be, Offset: 0xf645
// Size: 0xa6
function function_27490c47d34088c8( vector )
{
    assert( is_partition(), "<dev string:x11fa>" );
    assert( isdefined( vector ), "<dev string:x1261>" );
    assert( isvector( vector ), "<dev string:x129a>" );
    [ x, y ] = function_890559684b1ecb60( vector );
    var_d428faa5fdd41d4f = self.array[ x ];
    
    if ( isdefined( var_d428faa5fdd41d4f ) )
    {
        var_1e8357156b843e8b = var_d428faa5fdd41d4f[ y ];
        
        if ( isdefined( var_1e8357156b843e8b ) )
        {
            return var_1e8357156b843e8b;
        }
    }
    
    return [];
}

// Namespace utility
// Params 1
// Checksum 0xc4426e11, Offset: 0xf6f4
// Size: 0x122
function function_92fef8fe5211a388( vector )
{
    assert( is_partition(), "<dev string:x12e5>" );
    assert( isdefined( vector ), "<dev string:x1356>" );
    assert( isvector( vector ), "<dev string:x1398>" );
    [ x, y ] = function_890559684b1ecb60( vector );
    adjacent_arrays = [];
    
    for ( x_offset = -1; x_offset <= 1 ; x_offset++ )
    {
        x_test = x + x_offset;
        
        if ( x_test < 0 )
        {
            continue;
        }
        
        var_d428faa5fdd41d4f = self.array[ x_test ];
        
        if ( !isdefined( var_d428faa5fdd41d4f ) )
        {
            continue;
        }
        
        for ( y_offset = -1; y_offset <= 1 ; y_offset++ )
        {
            y_test = y + y_offset;
            
            if ( y_test < 0 )
            {
                continue;
            }
            
            var_1e8357156b843e8b = var_d428faa5fdd41d4f[ y_test ];
            
            if ( !isdefined( var_1e8357156b843e8b ) )
            {
                continue;
            }
            
            adjacent_arrays[ adjacent_arrays.size ] = var_1e8357156b843e8b;
        }
    }
    
    return adjacent_arrays;
}

// Namespace utility
// Params 1
// Checksum 0x600871a0, Offset: 0xf81f
// Size: 0x1d8
function function_93d8eea713f8560d( vector )
{
    assert( is_partition(), "<dev string:x13ed>" );
    assert( isdefined( vector ), "<dev string:x1465>" );
    assert( isvector( vector ), "<dev string:x14ae>" );
    [ x, y ] = function_890559684b1ecb60( vector );
    closest_object = undefined;
    var_d08a5cfc202aa3e3 = undefined;
    
    for ( x_offset = -1; x_offset <= 1 ; x_offset++ )
    {
        x_test = x + x_offset;
        
        if ( x_test < 0 )
        {
            continue;
        }
        
        var_d428faa5fdd41d4f = self.array[ x_test ];
        
        if ( !isdefined( var_d428faa5fdd41d4f ) )
        {
            continue;
        }
        
        for ( y_offset = -1; y_offset <= 1 ; y_offset++ )
        {
            y_test = y + y_offset;
            
            if ( y_test < 0 )
            {
                continue;
            }
            
            var_1e8357156b843e8b = var_d428faa5fdd41d4f[ y_test ];
            
            if ( !isdefined( var_1e8357156b843e8b ) )
            {
                continue;
            }
            
            foreach ( object in var_1e8357156b843e8b )
            {
                if ( !( isdefined( object ) && isdefined( object.origin ) ) )
                {
                    continue;
                }
                
                distance_squared = distancesquared( object.origin, vector );
                
                if ( !isdefined( var_d08a5cfc202aa3e3 ) || distance_squared < var_d08a5cfc202aa3e3 )
                {
                    var_d08a5cfc202aa3e3 = distance_squared;
                    closest_object = object;
                }
            }
        }
    }
    
    return closest_object;
}

// Namespace utility
// Params 2
// Checksum 0x6a0f7c94, Offset: 0xfa00
// Size: 0x1fc
function function_822c5feaca90abc1( origin, radius )
{
    assert( is_partition(), "<dev string:x150a>" );
    assert( isdefined( origin ), "<dev string:x1575>" );
    assert( isvector( origin ), "<dev string:x15b1>" );
    assert( isdefined( radius ), "<dev string:x160d>" );
    assert( isnumber( radius ), "<dev string:x1649>" );
    var_25a0fba0031a1a69 = int( ceil( radius / self.cell_size ) );
    [ x, y ] = function_890559684b1ecb60( origin );
    radius_squared = radius * radius;
    returned = [];
    
    for ( x_offset = var_25a0fba0031a1a69 * -1; x_offset <= var_25a0fba0031a1a69 ; x_offset++ )
    {
        x_test = x + x_offset;
        
        if ( x_test < 0 )
        {
            continue;
        }
        
        x_array = self.array[ x_test ];
        
        if ( !isdefined( x_array ) )
        {
            continue;
        }
        
        for ( y_offset = var_25a0fba0031a1a69 * -1; y_offset <= var_25a0fba0031a1a69 ; y_offset++ )
        {
            y_test = y + y_offset;
            
            if ( y_test < 0 )
            {
                continue;
            }
            
            var_2ce71cc1f8819ec = x_array[ y_test ];
            
            if ( !isdefined( var_2ce71cc1f8819ec ) )
            {
                continue;
            }
            
            foreach ( object in var_2ce71cc1f8819ec )
            {
                if ( distancesquared( object.origin, origin ) < radius_squared )
                {
                    returned[ returned.size ] = object;
                }
            }
        }
    }
    
    return returned;
}

// Namespace utility
// Params 4
// Checksum 0x8df9fdb9, Offset: 0xfc05
// Size: 0x83
function registersharedfunc( category, funcname, function, nooverride )
{
    /#
        if ( isstring( funcname ) )
        {
            assertmsg( "<dev string:x16a4>" + funcname + "<dev string:x16b1>" );
        }
    #/
    
    if ( isstring( category ) )
    {
        category = getxhash( category );
    }
    
    if ( nooverride && isdefined( level.sharedfuncs[ category ][ funcname ] ) )
    {
        return;
    }
    
    level.sharedfuncs[ category ][ funcname ] = function;
}

// Namespace utility
// Params 3
// Checksum 0x15e6849b, Offset: 0xfc90
// Size: 0x9c, Type: bool
function issharedfuncdefined( category, funcname, shouldassert )
{
    if ( isstring( category ) )
    {
        category = getxhash( category );
    }
    
    func = level.sharedfuncs[ category ][ funcname ];
    
    if ( !isdefined( func ) )
    {
        /#
            if ( isstring( funcname ) )
            {
                assertmsg( "<dev string:x16a4>" + funcname + "<dev string:x16b1>" );
            }
            
            if ( shouldassert )
            {
                assertmsg( getxhashsourcename( category ) + "<dev string:x16cb>" + getxhashsourcename( funcname ) + "<dev string:x16d1>" );
            }
        #/
        
        return false;
    }
    
    return true;
}

// Namespace utility
// Params 2
// Checksum 0xd1604aff, Offset: 0xfd35
// Size: 0x56
function getsharedfunc( category, funcname )
{
    /#
        if ( isstring( funcname ) )
        {
            assertmsg( "<dev string:x16a4>" + funcname + "<dev string:x16b1>" );
        }
    #/
    
    if ( isstring( category ) )
    {
        category = getxhash( category );
    }
    
    return level.sharedfuncs[ category ][ funcname ];
}

// Namespace utility
// Params 4, eflags: 0x40 variadic
// Checksum 0x949cacbe, Offset: 0xfd94
// Size: 0xb3
function callsharedfunc( category, funcname, ... )
{
    if ( isstring( category ) )
    {
        category = getxhash( category );
    }
    
    func = level.sharedfuncs[ category ][ funcname ];
    
    if ( isfunction( func ) )
    {
        return self [[ func ]]( flat_args( vararg, varargcount ) );
    }
    else if ( isbuiltinfunction( func ) )
    {
        return builtin [[ func ]]( flat_args( vararg, varargcount ) );
    }
    else if ( isbuiltinmethod( func ) )
    {
        return self builtin [[ func ]]( flat_args( vararg, varargcount ) );
    }
    
    /#
        if ( isstring( funcname ) )
        {
            assertmsg( "<dev string:x16a4>" + funcname + "<dev string:x16b1>" );
        }
    #/
    
    return undefined;
}

// Namespace utility
// Params 2
// Checksum 0x774377cb, Offset: 0xfe50
// Size: 0x56
function function_b095265a72aa4f20( category, funcname )
{
    /#
        if ( isstring( funcname ) )
        {
            assertmsg( "<dev string:x16a4>" + funcname + "<dev string:x16b1>" );
        }
    #/
    
    if ( isstring( category ) )
    {
        category = getxhash( category );
    }
    
    level.sharedfuncs[ category ][ funcname ] = undefined;
}

// Namespace utility
// Params 2, eflags: 0x40 variadic
// Checksum 0x52f0ccef, Offset: 0xfeae
// Size: 0x20
function function_86127362b0b7eb11( ... )
{
    return function_543ee02cabf50e25( undefined, flat_args( vararg, varargcount ) );
}

// Namespace utility
// Params 3, eflags: 0x40 variadic
// Checksum 0x52160719, Offset: 0xfed7
// Size: 0xe7
function function_543ee02cabf50e25( timeout, ... )
{
    assert( !isdefined( timeout ) || timeout > 0 );
    assert( varargcount >= 2 );
    assert( varargcount % 2 == 0 );
    self endon( "death" );
    context = spawnstruct();
    context.var_281430b4e3937048 = 0;
    context.var_f866e0b41edac98a = arraycontains( vararg, "death" );
    i = 0;
    
    while ( i < varargcount )
    {
        function_bd5f115c5b978f93( vararg[ i ], vararg[ i + 1 ], context );
        i += 2;
    }
    
    if ( isdefined( timeout ) )
    {
        context childthread timeout_struct( timeout );
    }
    
    context waittill( "returned", msg );
    context notify( "die" );
    return msg;
}

// Namespace utility
// Params 3
// Checksum 0x18af72ad, Offset: 0xffc7
// Size: 0x4e
function function_bd5f115c5b978f93( entity, message, context )
{
    entity childthread waittill_string( message, context );
    
    if ( !context.var_f866e0b41edac98a )
    {
        context.var_281430b4e3937048++;
        childthread function_cae7240c7de68a7( entity, context );
    }
}

// Namespace utility
// Params 2
// Checksum 0x8b3f2410, Offset: 0x1001d
// Size: 0x4d
function function_cae7240c7de68a7( entity, context )
{
    context endon( "die" );
    entity waittill( "death" );
    context.var_281430b4e3937048--;
    
    if ( context.var_281430b4e3937048 == 0 )
    {
        context notify( "returned", undefined );
    }
}

// Namespace utility
// Params 2, eflags: 0x40 variadic
// Checksum 0x96d87cc1, Offset: 0x10072
// Size: 0x20
function function_a5c752b3c63769b7( ... )
{
    return function_61754ffd8e0a4959( 0, flat_args( vararg, varargcount ) );
}

// Namespace utility
// Params 3, eflags: 0x40 variadic
// Checksum 0xf498eea6, Offset: 0x1009b
// Size: 0x11a
function function_61754ffd8e0a4959( timeout, ... )
{
    assert( varargcount >= 1 );
    
    /#
        if ( !isdefined( timeout ) || !isnumber( timeout ) )
        {
            assertmsg( "<dev string:x16f4>" );
        }
    #/
    
    if ( !arraycontains( vararg, "death" ) )
    {
        self endon( "death" );
    }
    
    struct = spawnstruct();
    
    foreach ( varstring in vararg )
    {
        childthread function_85c91016b4b45c34( varstring, struct );
    }
    
    if ( timeout > 0 )
    {
        childthread function_76c1b3b34ade2ea3( struct, "returned", timeout );
    }
    
    struct waittill( "returned", results_array );
    struct notify( "struct_delete" );
    return results_array;
}

// Namespace utility
// Params 2, eflags: 0x40 variadic
// Checksum 0x312a2500, Offset: 0x101be
// Size: 0x93
function function_404f9b2f2626b992( ... )
{
    /#
        function_8ae6ad9600816017( flat_args( vararg, varargcount ) );
    #/
    
    struct = spawnstruct();
    i = 0;
    
    while ( i < varargcount )
    {
        if ( isdefined( vararg[ i ] ) && isdefined( vararg[ i + 1 ] ) )
        {
            vararg[ i ] childthread function_85c91016b4b45c34( vararg[ i + 1 ], struct );
        }
        
        i += 2;
    }
    
    struct waittill( "returned", results_array );
    struct notify( "struct_delete" );
    return results_array;
}

// Namespace utility
// Params 3, eflags: 0x40 variadic
// Checksum 0x768cba3d, Offset: 0x1025a
// Size: 0xea
function function_22939e0bc589604e( timeout, ... )
{
    /#
        if ( !isdefined( timeout ) || !isnumber( timeout ) )
        {
            assertmsg( "<dev string:x16f4>" );
        }
        
        function_8ae6ad9600816017( flat_args( vararg, varargcount ) );
    #/
    
    if ( !arraycontains( vararg, "death" ) )
    {
        self endon( "death" );
    }
    
    struct = spawnstruct();
    i = 0;
    
    while ( i < varargcount )
    {
        if ( isdefined( vararg[ i ] ) && isdefined( vararg[ i + 1 ] ) )
        {
            vararg[ i ] childthread function_85c91016b4b45c34( vararg[ i + 1 ], struct );
        }
        
        i += 2;
    }
    
    if ( timeout > 0 )
    {
        level childthread function_76c1b3b34ade2ea3( struct, "returned", timeout );
    }
    
    struct waittill( "returned", results_array );
    struct notify( "struct_delete" );
    return results_array;
}

// Namespace utility
// Params 3, eflags: 0x4
// Checksum 0x47b66e8, Offset: 0x1034d
// Size: 0x53
function private function_76c1b3b34ade2ea3( ent, msg, timeout )
{
    self endon( msg );
    wait timeout;
    results = [];
    results[ "ent" ] = undefined;
    results[ "message" ] = "timeout";
    ent notify( "returned", results );
}

// Namespace utility
// Params 2, eflags: 0x4
// Checksum 0x80a7a263, Offset: 0x103a8
// Size: 0x146
function private function_85c91016b4b45c34( msg, struct )
{
    if ( msg != "death" )
    {
        self endon( "death" );
    }
    
    struct endon( "struct_delete" );
    self waittill( msg, param1, param2, param3, param4, param5, param6, param7, param8, param9, param10 );
    result = [];
    
    if ( isdefined( param1 ) )
    {
        result[ 0 ] = param1;
    }
    
    if ( isdefined( param2 ) )
    {
        result[ 1 ] = param2;
    }
    
    if ( isdefined( param3 ) )
    {
        result[ 2 ] = param3;
    }
    
    if ( isdefined( param4 ) )
    {
        result[ 3 ] = param4;
    }
    
    if ( isdefined( param5 ) )
    {
        result[ 4 ] = param5;
    }
    
    if ( isdefined( param6 ) )
    {
        result[ 5 ] = param6;
    }
    
    if ( isdefined( param7 ) )
    {
        result[ 6 ] = param7;
    }
    
    if ( isdefined( param8 ) )
    {
        result[ 7 ] = param8;
    }
    
    if ( isdefined( param9 ) )
    {
        result[ 8 ] = param9;
    }
    
    if ( isdefined( param10 ) )
    {
        result[ 9 ] = param10;
    }
    
    result[ "ent" ] = self;
    result[ "message" ] = msg;
    struct notify( "returned", result );
}

// Namespace utility
// Params 1
// Checksum 0xfacf2492, Offset: 0x104f6
// Size: 0x7e
function string_to_bool( the_string )
{
    retval = undefined;
    
    switch ( the_string )
    {
        case #"hash_31100fbc01bd387c":
        case #"hash_8328fb6e4f43ba45":
            retval = 1;
            break;
        case #"hash_311010bc01bd3a0f":
        case #"hash_a9152f56f0c74738":
            retval = 0;
            break;
        default:
            assertmsg( "<dev string:x1748>" );
            break;
    }
    
    return retval;
}

// Namespace utility
// Params 1
// Checksum 0x284276fc, Offset: 0x1057d
// Size: 0x1b
function get_int_or_0( value )
{
    if ( !isdefined( value ) )
    {
        return 0;
    }
    
    return int( value );
}

// Namespace utility
// Params 1
// Checksum 0x83713f18, Offset: 0x105a1
// Size: 0x10f
function function_dc226e1c2f06ea0b( bundlename )
{
    if ( !isxhashasset( bundlename ) )
    {
        bundlename = getxhashasset( tolower( bundlename ) );
    }
    
    if ( !isdefined( level.globalbundles ) )
    {
        level.globalbundles = [];
    }
    
    if ( !isdefined( level.globalbundles[ bundlename ] ) )
    {
        level.globalbundles[ bundlename ] = [];
        level.globalbundles[ bundlename ][ 0 ] = getscriptbundle( bundlename );
        
        if ( isdefined( level.globalbundles[ bundlename ][ 0 ] ) )
        {
            assert( !isdefined( level.globalbundles[ bundlename ][ 0 ].var_5d185975a2bb0b35 ) );
            level.globalbundles[ bundlename ][ 0 ].var_5d185975a2bb0b35 = bundlename;
            level.globalbundles[ bundlename ][ 1 ] = 0;
        }
        else
        {
            level.globalbundles[ bundlename ] = undefined;
            return undefined;
        }
    }
    
    level.globalbundles[ bundlename ][ 1 ] += 1;
    return level.globalbundles[ bundlename ][ 0 ];
}

// Namespace utility
// Params 1
// Checksum 0xabafda59, Offset: 0x106b9
// Size: 0xa2
function function_cacdd05a312a4bf0( bundlestruct )
{
    if ( !isdefined( bundlestruct ) )
    {
        return;
    }
    
    if ( !isdefined( level.globalbundles ) )
    {
        return;
    }
    
    assert( isdefined( bundlestruct.var_5d185975a2bb0b35 ) );
    bundlename = bundlestruct.var_5d185975a2bb0b35;
    
    if ( !isdefined( level.globalbundles[ bundlename ] ) )
    {
        return;
    }
    
    level.globalbundles[ bundlename ][ 1 ] -= 1;
    
    if ( level.globalbundles[ bundlename ][ 1 ] <= 0 )
    {
        level.globalbundles[ bundlename ] = undefined;
    }
}

// Namespace utility
// Params 1
// Checksum 0x665e69c0, Offset: 0x10763
// Size: 0x89
function function_123ab1b2aa3f4ff9( object )
{
    queue = self;
    queueitem = spawnstruct();
    queueitem.object = object;
    
    if ( isdefined( queue.tail ) )
    {
        queue.tail.next = queueitem;
        queue.tail = queueitem;
        return;
    }
    
    queue.head = queueitem;
    queue.tail = queueitem;
}

// Namespace utility
// Params 0
// Checksum 0x9e70e8c1, Offset: 0x107f4
// Size: 0x91
function function_15c8b2fac9e406c1()
{
    queue = self;
    
    while ( isdefined( queue.head ) )
    {
        object = queue.head.object;
        queue.head = queue.head.next;
        
        if ( !isdefined( queue.head ) )
        {
            queue.tail = undefined;
        }
        
        var_7237854e3be197ca = object;
        
        if ( isdefined( var_7237854e3be197ca ) )
        {
            return var_7237854e3be197ca;
        }
    }
}

// Namespace utility
// Params 1
// Checksum 0x5de20032, Offset: 0x1088d
// Size: 0x1ab
function function_4113d68e8e0a401f( array )
{
    assert( isdefined( self.origin ) && isdefined( self.angles ) );
    closest_dot = -1;
    closest_object = undefined;
    
    if ( isplayer( self ) )
    {
        forward = anglestoforward( self getplayerangles() );
        
        foreach ( object in array )
        {
            dir = vectornormalize( object.origin - self geteye() );
            dot = vectordot( forward, dir );
            
            if ( dot >= closest_dot )
            {
                closest_dot = dot;
                closest_object = object;
            }
        }
    }
    else
    {
        forward = anglestoforward( self.angles );
        
        foreach ( object in array )
        {
            dir = vectornormalize( object.origin - self.origin );
            dot = vectordot( forward, dir );
            
            if ( dot >= closest_dot )
            {
                closest_dot = dot;
                closest_object = object;
            }
        }
    }
    
    return closest_object;
}

// Namespace utility
// Params 2
// Checksum 0x1907f53a, Offset: 0x10a41
// Size: 0x25
function function_fb5b19421bb35e50( object, string )
{
    object waittill( string );
    
    if ( isdefined( self ) )
    {
        self delete();
    }
}

// Namespace utility
// Params 3
// Checksum 0xa4f7bd4a, Offset: 0x10a6e
// Size: 0x54
function function_95db22f620602461( dvar, func, args )
{
    if ( getdvarint( dvar ) )
    {
        if ( isdefined( args ) )
        {
            if ( !isarray( args ) )
            {
                args = [ args ];
            }
            
            return single_func_argarray( self, func, args );
        }
        
        return self [[ func ]]();
    }
}

// Namespace utility
// Params 3
// Checksum 0x7b16b4ec, Offset: 0x10aca
// Size: 0x60
function function_bef70f17de325bdb( dvar, func, args )
{
    if ( !isdvardefined( dvar ) || !getdvarint( dvar ) )
    {
        if ( isdefined( args ) )
        {
            if ( !isarray( args ) )
            {
                args = [ args ];
            }
            
            return single_func_argarray( self, func, args );
        }
        
        return self [[ func ]]();
    }
}

// Namespace utility
// Params 4
// Checksum 0x1db82b04, Offset: 0x10b32
// Size: 0xa0
function function_9f84aa016f6d1297( dvar, value, func, args )
{
    if ( isdefined( value ) )
    {
        if ( getdvarint( dvar ) == value )
        {
            if ( isdefined( args ) )
            {
                if ( !isarray( args ) )
                {
                    args = [ args ];
                }
                
                return single_func_argarray( self, func, args );
            }
            else
            {
                return self [[ func ]]();
            }
        }
        
        return;
    }
    
    if ( !isdvardefined( dvar ) )
    {
        if ( isdefined( args ) )
        {
            if ( !isarray( args ) )
            {
                args = [ args ];
            }
            
            return single_func_argarray( self, func, args );
        }
        
        return self [[ func ]]();
    }
}

// Namespace utility
// Params 4
// Checksum 0xbae0297b, Offset: 0x10bda
// Size: 0x6a
function function_445ecc08c54dd330( dvar, value, func, args )
{
    if ( isdvardefined( dvar ) && getdvarint( dvar ) < value )
    {
        if ( isdefined( args ) )
        {
            if ( !isarray( args ) )
            {
                args = [ args ];
            }
            
            return single_func_argarray( self, func, args );
        }
        
        return self [[ func ]]();
    }
}

// Namespace utility
// Params 4
// Checksum 0xfe7a3c62, Offset: 0x10c4c
// Size: 0x6a
function function_55dfc08395ae18d3( dvar, value, func, args )
{
    if ( isdvardefined( dvar ) && getdvarint( dvar ) > value )
    {
        if ( isdefined( args ) )
        {
            if ( !isarray( args ) )
            {
                args = [ args ];
            }
            
            return single_func_argarray( self, func, args );
        }
        
        return self [[ func ]]();
    }
}

// Namespace utility
// Params 3
// Checksum 0x6766731e, Offset: 0x10cbe
// Size: 0x2e
function function_edc4cc03e9e60b3e( dvar_name, default_value, var_704edfac805ac331 )
{
    return function_aebf0fdab30eb618( getdvarint( dvar_name, default_value ), default_value, var_704edfac805ac331 );
}

// Namespace utility
// Params 3
// Checksum 0xfcf4c098, Offset: 0x10cf5
// Size: 0x2e
function function_48f723fdc612ec65( dvar_name, default_value, var_704edfac805ac331 )
{
    return function_aebf0fdab30eb618( getdvarfloat( dvar_name, default_value ), default_value, var_704edfac805ac331 );
}

// Namespace utility
// Params 3
// Checksum 0x9715605e, Offset: 0x10d2c
// Size: 0x2e
function function_5eb6ca497c84f302( dvar_name, default_value, var_704edfac805ac331 )
{
    return function_aebf0fdab30eb618( getdvarvector( dvar_name, default_value ), default_value, var_704edfac805ac331 );
}

// Namespace utility
// Params 3
// Checksum 0x12c5919a, Offset: 0x10d63
// Size: 0x2e
function function_49a778e73bbb0f58( dvar_name, default_value, var_704edfac805ac331 )
{
    return function_aebf0fdab30eb618( getdvar( dvar_name, default_value ), default_value, var_704edfac805ac331 );
}

// Namespace utility
// Params 3, eflags: 0x4
// Checksum 0xb62f25b9, Offset: 0x10d9a
// Size: 0x5d
function private function_aebf0fdab30eb618( dvar_value, default_value, var_704edfac805ac331 )
{
    assert( isdefined( default_value ) );
    return_value = default_value;
    
    if ( isdefined( dvar_value ) && dvar_value != default_value )
    {
        return_value = dvar_value;
    }
    else
    {
        return_value = isdefined( var_704edfac805ac331 ) ? var_704edfac805ac331 : default_value;
    }
    
    return return_value;
}

// Namespace utility
// Params 7
// Checksum 0xeeb3d44e, Offset: 0x10e00
// Size: 0x105
function function_dc36010b2b55e552( center, radius, ang_perc, color = ( 1, 1, 1 ), alpha = 1, depthtest = 1, duration = 1 )
{
    if ( !( isdefined( radius ) && isdefined( center ) && isdefined( ang_perc ) ) )
    {
        return;
    }
    
    thread draw_circle( center, radius, color, alpha, depthtest, duration );
    start = function_41c078929be6e7fe( center, radius, ang_perc );
    end = function_41c078929be6e7fe( center, radius, ang_perc + 180 );
    
    /#
        line( start, end, color, alpha, depthtest, duration );
    #/
    
    start = function_41c078929be6e7fe( center, radius, ang_perc * -1 );
    end = function_41c078929be6e7fe( center, radius, ang_perc * -1 + 180 );
    
    /#
        line( start, end, color, alpha, depthtest, duration );
    #/
}

// Namespace utility
// Params 3, eflags: 0x4
// Checksum 0xffc5f595, Offset: 0x10f0d
// Size: 0x62
function private function_41c078929be6e7fe( center, radius, ang_perc )
{
    x = radius * cos( ang_perc ) + center[ 0 ];
    y = radius * sin( ang_perc ) + center[ 1 ];
    z = center[ 2 ];
    return ( x, y, z );
}

// Namespace utility
// Params 1
// Checksum 0xe2d65c35, Offset: 0x10f78
// Size: 0x6b
function function_64003742d8f5c781( weapon )
{
    if ( isweapon( weapon ) )
    {
        return weapon;
    }
    
    if ( isstring( weapon ) )
    {
        return ( level.var_d53b344e2aeda06f[ weapon ] ?? function_c8852ed0b886c6bd( weapon ) );
    }
    
    if ( isxhashasset( weapon ) )
    {
        return ( level.var_8a2f4f6d7534396a[ weapon ] ?? function_ea577e55c7daf2b2( weapon ) );
    }
    
    assert( isdefined( weapon ), "<dev string:x1775>" );
    return undefined;
}

// Namespace utility
// Params 1, eflags: 0x4
// Checksum 0x614d86b3, Offset: 0x10fec
// Size: 0x10a
function private function_c8852ed0b886c6bd( var_e3ee05786f18e2c3 )
{
    var_3c04a2b892cbba04 = level.sharedfuncs[ #"weapons" ][ #"hash_591d84c60e3b7802" ];
    
    if ( !var_3c04a2b892cbba04 )
    {
        assertmsg( "<dev string:x17aa>" );
        return undefined;
    }
    
    var_bea6ab4cd5df553c = level.weaponmapdata[ var_e3ee05786f18e2c3 ].assetname ?? var_e3ee05786f18e2c3;
    
    if ( issubstr( var_bea6ab4cd5df553c, "+" ) )
    {
        assertmsg( "<dev string:x180a>" );
        return undefined;
    }
    
    weaponobj = [[ var_3c04a2b892cbba04 ]]( var_bea6ab4cd5df553c );
    
    if ( !isdefined( level.var_d53b344e2aeda06f ) )
    {
        level.var_d53b344e2aeda06f = [];
    }
    
    level.var_d53b344e2aeda06f[ var_e3ee05786f18e2c3 ] = weaponobj;
    
    /#
        if ( !isdefined( level.weaponnone ) )
        {
            level.weaponnone = makeweapon( "<dev string:x32d>" );
        }
        
        assert( weaponobj != level.weaponnone || var_e3ee05786f18e2c3 == "<dev string:x18ff>", "<dev string:x1907>" + var_e3ee05786f18e2c3 );
    #/
    
    return weaponobj;
}

// Namespace utility
// Params 1, eflags: 0x4
// Checksum 0x3f4ebd5c, Offset: 0x110ff
// Size: 0x11c
function private function_ea577e55c7daf2b2( var_8ef80df233884b8e )
{
    var_3c04a2b892cbba04 = level.sharedfuncs[ #"weapons" ][ #"hash_e2adafa41f9e4a45" ];
    
    if ( !var_3c04a2b892cbba04 )
    {
        assertmsg( "<dev string:x192c>" );
        return undefined;
    }
    
    if ( !isdefined( level.weaponnone ) )
    {
        level.weaponnone = makeweapon( "" );
    }
    
    weaponobj = function_7508ecd9410f7dfa( var_8ef80df233884b8e, var_3c04a2b892cbba04 );
    
    if ( weaponobj == level.weaponnone )
    {
        weaponobj = function_7508ecd9410f7dfa( hashcat( var_8ef80df233884b8e, "_mp" ), var_3c04a2b892cbba04 );
        
        if ( weaponobj == level.weaponnone )
        {
            weaponobj = function_7508ecd9410f7dfa( hashcat( var_8ef80df233884b8e, "_sp" ), var_3c04a2b892cbba04 );
        }
    }
    
    if ( !isdefined( level.var_8a2f4f6d7534396a ) )
    {
        level.var_8a2f4f6d7534396a = [];
    }
    
    level.var_8a2f4f6d7534396a[ var_8ef80df233884b8e ] = weaponobj;
    assert( weaponobj != level.weaponnone || var_8ef80df233884b8e == %"none", "<dev string:x1907>" + getxhashsourcename( var_8ef80df233884b8e ) );
    return weaponobj;
}

// Namespace utility
// Params 2, eflags: 0x4
// Checksum 0x310d845a, Offset: 0x11224
// Size: 0x2d
function private function_7508ecd9410f7dfa( var_8ef80df233884b8e, var_3c04a2b892cbba04 )
{
    if ( weaponexists( var_8ef80df233884b8e ) )
    {
        return [[ var_3c04a2b892cbba04 ]]( var_8ef80df233884b8e );
    }
    
    return level.weaponnone;
}

// Namespace utility
// Params 2
// Checksum 0xf24db20b, Offset: 0x1125a
// Size: 0x3b
function function_5362640c80ccf9c5( storage_int, flag_index )
{
    assert( flag_index >= 0 && flag_index <= 30, "<dev string:x198f>" );
    storage_int |= 1 << flag_index;
    return storage_int;
}

// Namespace utility
// Params 2
// Checksum 0x728272e2, Offset: 0x1129e
// Size: 0x50
function function_e98a690ce7443031( storage_int, flag_index )
{
    assert( flag_index >= 0 && flag_index <= 30, "<dev string:x198f>" );
    flag = ( storage_int & 1 << flag_index ) > 0 ? 1 : 0;
    return flag;
}

// Namespace utility
// Params 2
// Checksum 0xede5eb14, Offset: 0x112f7
// Size: 0x3c
function function_911d2d3c6d773726( storage_int, flag_index )
{
    assert( flag_index >= 0 && flag_index <= 30, "<dev string:x198f>" );
    storage_int &= ~( 1 << flag_index );
    return storage_int;
}

// Namespace utility
// Params 1
// Checksum 0x271378d4, Offset: 0x1133c
// Size: 0x56
function function_9ab002313e87d84c( flag_index )
{
    assert( isint( flag_index ), "<dev string:x19b1>" );
    var_4f583ee171a9fb16 = flag_index % 30 == 0;
    
    if ( var_4f583ee171a9fb16 )
    {
        storageindex = flag_index / 30;
    }
    else
    {
        storageindex = int( flag_index / 30 );
    }
    
    return storageindex;
}

// Namespace utility
// Params 1
// Checksum 0x6b900fa8, Offset: 0x1139b
// Size: 0x54
function function_c73b75a176f26cf6( flag_index )
{
    assert( isint( flag_index ), "<dev string:x19b1>" );
    storageindex = function_9ab002313e87d84c( flag_index );
    
    if ( !isdefined( storageindex ) )
    {
        return undefined;
    }
    
    index = flag_index - 30 * storageindex;
    return int( index );
}

// Namespace utility
// Params 1
// Checksum 0x4ec825af, Offset: 0x113f8
// Size: 0x2c
function wait_frames( framecount )
{
    frames = framecount;
    
    while ( frames > 0 )
    {
        frames -= 1;
        waitframe();
    }
}

// Namespace utility
// Params 2, eflags: 0x40 variadic
// Checksum 0xe1f53571, Offset: 0x1142c
// Size: 0x16, Type: bool
function always_false( ... )
{
    return false;
}

// Namespace utility
// Params 2, eflags: 0x40 variadic
// Checksum 0x79048a6f, Offset: 0x1144b
// Size: 0x17, Type: bool
function always_true( ... )
{
    return true;
}

// Namespace utility
// Params 0
// Checksum 0x89d0f491, Offset: 0x1146b
// Size: 0x80
function function_645a77750f1850b5()
{
    assert( flag( "<dev string:x19d4>" ), "<dev string:x19f4>" );
    var_ef057d6ea73e1a53 = level.sharedfuncs[ #"engine" ][ #"hash_ff8355771dcc2c20" ];
    
    if ( !isdefined( var_ef057d6ea73e1a53 ) )
    {
        assert( !issp(), "<dev string:x1a53>" );
        level.var_f8f564d5b2b09e05 = 0;
        return 0;
    }
    
    level.var_f8f564d5b2b09e05 = builtin [[ var_ef057d6ea73e1a53 ]]();
    return level.var_f8f564d5b2b09e05;
}

/#

    // Namespace utility
    // Params 2, eflags: 0x44 variadic
    // Checksum 0x4e74fdfd, Offset: 0x114f4
    // Size: 0xd7, Type: dev
    function private function_8ae6ad9600816017( ... )
    {
        assert( varargcount % 2 == 0 );
        assert( varargcount == vararg.size );
        i = 0;
        
        while ( i < varargcount )
        {
            if ( !isent( vararg[ i ] ) && !isstruct( vararg[ i ] ) && !function_9d35bda59d2a81bd( vararg[ i ] ) )
            {
                assertmsg( "<dev string:x1a7b>" + i + 1 + "<dev string:x1a86>" + i / 2 + 1 + "<dev string:x1a8f>" );
            }
            
            if ( !isstring( vararg[ i + 1 ] ) )
            {
                assertmsg( "<dev string:x1a7b>" + i + 2 + "<dev string:x1ac1>" + ( i + 1 ) / 2 + "<dev string:x1acd>" );
            }
            
            i += 2;
        }
    }

#/

// Namespace utility
// Params 2
// Checksum 0xc0cf3238, Offset: 0x115d3
// Size: 0x28
function function_b720276ae54a4d70( value, message )
{
    if ( !isdefined( value ) )
    {
        assertmsg( message );
    }
    
    return value;
}

