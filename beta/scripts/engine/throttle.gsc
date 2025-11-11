#namespace throttle;

// Namespace throttle
// Params 1, eflags: 0x4
// Checksum 0xdbfc18f6, Offset: 0x40a
// Size: 0x39
function private function_8280c88863030872( throttle )
{
    throttle endon( throttle.var_538c5b918e960f74 );
    
    while ( isdefined( throttle ) )
    {
        function_302d031d90fb290d( throttle );
        wait throttle.updaterate_;
    }
}

// Namespace throttle
// Params 1, eflags: 0x4
// Checksum 0xbf32d10b, Offset: 0x44b
// Size: 0xaf
function private function_302d031d90fb290d( throttle )
{
    profilestart();
    processed = 0;
    
    for ( index = 0; index < throttle.queue_.size ; index++ )
    {
        item = throttle.queue_[ index ];
        throttle.queue_[ index ] = undefined;
        
        if ( !isdefined( item ) )
        {
            continue;
        }
        
        item notify( throttle.var_9aff5df0dbb7c83 );
        processed++;
        
        if ( processed >= throttle.processlimit_ )
        {
            break;
        }
    }
    
    throttle.queue_ = function_5713d46873b29625( throttle.queue_ );
    profilestop();
}

// Namespace throttle
// Params 4
// Checksum 0x7aea45ef, Offset: 0x502
// Size: 0xff
function throttle_initialize( name, processlimit = 1, updaterate, queuelimit )
{
    if ( processlimit == 0 )
    {
        return undefined;
    }
    
    assert( isstring( name ) );
    throttle = spawnstruct();
    throttle.queue_ = [];
    throttle.var_9aff5df0dbb7c83 = name + "_wake_up";
    throttle.var_538c5b918e960f74 = name + "_stop_threads";
    throttle.processlimit_ = processlimit;
    throttle.updaterate_ = updaterate ?? level.framedurationseconds;
    throttle.queuelimit_ = queuelimit;
    
    if ( !isdefined( throttle.updaterate_ ) )
    {
        if ( getdvarint( @"g_connectpaths", 0 ) > 0 )
        {
            return undefined;
        }
        
        assertmsg( "<dev string:x24>" );
    }
    
    thread function_8280c88863030872( throttle );
    return throttle;
}

// Namespace throttle
// Params 1
// Checksum 0x5527721c, Offset: 0x60a
// Size: 0x19, Type: bool
function is_empty( throttle )
{
    return !throttle.queue_.size;
}

// Namespace throttle
// Params 1
// Checksum 0x1b12d04a, Offset: 0x62c
// Size: 0x9b, Type: bool
function function_eed893c053dbf304( throttle )
{
    if ( !isdefined( throttle.queue_ ) )
    {
        return true;
    }
    
    foreach ( item in throttle.queue_ )
    {
        if ( isdefined( item ) )
        {
            return false;
        }
    }
    
    return true;
}

// Namespace throttle
// Params 1
// Checksum 0xba1a25e, Offset: 0x6d0
// Size: 0x24
function throttle_destroy( throttle )
{
    if ( isdefined( throttle ) )
    {
        throttle notify( throttle.var_538c5b918e960f74 );
        throttle = undefined;
    }
}

// Namespace throttle
// Params 2
// Checksum 0x1dede4c2, Offset: 0x6fc
// Size: 0xec
function function_cc0eee553a602af0( throttle, entity )
{
    assert( !isdefined( throttle.gate ), "<dev string:x85>" );
    throttle endon( throttle.var_538c5b918e960f74 );
    
    if ( !isdefined( throttle ) )
    {
        assertmsg( "<dev string:xde>" );
        return;
    }
    
    while ( throttle.queue_.size > throttle.queuelimit_ )
    {
        function_302d031d90fb290d( throttle );
    }
    
    if ( !isdefined( entity ) )
    {
        return;
    }
    
    if ( !isent( entity ) && !isstruct( entity ) )
    {
        return;
    }
    
    if ( !arraycontains( throttle.queue_, entity ) )
    {
        throttle.queue_[ throttle.queue_.size ] = entity;
    }
    
    entity endon( "death" );
    entity endon( "delete" );
    entity waittill( throttle.var_9aff5df0dbb7c83 );
}

// Namespace throttle
// Params 2
// Checksum 0x8389f0a, Offset: 0x7f0
// Size: 0x26
function function_311421fabea78894( throttle, entity )
{
    return arraycontains( throttle.queue_, entity );
}

// Namespace throttle
// Params 2
// Checksum 0xa20eb633, Offset: 0x81f
// Size: 0x32
function function_5cd43d18d28d98de( throttle, entity )
{
    throttle.queue_ = arrayremove( throttle.queue_, entity );
}

// Namespace throttle
// Params 3
// Checksum 0xec237725, Offset: 0x859
// Size: 0xaa
function function_f60fd6b686168f09( name, processlimit = 1, updaterate )
{
    if ( processlimit == 0 )
    {
        return undefined;
    }
    
    assert( isstring( name ) );
    throttle = spawnstruct();
    throttle.var_538c5b918e960f74 = name + "_stop_threads";
    throttle.var_13c10823fd93bc91 = 0;
    throttle.processlimit_ = processlimit;
    throttle.updaterate_ = updaterate ?? level.framedurationseconds;
    
    /#
        throttle.gate = 1;
    #/
    
    return throttle;
}

// Namespace throttle
// Params 1
// Checksum 0xe73a9501, Offset: 0x90c
// Size: 0x8f
function function_793863e476bf1524( throttle )
{
    if ( !isdefined( throttle ) )
    {
        assertmsg( "<dev string:xde>" );
        return;
    }
    
    assert( throttle.gate, "<dev string:xfa>" );
    
    if ( throttle.var_13c10823fd93bc91 >= throttle.processlimit_ )
    {
        throttle endon( throttle.var_538c5b918e960f74 );
        wait throttle.updaterate_;
        throttle.var_13c10823fd93bc91 = 1;
        return 1;
    }
    
    throttle.var_13c10823fd93bc91++;
    return 0;
}

// Namespace throttle
// Params 4
// Checksum 0x93d21b16, Offset: 0x9a4
// Size: 0xe3
function function_ac02df3f2e81cbab( name, processlimit = 1, updaterate, var_b09c79250a78463d )
{
    if ( processlimit == 0 )
    {
        return undefined;
    }
    
    assert( isstring( name ) );
    throttle = spawnstruct();
    throttle.var_538c5b918e960f74 = name + "_stop_threads";
    throttle.var_13c10823fd93bc91 = 0;
    throttle.processlimit_ = processlimit;
    throttle.updaterate_ = updaterate ?? level.framedurationseconds;
    throttle.var_e064ce760682c986 = int( ( var_b09c79250a78463d ?? level.framedurationseconds ) * 1000 );
    throttle.var_659ff8afcce5a7c9 = -1;
    
    /#
        throttle.var_8e7b3e975fdd2a97 = 1;
    #/
    
    return throttle;
}

// Namespace throttle
// Params 1
// Checksum 0x300cee57, Offset: 0xa90
// Size: 0xcb
function function_706ed379a3746335( throttle )
{
    if ( !isdefined( throttle ) )
    {
        assertmsg( "<dev string:xde>" );
        return;
    }
    
    assert( throttle.var_8e7b3e975fdd2a97, "<dev string:x154>" );
    timenow = gettime();
    
    if ( timenow < throttle.var_659ff8afcce5a7c9 )
    {
        throttle endon( throttle.var_538c5b918e960f74 );
        secondstowait = ( throttle.var_659ff8afcce5a7c9 - timenow ) * 0.001;
        wait secondstowait;
    }
    else if ( throttle.var_659ff8afcce5a7c9 != -1 )
    {
        waitframe();
    }
    
    throttle.var_659ff8afcce5a7c9 = gettime() + throttle.var_e064ce760682c986;
    throttle.var_13c10823fd93bc91 = 0;
}

// Namespace throttle
// Params 1
// Checksum 0xf506603, Offset: 0xb63
// Size: 0x8a
function function_1302aa73badc74f0( throttle )
{
    if ( !isdefined( throttle ) )
    {
        assertmsg( "<dev string:xde>" );
        return;
    }
    
    assert( throttle.var_8e7b3e975fdd2a97, "<dev string:x1cb>" );
    
    if ( throttle.var_13c10823fd93bc91 >= throttle.processlimit_ )
    {
        throttle endon( throttle.var_538c5b918e960f74 );
        wait throttle.updaterate_;
        throttle.var_13c10823fd93bc91 = 0;
    }
    
    throttle.var_13c10823fd93bc91++;
}

// Namespace throttle
// Params 0
// Checksum 0x7ce2e6b, Offset: 0xbf5
// Size: 0x2c
function function_fd10bab4295ec41f()
{
    throttle_ut_initialize();
    throttle_ut_queue();
    throttle_ut_queue_10();
    throttle_ut_queue_10_threaded();
    throttle_ut_leave_queue();
    function_d4806c82433d6d48();
}

// Namespace throttle
// Params 1
// Checksum 0x6f1473a7, Offset: 0xc29
// Size: 0x20
function test_print( msg )
{
    /#
        msg = "<dev string:x239>" + msg;
        println( msg );
    #/
}

// Namespace throttle
// Params 0
// Checksum 0xb5562d1d, Offset: 0xc51
// Size: 0x24b
function throttle_ut_initialize()
{
    test_print( "BEGIN throttle_UT_initialize" );
    test_throttle = throttle_initialize( "test_throttle_1", 1, level.framedurationseconds );
    test_print( "CALL - throttle_initialize( test_throttle_1, " + 1 + ", " + level.framedurationseconds + ")" );
    assert( isarray( test_throttle.queue_ ) && test_throttle.queue_.size == 0 );
    assert( test_throttle.var_9aff5df0dbb7c83 == "<dev string:x24c>" + "<dev string:x25f>" );
    assert( test_throttle.processlimit_ == 1 );
    assert( test_throttle.updaterate_ == level.framedurationseconds );
    assert( !isdefined( test_throttle.queuelimit_ ) );
    test_throttle = throttle_initialize( "test_throttle_2", 2, level.framedurationseconds );
    test_print( "CALL - throttle_initialize( test_throttle_2, " + 2 + ", " + level.framedurationseconds + ")" );
    assert( test_throttle.processlimit_ == 2 );
    test_throttle = throttle_initialize( "test_throttle_queueLimit", 1, level.framedurationseconds, 3 );
    test_print( "CALL - throttle_initialize( test_throttle_queueLimit, " + 1 + ", " + level.framedurationseconds + ", " + 3 + ")" );
    assert( test_throttle.queuelimit_ == 3 );
    test_throttle = throttle_initialize( "test_throttle_defaults" );
    test_print( "CALL - throttle_initialize( test_throttle_defaults )" );
    assert( isarray( test_throttle.queue_ ) && test_throttle.queue_.size == 0 );
    assert( test_throttle.var_9aff5df0dbb7c83 == "<dev string:x26b>" + "<dev string:x25f>" );
    assert( test_throttle.processlimit_ == 1 );
    assert( test_throttle.updaterate_ == level.framedurationseconds );
    assert( !isdefined( test_throttle.queuelimit_ ) );
    test_print( "END throttle_UT_initialize" );
}

// Namespace throttle
// Params 0
// Checksum 0x5dcd5756, Offset: 0xea4
// Size: 0xc4
function throttle_ut_queue()
{
    test_print( "BEGIN throttle_UT_queue" );
    test_throttle = throttle_initialize( "test_throttle_wait", 1, level.framedurationseconds );
    test_print( "CALL - throttle_initialize( " + 1 + ", " + level.framedurationseconds + ")" );
    entity = spawn( "script_model", ( 0, 0, 0 ) );
    function_cc0eee553a602af0( test_throttle, entity );
    test_print( "CALL - wait_in_queue" );
    isinqueue = function_311421fabea78894( test_throttle, entity );
    test_print( "Ent in queue: " + isinqueue );
    assert( !isinqueue );
    test_print( "END throttle_UT_queue" );
}

// Namespace throttle
// Params 0
// Checksum 0x1fd91387, Offset: 0xf70
// Size: 0x11c
function throttle_ut_queue_10()
{
    test_print( "BEGIN throttle_UT_queue_10" );
    test_throttle = throttle_initialize( "test_throttle_wait", 1, level.framedurationseconds );
    test_print( "CALL - throttle_initialize( " + 1 + ", " + level.framedurationseconds + ")" );
    ents = [];
    
    for ( i = 1; i <= 10 ; i++ )
    {
        ents[ ents.size ] = spawn( "script_model", ( 0, 0, 0 ) );
        function_cc0eee553a602af0( test_throttle, ents[ ents.size - 1 ] );
        test_print( "CALL - wait_in_queue " + i );
        test_print( "Time - " + gettime() );
        test_print( "Ents in Queue - " + test_throttle.queue_.size );
    }
    
    isinqueue = function_311421fabea78894( test_throttle, ents[ 3 ] );
    test_print( "Ent 3 in queue: " + isinqueue );
    assert( !isinqueue );
    test_print( "END throttle_UT_queue_10" );
}

// Namespace throttle
// Params 0
// Checksum 0x2800d668, Offset: 0x1094
// Size: 0x11b
function throttle_ut_queue_10_threaded()
{
    test_print( "BEGIN throttle_UT_queue_10_threaded" );
    test_throttle = throttle_initialize( "test_throttle_wait", 1, level.framedurationseconds );
    test_print( "CALL - throttle_initialize( " + 1 + ", " + level.framedurationseconds + ")" );
    ents = [];
    
    for ( i = 1; i <= 10 ; i++ )
    {
        ents[ ents.size ] = spawn( "script_model", ( 0, 0, 0 ) );
        thread function_cc0eee553a602af0( test_throttle, ents[ ents.size - 1 ] );
        test_print( "CALL - wait_in_queue " + i );
        test_print( "Time - " + gettime() );
        test_print( "Ents in Queue - " + test_throttle.queue_.size );
    }
    
    isinqueue = function_311421fabea78894( test_throttle, ents[ 3 ] );
    test_print( "Ent 3 in queue: " + isinqueue );
    assert( isinqueue );
    test_print( "END throttle_UT_queue_10_threaded" );
}

// Namespace throttle
// Params 0
// Checksum 0xc64a900c, Offset: 0x11b7
// Size: 0x143
function throttle_ut_leave_queue()
{
    test_print( "BEGIN throttle_UT_leave_queue" );
    test_throttle = throttle_initialize( "test_throttle_wait", 1, level.framedurationseconds );
    test_print( "CALL - throttle_initialize( " + 1 + ", " + level.framedurationseconds + ")" );
    ents = [];
    
    for ( i = 1; i <= 10 ; i++ )
    {
        ents[ ents.size ] = spawn( "script_model", ( 0, 0, 0 ) );
        thread function_cc0eee553a602af0( test_throttle, ents[ ents.size - 1 ] );
        test_print( "CALL - wait_in_queue " + i );
        test_print( "Time - " + gettime() );
    }
    
    isinqueue = function_311421fabea78894( test_throttle, ents[ 3 ] );
    test_print( "ent 3 in queue: " + isinqueue );
    assert( isinqueue );
    function_5cd43d18d28d98de( test_throttle, ents[ 3 ] );
    test_print( "CALL - leave_queue" );
    isinqueue = function_311421fabea78894( test_throttle, ents[ 3 ] );
    test_print( "ent 3 in queue: " + isinqueue );
    assert( !isinqueue );
    test_print( "END throttle_UT_leave_queue" );
}

// Namespace throttle
// Params 0
// Checksum 0x42ee0966, Offset: 0x1302
// Size: 0x355
function function_d4806c82433d6d48()
{
    /#
        test_print( "<dev string:x285>" );
        test_throttle = function_ac02df3f2e81cbab( "<dev string:x2ae>", 2, undefined, 0.5 );
        assert( test_throttle.var_13c10823fd93bc91 == 0 );
        assert( test_throttle.processlimit_ == 2 );
        assert( test_throttle.updaterate_ == level.framedurationseconds );
        assert( isint( test_throttle.var_e064ce760682c986 ) );
        assert( test_throttle.var_e064ce760682c986 == 500 );
        assert( test_throttle.var_659ff8afcce5a7c9 == -1 );
        assert( test_throttle.var_8e7b3e975fdd2a97 );
        timenow = gettime();
        origtime = timenow;
        function_706ed379a3746335( test_throttle );
        assert( gettime() == timenow );
        assert( test_throttle.var_659ff8afcce5a7c9 != -1 );
        function_706ed379a3746335( test_throttle );
        var_e6bedfc791723be4 = level.frameduration * int( 500 / level.frameduration );
        assert( gettime() == timenow + var_e6bedfc791723be4 );
        timenow = gettime();
        origtime = timenow;
        function_1302aa73badc74f0( test_throttle );
        assert( gettime() == timenow );
        assert( test_throttle.var_13c10823fd93bc91 == 1 );
        function_1302aa73badc74f0( test_throttle );
        assert( gettime() == timenow );
        assert( test_throttle.var_13c10823fd93bc91 == 2 );
        function_1302aa73badc74f0( test_throttle );
        assert( gettime() == timenow + test_throttle.updaterate_ * 1000 );
        assert( test_throttle.var_13c10823fd93bc91 == 1 );
        function_1302aa73badc74f0( test_throttle );
        assert( gettime() == timenow + test_throttle.updaterate_ * 1000 );
        assert( test_throttle.var_13c10823fd93bc91 == 2 );
        timenow = gettime();
        function_1302aa73badc74f0( test_throttle );
        assert( gettime() == timenow + test_throttle.updaterate_ * 1000 );
        assert( test_throttle.var_13c10823fd93bc91 == 1 );
        timenow = gettime();
        assert( origtime < timenow );
        function_706ed379a3746335( test_throttle );
        assert( test_throttle.var_13c10823fd93bc91 == 0 );
        assert( gettime() != timenow + var_e6bedfc791723be4 );
        assert( gettime() == origtime + var_e6bedfc791723be4 );
        testframes = int( test_throttle.var_e064ce760682c986 / level.frameduration * test_throttle.processlimit_ ) + 1;
        
        for ( i = 0; i < testframes ; i++ )
        {
            function_1302aa73badc74f0( test_throttle );
        }
        
        timenow = gettime();
        function_706ed379a3746335( test_throttle );
        assert( gettime() == timenow + level.frameduration );
        test_print( "<dev string:x2c5>" );
    #/
}

