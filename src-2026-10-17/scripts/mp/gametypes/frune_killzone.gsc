#using script_44280f644740bac;
#using scripts\mp\gametypes\frune_checkpoints;

#namespace frune_killzone;

// Namespace frune_killzone
// Params 0
// Checksum 0x1c4a8813, Offset: 0x189
// Size: 0x112
function init()
{
    level endon( #"game_ended" );
    level waittill( #"hash_557be8499a49cc19" );
    function_a5014cf09fbe8971();
    function_2391b41c53f9038f();
    
    /#
        helptext = "<dev string:x24>";
        var_32dbca3143d9c4a5 = level.sharedfuncs[ #"fre" ][ #"registercommand" ];
        
        if ( isdefined( var_32dbca3143d9c4a5 ) )
        {
            level [[ var_32dbca3143d9c4a5 ]]( "<dev string:x57>", "<dev string:x6b>", &function_af1a52bea44f26f, helptext, "<dev string:x6f>", undefined );
        }
        
        helptext = "<dev string:x74>";
        var_32dbca3143d9c4a5 = level.sharedfuncs[ #"fre" ][ #"registercommand" ];
        
        if ( isdefined( var_32dbca3143d9c4a5 ) )
        {
            level [[ var_32dbca3143d9c4a5 ]]( "<dev string:x9e>", "<dev string:x6b>", &function_9739ee76be749d44, helptext, "<dev string:x6f>", undefined );
        }
        
        var_32dbca3143d9c4a5 = level.sharedfuncs[ #"fre" ][ #"registercommand" ];
        
        if ( isdefined( var_32dbca3143d9c4a5 ) )
        {
            level [[ var_32dbca3143d9c4a5 ]]( "<dev string:xb9>", "<dev string:x6b>", &function_6651e204fe03994c, helptext, "<dev string:x6f>", undefined );
        }
    #/
}

// Namespace frune_killzone
// Params 0, eflags: 0x4
// Checksum 0x917cb1c7, Offset: 0x2a3
// Size: 0x16e
function private function_a5014cf09fbe8971()
{
    /#
        var_5bf349e1e9de1a4f = ( 0, 0, 0 );
        var_67ce164c6605b3f0 = ( 100, 300, 500 );
        angles = ( 0, 0, 0 );
        function_64ff19cdc4f4210e( "<dev string:xd4>", var_5bf349e1e9de1a4f, var_67ce164c6605b3f0, angles, "<dev string:xe5>", 1, 1, 3 );
    #/
    
    name = "ringseal_1";
    var_5bf349e1e9de1a4f = ( -30300, -2238, -1480 );
    angles = ( 30, 90, 0 );
    function_79f6e1d70097dd11( name, var_5bf349e1e9de1a4f, angles, 260 );
    name = "ringseal_2";
    var_5bf349e1e9de1a4f = ( 1180, 7920, -16750 );
    angles = ( 17.81, 0, 0 );
    function_79f6e1d70097dd11( name, var_5bf349e1e9de1a4f, angles, 425 );
    name = "ringseal_3";
    var_5bf349e1e9de1a4f = ( 38123, 7900, -28225 );
    angles = ( 33, 0, 0 );
    function_79f6e1d70097dd11( name, var_5bf349e1e9de1a4f, angles, 425 );
    name = "ringseal_4";
    var_5bf349e1e9de1a4f = ( 39150, 7900, -28910 );
    angles = ( 33, 0, 0 );
    function_79f6e1d70097dd11( name, var_5bf349e1e9de1a4f, angles, 425 );
    name = "ringseal_5";
    var_5bf349e1e9de1a4f = ( 51250, 7930, -32650 );
    angles = ( 9.8, 0, 0 );
    function_79f6e1d70097dd11( name, var_5bf349e1e9de1a4f, angles, 425 );
}

// Namespace frune_killzone
// Params 4, eflags: 0x4
// Checksum 0xbea1de77, Offset: 0x419
// Size: 0xa9
function private function_79f6e1d70097dd11( name, sealcenter, angles, radius )
{
    var_5bf349e1e9de1a4f = sealcenter;
    var_67ce164c6605b3f0 = ( 100, 125, 75 );
    localoffset = ( 0, 0, radius );
    i = 0;
    
    while ( i < 360 )
    {
        clockwiserotation = combineangles( angles, ( 0, 0, i ) );
        var_5bf349e1e9de1a4f = sealcenter + rotatevector( localoffset, clockwiserotation );
        function_64ff19cdc4f4210e( name + i, var_5bf349e1e9de1a4f, var_67ce164c6605b3f0, clockwiserotation );
        i += 30;
    }
}

// Namespace frune_killzone
// Params 8, eflags: 0x4
// Checksum 0x4771246e, Offset: 0x4ca
// Size: 0x114
function private function_64ff19cdc4f4210e( targetname, var_3941bc5c13322d9e, var_67ce164c6605b3f0, angles, linktype, var_5fac99c61ce13251, var_9bdca9e20b45de1b, var_defa4e1809f8bd9b )
{
    killzone = spawn( "trigger_box", var_3941bc5c13322d9e, 0, var_67ce164c6605b3f0, var_67ce164c6605b3f0 );
    killzone.targetname = targetname;
    killzone.angles = angles;
    killzone.script_noteworthy = "kill";
    killzone.script_label = var_5fac99c61ce13251 ? "wingsuit_required" : undefined;
    killzone.isscripted = 1;
    
    if ( function_b6e966c8f8346c15( linktype ) && var_9bdca9e20b45de1b && var_defa4e1809f8bd9b )
    {
        killzone.script_parameters = linktype;
        var_dbde0eb9148a5d9d = frune_checkpoints::getcheckpoint( var_9bdca9e20b45de1b, var_defa4e1809f8bd9b );
        killzone.target = var_dbde0eb9148a5d9d.checkpoint.targetname;
    }
}

// Namespace frune_killzone
// Params 1, eflags: 0x4
// Checksum 0xa1df55f5, Offset: 0x5e6
// Size: 0x63
function private function_b6e966c8f8346c15( linktype )
{
    if ( !linktype )
    {
        return 0;
    }
    
    switch ( linktype )
    {
        case #"hash_adb1cd289479419c":
        case #"hash_b3c007b3f6f8b165":
        case #"hash_bf0b551225d7e040":
            return 1;
        default:
            assertmsg( "<dev string:x10a>" + linktype );
            return 0;
    }
}

// Namespace frune_killzone
// Params 0, eflags: 0x4
// Checksum 0x1806c5e5, Offset: 0x651
// Size: 0x274
function private function_2391b41c53f9038f()
{
    killzonelist = getentarray( "kill", "script_noteworthy" );
    
    foreach ( killzone in killzonelist )
    {
        targetname = killzone.targetname;
        
        if ( targetname )
        {
            var_94f507c4cee24d37 = hashcat( @"hash_7356003147f32e0e", targetname );
            dvardisabled = getdvarint( var_94f507c4cee24d37, 0 );
            
            if ( dvardisabled )
            {
                continue;
            }
        }
        
        if ( isdefined( killzone.script_label ) )
        {
            switch ( killzone.script_label )
            {
                case #"hash_5212723eea4ea3a1":
                    killzone.var_5fac99c61ce13251 = 1;
                    break;
                default:
                    assertmsg( "<dev string:x137>" + killzone.script_group + "<dev string:x14e>" );
                    break;
            }
        }
        
        if ( isdefined( killzone.target ) && killzone.target != "" )
        {
            var_5a9c48a0186c1117 = getent( killzone.target, "targetname" );
            
            if ( function_b6e966c8f8346c15( killzone.script_parameters ) && var_5a9c48a0186c1117 )
            {
                switch ( killzone.script_parameters )
                {
                    case #"hash_bf0b551225d7e040":
                        killzone.var_7d2a381382af2584 = var_5a9c48a0186c1117.zoneindex;
                        killzone.var_23b6e02ec1962b54 = var_5a9c48a0186c1117.checkpointindex;
                        break;
                    case #"hash_b3c007b3f6f8b165":
                        killzone.var_7f6b8b00be70706 = var_5a9c48a0186c1117.zoneindex;
                        killzone.var_aa316401a0aed86 = var_5a9c48a0186c1117.checkpointindex;
                        break;
                    case #"hash_adb1cd289479419c":
                        killzone.var_ba156ddd023dd332 = var_5a9c48a0186c1117.zoneindex;
                        killzone.var_faff550e7091af5a = var_5a9c48a0186c1117.checkpointindex;
                        break;
                }
            }
        }
        
        function_639d5f2e618b926f( killzone );
        killzone thread function_100349365d8368c();
    }
}

// Namespace frune_killzone
// Params 1, eflags: 0x4
// Checksum 0x5d816a3b, Offset: 0x8cd
// Size: 0x16e
function private function_639d5f2e618b926f( killzone )
{
    modeinfo = game[ #"frune_tuning" ];
    
    if ( !isdefined( modeinfo.killzonelist ) )
    {
        modeinfo.killzonelist = [];
    }
    
    if ( killzone.var_7d2a381382af2584 && killzone.var_23b6e02ec1962b54 )
    {
        var_9083c1d9e333ef44 = modeinfo.var_afad088dc0cd7ba7[ killzone.var_7d2a381382af2584 ][ killzone.var_23b6e02ec1962b54 ];
    }
    
    if ( killzone.var_7f6b8b00be70706 && killzone.var_aa316401a0aed86 )
    {
        var_d9d2c167551d546a = modeinfo.var_afad088dc0cd7ba7[ killzone.var_7f6b8b00be70706 ][ killzone.var_aa316401a0aed86 ];
    }
    
    if ( killzone.var_ba156ddd023dd332 && killzone.var_faff550e7091af5a )
    {
        var_3df6b9a672d36926 = modeinfo.var_afad088dc0cd7ba7[ killzone.var_ba156ddd023dd332 ][ killzone.var_faff550e7091af5a ];
    }
    
    killzoneinfo = { #var_3df6b9a672d36926:var_3df6b9a672d36926, #var_d9d2c167551d546a:var_d9d2c167551d546a, #var_9083c1d9e333ef44:var_9083c1d9e333ef44, #killzone:killzone };
    modeinfo.killzonelist[ modeinfo.killzonelist.size ] = killzoneinfo;
}

// Namespace frune_killzone
// Params 0, eflags: 0x4
// Checksum 0x63b853c3, Offset: 0xa43
// Size: 0xa9
function private function_100349365d8368c()
{
    level endon( #"game_ended" );
    
    while ( true )
    {
        self waittill( #"trigger", var_b37d5221d1f6697a );
        targetplayer = frune_checkpoints::function_689377905ae386ba( var_b37d5221d1f6697a );
        
        if ( !targetplayer && isalive( var_b37d5221d1f6697a ) && isplayer( var_b37d5221d1f6697a ) )
        {
            targetplayer = var_b37d5221d1f6697a;
        }
        
        if ( !targetplayer )
        {
            continue;
        }
        
        if ( targetplayer.freeruninfo.var_59e2fdeca3342c99 )
        {
            continue;
        }
        
        if ( !function_319f1cee3a98304f( targetplayer, self ) )
        {
            continue;
        }
        
        frune_checkpoints::function_aae76b5997fc6288( targetplayer );
        targetplayer notify( #"frun_killzone_death" );
    }
}

// Namespace frune_killzone
// Params 2
// Checksum 0x19213ad7, Offset: 0xaf4
// Size: 0x1d9, Type: bool
function function_319f1cee3a98304f( player, killzone )
{
    currentzone = player.freeruninfo.zoneindex;
    currentcheckpoint = player.freeruninfo.checkpointindex;
    
    if ( isdefined( killzone.var_7d2a381382af2584 ) && isdefined( killzone.var_23b6e02ec1962b54 ) )
    {
        var_5356a009a56bbc32 = currentzone > killzone.var_7d2a381382af2584;
        var_cdc54b9b62bcc60e = currentzone == killzone.var_7d2a381382af2584 && currentcheckpoint >= killzone.var_23b6e02ec1962b54;
        overmin = var_5356a009a56bbc32 || var_cdc54b9b62bcc60e;
    }
    else
    {
        overmin = 1;
    }
    
    if ( isdefined( killzone.var_7f6b8b00be70706 ) && isdefined( killzone.var_aa316401a0aed86 ) )
    {
        var_817e9dc6299e35f4 = currentzone < killzone.var_7f6b8b00be70706;
        var_13b7839d5357528 = currentzone == killzone.var_7f6b8b00be70706 && currentcheckpoint < killzone.var_aa316401a0aed86;
        undermax = var_817e9dc6299e35f4 || var_13b7839d5357528;
    }
    else
    {
        undermax = 1;
    }
    
    if ( isdefined( killzone.var_ba156ddd023dd332 ) && isdefined( killzone.var_faff550e7091af5a ) )
    {
        var_f770c1906521788e = killzone.var_ba156ddd023dd332 == currentzone && killzone.var_faff550e7091af5a == currentcheckpoint;
    }
    else
    {
        var_f770c1906521788e = 1;
    }
    
    var_a84d4a7a164d2350 = !killzone.var_5fac99c61ce13251 || player.freeruninfo.wingsuitequipped;
    return overmin && undermax && var_f770c1906521788e && var_a84d4a7a164d2350;
}

/#

    // Namespace frune_killzone
    // Params 2, eflags: 0x4
    // Checksum 0xdaa5afa2, Offset: 0xcd6
    // Size: 0x5a, Type: dev
    function private function_af1a52bea44f26f( host, args )
    {
        var_8005b965951cc17 = namespace_ec33f26de741e14e::function_7fb3afaa98ee9eeb( "<dev string:x6b>" );
        var_8005b965951cc17.var_262b5c20a64e679c = !var_8005b965951cc17.var_262b5c20a64e679c;
        level thread function_a39cfbd5c0431e8f( var_8005b965951cc17.var_262b5c20a64e679c );
    }

    // Namespace frune_killzone
    // Params 1, eflags: 0xc
    // Checksum 0x5560f28b, Offset: 0xd38
    // Size: 0x120, Type: dev
    function private function_a39cfbd5c0431e8f( enabled )
    {
        self notify( #"hash_badf5680b8f2aeb3" );
        self endon( #"hash_badf5680b8f2aeb3" );
        
        if ( !enabled )
        {
            return;
        }
        
        modeinfo = game[ #"frune_tuning" ];
        
        while ( true )
        {
            player = level.players[ 0 ];
            
            if ( !player )
            {
                waitframe();
                continue;
            }
            
            foreach ( killzoneinfo in modeinfo.killzonelist )
            {
                distancesq = distancesquared( player.origin, killzoneinfo.killzone.origin );
                
                if ( distancesq < 2500000000 )
                {
                    function_edc3ee7cf5d950ce( killzoneinfo, player );
                }
            }
            
            waitframe();
        }
    }

    // Namespace frune_killzone
    // Params 2, eflags: 0x4
    // Checksum 0x89c3cc6c, Offset: 0xe60
    // Size: 0x340, Type: dev
    function private function_edc3ee7cf5d950ce( killzoneinfo, player )
    {
        origin = killzoneinfo.killzone.origin;
        isactive = function_319f1cee3a98304f( player, killzoneinfo.killzone );
        
        if ( killzoneinfo.var_3df6b9a672d36926 )
        {
            labelprefix = "<dev string:x177>";
            triggercolor = isactive ? ( 1, 0.5, 0 ) : ( 0.5, 0.5, 0.5 );
            var_f1bc987bca91404 = ( 1, 0.5, 0 );
            var_c44b8733e10ec9d5 = killzoneinfo.var_3df6b9a672d36926;
        }
        else if ( killzoneinfo.var_9083c1d9e333ef44 )
        {
            labelprefix = "<dev string:x183>";
            triggercolor = isactive ? ( 0.5, 0.5, 1 ) : ( 0.5, 0.5, 0.5 );
            var_f1bc987bca91404 = ( 0.5, 0.5, 1 );
            var_c44b8733e10ec9d5 = killzoneinfo.var_9083c1d9e333ef44;
        }
        else if ( killzoneinfo.var_d9d2c167551d546a )
        {
            labelprefix = "<dev string:x18e>";
            triggercolor = isactive ? ( 1, 0, 0 ) : ( 0.5, 0.5, 0.5 );
            var_f1bc987bca91404 = ( 1, 0, 0 );
            var_c44b8733e10ec9d5 = killzoneinfo.var_d9d2c167551d546a;
        }
        else
        {
            labelprefix = "<dev string:x199>";
            triggercolor = ( 0, 0.75, 0 );
        }
        
        killzoneinfo.checkpointlabel = labelprefix + ( var_c44b8733e10ec9d5.checkpoint.zoneindex ?? "<dev string:x1a3>" ) + "<dev string:x1a4>" + ( var_c44b8733e10ec9d5.checkpoint.checkpointindex ?? "<dev string:x1a3>" );
        killzoneinfo.checkpointstate = "<dev string:x1b2>" + ( isactive ? "<dev string:x1bb>" : "<dev string:x1c3>" ) + "<dev string:x1cc>" + ( killzoneinfo.killzone.var_5fac99c61ce13251 ? "<dev string:x1e0>" : "<dev string:x1e5>" );
        
        if ( var_f1bc987bca91404 )
        {
            line( origin, var_c44b8733e10ec9d5.checkpoint.origin, var_f1bc987bca91404, 1 );
        }
        
        print3d( origin + ( 0, 0, 40 ), killzoneinfo.checkpointstate, ( 0.5, 0.5, 1 ), 1, 1, 1, 1 );
        print3d( origin + ( 0, 0, 60 ), killzoneinfo.checkpointlabel, ( 0.5, 0.5, 1 ), 1, 1, 1, 1 );
        print3d( origin + ( 0, 0, 80 ), "<dev string:x1eb>" + ( killzoneinfo.killzone.targetname ?? "<dev string:x1a3>" ) + "<dev string:x1f7>", ( 1, 1, 1 ), 1, 1, 1, 1 );
        drawtrigger( killzoneinfo.killzone, triggercolor, 1, 1, 1 );
    }

    // Namespace frune_killzone
    // Params 2, eflags: 0x4
    // Checksum 0x9ea1e8b5, Offset: 0x11a8
    // Size: 0x9c, Type: dev
    function private function_9739ee76be749d44( host, args )
    {
        if ( !isdefined( level.sealid ) )
        {
            level.sealid = 0;
        }
        
        level.sealid += 1;
        angles = host getplayercameraangles();
        host iprintln( "<dev string:x1f9>" + host.origin + "<dev string:x204>" + angles );
        function_79f6e1d70097dd11( "<dev string:x209>" + level.sealid, host.origin, angles, 425 );
    }

    // Namespace frune_killzone
    // Params 2, eflags: 0x4
    // Checksum 0x661303df, Offset: 0x124c
    // Size: 0x9b, Type: dev
    function private function_6651e204fe03994c( host, args )
    {
        if ( !isdefined( level.sealid ) )
        {
            level.sealid = 0;
        }
        
        level.sealid += 1;
        angles = host getplayercameraangles();
        host iprintln( "<dev string:x1f9>" + host.origin + "<dev string:x204>" + angles );
        function_79f6e1d70097dd11( "<dev string:x209>" + level.sealid, host.origin, angles, 250 );
    }

#/
