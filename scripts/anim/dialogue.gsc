#using scripts\common\utility;
#using scripts\engine\utility;

#namespace dialogue;

// Namespace dialogue
// Params 6
// Checksum 0xb656f847, Offset: 0x49d
// Size: 0x227
function say( alias, priority, timeout, overlap, delay, scope )
{
    assert( isxhash( alias ) || isstring( alias ), "<dev string:x24>" );
    
    if ( !soundexists( alias ) && !function_cf6c7d510f5a4b08( alias ) )
    {
        /#
            iprintlnbold( "<dev string:x50>" + getxhashsourcename( alias ) + "<dev string:x5d>" );
        #/
        
        return 0;
    }
    
    self endon( "death" );
    
    if ( !isdefined( priority ) )
    {
        priority = 0;
    }
    
    if ( !isdefined( overlap ) )
    {
        overlap = priority > 0;
    }
    
    if ( !isdefined( scope ) )
    {
        scope = "self";
    }
    
    assert( scope == "<dev string:x6e>" || scope == "<dev string:x76>" || scope == "<dev string:x7e>", "<dev string:x88>" );
    speaker = self;
    
    if ( self == level )
    {
        speaker = function_2a9ca9e3797e5dc1();
        speaker.var_2234510c97c706f9 = 1;
    }
    
    if ( utility::is_dead_or_dying( speaker ) || speaker.vo_disabled || level.vo_disabled )
    {
        return 0;
    }
    
    assert( scope != "<dev string:x76>" || isdefined( speaker.team ), "<dev string:xc2>" );
    
    if ( isdefined( level.var_2cd2e0438f6f8231 ) )
    {
        function_d2d119b3f687c63c( level.var_2cd2e0438f6f8231, alias );
        level.var_2cd2e0438f6f8231 = undefined;
    }
    
    vo_data = spawnstruct();
    vo_data.alias = alias;
    vo_data.priority = priority;
    vo_data.timeout = timeout;
    vo_data.overlap = overlap;
    vo_data.speaker = speaker;
    vo_data.scope = scope;
    vo_data.scope_ents = speaker function_bf5715bcec0f160a();
    vo_data thread queue_say( speaker, alias, priority, timeout, overlap, delay );
    
    if ( !vo_data.vo_done_or_cancelled )
    {
        vo_data waittill( "vo_done_or_cancelled" );
    }
    
    return vo_data.said_vo;
}

// Namespace dialogue
// Params 2
// Checksum 0x1fcc53ed, Offset: 0x6cd
// Size: 0x6b
function function_d2d119b3f687c63c( radio_dist, alias )
{
    assert( isfloat( radio_dist ) || isint( radio_dist ), "<dev string:xf5>" );
    
    if ( !isdefined( alias ) )
    {
        level.var_2cd2e0438f6f8231 = radio_dist;
        return;
    }
    
    if ( !isdefined( level.var_1ccd80f236e572c7 ) )
    {
        level.var_1ccd80f236e572c7 = [];
    }
    
    level.var_1ccd80f236e572c7[ alias ] = radio_dist;
}

// Namespace dialogue
// Params 7
// Checksum 0x1a76d9b1, Offset: 0x740
// Size: 0x6a
function say_sequence( sequence, priority, timeout, overlap, delay, scope, endons )
{
    vo_data = create_vo_data( sequence, priority, timeout, overlap ?? 0, delay, scope, endons );
    return function_3da7a23e38f374f4( vo_data );
}

// Namespace dialogue
// Params 7
// Checksum 0xa031acec, Offset: 0x7b3
// Size: 0x52
function function_c3551d7006b7e1a0( endons, sequence, priority, timeout, overlap, delay, scope )
{
    return say_sequence( sequence, priority, timeout, overlap, delay, scope, endons );
}

// Namespace dialogue
// Params 7
// Checksum 0xe9203271, Offset: 0x80e
// Size: 0x52
function function_5524594c0f738542( delay, sequence, priority, timeout, overlap, scope, endons )
{
    return say_sequence( sequence, priority, timeout, overlap, delay, scope, endons );
}

// Namespace dialogue
// Params 6
// Checksum 0x2bb5c184, Offset: 0x869
// Size: 0x4d
function function_6469d7400ed061cf( sequence, priority, timeout, overlap, delay, endons )
{
    return say_sequence( sequence, priority, timeout, overlap, delay, "global", endons );
}

// Namespace dialogue
// Params 2
// Checksum 0x9ebfc10, Offset: 0x8bf
// Size: 0xd0
function stop_dialogue( cancel_queued_vo, cancel_delayed_vo )
{
    if ( !isdefined( cancel_queued_vo ) || cancel_queued_vo )
    {
        self notify( "cancel_queued_vo" );
    }
    
    if ( !isdefined( cancel_delayed_vo ) || cancel_delayed_vo )
    {
        self notify( "cancel_delayed_vo" );
    }
    
    self notify( "stop_vo_sequence" );
    self notify( "stop_dialogue" );
    self notify( "stop_facialFiller" );
    
    if ( isdefined( self.var_6ad6546473593e72 ) )
    {
        self notify( "scripted_face_" + getxhashhexname( self.var_6ad6546473593e72 ), "end" );
    }
    
    self.var_861991271473c76 = undefined;
    emitter = self;
    
    if ( utility::issp() && isplayer( self ) || isstruct( self ) || isdefined( self.vo_emitter ) )
    {
        emitter = function_2a9ca9e3797e5dc1();
    }
    
    thread function_f94a633a775187e1( emitter );
}

// Namespace dialogue
// Params 1
// Checksum 0xd3f81dc7, Offset: 0x997
// Size: 0x56
function disable_dialogue( include_chatter )
{
    speaker = self;
    
    if ( level == self )
    {
        speaker = function_2a9ca9e3797e5dc1();
    }
    
    speaker.vo_disabled = 1;
    
    if ( include_chatter )
    {
        speaker utility::set_battlechatter( 0 );
    }
    
    speaker notify( "cancel_queued_vo" );
    speaker notify( "cancel_delayed_vo" );
}

// Namespace dialogue
// Params 1
// Checksum 0x915d725b, Offset: 0x9f5
// Size: 0x45
function enable_dialogue( include_chatter )
{
    speaker = self;
    
    if ( level == self )
    {
        speaker = function_2a9ca9e3797e5dc1();
    }
    
    speaker.vo_disabled = 1;
    
    if ( include_chatter )
    {
        speaker utility::set_battlechatter( 1 );
    }
}

// Namespace dialogue
// Params 1
// Checksum 0x95e5416b, Offset: 0xa42
// Size: 0xe0
function function_c6ba3c3dce99441( include_chatter )
{
    level.vo_disabled = 1;
    
    if ( include_chatter )
    {
        level.battlechatterdisabled = 1;
    }
    
    foreach ( vo_data in arraycombine( level.vo_queue, level.vo_active ) )
    {
        if ( !include_chatter && vo_data.ischatter )
        {
            continue;
        }
        
        vo_data.speaker notify( "cancel_queued_vo" );
        vo_data.speaker notify( "cancel_delayed_vo" );
    }
}

// Namespace dialogue
// Params 1
// Checksum 0x329a7756, Offset: 0xb2a
// Size: 0x25
function function_9097bbda63c20f58( include_chatter )
{
    level.vo_disabled = 0;
    
    if ( include_chatter )
    {
        level.battlechatterdisabled = 0;
    }
}

// Namespace dialogue
// Params 5
// Checksum 0x9563cfa2, Offset: 0xb57
// Size: 0x42
function say_self( alias, priority, timeout, overlap, delay )
{
    return say( alias, priority, timeout, overlap, delay, "self" );
}

// Namespace dialogue
// Params 5
// Checksum 0x2ac84fc1, Offset: 0xba2
// Size: 0x42
function say_team( alias, priority, timeout, overlap, delay )
{
    return say( alias, priority, timeout, overlap, delay, "team" );
}

// Namespace dialogue
// Params 5
// Checksum 0xb997dd32, Offset: 0xbed
// Size: 0x42
function say_global( alias, priority, timeout, overlap, delay )
{
    return say( alias, priority, timeout, overlap, delay, "global" );
}

// Namespace dialogue
// Params 6
// Checksum 0x20b7ce14, Offset: 0xc38
// Size: 0x47
function say_delayed( delay, alias, priority, timeout, overlap, scope )
{
    return say( alias, priority, timeout, overlap, delay, scope );
}

// Namespace dialogue
// Params 5
// Checksum 0x53335d29, Offset: 0xc88
// Size: 0x42
function function_94ace3cd374cf75d( delay, alias, priority, timeout, overlap )
{
    return say( alias, priority, timeout, overlap, delay, "self" );
}

// Namespace dialogue
// Params 5
// Checksum 0x5000a316, Offset: 0xcd3
// Size: 0x42
function function_af58dde41667b1a( delay, alias, priority, timeout, overlap )
{
    return say( alias, priority, timeout, overlap, delay, "team" );
}

// Namespace dialogue
// Params 5
// Checksum 0x8d3a539f, Offset: 0xd1e
// Size: 0x42
function function_c2a452ea2cb15908( delay, alias, priority, timeout, overlap )
{
    return say( alias, priority, timeout, overlap, delay, "global" );
}

// Namespace dialogue
// Params 3
// Checksum 0xd495e468, Offset: 0xd69
// Size: 0xdf
function function_92182b8f79533d55( team, cancel_queued_vo, cancel_delayed_vo )
{
    assert( isdefined( team ), "<dev string:x114>" );
    
    if ( !( isdefined( level.vo_teams ) && isdefined( level.vo_teams[ team ] ) ) )
    {
        return;
    }
    
    foreach ( vo_data in level.vo_teams[ team ].vo_active )
    {
        vo_data.speaker stop_dialogue( cancel_queued_vo, cancel_delayed_vo );
    }
}

// Namespace dialogue
// Params 2
// Checksum 0xb62a3774, Offset: 0xe50
// Size: 0xa9
function function_2fe10366c7ca1ea1( cancel_queued_vo, cancel_delayed_vo )
{
    if ( !isdefined( level.vo_active ) )
    {
        return;
    }
    
    foreach ( vo_data in level.vo_active )
    {
        vo_data.speaker stop_dialogue( cancel_queued_vo, cancel_delayed_vo );
    }
}

// Namespace dialogue
// Params 0
// Checksum 0xd9631b08, Offset: 0xf01
// Size: 0xc4, Type: bool
function is_speaking()
{
    speaker = self;
    
    if ( self == level )
    {
        speaker = function_2a9ca9e3797e5dc1();
    }
    
    if ( !isdefined( speaker.var_861991271473c76 ) || !isdefined( speaker.var_6ad6546473593e72 ) && !isdefined( speaker.var_cf0d3e00923233a5 ) )
    {
        return false;
    }
    
    if ( isdefined( speaker.vo_active ) )
    {
        return ( speaker.vo_active.size > 0 );
    }
    
    if ( isdefined( speaker.var_cf0d3e00923233a5 ) )
    {
        duration_ms = get_holdtime( speaker.var_cf0d3e00923233a5 ) * 1000;
    }
    else
    {
        duration_ms = lookupsoundlength( speaker.var_6ad6546473593e72 );
    }
    
    return gettime() <= speaker.var_861991271473c76 + duration_ms;
}

// Namespace dialogue
// Params 0
// Checksum 0xf1c7da92, Offset: 0xfce
// Size: 0x35, Type: bool
function function_de5820ddcfc41a92()
{
    speaker = self;
    
    if ( self == level )
    {
        speaker = function_2a9ca9e3797e5dc1();
    }
    
    return speaker is_speaking() || isdefined( speaker.vo_delaystart );
}

// Namespace dialogue
// Params 0
// Checksum 0xd6fbfdbd, Offset: 0x100c
// Size: 0x34, Type: bool
function function_ef3bb46d2024effd()
{
    speaker = self;
    
    if ( self == level )
    {
        speaker = function_2a9ca9e3797e5dc1();
    }
    
    return speaker is_speaking() || speaker.var_ec03032865e57470;
}

// Namespace dialogue
// Params 0
// Checksum 0xbff576b, Offset: 0x1049
// Size: 0x44, Type: bool
function function_8231932c5efc0648()
{
    speaker = self;
    
    if ( self == level )
    {
        speaker = function_2a9ca9e3797e5dc1();
    }
    
    return speaker is_speaking() || speaker.var_ec03032865e57470 || isdefined( speaker.vo_delaystart );
}

// Namespace dialogue
// Params 1
// Checksum 0xfaa0713c, Offset: 0x1096
// Size: 0x65, Type: bool
function function_fb4cd0ece2b37b9( team = self.team )
{
    assert( isdefined( team ), "<dev string:x143>" );
    
    if ( !( isdefined( level.vo_teams ) && isdefined( level.vo_teams[ team ] ) ) )
    {
        return false;
    }
    
    return level.vo_teams[ team ].vo_active.size > 0;
}

// Namespace dialogue
// Params 2
// Checksum 0x381436a3, Offset: 0x1104
// Size: 0xdc, Type: bool
function function_d365322ed7891bc0( speaker_array, cooldown = 15 )
{
    assert( isdefined( speaker_array ), "<dev string:x16e>" );
    assert( isarray( speaker_array ), "<dev string:x193>" );
    
    foreach ( speaker in speaker_array )
    {
        if ( speaker function_ef3bb46d2024effd() )
        {
            return true;
        }
        
        var_5b9e3cdd7554d82d = speaker function_842a649e126d7644();
        
        if ( isdefined( var_5b9e3cdd7554d82d ) && var_5b9e3cdd7554d82d < cooldown )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace dialogue
// Params 0
// Checksum 0xc886819d, Offset: 0x11e9
// Size: 0x1e, Type: bool
function function_364375dbc0613c64()
{
    if ( !isdefined( level.vo_active ) )
    {
        return false;
    }
    
    return level.vo_active.size > 0;
}

// Namespace dialogue
// Params 1
// Checksum 0xa5783020, Offset: 0x1210
// Size: 0x10b, Type: bool
function function_5d66ac3cec47b60( timeout )
{
    speaker = self;
    
    if ( isdefined( timeout ) )
    {
        struct = spawnstruct();
        struct endon( "end" );
        childthread function_66cf8056d9200040( timeout, "end", struct );
    }
    
    if ( self == level )
    {
        speaker = function_2a9ca9e3797e5dc1();
    }
    
    if ( !speaker function_de5820ddcfc41a92() )
    {
        return false;
    }
    
    speaker endon( "death" );
    
    if ( isdefined( speaker.vo_active ) && speaker.vo_active.size > 0 )
    {
        speaker waittill( "vo_done_or_cancelled" );
    }
    else
    {
        var_44d17ac6cace9165 = gettime() - speaker.var_861991271473c76;
        
        if ( isdefined( speaker.var_6ad6546473593e72 ) )
        {
            duration_ms = lookupsoundlength( speaker.var_6ad6546473593e72 );
        }
        else
        {
            duration_ms = get_holdtime( speaker.var_cf0d3e00923233a5 ) * 1000;
        }
        
        time_remaining = ( duration_ms - var_44d17ac6cace9165 ) / 1000;
        wait time_remaining;
    }
    
    return true;
}

// Namespace dialogue
// Params 0
// Checksum 0x21ae15f6, Offset: 0x1324
// Size: 0x63, Type: bool
function wait_finish_speaking()
{
    speaker = self;
    
    if ( self == level )
    {
        speaker = function_2a9ca9e3797e5dc1();
    }
    
    if ( !speaker.var_ec03032865e57470 )
    {
        return function_5d66ac3cec47b60();
    }
    
    speaker endon( "cancel_queued_vo" );
    speaker endon( "death" );
    
    while ( speaker.var_ec03032865e57470 > 0 )
    {
        speaker waittill( "vo_done_or_cancelled" );
    }
    
    return true;
}

// Namespace dialogue
// Params 0
// Checksum 0x856009e, Offset: 0x1390
// Size: 0x7a
function function_842a649e126d7644()
{
    speaker = self;
    
    if ( self == level )
    {
        speaker = function_2a9ca9e3797e5dc1();
    }
    
    if ( !( isdefined( speaker.var_861991271473c76 ) && isdefined( speaker.var_6ad6546473593e72 ) ) )
    {
        return undefined;
    }
    
    var_71bb217d1560b0ed = speaker.var_861991271473c76 + lookupsoundlength( speaker.var_6ad6546473593e72 );
    
    if ( gettime() < var_71bb217d1560b0ed )
    {
        return undefined;
    }
    
    return ( gettime() - var_71bb217d1560b0ed ) / 1000;
}

// Namespace dialogue
// Params 0
// Checksum 0x79b29945, Offset: 0x1413
// Size: 0xdd
function function_dcf12370fd4e45e6()
{
    speaker = self;
    
    if ( self == level )
    {
        speaker = function_2a9ca9e3797e5dc1();
    }
    
    var_f53efabcb0bae4ef = isdefined( speaker.vo_delaystart ) && isnumber( speaker.vo_delayvalue );
    
    if ( !var_f53efabcb0bae4ef && !isdefined( speaker.var_861991271473c76 ) || !isdefined( speaker.var_6ad6546473593e72 ) )
    {
        return undefined;
    }
    
    if ( var_f53efabcb0bae4ef )
    {
        var_71bb217d1560b0ed = speaker.vo_delaystart + speaker.vo_delayvalue * 1000 + lookupsoundlength( speaker.var_6ad6546473593e72 );
    }
    else
    {
        var_71bb217d1560b0ed = self.var_861991271473c76 + lookupsoundlength( self.var_6ad6546473593e72 );
    }
    
    if ( gettime() > var_71bb217d1560b0ed )
    {
        return undefined;
    }
    
    return ( var_71bb217d1560b0ed - gettime() ) / 1000;
}

// Namespace dialogue
// Params 2
// Checksum 0x847513bc, Offset: 0x14f9
// Size: 0x58
function function_104de98887a584fc( var, value )
{
    if ( !isdefined( self.vo_nagvars ) )
    {
        function_a1c8c71775715127();
    }
    
    assert( isdefined( var ) && isdefined( self.nagvars[ var ] ), "<dev string:x1b3>" );
    self.vo_nagvars[ var ] = value;
}

// Namespace dialogue
// Params 4
// Checksum 0xc9890b01, Offset: 0x1559
// Size: 0xec
function set_nagvars( priority, timeout, overlap, scope )
{
    if ( !isdefined( self.vo_nagvars ) )
    {
        function_a1c8c71775715127();
    }
    
    self.vo_nagvars.priority = priority ?? self.vo_nagvars.priority;
    self.vo_nagvars.timeout = timeout ?? self.vo_nagvars.timeout;
    self.vo_nagvars.overlap = overlap ?? self.vo_nagvars.overlap;
    self.vo_nagvars.scope = scope ?? self.vo_nagvars.scope;
}

// Namespace dialogue
// Params 0
// Checksum 0xcf222334, Offset: 0x164d
// Size: 0xdd
function function_a1c8c71775715127()
{
    if ( self != level && !isdefined( level.vo_nagvars ) )
    {
        level function_a1c8c71775715127();
    }
    
    self.vo_nagvars = spawnstruct();
    self.vo_nagvars.priority = level.vo_nagvars.priority ?? 0;
    self.vo_nagvars.timeout = level.vo_nagvars.timeout ?? 1;
    self.vo_nagvars.overlap = level.vo_nagvars.overlap ?? 0;
    self.vo_nagvars.scope = level.vo_nagvars.scope ?? "team";
}

// Namespace dialogue
// Params 6
// Checksum 0x4f9f8384, Offset: 0x1732
// Size: 0xae
function nag_wait( flag_msg, nags, repeat_delay, initial_delay, loop_limit, invert_flag )
{
    self endon( "finished_nag_loop" );
    
    if ( invert_flag ? !utility::flag( flag_msg ) : utility::flag( flag_msg ) )
    {
        return;
    }
    
    endon_ent = spawnstruct();
    childthread nagtill( [ endon_ent, "stop" ], nags, repeat_delay, initial_delay, loop_limit );
    
    if ( invert_flag )
    {
        utility::flag_waitopen( flag_msg );
    }
    else
    {
        utility::flag_wait( flag_msg );
    }
    
    endon_ent notify( "stop" );
}

// Namespace dialogue
// Params 5
// Checksum 0xabcb4fda, Offset: 0x17e8
// Size: 0x40
function nag_waitopen( flag_msg, nags, repeat_delay, initial_delay, loop_limit )
{
    nag_wait( flag_msg, nags, repeat_delay, initial_delay, loop_limit, 1 );
}

// Namespace dialogue
// Params 6
// Checksum 0xf7b7d5ad, Offset: 0x1830
// Size: 0x189
function function_a0973d2210605735( var_d84ba87aae178d67, nags, repeat_delay, initial_delay, loop_limit, invert_flag )
{
    self endon( "finished_nag_loop" );
    
    foreach ( flag_msg in var_d84ba87aae178d67 )
    {
        if ( invert_flag ? !utility::flag( flag_msg ) : utility::flag( flag_msg ) )
        {
            return;
        }
    }
    
    endon_ent = spawnstruct();
    childthread nagtill( [ endon_ent, "stop" ], nags, repeat_delay, initial_delay, loop_limit );
    
    while ( true )
    {
        level utility::waittill_any_in_array( var_d84ba87aae178d67 );
        
        foreach ( flag_msg in var_d84ba87aae178d67 )
        {
            if ( invert_flag ? !utility::flag( flag_msg ) : utility::flag( flag_msg ) )
            {
                endon_ent notify( "stop" );
                return;
            }
        }
    }
}

// Namespace dialogue
// Params 6
// Checksum 0xa85c4ed6, Offset: 0x19c1
// Size: 0x1a2
function function_a08e24221056018c( var_d84ba87aae178d67, nags, repeat_delay, initial_delay, loop_limit, invert_flag )
{
    self endon( "finished_nag_loop" );
    
    foreach ( flag_msg in var_d84ba87aae178d67 )
    {
        if ( invert_flag ? utility::flag( flag_msg ) : !utility::flag( flag_msg ) )
        {
            continue;
        }
        
        return;
    }
    
    endon_ent = spawnstruct();
    childthread nagtill( [ endon_ent, "stop" ], nags, repeat_delay, initial_delay, loop_limit );
    exit = 0;
    
    while ( exit == 0 )
    {
        level utility::waittill_any_in_array( var_d84ba87aae178d67 );
        exit = 1;
        
        foreach ( flag_msg in var_d84ba87aae178d67 )
        {
            if ( invert_flag ? utility::flag( flag_msg ) : !utility::flag( flag_msg ) )
            {
                exit = 0;
                break;
            }
        }
    }
    
    endon_ent notify( "stop" );
}

// Namespace dialogue
// Params 5
// Checksum 0x549ba02a, Offset: 0x1b6b
// Size: 0xbc
function nagtill( endon_data, nags, repeat_delay, initial_delay, loop_limit )
{
    self endon( "finished_nag_loop" );
    assert( isdefined( repeat_delay ), "<dev string:x1c5>" );
    endon_ent = self;
    endon_msg = endon_data;
    
    if ( isarray( endon_data ) )
    {
        assert( endon_data.size == 2 && ( isent( endon_data[ 0 ] ) || isstruct( endon_data[ 0 ] ) ) && isstring( endon_data[ 1 ] ), "<dev string:x1ec>" );
        endon_ent = endon_data[ 0 ];
        endon_msg = endon_data[ 1 ];
    }
    
    endon_ent endon( endon_msg );
    nag_loop( nags, repeat_delay, initial_delay, loop_limit );
}

// Namespace dialogue
// Params 5
// Checksum 0xa605370b, Offset: 0x1c2f
// Size: 0xe9
function nagtill_any( endon_data, nags, repeat_delay, initial_delay, loop_limit )
{
    endon_ent = self;
    
    foreach ( endon_item in endon_data )
    {
        if ( isent( endon_item ) || isstruct( endon_item ) )
        {
            endon_ent = endon_item;
            continue;
        }
        
        if ( isstring( endon_item ) )
        {
            endon_ent endon( endon_item );
            continue;
        }
        
        assertmsg( "<dev string:x222>" );
    }
    
    nag_loop( nags, repeat_delay, initial_delay, loop_limit );
}

// Namespace dialogue
// Params 3
// Checksum 0x8fcd9ad7, Offset: 0x1d20
// Size: 0x5f
function growing_delay( start, end, count )
{
    delay = spawnstruct();
    delay.current = start;
    delay.maximum = end;
    delay.increment = ( end - start ) / count;
    return delay;
}

// Namespace dialogue
// Params 2
// Checksum 0xabb008c4, Offset: 0x1d88
// Size: 0x228
function waitfor( delay, params )
{
    assert( isdefined( delay ), "<dev string:x257>" );
    
    if ( isarray( delay ) )
    {
        if ( delay.size == 1 && isnumber( delay[ 0 ] ) )
        {
            delay = ( delay[ 0 ] - gettime() ) / 1000;
        }
        else if ( isfunction( delay[ 0 ] ) || isbuiltinmethod( delay[ 0 ] ) || isbuiltinfunction( delay[ 0 ] ) )
        {
            params = arraycopy( delay );
            params[ 0 ] = undefined;
            
            if ( isint( 0 ) )
            {
                function_cdc669dbc8ea2101( params );
            }
            
            return call_with_params( delay[ 0 ], params );
        }
        else if ( delay.size == 2 && ( isent( delay[ 0 ] ) || isstruct( delay[ 0 ] ) ) && isstring( delay[ 1 ] ) )
        {
            delay[ 0 ] waittill( delay[ 1 ], value );
            return value;
        }
        else if ( delay.size == 2 && isnumber( delay[ 0 ] ) && isnumber( delay[ 1 ] ) )
        {
            assert( delay[ 0 ] >= 0 && delay[ 1 ] >= delay[ 1 ], "<dev string:x27e>" );
            wait randomfloatrange( delay[ 0 ], delay[ 1 ] );
            return 1;
        }
        else
        {
            return waitfor_any( delay, params );
        }
    }
    
    if ( isnumber( delay ) )
    {
        if ( delay <= 0 )
        {
            return;
        }
        
        wait delay;
        return 1;
    }
    
    if ( isstruct( delay ) && isdefined( delay.current ) )
    {
        wait delay.current;
        
        if ( isdefined( delay.increment ) )
        {
            delay.current += delay.increment;
        }
        
        if ( delay.current >= delay.maximum )
        {
            delay.current = delay.maximum;
            return 1;
        }
        
        return;
    }
    
    if ( isstring( delay ) )
    {
        self waittill( delay, value );
        return value;
    }
    
    if ( isfunction( delay ) || isbuiltinmethod( delay ) || isbuiltinfunction( delay ) )
    {
        return call_with_params( delay, params );
    }
    
    assertmsg( "<dev string:x2db>" );
}

// Namespace dialogue
// Params 2
// Checksum 0x91e3b5ae, Offset: 0x1fb8
// Size: 0xec
function waitfor_any( delays, params )
{
    if ( !isarray( delays ) )
    {
        waitfor( delays, params );
        return delays;
    }
    
    ent = spawnstruct();
    ent endon( "kill" );
    
    foreach ( delay in delays )
    {
        childthread function_66cf8056d9200040( delay, "finished", ent, params );
    }
    
    ent waittill( "finished", result, delay );
    ent utility::delaythread( 0.05, &utility::send_notify, "kill" );
    return result;
}

// Namespace dialogue
// Params 4
// Checksum 0x970af949, Offset: 0x20ad
// Size: 0x4f
function function_66cf8056d9200040( delay, msg, notify_ent, params )
{
    if ( !isdefined( notify_ent ) )
    {
        notify_ent = self;
    }
    
    result = waitfor( delay, params );
    notify_ent notify( msg, result, delay, self );
}

// Namespace dialogue
// Params 4
// Checksum 0x7d6112f1, Offset: 0x2104
// Size: 0x4d
function function_5f93bf419368e0b3( delays, msg, notify_ent, params )
{
    if ( !isdefined( notify_ent ) )
    {
        notify_ent = self;
    }
    
    result = waitfor_any( delays, params );
    notify_ent notify( msg, result, self );
}

// Namespace dialogue
// Params 3
// Checksum 0x307f783d, Offset: 0x2159
// Size: 0x45
function waitfor_ent( delay, params, msg )
{
    struct = spawnstruct();
    thread function_66cf8056d9200040( delay, msg ?? "finish", struct, params );
    return struct;
}

// Namespace dialogue
// Params 2
// Checksum 0xb58aa7c2, Offset: 0x21a7
// Size: 0x64
function call_with_params( func, params )
{
    if ( isfunction( func ) )
    {
        return call_with_params_script( func, params );
    }
    
    if ( isbuiltinmethod( func ) )
    {
        return call_with_params_builtin( func, params );
    }
    
    if ( isbuiltinfunction( func ) )
    {
        return function_918092fd0343f8ae( func, params );
    }
    
    assertmsg( "<dev string:x2f2>" );
}

// Namespace dialogue
// Params 2
// Checksum 0x7b47f72f, Offset: 0x2213
// Size: 0x1cd
function call_with_params_script( func, params )
{
    assert( isfunction( func ), "<dev string:x345>" );
    
    if ( !isdefined( params ) )
    {
        return self [[ func ]]();
    }
    
    if ( !isarray( params ) )
    {
        return self [[ func ]]( params );
    }
    
    switch ( params.size )
    {
        case 0:
            return self [[ func ]]();
        case 1:
            return self [[ func ]]( params[ 0 ] );
        case 2:
            return self [[ func ]]( params[ 0 ], params[ 1 ] );
        case 3:
            return self [[ func ]]( params[ 0 ], params[ 1 ], params[ 2 ] );
        case 4:
            return self [[ func ]]( params[ 0 ], params[ 1 ], params[ 2 ], params[ 3 ] );
        case 5:
            return self [[ func ]]( params[ 0 ], params[ 1 ], params[ 2 ], params[ 3 ], params[ 4 ] );
        case 6:
            return self [[ func ]]( params[ 0 ], params[ 1 ], params[ 2 ], params[ 3 ], params[ 4 ], params[ 5 ] );
        case 7:
            return self [[ func ]]( params[ 0 ], params[ 1 ], params[ 2 ], params[ 3 ], params[ 4 ], params[ 5 ], params[ 6 ] );
        case 8:
            return self [[ func ]]( params[ 0 ], params[ 1 ], params[ 2 ], params[ 3 ], params[ 4 ], params[ 5 ], params[ 6 ], params[ 7 ] );
        case 9:
            return self [[ func ]]( params[ 0 ], params[ 1 ], params[ 2 ], params[ 3 ], params[ 4 ], params[ 5 ], params[ 6 ], params[ 7 ], params[ 8 ] );
        default:
            assertmsg( "<dev string:x368>" );
            break;
    }
}

// Namespace dialogue
// Params 2
// Checksum 0x9209bb89, Offset: 0x23e8
// Size: 0x1cd
function call_with_params_builtin( func, params )
{
    assert( isbuiltinmethod( func ), "<dev string:x3a5>" );
    
    if ( !isdefined( params ) )
    {
        return self [[ func ]]();
    }
    
    if ( !isarray( params ) )
    {
        return self builtin [[ func ]]( params );
    }
    
    switch ( params.size )
    {
        case 0:
            return self builtin [[ func ]]();
        case 1:
            return self builtin [[ func ]]( params[ 0 ] );
        case 2:
            return self builtin [[ func ]]( params[ 0 ], params[ 1 ] );
        case 3:
            return self builtin [[ func ]]( params[ 0 ], params[ 1 ], params[ 2 ] );
        case 4:
            return self builtin [[ func ]]( params[ 0 ], params[ 1 ], params[ 2 ], params[ 3 ] );
        case 5:
            return self builtin [[ func ]]( params[ 0 ], params[ 1 ], params[ 2 ], params[ 3 ], params[ 4 ] );
        case 6:
            return self builtin [[ func ]]( params[ 0 ], params[ 1 ], params[ 2 ], params[ 3 ], params[ 4 ], params[ 5 ] );
        case 7:
            return self builtin [[ func ]]( params[ 0 ], params[ 1 ], params[ 2 ], params[ 3 ], params[ 4 ], params[ 5 ], params[ 6 ] );
        case 8:
            return self builtin [[ func ]]( params[ 0 ], params[ 1 ], params[ 2 ], params[ 3 ], params[ 4 ], params[ 5 ], params[ 6 ], params[ 7 ] );
        case 9:
            return self builtin [[ func ]]( params[ 0 ], params[ 1 ], params[ 2 ], params[ 3 ], params[ 4 ], params[ 5 ], params[ 6 ], params[ 7 ], params[ 8 ] );
        default:
            assertmsg( "<dev string:x368>" );
            break;
    }
}

// Namespace dialogue
// Params 2
// Checksum 0xce1f9526, Offset: 0x25bd
// Size: 0x1c0
function function_918092fd0343f8ae( func, params )
{
    assert( isbuiltinfunction( func ), "<dev string:x3ef>" );
    
    if ( !isdefined( params ) )
    {
        return builtin [[ func ]]();
    }
    
    if ( !isarray( params ) )
    {
        return builtin [[ func ]]( params );
    }
    
    switch ( params.size )
    {
        case 0:
            return builtin [[ func ]]();
        case 1:
            return builtin [[ func ]]( params[ 0 ] );
        case 2:
            return builtin [[ func ]]( params[ 0 ], params[ 1 ] );
        case 3:
            return builtin [[ func ]]( params[ 0 ], params[ 1 ], params[ 2 ] );
        case 4:
            return builtin [[ func ]]( params[ 0 ], params[ 1 ], params[ 2 ], params[ 3 ] );
        case 5:
            return builtin [[ func ]]( params[ 0 ], params[ 1 ], params[ 2 ], params[ 3 ], params[ 4 ] );
        case 6:
            return builtin [[ func ]]( params[ 0 ], params[ 1 ], params[ 2 ], params[ 3 ], params[ 4 ], params[ 5 ] );
        case 7:
            return builtin [[ func ]]( params[ 0 ], params[ 1 ], params[ 2 ], params[ 3 ], params[ 4 ], params[ 5 ], params[ 6 ] );
        case 8:
            return builtin [[ func ]]( params[ 0 ], params[ 1 ], params[ 2 ], params[ 3 ], params[ 4 ], params[ 5 ], params[ 6 ], params[ 7 ] );
        case 9:
            return builtin [[ func ]]( params[ 0 ], params[ 1 ], params[ 2 ], params[ 3 ], params[ 4 ], params[ 5 ], params[ 6 ], params[ 7 ], params[ 8 ] );
        default:
            assertmsg( "<dev string:x368>" );
            break;
    }
}

// Namespace dialogue
// Params 3
// Checksum 0x2cac54ac, Offset: 0x2785
// Size: 0x54
function function_69cef4d93358c993( timeout, func, params )
{
    ent = spawnstruct();
    ent utility::delaythread( timeout, &utility::send_notify, "kill" );
    ent endon( "kill" );
    return call_with_params( func, params );
}

// Namespace dialogue
// Params 7
// Checksum 0x11a9f3dc, Offset: 0x27e2
// Size: 0x221
function create_vo_data( sequence, priority, timeout, overlap, delay, scope, endons )
{
    assert( isdefined( sequence ), "<dev string:x437>" );
    speaker = self;
    
    if ( self == level )
    {
        speaker = function_2a9ca9e3797e5dc1();
    }
    
    if ( utility::is_dead_or_dying( speaker ) || speaker.vo_disabled || level.vo_disabled )
    {
        return;
    }
    
    default_scope = isdefined( speaker.team ) ? "team" : "global";
    
    if ( !isdefined( scope ) )
    {
        scope = default_scope;
    }
    
    assert( scope == "<dev string:x6e>" || scope == "<dev string:x76>" || scope == "<dev string:x7e>", "<dev string:x88>" );
    assert( scope != "<dev string:x76>" || isdefined( speaker.team ), "<dev string:xc2>" );
    vo_data = spawnstruct();
    vo_data.owner = self;
    vo_data.speaker = speaker;
    vo_data.scope_ents = speaker function_bf5715bcec0f160a();
    vo_data.isvodata = 1;
    
    if ( !isarray( sequence ) )
    {
        sequence = [ sequence ];
    }
    
    vo_data.index = 0;
    vo_data.sequence = sequence;
    vo_data.priority = priority ?? 0;
    vo_data.overlap = overlap ?? 1;
    vo_data.endons = endons ?? [];
    vo_data.timeout = timeout;
    vo_data.delay = delay;
    vo_data.scope = scope;
    
    if ( !isarray( vo_data.endons ) )
    {
        vo_data.endons = [ vo_data.endons ];
    }
    
    return vo_data;
}

// Namespace dialogue
// Params 1
// Checksum 0xc536ab9d, Offset: 0x2a0c
// Size: 0x41
function function_3da7a23e38f374f4( vo_data )
{
    if ( !isdefined( vo_data ) )
    {
        return 0;
    }
    
    vo_data thread queue_sequence();
    
    if ( !vo_data.finished_or_cancelled )
    {
        vo_data waittill( "finished_or_cancelled" );
    }
    
    return vo_data.finished;
}

// Namespace dialogue
// Params 6
// Checksum 0xfe0eedc, Offset: 0x2a56
// Size: 0x282
function queue_say( speaker, alias, priority, timeout, overlap, delay )
{
    self.finished = 0;
    speaker.var_e4fec99876f6a732 = self.scope;
    speaker notify( "started_queue_wait", self );
    cancelled = self.scope_ents[ self.scope ] function_4cbd60ce1a602523( self, timeout );
    speaker notify( "finished_queue_wait", self, cancelled );
    
    if ( !cancelled && !utility::is_dead_or_dying( speaker ) && !speaker.vo_disabled && !level.vo_disabled )
    {
        speaker.var_569f79b89b587aba = priority;
        
        foreach ( ent in self.scope_ents )
        {
            ent function_4d50dc614a5b945a( self );
        }
        
        self notify( "proceeded" );
        cancelled = speaker delay_dialogue( delay, alias );
        speaker.vo_delaystart = undefined;
        speaker.vo_delayvalue = undefined;
        speaker notify( "stop_bcs_sequence" );
        
        if ( isdefined( cancelled ) && !cancelled )
        {
            check_interrupt( overlap, self.scope_ents[ self.scope ] );
            self.said_vo = speaker say_dialogue( alias, self.receivers );
        }
        
        if ( utility::is_dead_or_dying( speaker ) )
        {
            speaker stop_dialogue( 0, 0 );
        }
        
        foreach ( ent in self.scope_ents )
        {
            ent remove_vo_data( self );
        }
    }
    else
    {
        self notify( "proceeded" );
    }
    
    function_d621ed37c021620a( self.scope_ents );
    self.vo_done_or_cancelled = 1;
    speaker notify( "vo_done_or_cancelled", self );
    self notify( "vo_done_or_cancelled" );
}

// Namespace dialogue
// Params 2
// Checksum 0xc7a503bf, Offset: 0x2ce0
// Size: 0x120
function check_interrupt( overlap, scope_ent )
{
    if ( !overlap )
    {
        speaker = self.vo_parent ?? self;
        
        foreach ( vo_data in scope_ent.vo_active )
        {
            if ( vo_data == self )
            {
                continue;
            }
            
            other_speaker = vo_data.speaker;
            force_interrupt = utility::issp() || isstruct( speaker ) || isstruct( other_speaker );
            
            if ( force_interrupt || distance2dsquared( speaker.origin, other_speaker.origin ) <= level.var_822444fd128d6523 )
            {
                other_speaker stop_dialogue( 0, 1 );
            }
        }
    }
}

// Namespace dialogue
// Params 0
// Checksum 0x59cd4053, Offset: 0x2e08
// Size: 0x196
function queue_sequence()
{
    self.finished = 0;
    self.finished_or_cancelled = 0;
    self.speaker.var_e4fec99876f6a732 = self.scope;
    self.speaker notify( "started_queue_wait", self );
    cancelled = self.scope_ents[ self.scope ] function_4cbd60ce1a602523( self, self.timeout, self.endons );
    self.speaker notify( "finished_queue_wait", self, cancelled );
    
    if ( !cancelled && !utility::is_dead_or_dying( self.speaker ) && !self.speaker.vo_disabled && !level.vo_disabled )
    {
        execute_sequence();
    }
    else
    {
        self notify( "proceeded" );
    }
    
    if ( !isdefined( self.finished ) )
    {
        if ( isdefined( self.var_3b53a3523603664 ) )
        {
            self thread [[ self.var_3b53a3523603664 ]]();
        }
    }
    else if ( !self.finished )
    {
        if ( isdefined( self.oncancelfunc ) )
        {
            self thread [[ self.oncancelfunc ]]();
        }
    }
    else if ( isdefined( self.onfinishedfunc ) )
    {
        self thread [[ self.onfinishedfunc ]]();
    }
    
    function_d621ed37c021620a( self.scope_ents );
    self.speaker notify( "vo_finished_or_cancelled", self );
    level notify( "vo_finished_or_cancelled", self );
    self.finished_or_cancelled = 1;
    self notify( "finished_or_cancelled" );
    return self.finished;
}

// Namespace dialogue
// Params 0
// Checksum 0x871a4bec, Offset: 0x2fa7
// Size: 0x229
function execute_sequence()
{
    level notify( "vo_sequence_started", self );
    self.speaker.var_569f79b89b587aba = self.priority;
    
    foreach ( ent in self.scope_ents )
    {
        ent function_4d50dc614a5b945a( self );
    }
    
    self notify( "proceeded" );
    cancelled = self.speaker delay_dialogue( self.delay, self.alias );
    self.speaker.vo_delaystart = undefined;
    self.speaker.vo_delayvalue = undefined;
    
    if ( isdefined( cancelled ) && !cancelled )
    {
        /#
            if ( getdvarint( @"hash_62a9dffcf730f69" ) )
            {
                thread function_d45775e0776dd5df();
            }
        #/
        
        check_interrupt( self.overlap, self.scope_ents[ self.scope ] );
        
        while ( isdefined( self.finished ) && !self.finished )
        {
            self.finished = function_76e84ffb6bfb071d();
        }
        
        if ( utility::is_dead_or_dying( self.speaker ) )
        {
            self.speaker stop_dialogue( 0, 0 );
            
            if ( isdefined( self.var_cbe8926fa6df89ef ) )
            {
                self thread [[ self.var_cbe8926fa6df89ef ]]();
            }
        }
    }
    
    foreach ( ent in self.scope_ents )
    {
        ent remove_vo_data( self );
    }
    
    level notify( "vo_sequence_ended", self );
}

// Namespace dialogue
// Params 0
// Checksum 0x26597c4e, Offset: 0x31d8
// Size: 0x3e6
function function_76e84ffb6bfb071d()
{
    if ( self.index >= self.sequence.size )
    {
        return 1;
    }
    
    if ( utility::is_dead_or_dying( self.speaker ) )
    {
        if ( isdefined( self.var_76b9cc4019a35161 ) )
        {
            self [[ self.var_76b9cc4019a35161 ]]();
        }
        
        if ( utility::is_dead_or_dying( self.speaker ) )
        {
            return function_2d30515a2dd46b52( "DEAD SPEAKER" );
        }
    }
    
    if ( self.speaker.vo_disabled || level.vo_disabled )
    {
        return function_2d30515a2dd46b52( "VO DISABLED" );
    }
    
    self.scope_ents[ self.scope ] endon( "stop_vo_sequence" );
    self.speaker endon( "stop_vo_sequence" );
    self.speaker endon( "death" );
    self notify( "new_segment" );
    endon_ent = self.speaker;
    
    foreach ( endon_data in self.endons )
    {
        if ( isent( endon_data ) || isstruct( endon_data ) )
        {
            endon_ent = endon_data;
            continue;
        }
        
        if ( isstring( endon_data ) )
        {
            endon_ent endon( endon_data );
        }
    }
    
    self.alias = undefined;
    segment = self.sequence[ self.index ];
    self.index++;
    
    if ( isstring( segment ) || isxhash( segment ) )
    {
        self.alias = segment;
        
        if ( !soundexists( self.alias ) && !function_cf6c7d510f5a4b08( self.alias ) )
        {
            /#
                iprintlnbold( "<dev string:x50>" + self.alias + "<dev string:x5d>" );
            #/
            
            return function_2d30515a2dd46b52( "MISSING ALIAS" );
        }
        
        finished = self.speaker say_dialogue( self.alias, self.receivers );
        
        if ( !finished )
        {
            return function_2d30515a2dd46b52( "SAY INTERRUPTED" );
        }
        
        return 0;
    }
    else if ( isnumber( segment ) )
    {
        if ( segment <= 0 )
        {
            return 0;
        }
        
        wait segment;
        return 0;
    }
    else if ( isent( segment ) || isstruct( segment ) )
    {
        result = switch_speaker( segment );
        return 0;
    }
    else if ( isfunction( segment ) )
    {
        result = self [[ segment ]]();
        
        if ( isdefined( result ) )
        {
            if ( isint( result ) && result == 0 )
            {
                return function_2d30515a2dd46b52( "FUNC RETURNED FALSE" );
            }
            
            self.index--;
            self.sequence[ self.index ] = result;
        }
        
        return 0;
    }
    else if ( isarray( segment ) )
    {
        self.index--;
        sequence = [];
        
        for ( i = 0; i < self.sequence.size ; i++ )
        {
            if ( i == self.index )
            {
                foreach ( item in segment )
                {
                    sequence[ sequence.size ] = item;
                }
                
                continue;
            }
            
            sequence[ sequence.size ] = self.sequence[ i ];
        }
        
        self.sequence = sequence;
        return 0;
    }
    
    return function_2d30515a2dd46b52( "UNDEFINED SEGMENT" );
}

// Namespace dialogue
// Params 1
// Checksum 0x2aa45ed0, Offset: 0x35c7
// Size: 0x46
function function_2d30515a2dd46b52( reason )
{
    /#
        if ( !getdvarint( @"hash_62a9dffcf730f69" ) )
        {
            return;
        }
        
        iprintlnbold( "<dev string:x454>" + reason + "<dev string:x45a>" + ( self.name ?? "<dev string:x462>" ) );
    #/
}

/#

    // Namespace dialogue
    // Params 0
    // Checksum 0xe86aa2ca, Offset: 0x3615
    // Size: 0x2ba, Type: dev
    function function_d45775e0776dd5df()
    {
        self endon( "<dev string:x473>" );
        
        for ( ;; )
        {
            sequence = self.sequence;
            ln_height = 0;
            
            for ( i = 0; i < sequence.size ; i++ )
            {
                display_ln = undefined;
                segment = sequence[ i ];
                
                if ( isstring( segment ) || isxhash( segment ) )
                {
                    display_ln = "<dev string:x48f>" + getxhashsourcename( segment );
                }
                else if ( isnumber( segment ) )
                {
                    display_ln = "<dev string:x498>" + segment + "<dev string:x4a2>";
                }
                else if ( isent( segment ) )
                {
                    ent_num = "<dev string:x4aa>" + segment getentitynumber();
                    display_ln = "<dev string:x4af>";
                    
                    if ( isdefined( segment.animname ) )
                    {
                        display_ln += segment.animname + "<dev string:x4c6>" + ent_num + "<dev string:x4cc>";
                    }
                    else
                    {
                        display_ln += ent_num;
                    }
                }
                
                if ( isdefined( display_ln ) )
                {
                    is_index = i == self.index - 1;
                    setdvarifuninitialized( @"hash_91d2bfdbf8875369", 1350 );
                    setdvarifuninitialized( @"hash_91d2bedbf8875136", 500 );
                    base_x = getdvarint( @"hash_91d2bfdbf8875369" );
                    base_y = getdvarint( @"hash_91d2bedbf8875136" );
                    
                    if ( isdefined( self.name ) )
                    {
                        event_info = "<dev string:x4d1>" + self.speaker getentitynumber() + "<dev string:x4da>" + self.name + "<dev string:x4e0>";
                        printtoscreen2d( base_x, base_y + 22, event_info, ( 0, 0, 0 ), 1.75 );
                        printtoscreen2d( base_x - 2, base_y + 20, event_info, ( 1, 1, 0 ), 1.75 );
                    }
                    
                    color = is_index ? ( 0, 0.85, 0 ) : ( 1, 1, 1 );
                    space = is_index ? 35 : 25;
                    scale = is_index ? 2 : 1.5;
                    printtoscreen2d( base_x + 2, base_y + 52 + ln_height + is_index * 10, display_ln, ( 0, 0, 0 ), scale );
                    printtoscreen2d( base_x + 2, base_y + 52 + ln_height + is_index * 10, display_ln, ( 0, 0, 0 ), scale );
                    printtoscreen2d( base_x, base_y + 50 + ln_height + is_index * 10, display_ln, color, scale );
                    ln_height += space;
                }
            }
            
            waitframe();
        }
    }

#/

// Namespace dialogue
// Params 1
// Checksum 0x5f4e1033, Offset: 0x38d7
// Size: 0x159
function switch_speaker( new_speaker )
{
    foreach ( ent in self.scope_ents )
    {
        ent remove_vo_data( self );
    }
    
    if ( new_speaker == level )
    {
        new_speaker = new_speaker function_2a9ca9e3797e5dc1();
    }
    
    self.listener = self.speaker;
    self.speaker = new_speaker;
    self.speaker.var_569f79b89b587aba = self.priority;
    self.scope_ents = self.speaker function_bf5715bcec0f160a();
    
    foreach ( ent in self.scope_ents )
    {
        ent function_4d50dc614a5b945a( self );
    }
}

// Namespace dialogue
// Params 2
// Checksum 0xc21a31ac, Offset: 0x3a38
// Size: 0xa7, Type: bool
function delay_dialogue( delay, var_cdcf9973d877788 )
{
    if ( !isdefined( delay ) )
    {
        return false;
    }
    
    self endon( "death" );
    self endon( "cancel_delayed_vo" );
    self.var_6ad6546473593e72 = undefined;
    self.var_cf0d3e00923233a5 = undefined;
    self.vo_delaystart = gettime();
    self.vo_delayvalue = delay;
    
    if ( isdefined( var_cdcf9973d877788 ) && function_cf6c7d510f5a4b08( var_cdcf9973d877788 ) )
    {
        self.var_cf0d3e00923233a5 = var_cdcf9973d877788;
    }
    else
    {
        self.var_6ad6546473593e72 = var_cdcf9973d877788;
    }
    
    result = waitfor( delay );
    return isint( result ) && result == 0;
}

// Namespace dialogue
// Params 2
// Checksum 0x1f359de9, Offset: 0x3ae8
// Size: 0x95
function say_dialogue( alias, receivers )
{
    if ( utility::is_dead_or_dying( self ) )
    {
        return 0;
    }
    
    self notify( "started_saying", alias );
    
    if ( isdefined( self.vo_startfunc ) )
    {
        self thread [[ self.vo_startfunc ]]( alias );
    }
    
    if ( function_cf6c7d510f5a4b08( alias ) )
    {
        finished = function_c5c10e87844edd3f( alias );
    }
    else if ( soundexists( alias ) )
    {
        finished = function_e795c407496e49a3( alias, receivers );
    }
    else
    {
        finished = 0;
    }
    
    if ( isdefined( self ) )
    {
        self notify( "done_saying", alias, finished );
    }
    
    return finished;
}

// Namespace dialogue
// Params 2
// Checksum 0x57506779, Offset: 0x3b86
// Size: 0x67
function function_e795c407496e49a3( alias, receivers )
{
    self endon( "death" );
    self.var_861991271473c76 = gettime();
    self.var_6ad6546473593e72 = alias;
    self.var_cf0d3e00923233a5 = undefined;
    
    if ( isdefined( receivers ) && utility::issp() )
    {
        thread playsound_receivers( alias, receivers );
    }
    
    return self [[ level.vo_playsoundfunc ]]( alias );
}

// Namespace dialogue
// Params 3
// Checksum 0x622dbe9d, Offset: 0x3bf6
// Size: 0xb5, Type: bool
function function_4cbd60ce1a602523( vo_data, timeout, endons )
{
    vo_data endon( "proceed" );
    
    if ( self.vo_active.size == 0 || !vo_data.ischatter && vo_data.priority >= 0 && function_8221fe2b3bcdd1a7() )
    {
        return false;
    }
    
    function_40860dbb51f197c( vo_data );
    cancelled = !vo_data.speaker function_9c89b8fc548e7594( timeout, endons );
    function_68a62986785ac328( vo_data );
    
    if ( cancelled || !vo_data has_priority( self.vo_active ) )
    {
        return true;
    }
    
    return false;
}

// Namespace dialogue
// Params 0, eflags: 0x4
// Checksum 0x3256cdf4, Offset: 0x3cb4
// Size: 0x85, Type: bool
function private function_8221fe2b3bcdd1a7()
{
    foreach ( vo_data in self.vo_active )
    {
        if ( !vo_data.ischatter )
        {
            return false;
        }
    }
    
    return true;
}

// Namespace dialogue
// Params 1
// Checksum 0xb4c5faaa, Offset: 0x3d42
// Size: 0xec
function function_d621ed37c021620a( scope_ents )
{
    foreach ( scope_ent in scope_ents )
    {
        if ( !isdefined( scope_ent.vo_queue ) || scope_ent.vo_queue.size == 0 )
        {
            continue;
        }
        
        next_struct = scope_ent.vo_queue[ 0 ];
        
        if ( scope_ent.vo_active.size == 0 || next_struct function_16627087f1fa3fd5( scope_ent ) )
        {
            scope_ent function_68a62986785ac328( next_struct );
            next_struct notify( "proceed" );
            next_struct waittill( "proceeded" );
            return;
        }
    }
}

// Namespace dialogue
// Params 2, eflags: 0x4
// Checksum 0x3be5be3a, Offset: 0x3e36
// Size: 0x108
function private function_9c89b8fc548e7594( timeout, endons )
{
    self endon( "death" );
    
    if ( isdefined( endons ) )
    {
        if ( !isarray( endons ) )
        {
            endons = [ endons ];
        }
        
        endon_ent = self;
        
        foreach ( endon_data in endons )
        {
            if ( isent( endon_data ) || isstruct( endon_data ) )
            {
                endon_ent = endon_data;
                continue;
            }
            
            if ( isstring( endon_data ) )
            {
                endon_ent endon( endon_data );
            }
        }
    }
    
    if ( isdefined( timeout ) )
    {
        self endon( "cancel_queued_vo" );
        result = waitfor( timeout );
        return ( !isint( result ) || result );
    }
    
    self waittill( "cancel_queued_vo" );
}

// Namespace dialogue
// Params 1, eflags: 0x4
// Checksum 0x160aa89f, Offset: 0x3f46
// Size: 0xd, Type: bool
function private function_16627087f1fa3fd5( scope_ent )
{
    return false;
}

// Namespace dialogue
// Params 2
// Checksum 0x1abb0a42, Offset: 0x3f5c
// Size: 0x224
function has_priority( var_145a67181a8e1d12, allow_equal )
{
    if ( isstruct( var_145a67181a8e1d12 ) )
    {
        var_145a67181a8e1d12 = var_145a67181a8e1d12.vo_active;
    }
    
    speakers = [];
    
    if ( utility::issp() || !isdefined( self.speaker.origin ) || self.speaker.var_2234510c97c706f9 || self.speaker.is2demitter )
    {
        foreach ( vo_data in var_145a67181a8e1d12 )
        {
            speakers[ speakers.size ] = vo_data.speaker;
        }
    }
    else
    {
        foreach ( vo_data in var_145a67181a8e1d12 )
        {
            speaker = vo_data.speaker;
            
            if ( isstruct( speaker ) || speaker.is2demitter || distance2dsquared( self.speaker.origin, speaker.origin ) <= level.var_822444fd128d6523 )
            {
                speakers[ speakers.size ] = speaker;
            }
        }
    }
    
    if ( self.priority >= 1 || speakers.size == 0 )
    {
        return 1;
    }
    
    highest_priority = speakers[ 0 ].var_569f79b89b587aba;
    
    if ( !isdefined( highest_priority ) )
    {
        return 1;
    }
    
    if ( allow_equal )
    {
        return ( self.priority >= highest_priority );
    }
    
    return self.priority > highest_priority;
}

// Namespace dialogue
// Params 1, eflags: 0x4
// Checksum 0x90fcba3b, Offset: 0x4188
// Size: 0xcf
function private function_40860dbb51f197c( struct )
{
    if ( !isdefined( struct.speaker.var_ec03032865e57470 ) )
    {
        struct.speaker.var_ec03032865e57470 = 0;
    }
    
    struct.speaker.var_ec03032865e57470++;
    
    for ( i = self.vo_queue.size; true ; i-- )
    {
        if ( i == 0 || self.vo_queue[ i - 1 ].priority >= struct.priority )
        {
            self.vo_queue[ i ] = struct;
            return;
        }
        
        self.vo_queue[ i ] = self.vo_queue[ i - 1 ];
    }
}

// Namespace dialogue
// Params 1, eflags: 0x4
// Checksum 0xb3636c, Offset: 0x425f
// Size: 0xe2
function private function_68a62986785ac328( struct )
{
    if ( !( isdefined( self ) && isdefined( self.vo_queue ) ) )
    {
        return;
    }
    
    found = 0;
    
    for ( i = 0; i < self.vo_queue.size ; i++ )
    {
        if ( found )
        {
            self.vo_queue[ i - 1 ] = self.vo_queue[ i ];
            continue;
        }
        
        if ( self.vo_queue[ i ] == struct )
        {
            found = 1;
        }
    }
    
    if ( found )
    {
        self.vo_queue[ self.vo_queue.size - 1 ] = undefined;
    }
    
    if ( isdefined( struct.speaker ) && isdefined( struct.speaker.var_ec03032865e57470 ) )
    {
        struct.speaker.var_ec03032865e57470--;
    }
}

// Namespace dialogue
// Params 1
// Checksum 0xe766a28a, Offset: 0x4349
// Size: 0xc7
function function_4d50dc614a5b945a( vo_data )
{
    for ( i = self.vo_active.size; true ; i-- )
    {
        if ( i == 0 || isalive( self.vo_active[ i - 1 ].speaker ) && isdefined( self.vo_active[ i - 1 ].priority ) && self.vo_active[ i - 1 ].priority >= vo_data.priority )
        {
            self.vo_active[ i ] = vo_data;
            return;
        }
        
        self.vo_active[ i ] = self.vo_active[ i - 1 ];
    }
}

// Namespace dialogue
// Params 1
// Checksum 0xaec2d3dc, Offset: 0x4418
// Size: 0xa4
function remove_vo_data( vo_data )
{
    if ( !( isdefined( self ) && isdefined( self.vo_active ) ) )
    {
        return;
    }
    
    found = 0;
    
    for ( i = 0; i < self.vo_active.size ; i++ )
    {
        if ( found )
        {
            self.vo_active[ i - 1 ] = self.vo_active[ i ];
            continue;
        }
        
        if ( self.vo_active[ i ] == vo_data )
        {
            found = 1;
        }
    }
    
    if ( found )
    {
        self.vo_active[ self.vo_active.size - 1 ] = undefined;
    }
}

// Namespace dialogue
// Params 0
// Checksum 0x5f1a0c45, Offset: 0x44c4
// Size: 0xb2
function function_bf5715bcec0f160a()
{
    if ( !isdefined( level.vo_teams ) )
    {
        level.vo_teams = [];
    }
    
    if ( isdefined( self.team ) && !isdefined( level.vo_teams[ self.team ] ) )
    {
        level.vo_teams[ self.team ] = spawnstruct();
    }
    
    scope_ents = [];
    scope_ents[ "self" ] = function_9281e8b99794ac72();
    
    if ( isdefined( self.team ) )
    {
        scope_ents[ "team" ] = level.vo_teams[ self.team ] function_9281e8b99794ac72();
    }
    
    scope_ents[ "global" ] = level function_9281e8b99794ac72();
    return scope_ents;
}

// Namespace dialogue
// Params 0, eflags: 0x4
// Checksum 0x8bfd1607, Offset: 0x457f
// Size: 0x33
function private function_9281e8b99794ac72()
{
    if ( !isdefined( self.vo_active ) )
    {
        self.vo_active = [];
    }
    
    if ( !isdefined( self.vo_queue ) )
    {
        self.vo_queue = [];
    }
    
    return self;
}

// Namespace dialogue
// Params 1
// Checksum 0x4713be5e, Offset: 0x45bb
// Size: 0x18
function dialogue_length( alias )
{
    return lookupsoundlength( alias, 1 ) / 1000;
}

// Namespace dialogue
// Params 1
// Checksum 0x25a624be, Offset: 0x45dc
// Size: 0x69
function function_511f573a5f91fa32( dialogue )
{
    animname = self.animname ?? "generic";
    
    if ( !( isdefined( level.scr_face ) && isdefined( level.scr_face[ animname ] ) ) )
    {
        return;
    }
    
    if ( isdefined( level.scr_face[ animname ][ dialogue ] ) )
    {
        return level.scr_face[ animname ][ dialogue ];
    }
}

// Namespace dialogue
// Params 2
// Checksum 0x4716c462, Offset: 0x464d
// Size: 0xbf
function playsound_receivers( alias, receivers )
{
    if ( !isarray( receivers ) )
    {
        receivers = [ receivers ];
    }
    
    wait 0.1;
    
    foreach ( receiver in receivers )
    {
        if ( utility::is_dead_or_dying( receiver ) || receiver == self )
        {
            continue;
        }
        
        receiver playcontextsound( alias, "dx_type", "dx_radio_3d" );
    }
}

// Namespace dialogue
// Params 4
// Checksum 0xc82a2a01, Offset: 0x4714
// Size: 0x53
function function_2a9ca9e3797e5dc1( tag, originoffset, anglesoffset, istemp )
{
    if ( !isdefined( self.vo_emitter ) )
    {
        self.vo_emitter = get_new_vo_emitter( tag, originoffset, anglesoffset, istemp );
    }
    
    return self.vo_emitter;
}

// Namespace dialogue
// Params 4
// Checksum 0x6b205416, Offset: 0x4770
// Size: 0x187
function get_new_vo_emitter( tag, originoffset, anglesoffset, istemp )
{
    if ( isent( self ) )
    {
        if ( self tagexists( "j_head" ) )
        {
            if ( !isdefined( tag ) )
            {
                tag = "j_head";
            }
        }
        
        originoffset = originoffset ?? ( 0, 0, 0 );
        
        if ( !isdefined( anglesoffset ) )
        {
            anglesoffset = ( 0, 0, 0 );
        }
        
        emitter = spawn( "script_origin", self.origin );
        
        if ( isdefined( tag ) )
        {
            emitter linkto( self, tag, originoffset, anglesoffset );
        }
        else
        {
            emitter linkto( self );
        }
    }
    else
    {
        emitter = spawn( "script_origin", ( 0, 0, 0 ) );
        emitter.is2demitter = 1;
        emitter.name = self.name;
    }
    
    emitter.targetname = "get_new_vo_emitter";
    emitter.isvoemitter = 1;
    emitter.team = self.team ?? "allies";
    emitter.istempemitter = istemp;
    
    /#
        if ( !isdefined( level.vo_emitters ) )
        {
            level.vo_emitters = [];
        }
        
        level.vo_emitters[ level.vo_emitters.size ] = emitter;
        level.vo_emitters = function_5713d46873b29625( level.vo_emitters );
    #/
    
    emitter thread function_49cf64b1d54c6269( self );
    return emitter;
}

// Namespace dialogue
// Params 1
// Checksum 0xeec8df16, Offset: 0x4900
// Size: 0x2a
function function_49cf64b1d54c6269( parent )
{
    self endon( "entitydeleted" );
    parent waittill( "death" );
    self stopsounds();
    waitframe();
    self delete();
}

// Namespace dialogue
// Params 4
// Checksum 0xd47b2eaf, Offset: 0x4932
// Size: 0x1b6
function get_radio_emitter( tag, originoffset, anglesoffset, istemp )
{
    if ( !isdefined( self.var_8d4f5e01dc1af2e8 ) )
    {
        origin = self.origin ?? originoffset;
        self.var_8d4f5e01dc1af2e8 = spawn( "script_origin", origin );
        self.var_8d4f5e01dc1af2e8.targetname = "get_radio_emitter";
        
        if ( isent( self ) )
        {
            if ( self tagexists( "j_hip_ri" ) )
            {
                if ( !isdefined( tag ) )
                {
                    tag = "j_hip_ri";
                }
            }
            
            originoffset = originoffset ?? ( 0, 0, 0 );
            
            if ( !isdefined( anglesoffset ) )
            {
                anglesoffset = ( 0, 0, 0 );
            }
            
            if ( isdefined( tag ) )
            {
                self.var_8d4f5e01dc1af2e8 linkto( self, tag, originoffset, anglesoffset );
            }
            else
            {
                self.var_8d4f5e01dc1af2e8 linkto( self );
            }
        }
        
        self.var_8d4f5e01dc1af2e8.isradioemitter = 1;
        self.var_8d4f5e01dc1af2e8.battlechatterallowed = 1;
        self.var_8d4f5e01dc1af2e8.team = self.team ?? "allies";
        self.var_8d4f5e01dc1af2e8.battlechatter = spawnstruct();
        
        if ( isdefined( self.battlechatter ) )
        {
            self.var_8d4f5e01dc1af2e8.battlechatter.countryid = self.battlechatter.countryid;
        }
        
        self.var_8d4f5e01dc1af2e8.istempemitter = istemp;
    }
    
    return self.var_8d4f5e01dc1af2e8;
}

// Namespace dialogue
// Params 1
// Checksum 0xf026b024, Offset: 0x4af1
// Size: 0xe
function get_radio_alias( alias )
{
    return alias;
}

// Namespace dialogue
// Params 1
// Checksum 0x92d2ac96, Offset: 0x4b08
// Size: 0x3a
function function_f94a633a775187e1( emitter )
{
    if ( !isdefined( emitter ) )
    {
        return;
    }
    
    emitter endon( "entitydeleted" );
    waittillframeend();
    
    if ( !isdefined( self.var_861991271473c76 ) && isdefined( emitter ) )
    {
        emitter stopsounds();
    }
}

// Namespace dialogue
// Params 1
// Checksum 0x436afe27, Offset: 0x4b4a
// Size: 0x59
function function_b0689a1ab8b93fb5( emitter )
{
    if ( !isdefined( emitter ) || emitter == self || !emitter.istempemitter )
    {
        return;
    }
    
    emitter.shoulddelete = 1;
    emitter endon( "entitydeleted" );
    waitframe();
    
    if ( emitter.shoulddelete )
    {
        emitter delete();
    }
}

// Namespace dialogue
// Params 1
// Checksum 0xf4502677, Offset: 0x4bab
// Size: 0x5c, Type: bool
function function_cf6c7d510f5a4b08( text )
{
    setdvarifuninitialized( @"hash_ce3d6e5d48671653", 1 );
    return getdvarint( @"hash_ce3d6e5d48671653" ) && ( isistring( text ) || !soundexists( text ) && !isxhash( text ) && getsubstr( text, 0, 3 ) != "dx_" );
}

// Namespace dialogue
// Params 2
// Checksum 0xe01ea4ac, Offset: 0x4c10
// Size: 0x10a
function function_ec55269db42372b( hide2d = 1, hide3d = 0 )
{
    level.var_a21c2157a1f961f8 = hide2d;
    level.var_a2204757a1fdab61 = hide3d;
    
    if ( !hide2d && !hide3d )
    {
        return;
    }
    
    if ( !isdefined( level.vo_active ) )
    {
        return;
    }
    
    foreach ( vo_data in level.vo_active )
    {
        speaker = vo_data.speaker;
        
        if ( speaker.var_569f79b89b587aba < 0 )
        {
            if ( hide2d )
            {
                speaker notify( "stop_2d_text" );
            }
            
            if ( hide3d )
            {
                speaker notify( "stop_3d_text" );
            }
        }
    }
}

// Namespace dialogue
// Params 2
// Checksum 0xa86aadcd, Offset: 0x4d22
// Size: 0xf1
function function_35ca743c0a9403bd( text, duration )
{
    self endon( "death" );
    self endon( "stop_dialogue" );
    self notify( "stop_3d_text" );
    self endon( "stop_3d_text" );
    alpha = 1;
    
    while ( !isdefined( duration ) || duration + 0.3 > 0 )
    {
        if ( self tagexists( "j_head" ) )
        {
            origin = self gettagorigin( "j_head" ) + ( 0, 0, 15 );
        }
        else
        {
            origin = self.origin + ( 0, 0, 70 );
        }
        
        if ( duration < 0 )
        {
            alpha = 1 - duration * -1 / 0.3;
        }
        
        /#
            print3d( origin, text, ( 1, 1, 1 ), alpha, 0.3, 1, 1 );
        #/
        
        if ( isdefined( duration ) )
        {
            duration -= 0.05;
        }
        
        waitframe();
    }
}

// Namespace dialogue
// Params 1
// Checksum 0x4543eec4, Offset: 0x4e1b
// Size: 0x35
function get_holdtime( text )
{
    word_count = strtok( text, " " ).size;
    return max( 1.5, word_count * 0.4 );
}

// Namespace dialogue
// Params 1
// Checksum 0x330fc37f, Offset: 0x4e59
// Size: 0x4e9
function function_c5c10e87844edd3f( text )
{
    self notify( "stop_dialogue" );
    self endon( "death" );
    self endon( "stop_dialogue" );
    assert( isent( self ), "<dev string:x4e7>" );
    emitter = self;
    player = undefined;
    
    if ( isplayer( self ) )
    {
        player = self;
    }
    
    if ( isdefined( player ) || isdefined( self.vo_emitter ) )
    {
        emitter = function_2a9ca9e3797e5dc1();
    }
    
    self.var_861991271473c76 = gettime();
    self.var_cf0d3e00923233a5 = text;
    self.var_6ad6546473593e72 = undefined;
    holdtime = get_holdtime( text );
    color = get_team_color();
    name = get_name();
    
    if ( !isistring( text ) && isstartstr( text, ">>" ) )
    {
        text = "(RADIO) " + getsubstr( text, 2, text.size );
    }
    else if ( !level.var_a2204757a1fdab61 || self.var_569f79b89b587aba >= 0 )
    {
        if ( !level.var_a2204757a1fdab61 )
        {
            thread function_35ca743c0a9403bd( text, holdtime );
        }
    }
    
    var_2f12db54da85fb09 = level.var_a21c2157a1f961f8 && self.var_569f79b89b587aba < 0;
    
    if ( var_2f12db54da85fb09 || !utility::issp() )
    {
        wait holdtime;
        return 1;
    }
    
    var_1f2d1184e020963f = int( 6.96 );
    lineheight = int( 17.4 );
    var_3a80a7bd515e3e74 = int( 5.075 );
    is_istring = 0;
    
    if ( isdefined( level.var_e8f02720f642ede2 ) && isdefined( level.var_e8f02720f642ede2[ text ] ) )
    {
        lines = [ level.var_e8f02720f642ede2[ text ] ];
        is_istring = 1;
    }
    else
    {
        text = color + name + ": ^7" + text;
        lines = utility::wrap_text( text, int( 500 / var_1f2d1184e020963f ) );
    }
    
    width = int( clamp( text.size * var_1f2d1184e020963f, 0, 500 ) );
    height = lineheight * lines.size + var_3a80a7bd515e3e74;
    endy = ( level.var_7429d4b8287da6a4 ?? 300 ) - height;
    
    if ( !isdefined( level.vo_hud ) )
    {
        level.vo_hud = [];
    }
    
    foreach ( hud_elem in level.vo_hud )
    {
        hud_elem moveovertime( 0.2 );
        hud_elem.y -= height - 2;
    }
    
    hud_elems = [];
    
    foreach ( i, text_line in lines )
    {
        text_elem = newhudelem();
        text_elem.speaker = self;
        text_elem.alpha = 0;
        
        if ( is_istring )
        {
            text_elem.label = text_line;
            
            if ( isistring( self.var_26b46b1b3125944a ) )
            {
                text_elem settext( self.var_26b46b1b3125944a );
            }
            else
            {
                text_elem settext( &"dialogue_temp/name_test" );
            }
        }
        else
        {
            text_elem settext( text_line );
        }
        
        text_elem.fontscale = 0.6525;
        text_elem.font = "bigfixed";
        text_elem.row = i;
        text_elem function_c114e0db24566d5b( height, endy, lineheight, var_3a80a7bd515e3e74 );
        hud_elems[ hud_elems.size ] = text_elem;
    }
    
    bg = newhudelem();
    bg.alpha = 0;
    bg setshader( "black", width, height );
    bg function_c114e0db24566d5b( height, endy );
    hud_elems[ hud_elems.size ] = bg;
    level.vo_hud = arraycombine( level.vo_hud, hud_elems );
    end_time = gettime() + ( 0.2 + holdtime ) * 1000;
    thread function_c505efe643efbba1( hud_elems, holdtime );
    self waittill( "text_display_done", finished );
    
    if ( finished == 0 )
    {
        remaining_time = ( end_time - gettime() ) / 1000;
        
        if ( remaining_time > 0 )
        {
            wait remaining_time;
        }
        
        finished = 1;
    }
    
    return finished;
}

// Namespace dialogue
// Params 1
// Checksum 0x527975ac, Offset: 0x534b
// Size: 0x88
function get_team_color( team = self.team )
{
    if ( !isdefined( team ) )
    {
        team = "neutral";
    }
    
    if ( isstartstr( team, "team_" ) )
    {
        return "^1";
    }
    
    switch ( team )
    {
        case #"hash_7c2d091e6337bf54":
            return "^1";
        case #"hash_5f54b9bf7583687f":
        case #"hash_a571cacc018623b8":
            return "^2";
        default:
            return "^3";
    }
}

// Namespace dialogue
// Params 0
// Checksum 0x2be97a, Offset: 0x53db
// Size: 0xe2
function get_name()
{
    var_7237854e3be197ca = self.name;
    
    if ( isdefined( var_7237854e3be197ca ) )
    {
        return var_7237854e3be197ca;
    }
    
    var_7237854e3be197ca = self.ainame;
    
    if ( isdefined( var_7237854e3be197ca ) )
    {
        return var_7237854e3be197ca;
    }
    
    if ( isplayer( self ) )
    {
        return "Player";
    }
    
    team = self.team ?? "neutral";
    
    if ( isdefined( level.var_56bc7b213799b9a1 ) && isdefined( level.var_56bc7b213799b9a1[ team ] ) )
    {
        return level.var_56bc7b213799b9a1[ team ];
    }
    
    if ( isstartstr( team, "team_" ) )
    {
        return "Enemy";
    }
    
    switch ( self.team )
    {
        case #"hash_7c2d091e6337bf54":
            return "Enemy";
        case #"hash_5f54b9bf7583687f":
            return "Friendly";
        default:
            return "Civilian";
    }
}

// Namespace dialogue
// Params 4
// Checksum 0x6aae5c6f, Offset: 0x54c5
// Size: 0xfa
function function_c114e0db24566d5b( height, endy, lineheight, var_3a80a7bd515e3e74 )
{
    self.alignx = "center";
    self.aligny = "top";
    self.x = 320;
    self.y = 300 + height;
    self.sort = 5;
    
    if ( isdefined( self.row ) )
    {
        self.y += self.row * lineheight + var_3a80a7bd515e3e74;
    }
    
    self fadeovertime( 0.2 );
    
    if ( isdefined( self.row ) )
    {
        self.y = endy + self.row * lineheight + var_3a80a7bd515e3e74;
        self.alpha = 1;
        return;
    }
    
    self.y = endy;
    self.alpha = level.var_9e11ef2bd96ba3cf ?? 0;
}

// Namespace dialogue
// Params 2
// Checksum 0x614dea9e, Offset: 0x55c7
// Size: 0x155
function function_c505efe643efbba1( hud_elems, holdtime )
{
    finished = function_b7382110602960a9( 0.2 + holdtime );
    self notify( "text_display_done", finished );
    
    foreach ( hud_elem in hud_elems )
    {
        hud_elem fadeovertime( 0.3 );
        hud_elem.alpha = 0;
    }
    
    wait 0.3;
    level.vo_hud = arrayremove( level.vo_hud, hud_elems );
    
    if ( !level.vo_hud.size )
    {
        level.vo_hud = undefined;
    }
    
    foreach ( hud_elem in hud_elems )
    {
        hud_elem destroy();
    }
}

// Namespace dialogue
// Params 1
// Checksum 0x69ea29ee, Offset: 0x5724
// Size: 0x2f, Type: bool
function function_b7382110602960a9( holdtime )
{
    self endon( "death" );
    self endon( "stop_dialogue" );
    return utility::waittill_notify_or_timeout_return( "stop_2d_text", holdtime ) == "timeout";
}

// Namespace dialogue
// Params 4
// Checksum 0x40a890af, Offset: 0x575c
// Size: 0x13d
function nag_loop( nags, repeat_delay, initial_delay, loop_limit )
{
    self notify( "stop_nag_loop" );
    self endon( "death" );
    self endon( "stop_nag_loop" );
    
    if ( !isdefined( initial_delay ) )
    {
        initial_delay = repeat_delay;
    }
    
    if ( !isdefined( level.vo_nagvars ) )
    {
        level function_a1c8c71775715127();
    }
    
    assert( isdefined( nags ), "<dev string:x518>" );
    assert( isdefined( nags.items ) && isstruct( nags ) && isdefined( nags.index ) || isarray( nags ) || isfunction( nags ), "<dev string:x531>" );
    
    if ( isarray( nags ) && ( nags.size == 0 || !isfunction( nags[ 0 ] ) ) )
    {
        assert( nags.size, "<dev string:x55d>" );
        nags = utility::create_deck( nags, 1, 0 );
    }
    
    do_nag( nags, initial_delay );
    
    for ( nag_count = 1; !isdefined( loop_limit ) || nag_count / nags.items.size < loop_limit ; nag_count++ )
    {
        do_nag( nags, repeat_delay );
        waitframe();
    }
    
    self notify( "finished_nag_loop" );
}

// Namespace dialogue
// Params 2
// Checksum 0xbcb207bb, Offset: 0x58a1
// Size: 0x276
function do_nag( nags, delay )
{
    speaker = self;
    did_nag = 0;
    current = undefined;
    
    if ( isarray( nags ) && nags.size > 0 && isfunction( nags[ 0 ] ) )
    {
        params = arraycopy( nags );
        params[ 0 ] = undefined;
        
        if ( isint( 0 ) )
        {
            function_cdc669dbc8ea2101( params );
        }
        
        nags = speaker call_with_params( nags[ 0 ], params );
        assert( isdefined( nags.items ) && isstruct( nags ) && isdefined( nags.index ) || isarray( nags ) || isstring( nags ), "<dev string:x58f>" );
    }
    else if ( isfunction( nags ) )
    {
        nags = speaker call_with_params( nags );
        assert( isdefined( nags.items ) && isstruct( nags ) && isdefined( nags.index ) || isarray( nags ) || isstring( nags ), "<dev string:x58f>" );
    }
    
    if ( isstruct( nags ) )
    {
        nag = nags utility::deck_draw();
    }
    else
    {
        nag = nags;
    }
    
    if ( isarray( nag ) )
    {
        speaker = nag[ 0 ];
        nag = nag[ 1 ];
    }
    
    if ( !isdefined( speaker ) )
    {
        return;
    }
    
    if ( isstruct( delay ) )
    {
        current = delay.current;
    }
    
    result = speaker waitfor( delay );
    
    if ( !isdefined( result ) || result )
    {
        nagvars = self.vo_nagvars ?? level.vo_nagvars;
        did_nag = speaker say( nag, nagvars.priority, nagvars.timeout, nagvars.overlap, &started_nag, nagvars.scope );
    }
    
    if ( !isdefined( did_nag ) )
    {
        result = "interrupted";
    }
    else if ( did_nag )
    {
        result = "finished";
    }
    else
    {
        result = "failed";
        
        if ( isstruct( nags ) && isdefined( nags.index ) )
        {
            nags.index--;
        }
        
        if ( isstruct( delay ) )
        {
            delay.current = current;
        }
    }
    
    speaker notify( "nag_" + result, nag );
    speaker notify( "nag_done_or_cancelled", nag, result );
}

// Namespace dialogue
// Params 0
// Checksum 0x370d57ee, Offset: 0x5b1f
// Size: 0x64
function started_nag()
{
    if ( isdefined( self.var_6ad6546473593e72 ) )
    {
        self notify( "started_nag", getxhashhexname( self.var_6ad6546473593e72 ) );
    }
    else
    {
        self notify( "started_nag", undefined );
    }
    
    if ( isdefined( self.var_51d9a95a033c556e ) )
    {
        self thread [[ self.var_51d9a95a033c556e ]]();
    }
    
    if ( isdefined( level.var_51d9a95a033c556e ) )
    {
        level thread [[ level.var_51d9a95a033c556e ]]();
    }
}

