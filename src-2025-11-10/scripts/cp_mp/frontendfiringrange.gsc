#using script_cbb0697de4c5728;
#using scripts\common\utility;
#using scripts\common\weapon;
#using scripts\cp_mp\crossbow;
#using scripts\cp_mp\damagefeedback;
#using scripts\cp_mp\frontendutils;
#using scripts\cp_mp\operator;
#using scripts\engine\math;
#using scripts\engine\utility;

#namespace namespace_98fc1f2179e42c26;

// Namespace namespace_98fc1f2179e42c26
// Params 0
// Checksum 0xf39b1990, Offset: 0xbe6
// Size: 0x6a
function function_3fb8295621b2f890()
{
    if ( getomnvar( "ui_firing_range_has_started" ) == 1 )
    {
        function_d93dc0e30142bc0a();
        currentweapon = self getcurrentweapon();
        
        if ( isdefined( currentweapon ) && isdefined( currentweapon.weaponblueprint ) )
        {
            setomnvar( "ui_firing_range_weapon_in_use_loot_index", currentweapon.weaponblueprint.lootid );
            return;
        }
        
        setomnvar( "ui_firing_range_weapon_in_use_loot_index", -1 );
    }
}

// Namespace namespace_98fc1f2179e42c26
// Params 0
// Checksum 0x86cccacc, Offset: 0xc58
// Size: 0x199
function frontend_spawnplayer()
{
    println( "<dev string:x24>" );
    level.transient_soundbanks = spawn( "sound_transient_soundbanks", ( 0, 0, 0 ) );
    self.guid = 0;
    self.team = "allies";
    groundpos = utility::groundpos( level.var_fe01ffda20f02a93.basecam.origin );
    self spawn( groundpos, level.var_fe01ffda20f02a93.basecam.angles );
    waitframe();
    
    if ( !isdefined( level.var_f451bf7e9a4e2166 ) )
    {
        level.var_f451bf7e9a4e2166 = self getcamerathirdperson();
    }
    
    self setcamerathirdperson( 0 );
    updateplayerweapon();
    self setclienttriggeraudiozone( "frontend_firingrange", 0.25 );
    
    if ( isdefined( self.headmodel ) )
    {
        self detach( self.headmodel );
        self.headmodel = undefined;
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
    level.playerviewowner.var_ba0fee1a3d02f016 = undefined;
    level.playerviewowner namespace_f6c441748a84c612::function_34471fca179a2e27();
}

// Namespace namespace_98fc1f2179e42c26
// Params 1
// Checksum 0xeaca507b, Offset: 0xdf9
// Size: 0x63
function function_2e0a8c011b3d1851( var_aa5ad549f8090ce6 )
{
    if ( var_aa5ad549f8090ce6 )
    {
        function_fdd6e9ab83afde9();
    }
    
    println( "<dev string:x37>" );
    self.sessionstate = "playing";
    self.statusicon = "";
    
    if ( self.settospectate )
    {
        self.settospectate = 0;
        waitframe();
        frontend_spawnplayer();
    }
    
    self cameraunlink();
}

// Namespace namespace_98fc1f2179e42c26
// Params 1
// Checksum 0xd7220869, Offset: 0xe64
// Size: 0x6a
function getdefaultweapon( isprimary )
{
    gamemodebundle = getgamemodescriptbundle();
    
    if ( isdefined( gamemodebundle ) && isdefined( gamemodebundle.weaponlist ) )
    {
        weaponlistbundle = getscriptbundle( gamemodebundle.weaponlist );
        
        if ( isprimary )
        {
            return weaponlistbundle.defaultprimaryweapon;
        }
        
        return weaponlistbundle.defaultsecondaryweapon;
    }
}

// Namespace namespace_98fc1f2179e42c26
// Params 0
// Checksum 0xa46d9e2, Offset: 0xed6
// Size: 0x3a8
function updateplayerweapon()
{
    if ( isdefined( self.primaryweaponobj ) )
    {
        self takeweapon( self.primaryweaponobj );
    }
    
    if ( isdefined( self.secondaryweaponobj ) && self.secondaryweaponobj.basename != "none" )
    {
        self takeweapon( self.secondaryweaponobj );
    }
    
    self.primaryweaponobj = undefined;
    self.secondaryweaponobj = undefined;
    loadoutdata = self function_cb8df376b3e57420();
    self.primaryweaponobj = loadoutdata.primaryweaponentityindex;
    
    if ( !isdefined( self.primaryweaponobj ) || self.primaryweaponobj.basename == "none" )
    {
        primaryweapon = getdefaultweapon( 1 );
        self.primaryweaponobj = weapon::buildweapon( primaryweapon, [], "camo_none", "none", 0, [], "none", [], 0, [] );
    }
    
    self giveweapon( self.primaryweaponobj );
    self setweaponammoclip( self.primaryweaponobj, weaponclipsize( self.primaryweaponobj ) );
    self setweaponammostock( self.primaryweaponobj, weaponmaxammo( self.primaryweaponobj ) );
    self setactionslot( 3, "altmode" );
    self.secondaryweaponobj = loadoutdata.secondaryweaponentityindex;
    
    if ( !isdefined( self.secondaryweaponobj ) || self.secondaryweaponobj.basename == "none" )
    {
        secondaryweapon = getdefaultweapon();
        self.secondaryweaponobj = weapon::buildweapon( secondaryweapon, [], "camo_none", "none", 0, [], "none", [], 0, [] );
    }
    
    self giveweapon( self.secondaryweaponobj );
    self setweaponammoclip( self.secondaryweaponobj, weaponclipsize( self.secondaryweaponobj ) );
    self setweaponammostock( self.secondaryweaponobj, weaponmaxammo( self.secondaryweaponobj ) );
    self switchtoweaponimmediate( self.primaryweaponobj );
    
    if ( isdefined( self.primaryweaponobj ) && isdefined( self.primaryweaponobj.weaponblueprint ) )
    {
        setomnvar( "ui_firing_range_weapon_in_use_loot_index", self.primaryweaponobj.weaponblueprint.lootid );
    }
    else
    {
        setomnvar( "ui_firing_range_weapon_in_use_loot_index", -1 );
    }
    
    if ( !isdefined( level.playerviewowner.operatorcustomization ) )
    {
        level.playerviewowner.operatorcustomization = spawnstruct();
    }
    
    level.playerviewowner.operatorcustomization.skinref = loadoutdata.skinref;
    
    if ( loadoutdata.skinref )
    {
        var_a8d1b98ea8e4c341 = operator::function_cb12383888078591( loadoutdata.skinref );
        
        if ( var_a8d1b98ea8e4c341 )
        {
            level.playerviewowner function_184d7ec010cfaa92( var_a8d1b98ea8e4c341 );
        }
    }
    
    foreach ( dummy in level.var_ea907de02d9b85e6 )
    {
        if ( !dummy.ismovabledummy )
        {
            continue;
        }
        
        dummy thread function_79ec23a13bb782d0( dummy.var_cf49049cfe11e067, self );
    }
    
    thread function_7d5cfd5e524d2aea( self.primaryweaponobj );
}

// Namespace namespace_98fc1f2179e42c26
// Params 0
// Checksum 0x390c2ce0, Offset: 0x1286
// Size: 0x24b
function updateweaponswitch()
{
    self notify( "updateWeaponSwitch" );
    self endon( "updateWeaponSwitch" );
    previousweap = undefined;
    var_24aa2d94cf545ca8 = 1;
    
    while ( true )
    {
        self waittill( "weapon_change" );
        level.var_65d3ec21afb8c1b1 = 0;
        level.var_6d20f1bfea78492e = 0;
        level.var_ec67017c22f64929 = 0;
        level.bulletshitsecondary = 0;
        level.var_ebf908e3e5e96aa7 = 0;
        setomnvar( "ui_firing_range_lane", 1 );
        setomnvar( "ui_firing_range_accuracy", 0 );
        setomnvar( "ui_firing_range_target_kill_count", 0 );
        setomnvar( "ui_firing_range_tot_damage", 0 );
        setomnvar( "ui_firing_range_ttk", 0 );
        
        foreach ( dummy in level.var_ea907de02d9b85e6 )
        {
            dummy.firstdamagetime = undefined;
            
            if ( !dummy.ismovabledummy )
            {
                continue;
            }
            
            dummy thread function_79ec23a13bb782d0( dummy.var_cf49049cfe11e067, self, var_24aa2d94cf545ca8 );
        }
        
        recoil_panel = getent( "recoil_panel", #script_noteworthy );
        
        if ( isdefined( recoil_panel ) )
        {
            if ( var_24aa2d94cf545ca8 )
            {
                recoil_panel.angles = ( 90, 0, 0 );
            }
            
            thread initializepanelbehaviour( recoil_panel );
        }
        
        var_24aa2d94cf545ca8 = 0;
        weapon = self getcurrentweapon();
        
        switch ( weapon.var_1616e6fbba9a722d )
        {
            case %"iw9_dm_crossbow":
                thread crossbow::initcrossbowusage();
                thread crossbow::crossbowusageloop( weapon );
                break;
        }
        
        if ( getweaponhasperk( weapon, "specialty_ub_crossbow" ) )
        {
            thread function_a7c41fa3e19dcfd9();
        }
        
        if ( isdefined( weapon ) && isdefined( weapon.weaponblueprint ) )
        {
            setomnvar( "ui_firing_range_weapon_in_use_loot_index", weapon.weaponblueprint.lootid );
        }
        else
        {
            setomnvar( "ui_firing_range_weapon_in_use_loot_index", -1 );
        }
        
        namespace_f6c441748a84c612::function_215f432bc7345e71( weapon );
        function_d99cec6ead064213( weapon, previousweap );
        previousweap = weapon;
    }
}

// Namespace namespace_98fc1f2179e42c26
// Params 2
// Checksum 0x4219e2f7, Offset: 0x14d9
// Size: 0x1f
function function_d99cec6ead064213( currweaponobj, prevweaponobj )
{
    weaponattachmentperkupdate( currweaponobj, prevweaponobj );
}

// Namespace namespace_98fc1f2179e42c26
// Params 2
// Checksum 0x19c0e7c5, Offset: 0x1500
// Size: 0x239
function weaponattachmentperkupdate( currweaponobj, prevweaponobj )
{
    newattachments = undefined;
    oldattachments = undefined;
    
    if ( !isundefinedweapon( prevweaponobj ) )
    {
        oldattachments = getweaponattachments( prevweaponobj );
        
        if ( oldattachments.size > 0 )
        {
            foreach ( oldattach in oldattachments )
            {
                perks = function_af968e89b7c034f0( prevweaponobj, oldattach );
                
                if ( !isdefined( perks ) )
                {
                    continue;
                }
                
                foreach ( perk in perks )
                {
                    function_ee173ff6ee1c5bdb( perk );
                }
            }
        }
    }
    
    if ( !isundefinedweapon( currweaponobj ) )
    {
        newattachments = getweaponattachments( currweaponobj );
        
        if ( newattachments.size > 0 )
        {
            foreach ( newattach in newattachments )
            {
                perks = function_af968e89b7c034f0( currweaponobj, newattach );
                
                if ( !isdefined( perks ) )
                {
                    continue;
                }
                
                foreach ( perk in perks )
                {
                    frontend_giveperk( perk );
                }
            }
        }
    }
}

// Namespace namespace_98fc1f2179e42c26
// Params 2
// Checksum 0xaa9c84d5, Offset: 0x1741
// Size: 0xc3
function function_af968e89b7c034f0( weaponobj, attachmentname )
{
    attachperks = function_85c28ebf8918783c( weaponobj, attachmentname );
    
    if ( isdefined( attachperks ) )
    {
        var_bb6b6d77d6f9c7f1 = [];
        
        foreach ( perk in attachperks )
        {
            var_3c8ec0ced7385c88 = function_14f8b14e310e3df8( perk );
            
            if ( isdefined( var_3c8ec0ced7385c88 ) )
            {
                var_bb6b6d77d6f9c7f1[ var_bb6b6d77d6f9c7f1.size ] = var_3c8ec0ced7385c88;
            }
        }
        
        return var_bb6b6d77d6f9c7f1;
    }
    
    return undefined;
}

// Namespace namespace_98fc1f2179e42c26
// Params 1
// Checksum 0x9afa4579, Offset: 0x180d
// Size: 0x29
function function_14f8b14e310e3df8( perk )
{
    switch ( perk )
    {
        case #"hash_fbc8c549d7e39757":
            return "specialty_fastreload";
    }
    
    return undefined;
}

// Namespace namespace_98fc1f2179e42c26
// Params 0
// Checksum 0x244458b4, Offset: 0x183f
// Size: 0x12
function function_b4d2e3406027eec5()
{
    updateplayerweapon();
    function_2e0a8c011b3d1851( 1 );
}

// Namespace namespace_98fc1f2179e42c26
// Params 0
// Checksum 0xf04da7ab, Offset: 0x1859
// Size: 0x6b
function function_86a9f6833f670d0d()
{
    player = self;
    loadout_clearperks();
    
    if ( level.var_864871a73700178d )
    {
        player function_55f82390d475f3cc( "specialty_pistoldraw" );
        player function_55f82390d475f3cc( "specialty_selectivehearing" );
        player function_55f82390d475f3cc( "specialty_quickswap" );
        return;
    }
    
    player function_55f82390d475f3cc( "specialty_pistoldraw" );
    player function_55f82390d475f3cc( "specialty_selectivehearing" );
}

// Namespace namespace_98fc1f2179e42c26
// Params 1
// Checksum 0xdfa106d3, Offset: 0x18cc
// Size: 0x5b
function function_55f82390d475f3cc( perkname )
{
    player = self;
    
    if ( !isdefined( player.loadoutperks ) )
    {
        player.loadoutperks = [];
    }
    
    player frontend_giveperk( perkname );
    player.loadoutperks[ player.loadoutperks.size ] = perkname;
}

// Namespace namespace_98fc1f2179e42c26
// Params 1
// Checksum 0x24e958c8, Offset: 0x192f
// Size: 0x23
function frontend_giveperk( perk )
{
    player = self;
    player setperk( perk, 1 );
}

// Namespace namespace_98fc1f2179e42c26
// Params 1
// Checksum 0x636910b4, Offset: 0x195a
// Size: 0x23
function function_ee173ff6ee1c5bdb( perk )
{
    player = self;
    player unsetperk( perk, 1 );
}

// Namespace namespace_98fc1f2179e42c26
// Params 0
// Checksum 0xe09c8550, Offset: 0x1985
// Size: 0xa7
function loadout_clearperks()
{
    player = self;
    
    if ( !isdefined( player.loadoutperks ) )
    {
        return;
    }
    
    foreach ( perkname in player.loadoutperks )
    {
        player unsetperk( perkname, 1 );
    }
    
    player.loadoutperks = [];
}

// Namespace namespace_98fc1f2179e42c26
// Params 0
// Checksum 0x27c90b1a, Offset: 0x1a34
// Size: 0xa1
function function_62bd406831db8f68()
{
    function_95437b3e5726ad89();
    level.thirdpersondvarvalue = getdvarint( @"camera_thirdperson", 0 );
    setdvar( @"camera_thirdperson", 0 );
    level.gamemodebundle = getgamemodescriptbundle();
    println( "<dev string:x5a>" );
    suitname = utility::function_f825237e0eda5adf();
    self setsuit( suitname );
    println( "<dev string:x37>" );
    self.sessionstate = "playing";
    self.statusicon = "";
    waitframe();
    self.settospectate = 0;
    frontend_spawnplayer();
    function_d93dc0e30142bc0a();
}

// Namespace namespace_98fc1f2179e42c26
// Params 0
// Checksum 0xbdba0b85, Offset: 0x1add
// Size: 0x9
function function_bb71c1fb5408ca04()
{
    updateplayerweapon();
}

// Namespace namespace_98fc1f2179e42c26
// Params 0
// Checksum 0x21567979, Offset: 0x1aee
// Size: 0xb1
function function_ffb5613c989cd070()
{
    self setcamerathirdperson( level.var_f451bf7e9a4e2166 );
    level.var_f451bf7e9a4e2166 = undefined;
    setdvar( @"camera_thirdperson", level.thirdpersondvarvalue );
    function_975c17bde7e82d6();
    self setspectatedefaults( level.camera_loadout_showcase_overview.basecam.origin, level.camera_loadout_showcase_overview.basecam.angles );
    self cameralinkto( level.camera_anchor, "tag_origin" );
    setomnvar( "ui_firing_range_has_started", 0 );
    setomnvar( "ui_firing_range_lane", -1 );
    function_9f6834cdc0c1becc();
    level notify( "exit_firing_range" );
}

// Namespace namespace_98fc1f2179e42c26
// Params 0
// Checksum 0x938c09b1, Offset: 0x1ba7
// Size: 0x2c8
function function_232489312b237c86()
{
    setomnvar( "ui_firing_range_has_started", 1 );
    function_95437b3e5726ad89();
    level.thirdpersondvarvalue = getdvarint( @"camera_thirdperson", 0 );
    setdvar( @"camera_thirdperson", 0 );
    
    foreach ( trig in level.lanetriggers )
    {
        trig.var_33f76c2d569e4abf = 0;
    }
    
    if ( function_941bfbb474f39cde() )
    {
        level.var_73cb6a603e7b0a8f = gettime();
        level.var_4ba0784de7cbe969 = 0;
        level.var_abc1df8893fd72c5 = 0;
        level.var_4df5c8890bd99e4f = 0;
        level.var_6c05f0950ec69685 = 0;
    }
    
    level.var_864871a73700178d = getprojectname() == "WZ2" || getprojectname() == "SAW" ? 1 : 0;
    level thread function_533453ef891c8da1();
    level.var_65d3ec21afb8c1b1 = 0;
    level.var_6d20f1bfea78492e = 0;
    level.var_ec67017c22f64929 = 0;
    level.bulletshitsecondary = 0;
    level.var_38e10219d88bb19c = 0;
    level.var_edd9d75d4e242354 = 0;
    level.var_ebf908e3e5e96aa7 = 0;
    level.gamemodebundle = getgamemodescriptbundle();
    setomnvar( "ui_firing_range_accuracy", 0 );
    setomnvar( "ui_firing_range_target_kill_count", 0 );
    setomnvar( "ui_firing_range_tot_damage", 0 );
    setomnvar( "ui_firing_range_target_range", 0 );
    setomnvar( "ui_firing_range_ttk", 0 );
    
    if ( function_120e71871fb92f69() )
    {
        setdvar( @"hash_4033da1e021e6d5", 0 );
        level.var_15a1d4ce0883a965 = gettime();
        level.var_bfc1156387b479bb = 0;
        level.var_7b135d1536298f8e = 0;
        level.var_75cb0c6c413e69d5 = 0;
        level.var_28d38438e08910d4 = 0;
    }
    
    println( "<dev string:x5a>" );
    suitname = utility::function_f825237e0eda5adf();
    self setsuit( suitname );
    println( "<dev string:x37>" );
    self.sessionstate = "playing";
    self.statusicon = "";
    waitframe();
    self.settospectate = 0;
    frontend_spawnplayer();
    function_deef98f99656c6af();
    function_86a9f6833f670d0d();
    thread function_8f6b33a18012760e();
    thread infiniteammo();
    thread updateweaponswitch();
    
    /#
        thread function_f01ff36db2e217b3();
    #/
    
    thread function_438354bc8387bd87();
    recoil_panel = getent( "recoil_panel", #script_noteworthy );
    
    if ( isdefined( recoil_panel ) )
    {
        thread initializepanelbehaviour( recoil_panel );
    }
}

// Namespace namespace_98fc1f2179e42c26
// Params 0
// Checksum 0x6d5a21d8, Offset: 0x1e77
// Size: 0x31
function function_8f6b33a18012760e()
{
    level endon( "exit_firing_range" );
    self notify( "resetWeaponStats" );
    self endon( "resetWeaponStats" );
    
    while ( true )
    {
        level waittill( "firing_range_weapon_stats_reset" );
        function_deef98f99656c6af();
    }
}

// Namespace namespace_98fc1f2179e42c26
// Params 0
// Checksum 0xdb79b4d4, Offset: 0x1eb0
// Size: 0x7a
function function_deef98f99656c6af()
{
    self.var_2102a2d0be3461d9 = 0;
    self.var_77e861f8d388441d = 0;
    self.var_2dcefb4ab3452bf3 = 0;
    self.var_e48b4294f9178c53 = 0;
    self.var_ea29b694b7afa122 = 0;
    self.var_910beafca8020768 = 0;
    self.var_a68b4227d7dc67b9 = 0;
    self.var_4a28bdd45dfb1a7d = 0;
    self.var_f5bdad532aeadd53 = 0;
    self.var_f59814ff13303233 = 0;
    self.var_c2dc71d5213e6802 = 0;
    self.var_491885e356b317c8 = 0;
}

// Namespace namespace_98fc1f2179e42c26
// Params 0
// Checksum 0xd6dae7ac, Offset: 0x1f32
// Size: 0xaf
function function_975c17bde7e82d6()
{
    self.settospectate = 1;
    
    if ( isdefined( self.primaryweaponobj ) )
    {
        if ( self hasweapon( self.primaryweaponobj ) )
        {
            self takeweapon( self.primaryweaponobj );
            self clearclienttriggeraudiozone( 3 );
        }
    }
    
    if ( isdefined( self.secondaryweaponobj ) )
    {
        if ( self hasweapon( self.secondaryweaponobj ) )
        {
            self takeweapon( self.secondaryweaponobj );
        }
    }
    
    self suicide();
    waitframe();
    
    if ( isent( level.transient_soundbanks ) )
    {
        level.transient_soundbanks delete();
    }
    
    self allowspectateteam( "none", 1 );
    self.sessionstate = "spectator";
}

// Namespace namespace_98fc1f2179e42c26
// Params 0
// Checksum 0x42fa4713, Offset: 0x1fe9
// Size: 0x29, Type: bool
function function_120e71871fb92f69()
{
    return getdvarint( @"hash_e46b4b4f19be660b", 0 ) == 1 && getdvarint( @"hash_c006752ec3578568", -1 ) > -1;
}

// Namespace namespace_98fc1f2179e42c26
// Params 0
// Checksum 0xef334762, Offset: 0x201b
// Size: 0xc3
function function_9020b424ac3b3f08()
{
    var_57a1f29c598edb97 = [ "bundle_id", getdvarint( @"hash_c006752ec3578568" ), "nb_bullet_fired", level.var_bfc1156387b479bb ?? 0, "nb_inspection", getdvarint( @"hash_4033da1e021e6d5" ), "nb_target_killed", level.var_28d38438e08910d4 ?? 0, "accuracy", level.var_75cb0c6c413e69d5 ?? 0, "time_spent_in_firing_range", gettime() - ( level.var_15a1d4ce0883a965 ?? gettime() ) ];
    dlog_recordevent( "dlog_event_try_a_gun_stats", var_57a1f29c598edb97 );
}

// Namespace namespace_98fc1f2179e42c26
// Params 0
// Checksum 0xb6633140, Offset: 0x20e6
// Size: 0x14, Type: bool
function function_941bfbb474f39cde()
{
    return getdvarint( @"hash_3e7f94c85db5827a", 1 ) == 1;
}

// Namespace namespace_98fc1f2179e42c26
// Params 0
// Checksum 0x14a34eea, Offset: 0x2103
// Size: 0x171
function function_1339d93f11b7327e()
{
    if ( !function_941bfbb474f39cde() )
    {
        return;
    }
    
    var_7e2a1fb26e960434 = [ "time_spent_in_firing_range", gettime() - level.var_73cb6a603e7b0a8f ?? 0, "last_primary_weapon", self.primaryweaponobj.basename ?? "", "last_primary_type", "todo", "last_seconday_weapon", self.secondaryweaponobj.basename ?? "", "last_secondary_type", "todo", "last_bullets_fired", level.var_65d3ec21afb8c1b1 + level.var_ec67017c22f64929 ?? 0, "last_targets_killed", getomnvar( "ui_firing_range_target_kill_count" ), "last_accuracy", getomnvar( "ui_firing_range_accuracy" ), "num_plates_zero", level.var_4ba0784de7cbe969 ?? 0, "num_plates_one", level.var_abc1df8893fd72c5 ?? 0, "num_plates_two", level.var_4df5c8890bd99e4f ?? 0, "num_plates_three", level.var_6c05f0950ec69685 ?? 0 ];
    dlog_recordevent( "dlog_event_firing_range_stats", var_7e2a1fb26e960434 );
}

// Namespace namespace_98fc1f2179e42c26
// Params 0
// Checksum 0xb0bb81f4, Offset: 0x227c
// Size: 0x82
function function_88d7f49f9e5ab266()
{
    if ( !function_941bfbb474f39cde() )
    {
        return;
    }
    
    switch ( level.var_a915beb05994e493 )
    {
        case 0:
            level.var_4ba0784de7cbe969++;
            break;
        case 1:
            level.var_abc1df8893fd72c5++;
            break;
        case 2:
            level.var_4df5c8890bd99e4f++;
            break;
        case 3:
            level.var_6c05f0950ec69685++;
            break;
    }
}

// Namespace namespace_98fc1f2179e42c26
// Params 0
// Checksum 0xb8991eee, Offset: 0x2306
// Size: 0x1dd
function function_4dbdb6e6debb40ee()
{
    function_1339d93f11b7327e();
    self setcamerathirdperson( level.var_f451bf7e9a4e2166 );
    level.var_f451bf7e9a4e2166 = undefined;
    setdvar( @"camera_thirdperson", level.thirdpersondvarvalue );
    function_975c17bde7e82d6();
    self setspectatedefaults( level.camera_loadout_showcase_overview.basecam.origin, level.camera_loadout_showcase_overview.basecam.angles );
    self cameralinkto( level.camera_anchor, "tag_origin" );
    setomnvar( "ui_firing_range_has_started", 0 );
    setomnvar( "ui_firing_range_lane", -1 );
    function_9f6834cdc0c1becc();
    
    if ( function_120e71871fb92f69() )
    {
        function_9020b424ac3b3f08();
        setdvar( @"hash_c006752ec3578568", -1 );
    }
    
    level.var_65d3ec21afb8c1b1 = 0;
    level.var_6d20f1bfea78492e = 0;
    level.var_ec67017c22f64929 = 0;
    level.bulletshitsecondary = 0;
    level.var_38e10219d88bb19c = 0;
    level.var_edd9d75d4e242354 = 0;
    level.var_ebf908e3e5e96aa7 = 0;
    function_deef98f99656c6af();
    setomnvar( "ui_firing_range_accuracy", 0 );
    setomnvar( "ui_firing_range_target_kill_count", 0 );
    setomnvar( "ui_firing_range_tot_damage", 0 );
    setomnvar( "ui_firing_range_target_range", 0 );
    setomnvar( "ui_firing_range_ttk", 0 );
    level notify( "exit_firing_range" );
    
    foreach ( target in level.var_ea907de02d9b85e6 )
    {
        target thread respawntarget();
    }
}

// Namespace namespace_98fc1f2179e42c26
// Params 0
// Checksum 0x18083ed9, Offset: 0x24eb
// Size: 0x1d
function function_7eb21b04340b04d()
{
    if ( getomnvar( "ui_firing_range_has_started" ) == 1 )
    {
        function_d93dc0e30142bc0a();
        function_4dbdb6e6debb40ee();
    }
}

// Namespace namespace_98fc1f2179e42c26
// Params 0
// Checksum 0x3adc70d7, Offset: 0x2510
// Size: 0xb1
function infiniteammo()
{
    level endon( "exit_firing_range" );
    self notify( "infiniteAmmo" );
    self endon( "infiniteAmmo" );
    
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

// Namespace namespace_98fc1f2179e42c26
// Params 1, eflags: 0x4
// Checksum 0x20ca33d5, Offset: 0x25c9
// Size: 0x1a3
function private initializepanelbehaviour( panel )
{
    level endon( "exit_firing_range" );
    level notify( "initializePanelBehaviour" );
    level endon( "initializePanelBehaviour" );
    
    if ( !isdefined( level.var_4a3c3d2624e15d37 ) )
    {
        level.var_4a3c3d2624e15d37 = 0;
    }
    
    buttonhelddown = 0;
    
    foreach ( dummy in level.var_ea907de02d9b85e6 )
    {
        if ( !dummy.ismovabledummy )
        {
            continue;
        }
        
        movabledummy = dummy;
    }
    
    while ( true )
    {
        var_978ae5ddcdf4930a = self function_9ed57b4b1e9ea092();
        
        if ( var_978ae5ddcdf4930a && !buttonhelddown )
        {
            buttonhelddown = 1;
            level.var_4a3c3d2624e15d37++;
            
            if ( level.var_4a3c3d2624e15d37 > 2 )
            {
                level.var_4a3c3d2624e15d37 = 0;
            }
            
            switch ( level.var_4a3c3d2624e15d37 )
            {
                case 0:
                    panel function_7b4575eadc9f4( 1 );
                    break;
                case 1:
                    movabledummy function_aba6b28f7dfdf4de( 0 );
                    break;
                case 2:
                    removeallfxmarks();
                    panel function_7b4575eadc9f4( 0 );
                    movabledummy function_aba6b28f7dfdf4de( 1 );
                    break;
            }
            
            wait 0.8;
        }
        else if ( !var_978ae5ddcdf4930a && buttonhelddown )
        {
            buttonhelddown = 0;
        }
        
        waitframe();
    }
}

// Namespace namespace_98fc1f2179e42c26
// Params 0
// Checksum 0x6a616635, Offset: 0x2774
// Size: 0x19b
function function_a7c41fa3e19dcfd9()
{
    level endon( "exit_firing_range" );
    self endon( "weapon_change" );
    self endon( "death" );
    
    while ( true )
    {
        self waittill( "missile_fire", glgrenade, objweapon );
        
        if ( isdefined( objweapon ) && isdefined( glgrenade ) && getweaponhasperk( objweapon, "specialty_ub_crossbow" ) )
        {
            glgrenade waittill( "missile_stuck", stuckto, stuckpart, surfacetype, velocity, position, normal );
            stuckposition = position - normal;
            grenade = self launchgrenade( "t10_ub_crossbow_explosive_bolt_mp", stuckposition, ( 0, 0, 0 ) );
            grenade.angles = glgrenade.angles;
            
            if ( isdefined( stuckto ) )
            {
                if ( isdefined( stuckpart ) && stuckpart != "scriptbrushmodeldummy" && stuckto.classname != "script_brushmodel" )
                {
                    grenade linkto( stuckto, stuckpart );
                }
                else
                {
                    grenade linkto( stuckto );
                }
            }
            else
            {
                staticlink = utility::spawn_script_origin( stuckposition, normal );
                grenade linkto( staticlink );
                grenade.staticlink = staticlink;
                staticlink thread utility::function_439f7faeb95d2028( 3 );
            }
            
            if ( grenade isscriptable() && grenade getscriptableparthasstate( "state", "warning" ) )
            {
                grenade setscriptablepartstate( "state", "warning" );
            }
            
            if ( isdefined( glgrenade ) )
            {
                glgrenade delete();
            }
        }
    }
}

// Namespace namespace_98fc1f2179e42c26
// Params 1
// Checksum 0x377fbc26, Offset: 0x2917
// Size: 0xc9
function function_aba6b28f7dfdf4de( var_f694a141b5dd55de )
{
    dummy = self;
    rotatetoangles = var_f694a141b5dd55de ? ( 90, 0, 0 ) : ( 0, 0, 0 );
    var_f694a141b5dd55de = !var_f694a141b5dd55de;
    dummy.scriptorigin rotateto( rotatetoangles, 0.8 );
    
    if ( var_f694a141b5dd55de )
    {
        dummy.var_cf49049cfe11e067 setcandamage( 1 );
        dummy enableaimassist();
        dummy solid();
        dummy playsound( "amb_emt_t10_shooting_range_target_down" );
        return;
    }
    
    dummy.var_cf49049cfe11e067 setcandamage( 0 );
    dummy disableaimassist();
    dummy notsolid();
    dummy playsound( "amb_emt_t10_shooting_range_target_up" );
    dummy notify( "entitydeleted" );
}

// Namespace namespace_98fc1f2179e42c26
// Params 1
// Checksum 0xa7756d17, Offset: 0x29e8
// Size: 0x7d
function function_7b4575eadc9f4( var_a3aab0a6fe311248 )
{
    panel = self;
    soundtoplay = var_a3aab0a6fe311248 ? "amb_emt_t10_shooting_range_panel_up" : "amb_emt_t10_shooting_range_panel_down";
    rotatetoangle = var_a3aab0a6fe311248 ? ( 90, 0, 0 ) : ( 0, 0, 0 );
    var_a3aab0a6fe311248 = !var_a3aab0a6fe311248;
    panel playsound( soundtoplay );
    panel rotateto( rotatetoangle, 0.8, 0, 0 );
}

/#

    // Namespace namespace_98fc1f2179e42c26
    // Params 0
    // Checksum 0x9cae0e12, Offset: 0x2a6d
    // Size: 0x58, Type: dev
    function function_f01ff36db2e217b3()
    {
        level endon( "<dev string:x6a>" );
        
        while ( true )
        {
            var_efcc1a91acb98c0d = getdvarint( @"hash_ba7afa4a670ade73", -1 );
            
            if ( var_efcc1a91acb98c0d != -1 )
            {
                setdvar( @"hash_ba7afa4a670ade73", -1 );
                self notify( "<dev string:x7f>", "<dev string:x92>", var_efcc1a91acb98c0d );
            }
            
            waitframe();
        }
    }

#/

// Namespace namespace_98fc1f2179e42c26
// Params 1
// Checksum 0x1dff8984, Offset: 0x2acd
// Size: 0xe8
function function_2de3b0117ec0842c( numplates )
{
    var_52102604ae74f363 = level.var_a915beb05994e493;
    level.var_a915beb05994e493 = int( max( 0, numplates ) );
    setomnvar( "ui_firing_range_num_dummy_plates", level.var_a915beb05994e493 );
    
    foreach ( ent in level.var_ea907de02d9b85e6 )
    {
        ent.var_cf49049cfe11e067.health = function_c76d6117f2e172ac();
    }
    
    if ( var_52102604ae74f363 != level.var_a915beb05994e493 )
    {
        function_88d7f49f9e5ab266();
    }
}

// Namespace namespace_98fc1f2179e42c26
// Params 0
// Checksum 0x15cf0209, Offset: 0x2bbd
// Size: 0x54
function function_438354bc8387bd87()
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    level endon( "exit_firing_range" );
    
    while ( true )
    {
        self waittill( "luinotifyserver", channel, val );
        
        if ( channel == "ui_set_dummy_num_plates" )
        {
            function_2de3b0117ec0842c( val );
        }
    }
}

// Namespace namespace_98fc1f2179e42c26
// Params 0
// Checksum 0x89d67be6, Offset: 0x2c19
// Size: 0x23
function function_c76d6117f2e172ac()
{
    healthamount = function_608451b25e6fe222() + level.var_a915beb05994e493 * 50;
    return healthamount;
}

// Namespace namespace_98fc1f2179e42c26
// Params 0
// Checksum 0x1a4391e4, Offset: 0x2c45
// Size: 0x32
function function_608451b25e6fe222()
{
    if ( level.var_864871a73700178d )
    {
        defaultmaxhealth = getdvarint( @"hash_74425c065132b12e", 150 );
    }
    else
    {
        defaultmaxhealth = 100;
    }
    
    return defaultmaxhealth;
}

// Namespace namespace_98fc1f2179e42c26
// Params 0
// Checksum 0xdbb00e2e, Offset: 0x2c80
// Size: 0x4aa
function function_533453ef891c8da1()
{
    if ( !isdefined( level.var_ea907de02d9b85e6 ) )
    {
        level.var_a915beb05994e493 = level.var_864871a73700178d ? 3 : 0;
        setomnvar( "ui_firing_range_num_dummy_plates", level.var_a915beb05994e493 );
        level.var_ea907de02d9b85e6 = frontendutils::function_55f1609e123f6a51( "enemyTarget" );
        
        foreach ( ent in level.var_ea907de02d9b85e6 )
        {
            ent.var_cf49049cfe11e067 = spawn( "script_origin", ent.origin );
            ent.var_cf49049cfe11e067.owner = ent;
            ent.var_cf49049cfe11e067.health = function_c76d6117f2e172ac();
            ent.brushes = getentarray( ent.target, #targetname );
            
            foreach ( brush in ent.brushes )
            {
                brush.owner = ent;
                brush thread function_dfac2d0f32995de9();
                brush setcandamage( 1 );
            }
            
            ent.var_cf49049cfe11e067 thread function_446d540a417a481c();
            ent namespace_f6c441748a84c612::function_34471fca179a2e27();
            
            if ( getdvarint( @"hash_19cb7a793ce35f97", 0 ) == 0 )
            {
                ent thread function_64d23f1f2c62f4c3();
            }
        }
        
        movabledummy = getent( "enemyTargetRail_cer", #targetname );
        
        if ( isdefined( movabledummy ) )
        {
            level.var_ea907de02d9b85e6[ level.var_ea907de02d9b85e6.size ] = movabledummy;
            movabledummy.var_cf49049cfe11e067 = spawn( "script_origin", movabledummy.origin );
            movabledummy.var_cf49049cfe11e067.owner = movabledummy;
            movabledummy.var_cf49049cfe11e067.health = function_c76d6117f2e172ac();
            movabledummy.mountrailing = getent( "railTarget_cer", #targetname );
            movabledummy linkto( movabledummy.mountrailing, "tag_origin" );
            movabledummy.scriptorigin = spawn( "script_model", movabledummy.mountrailing.origin );
            movabledummy.scriptorigin setmodel( "tag_origin" );
            movabledummy.mountrailing linkto( movabledummy.scriptorigin, "tag_origin" );
            movabledummy.brushes = getentarray( movabledummy.target, #targetname );
            movabledummy.ismovabledummy = 1;
            
            foreach ( brush in movabledummy.brushes )
            {
                brush.owner = movabledummy;
                brush enablelinkto();
                brush linkto( movabledummy, "tag_origin" );
                brush thread function_dfac2d0f32995de9();
            }
            
            movabledummy.var_cf49049cfe11e067 thread function_446d540a417a481c();
            movabledummy namespace_f6c441748a84c612::function_34471fca179a2e27();
            
            if ( getdvarint( @"hash_19cb7a793ce35f97", 0 ) == 0 )
            {
                movabledummy thread function_64d23f1f2c62f4c3();
            }
        }
    }
    else
    {
        foreach ( ent in level.var_ea907de02d9b85e6 )
        {
            ent.var_cf49049cfe11e067.health = function_c76d6117f2e172ac();
        }
    }
    
    function_88d7f49f9e5ab266();
}

// Namespace namespace_98fc1f2179e42c26
// Params 0
// Checksum 0x60108d9c, Offset: 0x3132
// Size: 0x16b
function function_64d23f1f2c62f4c3()
{
    defaultpos = self.origin + ( 0, 0, 40 );
    self.lastimpactpos = defaultpos;
    defaultdir = ( 0, 0, 1 );
    self.var_b7b7296658a13c3f = defaultdir;
    
    while ( true )
    {
        self waittill( "damage", damage, attacker, direction_vec, point, meansofdeath, modelname, tagname, partname, idflags, weapon, origin, angles, normal, var_7edd83e15d43a9b0 );
        defaultpos = self.origin + ( 0, 0, 40 );
        
        if ( distance( point, defaultpos ) < 48 )
        {
            self.lastimpactpos = point;
            self.var_b7b7296658a13c3f = direction_vec;
        }
        else
        {
            self.lastimpactpos = defaultpos;
            self.var_b7b7296658a13c3f = defaultdir;
        }
        
        /#
            level thread drawsphere( self.lastimpactpos, 2, 5, ( 1, 0, 0 ) );
        #/
    }
}

// Namespace namespace_98fc1f2179e42c26
// Params 1
// Checksum 0xe2414450, Offset: 0x32a5
// Size: 0x3c1
function function_dfac2d0f32995de9( ismodel )
{
    var_ad6d693d882e5e9b = self;
    data = spawnstruct();
    data.damage = 0;
    level.playerviewowner.lastshottime = 0;
    
    while ( true )
    {
        var_ad6d693d882e5e9b waittill( "damage", damage, attacker, direction_vec, point, meansofdeath, modelname, tagname, partname, idflags, weapon, origin, angles, normal, var_7edd83e15d43a9b0 );
        
        if ( level.playerviewowner.lastshottime == gettime() )
        {
            continue;
        }
        
        level.playerviewowner.lastshottime = gettime();
        attacker = level.playerviewowner;
        
        if ( ismodel )
        {
            victim = var_ad6d693d882e5e9b;
        }
        else
        {
            victim = var_ad6d693d882e5e9b.owner;
        }
        
        hitloc = "torso_upper";
        
        if ( isdefined( var_ad6d693d882e5e9b.script_noteworthy ) )
        {
            switch ( var_ad6d693d882e5e9b.script_noteworthy )
            {
                case #"hash_b107b5547c755d23":
                    hitloc = "head";
                    break;
                case #"hash_92bbfe494d03d772":
                    hitloc = "neck";
                    break;
                case #"hash_24df6c1a53c03c53":
                    hitloc = "torso_upper";
                    break;
                case #"hash_aa63b4eb30a83f7a":
                    hitloc = "torso_lower";
                    break;
                case #"hash_acfb90a9d1526a42":
                    hitloc = "right_arm_upper";
                    break;
                case #"hash_c12ea512f3bb658f":
                    hitloc = "right_arm_lower";
                    break;
                case #"hash_86d069a9bd083804":
                    hitloc = "right_leg_upper";
                    break;
                case #"hash_713cfc12ca4421d9":
                    hitloc = "right_leg_lower";
                    break;
            }
        }
        
        data.origin = var_ad6d693d882e5e9b.origin;
        data.attacker = attacker;
        data.meansofdeath = meansofdeath;
        data.weapon = attacker getcurrentweapon();
        data.hitloc = hitloc;
        data.idflags = idflags;
        
        if ( data.idflags & 262144 )
        {
            weapondamagetype = 2;
        }
        else
        {
            weapondamagetype = 0;
        }
        
        scaleddamage = int( floor( damage * getweaponhitlocdamagemultiplier( attacker getcurrentweapon(), hitloc, weapondamagetype ) ) );
        data.damage = scaleddamage;
        
        if ( isspreadweapon( data.weapon ) )
        {
            data.damage = spreadshotdamagemod( victim, data.attacker, data.weapon, data.damage, data.idflags );
        }
        
        if ( data.damage > 0 )
        {
            /#
                print3d( var_ad6d693d882e5e9b.origin, data.damage, ( 1, 0, 0 ), 1, 0.75, 75 );
            #/
            
            /#
                print3d( var_ad6d693d882e5e9b.origin + ( 0, 0, 13 ), hitloc, ( 1, 1, 1 ), 1, 0.5, 75 );
            #/
            
            victim thread processdamagethisframe( data );
        }
    }
}

// Namespace namespace_98fc1f2179e42c26
// Params 1
// Checksum 0x616c429d, Offset: 0x366e
// Size: 0xc3b
function processdamagethisframe( instance )
{
    var_cf49049cfe11e067 = self.var_cf49049cfe11e067;
    
    if ( var_cf49049cfe11e067.health <= 0 )
    {
        return;
    }
    
    if ( !isdefined( level.var_117c55a6dfeb9860 ) || level.var_117c55a6dfeb9860.damage < instance.damage )
    {
        level.var_117c55a6dfeb9860 = instance;
    }
    
    level notify( "processDamageThisFrame" );
    level endon( "processDamageThisFrame" );
    waittillframeend();
    instance = level.var_117c55a6dfeb9860;
    level.var_117c55a6dfeb9860 = undefined;
    var_6182fa0235c8929e = function_608451b25e6fe222();
    hasarmor = var_cf49049cfe11e067.health > var_6182fa0235c8929e;
    var_50b7d34e641e396a = function_608451b25e6fe222() + 150;
    hitmarkertype = "standard";
    armordamage = 0;
    armorbroke = 0;
    
    if ( hasarmor )
    {
        currentarmor = var_cf49049cfe11e067.health - var_6182fa0235c8929e;
        armordamage = int( clamp( instance.damage, 0, currentarmor ) );
        armorbroke = currentarmor - armordamage == 0;
    }
    
    shouldOhkProtect = function_6663e8f14900ff75( instance.meansofdeath ) && armordamage >= 150;
    var_dab25f734d960262 = function_d0f7407d5f8aaa05( instance.weapon );
    var_f42cd31093febac6 = var_cf49049cfe11e067.health >= var_50b7d34e641e396a;
    
    if ( shouldOhkProtect && var_f42cd31093febac6 )
    {
        if ( instance.damage >= var_cf49049cfe11e067.health && !var_dab25f734d960262 )
        {
            instance.damage = int( clamp( instance.damage, 0, var_cf49049cfe11e067.health - 1 ) );
        }
    }
    
    if ( isdefined( level.matchrules_damagemultiplier ) )
    {
        instance.damage *= level.matchrules_damagemultiplier;
    }
    
    weaponrootstring = getweaponrootstring( instance.weapon );
    
    if ( isdefined( level.var_c02b36c6525a0d19 ) && isdefined( level.var_c02b36c6525a0d19[ weaponrootstring ] ) )
    {
        instance.damage = [[ level.var_c02b36c6525a0d19[ weaponrootstring ] ]]( instance.attacker, var_cf49049cfe11e067, instance.attacker, instance.damage, instance.meansofdeath, instance.weapon, instance.origin.origin, ( 0, 0, 0 ), "none", 0, instance.damage );
    }
    
    var_cf49049cfe11e067 dodamage( instance.damage, instance.origin, instance.attacker, instance.attacker, instance.meansofdeath, instance.weapon, instance.hitloc );
    
    if ( var_cf49049cfe11e067.health < 0 )
    {
        instance.damage += var_cf49049cfe11e067.health;
    }
    
    level.var_ebf908e3e5e96aa7 += int( instance.damage );
    setomnvar( "ui_firing_range_tot_damage", level.var_ebf908e3e5e96aa7 );
    
    if ( !isdefined( self.firstdamagetime ) )
    {
        self.firstdamagetime = gettime();
    }
    
    level notify( "damage_done" );
    isheadshot = instance.hitloc == "head";
    hitdist = math::round_float( distance( instance.attacker.origin, var_cf49049cfe11e067.origin ) / 39.37, 2 );
    ignoreaccuracy = instance.meansofdeath == "MOD_FIRE" || instance.meansofdeath == "MOD_EXPLOSIVE";
    
    if ( !ignoreaccuracy )
    {
        bulletsfired = 1;
        bulletshit = 1;
        
        if ( instance.attacker getcurrentweapon() == instance.attacker.primaryweaponobj )
        {
            level.var_6d20f1bfea78492e = min( level.var_6d20f1bfea78492e + 1, level.var_65d3ec21afb8c1b1 );
            bulletshit = level.var_6d20f1bfea78492e;
            bulletsfired = level.var_65d3ec21afb8c1b1;
            
            if ( function_120e71871fb92f69() )
            {
                level.var_7b135d1536298f8e++;
                var_bfc1156387b479bb = max( 1, level.var_bfc1156387b479bb );
                level.var_75cb0c6c413e69d5 = clamp( level.var_7b135d1536298f8e / var_bfc1156387b479bb, 0, 1 );
            }
            
            if ( isheadshot )
            {
                level.var_38e10219d88bb19c++;
                playsoundatpos( instance.origin, "jup_firingrange_target_bullet_impact_headshot" );
            }
            
            instance.attacker.var_77e861f8d388441d = clamp( level.var_38e10219d88bb19c / bulletsfired, 0, 1 );
            instance.attacker.var_2dcefb4ab3452bf3 = clamp( bulletshit / bulletsfired, 0, 1 );
            instance.attacker.var_e48b4294f9178c53 += int( instance.damage );
            instance.attacker.var_ea29b694b7afa122 = int( instance.damage );
            instance.attacker.var_910beafca8020768 = clamp( hitdist, 0, 100 );
            playsoundatpos( instance.origin, "jup_firingrange_target_bullet_impact" );
        }
        else
        {
            level.bulletshitsecondary = min( level.bulletshitsecondary + 1, level.var_ec67017c22f64929 );
            bulletshit = level.bulletshitsecondary;
            bulletsfired = level.var_ec67017c22f64929;
            
            if ( isheadshot )
            {
                level.var_edd9d75d4e242354++;
                playsoundatpos( instance.origin, "jup_firingrange_target_bullet_impact_headshot" );
            }
            
            instance.attacker.var_4a28bdd45dfb1a7d = bulletsfired == 0 ? 0 : clamp( level.var_edd9d75d4e242354 / bulletsfired, 0, 1 );
            instance.attacker.var_f5bdad532aeadd53 = bulletsfired == 0 ? 0 : clamp( bulletshit / bulletsfired, 0, 1 );
            instance.attacker.var_f59814ff13303233 += int( instance.damage );
            instance.attacker.var_c2dc71d5213e6802 = int( instance.damage );
            instance.attacker.var_491885e356b317c8 = clamp( hitdist, 0, 100 );
            playsoundatpos( instance.origin, "jup_firingrange_target_bullet_impact" );
        }
        
        bulletsfired = max( 1, bulletsfired );
        accuracy = clamp( bulletshit / bulletsfired, 0, 1 );
        setomnvar( "ui_firing_range_accuracy", accuracy );
        println( "<dev string:xad>" + accuracy );
    }
    
    var_238b458b43465af0 = getdvarint( @"hash_c0bf29e81b3a5eec", 1 );
    var_db59c6c1cd1a6d0f = getdvarint( @"hash_d1eeda3bc1bfb41b", 1 );
    icontype = undefined;
    hitsound = getdvar( @"hash_d6875627fd8914de" );
    
    if ( var_238b458b43465af0 || var_db59c6c1cd1a6d0f )
    {
        if ( armorbroke )
        {
            if ( var_238b458b43465af0 )
            {
                if ( var_cf49049cfe11e067.health + instance.damage >= var_50b7d34e641e396a )
                {
                    icontype = "hitarmormaxplatebreak";
                }
                else
                {
                    icontype = "hitarmorlightbreak";
                }
                
                if ( var_f42cd31093febac6 )
                {
                    hitmarkertype = "threeplatearmorbreak";
                }
                else
                {
                    hitmarkertype = "standardarmorbreak";
                }
            }
            
            if ( var_db59c6c1cd1a6d0f )
            {
                hitsound = "hit_marker_3d_armor_break";
            }
        }
        else if ( hasarmor )
        {
            if ( var_238b458b43465af0 )
            {
                if ( var_cf49049cfe11e067.health + instance.damage >= var_50b7d34e641e396a )
                {
                    icontype = "hitarmorlightmaxlevel";
                }
                else
                {
                    icontype = "hitarmorlight";
                }
                
                if ( var_f42cd31093febac6 )
                {
                    hitmarkertype = "threeplatearmor";
                }
                else
                {
                    hitmarkertype = "standardarmor";
                }
            }
        }
    }
    
    if ( var_cf49049cfe11e067.health <= 0 )
    {
        if ( getdvarint( @"hash_19cb7a793ce35f97", 0 ) == 0 )
        {
            isbulletdamage = isdefined( instance.meansofdeath ) && ( utility::isbulletdamage( instance.meansofdeath ) || instance.meansofdeath == "MOD_EXPLOSIVE_BULLET" );
            
            if ( isbulletdamage )
            {
                var_cf49049cfe11e067.owner function_7251ae4f0b47c7e5( var_cf49049cfe11e067.owner.lastimpactpos, var_cf49049cfe11e067.owner.var_b7b7296658a13c3f, instance.attacker, instance.weapon, 1 );
            }
        }
        
        prevvalue = getomnvar( "ui_firing_range_target_kill_count" );
        
        if ( prevvalue <= 500 )
        {
            setomnvar( "ui_firing_range_target_kill_count", prevvalue + 1 );
        }
        
        var_1505d243b4330a94 = math::round_float( ( gettime() - ( self.firstdamagetime ?? gettime() ) ) / 1000, 3 );
        setomnvar( "ui_firing_range_ttk", var_1505d243b4330a94 );
        self.firstdamagetime = undefined;
        
        if ( function_120e71871fb92f69() )
        {
            level.var_28d38438e08910d4++;
        }
        
        if ( instance.attacker getcurrentweapon() == instance.attacker.primaryweaponobj )
        {
            if ( instance.attacker.var_2102a2d0be3461d9 <= 500 )
            {
                instance.attacker.var_2102a2d0be3461d9++;
            }
        }
        else if ( instance.attacker.var_a68b4227d7dc67b9 <= 500 )
        {
            instance.attacker.var_a68b4227d7dc67b9++;
        }
        
        if ( isheadshot )
        {
            self playsoundtoplayer( #"mp_headshot_alert", instance.attacker );
        }
        else
        {
            self playsoundtoplayer( #"mp_kill_alert", instance.attacker );
        }
        
        playsoundatpos( instance.origin + ( 0, 0, 15 ), "jup_firingrange_target_bullet_impact_death" );
        
        if ( self.ismovabledummy )
        {
            thread function_f1d0779f842e7d28( var_cf49049cfe11e067, instance.attacker );
        }
        else
        {
            thread function_eb19123198ad828c( var_cf49049cfe11e067 );
        }
        
        deathdata = spawnstruct();
        deathdata.attacker = instance.attacker;
        deathdata.objweapon = instance.weapon;
        deathdata.meansofdeath = instance.meansofdeath;
        deathdata.hitloc = instance.hitloc;
        self.body = self;
        namespace_f6c441748a84c612::function_5da3bf4fd1233318( deathdata );
        waskilled = 1;
    }
    else
    {
        playsoundatpos( instance.origin, hitsound );
        waskilled = 0;
    }
    
    objweapon = instance.weapon;
    bulletdamage = 1;
    var_795e8a31194a39ac = damagefeedback::function_63bdec1d3fd95d25( 0, var_cf49049cfe11e067, 0, objweapon );
    
    if ( !isdefined( icontype ) )
    {
        icontype = "standard";
    }
    
    hitmarkertype = 1;
    suppressaudio = 0;
    targetentnum = var_cf49049cfe11e067 getentitynumber();
    armorPlateCount = 1;
    instance.attacker damagefeedback::updatedamagefeedback( icontype, waskilled, isheadshot, hitmarkertype, suppressaudio, undefined, targetentnum, armorPlateCount, var_795e8a31194a39ac ?? {} );
}

// Namespace namespace_98fc1f2179e42c26
// Params 2
// Checksum 0x7860acf4, Offset: 0x42b1
// Size: 0x102
function function_f1d0779f842e7d28( var_cf49049cfe11e067, attacker )
{
    level endon( "exit_firing_range" );
    
    if ( self.var_f9a396aeb09d7be2 )
    {
        return;
    }
    
    self.var_f9a396aeb09d7be2 = 1;
    dummyranges = function_cc6d8e547793427a( attacker getcurrentweapon() );
    
    if ( !isdefined( dummyranges ) )
    {
        var_cf49049cfe11e067.health = function_c76d6117f2e172ac();
        function_2fa4609f16f1ade0( var_cf49049cfe11e067 );
        return;
    }
    
    dummyranges = arrayremoveduplicates( dummyranges );
    dummyranges = arraysort( dummyranges );
    self.var_d6945f469cc1af62 = self.var_d6945f469cc1af62 >= dummyranges.size - 1 ? 0 : self.var_d6945f469cc1af62 + 1;
    self.var_4afcf6fb638f149e = clamp( ( dummyranges[ self.var_d6945f469cc1af62 ] ?? dummyranges[ 0 ] ) - 150 + 1, 0, 3800 );
    newlocation = self.startingpos - ( self.var_4afcf6fb638f149e, 0, 0 );
    thread function_f16b7030dd2e82f2( newlocation, var_cf49049cfe11e067, 1.5, 0 );
}

// Namespace namespace_98fc1f2179e42c26
// Params 4
// Checksum 0x28b16cf7, Offset: 0x43bb
// Size: 0x183
function function_f16b7030dd2e82f2( newlocation, var_cf49049cfe11e067, waittime, var_4a28a508f9fb3a48 )
{
    level endon( "exit_firing_range" );
    self.var_e9125219d4a0d048 = newlocation;
    deceltime = min( waittime / 2, 0.3 );
    acceltime = min( waittime / 2, 0.3 );
    self.scriptorigin moveto( ( newlocation[ 0 ], self.scriptorigin.origin[ 1 ], self.scriptorigin.origin[ 2 ] ), waittime, acceltime, deceltime );
    var_cf49049cfe11e067 setcandamage( 0 );
    self disableaimassist();
    self notsolid();
    self notify( "entitydeleted" );
    differenceloc = self.scriptorigin.origin[ 0 ] - newlocation[ 0 ];
    
    if ( differenceloc != 0 && isdefined( var_4a28a508f9fb3a48 ) && !var_4a28a508f9fb3a48 )
    {
        function_807a1fc26d104718( differenceloc );
    }
    
    wait waittime;
    var_f91c572c2c0a5b0 = round( ( 150 + self.var_4afcf6fb638f149e + 1 ) / 39.37, 0.1 );
    setomnvar( "ui_firing_range_target_range", var_f91c572c2c0a5b0 );
    var_cf49049cfe11e067.health = function_c76d6117f2e172ac();
    function_2fa4609f16f1ade0( var_cf49049cfe11e067 );
    namespace_f6c441748a84c612::function_34471fca179a2e27();
    self.var_f9a396aeb09d7be2 = 0;
    level.var_ebf908e3e5e96aa7 = 0;
    setomnvar( "ui_firing_range_tot_damage", 0 );
}

// Namespace namespace_98fc1f2179e42c26
// Params 1
// Checksum 0xeebfdd4e, Offset: 0x4546
// Size: 0x52
function function_807a1fc26d104718( differenceloc = 1 )
{
    if ( differenceloc > 0 )
    {
        if ( self.var_d6945f469cc1af62 <= 1 )
        {
            self playsound( "amb_emt_t10_shooting_range_target_move1" );
        }
        else
        {
            self playsound( "amb_emt_t10_shooting_range_target_move2" );
        }
        
        return;
    }
    
    self playsound( "amb_emt_t10_shooting_range_target_comeback" );
}

// Namespace namespace_98fc1f2179e42c26
// Params 3
// Checksum 0xc9c72b42, Offset: 0x45a0
// Size: 0x189
function function_79ec23a13bb782d0( var_cf49049cfe11e067, player, var_24aa2d94cf545ca8 )
{
    player endon( "updateWeaponSwitch" );
    
    while ( player getcurrentweapon().classname == "none" )
    {
        waitframe();
    }
    
    if ( !isdefined( self.startingpos ) )
    {
        self.startingpos = ( 78270, -19636, 34 );
    }
    
    dummyranges = function_cc6d8e547793427a( player getcurrentweapon() );
    
    if ( !isdefined( dummyranges ) )
    {
        return;
    }
    
    dummyranges = arrayremoveduplicates( dummyranges );
    dummyranges = arraysort( dummyranges );
    self.var_d6945f469cc1af62 = 0;
    self.var_4afcf6fb638f149e = clamp( dummyranges[ 0 ] + 1, 0, 3800 );
    var_f91c572c2c0a5b0 = round( ( 150 + self.var_4afcf6fb638f149e + 1 ) / 39.37, 0.1 );
    setomnvar( "ui_firing_range_target_range", var_f91c572c2c0a5b0 );
    newlocation = self.startingpos - ( self.var_4afcf6fb638f149e, 0, 0 );
    
    if ( self.var_e9125219d4a0d048 == newlocation )
    {
        return;
    }
    
    thread function_f16b7030dd2e82f2( newlocation, self.var_cf49049cfe11e067, 1.5, var_24aa2d94cf545ca8 );
    
    if ( self.scriptorigin.angles != ( 90, 0, 0 ) && var_24aa2d94cf545ca8 )
    {
        level.var_4a3c3d2624e15d37 = 0;
        self.scriptorigin.angles = ( 90, 0, 0 );
    }
}

// Namespace namespace_98fc1f2179e42c26
// Params 1
// Checksum 0xe43e1e84, Offset: 0x4731
// Size: 0x3a
function function_2fa4609f16f1ade0( var_cf49049cfe11e067 )
{
    if ( level.var_4a3c3d2624e15d37 == 1 )
    {
        self.var_f9a396aeb09d7be2 = 0;
        self solid();
        self enableaimassist();
        var_cf49049cfe11e067 setcandamage( 1 );
    }
}

#using_animtree( "script_model" );

// Namespace namespace_98fc1f2179e42c26
// Params 1
// Checksum 0x3ccabd5a, Offset: 0x4773
// Size: 0x91
function function_eb19123198ad828c( var_cf49049cfe11e067 )
{
    level endon( "exit_firing_range" );
    
    if ( self.var_f9a396aeb09d7be2 )
    {
        return;
    }
    
    self.var_f9a396aeb09d7be2 = 1;
    var_cf49049cfe11e067 setcandamage( 0 );
    self disableaimassist();
    self notsolid();
    self notify( "entitydeleted" );
    self scriptmodelplayanimdeltamotion( "iw9_mp_firingrange_dummy_death" );
    self playsound( "uin_firingrange_target_fall" );
    wait getanimlength( %iw9_mp_firingrange_dummy_death );
    self scriptmodelplayanimdeltamotion( "iw9_mp_firingrange_dummy_deathidle" );
    playsoundatpos( self.origin, "uin_firingrange_target_rise" );
    thread respawntarget();
}

// Namespace namespace_98fc1f2179e42c26
// Params 0
// Checksum 0x4476644c, Offset: 0x480c
// Size: 0x87
function respawntarget()
{
    if ( !self.var_f9a396aeb09d7be2 )
    {
        return;
    }
    
    self scriptmodelplayanimdeltamotion( "iw9_mp_firingrange_dummy_respawn" );
    self.var_f9a396aeb09d7be2 = 1;
    wait getanimlength( %iw9_mp_firingrange_dummy_respawn ) - 0.3;
    self scriptmodelclearanim();
    self.var_f9a396aeb09d7be2 = 0;
    self solid();
    self enableaimassist();
    self.var_cf49049cfe11e067.health = function_c76d6117f2e172ac();
    self.var_cf49049cfe11e067 setcandamage( 1 );
    namespace_f6c441748a84c612::function_34471fca179a2e27();
}

// Namespace namespace_98fc1f2179e42c26
// Params 0
// Checksum 0xd301824b, Offset: 0x489b
// Size: 0x98
function function_446d540a417a481c()
{
    self setcandamage( 1 );
    self.owner enableaimassist();
    
    /#
        thread function_e01eed580e50df1f();
    #/
    
    while ( true )
    {
        self waittill( "damage", damage, attacker, direction_vec, point, meansofdeath, modelname, tagname, partname, idflags, weapon );
    }
}

// Namespace namespace_98fc1f2179e42c26
// Params 1
// Checksum 0xef1b953e, Offset: 0x493b
// Size: 0xc1
function function_7d5cfd5e524d2aea( primary )
{
    level notify( "frontend_watch_bullets" );
    level endon( "exit_firing_range" );
    level endon( "frontend_watch_bullets" );
    
    while ( true )
    {
        self waittill( "weapon_fired", objweapon );
        bulletsfired = 0;
        hitnum = 0;
        
        if ( objweapon == primary )
        {
            level.var_65d3ec21afb8c1b1++;
            bulletsfired = level.var_65d3ec21afb8c1b1;
            hitnum = level.var_6d20f1bfea78492e;
            
            if ( function_120e71871fb92f69() )
            {
                level.var_bfc1156387b479bb++;
            }
        }
        else
        {
            level.var_ec67017c22f64929++;
            bulletsfired = level.var_ec67017c22f64929;
            hitnum = level.bulletshitsecondary;
        }
        
        thread function_6d9fec4518f7c13a( hitnum, bulletsfired, objweapon == primary );
    }
}

// Namespace namespace_98fc1f2179e42c26
// Params 3
// Checksum 0x9a6c2d1a, Offset: 0x4a04
// Size: 0x166
function function_6d9fec4518f7c13a( hitnum, bulletsfired, isprimary )
{
    level notify( "wait_for_bullet_result" );
    level endon( "exit_firing_range" );
    level endon( "wait_for_bullet_result" );
    thread waitfordamage();
    level utility::waittill_any( "timeout_damage", "damage_done" );
    
    if ( isprimary && hitnum == level.var_6d20f1bfea78492e || !isprimary && hitnum == level.bulletshitsecondary )
    {
        bulletsfired = max( 1, bulletsfired );
        accuracy = clamp( hitnum / bulletsfired, 0, 1 );
        setomnvar( "ui_firing_range_accuracy", accuracy );
        println( "<dev string:xce>" + accuracy );
        
        if ( isprimary )
        {
            self.var_2dcefb4ab3452bf3 = accuracy;
            self.var_77e861f8d388441d = clamp( level.var_38e10219d88bb19c / bulletsfired, 0, 1 );
        }
        else
        {
            self.var_f5bdad532aeadd53 = accuracy;
            self.var_4a28bdd45dfb1a7d = clamp( level.var_edd9d75d4e242354 / bulletsfired, 0, 1 );
        }
        
        if ( isprimary && function_120e71871fb92f69() )
        {
            var_bfc1156387b479bb = max( 1, level.var_bfc1156387b479bb );
            level.var_75cb0c6c413e69d5 = clamp( level.var_7b135d1536298f8e / var_bfc1156387b479bb, 0, 1 );
        }
    }
}

// Namespace namespace_98fc1f2179e42c26
// Params 0
// Checksum 0x7f0e4b18, Offset: 0x4b72
// Size: 0x28
function waitfordamage()
{
    level endon( "damage_done" );
    level endon( "exit_firing_range" );
    level endon( "wait_for_bullet_result" );
    wait 0.1;
    level notify( "timeout_damage" );
}

// Namespace namespace_98fc1f2179e42c26
// Params 1
// Checksum 0x1b2298dd, Offset: 0x4ba2
// Size: 0x1f, Type: bool
function isspreadweapon( objweapon )
{
    return isdefined( objweapon ) && weaponclass( objweapon ) == "spread";
}

// Namespace namespace_98fc1f2179e42c26
// Params 5
// Checksum 0x696c7d4, Offset: 0x4bca
// Size: 0x356
function spreadshotdamagemod( victim, eattacker, objweapon, idamage, idflags )
{
    if ( isdefined( eattacker ) && isdefined( victim ) )
    {
        hand = function_deff5471cdf04d56( idflags );
        victimentnum = function_4ec08fffae2d922d( victim );
        time = gettime();
        
        if ( !isdefined( eattacker.pelletweaponvictimids ) )
        {
            eattacker.pelletweaponvictimids = [];
        }
        
        foreach ( ihand, var_3efaf483dba5b6a8 in eattacker.pelletweaponvictimids )
        {
            foreach ( victimid, victimstruct in var_3efaf483dba5b6a8 )
            {
                if ( ( time - victimstruct.time ) / 1000 > 0.1 )
                {
                    eattacker.pelletweaponvictimids[ ihand ][ victimid ] = undefined;
                    
                    if ( eattacker.pelletweaponvictimids[ ihand ].size == 0 )
                    {
                        eattacker.pelletweaponvictimids[ ihand ] = undefined;
                    }
                }
            }
        }
        
        if ( !isdefined( eattacker.pelletweaponvictimids[ hand ] ) )
        {
            eattacker.pelletweaponvictimids[ hand ] = [];
        }
        
        if ( !isdefined( eattacker.pelletweaponvictimids[ hand ][ victimentnum ] ) )
        {
            eattacker.pelletweaponvictimids[ hand ][ victimentnum ] = function_e15be0607bfbb4e7( eattacker, objweapon, time );
        }
        
        eattacker.pelletweaponvictimids[ hand ][ victimentnum ].var_77e7ce207984d5d8 = 0;
        eattacker.pelletweaponvictimids[ hand ][ victimentnum ].pelletdmgpassed = arraysort( eattacker.pelletweaponvictimids[ hand ][ victimentnum ].pelletdmgpassed );
        
        if ( eattacker.pelletweaponvictimids[ hand ][ victimentnum ].pelletdmgpassed.size >= eattacker.pelletweaponvictimids[ hand ][ victimentnum ].var_b2fcf56b19fb3493 )
        {
            if ( idamage > eattacker.pelletweaponvictimids[ hand ][ victimentnum ].pelletdmgpassed[ 0 ] )
            {
                damagedelta = idamage - eattacker.pelletweaponvictimids[ hand ][ victimentnum ].pelletdmgpassed[ 0 ];
                eattacker.pelletweaponvictimids[ hand ][ victimentnum ].pelletdmgpassed[ 0 ] = idamage;
                eattacker.pelletweaponvictimids[ hand ][ victimentnum ].var_77e7ce207984d5d8 = 1;
                idamage = damagedelta;
            }
            else
            {
                return 0;
            }
        }
        else
        {
            arrayinsert( eattacker.pelletweaponvictimids[ hand ][ victimentnum ].pelletdmgpassed, idamage, 0 );
        }
        
        idamage = function_ceb194a906bf4a4c( eattacker, victim, idflags, idamage );
    }
    
    return idamage;
}

// Namespace namespace_98fc1f2179e42c26
// Params 1
// Checksum 0x2ce5bc40, Offset: 0x4f29
// Size: 0x24
function function_deff5471cdf04d56( idflags )
{
    if ( idflags & 2048 )
    {
        return "lHandWeap";
    }
    
    return "rHandWeap";
}

// Namespace namespace_98fc1f2179e42c26
// Params 1
// Checksum 0xdb45e7f1, Offset: 0x4f55
// Size: 0x12
function function_4ec08fffae2d922d( victim )
{
    return victim getentitynumber();
}

// Namespace namespace_98fc1f2179e42c26
// Params 3
// Checksum 0x2d68b599, Offset: 0x4f70
// Size: 0xa0
function function_e15be0607bfbb4e7( eattacker, objweapon, time )
{
    struct = spawnstruct();
    struct.time = time;
    struct.pelletdmgpassed = [];
    struct.var_8c8eb6b39a4c19ad = 0;
    struct.var_b2fcf56b19fb3493 = getspreadpelletspershot( eattacker, objweapon );
    
    if ( function_e03b776948c43ba8( objweapon.basename ) )
    {
        struct.var_57dfd4c4337d402e = 120;
    }
    else
    {
        struct.var_57dfd4c4337d402e = 200;
    }
    
    return struct;
}

// Namespace namespace_98fc1f2179e42c26
// Params 1
// Checksum 0x25798a9f, Offset: 0x5019
// Size: 0xa6, Type: bool
function function_e03b776948c43ba8( weaponname )
{
    var_205ed7d117277fa5 = [ "iw9_sh_mike1014_mp", "iw9_sh_vecho_mp", "iw9_pi_swhiskey_mp" ];
    
    foreach ( i in var_205ed7d117277fa5 )
    {
        if ( i == weaponname )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace namespace_98fc1f2179e42c26
// Params 4
// Checksum 0x16a4cc4f, Offset: 0x50c8
// Size: 0x12b
function function_ceb194a906bf4a4c( eattacker, victim, idflags, idamage )
{
    hand = function_deff5471cdf04d56( idflags );
    victimentnum = function_4ec08fffae2d922d( victim );
    
    if ( !( isdefined( eattacker.pelletweaponvictimids[ hand ] ) && isdefined( eattacker.pelletweaponvictimids[ hand ][ victimentnum ] ) ) )
    {
        return idamage;
    }
    
    var_57dfd4c4337d402e = eattacker.pelletweaponvictimids[ hand ][ victimentnum ].var_57dfd4c4337d402e;
    var_8c8eb6b39a4c19ad = eattacker.pelletweaponvictimids[ hand ][ victimentnum ].var_8c8eb6b39a4c19ad;
    
    if ( var_8c8eb6b39a4c19ad < var_57dfd4c4337d402e )
    {
        idamage = clamp( idamage, 0, var_57dfd4c4337d402e - eattacker.pelletweaponvictimids[ hand ][ victimentnum ].var_8c8eb6b39a4c19ad );
        eattacker.pelletweaponvictimids[ hand ][ victimentnum ].var_8c8eb6b39a4c19ad += idamage;
        return idamage;
    }
    
    return 0;
}

// Namespace namespace_98fc1f2179e42c26
// Params 2
// Checksum 0xae6d84c, Offset: 0x51fb
// Size: 0x92
function getspreadpelletspershot( eattacker, objweapon )
{
    rootname = objweapon.var_1616e6fbba9a722d;
    
    if ( rootname == %"iw9_sh_charlie725" || rootname == %"iw9_pi_swhiskey" )
    {
        if ( eattacker isdualwielding() )
        {
            return 2;
        }
        
        if ( objweapon hasattachment( "bar_sh_short_p14" ) )
        {
            return 3;
        }
        
        ads = eattacker playerads() > 0.5;
        
        if ( ads )
        {
            return 4;
        }
        else
        {
            return 3;
        }
        
        return;
    }
    
    return 4;
}

// Namespace namespace_98fc1f2179e42c26
// Params 1
// Checksum 0x6a5dc622, Offset: 0x5295
// Size: 0x30, Type: bool
function function_6663e8f14900ff75( smeansofdeath )
{
    if ( !isdefined( smeansofdeath ) )
    {
        return false;
    }
    
    if ( smeansofdeath == "MOD_RIFLE_BULLET" || smeansofdeath == "MOD_EXPLOSIVE_BULLET" )
    {
        return true;
    }
    
    return false;
}

// Namespace namespace_98fc1f2179e42c26
// Params 1
// Checksum 0xeae2ae56, Offset: 0x52ce
// Size: 0x72, Type: bool
function function_d0f7407d5f8aaa05( objweapon )
{
    if ( isinfrontend() )
    {
        return true;
    }
    
    weapontype = weaponclass( objweapon );
    
    if ( weapontype == "sniper" && objweapon.basename != "iw9_sn_limax_mp" && getweaponhasperk( objweapon, "specialty_explosivebullet" ) )
    {
        return true;
    }
    
    if ( objweapon.basename == "iw9_dm_crossbow_mp" )
    {
        return true;
    }
    
    return false;
}

/#

    // Namespace namespace_98fc1f2179e42c26
    // Params 0
    // Checksum 0x18bb6498, Offset: 0x5349
    // Size: 0x90, Type: dev
    function function_e01eed580e50df1f()
    {
        while ( true )
        {
            color = self.health > 0 ? ( 0, 1, 0 ) : ( 1, 0, 0 );
            
            /#
                print3d( self.owner.origin + ( 0, 0, 100 ), int( max( self.health, 0 ) ), color, 1, 0.75, 1, 1 );
            #/
            
            waitframe();
        }
    }

    // Namespace namespace_98fc1f2179e42c26
    // Params 4
    // Checksum 0x8332cbca, Offset: 0x53e1
    // Size: 0x64, Type: dev
    function drawsphere( origin, radius, drawtimeseconds, color )
    {
        drawframes = int( drawtimeseconds / 0.05 );
        
        for ( frame = 0; frame < drawframes ; frame++ )
        {
            sphere( origin, radius, color );
            waitframe();
        }
    }

#/
