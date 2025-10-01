#using scripts\common\utility;
#using scripts\engine\math;
#using scripts\engine\trace;
#using scripts\engine\utility;

#namespace dof;

// Namespace dof
// Params 0
// Checksum 0xab465f0, Offset: 0x263
// Size: 0x24a
function function_55904422b4033469()
{
    version = getbuildversion();
    
    if ( version == "SHIP" )
    {
        return;
    }
    
    dvarclientnum = @"hash_7dc7c389e33f9f1c";
    setdvarifuninitialized( dvarclientnum, 0 );
    dvarenable = @"hash_8ab43a47c4399064";
    setdvarifuninitialized( dvarenable, 0 );
    dvarfstop = @"hash_d4c10f4069a2675f";
    setdvarifuninitialized( dvarfstop, 1.2 );
    dvarfocusspeed = @"hash_20eee357db89fae8";
    setdvarifuninitialized( dvarfocusspeed, 5 );
    dvaraperturespeed = @"hash_39ab5edeb8210902";
    setdvarifuninitialized( dvaraperturespeed, 5 );
    values = [];
    values[ dvarfstop ] = -1;
    values[ dvarfocusspeed ] = -1;
    values[ dvaraperturespeed ] = -1;
    clientnum = -1;
    var_5dc6e6a7bf36cb90 = 0;
    
    while ( true )
    {
        wait 1;
        
        if ( !getdvarint( dvarenable ) )
        {
            if ( var_5dc6e6a7bf36cb90 )
            {
                var_5dc6e6a7bf36cb90 = 0;
                level notify( "stop_dyndof" );
                level.dyndof.player disablephysicaldepthoffieldscripting();
            }
            
            continue;
        }
        
        if ( utility::ismp() && getdvarint( dvarclientnum ) != clientnum )
        {
            while ( true )
            {
                clientnum = getdvarint( dvarclientnum );
                
                if ( isdefined( function_b38661f50c4f17c7( clientnum ) ) )
                {
                    break;
                }
                
                waitframe();
            }
            
            function_994f6119a93a14a8( function_b38661f50c4f17c7( clientnum ) );
        }
        
        dvarchanged = 0;
        
        foreach ( dvar, val in values )
        {
            if ( val != getdvarfloat( dvar ) )
            {
                dvarchanged = 1;
                break;
            }
        }
        
        if ( dvarchanged || !var_5dc6e6a7bf36cb90 )
        {
            fstop = getdvarfloat( dvarfstop );
            focusspeed = getdvarfloat( dvarfocusspeed );
            aperturespeed = getdvarfloat( dvaraperturespeed );
            values[ dvarfstop ] = fstop;
            values[ dvarfocusspeed ] = focusspeed;
            values[ dvaraperturespeed ] = aperturespeed;
            var_5dc6e6a7bf36cb90 = 1;
            level thread dyndofexp_internal( fstop, focusspeed, aperturespeed );
        }
    }
}

// Namespace dof
// Params 1, eflags: 0x4
// Checksum 0x87378d10, Offset: 0x4b5
// Size: 0xaa
function private function_994f6119a93a14a8( player )
{
    if ( !isdefined( level.dyndof ) )
    {
        return;
    }
    
    if ( !isdefined( player ) )
    {
        return;
    }
    
    level.dyndof notify( "new_player" );
    
    if ( isdefined( level.dyndof.player ) )
    {
        level.dyndof.player disablephysicaldepthoffieldscripting();
        player enablephysicaldepthoffieldscripting();
    }
    
    level.dyndof.player = player;
    level.dyndof.ignorelist = [ player ];
    
    if ( utility::ismp() )
    {
        thread function_246cecf019f00b87();
    }
}

// Namespace dof
// Params 0, eflags: 0x4
// Checksum 0x56436575, Offset: 0x567
// Size: 0xb2
function private function_246cecf019f00b87()
{
    level.dyndof endon( "new_player" );
    level.dyndof.player endon( "disconnected" );
    
    while ( true )
    {
        level.dyndof.player waittill( "death" );
        
        if ( !isdefined( level.dyndof.player ) )
        {
            return;
        }
        
        level.dyndof.player waittill( "spawned" );
        
        if ( !isdefined( level.dyndof.player ) )
        {
            return;
        }
        
        level.dyndof.player enablephysicaldepthoffieldscripting();
    }
}

// Namespace dof
// Params 1, eflags: 0x4
// Checksum 0xb687fdc5, Offset: 0x621
// Size: 0x8c
function private function_b38661f50c4f17c7( num )
{
    foreach ( player in level.players )
    {
        if ( player getentitynumber() == num )
        {
            return player;
        }
    }
    
    return undefined;
}

// Namespace dof
// Params 3
// Checksum 0x3b219a56, Offset: 0x6b6
// Size: 0x60
function function_deb0a0d97775beae( fstop, focusspeed, aperturespeed )
{
    level.dyndof.fstop = fstop;
    level.dyndof.focusspeed = focusspeed;
    level.dyndof.aperturespeed = aperturespeed;
}

// Namespace dof
// Params 3
// Checksum 0x2fd03a4f, Offset: 0x71e
// Size: 0x221
function dyndofexp_internal( fstop, focusspeed, aperturespeed )
{
    if ( isdefined( level.dyndof ) )
    {
        function_deb0a0d97775beae( fstop, focusspeed, aperturespeed );
        return;
    }
    
    assert( isdefined( fstop ), "<dev string:x24>" );
    
    if ( !isdefined( focusspeed ) )
    {
        focusspeed = 1;
    }
    
    if ( !isdefined( aperturespeed ) )
    {
        aperturespeed = 2;
    }
    
    level notify( "stop_dyndof" );
    
    /#
        setdvarifuninitialized( @"hash_ad68aff4b57edc12", 0 );
    #/
    
    if ( !utility::flag_exist( "dyndofexp_disable" ) )
    {
        utility::flag_init( "dyndofexp_disable" );
    }
    
    if ( isdefined( level.dyndof ) )
    {
        level.dyndof = undefined;
        level notify( "stop_dyndof" );
    }
    
    level.dyndof = function_b449438cb37f4f5e();
    function_deb0a0d97775beae( fstop, focusspeed, aperturespeed );
    level.dyndof.nextcosfov = -1;
    level.dyndof.fstopnear = 3.5;
    level.dyndof.var_505061aa0ace067e = 30;
    level.dyndof.var_502d73aa0aa7e65c = 72;
    level.dyndof.focusspeedmin = focusspeed * 5;
    level.dyndof.focusspeeddistmin = 30;
    level.dyndof.focusspeeddistmax = 72;
    level.dyndof.playerbasefovdvar = 0;
    level.dyndof.issp = utility::issp();
    
    if ( level.dyndof.issp )
    {
        setsaveddvar( @"hash_62c917f9692eb820", 1 );
        function_994f6119a93a14a8( level.player );
    }
    else
    {
        function_994f6119a93a14a8( function_b38661f50c4f17c7( getdvarint( @"hash_7dc7c389e33f9f1c" ) ) );
    }
    
    level.dyndof.player enablephysicaldepthoffieldscripting();
    function_3691871790cd5f55();
    function_47e739b5c004012d();
    level thread dyndofexp_thread();
}

// Namespace dof
// Params 0
// Checksum 0x2c5140d6, Offset: 0x947
// Size: 0x87
function function_b449438cb37f4f5e()
{
    struct = spawnstruct();
    struct.maxfocusdist = 50000;
    struct.contents = dyndofexp_contents();
    struct.var_ee72f202f6e55c55 = function_1af3b09473549a37();
    struct.traceangle = 3;
    struct.prevangles = ( 0, 0, 0 );
    struct.prevorigin = ( 0, 0, 0 );
    return struct;
}

// Namespace dof
// Params 0
// Checksum 0x2639d74f, Offset: 0x9d7
// Size: 0x54
function dyndofexp_contents()
{
    contents = [ "physicscontents_ainoshoot", "physicscontents_clipshot", "physicscontents_item", "physicscontents_solid", "physicscontents_vehicle", "physicscontents_water", "physicscontents_characterproxy" ];
    return physics_createcontents( contents );
}

// Namespace dof
// Params 0
// Checksum 0xc905bcc6, Offset: 0xa34
// Size: 0x4b
function function_1af3b09473549a37()
{
    contents = [ "physicscontents_ainoshoot", "physicscontents_clipshot", "physicscontents_item", "physicscontents_solid", "physicscontents_vehicle", "physicscontents_water" ];
    return physics_createcontents( contents );
}

// Namespace dof
// Params 0
// Checksum 0x7dede622, Offset: 0xa88
// Size: 0x313
function dyndofexp_thread()
{
    level endon( "stop_dyndof" );
    var_86523488c9d4988a = gettime() + 500;
    currentplayerfov = level.dyndof.playerbasefovdvar;
    setdvarifuninitialized( @"scr_dyndofexp", 1 );
    dyndofexpdisabled = 0;
    
    while ( true )
    {
        if ( utility::flag( "dyndofexp_disable" ) || !getdvarint( @"scr_dyndofexp" ) )
        {
            if ( !dyndofexpdisabled )
            {
                dyndofexpdisabled = 1;
                level.dyndof.player disablephysicaldepthoffieldscripting();
            }
            
            wait 0.5;
            continue;
        }
        
        if ( dyndofexpdisabled )
        {
            level.dyndof.player enablephysicaldepthoffieldscripting();
            dyndofexpdisabled = 0;
        }
        
        if ( !isdefined( level.dyndof.player ) )
        {
            wait 0.5;
            continue;
        }
        
        if ( gettime() > var_86523488c9d4988a )
        {
            var_86523488c9d4988a = gettime() + 500;
            function_3691871790cd5f55();
            currentplayerfov = level.dyndof.playerbasefovdvar;
        }
        
        object = function_ebc195aa5ddd17ac();
        
        if ( getdvarint( @"hash_ad68aff4b57edc12", 0 ) )
        {
            /#
                line( level.dyndof.player.origin, object.origin, ( 0, 0.7, 0 ) );
            #/
        }
        
        if ( object.dofdist < level.dyndof.var_502d73aa0aa7e65c )
        {
            frac = math::normalize_value( level.dyndof.var_505061aa0ace067e, level.dyndof.var_502d73aa0aa7e65c, object.dofdist );
            fstop = math::lerp( level.dyndof.fstopnear, level.dyndof.fstop, frac );
        }
        else
        {
            fstop = level.dyndof.fstop;
        }
        
        if ( object.dofdist < level.dyndof.focusspeeddistmax )
        {
            frac = math::normalize_value( level.dyndof.focusspeeddistmin, level.dyndof.focusspeeddistmax, object.dofdist );
            focusspeed = math::lerp( level.dyndof.focusspeedmin, level.dyndof.focusspeed, frac );
        }
        else
        {
            focusspeed = level.dyndof.focusspeed;
        }
        
        level.dyndof.player setphysicaldepthoffield( fstop, 1, focusspeed, level.dyndof.aperturespeed, object.origin );
        waitframe();
    }
}

// Namespace dof
// Params 0
// Checksum 0xc51e4578, Offset: 0xda3
// Size: 0x183
function function_ebc195aa5ddd17ac()
{
    self endon( "death" );
    playereyeorigin = dyndofexp_getplayerorigin();
    playerviewangles = level.dyndof.player getplayerangles();
    level.dyndof.prevorigin = playereyeorigin;
    level.dyndof.prevangles = playerviewangles;
    var_525a07ede41828a4 = function_a877f6a29d9eaf37( playereyeorigin, playerviewangles );
    
    if ( getdvarint( @"hash_ad68aff4b57edc12" ) == 3 )
    {
        var_525a07ede41828a4.var_85bf1b0c4f9e6f34 = 0;
    }
    
    bestentstruct = function_2b95531ad6c55bb7( playereyeorigin, playerviewangles );
    
    if ( getdvarint( @"hash_ad68aff4b57edc12" ) == 4 )
    {
        bestentstruct.dofscore = 0;
    }
    
    if ( isdefined( bestentstruct ) && bestentstruct.dofscore > var_525a07ede41828a4.var_85bf1b0c4f9e6f34 )
    {
        if ( getdvarint( @"hash_ad68aff4b57edc12" ) )
        {
            /#
                printtoscreen2d( 10, 830, "<dev string:x3a>", ( 1, 1, 1 ), 1.5 );
            #/
            
            /#
                sphere( bestentstruct.origin, 4, ( 1, 1, 1 ) );
            #/
        }
        
        return bestentstruct;
    }
    
    if ( getdvarint( @"hash_ad68aff4b57edc12" ) )
    {
        /#
            printtoscreen2d( 10, 830, "<dev string:x4a>", ( 1, 1, 1 ), 1.5 );
        #/
    }
    
    return var_525a07ede41828a4;
}

// Namespace dof
// Params 0
// Checksum 0xfc3b91fc, Offset: 0xf2e
// Size: 0x2d0
function function_3691871790cd5f55()
{
    basefovdvar = getdvarfloat( @"hash_b38fcf293d1e91a8" );
    
    if ( getdvarfloat( @"hash_b38fcf293d1e91a8" ) == level.dyndof.playerbasefovdvar )
    {
        return;
    }
    
    x_segments = 8;
    y_segments = 4;
    angle = basefovdvar * 0.6 / x_segments;
    level.dyndof.playerbasefovdvar = basefovdvar;
    startxangle = angle * x_segments * -1;
    startyangle = angle * y_segments * -1;
    var_f6572107481dcaac = x_segments * 2;
    var_4531e6b9d614a3c5 = y_segments * 2;
    anglesarray[ 0 ][ 0 ] = 0;
    minvalue = 12000;
    maxvalue = 0;
    
    for ( x = 0; x < var_f6572107481dcaac + 1 ; x++ )
    {
        for ( y = 0; y < var_4531e6b9d614a3c5 + 1 ; y++ )
        {
            struct = spawnstruct();
            struct.addangles = ( y * angle + startyangle, x * angle + startxangle, 0 );
            anglesarray[ x ][ y ] = struct;
            centerscore = x_segments - abs( x_segments - x ) + y_segments - abs( y_segments - y );
            struct.centerscale = exp( centerscore * 1 );
            
            if ( struct.centerscale > maxvalue )
            {
                maxvalue = struct.centerscale;
                continue;
            }
            
            if ( struct.centerscale < minvalue )
            {
                minvalue = struct.centerscale;
            }
        }
    }
    
    level.dyndof.var_dc0818680aecd70f = anglesarray[ x_segments ][ y_segments ];
    
    foreach ( x, array in anglesarray )
    {
        foreach ( y, struct in array )
        {
            struct.centerscale = math::normalize_value( minvalue, maxvalue, struct.centerscale ) * 10;
        }
    }
    
    level.dyndof.tracestructs = anglesarray;
}

// Namespace dof
// Params 2
// Checksum 0xbfa7a419, Offset: 0x1206
// Size: 0x5cf
function function_a877f6a29d9eaf37( playereyeorigin, playerviewangles )
{
    traces = [];
    distances = 0;
    closeststruct = undefined;
    
    foreach ( array in level.dyndof.tracestructs )
    {
        foreach ( struct in array )
        {
            struct.trace = function_a83db885a74488ad( playereyeorigin, playerviewangles, struct.addangles );
            struct.origin = struct.trace[ "position" ];
            struct.dofdist = distance( playereyeorigin, struct.origin );
            distances += struct.dofdist;
            
            if ( !isdefined( closeststruct ) )
            {
                closeststruct = struct;
                continue;
            }
            
            if ( struct.dofdist < closeststruct.dofdist )
            {
                closeststruct = struct;
            }
        }
    }
    
    level.dyndof.var_b6ea170af7b44bc1 = closeststruct;
    groupscores = [];
    groupcount = [];
    
    foreach ( x, array in level.dyndof.tracestructs )
    {
        foreach ( y, struct in array )
        {
            div = abs( closeststruct.dofdist - struct.dofdist ) / 30;
            
            if ( div > 6 )
            {
                div = 6;
            }
            
            struct.groupnum = int( max( div, 1 ) );
            groupscale = 1 + math::normalize_value( 0, 7, 7 - struct.groupnum );
            struct.dofscore = int( groupscale * struct.centerscale * 10 );
            
            if ( !isdefined( groupscores[ struct.groupnum ] ) )
            {
                groupscores[ struct.groupnum ] = 0;
                groupcount[ struct.groupnum ] = 0;
            }
            
            groupscores[ struct.groupnum ] += struct.dofscore;
            groupcount[ struct.groupnum ]++;
        }
    }
    
    keys = getarraykeys( groupscores );
    highestgroup = groupscores[ keys[ 0 ] ];
    highestgroupindex = keys[ 0 ];
    
    foreach ( index, groupavg in groupscores )
    {
        if ( highestgroup < groupavg )
        {
            highestgroup = groupavg;
            highestgroupindex = index;
        }
    }
    
    highestscore = 0;
    beststruct = undefined;
    
    foreach ( x, array in level.dyndof.tracestructs )
    {
        foreach ( y, struct in array )
        {
            if ( struct.groupnum != highestgroupindex )
            {
                continue;
            }
            
            if ( struct.dofscore > highestscore )
            {
                highestscore = struct.dofscore;
                beststruct = struct;
            }
        }
    }
    
    if ( !isdefined( beststruct ) )
    {
        beststruct = level.dyndof.var_dc0818680aecd70f;
    }
    
    if ( getdvarint( @"hash_ad68aff4b57edc12" ) )
    {
        /#
            printtoscreen2d( 10, 890, "<dev string:x5e>" + groupscores[ beststruct.groupnum ], ( 1, 1, 1 ), 1.5 );
        #/
    }
    
    beststruct.var_85bf1b0c4f9e6f34 = groupscores[ beststruct.groupnum ];
    level thread dyndofexp_debug( playereyeorigin, highestgroupindex );
    return beststruct;
}

// Namespace dof
// Params 0
// Checksum 0x544417d7, Offset: 0x17de
// Size: 0x88
function function_47e739b5c004012d()
{
    if ( gettime() > level.dyndof.nextcosfov )
    {
        level.dyndof.nextcosfov = gettime() + 1000;
        level.dyndof.cosfov = cos( getdvarfloat( @"hash_b38fcf293d1e91a8" ) );
        level.dyndof.var_5d49e617853be79 = level.dyndof.cosfov * 50;
    }
}

// Namespace dof
// Params 2
// Checksum 0xa1157df, Offset: 0x186e
// Size: 0xb1b
function function_2b95531ad6c55bb7( playereyepos, playerangles )
{
    ents = getaiarray();
    
    if ( !level.dyndof.issp )
    {
        players = [];
        
        foreach ( player in level.players )
        {
            if ( player == level.dyndof.player )
            {
                continue;
            }
            
            players[ players.size ] = player;
        }
        
        ents = arraycombine( ents, players );
    }
    
    if ( isdefined( level.var_cb5454c0e4af6c94 ) )
    {
        ents = arraycombine( ents, [[ level.var_cb5454c0e4af6c94 ]]() );
    }
    
    ents = function_5713d46873b29625( ents );
    
    foreach ( ent in ents )
    {
        if ( ent.classname != "script_model" )
        {
            continue;
        }
        
        if ( isdefined( ent.dofischaracter ) )
        {
            continue;
        }
        
        substr = getsubstr( ent.model, 0, 5 );
        
        if ( substr == "body_" )
        {
            ent.dofischaracter = 1;
            continue;
        }
        
        ent.dofischaracter = 0;
    }
    
    function_47e739b5c004012d();
    playerforward = anglestoforward( playerangles );
    
    foreach ( ent in ents )
    {
        ischaracter = 0;
        
        if ( isai( ent ) || isdefined( ent.dofischaracter ) || isplayer( ent ) )
        {
            ischaracter = 1;
        }
        
        ent.dofscore = 0;
        
        if ( ischaracter && distancesquared( level.dyndof.player.origin, ent.origin ) < 62500 )
        {
            entorigin = function_399289f399d06971( ent, playereyepos, playerforward );
        }
        else
        {
            entorigin = ent.origin + ( 0, 0, 60 );
        }
        
        ent.doftraceorigin = entorigin;
        dot = function_27f66bd4668b76d5( entorigin, playereyepos, playerforward );
        ent.dofdot = dot;
        
        if ( dot > level.dyndof.cosfov )
        {
            ndot = math::normalize_value( level.dyndof.cosfov, 1, dot );
            score = pow( ndot, 15 ) * 1100;
            ent.dofscore += score;
            
            if ( getdvarint( @"hash_ad68aff4b57edc12" ) )
            {
                /#
                    print3d( entorigin + ( 0, 0, -5 ), "<dev string:x74>" + score + "<dev string:x7d>" + dot + "<dev string:x88>", ( 1, 1, 1 ), 0.8, 0.2 );
                #/
            }
        }
        
        if ( ent.dofscore == 0 )
        {
            continue;
        }
        
        ent.dofdist = distance( entorigin, playereyepos );
        
        if ( ent.dofdist < 2000 )
        {
            if ( ent.dofdist < 200 )
            {
                frac = ent.dofdist / 200;
                distscore = 100 + 300 * pow( 1 - frac, 2 );
                ent.dofscore += distscore;
            }
            else
            {
                frac = ent.dofdist / 2000;
                distscore = 100 * ( 1 - frac );
                ent.dofscore += distscore;
            }
            
            if ( getdvarint( @"hash_ad68aff4b57edc12" ) )
            {
                /#
                    print3d( entorigin + ( 0, 0, -10 ), "<dev string:x8d>" + distscore + "<dev string:x97>" + ent.dofscore + "<dev string:x88>", ( 1, 1, 1 ), 0.8, 0.2 );
                #/
            }
        }
        else
        {
            distscale = 2000 / ent.dofdist * 0.5;
            ent.dofscore *= distscale * 0.5;
            
            if ( getdvarint( @"hash_ad68aff4b57edc12" ) )
            {
                /#
                    print3d( entorigin + ( 0, 0, -10 ), "<dev string:x9d>" + distscale + "<dev string:x97>" + ent.dofscore + "<dev string:x88>", ( 1, 1, 1 ), 0.8, 0.2 );
                #/
            }
        }
        
        if ( ent.dofscore > 0 )
        {
            trace = trace::ray_trace( playereyepos, entorigin, [ ent, level.dyndof.player ], level.dyndof.contents, 1 );
            
            if ( trace[ "fraction" ] > 0.9 )
            {
                scale = 1;
                ent.dofscore *= scale;
            }
            else
            {
                scale = 0;
                ent.dofscore = 0;
            }
            
            if ( getdvarint( @"hash_ad68aff4b57edc12" ) )
            {
                /#
                    print3d( entorigin + ( 0, 0, -15 ), "<dev string:xac>" + scale + "<dev string:x97>" + ent.dofscore + "<dev string:x88>", ( 1, 1, 1 ), 0.8, 0.2 );
                #/
            }
        }
        
        ent.dofscore = int( ent.dofscore );
        
        if ( getdvarint( @"hash_ad68aff4b57edc12" ) )
        {
            /#
                print3d( entorigin, ent.dofscore, ( 1, 1, 1 ), 1, 0.2 );
            #/
        }
    }
    
    directents = [];
    var_fc7cc93356cb3461 = level.dyndof.issp;
    
    if ( var_fc7cc93356cb3461 )
    {
        foreach ( ent in ents )
        {
            if ( !isplayer( ent ) && !isai( ent ) && !isdefined( ent.dofischaracter ) )
            {
                continue;
            }
            
            if ( ent.dofscore > 0 && ent.dofdot > 0.9 )
            {
                directents[ directents.size ] = ent;
                
                /#
                    if ( getdvarint( @"hash_ad68aff4b57edc12" ) )
                    {
                        cylinder( ent.origin, ent.origin + ( 0, 0, 70 ), 8, ( 0.5, 0.5, 0.5 ) );
                    }
                #/
            }
        }
        
        directents = sortbydistance( directents, playereyepos );
    }
    
    bestscore = 80;
    bestscoreent = undefined;
    
    foreach ( ent in ents )
    {
        if ( !isdefined( ent ) )
        {
            continue;
        }
        
        if ( var_fc7cc93356cb3461 && ( isai( ent ) || isdefined( ent.dofischaracter ) ) && ent.dofscore > 0 && ent.dofdot > 0.99 )
        {
            foreach ( directent in directents )
            {
                if ( directent == ent )
                {
                    continue;
                }
                
                if ( directent.dofdist < ent.dofdist && function_9cbe1dca40e0dbe1( playereyepos, ent.doftraceorigin, directent.origin ) )
                {
                    ent.dofscore = 0;
                    
                    if ( getdvarint( @"hash_ad68aff4b57edc12" ) )
                    {
                        /#
                            print3d( ent.doftraceorigin + ( 0, 0, -20 ), "<dev string:xb6>", ( 1, 1, 1 ), 0.8, 0.2 );
                        #/
                        
                        /#
                            line( ent.origin, directent.origin, ( 1, 0, 0 ) );
                        #/
                    }
                    
                    break;
                }
            }
        }
        
        if ( ent.dofscore > bestscore )
        {
            bestscoreent = ent;
            bestscore = ent.dofscore;
        }
    }
    
    struct = undefined;
    
    if ( isdefined( bestscoreent ) )
    {
        struct = spawnstruct();
        struct.origin = bestscoreent.origin;
        struct.dofscore = bestscoreent.dofscore;
        struct.origin = bestscoreent.doftraceorigin;
        struct.dofdist = bestscoreent.dofdist;
        
        if ( getdvarint( @"hash_ad68aff4b57edc12" ) )
        {
            /#
                printtoscreen2d( 10, 860, "<dev string:xcd>" + struct.dofscore, ( 1, 1, 1 ), 1.5 );
            #/
        }
    }
    
    return struct;
}

// Namespace dof
// Params 3
// Checksum 0xa9a51094, Offset: 0x2392
// Size: 0x109
function function_399289f399d06971( ent, playereyepos, playerforward )
{
    extratags = [ "j_spineupper" ];
    closesttag = "tag_eye";
    closesttagorigin = ent gettagorigin( closesttag );
    closesttagdot = function_27f66bd4668b76d5( closesttagorigin, playereyepos, playerforward );
    
    foreach ( tag in extratags )
    {
        tagorigin = ent gettagorigin( tag );
        dot = function_27f66bd4668b76d5( tagorigin, playereyepos, playerforward );
        
        if ( dot > closesttagdot )
        {
            closesttagdot = dot;
            closesttag = tag;
            closesttagorigin = tagorigin;
        }
    }
    
    return closesttagorigin;
}

// Namespace dof
// Params 3
// Checksum 0xacc63c7d, Offset: 0x24a4
// Size: 0x39
function function_27f66bd4668b76d5( targetorigin, sourcepos, sourceforward )
{
    normal = vectornormalize( targetorigin - sourcepos );
    return vectordot( sourceforward, normal );
}

// Namespace dof
// Params 4
// Checksum 0x3691e039, Offset: 0x24e6
// Size: 0xc4
function function_a83db885a74488ad( playereyeorigin, playerangles, addangles, pos )
{
    angles = combineangles( playerangles, addangles );
    
    if ( !isdefined( pos ) )
    {
        pos = playereyeorigin + anglestoforward( angles ) * level.dyndof.maxfocusdist;
    }
    
    trace = physics_raycast( playereyeorigin, pos, level.dyndof.var_ee72f202f6e55c55, level.dyndof.ignorelist, 1, "physicsquery_closest", 1 );
    
    if ( !isdefined( trace ) || trace.size == 0 )
    {
        trace = trace::internal_pack_default_trace( pos );
    }
    else
    {
        trace = trace[ 0 ];
    }
    
    return trace;
}

// Namespace dof
// Params 0
// Checksum 0x8fd64336, Offset: 0x25b3
// Size: 0xc3
function dyndofexp_getplayerorigin()
{
    if ( level.dyndof.player islinked() )
    {
        linkedent = level.dyndof.player getlinkedparent();
        
        if ( !isdefined( linkedent.dyndof_hastag ) )
        {
            linkedent.dyndof_hastag = 0;
            
            if ( isdefined( linkedent.model ) )
            {
                if ( utility::hastag( linkedent.model, "tag_camera" ) )
                {
                    linkedent.dyndof_hastag = 1;
                }
            }
        }
        
        if ( linkedent.dyndof_hastag )
        {
            return linkedent gettagorigin( "tag_camera" );
        }
    }
    
    return level.dyndof.player getvieworigin();
}

// Namespace dof
// Params 2
// Checksum 0xafcaf08d, Offset: 0x267f
// Size: 0x2ff
function dyndofexp_debug( playereyeorigin, highestgroup )
{
    level notify( "stop_dyndof_debug" );
    level endon( "stop_dyndof" );
    level endon( "stop_dyndof_debug" );
    
    /#
        while ( getdvarint( @"hash_ad68aff4b57edc12" ) )
        {
            closestpos = level.dyndof.var_b6ea170af7b44bc1.trace[ "<dev string:xdf>" ];
            closestdist = level.dyndof.var_b6ea170af7b44bc1.dofdist;
            
            foreach ( array in level.dyndof.tracestructs )
            {
                foreach ( struct in array )
                {
                    if ( ( getdvarint( @"hash_ad68aff4b57edc12" ) == 2 || getdvarint( @"hash_ad68aff4b57edc12" ) == 4 ) && struct.groupnum != highestgroup )
                    {
                        continue;
                    }
                    
                    switch ( struct.groupnum )
                    {
                        case 0:
                            color = ( 0, 0.9, 0 );
                            break;
                        case 1:
                            color = ( 0, 1, 1 );
                            break;
                        case 2:
                            color = ( 1, 1, 0 );
                            break;
                        case 3:
                            color = ( 1, 0.5, 0 );
                            break;
                        case 4:
                            color = ( 1, 0, 0 );
                            break;
                        default:
                            color = ( 1, 0, 1 );
                            break;
                    }
                    
                    print3d( struct.origin, struct.dofscore, ( 1, 1, 1 ), 0.7, 0.05 );
                    function_bbedb82a51465887( struct.trace[ "<dev string:xdf>" ], color );
                }
            }
            
            radius = math::normalize_value( 0, 3000, closestdist );
            radius *= 16;
            sphere( closestpos, radius, ( 1, 1, 0 ) );
            waitframe();
        }
    #/
}

// Namespace dof
// Params 2
// Checksum 0xf6026eba, Offset: 0x2986
// Size: 0x85
function function_bbedb82a51465887( pos, color )
{
    range = 1;
    
    if ( !isdefined( color ) )
    {
        color = ( 1, 1, 1 );
    }
    
    /#
        line( pos - ( 0, 0, range ), pos + ( 0, 0, range ), color, 1, 0 );
        line( pos - ( 0, range, 0 ), pos + ( 0, range, 0 ), color, 1, 0 );
        line( pos - ( range, 0, 0 ), pos + ( range, 0, 0 ), color, 1, 0 );
    #/
}

// Namespace dof
// Params 3
// Checksum 0x22b41212, Offset: 0x2a13
// Size: 0x14c, Type: bool
function function_9cbe1dca40e0dbe1( start, end, actorpos )
{
    raydir = vectornormalize( end - start );
    radius = 8;
    actorpos2 = actorpos + ( 0, 0, 70 );
    cline = actorpos2 - actorpos;
    ctoraystart = start - actorpos;
    cross_cline = vectorcross( ctoraystart, cline );
    var_4f232dbc7e210888 = vectorcross( raydir, cline );
    dot_cline = vectordot( cline, cline );
    a = vectordot( var_4f232dbc7e210888, var_4f232dbc7e210888 );
    b = 2 * vectordot( var_4f232dbc7e210888, cross_cline );
    c = vectordot( cross_cline, cross_cline ) - radius * radius * dot_cline;
    dist = b * b - 4 * a * c;
    
    if ( dist < 0 )
    {
        return false;
    }
    
    time = ( b * -1 - sqrt( dist ) ) / 2 * a;
    
    if ( time == length( end - start ) )
    {
        return false;
    }
    
    if ( time < 0 )
    {
        return false;
    }
    
    intersection = start + raydir * time;
    return true;
}

// Namespace dof
// Params 10
// Checksum 0x7f8dbf88, Offset: 0x2b68
// Size: 0x28a
function dyndof( fstop, targetentity, focusspeed, aperturespeed, angles, var_80bc11493bd39409, ignorelist, ignorecollision, var_b18f77fd8c2dde85, minfocusdist )
{
    assert( isdefined( fstop ), "<dev string:x24>" );
    assert( !isdefined( targetentity ) || isent( targetentity ), "<dev string:xeb>" );
    
    if ( !isdefined( focusspeed ) )
    {
        focusspeed = 1;
    }
    
    if ( !isdefined( aperturespeed ) )
    {
        aperturespeed = 2;
    }
    
    if ( !isdefined( ignorecollision ) )
    {
        ignorecollision = 0;
    }
    
    player = self;
    player notify( "stop_dyndof" );
    
    /#
        setdvarifuninitialized( @"hash_93ca035fa3964d3d", 0 );
    #/
    
    if ( utility::issp() )
    {
        setsaveddvar( @"hash_62c917f9692eb820", 1 );
    }
    
    player enablephysicaldepthoffieldscripting();
    
    if ( isdefined( player.dyndof ) )
    {
        player.dyndof = player destroy_dyndof();
    }
    
    player.dyndof = create_dyndof();
    player.dyndof.fstop = fstop;
    player.dyndof.focusspeed = focusspeed;
    player.dyndof.aperturespeed = aperturespeed;
    
    if ( isstring( var_80bc11493bd39409 ) )
    {
        player.dyndof.desiredbone = var_80bc11493bd39409;
    }
    else if ( isvector( var_80bc11493bd39409 ) )
    {
        player.dyndof.desiredpos = var_80bc11493bd39409;
    }
    else if ( isnumber( var_80bc11493bd39409 ) )
    {
        player.dyndof.desireddistance = var_80bc11493bd39409;
    }
    
    player.dyndof.ignorecollision = ignorecollision;
    player.dyndof.var_b18f77fd8c2dde85 = var_b18f77fd8c2dde85;
    player.dyndof.minfocusdist = minfocusdist;
    
    if ( isdefined( ignorelist ) )
    {
        player.dyndof.ignorelist = ignorelist;
    }
    else
    {
        player.dyndof.ignorelist = [ player ];
    }
    
    if ( isdefined( angles ) )
    {
        player.dyndof.traceangle = angles;
    }
    
    player thread dyndof_thread( targetentity );
}

// Namespace dof
// Params 0
// Checksum 0x5f7eac9d, Offset: 0x2dfa
// Size: 0x31
function dyndof_disable()
{
    player = self;
    player notify( "stop_dyndof" );
    player notify( "stop_dyndof_debug" );
    player disablephysicaldepthoffieldscripting();
    player destroy_dyndof();
}

// Namespace dof
// Params 0, eflags: 0x4
// Checksum 0x44976514, Offset: 0x2e33
// Size: 0x4b
function private function_892e1d1187d0d027()
{
    if ( self isplayingxcam() )
    {
        pos = self getxcamposition();
        ang = self getxcamangles();
        return [ pos, ang ];
    }
    
    return [ self geteye(), self getgunangles() ];
}

// Namespace dof
// Params 1
// Checksum 0x3b6cc5fe, Offset: 0x2e87
// Size: 0x2be
function dyndof_thread( targetentity )
{
    player = self;
    
    if ( isdefined( targetentity ) )
    {
        targetentity endon( "death" );
    }
    
    level endon( "stop_dyndof" );
    player endon( "stop_dyndof" );
    
    while ( true )
    {
        fstop = player.dyndof.fstop;
        aperturespeed = player.dyndof.aperturespeed;
        
        if ( isdefined( player.dyndof.desiredpos ) && player.dyndof.ignorecollision )
        {
            pos = player.dyndof.desiredpos;
        }
        else if ( isdefined( player.dyndof.desireddistance ) && player.dyndof.ignorecollision )
        {
            [ eye, ang ] = function_892e1d1187d0d027();
            pos = eye + anglestoforward( ang ) * player.dyndof.desireddistance;
        }
        else if ( isdefined( player.dyndof.desireddistance ) && player.dyndof.minfocusdist )
        {
            pos = player dyndof_distance( undefined );
            tracedistance = distance( pos, dyndof_getplayerorigin() );
            
            if ( tracedistance < player.dyndof.minfocusdist )
            {
                fstop = 5;
                aperturespeed = 10000;
            }
            else
            {
                [ eye, ang ] = function_892e1d1187d0d027();
                pos = eye + anglestoforward( ang ) * player.dyndof.desireddistance;
            }
        }
        else
        {
            pos = player dyndof_distance( targetentity );
        }
        
        if ( !isint( pos ) )
        {
            /#
                if ( getdvarint( @"hash_93ca035fa3964d3d", 0 ) )
                {
                    print3d( pos + ( 0, 0, 1.5 ), "<dev string:x11a>" + pos, ( 0, 1, 0 ), 1, 0.1, 1 );
                    line( pos, pos - ( 0, 0, 1000 ), ( 0, 1, 0 ), 1, 1, 1 );
                }
            #/
            
            player setphysicaldepthoffield( fstop, 1, player.dyndof.focusspeed, aperturespeed, pos );
        }
        
        waitframe();
    }
}

// Namespace dof
// Params 1
// Checksum 0xf92f65a2, Offset: 0x314d
// Size: 0x895
function dyndof_distance( targetentity )
{
    player = self;
    
    if ( isdefined( targetentity ) )
    {
        targetentity endon( "death" );
        closesttrace[ "entity" ] = targetentity;
        
        if ( isent( targetentity ) && isdefined( targetentity.model ) )
        {
            if ( !isdefined( player.dyndof.bone ) )
            {
                if ( isdefined( player.dyndof.desiredbone ) )
                {
                    bone = player.dyndof.desiredbone;
                }
                else
                {
                    bone = "tag_eye";
                }
                
                closesttrace[ "position" ] = targetentity.origin;
                closesttrace[ "hittype" ] = bone + " DOESN'T EXIST";
                pos = closesttrace[ "position" ];
                closesttrace[ "hittype" ] = bone + " DOESN'T EXIST";
                pos = closesttrace[ "position" ];
                
                if ( isdefined( targetentity.headmodel ) )
                {
                    num_parts = getnumparts( targetentity.headmodel );
                    
                    for ( i = 0; i < num_parts ; i++ )
                    {
                        if ( getpartname( targetentity.headmodel, i ) == bone )
                        {
                            player.dyndof.bone = bone;
                            closesttrace[ "hittype" ] = player.dyndof.bone;
                            closesttrace[ "position" ] = targetentity gettagorigin( player.dyndof.bone );
                            pos = closesttrace[ "position" ];
                            break;
                        }
                    }
                }
                
                if ( isdefined( targetentity.attachedweaponmodels ) )
                {
                    foreach ( n, model in targetentity.attachedweaponmodels )
                    {
                        num_parts = getnumparts( targetentity.attachedweaponmodels[ n ] );
                        
                        for ( i = 0; i < num_parts ; i++ )
                        {
                            if ( getpartname( targetentity.attachedweaponmodels[ n ], i ) == bone )
                            {
                                player.dyndof.bone = bone;
                                closesttrace[ "hittype" ] = player.dyndof.bone;
                                closesttrace[ "position" ] = targetentity gettagorigin( player.dyndof.bone );
                                pos = closesttrace[ "position" ];
                                break;
                            }
                        }
                    }
                }
                
                num_parts = getnumparts( targetentity.model );
                
                for ( i = 0; i < num_parts ; i++ )
                {
                    if ( getpartname( targetentity.model, i ) == bone )
                    {
                        player.dyndof.bone = bone;
                        closesttrace[ "hittype" ] = player.dyndof.bone;
                        closesttrace[ "position" ] = targetentity gettagorigin( player.dyndof.bone );
                        pos = closesttrace[ "position" ];
                        break;
                    }
                }
            }
            else
            {
                closesttrace[ "hittype" ] = player.dyndof.bone;
                closesttrace[ "position" ] = targetentity gettagorigin( player.dyndof.bone );
                pos = closesttrace[ "position" ];
            }
        }
        else
        {
            closesttrace[ "hittype" ] = "struct or no bones";
            closesttrace[ "position" ] = targetentity.origin;
            pos = closesttrace[ "position" ];
        }
        
        if ( isdefined( player worldpointtoscreenpos( pos, getdvarfloat( @"hash_b38fcf293d1e91a8" ) ) ) && dyndof_trace_target( pos ) )
        {
            if ( player.dyndof.prevorigin == pos )
            {
                return -1;
            }
            
            player.dyndof.prevorigin = pos;
            
            /#
                player thread dyndof_debug( undefined, closesttrace );
            #/
            
            return closesttrace[ "position" ];
        }
        else
        {
            if ( player.dyndof.var_b18f77fd8c2dde85 )
            {
                [ player_eye_pos, ang ] = function_892e1d1187d0d027();
                var_3287aa75c2fa8e16 = pos - player_eye_pos;
                player_fwd = anglestoforward( ang );
                dot = vectordot( var_3287aa75c2fa8e16, player_fwd );
                
                if ( dot > 0 )
                {
                    var_5d4042a52381fd5e = player_eye_pos + player_fwd * dot;
                }
                else
                {
                    var_5d4042a52381fd5e = player_eye_pos;
                }
                
                /#
                    if ( getdvarint( @"hash_93ca035fa3964d3d", 0 ) )
                    {
                        line( player.dyndof.prevorigin, var_5d4042a52381fd5e, ( 1, 1, 1 ), 1, 1 );
                        print3d( var_5d4042a52381fd5e, "<dev string:x12b>", ( 1, 1, 1 ), 1, 0.1, 1, 1 );
                        print3d( var_5d4042a52381fd5e + ( 0, 0, 2 ), "<dev string:x132>", ( 1, 0, 0 ), 1, 0.1, 1 );
                    }
                #/
                
                return var_5d4042a52381fd5e;
            }
            
            /#
                if ( getdvarint( @"hash_93ca035fa3964d3d", 0 ) )
                {
                    print3d( pos, "<dev string:x12b>", ( 1, 1, 1 ), 1, 0.1, 1, 1 );
                    print3d( pos + ( 0, 0, 2 ), "<dev string:x168>", ( 1, 0, 0 ), 1, 0.1, 1 );
                }
            #/
        }
    }
    
    pos = dyndof_getplayerorigin();
    angles = dyndof_getplayerangles();
    
    if ( player.dyndof.prevorigin == pos && player.dyndof.prevangles == angles )
    {
        if ( !isdefined( player.dyndof.firstnomovetime ) )
        {
            player.dyndof.firstnomovetime = gettime();
        }
        else if ( gettime() - player.dyndof.firstnomovetime > 2000 )
        {
            return -1;
        }
    }
    else
    {
        player.dyndof.firstnomovetime = undefined;
    }
    
    player.dyndof.prevorigin = pos;
    player.dyndof.prevangles = angles;
    angles = [];
    angle = player.dyndof.traceangle;
    angles[ angles.size ] = ( angle * -1, 0, 0 );
    angles[ angles.size ] = ( 0, angle, 0 );
    angles[ angles.size ] = ( 0, angle * -1, 0 );
    angles[ angles.size ] = ( 0, 0, 0 );
    traces = [];
    
    foreach ( index, a in angles )
    {
        if ( isdefined( player.dyndof.desiredpos ) )
        {
            trace = dyndof_trace_internal( a, player.dyndof.desiredpos );
        }
        else
        {
            trace = dyndof_trace_internal( a, undefined );
        }
        
        if ( !isdefined( trace ) )
        {
            continue;
        }
        
        traces[ traces.size ] = trace[ 0 ];
    }
    
    if ( traces.size == 0 )
    {
        player notify( "stop_dyndof_debug" );
        return ( dyndof_getplayerorigin() + anglestoforward( dyndof_getplayerangles() ) * player.dyndof.maxfocusdist );
    }
    
    index = 0;
    closesttrace = traces[ index ];
    
    for ( i = 1; i < traces.size ; i++ )
    {
        if ( traces[ i ][ "fraction" ] < closesttrace[ "fraction" ] )
        {
            closesttrace = traces[ i ];
        }
    }
    
    /#
        player thread dyndof_debug( traces, closesttrace );
    #/
    
    return closesttrace[ "position" ];
}

// Namespace dof
// Params 2
// Checksum 0x22da1647, Offset: 0x39eb
// Size: 0x136
function dyndof_trace_internal( angles, pos )
{
    player = self;
    assert( isdefined( player ) );
    playereye = dyndof_getplayerorigin();
    angles = combineangles( dyndof_getplayerangles(), angles );
    
    if ( isdefined( player.dyndof.desireddistance ) )
    {
        forward_distance = player.dyndof.desireddistance;
    }
    else
    {
        forward_distance = player.dyndof.maxfocusdist;
    }
    
    if ( !isdefined( pos ) )
    {
        pos = dyndof_getplayerorigin() + anglestoforward( angles ) * forward_distance;
    }
    
    results = physics_raycast( playereye, pos, player.dyndof.contents, player.dyndof.ignorelist, 1, "physicsquery_closest", 1 );
    
    /#
        if ( getdvarint( @"hash_93ca035fa3964d3d", 1 ) )
        {
            if ( !isdefined( results ) || results.size == 0 )
            {
                line( playereye, pos, ( 0.3, 0.3, 0.3 ) );
            }
        }
    #/
    
    return results;
}

// Namespace dof
// Params 1
// Checksum 0xfae0402c, Offset: 0x3b2a
// Size: 0x1c8, Type: bool
function dyndof_trace_target( pos )
{
    player = self;
    assert( isdefined( player ) );
    
    if ( player.dyndof.ignorecollision )
    {
        return true;
    }
    
    trace = dyndof_trace_internal( ( 0, 0, 0 ), pos );
    pos_print = pos + ( 0, 0, 3 );
    
    if ( isdefined( trace[ 0 ] ) && isdefined( trace ) && isdefined( trace[ 0 ][ "position" ] ) )
    {
        if ( distance( trace[ 0 ][ "position" ], pos ) < 8 )
        {
            /#
                if ( getdvarint( @"hash_93ca035fa3964d3d", 0 ) )
                {
                    print3d( pos_print, "<dev string:x197>", ( 1, 0, 1 ), 1, 0.1, 1, 1 );
                    playereye = dyndof_getplayerorigin();
                    line( playereye, trace[ 0 ][ "<dev string:xdf>" ], ( 1, 0, 1 ) );
                }
            #/
            
            return true;
        }
        else
        {
            /#
                if ( getdvarint( @"hash_93ca035fa3964d3d", 0 ) )
                {
                    print3d( pos_print, "<dev string:x1ad>", ( 1, 0, 0 ), 1, 0.1, 1, 1 );
                    playereye = dyndof_getplayerorigin();
                    line( playereye, trace[ 0 ][ "<dev string:xdf>" ], ( 1, 0, 0 ) );
                }
            #/
            
            return false;
        }
    }
    
    /#
        if ( getdvarint( @"hash_93ca035fa3964d3d", 0 ) )
        {
            print3d( pos_print, "<dev string:x1bd>", ( 0, 1, 0 ), 1, 0.1, 1, 1 );
            playereye = dyndof_getplayerorigin();
            line( playereye, pos, ( 0, 1, 0 ) );
        }
    #/
    
    return true;
}

// Namespace dof
// Params 0
// Checksum 0x9963dffa, Offset: 0x3cfb
// Size: 0xd5
function dyndof_getplayerorigin()
{
    player = self;
    
    if ( player isplayingxcam() )
    {
        [ pos, ang ] = player function_892e1d1187d0d027();
        return pos;
    }
    
    if ( player islinked() )
    {
        linkedent = player getlinkedparent();
        
        if ( !isdefined( linkedent.dyndof_hastag ) )
        {
            linkedent.dyndof_hastag = 0;
            
            if ( isdefined( linkedent.model ) )
            {
                if ( utility::hastag( linkedent.model, "tag_camera" ) )
                {
                    linkedent.dyndof_hastag = 1;
                }
            }
        }
        
        if ( linkedent.dyndof_hastag )
        {
            return linkedent gettagorigin( "tag_camera" );
        }
    }
    
    return player getvieworigin();
}

// Namespace dof
// Params 0
// Checksum 0xa26c0534, Offset: 0x3dd9
// Size: 0x3f
function dyndof_getplayerangles()
{
    player = self;
    [ pos, ang ] = player function_892e1d1187d0d027();
    return ang;
}

// Namespace dof
// Params 0
// Checksum 0x976ab2fe, Offset: 0x3e21
// Size: 0x75
function create_dyndof()
{
    struct = spawnstruct();
    struct.maxfocusdist = 50000;
    struct.contents = get_dyndof_contents();
    struct.traceangle = 3;
    struct.prevangles = ( 0, 0, 0 );
    struct.prevorigin = ( 0, 0, 0 );
    return struct;
}

// Namespace dof
// Params 0
// Checksum 0xfb66eaf5, Offset: 0x3e9f
// Size: 0x1b
function destroy_dyndof()
{
    if ( !isdefined( self.dyndof ) )
    {
        return;
    }
    
    self.dyndof = undefined;
}

// Namespace dof
// Params 0
// Checksum 0xcd808187, Offset: 0x3ec2
// Size: 0x4b
function get_dyndof_contents()
{
    dof_contents = [ "physicscontents_characterproxy", "physicscontents_ainoshoot", "physicscontents_clipshot", "physicscontents_item", "physicscontents_vehicle", "physicscontents_water" ];
    return physics_createcontents( dof_contents );
}

// Namespace dof
// Params 2
// Checksum 0xf9581102, Offset: 0x3f16
// Size: 0x23d
function dyndof_debug( traces, closesttrace )
{
    player = self;
    assert( isdefined( player ) );
    player notify( "stop_dyndof_debug" );
    player endon( "stop_dyndof" );
    player endon( "stop_dyndof_debug" );
    
    /#
        if ( getdvarint( @"hash_93ca035fa3964d3d", 0 ) )
        {
            while ( true )
            {
                if ( !getdvarint( @"hash_93ca035fa3964d3d", 0 ) )
                {
                    break;
                }
                
                if ( isdefined( traces ) )
                {
                    foreach ( trace in traces )
                    {
                        line( trace[ "<dev string:xdf>" ], dyndof_getplayerorigin() + ( 0, 0, -1 ) );
                    }
                }
                
                line( closesttrace[ "<dev string:xdf>" ], dyndof_getplayerorigin() + ( 0, 0, -1 ), ( 1, 1, 0 ) );
                value = math::normalize_value( 0, 3000, distance( dyndof_getplayerorigin(), closesttrace[ "<dev string:xdf>" ] ) );
                value *= 32;
                sphere( closesttrace[ "<dev string:xdf>" ], value, ( 1, 1, 0 ) );
                print3d( closesttrace[ "<dev string:xdf>" ], closesttrace[ "<dev string:x1cd>" ], ( 1, 1, 1 ), 1, 0.1, 1 );
                
                if ( isdefined( closesttrace[ "<dev string:x1d8>" ] ) && isdefined( closesttrace[ "<dev string:x1d8>" ].model ) )
                {
                    model = closesttrace[ "<dev string:x1d8>" ].model;
                    
                    if ( model != player.var_80964a983c9c6826 )
                    {
                        iprintln( "<dev string:x1e2>" + model );
                        player.var_80964a983c9c6826 = model;
                    }
                    
                    print3d( closesttrace[ "<dev string:xdf>" ] + ( 0, 0, -1.5 ), model, ( 1, 1, 1 ), 1, 0.1, 1 );
                }
                
                waitframe();
            }
        }
    #/
}

