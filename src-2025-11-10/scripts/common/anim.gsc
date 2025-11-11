#using scripts\common\debug;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\common\vehicle;
#using scripts\common\visibility_mode;
#using scripts\engine\utility;

#namespace animation;

// Namespace animation
// Params 3
// Checksum 0x2bff3e21, Offset: 0x767
// Size: 0x84
function anim_first_frame( guys, anime, tag )
{
    assert( isarray( guys ), "<dev string:x24>" );
    array = get_anim_position( tag );
    org = array[ "origin" ];
    angles = array[ "angles" ];
    guys = function_c5c322095ca966be( guys, anime );
    utility::array_levelthread( guys, &anim_first_frame_on_guy, anime, org, angles );
}

// Namespace animation
// Params 3
// Checksum 0x10f0fb1b, Offset: 0x7f3
// Size: 0x66
function anim_generic_first_frame( guy, anime, tag )
{
    array = get_anim_position( tag );
    org = array[ "origin" ];
    angles = array[ "angles" ];
    thread anim_first_frame_on_guy( guy, anime, org, angles, "generic" );
}

// Namespace animation
// Params 3
// Checksum 0xed1c66de, Offset: 0x861
// Size: 0x42
function anim_generic( guy, anime, tag )
{
    guys = [];
    guys[ 0 ] = guy;
    anim_single( guys, anime, tag, 0, "generic" );
}

// Namespace animation
// Params 3
// Checksum 0x1bcfa6c6, Offset: 0x8ab
// Size: 0x46
function anim_generic_run( guy, anime, tag )
{
    guys = [];
    guys[ 0 ] = guy;
    anim_single( guys, anime, tag, 0.25, "generic" );
}

// Namespace animation
// Params 3
// Checksum 0x5544a115, Offset: 0x8f9
// Size: 0x46
function anim_single_solo_run( guy, anime, tag )
{
    self endon( "death" );
    newguy[ 0 ] = guy;
    anim_single( newguy, anime, tag, 0.25 );
}

// Namespace animation
// Params 3
// Checksum 0x987f8207, Offset: 0x947
// Size: 0x3c
function anim_first_frame_solo( guy, anime, tag )
{
    guys = [];
    guys[ 0 ] = guy;
    anim_first_frame( guys, anime, tag );
}

// Namespace animation
// Params 5
// Checksum 0xf4b1aa37, Offset: 0x98b
// Size: 0x20f
function anim_first_frame_on_guy( guy, anime, org, angles, animname_override )
{
    guy.first_frame_time = gettime();
    animname = undefined;
    
    if ( isdefined( animname_override ) )
    {
        animname = animname_override;
    }
    else
    {
        animname = guy.animname;
    }
    
    isloop = 0;
    
    if ( function_b8e0e318104693fb( anime ) )
    {
        animation = guy function_c662ac26794ce12f( anime, org, angles, animname );
    }
    else if ( isarray( level.scr_anim[ animname ][ anime ] ) )
    {
        animation = level.scr_anim[ animname ][ anime ][ 0 ];
        isloop = 1;
    }
    else
    {
        animation = level.scr_anim[ animname ][ anime ];
    }
    
    /#
        guy assert_existance_of_anim( anime, animname, animation );
    #/
    
    guy set_start_pos( anime, org, angles, animname, isloop, animation );
    
    if ( isai( guy ) )
    {
        assert( isdefined( anim.callbacks[ "<dev string:x41>" ] ), "<dev string:x55>" );
        guy [[ anim.callbacks[ "AIAnimFirstFrame" ] ]]( animation, animname );
        return;
    }
    
    guy stopanimscripted();
    guy setanimknob( animation, 1, 0, 0 );
    
    if ( !utility::issp() )
    {
        if ( isdefined( level.scr_anim[ animname ] ) && !isplayer( guy ) && guy.classname != "script_vehicle" && !guy vehicle::is_vehicle() && isdefined( level.scr_anim[ animname ][ anime ] ) )
        {
            if ( isarray( level.scr_anim[ animname ][ anime ] ) )
            {
                guy builtin [[ level.func[ "scriptModelPlayAnim" ] ]]( level.scr_anim[ animname ][ anime ][ 0 ], undefined, 0, 0, "none" );
                return;
            }
            
            guy builtin [[ level.func[ "scriptModelPlayAnim" ] ]]( level.scr_anim[ animname ][ anime ], undefined, 0, 0, "none" );
        }
    }
}

// Namespace animation
// Params 6
// Checksum 0x64c4f14b, Offset: 0xba2
// Size: 0xfb
function set_start_pos( anime, org, angles, animname_override, anim_array, animation )
{
    assert( isdefined( org ) && isdefined( angles ), "<dev string:xb2>" );
    animname = undefined;
    
    if ( isdefined( animname_override ) )
    {
        animname = animname_override;
    }
    else
    {
        animname = self.animname;
    }
    
    if ( !isdefined( animation ) )
    {
        if ( function_b8e0e318104693fb( anime ) )
        {
            animation = function_c662ac26794ce12f( anime, org, angles, animname );
        }
        else if ( anim_array )
        {
            animation = level.scr_anim[ animname ][ anime ][ 0 ];
        }
        else
        {
            animation = level.scr_anim[ animname ][ anime ];
        }
    }
    
    neworg = getstartorigin( org, angles, animation );
    newangles = getstartangles( org, angles, animation );
    self [[ anim.callbacks[ "TeleportEnt" ] ]]( neworg, newangles );
}

// Namespace animation
// Params 3
// Checksum 0xdc79413d, Offset: 0xca5
// Size: 0x66
function anim_start_pos( guyarray, anime, tag )
{
    pos = get_anim_position( tag );
    org = pos[ "origin" ];
    angles = pos[ "angles" ];
    utility::array_thread( guyarray, &set_start_pos, anime, org, angles );
}

// Namespace animation
// Params 3
// Checksum 0x4f75bc8a, Offset: 0xd13
// Size: 0x39
function anim_start_pos_solo( guy, anime, tag )
{
    newguy[ 0 ] = guy;
    anim_start_pos( newguy, anime, tag );
}

// Namespace animation
// Params 3
// Checksum 0x16a664e1, Offset: 0xd54
// Size: 0xe2
function anim_last_frame_solo( guy, anime, tag )
{
    guys = [];
    guys[ 0 ] = guy;
    anim_first_frame( guys, anime, tag );
    anim_set_time( guys, anime, 1 );
    animation = guy utility::getanim( anime );
    translation = getmovedelta( animation );
    rotation = getangledelta3d( animation );
    rotatedtranslation = rotatevector( translation, guy.angles );
    origin = guy.origin + rotatedtranslation;
    angles = combineangles( guy.angles, rotation );
    guy [[ anim.callbacks[ "TeleportEnt" ] ]]( origin, angles );
}

// Namespace animation
// Params 5
// Checksum 0xc6e01190, Offset: 0xe3e
// Size: 0x60
function anim_single_solo( guy, anime, tag, var_892f0fc4e60907c3, animname_override )
{
    self endon( "death" );
    newguy[ 0 ] = guy;
    
    if ( !isdefined( var_892f0fc4e60907c3 ) )
    {
        var_892f0fc4e60907c3 = 0;
    }
    
    anim_single( newguy, anime, tag, var_892f0fc4e60907c3, animname_override );
}

// Namespace animation
// Params 5
// Checksum 0x4011da12, Offset: 0xea6
// Size: 0x7b6
function anim_single_internal( guys, anime, tag, var_892f0fc4e60907c3, animname_override )
{
    /#
        thread anim_single_failsafe( guys, anime );
    #/
    
    foreach ( guy in guys )
    {
        if ( !isdefined( guy ) )
        {
            continue;
        }
        
        if ( !isdefined( guy._animactive ) )
        {
            guy._animactive = 0;
        }
        
        guy._animactive++;
    }
    
    pos = get_anim_position( tag );
    org = pos[ "origin" ];
    angles = pos[ "angles" ];
    scriptedanimationindex = undefined;
    scriptedanimationtime = 999999;
    var_162d21f9b7b6a2f1 = undefined;
    var_167d3eac42022adb = undefined;
    scriptedfaceanim = undefined;
    scriptedheadanim = undefined;
    anim_string = "single anim";
    hasxcam = 0;
    
    if ( isdefined( level.scr_xcam[ anime ] ) && level.scr_xcam.size != 0 )
    {
        hasxcam = 1;
    }
    
    guys = function_c5c322095ca966be( guys, anime );
    
    foreach ( i, guy in guys )
    {
        if ( !isdefined( guy ) )
        {
            continue;
        }
        
        dofacialanim = 0;
        doheadanim = 0;
        dodialogue = 0;
        doanimation = 0;
        dotext = 0;
        dialogue = undefined;
        facialanim = undefined;
        headanim = undefined;
        animname = undefined;
        
        if ( isdefined( animname_override ) )
        {
            animname = animname_override;
        }
        else
        {
            animname = guy.animname;
        }
        
        /#
            guy assert_existance_of_anim( anime, animname );
        #/
        
        if ( !isdefined( animname ) )
        {
            continue;
        }
        
        if ( isdefined( level.scr_sound[ animname ] ) && isdefined( level.scr_sound[ animname ][ anime ] ) )
        {
            dodialogue = 1;
            dialogue = level.scr_sound[ animname ][ anime ];
        }
        
        if ( isdefined( level.scr_face[ animname ] ) && isdefined( level.scr_face[ animname ][ anime ] ) )
        {
            dofacialanim = 1;
            facialanim = level.scr_face[ animname ][ anime ];
            scriptedfaceanim = facialanim;
            
            if ( dodialogue )
            {
                if ( animhasnotetrack( facialanim, "vo_" + dialogue ) )
                {
                    dodialogue = 0;
                    dialogue = undefined;
                }
            }
        }
        
        if ( isdefined( level.scr_head[ animname ] ) && isdefined( level.scr_head[ animname ][ anime ] ) )
        {
            doheadanim = 1;
            headanim = level.scr_head[ animname ][ anime ];
            scriptedheadanim = headanim;
        }
        
        if ( isdefined( level.scr_anim[ animname ] ) && isdefined( level.scr_anim[ animname ][ anime ] ) && self [[ anim.callbacks[ "ShouldDoAnim" ] ]]() )
        {
            doanimation = 1;
        }
        
        if ( isdefined( level.scr_animsound[ animname ] ) && isdefined( level.scr_animsound[ animname ][ anime ] ) )
        {
            guy playsound( level.scr_animsound[ animname ][ anime ] );
        }
        
        /#
            if ( isdefined( level.scr_text[ animname ] ) && isdefined( level.scr_text[ animname ][ anime ] ) )
            {
                dotext = 1;
            }
        #/
        
        if ( doanimation )
        {
            scripted_node_ent = undefined;
            
            if ( function_6ee84ba29eeda4f() )
            {
                scripted_node_ent = self;
            }
            
            assert( guy.model, "<dev string:xd8>" + debug::function_4496bef4cfc0d07( guy ) + "<dev string:xfc>" + animname + "<dev string:x110>" + anime + "<dev string:x12d>" );
            guy visibility_mode::function_db9ed9dc5c19305b();
            animtime = guy [[ anim.callbacks[ "DoAnimation" ] ]]( org, angles, animname, anime, anim_string, undefined, scripted_node_ent );
            
            if ( animtime < scriptedanimationtime )
            {
                scriptedanimationtime = animtime;
                scriptedanimationindex = i;
            }
        }
        
        if ( dofacialanim || dodialogue )
        {
            if ( guy [[ anim.callbacks[ "DoFacialAnim" ] ]]( dofacialanim, dodialogue, doanimation, anime, animname, dialogue, 0 ) )
            {
                var_167d3eac42022adb = i;
            }
            
            var_162d21f9b7b6a2f1 = i;
        }
        
        if ( isai( guy ) )
        {
            assert( !( doanimation && guy utility::doinglongdeath() ), "<dev string:x147>" );
        }
        
        assert( doanimation || dofacialanim || dodialogue || dotext, "<dev string:x195>" + anime + "<dev string:x1b0>" + animname + "<dev string:x1ca>" );
        
        if ( doheadanim )
        {
            guy thread play_addtive_head_anim( guy, scriptedheadanim );
        }
        
        /#
            if ( dotext && !dodialogue )
            {
                guy thread [[ anim.callbacks[ "<dev string:x1f3>" ] ]]( level.scr_text[ animname ][ anime ] );
            }
        #/
        
        if ( !utility::issp() )
        {
            if ( isdefined( level.scr_anim[ animname ] ) && !isplayer( guy ) && !isagent( guy ) && !( guy vehicle::is_vehicle() || isdefined( guy.isinfilelevator ) ) && isdefined( level.scr_anim[ animname ][ anime ] ) )
            {
                blendtype = function_cd8b99431e720772( animname, anime );
                
                if ( isdefined( level.var_b8373a77bd36aa7d ) )
                {
                    blendtype = [[ level.var_b8373a77bd36aa7d ]]( animname );
                }
                
                guy utility::self_func( "scriptModelPlayAnim", level.scr_anim[ animname ][ anime ], undefined, undefined, undefined, blendtype );
            }
        }
        
        if ( guy function_1d2dd6f111ac6b37() )
        {
            guy animscripted_blendin( guy.var_77863a8248f2d1d2, guy.var_3325f472467aa60e, "tag_camera" );
        }
    }
    
    if ( hasxcam )
    {
        [[ anim.callbacks[ "playXcam" ] ]]( level.scr_xcam[ anime ], org, angles );
    }
    else if ( isdefined( scriptedanimationindex ) )
    {
        ent = spawnstruct();
        ent thread anim_deathnotify( guys[ scriptedanimationindex ], anime );
        ent thread anim_animationendnotify( guys[ scriptedanimationindex ], anime, scriptedanimationtime, var_892f0fc4e60907c3 );
        ent waittill( anime );
    }
    else if ( isdefined( var_167d3eac42022adb ) )
    {
        ent = spawnstruct();
        ent thread anim_deathnotify( guys[ var_167d3eac42022adb ], anime );
        ent thread anim_facialendnotify( guys[ var_167d3eac42022adb ], anime, scriptedfaceanim );
        ent waittill( anime );
    }
    else if ( isdefined( var_162d21f9b7b6a2f1 ) )
    {
        ent = spawnstruct();
        ent thread anim_deathnotify( guys[ var_162d21f9b7b6a2f1 ], anime );
        ent thread anim_dialogueendnotify( guys[ var_162d21f9b7b6a2f1 ], anime );
        ent waittill( anime );
    }
    
    foreach ( guy in guys )
    {
        if ( !( isdefined( guy ) && isdefined( guy._animactive ) ) )
        {
            continue;
        }
        
        visibility_mode::function_4e6c654251b854e0( guy );
        guy._animactive--;
        guy._lastanimtime = gettime();
        assert( guy._animactive >= 0 );
    }
    
    self notify( anime );
}

// Namespace animation
// Params 2
// Checksum 0x739e0207, Offset: 0x1664
// Size: 0x64
function function_cd8b99431e720772( animname, anime )
{
    blendtype = undefined;
    
    if ( isdefined( level.scr_goaltime[ animname ] ) && isdefined( level.scr_goaltime[ animname ][ anime ] ) )
    {
        if ( level.scr_goaltime[ animname ][ anime ] == 0 )
        {
            blendtype = "none";
        }
    }
    
    return blendtype;
}

// Namespace animation
// Params 5
// Checksum 0xdf35f6ab, Offset: 0x16d1
// Size: 0x5b
function anim_single( guys, anime, tag, var_892f0fc4e60907c3, animname_override )
{
    assert( isarray( guys ), "<dev string:x200>" );
    
    if ( !isdefined( var_892f0fc4e60907c3 ) )
    {
        var_892f0fc4e60907c3 = 0;
    }
    
    anim_single_internal( guys, anime, tag, var_892f0fc4e60907c3, animname_override );
}

// Namespace animation
// Params 6
// Checksum 0x57b5e3ca, Offset: 0x1734
// Size: 0x7d
function anim_loop_solo( guy, anime, ender, tag, var_70057cba8262ab87, animname_override )
{
    assert( !isarray( guy ), "<dev string:x22e>" );
    self endon( "death" );
    guy endon( "death" );
    newguy[ 0 ] = guy;
    anim_loop( newguy, anime, ender, tag, var_70057cba8262ab87, animname_override );
}

// Namespace animation
// Params 4
// Checksum 0xb441e7fa, Offset: 0x17b9
// Size: 0x98
function anim_loop_solo_with_nags( guy, anime, ender, tag )
{
    assert( !isarray( guy ), "<dev string:x262>" );
    self endon( "death" );
    guy endon( "death" );
    assert( isdefined( level.scr_anim[ guy.animname ][ anime + "<dev string:x2a0>" ] ), "<dev string:x2a9>" + anime );
    newguy[ 0 ] = guy;
    anim_loop( newguy, anime, ender, tag );
}

// Namespace animation
// Params 4
// Checksum 0x123539df, Offset: 0x1859
// Size: 0x83
function anim_generic_loop( guy, anime, ender, tag )
{
    assert( !isarray( guy ), "<dev string:x2d5>" );
    packet = [];
    packet[ "guy" ] = guy;
    packet[ "entity" ] = self;
    packet[ "tag" ] = tag;
    guypackets[ 0 ] = packet;
    anim_loop_packet( guypackets, anime, ender, "generic" );
}

// Namespace animation
// Params 6
// Checksum 0x74567022, Offset: 0x18e4
// Size: 0x106
function anim_loop( guys, anime, ender, tag, var_70057cba8262ab87, animname_override )
{
    assert( isarray( guys ), "<dev string:x30c>" );
    guypackets = [];
    
    foreach ( guy in guys )
    {
        packet = [];
        packet[ "guy" ] = guy;
        packet[ "entity" ] = self;
        packet[ "tag" ] = tag;
        packet[ "origin_offset" ] = var_70057cba8262ab87;
        guypackets[ guypackets.size ] = packet;
    }
    
    anim_loop_packet( guypackets, anime, ender, animname_override );
}

// Namespace animation
// Params 4
// Checksum 0xb9426d01, Offset: 0x19f2
// Size: 0x47
function anim_loop_packet_solo( var_fff29eb52d8db12d, anime, ender, animname_override )
{
    looppacket = [];
    looppacket[ 0 ] = var_fff29eb52d8db12d;
    anim_loop_packet( looppacket, anime, ender, animname_override );
}

// Namespace animation
// Params 1
// Checksum 0xd9d531d7, Offset: 0x1a41
// Size: 0x99
function pick_nag_anim( datastruct )
{
    naganim = undefined;
    
    if ( datastruct.nag_anims.size == 1 )
    {
        naganim = 0;
    }
    else if ( datastruct.currentnagindex == datastruct.nag_anims.size - 1 )
    {
        naganim = 0;
    }
    else
    {
        naganim = datastruct.currentnagindex + 1;
    }
    
    assert( isdefined( naganim ) );
    datastruct.currentnagindex = naganim;
    datastruct.last_nag_time = gettime();
    return datastruct.currentnagindex;
}

// Namespace animation
// Params 4
// Checksum 0x7c83316e, Offset: 0x1ae3
// Size: 0x8f9
function anim_loop_packet( guypackets, anime, ender, animname_override )
{
    assert( !isdefined( level.scr_xcam[ anime ] ), "<dev string:x338>" );
    
    foreach ( guypacket in guypackets )
    {
        guy = guypacket[ "guy" ];
        
        if ( !isdefined( guy ) )
        {
            continue;
        }
        
        if ( !isdefined( guy._animactive ) )
        {
            guy._animactive = 0;
        }
        
        guy endon( "death" );
        guy._animactive++;
    }
    
    baseguy = guypackets[ 0 ][ "guy" ];
    
    /#
        if ( !isdefined( baseguy.loops ) )
        {
            baseguy.loops = 0;
            baseguy.loopanims = [];
        }
        
        thread printloops( baseguy, anime );
    #/
    
    if ( !isdefined( ender ) )
    {
        ender = "stop_loop";
    }
    
    thread endonremoveanimactive( ender, guypackets );
    self endon( ender );
    
    /#
        thread function_22388de1d368ad59( baseguy, ender, anime );
    #/
    
    anim_string = "looping anim";
    base_anime = anime;
    base_animname = undefined;
    
    if ( isdefined( animname_override ) )
    {
        base_animname = animname_override;
    }
    else
    {
        base_animname = baseguy.animname;
    }
    
    idleanim = 0;
    lastidleanim = 0;
    naginterval = 0;
    hasnags = isdefined( level.scr_anim[ base_animname ][ anime + "_nags" ] );
    
    if ( hasnags && utility::issp() )
    {
        ai = 0;
        
        foreach ( i, guypacket in guypackets )
        {
            if ( isai( guypacket[ "guy" ] ) )
            {
                ai++;
            }
        }
        
        assert( ai == 1, "<dev string:x36a>" );
        
        if ( isdefined( level.scr_anim[ base_animname ][ anime + "_nags_timer" ] ) )
        {
            naginterval = level.scr_anim[ base_animname ][ anime + "_nags_timer" ];
        }
        else
        {
            naginterval = 15;
        }
    }
    
    donag = 0;
    nagdata = undefined;
    abandonloop = 0;
    
    if ( hasnags )
    {
        setdvarifuninitialized( @"hash_e35578a601bcd680", 0 );
        nagdata = spawnstruct();
        nagdata.last_nag_time = gettime();
        nagdata.nag_anims = level.scr_anim[ base_animname ][ anime + "_nags" ];
        nagdata.currentnagindex = 0;
        childthread nag_timer( naginterval, baseguy );
    }
    
    while ( true )
    {
        if ( !donag && !isagent( baseguy ) )
        {
            anime = base_anime;
            
            for ( idleanim = anim_weight( base_animname, anime ); idleanim == lastidleanim && idleanim != 0 ; idleanim = anim_weight( base_animname, anime ) )
            {
            }
        }
        else if ( !isagent( baseguy ) )
        {
            idleanim = pick_nag_anim( nagdata );
            anime = base_anime + "_nags";
            childthread nag_timer( naginterval, baseguy );
            donag = 0;
        }
        else
        {
            idleanim = anime;
        }
        
        lastidleanim = idleanim;
        scriptedanimationindex = undefined;
        scriptedanimationtime = 999999;
        var_162d21f9b7b6a2f1 = undefined;
        guy = undefined;
        
        foreach ( i, guypacket in guypackets )
        {
            entity = guypacket[ "entity" ];
            guy = guypacket[ "guy" ];
            pos = entity get_anim_position( guypacket[ "tag" ] );
            org = pos[ "origin" ];
            angles = pos[ "angles" ];
            
            if ( isdefined( guypacket[ "origin_offset" ] ) )
            {
                offset = guypacket[ "origin_offset" ];
                forward = anglestoforward( angles );
                right = anglestoright( angles );
                up = anglestoup( angles );
                org += forward * offset[ 0 ];
                org += right * offset[ 1 ];
                org += up * offset[ 2 ];
            }
            
            if ( isdefined( guy.remove_from_animloop ) )
            {
                guy.remove_from_animloop = undefined;
                guypackets[ i ] = undefined;
                continue;
            }
            
            dofacialanim = 0;
            dodialogue = 0;
            doanimation = 0;
            
            /#
                dotext = 0;
            #/
            
            facialanim = undefined;
            dialogue = undefined;
            animname = undefined;
            
            if ( isdefined( animname_override ) )
            {
                animname = animname_override;
            }
            else
            {
                animname = guy.animname;
            }
            
            if ( isdefined( level.scr_face[ animname ] ) && isdefined( level.scr_face[ animname ][ anime ] ) && isdefined( level.scr_face[ animname ][ anime ][ idleanim ] ) )
            {
                dofacialanim = 1;
                facialanim = level.scr_face[ animname ][ anime ][ idleanim ];
            }
            
            if ( isdefined( level.scr_sound[ animname ] ) && isdefined( level.scr_sound[ animname ][ anime ] ) && isdefined( level.scr_sound[ animname ][ anime ][ idleanim ] ) )
            {
                dodialogue = 1;
                dialogue = level.scr_sound[ animname ][ anime ][ idleanim ];
            }
            
            if ( isdefined( level.scr_animsound[ animname ] ) && isdefined( level.scr_animsound[ animname ][ idleanim + anime ] ) )
            {
                guy playsound( level.scr_animsound[ animname ][ idleanim + anime ] );
            }
            
            if ( isdefined( level.scr_anim[ animname ] ) && isdefined( level.scr_anim[ animname ][ anime ] ) && self [[ anim.callbacks[ "ShouldDoAnim" ] ]]() )
            {
                doanimation = 1;
            }
            else if ( isagent( guy ) && self [[ anim.callbacks[ "ShouldDoAnim" ] ]]() )
            {
                doanimation = 1;
            }
            
            /#
                if ( isdefined( level.scr_text[ animname ] ) && isdefined( level.scr_text[ animname ][ anime ] ) )
                {
                    dotext = 1;
                }
                
                if ( !dofacialanim && !dodialogue && !doanimation && !dotext )
                {
                    assertmsg( "<dev string:x3a3>" + guy getentitynumber() + "<dev string:x3b2>" + anime + "<dev string:x3d3>" );
                    abandonloop = 1;
                    break;
                }
            #/
            
            if ( doanimation )
            {
                guy visibility_mode::function_db9ed9dc5c19305b();
                animtime = guy [[ anim.callbacks[ "DoAnimation" ] ]]( org, angles, animname, anime, anim_string, idleanim, undefined );
                
                if ( animtime < scriptedanimationtime )
                {
                    scriptedanimationtime = animtime;
                    scriptedanimationindex = i;
                }
            }
            
            if ( !utility::issp() )
            {
                if ( isdefined( level.scr_anim[ animname ][ anime ] ) && isdefined( level.scr_anim[ animname ] ) && !isplayer( guy ) && !isagent( guy ) && !guy vehicle::is_vehicle() && !isdefined( guy vehicle::get_ref() ) && isdefined( level.scr_anim[ animname ][ anime ][ idleanim ] ) )
                {
                    guy utility::self_func( "scriptModelPlayAnim", level.scr_anim[ animname ][ anime ][ idleanim ], undefined, undefined, undefined, function_cd8b99431e720772( animname, anime ) );
                }
            }
            
            if ( dofacialanim || dodialogue )
            {
                guy [[ anim.callbacks[ "DoFacialAnim" ] ]]( dofacialanim, dodialogue, doanimation, anime, animname, dialogue, 1 );
                var_162d21f9b7b6a2f1 = i;
            }
            
            /#
                if ( dotext && !dodialogue )
                {
                    guy thread [[ anim.callbacks[ "<dev string:x1f3>" ] ]]( level.scr_text[ animname ][ anime ] );
                }
            #/
        }
        
        if ( !isdefined( guy ) )
        {
            break;
        }
        
        if ( isdefined( scriptedanimationindex ) )
        {
            finishedanim = waittill_animend( guypackets[ scriptedanimationindex ][ "guy" ], anim_string, hasnags );
            
            if ( !isdefined( finishedanim ) && hasnags )
            {
                donag = 1;
                
                if ( isdefined( anim.callbacks[ "StopAnimscripted" ] ) )
                {
                    guy [[ anim.callbacks[ "StopAnimscripted" ] ]]();
                }
            }
        }
        else if ( isdefined( var_162d21f9b7b6a2f1 ) )
        {
            guypackets[ var_162d21f9b7b6a2f1 ][ "guy" ] waittill( anim_string );
        }
        
        if ( abandonloop )
        {
            break;
        }
    }
}

// Namespace animation
// Params 3
// Checksum 0xa7d68d71, Offset: 0x23e4
// Size: 0x39, Type: bool
function waittill_animend( guy, animstring, hasnags )
{
    if ( hasnags )
    {
        self endon( "do_nag" );
    }
    
    guy waittillmatch( animstring, "end" );
    return true;
}

// Namespace animation
// Params 2
// Checksum 0xc161ae5c, Offset: 0x2426
// Size: 0xac
function nag_timer( timer, guy )
{
    self endon( "death" );
    
    /#
        temp = timer;
    #/
    
    currenttime = gettime();
    
    while ( currenttime + timer * 1000 > gettime() )
    {
        /#
            if ( getdvarint( @"hash_e35578a601bcd680" ) )
            {
                print3d( guy.origin + ( 0, 0, 70 ), temp + "<dev string:x3ea>", ( 1, 1, 0.5 ), 1, 0.6, 20 );
                temp--;
            }
        #/
        
        wait 1;
    }
    
    self notify( "do_nag" );
}

// Namespace animation
// Params 3
// Checksum 0x30155b8e, Offset: 0x24da
// Size: 0x41
function anim_set_time_solo( guy, anime, time )
{
    self endon( "death" );
    newguy[ 0 ] = guy;
    anim_set_time( newguy, anime, time );
}

// Namespace animation
// Params 3
// Checksum 0x63d6b4a0, Offset: 0x2523
// Size: 0x2f
function anim_set_time( guys, anime, time )
{
    utility::array_thread( guys, &anim_self_set_time, anime, time );
}

// Namespace animation
// Params 2
// Checksum 0x8bb2ea61, Offset: 0x255a
// Size: 0x40
function anim_self_set_time( anime, time )
{
    animation = utility::getanim( anime );
    
    if ( isarray( animation ) )
    {
        animation = animation[ 0 ];
    }
    
    self setanimtime( animation, time );
}

// Namespace animation
// Params 0
// Checksum 0x83fef091, Offset: 0x25a2
// Size: 0x56
function last_anim_time_check()
{
    if ( !isdefined( self.last_anim_time ) )
    {
        self.last_anim_time = gettime();
        return;
    }
    
    time = gettime();
    
    if ( self.last_anim_time == time )
    {
        self endon( "death" );
        wait 0.05;
    }
    
    self.last_anim_time = time;
}

// Namespace animation
// Params 6
// Checksum 0x15dfcec0, Offset: 0x2600
// Size: 0x159
function anim_moveto( guys, anime, tag, time, acceleration_time, deceleration_time )
{
    pos = get_anim_position( tag );
    org = pos[ "origin" ];
    angles = pos[ "angles" ];
    
    foreach ( guy in guys )
    {
        startorg = getstartorigin( org, angles, level.scr_anim[ guy.animname ][ anime ] );
        startang = getstartangles( org, angles, level.scr_anim[ guy.animname ][ anime ] );
        
        if ( isai( guy ) )
        {
            assertmsg( "<dev string:x3fd>" );
            continue;
        }
        
        guy moveto( startorg, time, acceleration_time, deceleration_time );
        guy rotateto( startang, time, acceleration_time, deceleration_time );
    }
}

// Namespace animation
// Params 3
// Checksum 0xc6c9e37a, Offset: 0x2761
// Size: 0x41
function anim_teleport_solo( guy, anime, tag )
{
    self endon( "death" );
    newguy[ 0 ] = guy;
    anim_teleport( newguy, anime, tag );
}

// Namespace animation
// Params 3
// Checksum 0x6f092892, Offset: 0x27aa
// Size: 0x123
function anim_teleport( guys, anime, tag )
{
    pos = get_anim_position( tag );
    org = pos[ "origin" ];
    angles = pos[ "angles" ];
    
    foreach ( guy in guys )
    {
        startorg = getstartorigin( org, angles, level.scr_anim[ guy.animname ][ anime ] );
        startang = getstartangles( org, angles, level.scr_anim[ guy.animname ][ anime ] );
        guy [[ anim.callbacks[ "TeleportEnt" ] ]]( startorg, startang );
    }
}

// Namespace animation
// Params 3
// Checksum 0x1923963d, Offset: 0x28d5
// Size: 0xb0
function anim_generic_teleport( guy, anime, tag )
{
    pos = get_anim_position( tag );
    org = pos[ "origin" ];
    angles = pos[ "angles" ];
    startorg = getstartorigin( org, angles, level.scr_anim[ "generic" ][ anime ] );
    startang = getstartangles( org, angles, level.scr_anim[ "generic" ][ anime ] );
    guy [[ anim.callbacks[ "TeleportEnt" ] ]]( startorg, startang );
}

// Namespace animation
// Params 3
// Checksum 0x6dc878c2, Offset: 0x298d
// Size: 0x2e
function anim_spawn_generic_model( model, anime, tag )
{
    return anim_spawn_model( model, "generic", anime, tag );
}

// Namespace animation
// Params 4
// Checksum 0x83bc4500, Offset: 0x29c4
// Size: 0xc8
function anim_spawn_model( model, animname, anime, tag )
{
    pos = get_anim_position( tag );
    org = pos[ "origin" ];
    angles = pos[ "angles" ];
    startorg = getstartorigin( org, angles, level.scr_anim[ animname ][ anime ] );
    startangles = getstartorigin( org, angles, level.scr_anim[ animname ][ anime ] );
    spawned = spawn( "script_model", startorg );
    spawned setmodel( model );
    spawned.angles = startangles;
    return spawned;
}

// Namespace animation
// Params 2
// Checksum 0xfe91ff8, Offset: 0x2a95
// Size: 0x1e
function anim_spawn_tag_model( model, tag )
{
    self attach( model, tag );
}

// Namespace animation
// Params 2
// Checksum 0x521d06e7, Offset: 0x2abb
// Size: 0x6b
function anim_link_tag_model( model, tag )
{
    org = self gettagorigin( tag );
    spawned = spawn( "script_model", org );
    spawned setmodel( model );
    spawned linkto( self, tag, ( 0, 0, 0 ), ( 0, 0, 0 ) );
    return spawned;
}

// Namespace animation
// Params 5
// Checksum 0x5be98556, Offset: 0x2b2f
// Size: 0xfc
function removenotetrack( animname, notetrack, anime, notetype, ent )
{
    notetrack = tolower( notetrack );
    array = level.scr_notetrack[ animname ][ anime ][ notetrack ];
    anime = get_generic_anime( anime );
    index = -1;
    
    if ( !isarray( array ) || array.size < 1 )
    {
        return;
    }
    
    for ( i = 0; i < array.size ; i++ )
    {
        if ( isdefined( array[ i ][ notetype ] ) )
        {
            if ( !isdefined( ent ) || array[ i ][ notetype ] == ent )
            {
                index = i;
                break;
            }
        }
    }
    
    if ( index < 0 )
    {
        return;
    }
    
    if ( array.size == 1 )
    {
        array = [];
    }
    else
    {
        array[ index ] = undefined;
    }
    
    if ( isint( index ) )
    {
        function_cdc669dbc8ea2101( array );
    }
    
    level.scr_notetrack[ animname ][ anime ][ notetrack ] = array;
}

// Namespace animation
// Params 4
// Checksum 0x8462c170, Offset: 0x2c33
// Size: 0xa9
function addnotetrack_flag( animname, notetrack, theflag, anime )
{
    notetrack = tolower( notetrack );
    anime = get_generic_anime( anime );
    index = add_notetrack_and_get_index( animname, notetrack, anime );
    array = [];
    array[ "flag" ] = theflag;
    level.scr_notetrack[ animname ][ anime ][ notetrack ][ index ] = array;
    
    if ( utility::issp() )
    {
        if ( !( isdefined( level.flag ) && isdefined( level.flag[ theflag ] ) ) )
        {
            utility::flag_init( theflag );
        }
    }
}

// Namespace animation
// Params 4
// Checksum 0xc7fb3232, Offset: 0x2ce4
// Size: 0xa0
function addnotetrack_flag_clear( animname, notetrack, theflag, anime )
{
    notetrack = tolower( notetrack );
    anime = get_generic_anime( anime );
    index = add_notetrack_and_get_index( animname, notetrack, anime );
    array = [];
    array[ "flag_clear" ] = theflag;
    level.scr_notetrack[ animname ][ anime ][ notetrack ][ index ] = array;
    
    if ( !( isdefined( level.flag ) && isdefined( level.flag[ theflag ] ) ) )
    {
        utility::flag_init( theflag );
    }
}

// Namespace animation
// Params 4
// Checksum 0xc3de794a, Offset: 0x2d8c
// Size: 0x80
function addnotetrack_dialogue( animname, notetrack, anime, soundalias )
{
    notetrack = tolower( notetrack );
    anime = get_generic_anime( anime );
    index = add_notetrack_and_get_index( animname, notetrack, anime );
    level.scr_notetrack[ animname ][ anime ][ notetrack ][ index ] = [];
    level.scr_notetrack[ animname ][ anime ][ notetrack ][ index ][ "dialog" ] = soundalias;
}

// Namespace animation
// Params 3
// Checksum 0xbd418a9b, Offset: 0x2e14
// Size: 0x42
function add_notetrack_and_get_index( animname, notetrack, anime )
{
    notetrack = tolower( notetrack );
    add_notetrack_array( animname, notetrack, anime );
    return level.scr_notetrack[ animname ][ anime ][ notetrack ].size;
}

// Namespace animation
// Params 3
// Checksum 0xa2d1188b, Offset: 0x2e5f
// Size: 0xa7
function add_notetrack_array( animname, notetrack, anime )
{
    notetrack = tolower( notetrack );
    
    if ( !isdefined( level.scr_notetrack ) )
    {
        level.scr_notetrack = [];
    }
    
    if ( !isdefined( level.scr_notetrack[ animname ] ) )
    {
        level.scr_notetrack[ animname ] = [];
    }
    
    if ( !isdefined( level.scr_notetrack[ animname ][ anime ] ) )
    {
        level.scr_notetrack[ animname ][ anime ] = [];
    }
    
    if ( !isdefined( level.scr_notetrack[ animname ][ anime ][ notetrack ] ) )
    {
        level.scr_notetrack[ animname ][ anime ][ notetrack ] = [];
    }
}

// Namespace animation
// Params 6
// Checksum 0xdec5af6b, Offset: 0x2f0e
// Size: 0xd6
function addnotetrack_sound( animname, notetrack, anime, soundalias, sound_stays_death, tag )
{
    notetrack = tolower( notetrack );
    anime = get_generic_anime( anime );
    index = add_notetrack_and_get_index( animname, notetrack, anime );
    level.scr_notetrack[ animname ][ anime ][ notetrack ][ index ] = [];
    level.scr_notetrack[ animname ][ anime ][ notetrack ][ index ][ "sound" ] = soundalias;
    
    if ( isdefined( sound_stays_death ) )
    {
        level.scr_notetrack[ animname ][ anime ][ notetrack ][ index ][ "sound_stays_death" ] = 1;
    }
    
    if ( isdefined( tag ) )
    {
        level.scr_notetrack[ animname ][ anime ][ notetrack ][ index ][ "sound_on_tag" ] = tag;
    }
}

// Namespace animation
// Params 4
// Checksum 0x750a13f1, Offset: 0x2fec
// Size: 0x5c
function note_track_start_sound( notetrack, soundalias, sound_stays_death, tag )
{
    scenedata = get_datascene();
    addnotetrack_sound( scenedata.animname, notetrack, scenedata.anim_sequence, soundalias, sound_stays_death, tag );
}

// Namespace animation
// Params 4
// Checksum 0x7a1c354f, Offset: 0x3050
// Size: 0x80
function addnotetrack_playersound( animname, notetrack, anime, soundalias )
{
    notetrack = tolower( notetrack );
    anime = get_generic_anime( anime );
    index = add_notetrack_and_get_index( animname, notetrack, anime );
    level.scr_notetrack[ animname ][ anime ][ notetrack ][ index ] = [];
    level.scr_notetrack[ animname ][ anime ][ notetrack ][ index ][ "playersound" ] = soundalias;
}

// Namespace animation
// Params 1
// Checksum 0xdfa58413, Offset: 0x30d8
// Size: 0x1b
function get_generic_anime( anime )
{
    if ( !isdefined( anime ) )
    {
        return "any";
    }
    
    return anime;
}

// Namespace animation
// Params 3
// Checksum 0x59d69164, Offset: 0x30fc
// Size: 0x4d
function addonstart_animsound( animname, anime, soundalias )
{
    if ( !isdefined( level.scr_animsound[ animname ] ) )
    {
        level.scr_animsound[ animname ] = [];
    }
    
    level.scr_animsound[ animname ][ anime ] = soundalias;
}

// Namespace animation
// Params 4
// Checksum 0xadd6bcd7, Offset: 0x3151
// Size: 0x80
function addnotetrack_playerdialogue( animname, notetrack, anime, soundalias )
{
    notetrack = tolower( notetrack );
    anime = get_generic_anime( anime );
    index = add_notetrack_and_get_index( animname, notetrack, anime );
    level.scr_notetrack[ animname ][ anime ][ notetrack ][ index ] = [];
    level.scr_notetrack[ animname ][ anime ][ notetrack ][ index ][ "playerdialogue" ] = soundalias;
}

// Namespace animation
// Params 4
// Checksum 0xad933184, Offset: 0x31d9
// Size: 0x83
function addnotetrack_animsound( animname, anime, notetrack, soundalias )
{
    notetrack = tolower( notetrack );
    anime = get_generic_anime( anime );
    index = add_notetrack_and_get_index( animname, notetrack, anime );
    array = [];
    array[ "sound" ] = soundalias;
    array[ "created_by_animSound" ] = 1;
    level.scr_notetrack[ animname ][ anime ][ notetrack ][ index ] = array;
}

// Namespace animation
// Params 5
// Checksum 0x534bf7b9, Offset: 0x3264
// Size: 0x8c
function addnotetrack_attach( animname, notetrack, model, tag, anime )
{
    notetrack = tolower( notetrack );
    anime = get_generic_anime( anime );
    index = add_notetrack_and_get_index( animname, notetrack, anime );
    array = [];
    array[ "attach model" ] = model;
    array[ "selftag" ] = tag;
    level.scr_notetrack[ animname ][ anime ][ notetrack ][ index ] = array;
}

// Namespace animation
// Params 5
// Checksum 0xa9ddb423, Offset: 0x32f8
// Size: 0x8c
function addnotetrack_detach( animname, notetrack, model, tag, anime )
{
    notetrack = tolower( notetrack );
    anime = get_generic_anime( anime );
    index = add_notetrack_and_get_index( animname, notetrack, anime );
    array = [];
    array[ "detach model" ] = model;
    array[ "selftag" ] = tag;
    level.scr_notetrack[ animname ][ anime ][ notetrack ][ index ] = array;
}

// Namespace animation
// Params 4
// Checksum 0x96ee6ef7, Offset: 0x338c
// Size: 0x96
function addnotetrack_detach_gun( animname, notetrack, anime, suspend )
{
    notetrack = tolower( notetrack );
    anime = get_generic_anime( anime );
    index = add_notetrack_and_get_index( animname, notetrack, anime );
    array = [];
    array[ "detach gun" ] = 1;
    array[ "tag" ] = "tag_weapon_right";
    
    if ( isdefined( suspend ) )
    {
        array[ "suspend" ] = suspend;
    }
    
    level.scr_notetrack[ animname ][ anime ][ notetrack ][ index ] = array;
}

// Namespace animation
// Params 4
// Checksum 0x39b1e8a8, Offset: 0x342a
// Size: 0x8f
function addnotetrack_attach_gun( animname, notetrack, anime, weapplacement )
{
    notetrack = tolower( notetrack );
    anime = get_generic_anime( anime );
    index = add_notetrack_and_get_index( animname, notetrack, anime );
    array = [];
    
    if ( isdefined( weapplacement ) )
    {
        array[ "attach gun " + weapplacement ] = 1;
    }
    else
    {
        array[ "attach gun right" ] = 1;
    }
    
    level.scr_notetrack[ animname ][ anime ][ notetrack ][ index ] = array;
}

// Namespace animation
// Params 4
// Checksum 0xd9c04801, Offset: 0x34c1
// Size: 0x79
function addnotetrack_customfunction( animname, notetrack, function, anime )
{
    notetrack = tolower( notetrack );
    anime = get_generic_anime( anime );
    index = add_notetrack_and_get_index( animname, notetrack, anime );
    array = [];
    array[ "function" ] = function;
    level.scr_notetrack[ animname ][ anime ][ notetrack ][ index ] = array;
}

// Namespace animation
// Params 6
// Checksum 0x3d6e777b, Offset: 0x3542
// Size: 0xae
function addnotetrack_startfxontag( animname, notetrack, anime, effect_name, tagname, morethanthreehack )
{
    utility::getfx( effect_name );
    notetrack = tolower( notetrack );
    anime = get_generic_anime( anime );
    index = add_notetrack_and_get_index( animname, notetrack, anime );
    array = [];
    array[ "effect" ] = effect_name;
    array[ "selftag" ] = tagname;
    
    if ( isdefined( morethanthreehack ) )
    {
        array[ "moreThanThreeHack" ] = morethanthreehack;
    }
    
    level.scr_notetrack[ animname ][ anime ][ notetrack ][ index ] = array;
}

// Namespace animation
// Params 5
// Checksum 0xf00a6996, Offset: 0x35f8
// Size: 0x95
function addnotetrack_stopfxontag( animname, notetrack, anime, effect_name, tagname )
{
    utility::getfx( effect_name );
    notetrack = tolower( notetrack );
    anime = get_generic_anime( anime );
    index = add_notetrack_and_get_index( animname, notetrack, anime );
    array = [];
    array[ "stop_effect" ] = effect_name;
    array[ "selftag" ] = tagname;
    level.scr_notetrack[ animname ][ anime ][ notetrack ][ index ] = array;
}

// Namespace animation
// Params 5
// Checksum 0xbbda7da2, Offset: 0x3695
// Size: 0x8c
function addnotetrack_mayhemstart( animname, notetrack, animation, anime, usehatmodel )
{
    notetrack = tolower( notetrack );
    anime = get_generic_anime( anime );
    index = add_notetrack_and_get_index( animname, notetrack, anime );
    array = [];
    array[ "mayhem_start" ] = animation;
    array[ "use_hat_model" ] = usehatmodel;
    level.scr_notetrack[ animname ][ anime ][ notetrack ][ index ] = array;
}

// Namespace animation
// Params 5
// Checksum 0xd59511f7, Offset: 0x3729
// Size: 0x8c
function addnotetrack_mayhemend( animname, notetrack, animation, anime, usehatmodel )
{
    notetrack = tolower( notetrack );
    anime = get_generic_anime( anime );
    index = add_notetrack_and_get_index( animname, notetrack, anime );
    array = [];
    array[ "mayhem_end" ] = animation;
    array[ "use_hat_model" ] = usehatmodel;
    level.scr_notetrack[ animname ][ anime ][ notetrack ][ index ] = array;
}

// Namespace animation
// Params 3
// Checksum 0x3689aa62, Offset: 0x37bd
// Size: 0x5c
function note_track_swap_to_efx( notetrack, effect_path, tagname )
{
    scenedata = get_datascene();
    utility::add_fx( effect_path, effect_path );
    addnotetrack_swapparttoefx( scenedata.animname, notetrack, scenedata.animsequence, effect_path, tagname );
}

// Namespace animation
// Params 3
// Checksum 0x4102aba7, Offset: 0x3821
// Size: 0x5c
function note_track_stop_efx_on_tag( notetrack, effect_path, tagname )
{
    scenedata = get_datascene();
    utility::add_fx( effect_path, effect_path );
    addnotetrack_stopfxontag( scenedata.animname, notetrack, scenedata.animsequence, effect_path, tagname );
}

// Namespace animation
// Params 5
// Checksum 0x2600a793, Offset: 0x3885
// Size: 0x95
function addnotetrack_swapparttoefx( animname, notetrack, anime, effect_name, tagname )
{
    utility::getfx( effect_name );
    notetrack = tolower( notetrack );
    anime = get_generic_anime( anime );
    index = add_notetrack_and_get_index( animname, notetrack, anime );
    array = [];
    array[ "swap_part_to_efx" ] = effect_name;
    array[ "selftag" ] = tagname;
    level.scr_notetrack[ animname ][ anime ][ notetrack ][ index ] = array;
}

// Namespace animation
// Params 6
// Checksum 0x6b9c0fdb, Offset: 0x3922
// Size: 0xd7
function note_track_trace_to_efx( notetrack, canceltrack, tagname, effect_path, waterfx_path, delete_depth )
{
    scenedata = get_datascene();
    
    if ( notetrack != "start" && !animhasnotetrack( scenedata utility::getanim( scenedata.anim_sequence ), notetrack ) )
    {
        println( "<dev string:x420>" + scenedata.anim_sequence + "<dev string:x43f>" + notetrack );
        return;
    }
    
    utility::add_fx( effect_path, effect_path );
    
    if ( isdefined( waterfx_path ) )
    {
        utility::add_fx( waterfx_path, waterfx_path );
    }
    
    addnotetrack_tracepartforefx( scenedata.animname, notetrack, canceltrack, scenedata.anim_sequence, tagname, effect_path, waterfx_path, delete_depth );
}

// Namespace animation
// Params 3
// Checksum 0xcab95321, Offset: 0x3a01
// Size: 0xaa
function note_track_start_fx_on_tag( notetrack, tagname, effect_path )
{
    scenedata = get_datascene();
    
    if ( notetrack != "start" && !animhasnotetrack( scenedata utility::getanim( scenedata.anim_sequence ), notetrack ) )
    {
        println( "<dev string:x45d>" + scenedata.anim_sequence + "<dev string:x43f>" + notetrack );
        return;
    }
    
    utility::add_fx( effect_path, effect_path );
    addnotetrack_startfxontag( scenedata.animname, notetrack, scenedata.anim_sequence, effect_path, tagname, 1 );
}

// Namespace animation
// Params 0
// Checksum 0x7777e4a1, Offset: 0x3ab3
// Size: 0x44
function get_datascene()
{
    assert( isdefined( level.current_anim_data_scene ) );
    scenedata = level.current_anim_data_scene;
    assert( isdefined( scenedata.animtree ), "<dev string:x476>" );
    return scenedata;
}

// Namespace animation
// Params 8
// Checksum 0x38111b2b, Offset: 0x3b00
// Size: 0x10c
function addnotetrack_tracepartforefx( animname, notetrack, canceltrack, anime, tagname, effect_name, waterfx_name, delete_depth )
{
    utility::getfx( effect_name );
    notetrack = tolower( notetrack );
    anime = get_generic_anime( anime );
    index = add_notetrack_and_get_index( animname, notetrack, anime );
    array = [];
    array[ "trace_part_for_efx" ] = effect_name;
    array[ "trace_part_for_efx_water" ] = waterfx_name;
    array[ "trace_part_for_efx_cancel" ] = canceltrack;
    array[ "trace_part_for_efx_delete_depth" ] = delete_depth;
    array[ "selftag" ] = tagname;
    level.scr_notetrack[ animname ][ anime ][ notetrack ][ index ] = array;
    
    if ( isdefined( canceltrack ) )
    {
        array = [];
        array[ "trace_part_for_efx_canceling" ] = canceltrack;
        array[ "selftag" ] = tagname;
        index = add_notetrack_and_get_index( animname, canceltrack, anime );
        level.scr_notetrack[ animname ][ anime ][ canceltrack ][ index ] = array;
    }
}

// Namespace animation
// Params 4
// Checksum 0x4859e0e3, Offset: 0x3c14
// Size: 0x79
function addnotetrack_notify( animname, notetrack, thenotify, anime )
{
    notetrack = tolower( notetrack );
    anime = get_generic_anime( anime );
    index = add_notetrack_and_get_index( animname, notetrack, anime );
    array = [];
    array[ "notify" ] = thenotify;
    level.scr_notetrack[ animname ][ anime ][ notetrack ][ index ] = array;
}

// Namespace animation
// Params 0
// Checksum 0xe04a2d9f, Offset: 0x3c95
// Size: 0x28
function setanimtree()
{
    id = self useanimtree( level.scr_animtree[ self.animname ] );
    return id;
}

// Namespace animation
// Params 0
// Checksum 0xab205185, Offset: 0x3cc6
// Size: 0x1ca
function initanim()
{
    if ( !isdefined( level.scr_notetrack ) )
    {
        level.scr_notetrack = [];
    }
    
    if ( !isdefined( level.scr_face ) )
    {
        level.scr_face = [];
    }
    
    if ( !isdefined( level.scr_head ) )
    {
        level.scr_head = [];
    }
    
    if ( !isdefined( level.scr_look ) )
    {
        level.scr_look = [];
    }
    
    if ( !isdefined( level.scr_animsound ) )
    {
        level.scr_animsound = [];
    }
    
    if ( !isdefined( level.scr_sound ) )
    {
        level.scr_sound = [];
    }
    
    if ( !isdefined( level.scr_radio ) )
    {
        level.scr_radio = [];
    }
    
    if ( !isdefined( level.scr_text ) )
    {
        level.scr_text = [];
    }
    
    if ( !isdefined( level.scr_anim ) )
    {
        level.scr_anim[ 0 ][ 0 ] = 0;
    }
    
    if ( !isdefined( level.scr_animlength ) )
    {
        level.scr_animlength[ 0 ][ 0 ] = 0;
    }
    
    if ( !isdefined( level.scr_radio ) )
    {
        level.scr_radio = [];
    }
    
    if ( !isdefined( level.scr_plrdialogue ) )
    {
        level.scr_plrdialogue = [];
    }
    
    if ( !isdefined( level.scr_goaltime ) )
    {
        level.scr_goaltime = [];
    }
    
    if ( !isdefined( level._notetrackfx ) )
    {
        level._notetrackfx = [];
    }
    
    if ( !isdefined( level.scr_xcam ) )
    {
        level.scr_xcam = [];
    }
    
    thread precache_script_models_thread();
    thread precache_weapon_models_thread();
    utility::create_lock( "moreThanThreeHack", 3 );
    utility::create_lock( "trace_part_for_efx", 12 );
    
    /#
        setdevdvarifuninitialized( @"hash_b46df2b57cc019b", 0 );
    #/
    
    init_animsounds();
    
    /#
        level thread function_2cff1618834b2ab7();
        level thread function_95203209b32581ca();
    #/
}

// Namespace animation
// Params 0
// Checksum 0xbb9d8621, Offset: 0x3e98
// Size: 0xa9
function precache_script_models_thread()
{
    waittillframeend();
    
    if ( !isdefined( level.scr_model ) )
    {
        return;
    }
    
    models = getarraykeys( level.scr_model );
    
    for ( i = 0; i < models.size ; i++ )
    {
        if ( isarray( level.scr_model[ models[ i ] ] ) )
        {
            for ( modelindex = 0; modelindex < level.scr_model[ models[ i ] ].size ; modelindex++ )
            {
                precachemodel( level.scr_model[ models[ i ] ][ modelindex ] );
            }
            
            continue;
        }
        
        precachemodel( level.scr_model[ models[ i ] ] );
    }
}

// Namespace animation
// Params 0
// Checksum 0x3d796798, Offset: 0x3f49
// Size: 0xda
function precache_weapon_models_thread()
{
    waittillframeend();
    
    if ( !isdefined( level.scr_weapon ) )
    {
        return;
    }
    
    weapons = getarraykeys( level.scr_weapon );
    
    for ( i = 0; i < weapons.size ; i++ )
    {
        assert( isarray( level.scr_weapon[ weapons[ i ] ] ), weapons[ i ] + "<dev string:x4ae>" );
        attachments = [];
        
        if ( isdefined( level.scr_weapon[ weapons[ i ] ][ 1 ] ) )
        {
            assert( isarray( level.scr_weapon[ weapons[ i ] ][ 1 ] ), "<dev string:x4df>" );
            attachments = level.scr_weapon[ weapons[ i ] ][ 1 ];
        }
        
        utility::make_weapon_model( level.scr_weapon[ weapons[ i ] ][ 0 ], attachments, 1, 1 );
    }
}

// Namespace animation
// Params 0
// Checksum 0xe3adfca6, Offset: 0x402b
// Size: 0x7e
function init_animsounds()
{
    level.animsounds = [];
    level.animsound_aliases = [];
    animnames = getarraykeys( level.scr_notetrack );
    
    for ( i = 0; i < animnames.size ; i++ )
    {
        init_notetracks_for_animname( animnames[ i ] );
    }
    
    animnames = getarraykeys( level.scr_animsound );
    
    for ( i = 0; i < animnames.size ; i++ )
    {
        init_animsounds_for_animname( animnames[ i ] );
    }
}

// Namespace animation
// Params 1
// Checksum 0xc149895a, Offset: 0x40b1
// Size: 0xa7
function init_animsounds_for_animname( animname )
{
    animes = getarraykeys( level.scr_animsound[ animname ] );
    
    for ( i = 0; i < animes.size ; i++ )
    {
        anime = animes[ i ];
        soundalias = level.scr_animsound[ animname ][ anime ];
        level.animsound_aliases[ animname ][ anime ][ "#" + anime ][ "soundalias" ] = soundalias;
        level.animsound_aliases[ animname ][ anime ][ "#" + anime ][ "created_by_animSound" ] = 1;
    }
}

// Namespace animation
// Params 1
// Checksum 0xe5be1a0b, Offset: 0x4160
// Size: 0x1a5
function init_notetracks_for_animname( animname )
{
    foreach ( anime, anime_array in level.scr_notetrack[ animname ] )
    {
        foreach ( notetrack, notetrack_array in anime_array )
        {
            foreach ( scr_notetrack in notetrack_array )
            {
                soundalias = scr_notetrack[ "sound" ];
                
                if ( !isdefined( soundalias ) )
                {
                    continue;
                }
                
                level.animsound_aliases[ animname ][ anime ][ notetrack ][ "soundalias" ] = soundalias;
                
                if ( isdefined( scr_notetrack[ "created_by_animSound" ] ) )
                {
                    level.animsound_aliases[ animname ][ anime ][ notetrack ][ "created_by_animSound" ] = 1;
                }
            }
        }
    }
}

// Namespace animation
// Params 2
// Checksum 0x29f32b3a, Offset: 0x430d
// Size: 0xd8
function endonremoveanimactive( endonstring, guypackets )
{
    self waittill( endonstring );
    
    foreach ( guypacket in guypackets )
    {
        guy = guypacket[ "guy" ];
        
        if ( !isdefined( guy ) )
        {
            continue;
        }
        
        visibility_mode::function_4e6c654251b854e0( guy );
        guy._animactive--;
        guy._lastanimtime = gettime();
        assert( guy._animactive >= 0 );
    }
}

// Namespace animation
// Params 2
// Checksum 0xdf43df99, Offset: 0x43ed
// Size: 0x37
function anim_deathnotify( guy, anime )
{
    self endon( anime );
    guy waittill( "death" );
    
    if ( guy.anim_is_death )
    {
        return;
    }
    
    self notify( anime );
}

// Namespace animation
// Params 3
// Checksum 0x5855608, Offset: 0x442c
// Size: 0x3d
function anim_facialendnotify( guy, anime, scriptedfaceanim )
{
    self endon( anime );
    time = getanimlength( scriptedfaceanim );
    wait time;
    self notify( anime );
}

// Namespace animation
// Params 2
// Checksum 0xb2e20649, Offset: 0x4471
// Size: 0x28
function anim_dialogueendnotify( guy, anime )
{
    self endon( anime );
    guy waittill( "single dialogue" );
    self notify( anime );
}

// Namespace animation
// Params 4
// Checksum 0x40a85d23, Offset: 0x44a1
// Size: 0x7e
function anim_animationendnotify( guy, anime, scriptedanimationtime, var_892f0fc4e60907c3 )
{
    self endon( anime );
    guy endon( "death" );
    scriptedanimationtime -= var_892f0fc4e60907c3;
    
    if ( var_892f0fc4e60907c3 > 0 && scriptedanimationtime > 0 )
    {
        guy utility::waittill_match_or_timeout( "single anim", "end", scriptedanimationtime );
        guy stopanimscripted();
    }
    else
    {
        guy waittillmatch( "single anim", "end" );
    }
    
    self notify( anime );
}

// Namespace animation
// Params 2
// Checksum 0x93f7bfc, Offset: 0x4527
// Size: 0xc0
function anim_weight( animname, anime )
{
    assert( isdefined( level.scr_anim[ animname ][ anime ] ), "<dev string:x519>" + anime + "<dev string:x53a>" + animname );
    assert( isarray( level.scr_anim[ animname ][ anime ] ), "<dev string:x54d>" + animname + "<dev string:x579>" + anime + "<dev string:x581>" );
    total_anims = level.scr_anim[ animname ][ anime ].size;
    idleanim = randomint( total_anims );
    
    if ( isdefined( level.scr_anim[ animname ][ anime + "weight" ] ) )
    {
        idleanim = get_weighted_anim( animname, anime, total_anims );
    }
    
    return idleanim;
}

// Namespace animation
// Params 3
// Checksum 0xb0553275, Offset: 0x45f0
// Size: 0x108
function get_weighted_anim( animname, anime, total_anims )
{
    idleanim = undefined;
    
    if ( total_anims > 1 )
    {
        weights = 0;
        anim_weight = 0;
        
        for ( i = 0; i < total_anims ; i++ )
        {
            if ( isdefined( level.scr_anim[ animname ][ anime + "weight" ] ) )
            {
                if ( isdefined( level.scr_anim[ animname ][ anime + "weight" ][ i ] ) )
                {
                    weights++;
                    anim_weight += level.scr_anim[ animname ][ anime + "weight" ][ i ];
                }
            }
        }
        
        if ( weights == total_anims )
        {
            anim_play = randomfloat( anim_weight );
            anim_weight = 0;
            
            for ( i = 0; i < total_anims ; i++ )
            {
                anim_weight += level.scr_anim[ animname ][ anime + "weight" ][ i ];
                
                if ( anim_play < anim_weight )
                {
                    idleanim = i;
                    break;
                }
            }
        }
    }
    
    return idleanim;
}

#using_animtree( "generic_human" );

// Namespace animation
// Params 2
// Checksum 0xad2e599f, Offset: 0x4701
// Size: 0x6a
function play_addtive_head_anim( guy, animation )
{
    guy setanimlimited( %addtive_head_anims, 1, 0.2 );
    guy setanimlimited( animation, 1, 0.2 );
    wait getanimlength( animation );
    guy clearanim( %addtive_head_anims, 0.2 );
    guy clearanim( animation, 0.2 );
}

// Namespace animation
// Params 1
// Checksum 0xf25e032e, Offset: 0x4773
// Size: 0x8c
function get_anim_position( tag )
{
    org = undefined;
    angles = undefined;
    
    if ( isdefined( tag ) )
    {
        org = self gettagorigin( tag );
        angles = self gettagangles( tag );
    }
    else
    {
        org = self.origin;
        angles = self.angles;
        
        if ( !isdefined( angles ) )
        {
            angles = ( 0, 0, 0 );
        }
    }
    
    array = [];
    array[ "angles" ] = angles;
    array[ "origin" ] = org;
    return array;
}

// Namespace animation
// Params 6
// Checksum 0x43c40eac, Offset: 0x4808
// Size: 0x83
function function_bcb776397b6f4ce( xanim, tag, time, baseorigin, baseangles, var_84dbd854571920e7 )
{
    result = self function_69d089914c13dc3a( xanim, tag, time, var_84dbd854571920e7 );
    
    if ( isdefined( result ) )
    {
        result[ "origin" ] = coordtransform( result[ "origin" ], baseorigin, baseangles );
        result[ "angles" ] = combineangles( baseangles, result[ "angles" ] );
    }
    
    return result;
}

// Namespace animation
// Params 2
// Checksum 0xa8867515, Offset: 0x4894
// Size: 0x36
function anim_at_self( entity, tag )
{
    packet = [];
    packet[ "guy" ] = self;
    packet[ "entity" ] = self;
    return packet;
}

// Namespace animation
// Params 2
// Checksum 0x5a24378e, Offset: 0x48d3
// Size: 0x41
function anim_at_entity( entity, tag )
{
    packet = [];
    packet[ "guy" ] = self;
    packet[ "entity" ] = entity;
    packet[ "tag" ] = tag;
    return packet;
}

// Namespace animation
// Params 3
// Checksum 0x9be3cf1c, Offset: 0x491d
// Size: 0x3bb
function assert_existance_of_anim( anime, animname, animation )
{
    if ( !isdefined( self ) )
    {
        return;
    }
    
    if ( isagent( self ) )
    {
        return;
    }
    
    if ( !isdefined( animname ) )
    {
        animname = self.animname;
    }
    
    if ( !isdefined( animname ) )
    {
        assertmsg( "<dev string:x5ca>" + self.classname + "<dev string:x5ea>" );
        return;
    }
    
    has_anim = 0;
    
    if ( isdefined( level.scr_anim[ animname ] ) )
    {
        has_anim = 1;
        
        if ( isdefined( level.scr_anim[ animname ][ anime ] ) )
        {
            return;
        }
    }
    
    has_face = 0;
    
    if ( isdefined( level.scr_face[ animname ] ) )
    {
        has_face = 1;
        
        if ( isdefined( level.scr_face[ animname ][ anime ] ) )
        {
            return;
        }
    }
    
    has_sound = 0;
    
    if ( isdefined( level.scr_sound[ animname ] ) )
    {
        has_sound = 1;
        
        if ( isdefined( level.scr_sound[ animname ][ anime ] ) )
        {
            return;
        }
    }
    
    if ( has_anim || has_sound || has_face )
    {
        if ( has_anim )
        {
            array = getarraykeys( level.scr_anim[ animname ] );
            
            /#
                println( "<dev string:x5ff>" + animname + "<dev string:x61a>" );
                
                foreach ( member in array )
                {
                    println( member );
                }
            #/
        }
        
        if ( has_sound )
        {
            array = getarraykeys( level.scr_sound[ animname ] );
            
            /#
                println( "<dev string:x61f>" + animname + "<dev string:x61a>" );
                
                foreach ( member in array )
                {
                    println( member );
                }
            #/
        }
        
        if ( has_face )
        {
            array = getarraykeys( level.scr_face[ animname ] );
            
            /#
                println( "<dev string:x63e>" + animname + "<dev string:x61a>" );
                
                foreach ( member in array )
                {
                    println( member );
                }
            #/
        }
        
        assertmsg( "<dev string:x65c>" + debug::function_4496bef4cfc0d07( self ) + "<dev string:xfc>" + animname + "<dev string:x110>" + anime + "<dev string:x662>" );
        return;
    }
    
    keys = getarraykeys( level.scr_anim );
    keys = arraycombine( keys, getarraykeys( level.scr_sound ) );
    
    foreach ( key in keys )
    {
        println( key );
    }
    
    assertmsg( "<dev string:x6a5>" + animname + "<dev string:x6b2>" );
}

/#

    // Namespace animation
    // Params 2
    // Checksum 0xc8636bb3, Offset: 0x4ce0
    // Size: 0xeb, Type: dev
    function printloops( guy, anime )
    {
        if ( !isdefined( guy ) )
        {
            return;
        }
        
        guy endon( "<dev string:x6fc>" );
        waittillframeend();
        guy.loops++;
        
        if ( guy.loops > 0 )
        {
            guy.loopanims[ guy.loopanims.size ] = anime;
        }
        
        if ( guy.loops > 1 )
        {
            println( "<dev string:x705>" + guy.animname + "<dev string:x719>" + guy.loops + "<dev string:x722>" );
            
            for ( i = 0; i < guy.loopanims.size ; i++ )
            {
                println( "<dev string:x742>" + guy.loopanims[ i ] );
            }
            
            assertmsg( "<dev string:x74e>" );
        }
    }

    // Namespace animation
    // Params 3
    // Checksum 0x63a73e9b, Offset: 0x4dd3
    // Size: 0x58, Type: dev
    function function_22388de1d368ad59( guy, ender, anime )
    {
        guy endon( "<dev string:x6fc>" );
        self waittill( ender );
        guy.loopanims = arrayremove( guy.loopanims, anime );
        guy.loops--;
    }

#/

// Namespace animation
// Params 2
// Checksum 0x89e31de3, Offset: 0x4e33
// Size: 0x9a
function anim_single_failsafeonguy( owner, anime )
{
    /#
        if ( getdvar( @"hash_27494f1d75fc0809" ) != "<dev string:x791>" )
        {
            return;
        }
        
        owner endon( anime );
        owner endon( "<dev string:x6fc>" );
        self endon( "<dev string:x6fc>" );
        name = self.classname;
        num = self getentitynumber();
        wait 60;
        println( "<dev string:x797>" + name + "<dev string:x7af>" + num );
        waittillframeend();
        assert( 0, "<dev string:x7bf>" + anime + "<dev string:x7ce>" );
    #/
}

// Namespace animation
// Params 2
// Checksum 0x731d3010, Offset: 0x4ed5
// Size: 0x8a
function anim_single_failsafe( guys, anime )
{
    foreach ( guy in guys )
    {
        guy thread anim_single_failsafeonguy( self, anime );
    }
}

// Namespace animation
// Params 2
// Checksum 0x388d5f27, Offset: 0x4f67
// Size: 0x50
function anim_get_goal_time( animname, anime )
{
    if ( isdefined( level.scr_goaltime[ animname ] ) && isdefined( level.scr_goaltime[ animname ][ anime ] ) )
    {
        return level.scr_goaltime[ animname ][ anime ];
    }
    
    return 0.2;
}

// Namespace animation
// Params 1
// Checksum 0xd7839420, Offset: 0x4fbf
// Size: 0x1c
function function_221025fccd3803be( animation )
{
    if ( utility::issp() )
    {
        return 0.5;
    }
    
    return 0;
}

// Namespace animation
// Params 1
// Checksum 0xbcfd0efd, Offset: 0x4fe4
// Size: 0x37, Type: bool
function function_b8e0e318104693fb( anime )
{
    if ( utility::issp() && isdefined( level.scr_entrances ) && level.scr_entrances[ anime ] )
    {
        return true;
    }
    
    return false;
}

// Namespace animation
// Params 2
// Checksum 0x359197dd, Offset: 0x5024
// Size: 0xe5
function function_c5c322095ca966be( guys, anime )
{
    if ( function_b8e0e318104693fb( anime ) && guys.size > 1 )
    {
        foreach ( guy in guys )
        {
            if ( !isdefined( guy.animname ) || !guy function_38c78e116af0cf61( guy.animname ) && !guy function_861174907e3fbdba( guy.animname ) )
            {
                guys = arrayremove( guys, guy );
                guys[ guys.size ] = guy;
            }
        }
    }
    
    return guys;
}

// Namespace animation
// Params 3
// Checksum 0x9b3f7743, Offset: 0x5112
// Size: 0x44
function function_179fdcb8d53829fe( anime, animname, animation )
{
    newanime = anime + "_entrance";
    level.scr_anim[ animname ][ newanime ] = animation;
    return newanime;
}

// Namespace animation
// Params 4
// Checksum 0x67525d0e, Offset: 0x515f
// Size: 0xe2
function function_c662ac26794ce12f( anime, org, angles, animname )
{
    /#
        setdvarifuninitialized( @"hash_4140c00f3efa94c6", 0 );
    #/
    
    if ( function_38c78e116af0cf61( animname ) )
    {
        return function_ec05bbabe0c3c845( anime, org, angles, animname );
    }
    else if ( function_861174907e3fbdba( animname ) )
    {
        return function_6fc6ea53161df7de( anime, org, angles, animname );
    }
    
    if ( !isdefined( level.var_fdce85e9ff138573 ) )
    {
        level.var_fdce85e9ff138573 = 0;
        
        /#
            if ( getdvarint( @"hash_4140c00f3efa94c6", 0 ) )
            {
                iprintln( "<dev string:x803>" );
            }
        #/
    }
    
    if ( isarray( level.scr_anim[ animname ][ anime ] ) )
    {
        return level.scr_anim[ animname ][ anime ][ level.var_fdce85e9ff138573 ];
    }
    
    return level.scr_anim[ animname ][ anime ];
}

// Namespace animation
// Params 4
// Checksum 0x69dd1ce3, Offset: 0x5249
// Size: 0x242
function function_ec05bbabe0c3c845( anime, org, angles, animname )
{
    if ( isdefined( level.var_fdce85e9ff138573 ) && level.var_f9ffc25dbcc85a5b && level.var_f9ffc25dbcc85a5b == gettime() )
    {
        return level.scr_anim[ animname ][ anime ][ level.var_fdce85e9ff138573 ];
    }
    
    closest_anim = 0;
    closest_dist = undefined;
    level.var_fdce85e9ff138573 = undefined;
    
    foreach ( i, animation in level.scr_anim[ animname ][ anime ] )
    {
        neworg = getstartorigin( org, angles, animation );
        
        /#
            if ( getdvarint( @"hash_4140c00f3efa94c6", 0 ) )
            {
                line( self.origin, neworg, ( 1, 1, 1 ), 1, 0, 1000 );
                print3d( neworg + ( 0, 0, 2 ), animation, ( 1, 1, 1 ), 1, 0.075, 1000, 1 );
                print3d( neworg, "<dev string:x82b>", ( 1, 1, 1 ), 1, 0.2, 1000, 1 );
            }
        #/
        
        if ( !isdefined( closest_dist ) )
        {
            closest_dist = distancesquared( neworg, level.player.origin );
            continue;
        }
        
        dist = distancesquared( level.player.origin, neworg );
        
        if ( dist < closest_dist )
        {
            closest_anim = i;
            closest_dist = dist;
        }
    }
    
    animation = level.scr_anim[ animname ][ anime ][ closest_anim ];
    
    /#
        if ( getdvarint( @"hash_4140c00f3efa94c6", 0 ) )
        {
            iprintln( "<dev string:x830>" + animation );
        }
    #/
    
    level.var_f9ffc25dbcc85a5b = gettime();
    level.var_fdce85e9ff138573 = closest_anim;
    return animation;
}

// Namespace animation
// Params 4
// Checksum 0xcdb58b9b, Offset: 0x5494
// Size: 0x59
function function_6fc6ea53161df7de( anime, org, angles, animname )
{
    level.var_fdce85e9ff138573 = undefined;
    animation = level.scr_anim[ animname ][ anime ][ 0 ];
    level.var_fdce85e9ff138573 = 0;
    return animation;
}

// Namespace animation
// Params 1
// Checksum 0xd80aada8, Offset: 0x54f6
// Size: 0x22, Type: bool
function function_861174907e3fbdba( animname )
{
    if ( level.scr_animtree[ animname ] == #animtree )
    {
        return true;
    }
    
    return false;
}

// Namespace animation
// Params 1
// Checksum 0x44b5d2da, Offset: 0x5521
// Size: 0x1f
function function_38c78e116af0cf61( animname )
{
    return [[ anim.callbacks[ "CheckPlayerAnimtree" ] ]]( animname );
}

// Namespace animation
// Params 1
// Checksum 0x1d79b7b0, Offset: 0x5549
// Size: 0x2a
function function_1e45b56fb88a49ff( animation )
{
    if ( !animhasnotetrack( animation, "blend_into" ) )
    {
        return 0;
    }
    
    return utility::get_notetrack_time( animation, "blend_into" );
}

// Namespace animation
// Params 1
// Checksum 0xdaca1b04, Offset: 0x557c
// Size: 0x2a
function function_823734400cf3f21b( animation )
{
    if ( !animhasnotetrack( animation, "blend_out" ) )
    {
        return undefined;
    }
    
    return utility::get_notetrack_time( animation, "blend_out" );
}

// Namespace animation
// Params 1
// Checksum 0x56159589, Offset: 0x55af
// Size: 0x49
function function_665c2978bc67586a( animation )
{
    speed = 128;
    
    if ( animhasnotetrack( animation, "blend_speed = walk" ) )
    {
        speed = 128;
    }
    else if ( animhasnotetrack( animation, "blend_speed = run" ) )
    {
        speed = 145;
    }
    
    return speed * 0.7;
}

// Namespace animation
// Params 1
// Checksum 0x61610969, Offset: 0x5601
// Size: 0xd9
function function_42bfba55ba08d414( animation )
{
    stances = [];
    
    if ( animhasnotetrack( animation, "start_stance = stand" ) )
    {
        stances[ stances.size ] = "stand";
    }
    else if ( animhasnotetrack( animation, "start_stance = crouch" ) )
    {
        stances[ stances.size ] = "crouch";
    }
    else if ( animhasnotetrack( animation, "start_stance = prone" ) )
    {
        stances[ stances.size ] = "prone";
    }
    else
    {
        stances[ stances.size ] = "none";
    }
    
    if ( animhasnotetrack( animation, "end_stance = stand" ) )
    {
        stances[ stances.size ] = "stand";
    }
    else if ( animhasnotetrack( animation, "end_stance = crouch" ) )
    {
        stances[ stances.size ] = "crouch";
    }
    else if ( animhasnotetrack( animation, "end_stance = prone" ) )
    {
        stances[ stances.size ] = "prone";
    }
    else
    {
        stances[ stances.size ] = "none";
    }
    
    return stances;
}

// Namespace animation
// Params 7
// Checksum 0xfe1f7eb5, Offset: 0x56e3
// Size: 0x1f6
function function_7722e93889a8baa8( playerpos, animstartpos, blendspeed, blendintotime, var_a264bf3497092f5a = 1, var_6bc01e70cc97e942 = 0, simultaneous = 0 )
{
    assert( !( var_a264bf3497092f5a && var_6bc01e70cc97e942 ), "<dev string:x84a>" );
    
    if ( var_a264bf3497092f5a )
    {
        weapondroptime = level.player getgestureanimlength( "proto_vm_gesture_gun_drop" );
    }
    else if ( var_6bc01e70cc97e942 )
    {
        weapondroptime = 0.5;
    }
    else
    {
        weapondroptime = 0;
    }
    
    weapondropquick = 0;
    
    if ( simultaneous )
    {
        weapondropquick = 1;
        weapondroptime = 0;
    }
    else if ( level.player getdemeanorviewmodel() == "relaxed" )
    {
        weapondropquick = 1;
        weapondroptime = 0.2;
    }
    
    blendtimecalc = distance2d( playerpos, animstartpos ) / blendspeed;
    idealblendtime = blendintotime + weapondroptime;
    
    /#
        if ( getdvarint( @"hash_398da46238160a6", 0 ) )
        {
            iprintln( "<dev string:x890>" + blendtimecalc );
        }
    #/
    
    if ( blendintotime > 0 )
    {
        frac = blendtimecalc / idealblendtime;
        
        if ( frac < 1.4 && frac > 0.4 )
        {
            blendtime = idealblendtime;
        }
        else if ( blendtimecalc < blendintotime )
        {
            blendtime = blendintotime < 1 ? blendintotime + weapondroptime : 1 + weapondroptime;
        }
        else if ( blendtimecalc > 0.5 )
        {
            blendtime = blendtimecalc;
        }
        else
        {
            blendtime = 0.5;
        }
    }
    else
    {
        blendtime = 0.5;
    }
    
    if ( blendtime > idealblendtime )
    {
        /#
            if ( getdvarint( @"hash_398da46238160a6", 0 ) )
            {
                iprintln( "<dev string:x8aa>" );
            }
        #/
        
        weapondroptime = blendtime - blendintotime;
    }
    
    level.blendinfo[ "weaponDropQuick" ] = weapondropquick;
    level.blendinfo[ "weaponDropTime" ] = weapondroptime;
    return blendtime;
}

// Namespace animation
// Params 7
// Checksum 0x4c03bdd8, Offset: 0x58e2
// Size: 0x21f
function function_aa818156be1260ae( playerpos, animstartpos, blendspeed, blendintotime, var_a264bf3497092f5a = 1, var_6bc01e70cc97e942 = 0, simultaneous = 0 )
{
    if ( !var_6bc01e70cc97e942 )
    {
        quickdroptime = 0;
        normaldroptime = 0;
    }
    else
    {
        quickdroptime = 0.2;
        
        if ( var_a264bf3497092f5a )
        {
            normaldroptime = level.player getgestureanimlength( "proto_vm_gesture_gun_drop" );
        }
        else
        {
            normaldroptime = 0.5;
        }
    }
    
    blendtime = distance2d( playerpos, animstartpos ) / blendspeed;
    
    /#
        if ( getdvarint( @"hash_398da46238160a6", 0 ) )
        {
            iprintln( "<dev string:x890>" + blendtime );
        }
    #/
    
    idealblendtime = blendintotime + normaldroptime;
    
    if ( idealblendtime > 0 )
    {
        frac = blendtime / idealblendtime;
        
        if ( frac < 1.4 && frac > 0.4 )
        {
            blendtime = idealblendtime;
        }
        else if ( blendtime < blendintotime )
        {
            blendtime = blendintotime <= 1 ? blendintotime : 1;
        }
    }
    
    if ( var_a264bf3497092f5a && var_6bc01e70cc97e942 )
    {
        blendtime = blendtime < normaldroptime ? normaldroptime : blendtime;
    }
    else if ( !var_6bc01e70cc97e942 )
    {
        blendtime = blendtime < 0.5 ? 0.5 : blendtime;
    }
    else
    {
        blendtime = blendtime < quickdroptime ? quickdroptime : blendtime;
    }
    
    weapondropquick = 0;
    weapondroptime = normaldroptime;
    
    if ( blendtime < normaldroptime || level.player getdemeanorviewmodel() == "relaxed" )
    {
        weapondropquick = 1;
        weapondroptime = quickdroptime;
    }
    else if ( blendtime > idealblendtime )
    {
        /#
            if ( getdvarint( @"hash_398da46238160a6", 0 ) )
            {
                iprintln( "<dev string:x8aa>" );
            }
        #/
        
        weapondroptime = blendtime - blendintotime;
    }
    
    if ( simultaneous )
    {
        weapondropquick = 1;
        weapondroptime = 0;
    }
    
    level.blendinfo[ "weaponDropQuick" ] = weapondropquick;
    level.blendinfo[ "weaponDropTime" ] = weapondroptime;
    return blendtime;
}

// Namespace animation
// Params 5
// Checksum 0xba3a9245, Offset: 0x5b0a
// Size: 0x83
function function_164e271703d2775b( anime, animname, var_a264bf3497092f5a, var_6bc01e70cc97e942, simultaneous )
{
    if ( function_b8e0e318104693fb( anime ) )
    {
        animation = function_c662ac26794ce12f( anime, self.origin, self.angles, animname );
    }
    else
    {
        animation = level.scr_anim[ animname ][ anime ];
    }
    
    function_53dcb1bbf4af9078( animation, var_a264bf3497092f5a, var_6bc01e70cc97e942, simultaneous );
}

// Namespace animation
// Params 4
// Checksum 0xf0e3941e, Offset: 0x5b95
// Size: 0x1b2
function function_53dcb1bbf4af9078( animation, var_a264bf3497092f5a, var_6bc01e70cc97e942, simultaneous )
{
    animpos = getstartorigin( self.origin, self.angles, animation );
    level.blendinfo = [];
    blendintotime = function_1e45b56fb88a49ff( animation );
    blendouttime = function_823734400cf3f21b( animation );
    blendspeed = function_665c2978bc67586a( animation );
    blendtime = function_7722e93889a8baa8( level.player.origin, animpos, blendspeed, blendintotime, var_a264bf3497092f5a, var_6bc01e70cc97e942, simultaneous );
    stances = function_42bfba55ba08d414( animation );
    level.blendinfo[ "blendIntoTime" ] = blendintotime;
    level.blendinfo[ "blendOutTime" ] = blendouttime;
    level.blendinfo[ "blendSpeed" ] = blendspeed;
    level.blendinfo[ "blendTime" ] = blendtime;
    level.blendinfo[ "stances" ] = stances;
    
    /#
        if ( getdvarint( @"hash_398da46238160a6", 0 ) )
        {
            iprintln( "<dev string:x8fe>" + blendtime );
            iprintln( "<dev string:x90d>" + blendintotime );
            
            if ( isdefined( blendouttime ) )
            {
                iprintln( "<dev string:x920>" + blendouttime );
            }
            
            iprintln( "<dev string:x932>" + level.blendinfo[ "<dev string:x946>" ] );
            iprintln( "<dev string:x958>" + level.blendinfo[ "<dev string:x965>" ][ 0 ] + "<dev string:x970>" + level.blendinfo[ "<dev string:x965>" ][ 1 ] );
        }
    #/
}

// Namespace animation
// Params 1
// Checksum 0x7d8156d5, Offset: 0x5d4f
// Size: 0x39
function function_708aa0b1c23391a6( bool )
{
    assert( isdefined( bool ), "<dev string:x976>" );
    
    if ( bool )
    {
        self.animscripted_collision = 1;
        return;
    }
    
    self.animscripted_collision = undefined;
}

// Namespace animation
// Params 0
// Checksum 0x6cfd4a8, Offset: 0x5d90
// Size: 0x12, Type: bool
function function_6ee84ba29eeda4f()
{
    if ( self.animscripted_collision )
    {
        return true;
    }
    
    return false;
}

// Namespace animation
// Params 3
// Checksum 0x918fa5, Offset: 0x5dab
// Size: 0xa0
function function_bbb72e6208fc69de( bool, velocityent, blendtime )
{
    assert( isdefined( bool ), "<dev string:x976>" );
    
    if ( bool )
    {
        assert( isdefined( velocityent ), "<dev string:x98b>" );
        self.var_fe8beb30bba8c60 = 1;
        self.var_3325f472467aa60e = velocityent getvelocity();
        
        if ( isdefined( blendtime ) )
        {
            self.var_77863a8248f2d1d2 = blendtime;
        }
        else
        {
            self.var_77863a8248f2d1d2 = 0.2;
        }
        
        return;
    }
    
    self.var_fe8beb30bba8c60 = undefined;
    self.var_3325f472467aa60e = undefined;
    self.var_77863a8248f2d1d2 = undefined;
}

// Namespace animation
// Params 0
// Checksum 0x785fd0a5, Offset: 0x5e53
// Size: 0x2d, Type: bool
function function_1d2dd6f111ac6b37()
{
    if ( isdefined( self.var_3325f472467aa60e ) && self.var_fe8beb30bba8c60 && isdefined( self.var_77863a8248f2d1d2 ) )
    {
        return true;
    }
    
    return false;
}

// Namespace animation
// Params 2
// Checksum 0x8bce90f0, Offset: 0x5e89
// Size: 0xd5
function function_efd9be1f011e00d7( animcategory, animindex )
{
    assert( isdefined( animcategory ) && isdefined( animindex ), "<dev string:x9ad>" );
    animlength = 0;
    
    if ( isdefined( level.scr_animlength[ animcategory ] ) && isdefined( level.scr_animlength ) && isdefined( level.scr_animlength[ animcategory ][ animindex ] ) )
    {
        animlength = level.scr_animlength[ animcategory ][ animindex ];
    }
    else if ( isdefined( level.scr_anim[ animcategory ] ) && isdefined( level.scr_anim ) && isdefined( level.scr_anim[ animcategory ][ animindex ] ) )
    {
        animlength = getanimlength( level.scr_anim[ animcategory ][ animindex ] );
    }
    else
    {
        assertmsg( "<dev string:x9e6>" );
    }
    
    return animlength;
}

/#

    // Namespace animation
    // Params 0
    // Checksum 0xd6ceed3c, Offset: 0x5f67
    // Size: 0x16e, Type: dev
    function function_2cff1618834b2ab7()
    {
        if ( getdvarint( @"nodebug", 0 ) >= 1 )
        {
            return;
        }
        
        while ( true )
        {
            requestflag = getdvarint( @"hash_300079a74221ae45", 0 );
            
            if ( requestflag != 0 )
            {
                origin = ( 0, 0, 0 );
                angles = ( 0, 0, 0 );
                align_target = getdvar( @"hash_43022f85e8f590a5" );
                align_tag = getdvar( @"hash_9dfd128a6efc97b4" );
                aligntarget = utility::getent_or_struct( align_target, "<dev string:xa72>" );
                
                if ( isdefined( aligntarget ) )
                {
                    if ( isdefined( aligntarget.origin ) )
                    {
                        origin = aligntarget.origin;
                    }
                    
                    if ( isdefined( aligntarget.angles ) )
                    {
                        angles = aligntarget.angles;
                    }
                }
                
                setdvar( @"hash_aac2e2e60bc546c8", origin[ 0 ] );
                setdvar( @"hash_aac2e3e60bc548fb", origin[ 1 ] );
                setdvar( @"hash_aac2e4e60bc54b2e", origin[ 2 ] );
                setdvar( @"hash_8961ba30d631ddb0", angles[ 0 ] );
                setdvar( @"hash_8961bb30d631dfe3", angles[ 1 ] );
                setdvar( @"hash_8961bc30d631e216", angles[ 2 ] );
                setdvar( @"hash_300079a74221ae45", 0 );
            }
            
            waitframe();
        }
    }

    // Namespace animation
    // Params 0
    // Checksum 0x6fc5550d, Offset: 0x60dd
    // Size: 0x1c9, Type: dev
    function function_95203209b32581ca()
    {
        if ( getdvarint( @"nodebug", 0 ) >= 1 )
        {
            return;
        }
        
        while ( true )
        {
            requestflag = getdvarint( @"hash_2c086d284345ecd4", 0 );
            
            if ( requestflag != 0 )
            {
                var_f2913efe9015051c = getdvar( @"hash_e5834102b73a09bb" );
                var_282a59898f087e15 = getdvar( @"hash_af17ebf34f961ade" );
                targets = strtok( var_f2913efe9015051c, "<dev string:xa80>" );
                
                foreach ( targetname in targets )
                {
                    foundentities = getentarray( targetname, "<dev string:xa72>" );
                    foundentities = arraycombine( foundentities, getentarray( targetname, "<dev string:xa87>" ) );
                    utility::array_call( foundentities, &hide );
                }
                
                targets = strtok( var_282a59898f087e15, "<dev string:xa80>" );
                
                foreach ( targetname in targets )
                {
                    foundentities = getentarray( targetname, "<dev string:xa72>" );
                    foundentities = arraycombine( foundentities, getentarray( targetname, "<dev string:xa87>" ) );
                    utility::array_call( foundentities, &show );
                }
                
                setdvar( @"hash_2c086d284345ecd4", 0 );
            }
            
            waitframe();
        }
    }

#/

// Namespace animation
// Params 2
// Checksum 0xc6db78aa, Offset: 0x62ae
// Size: 0x32
function function_91a1da37e0f88ea8( guys_with_anims, speed_baseline )
{
    thread anim_reach_speed_control( guys_with_anims, speed_baseline );
    anim_reach_with_funcs_guys_with_anims( guys_with_anims, &reach_with_standard_adjustments_begin, &reach_with_standard_adjustments_end );
}

// Namespace animation
// Params 7
// Checksum 0x49a7428f, Offset: 0x62e8
// Size: 0x19b
function anim_reach_with_funcs( guys, anime, tag, animname_override, start_func, end_func, arrival_type )
{
    array = get_anim_position( tag );
    alignmentinfo = spawnstruct();
    alignmentinfo.origin = array[ "origin" ];
    alignmentinfo.angles = array[ "angles" ];
    guys_with_anims = [];
    
    foreach ( guy in guys )
    {
        if ( isdefined( animname_override ) )
        {
            animname = animname_override;
        }
        else
        {
            animname = guy.animname;
        }
        
        animation = undefined;
        
        if ( isdefined( level.scr_anim[ animname ][ anime ] ) )
        {
            if ( isarray( level.scr_anim[ animname ][ anime ] ) )
            {
                animation = level.scr_anim[ animname ][ anime ][ 0 ];
            }
            else
            {
                animation = level.scr_anim[ animname ][ anime ];
            }
        }
        
        guys_with_anims[ guys_with_anims.size ] = [ guy, animation, alignmentinfo ];
    }
    
    anim_reach_with_funcs_guys_with_anims( guys_with_anims, start_func, end_func, arrival_type );
}

// Namespace animation
// Params 4
// Checksum 0xaa440d23, Offset: 0x648b
// Size: 0x37f
function anim_reach_with_funcs_guys_with_anims( guys_with_anims, start_func, end_func, arrival_type )
{
    ent = spawnstruct();
    
    /#
        debugstartpos = getdvar( @"hash_34dab4f8f3a04f4a" ) == "<dev string:x791>";
    #/
    
    threads = 0;
    guys = [];
    
    foreach ( guy_anim in guys_with_anims )
    {
        guy = guy_anim[ 0 ];
        animation = guy_anim[ 1 ];
        alignment = guy_anim[ 2 ];
        var_34d989e54c91b28 = guy_anim[ 3 ];
        startorg = self.origin;
        startangles = self.angles;
        
        if ( isdefined( alignment ) )
        {
            startorg = alignment.origin;
            startangles = alignment.angles;
        }
        
        if ( isdefined( animation ) )
        {
            animorg = getstartorigin( startorg, startangles, animation );
            animangles = getstartangles( startorg, startangles, animation );
            startorg = animorg;
            startangles = animangles;
        }
        
        if ( !isdefined( var_34d989e54c91b28 ) )
        {
            var_34d989e54c91b28 = arrival_type;
        }
        
        if ( isdefined( var_34d989e54c91b28 ) )
        {
            if ( isdefined( guy.scriptedarrivalent ) )
            {
                guy.scriptedarrivalent delete();
                guy.scriptedarrivalent = undefined;
            }
            
            guy.scriptedarrivalent = spawn( "script_origin", startorg );
            guy.scriptedarrivalent.targetname = "anim_reach_with_funcs_guys_with_anims";
            guy.scriptedarrivalent.angles = startangles;
            guy.scriptedarrivalent.type = var_34d989e54c91b28;
            guy.scriptedarrivalent.arrivalstance = "stand";
            guy.forcenextpathfindimmediate = 1;
            
            if ( isplayer( guy ) || isactor( guy ) )
            {
                platform = guy getmovingplatformparent();
                
                if ( isdefined( platform ) )
                {
                    guy.scriptedarrivalent linkto( platform );
                }
            }
        }
        
        threads++;
        guy thread begin_anim_reach( ent, startorg, startangles, start_func, end_func );
    }
    
    while ( threads )
    {
        ent waittill( "reach_notify" );
        threads--;
    }
    
    /#
        if ( debugstartpos )
        {
            level notify( "<dev string:xa9c>" + "<dev string:xaa1>" );
        }
    #/
    
    foreach ( guy_anim in guys_with_anims )
    {
        guy = guy_anim[ 0 ];
        
        if ( !isalive( guy ) )
        {
            continue;
        }
        
        guy.goalradius = guy.oldgoalradius;
        
        if ( isdefined( guy.scriptedarrivalent ) )
        {
            guy.scriptedarrivalent delete();
            guy.scriptedarrivalent = undefined;
        }
        
        guy.stopanimdistsq = 0;
    }
}

// Namespace animation
// Params 1, eflags: 0x4
// Checksum 0x66b7a5b, Offset: 0x6812
// Size: 0x44
function private reach_death_notify( ent )
{
    utility::waittill_any( "death", "goal" );
    
    while ( isalive( self ) && self.arriving )
    {
        wait 0.05;
    }
    
    ent notify( "reach_notify" );
}

// Namespace animation
// Params 5, eflags: 0x4
// Checksum 0xeae07afb, Offset: 0x685e
// Size: 0x11d
function private begin_anim_reach( ent, startorg, startangles, start_func, end_func )
{
    self endon( "death" );
    self endon( "new_anim_reach" );
    thread reach_death_notify( ent );
    startorg = [[ start_func ]]( startorg, startangles );
    points = [];
    
    if ( !( isdefined( self.scriptedarrivalent ) && isdefined( self.scriptedarrivalent.type ) ) && distance2dsquared( startorg, self.origin ) > 2500 )
    {
        forward = anglestoforward( startangles );
        var_13a1ba1966151a3a = startorg - forward * 50;
        
        if ( navisstraightlinereachable( startorg, var_13a1ba1966151a3a, self ) )
        {
            points[ points.size ] = var_13a1ba1966151a3a;
        }
    }
    
    points[ points.size ] = startorg;
    self setgoalpath( points );
    self.reach_goal_pos = startorg;
    self.goalradius = 0;
    self.stopanimdistsq = squared( 120 );
    self waittill( "goal" );
    self notify( "anim_reach_complete" );
    [[ end_func ]]();
    self notify( "new_anim_reach" );
}

// Namespace animation
// Params 3
// Checksum 0x6950fffc, Offset: 0x6983
// Size: 0x64a
function anim_reach_speed_control( guys_with_anims, speed_baseline, var_b5dae1c694158f04 )
{
    waittillframeend();
    
    if ( !isdefined( speed_baseline ) )
    {
        speed_baseline = 140;
    }
    
    if ( !isdefined( var_b5dae1c694158f04 ) )
    {
        var_b5dae1c694158f04 = 4;
    }
    
    foreach ( index, guy_anim in guys_with_anims )
    {
        guy = guy_anim[ 0 ];
        var_34d989e54c91b28 = guy_anim[ 3 ];
        moving_destination = var_34d989e54c91b28 == "Exposed Moving";
        track_speed = moving_destination;
        
        /#
            track_speed = track_speed || getdvarint( @"scr_debug_reach" );
        #/
        
        if ( track_speed )
        {
            guy childthread anim_reach_speed_control_avg( var_b5dae1c694158f04, speed_baseline );
        }
        
        guy aisetdesiredspeed( speed_baseline );
    }
    
    while ( true )
    {
        furthestguy = undefined;
        furthestdist = 0;
        dist = [];
        dist_normal = [];
        remove = [];
        
        foreach ( index, guy_anim in guys_with_anims )
        {
            guy = guy_anim[ 0 ];
            
            if ( !isalive( guy ) )
            {
                remove[ remove.size ] = index;
                continue;
            }
            
            dist[ index ] = guy pathdisttogoal();
            
            if ( dist[ index ] == 0 )
            {
                pos = guy.goalpos;
                
                if ( isdefined( guy.reach_goal_pos ) )
                {
                    pos = guy.reach_goal_pos;
                }
                
                dist[ index ] = distance( guy.origin, pos );
            }
            
            if ( dist[ index ] <= 4 )
            {
                remove[ remove.size ] = index;
                continue;
            }
            
            if ( dist[ index ] > furthestdist )
            {
                furthestguy = guy;
                furthestdist = dist[ index ];
            }
        }
        
        foreach ( index in remove )
        {
            guy = guys_with_anims[ index ][ 0 ];
            
            if ( isalive( guy ) )
            {
                guy val::reset_all( "anim_reach_speed_control" );
                guy enableavoidance( 1, 1 );
                guy.reachspeed = undefined;
                guy notify( "anim_reach_speed_control_avg" );
            }
            
            guys_with_anims[ index ] = undefined;
        }
        
        if ( guys_with_anims.size == 0 )
        {
            break;
        }
        
        foreach ( index, guy_anim in guys_with_anims )
        {
            guy = guy_anim[ 0 ];
            var_34d989e54c91b28 = guy_anim[ 3 ];
            moving_destination = var_34d989e54c91b28 == "Exposed Moving";
            
            if ( dist[ index ] < 96 )
            {
                guy enableavoidance( 0, 0 );
            }
            
            dist_normal[ index ] = dist[ index ] / furthestdist;
            speedscale = 1;
            
            if ( furthestguy != guy )
            {
                if ( moving_destination && dist[ index ] <= 16 )
                {
                    speedscale = min( 1, guy.reachspeed.speed_avg + 0.05 );
                }
                else
                {
                    speedscale = max( dist_normal[ index ], 0.4 );
                }
            }
            
            desiredspeed = speedscale * speed_baseline;
            
            /#
                if ( getdvarint( @"scr_debug_reach" ) )
                {
                    if ( furthestguy == guy )
                    {
                        print3d( guy.origin + ( 0, 0, 36 ), "<dev string:xab3>", ( 0, 1, 0 ), 1, 0.3, 1, 1 );
                    }
                    
                    line( guy.origin, guy.goalpos, ( 1, 1, 1 ), 1, 0, 1 );
                    print3d( guy.origin, "<dev string:xabf>" + int( speed_baseline ), ( 0, 1, 0 ), 1, 0.3, 1, 1 );
                    print3d( guy.origin + ( 0, 0, 10 ), "<dev string:xabf>" + int( desiredspeed ), ( 1, 1, 1 ), 1, 0.3, 1, 1 );
                    
                    if ( isdefined( guy.reachspeed ) )
                    {
                        print3d( guy.origin + ( 0, 0, 20 ), "<dev string:xabf>" + int( guy.reachspeed.speed_avg ), ( 0, 1, 1 ), 1, 0.3, 1, 1 );
                    }
                    
                    print3d( guy.origin + ( 0, 0, 80 ), string( speedscale ), ( 0, 0, 1 ), 1, 0.3, 1, 1 );
                    print3d( guy.goalpos + ( 0, 0, 12 ), "<dev string:xabf>" + int( dist[ index ] ), ( 0, 0, 1 ), 1, 1, 1, 1 );
                    sphere( guy.goalpos, 16 );
                }
            #/
            
            switch ( guy getdemeanor() )
            {
                case #"hash_186d745a92c317d9":
                case #"hash_9128327eb51e0b7b":
                    guy val::set( "anim_reach_speed_control", "move_speed_scale", speedscale );
                    guy val::reset( "anim_reach_speed_control", "desired_speed" );
                    break;
                default:
                    guy val::set( "anim_reach_speed_control", "desired_speed", desiredspeed );
                    guy val::reset( "anim_reach_speed_control", "move_speed_scale" );
                    break;
            }
        }
        
        waitframe();
    }
}

// Namespace animation
// Params 2
// Checksum 0x3f2ff51d, Offset: 0x6fd5
// Size: 0x13f
function anim_reach_speed_control_avg( var_b5dae1c694158f04, speed_baseline )
{
    self endon( "death" );
    self notify( "anim_reach_speed_control_avg" );
    self endon( "anim_reach_speed_control_avg" );
    self.reachspeed = spawnstruct();
    reachspeed = self.reachspeed;
    reachspeed.speed_avg = speed_baseline;
    reachspeed.speed_samples = [];
    reachspeed.speed_total = 0;
    curr = 0;
    
    while ( true )
    {
        index = curr % int( var_b5dae1c694158f04 );
        curr++;
        
        if ( isdefined( reachspeed.speed_samples[ index ] ) )
        {
            reachspeed.speed_total -= reachspeed.speed_samples[ index ];
        }
        
        reachspeed.speed_samples[ index ] = length( self.velocity );
        reachspeed.speed_total += reachspeed.speed_samples[ index ];
        reachspeed.speed_avg = reachspeed.speed_total / reachspeed.speed_samples.size;
        waitframe();
    }
}

// Namespace animation
// Params 2
// Checksum 0xc59c0cd9, Offset: 0x711c
// Size: 0x47
function reach_with_standard_adjustments_begin( startorg, startangles )
{
    assert( isdefined( anim.callbacks[ "<dev string:xac3>" ] ), "<dev string:xaec>" );
    return self [[ anim.callbacks[ "reach_with_standard_adjustments_begin" ] ]]( startorg, startangles );
}

// Namespace animation
// Params 0
// Checksum 0xc59c0cdf, Offset: 0x716c
// Size: 0x32
function reach_with_standard_adjustments_end()
{
    assert( isdefined( anim.callbacks[ "<dev string:xb5e>" ] ), "<dev string:xb85>" );
    self [[ anim.callbacks[ "reach_with_standard_adjustments_end" ] ]]();
}

