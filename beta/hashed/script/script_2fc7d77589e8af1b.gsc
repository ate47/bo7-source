#using script_178d5ed9c26037d0;
#using script_d067fce8d502d11;
#using scripts\common\utility;
#using scripts\cp_mp\frontendutils;
#using scripts\cp_mp\utility\scriptable_door_utility;
#using scripts\engine\scriptable;
#using scripts\mp\utility\streamhint;

#namespace namespace_e3dadaab7220964b;

// Namespace namespace_e3dadaab7220964b
// Params 3
// Checksum 0xb6376582, Offset: 0x27e
// Size: 0x11d
function fadetoblackforplayer( player, fadetoblack, fadetime )
{
    player notify( "start_fade_to_black" );
    player endon( "start_fade_to_black" );
    player endon( "disconnect" );
    assert( !isdefined( fadetime ) || fadetime >= 0, "<dev string:x24>" );
    fadealpha = 0;
    
    if ( fadetoblack )
    {
        fadealpha = 1;
    }
    
    if ( !isdefined( fadetime ) || fadetime == 0 )
    {
        setomnvar( "ui_fob_loading_progress", fadealpha );
        return;
    }
    
    finalalpha = fadealpha;
    fadealpha = 0;
    fadetimecounter = int( fadetime / level.framedurationseconds );
    fadechange = 1 / fadetimecounter;
    
    if ( !fadetoblack )
    {
        fadechange *= -1;
        fadealpha = 1;
    }
    
    while ( fadetimecounter > 0 )
    {
        fadealpha += fadechange;
        
        if ( !isdefined( player ) || !player isconnected() )
        {
            return;
        }
        
        setomnvar( "ui_fob_loading_progress", fadealpha );
        fadetimecounter--;
        waitframe();
    }
    
    if ( !isdefined( player ) )
    {
        return;
    }
    
    setomnvar( "ui_fob_loading_progress", finalalpha );
    player notify( "finish_fade_to_black" );
}

// Namespace namespace_e3dadaab7220964b
// Params 2
// Checksum 0x25b43233, Offset: 0x3a3
// Size: 0x25
function function_2a0ac7d9080f76f( player, enable )
{
    player allowfire( enable );
    player allowads( enable );
}

// Namespace namespace_e3dadaab7220964b
// Params 0
// Checksum 0x6cb4a802, Offset: 0x3d0
// Size: 0x93
function function_54ffe751a4300210()
{
    doors = scriptable_door_utility::scriptable_door_get_in_radius( self.origin, 512, 1000 );
    
    foreach ( door in doors )
    {
        door scriptabledoorfreeze( 1 );
    }
}

// Namespace namespace_e3dadaab7220964b
// Params 0, eflags: 0x4
// Checksum 0xe8646dd6, Offset: 0x46b
// Size: 0x5c
function private function_fd048ed205a845()
{
    if ( isdefined( self.primaryweaponobj ) )
    {
        if ( self hasweapon( self.primaryweaponobj ) )
        {
            self takeweapon( self.primaryweaponobj );
        }
    }
    
    if ( isdefined( self.secondaryweaponobj ) )
    {
        if ( self hasweapon( self.secondaryweaponobj ) )
        {
            self takeweapon( self.secondaryweaponobj );
        }
    }
}

// Namespace namespace_e3dadaab7220964b
// Params 0, eflags: 0x4
// Checksum 0x67d0da21, Offset: 0x4cf
// Size: 0x6b
function private function_8c7a5b2867bde7()
{
    if ( !( isdefined( self.primaryweaponobj ) && isdefined( self.secondaryweaponobj ) ) )
    {
        namespace_285f2d8d2827221c::update_player_weapon();
    }
    
    if ( isdefined( self.primaryweaponobj ) )
    {
        self giveweapon( self.primaryweaponobj );
    }
    
    if ( isdefined( self.secondaryweaponobj ) )
    {
        self giveweapon( self.secondaryweaponobj );
    }
    
    self switchtoweaponimmediate( self.primaryweaponobj );
}

// Namespace namespace_e3dadaab7220964b
// Params 0
// Checksum 0x6f96c980, Offset: 0x542
// Size: 0x15c
function function_93b1960c20cec5f8()
{
    self function_cb8df376b3e57420();
    setomnvar( "ui_fob_loading_progress", 0.1 );
    
    if ( isdefined( level.playerspawnent ) )
    {
        groundpos = level.playerspawnent.origin;
    }
    else if ( isdefined( level.camera_walkable_space ) )
    {
        groundpos = level.camera_walkable_space.basecam.origin;
    }
    
    if ( isdefined( self.headmodel ) )
    {
        self detach( self.headmodel );
    }
    
    bodymodelname = self getcustomizationbody();
    headmodelname = self getcustomizationhead();
    viewmodelname = self getcustomizationviewmodel();
    self setmodel( bodymodelname );
    self setviewmodel( viewmodelname );
    
    if ( isdefined( headmodelname ) )
    {
        self attach( headmodelname, "", 1 );
        self.headmodel = headmodelname;
    }
    
    self setclothtype( #"vestlight" );
    self setgeartype( #"millghtgr" );
    self.pers[ "streamSyncComplete" ] = 1;
    println( "<dev string:x5b>" );
    streamhint::playerstreamhintlocation( groundpos, 50000 );
    fadetoblackforplayer( self, 1, 0 );
    streamhint::playerwaittillstreamhintcomplete();
    fadetoblackforplayer( self, 0, 0.5 );
    self setnormalhealth( 1 );
}

// Namespace namespace_e3dadaab7220964b
// Params 0
// Checksum 0xeb1cdd88, Offset: 0x6a6
// Size: 0x14b
function frontend_spawnplayer()
{
    println( "<dev string:x76>" );
    self.guid = 0;
    self.team = "allies";
    self function_cb8df376b3e57420();
    
    if ( isdefined( level.playerspawnent ) )
    {
        groundpos = utility::groundpos( level.playerspawnent.origin );
        spawnangles = level.playerspawnent.angles;
        
        if ( level.var_84937cfb956d7c1d )
        {
            spawnangles = ( 0, 90, 0 );
        }
        
        self spawn( groundpos, spawnangles );
    }
    else if ( isdefined( level.camera_walkable_space ) )
    {
        groundpos = utility::groundpos( level.camera_walkable_space.basecam.origin );
        self spawn( groundpos, level.camera_walkable_space.basecam.angles );
    }
    
    self setnormalhealth( 1 );
    waitframe();
    function_8c7a5b2867bde7();
    function_1b6fa013c0c2b251( 0 );
    self setclienttriggeraudiozone( "frontend_walkable_space", 0.25 );
    setmusicstate( "" );
    self setcamerathirdperson( 1 );
    function_2a0ac7d9080f76f( self, 0 );
    function_54ffe751a4300210();
    thread infiniteammo();
}

// Namespace namespace_e3dadaab7220964b
// Params 6, eflags: 0x4
// Checksum 0x14b94583, Offset: 0x7f9
// Size: 0x6f
function private function_59c3f2207c0c8735( instance, part, state, player, bautouse, usestring )
{
    if ( isdefined( instance ) && state != "objectivedisable" )
    {
        setomnvar( "ui_walkable_scene_trigger_index", instance.triggerindex );
        wait 2;
        setomnvar( "ui_walkable_scene_trigger_index", -1 );
    }
}

// Namespace namespace_e3dadaab7220964b
// Params 1
// Checksum 0xfaecc356, Offset: 0x870
// Size: 0x8c
function function_42cec6872280e398( stateinfo )
{
    var_f5eb361fd2d11f7e = strtok( stateinfo, "/" );
    var_f5eb361fd2d11f7e = strtok( stateinfo, "+" );
    
    if ( isdefined( var_f5eb361fd2d11f7e ) )
    {
        scriptablename = var_f5eb361fd2d11f7e[ 0 ];
        scriptablestate = var_f5eb361fd2d11f7e[ 1 ];
        
        if ( isdefined( scriptablename ) && isdefined( level.scriptables[ scriptablename ] ) )
        {
            scriptable = level.scriptables[ scriptablename ][ "scriptable" ];
            scriptable setscriptablepartstate( scriptablename, scriptablestate );
        }
    }
}

// Namespace namespace_e3dadaab7220964b
// Params 2, eflags: 0x4
// Checksum 0x652bbf8d, Offset: 0x904
// Size: 0x88
function private setstate( scriptablename, var_64fe4b8a97fb0c2d )
{
    state = undefined;
    
    if ( var_64fe4b8a97fb0c2d == "1" )
    {
        state = "objectivesplash";
    }
    else if ( var_64fe4b8a97fb0c2d == "2" )
    {
        state = "objectivedisable";
    }
    else if ( var_64fe4b8a97fb0c2d == "3" )
    {
        state = "objective";
    }
    
    if ( state )
    {
        scriptable = level.scriptables[ scriptablename ][ "scriptable" ];
        scriptable setscriptablepartstate( scriptablename, state );
    }
}

// Namespace namespace_e3dadaab7220964b
// Params 0, eflags: 0x4
// Checksum 0xd9d4e788, Offset: 0x994
// Size: 0x4f
function private getunlocks()
{
    sceneinteractables = getgamemodescriptbundle().triggersetup;
    
    if ( sceneinteractables )
    {
        interactables = getscriptbundle( sceneinteractables );
        
        if ( interactables )
        {
            unlocks = interactables.unlockdata;
            return unlocks;
        }
    }
    
    return undefined;
}

// Namespace namespace_e3dadaab7220964b
// Params 1
// Checksum 0x33ab5b18, Offset: 0x9ec
// Size: 0x19d
function function_b14158045d06087d( statestring )
{
    sstate = strtok( statestring, "/" );
    scriptablestates = strtok( sstate[ 0 ], "+" );
    
    if ( scriptablestates )
    {
        index = 0;
        unlocks = getunlocks();
        
        if ( unlocks )
        {
            foreach ( unlock in unlocks )
            {
                var_220bbb169e68b0fa = unlock.var_a4b97d76317fe1e9;
                
                foreach ( var_71af9d27251cd56d in var_220bbb169e68b0fa )
                {
                    scriptablename = var_71af9d27251cd56d.scriptable;
                    
                    if ( scriptablename )
                    {
                        if ( scriptablename != "dmz_deploy" )
                        {
                            if ( scriptablestates[ index ] )
                            {
                                scriptablestate = scriptablestates[ index ];
                                level thread setstate( scriptablename, scriptablestate );
                            }
                            
                            index++;
                            continue;
                        }
                        
                        scriptablestate = sstate[ 1 ];
                        level thread setstate( scriptablename, scriptablestate );
                    }
                }
            }
        }
    }
}

// Namespace namespace_e3dadaab7220964b
// Params 0, eflags: 0x4
// Checksum 0x7d0ff336, Offset: 0xb91
// Size: 0x8c
function private function_993a8764ffd3cf2c()
{
    foreach ( scriptable in level.scriptables )
    {
        scriptable.scriptable freescriptable();
    }
    
    level.var_8210ecbe0122c3c1 = 0;
}

// Namespace namespace_e3dadaab7220964b
// Params 0, eflags: 0x4
// Checksum 0x836bfb12, Offset: 0xc25
// Size: 0x92
function private function_a371140c854c137c()
{
    if ( isdefined( level.scriptables ) )
    {
        foreach ( scriptablename, scriptable in level.scriptables )
        {
            scriptable[ "scriptable" ] setscriptablepartstate( scriptablename, "visible" );
        }
    }
}

// Namespace namespace_e3dadaab7220964b
// Params 2, eflags: 0x4
// Checksum 0x26fbab3, Offset: 0xcbf
// Size: 0x156
function private function_577a224b91899036( index, var_ffcafda6249130bd )
{
    if ( !level.var_8210ecbe0122c3c1 )
    {
        level.var_8210ecbe0122c3c1 = 1;
    }
    
    if ( !isdefined( var_ffcafda6249130bd.origin ) )
    {
        println( "<dev string:x89>" );
    }
    
    origin = ( var_ffcafda6249130bd.origin.x, var_ffcafda6249130bd.origin.y, var_ffcafda6249130bd.origin.z );
    angles = ( var_ffcafda6249130bd.angles.x, var_ffcafda6249130bd.angles.y, var_ffcafda6249130bd.angles.z );
    scriptable = spawnscriptable( var_ffcafda6249130bd.scriptable, origin, angles );
    scriptable.triggerindex = index;
    level.scriptables[ var_ffcafda6249130bd.scriptable ] = [];
    level.scriptables[ var_ffcafda6249130bd.scriptable ][ "scriptable" ] = scriptable;
    scriptable::scriptable_addusedcallbackbypart( var_ffcafda6249130bd.scriptable, &function_59c3f2207c0c8735 );
}

// Namespace namespace_e3dadaab7220964b
// Params 2, eflags: 0x4
// Checksum 0x38fd77da, Offset: 0xe1d
// Size: 0x147
function private function_33f865680e2b80aa( index, trigger )
{
    level.var_e15cbf88b9bdcd36[ trigger.var_52f74fb9e50415ca ] = [];
    level.var_e15cbf88b9bdcd36[ trigger.var_52f74fb9e50415ca ][ "index" ] = index;
    level.var_e15cbf88b9bdcd36[ trigger.var_52f74fb9e50415ca ][ "hintString" ] = trigger.hintstring;
    var_48fd1ee9c66e1448 = trigger.var_48fd1ee9c66e1448;
    triggerent = frontendutils::function_28d43ffc378eedeb( var_48fd1ee9c66e1448 );
    
    if ( isdefined( triggerent ) )
    {
        triggerent.var_33f76c2d569e4abf = 0;
        triggerent.triggerindex = index;
        triggerhint = spawn( "script_origin", triggerent.origin );
        triggerhint makeusable();
        triggerhintstring = level.var_e15cbf88b9bdcd36[ triggerent.script_noteworthy ][ "hintString" ];
        
        if ( isdefined( triggerhintstring ) )
        {
            triggerhint sethintstring( triggerhintstring );
            triggerhint sethintdisplayrange( 55 );
            triggerhint setuserange( 55 );
            triggerhint setcursorhint( "hint_noicon" );
            triggerhint sethintonobstruction( "show" );
        }
        
        triggerent thread function_e18f0c39f1cd958d( self );
    }
}

// Namespace namespace_e3dadaab7220964b
// Params 2, eflags: 0x4
// Checksum 0xf0498c1a, Offset: 0xf6c
// Size: 0x19b
function private function_6824b990b7a1ad67( index, modeldata )
{
    level.models[ modeldata.var_52f74fb9e50415ca ] = [];
    level.models[ modeldata.var_52f74fb9e50415ca ][ "index" ] = index;
    level.var_3a0027efc54b67b0[ modeldata.var_52f74fb9e50415ca ][ "hintString" ] = modeldata.hintstring;
    origin = ( modeldata.origin.x, modeldata.origin.y, modeldata.origin.z );
    angles = ( modeldata.angles.x, modeldata.angles.y, modeldata.angles.z );
    model = spawn( "script_model", origin, angles );
    model setmodel( modeldata.model );
    model.triggerindex = index;
    model makeusable();
    triggerhintstring = modeldata.hintstring;
    
    if ( isdefined( triggerhintstring ) )
    {
        model sethintstring( triggerhintstring );
        model sethintdisplayrange( 55 );
        model setuserange( 55 );
        model setcursorhint( "hint_noicon" );
        model sethintonobstruction( "show" );
    }
    
    model thread function_e18f0c39f1cd958d( self );
}

// Namespace namespace_e3dadaab7220964b
// Params 0, eflags: 0x4
// Checksum 0x8468a137, Offset: 0x110f
// Size: 0x142
function private function_9041fe4c904cfed5()
{
    sceneinteractables = getgamemodescriptbundle().triggersetup;
    
    if ( isdefined( sceneinteractables ) )
    {
        interactables = getscriptbundle( sceneinteractables );
        
        if ( isdefined( interactables ) )
        {
            if ( !isdefined( level.var_e15cbf88b9bdcd36 ) )
            {
                level.var_e15cbf88b9bdcd36 = [];
                level.scriptables = [];
                level.models = [];
            }
            
            index = 1;
            
            foreach ( interactable in interactables.triggerdata )
            {
                if ( interactable.scriptable )
                {
                    function_577a224b91899036( index, interactable );
                }
                else if ( interactable.model )
                {
                    function_6824b990b7a1ad67( index, interactable );
                }
                else if ( isdefined( interactable.var_48fd1ee9c66e1448 ) )
                {
                    function_33f865680e2b80aa( index, interactable );
                }
                else
                {
                    println( "<dev string:xc4>" );
                }
                
                index++;
            }
        }
    }
}

// Namespace namespace_e3dadaab7220964b
// Params 1
// Checksum 0x5323bf66, Offset: 0x1259
// Size: 0x97
function function_867cd6025b5f3ea7( var_1d92d20a5f2943f7 )
{
    function_95437b3e5726ad89();
    level.var_84937cfb956d7c1d = ( var_1d92d20a5f2943f7 & 1 ) == 1;
    println( "<dev string:x128>" );
    suitname = utility::function_f825237e0eda5adf();
    self setsuit( suitname );
    println( "<dev string:x138>" );
    self.sessionstate = "playing";
    self.statusicon = "";
    waitframe();
    self.settospectate = 0;
    frontend_spawnplayer();
    function_9041fe4c904cfed5();
    function_a371140c854c137c();
    function_6962d43f0cfea5ad();
}

// Namespace namespace_e3dadaab7220964b
// Params 1
// Checksum 0x6b620c1b, Offset: 0x12f8
// Size: 0x7a
function function_d86b6171373c7132( settospectate )
{
    level.var_9a9e574f38255764 = 1;
    
    if ( settospectate )
    {
        wait 1;
        function_fd048ed205a845();
        wait 1;
        self.sessionstate = "spectator";
        self allowspectateteam( "none", 1 );
        self.settospectate = 1;
        self cameralinkto( level.camera_anchor, "tag_origin" );
        function_9f6834cdc0c1becc();
    }
    else
    {
        function_d93dc0e30142bc0a();
    }
    
    level.var_9a9e574f38255764 = 0;
}

// Namespace namespace_e3dadaab7220964b
// Params 1
// Checksum 0xf677d267, Offset: 0x137a
// Size: 0x81
function function_4ca96946a95337ad( var_e1c871cf960be778 )
{
    level.var_9a9e574f38255764 = 1;
    
    if ( self.settospectate )
    {
        function_95437b3e5726ad89();
    }
    else
    {
        function_fdd6e9ab83afde9();
    }
    
    namespace_285f2d8d2827221c::update_player_weapon();
    self cameraunlink( self.camera_anchor );
    wait 0.1;
    
    if ( var_e1c871cf960be778 )
    {
        self.sessionstate = "playing";
        self.statusicon = "";
        self.settospectate = 0;
    }
    
    level.var_9a9e574f38255764 = 0;
}

// Namespace namespace_e3dadaab7220964b
// Params 0
// Checksum 0x84c75bf6, Offset: 0x1403
// Size: 0x8
function function_56408659ca302e()
{
    self function_cb8df376b3e57420();
}

// Namespace namespace_e3dadaab7220964b
// Params 1
// Checksum 0xdd2cf7ec, Offset: 0x1413
// Size: 0xbb
function function_e18f0c39f1cd958d( player )
{
    while ( true )
    {
        if ( !self.var_33f76c2d569e4abf )
        {
            self waittill( "trigger" );
            self.var_33f76c2d569e4abf = 1;
            
            if ( self.script_noteworthy == "shootingrange" )
            {
                entered_firing_range = 1;
                function_9b59870a39f03b40( player );
            }
            
            setomnvar( "ui_walkable_scene_trigger_index", self.triggerindex );
            continue;
        }
        
        if ( self istouching( player ) )
        {
            waitframe();
            continue;
        }
        
        if ( self.script_noteworthy == "shootingrange" && entered_firing_range )
        {
            entered_firing_range = 0;
            function_6c0406dc8b2329ae( player );
        }
        
        self.var_33f76c2d569e4abf = 0;
        setomnvar( "ui_walkable_scene_trigger_index", -1 );
    }
}

// Namespace namespace_e3dadaab7220964b
// Params 1
// Checksum 0x9e3561b7, Offset: 0x14d6
// Size: 0x1f
function function_9b59870a39f03b40( player )
{
    player setcamerathirdperson( 0 );
    function_2a0ac7d9080f76f( player, 1 );
}

// Namespace namespace_e3dadaab7220964b
// Params 1
// Checksum 0xd6d744dc, Offset: 0x14fd
// Size: 0x1f
function function_6c0406dc8b2329ae( player )
{
    player setcamerathirdperson( 1 );
    function_2a0ac7d9080f76f( player, 0 );
}

// Namespace namespace_e3dadaab7220964b
// Params 0
// Checksum 0x1286c3a0, Offset: 0x1524
// Size: 0x45
function function_975c17bde7e82d6()
{
    self.settospectate = 1;
    self setcamerathirdperson( 0 );
    self clearclienttriggeraudiozone( 2 );
    function_fd048ed205a845();
    self suicide();
    waitframe();
    self allowspectateteam( "none", 1 );
    self.sessionstate = "spectator";
}

// Namespace namespace_e3dadaab7220964b
// Params 1
// Checksum 0x6b43cb8e, Offset: 0x1571
// Size: 0x8c
function function_1b6fa013c0c2b251( newlootid )
{
    function_9dadf27bbe1eeff0();
    
    if ( newlootid == 0 )
    {
        newlootid = level.var_faaa844cfeb8273e;
    }
    
    if ( self.var_dbb03d2597689cae == newlootid )
    {
        return;
    }
    
    self.var_dbb03d2597689cae = newlootid;
    
    if ( !level.var_7d880106a79112ae[ newlootid ] )
    {
        assertmsg( "<dev string:x15b>" + newlootid );
        return;
    }
    
    xmodel = level.var_7d880106a79112ae[ newlootid ].var_ab2df660ca22b8c5;
    backpack::attachbag( xmodel );
}

// Namespace namespace_e3dadaab7220964b
// Params 0, eflags: 0x4
// Checksum 0x981b947e, Offset: 0x1605
// Size: 0x1ec
function private function_9dadf27bbe1eeff0()
{
    if ( level.var_7d880106a79112ae )
    {
        return;
    }
    
    level.var_7d880106a79112ae = [];
    var_1d7f8430b91cca9c = undefined;
    
    foreach ( entry in level.gametypebundle.itemspawnlistrefs )
    {
        if ( entry.ref == "BACKPACKS" )
        {
            var_1d7f8430b91cca9c = getscriptbundle( entry.list );
            break;
        }
    }
    
    if ( !var_1d7f8430b91cca9c )
    {
        assertmsg( "<dev string:x18e>" );
        return;
    }
    
    foreach ( entry in var_1d7f8430b91cca9c.itementries )
    {
        itembundle = getscriptbundlefieldvalues( getxhashasset( entry.itemspawnentry ), [ #"ref", #"hash_146dd41e6d0c890c", #"isbasebackpack" ] );
        lootinfo = getLootItemInfoFromRef( itembundle.ref );
        
        if ( !lootinfo.itemid )
        {
            continue;
        }
        
        if ( itembundle.var_8896e77533d1b75d )
        {
            level.var_faaa844cfeb8273e = lootinfo.itemid;
        }
        
        level.var_7d880106a79112ae[ lootinfo.itemid ] = itembundle;
    }
}

// Namespace namespace_e3dadaab7220964b
// Params 0
// Checksum 0x975449cb, Offset: 0x17f9
// Size: 0x8c
function function_b01ea89ac6576abd()
{
    function_975c17bde7e82d6();
    
    if ( isdefined( level.camera_loadout_showcase_overview ) )
    {
        self setspectatedefaults( level.camera_loadout_showcase_overview.basecam.origin, level.camera_loadout_showcase_overview.basecam.angles );
    }
    
    if ( isdefined( self.camera_anchor ) )
    {
        self cameralinkto( level.camera_anchor, "tag_origin" );
    }
    
    waitframe();
    function_9f6834cdc0c1becc();
    function_993a8764ffd3cf2c();
    level notify( "exit_firing_range" );
}

// Namespace namespace_e3dadaab7220964b
// Params 0, eflags: 0xc
// Checksum 0xe2ab94fe, Offset: 0x188d
// Size: 0xb1
function private infiniteammo()
{
    self notify( "7d168051746041c2" );
    self endon( "7d168051746041c2" );
    level endon( "exit_firing_range" );
    
    while ( true )
    {
        weapons = self getweaponslistprimaries();
        
        foreach ( weapon in weapons )
        {
            self givemaxammo( weapon );
            self setweaponammostock( weapon, weaponmaxammo( weapon ) );
        }
        
        waitframe();
    }
}

