#using script_16ea1b94f0f381b3;
#using scripts\common\callbacks;
#using scripts\common\scene;
#using scripts\common\targetmarkergroups;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\common\vehicle;
#using scripts\common\vehicle_damage;
#using scripts\common\vehicle_occupancy;
#using scripts\common\vehicle_omnvar_utility;
#using scripts\common\vehicle_tracking;
#using scripts\cp_mp\killstreaks\chopper_support;
#using scripts\cp_mp\killstreaks\killstreakdeploy;
#using scripts\cp_mp\utility\debug_utility;
#using scripts\cp_mp\utility\game_utility;
#using scripts\cp_mp\utility\killstreak_utility;
#using scripts\cp_mp\utility\player_utility;
#using scripts\cp_mp\utility\shellshock_utility;
#using scripts\cp_mp\utility\weapon_utility;
#using scripts\engine\trace;
#using scripts\engine\utility;
#using scripts\killstreaks\killstreak_shared;
#using scripts\mp\killstreaks\killstreaks;
#using scripts\mp\outofbounds;
#using scripts\mp\sentientpoolmanager;
#using scripts\mp\utility\teams;

#namespace vtol_warship;

// Namespace vtol_warship
// Params 0, eflags: 0x1
// Checksum 0xc67d31d9, Offset: 0xab4
// Size: 0x17
function autoexec main()
{
    killstreak_shared::registerkillstreakinitfunction( getxhash( "vtol_warship" ), &function_e70e2a2599230dc );
}

// Namespace vtol_warship
// Params 0, eflags: 0x4
// Checksum 0xd39023bf, Offset: 0xad3
// Size: 0x1a6
function private function_e70e2a2599230dc()
{
    killstreaks::registerkillstreak( "vtol_warship", &function_c1d54a36b82eb87 );
    utility::registersharedfunc( #"chopper_gunner", #"set_vehicle_hit_damage_data", &function_1278599b230de316 );
    utility::registersharedfunc( #"chopper_gunner", #"hash_24dfe1998e0f3142", &function_9726a451545d3985 );
    
    /#
        setdevdvarifuninitialized( @"hash_71a6f6c87fec61ef", 0 );
        setdevdvarifuninitialized( @"hash_36f79934e22a53b5", 0 );
    #/
    
    killstreaks::registerkillstreakdamagedealingweapon( "vtol_warship", "vtol_warship_turret_mp", #"large" );
    killstreaks::registerkillstreakdamagedealingweapon( "vtol_warship", "sat_vtol_warship_proj_mp", #"large" );
    utility::registersharedfunc( #"chopper_gunner", #"playintro", &function_2d629b17d5984d1a );
    level thread function_37cca19a9619ef4e();
    utility::flag_set( "vtol_shared_initialized" );
    
    /#
        setdevdvarifuninitialized( @"hash_5053673c4770b74", 0 );
        setdevdvarifuninitialized( @"hash_f3fcf3899fa2e1b0", 0 );
        setdevdvarifuninitialized( @"hash_a34a2f5a7d33e3bb", 0 );
        setdevdvarifuninitialized( @"hash_804b68f93e7911ba", 1 );
        setdevdvarifuninitialized( @"hash_6dcbef72bd1fd758", 0 );
        setdevdvarifuninitialized( @"hash_c1fa04efebbe3e6b", -1 );
    #/
    
    val::group_register( "vtolWarshipUse", [ "killstreaks", "allow_movement", "fire", "weapon_switch", "melee", "usability", "shellshock", "allow_jump", "offhand_weapons" ] );
    killstreak_utility::registervisibilityomnvarforkillstreak( "vtol_warship", "on", 27 );
}

// Namespace vtol_warship
// Params 2, eflags: 0x4
// Checksum 0xc98bea6d, Offset: 0xc81
// Size: 0x1f
function private function_1278599b230de316( ref, hitstokill )
{
    vehicle_damage::set_vehicle_hit_damage_data( ref, hitstokill );
}

// Namespace vtol_warship
// Params 2, eflags: 0x4
// Checksum 0x984b9a3c, Offset: 0xca8
// Size: 0x1e
function private function_9726a451545d3985( structlinkname, var_a421ae2a63911fea )
{
    return chopper_support::choppersupport_findtargetstruct( structlinkname, var_a421ae2a63911fea );
}

// Namespace vtol_warship
// Params 0, eflags: 0x4
// Checksum 0x1dca8d4d, Offset: 0xccf
// Size: 0x71
function private function_37cca19a9619ef4e()
{
    level utility::flag_wait( "StartGameTypeCallbackFinished" );
    
    if ( utility::issharedfuncdefined( #"medal", #"register_on_kill_medal_callback", 0 ) )
    {
        utility::callsharedfunc( #"medal", #"register_on_kill_medal_callback", "vtol_warship_turret_mp", &function_e5e09b71bfd57d71 );
        utility::callsharedfunc( #"medal", #"register_on_kill_medal_callback", "sat_vtol_warship_proj_mp", &function_e5e09b71bfd57d71 );
    }
}

// Namespace vtol_warship
// Params 0, eflags: 0x4
// Checksum 0x2a98df89, Offset: 0xd48
// Size: 0xc5
function private function_52da1e5ada18296c()
{
    self endon( "death", "leaving", "crashing" );
    level endon( "game_ended" );
    streakinfo = self.streakinfo;
    self.var_c9de5f7a664b2c9d = 0;
    self.var_e8d7f39a5478703 = 0;
    self setscriptablepartstate( #"booster", #"off" );
    self.owner notifyonplayercommand( "shoot_missile", "+frag" );
    self.owner setclientomnvar( "ui_killstreak_weapon_1_ammo", ( streakinfo.bundle.var_b3b977af67a42de3 ?? 6 ) - self.var_c9de5f7a664b2c9d );
    thread function_350c2122a9f7e22();
    thread function_b9b8c2cd40f1d8c8( streakinfo );
    thread function_9f07f0f4e880604c( streakinfo );
}

// Namespace vtol_warship
// Params 4, eflags: 0x4
// Checksum 0xdfe00358, Offset: 0xe15
// Size: 0x1c4
function private function_2d629b17d5984d1a( pathgoal, angles, bundle, vtol )
{
    level endon( "game_ended" );
    self.animname = "Player 1";
    destination = pathgoal;
    vtol setscriptablepartstate( #"intro_scene", #"on" );
    vtol setscriptablepartstate( #"thrusters", #"no_procedural_drivers", 0 );
    vtol setscriptablepartstate( "blinking_lights", "on", 0 );
    vtol setscriptablepartstate( "interior_light", "off", 0 );
    vtol setscriptablepartstate( "engine", "on", 0 );
    scene_struct = utility::spawn_model( "tag_origin", destination, angles );
    scene_struct scene::set_scriptbundle( "sat_scorestreak_vtol" );
    scene_struct linkto( vtol, "tag_body_animate" );
    scene::add_scene_func( scene_struct.script_scenescriptbundle, &function_9ed889695de0146f, "callback_done" );
    vehanim = scene_struct scene::function_d0df7c35d793d179( "VTOL", 0 );
    var_97b555a9332e878c = 1;
    vtol animscripted( "", destination, angles, vehanim[ 0 ], undefined, undefined, 0, 1, undefined, undefined, undefined, undefined, undefined, undefined, var_97b555a9332e878c );
    scene_struct thread scene::play( [ self ], "shot_010", "sat_scorestreak_vtol" );
    vtol setotherent( self );
    vtol setentityowner( self );
    scene_struct waittill( "vtol_intro_scene_complete" );
    vtol vehicleclearanims();
    vtol stopanimscripted();
    turretindex = 0;
    vtol function_de7788e44e24a2c9( 1, turretindex );
    waitframe();
    scene_struct unlink();
    vtol setscriptablepartstate( #"intro_scene", #"off" );
}

// Namespace vtol_warship
// Params 0, eflags: 0x4
// Checksum 0x9e70aa5d, Offset: 0xfe1
// Size: 0xa
function private function_9ed889695de0146f()
{
    self notify( "vtol_intro_scene_complete" );
}

// Namespace vtol_warship
// Params 1, eflags: 0x4
// Checksum 0x93e85e1b, Offset: 0xff3
// Size: 0x78
function private function_c39662f110e6533( togglestate )
{
    bundle = level.streakglobals.streakbundles[ self.streakinfo.streakname ];
    self.owner killstreak_shared::function_a402a9f43d6f7512( "killstreak_shared", bundle.var_598d79add3230927, bundle.var_f057b69340b14a5c, bundle.var_225c495bde49787b, 1, self );
}

// Namespace vtol_warship
// Params 0, eflags: 0x4
// Checksum 0x686efe5a, Offset: 0x1073
// Size: 0x3f
function private function_350c2122a9f7e22()
{
    self endon( "death", "leaving", "crashing" );
    level endon( "game_ended" );
    
    while ( true )
    {
        self.owner waittill( "shoot_missile" );
        self.var_288c9e3f82cafb17 = 1;
    }
}

// Namespace vtol_warship
// Params 3, eflags: 0x4
// Checksum 0x74f66256, Offset: 0x10ba
// Size: 0x153
function private function_ed5b0228f408cbfc( owner, lifetime, infinite )
{
    owner endon( "disconnect" );
    self endon( "death", "leaving", "crashing" );
    level endon( "game_ended" );
    
    if ( infinite || !isdefined( lifetime ) || lifetime <= 0 )
    {
        owner setclientomnvar( "ui_killstreak_lifetime", 1 );
        return;
    }
    
    var_a1e099888aaae2b9 = lifetime * 1000;
    var_599207f768bab343 = var_a1e099888aaae2b9 * ( self.streakinfo.bundle.var_4c65d66691fbdf3 ?? 0.25 );
    endtimems = gettime() + var_a1e099888aaae2b9;
    var_805c02b5a28ede5a = endtimems - var_599207f768bab343;
    self.var_1717a034842e3ec3 = endtimems;
    var_a3862284ea970033 = 0;
    
    while ( true )
    {
        timeleftms = endtimems - gettime();
        
        if ( timeleftms <= 0 )
        {
            owner setclientomnvar( "ui_killstreak_lifetime", 0 );
            break;
        }
        
        if ( var_a3862284ea970033 == 0 )
        {
            var_9c5e2488f64ce147 = var_805c02b5a28ede5a - gettime();
            
            if ( var_9c5e2488f64ce147 <= 0 )
            {
                var_a3862284ea970033 = 1;
                owner playlocalsound( "uin_veh_warning_out_of_fuel_heli" );
            }
        }
        
        owner setclientomnvar( "ui_killstreak_lifetime", timeleftms / var_a1e099888aaae2b9 );
        wait 0.1;
    }
}

// Namespace vtol_warship
// Params 1, eflags: 0x4
// Checksum 0xd5c257ad, Offset: 0x1215
// Size: 0xa4
function private function_b9b8c2cd40f1d8c8( streakinfo )
{
    self.owner endon( "disconnect" );
    self endon( "death", "leaving", "crashing" );
    level endon( "game_ended" );
    isbot = isbot( self.owner );
    self.var_2e9442213dc0616f = [];
    self.var_a688a00957fcf19f = gettime() + ( streakinfo.bundle.var_ff9286891befda3e ?? 1 ) * 1000;
    
    while ( true )
    {
        function_8e8c6276c27ee881( streakinfo, isbot );
        function_d3758c0078aba8f( streakinfo );
        waitframe();
    }
}

// Namespace vtol_warship
// Params 2, eflags: 0x4
// Checksum 0xf4ad6c69, Offset: 0x12c1
// Size: 0x3de
function private function_8e8c6276c27ee881( streakinfo, isbot )
{
    var_3e9a50c690b1956a = [];
    
    if ( utility::issharedfuncdefined( #"killstreak", #"hash_435a8597e671e695" ) )
    {
        enemies = utility::callsharedfunc( #"killstreak", #"hash_435a8597e671e695" );
    }
    else
    {
        enemies = teams::getenemyplayers( self.owner.team, 1 );
    }
    
    fov = self.owner playergetzoomfov();
    
    foreach ( i, lockedonenemy in self.var_2e9442213dc0616f )
    {
        if ( isalive( lockedonenemy ) && lockedonenemy killstreak_shared::function_f87d3123e9b737d6( self.owner ) && self.owner worldpointinreticle_circle( lockedonenemy.origin, fov, 250 ) )
        {
            continue;
        }
        
        lockedonenemy killstreak_shared::function_2b135a54666d89ce( self.owner );
        self.var_2e9442213dc0616f[ i ] = undefined;
    }
    
    var_54b7a72192506a7a = gettime();
    
    foreach ( enemy in enemies )
    {
        if ( arraycontains( self.var_2e9442213dc0616f, enemy ) )
        {
            continue;
        }
        
        if ( isdefined( enemy.perks[ "specialty_covert_ops" ] ) || isdefined( enemy.perks[ "specialty_blindeye" ] ) )
        {
            continue;
        }
        
        if ( !isbot && isdefined( self.owner.enemytargetmarkergroup ) && !targetmarkergroups::function_8057fbde5c4ad4d2( enemy, self.owner.enemytargetmarkergroup ) )
        {
            targetmarkergroups::targetmarkergroup_markentity( enemy, self.owner.enemytargetmarkergroup );
        }
        
        if ( var_54b7a72192506a7a < self.var_a688a00957fcf19f )
        {
            continue;
        }
        
        if ( !enemy killstreak_shared::function_f87d3123e9b737d6( self.owner ) )
        {
            continue;
        }
        
        if ( !self.owner worldpointinreticle_circle( enemy.origin, fov, 250 ) )
        {
            continue;
        }
        
        var_3e9a50c690b1956a[ var_3e9a50c690b1956a.size ] = enemy;
        self.var_a688a00957fcf19f = var_54b7a72192506a7a + ( streakinfo.bundle.var_ff9286891befda3e ?? 1 ) * 1000;
    }
    
    var_57bc9138f9a69e97 = streakinfo.bundle.var_b3b977af67a42de3 ?? 6;
    
    foreach ( i, enemyentity in var_3e9a50c690b1956a )
    {
        if ( self.var_2e9442213dc0616f.size >= var_57bc9138f9a69e97 - self.var_c9de5f7a664b2c9d )
        {
            continue;
        }
        
        if ( !isbot )
        {
            enemyentity killstreak_shared::function_70e34750441c92eb( self.owner );
            self.owner playlocalsound( "kls_vtol_warship_target_aquired" );
        }
        
        self.var_2e9442213dc0616f = arraycombineunique( self.var_2e9442213dc0616f, [ enemyentity ] );
    }
}

// Namespace vtol_warship
// Params 1, eflags: 0x4
// Checksum 0x3da9bbd, Offset: 0x16a7
// Size: 0x1ef
function private function_94abf3d922d2da6( lockedonenemy )
{
    self.var_c9de5f7a664b2c9d++;
    self.var_d0fce72a469c40c5++;
    
    /#
        var_bae7af8a59beab33 = getdvarint( @"hash_71a6f6c87fec61ef", 0 );
        
        if ( var_bae7af8a59beab33 )
        {
            self.var_c9de5f7a664b2c9d = 1;
        }
    #/
    
    if ( self.var_c9de5f7a664b2c9d == 1 || self.var_c9de5f7a664b2c9d == 5 )
    {
        missileorigin = self gettagorigin( #"hash_2f9ba971e2e312ec" );
    }
    else if ( self.var_c9de5f7a664b2c9d == 2 || self.var_c9de5f7a664b2c9d == 6 )
    {
        missileorigin = self gettagorigin( #"hash_5d093a39b8018259" );
    }
    else if ( self.var_c9de5f7a664b2c9d == 3 )
    {
        missileorigin = self gettagorigin( #"hash_b54aabc6568ebff2" );
    }
    else if ( self.var_c9de5f7a664b2c9d == 4 )
    {
        missileorigin = self gettagorigin( #"hash_a04bdfe0541f0c3f" );
    }
    
    self.owner setclientomnvar( "ui_killstreak_weapon_1_ammo", ( self.streakinfo.bundle.var_b3b977af67a42de3 ?? 6 ) - self.var_c9de5f7a664b2c9d );
    missile = namespace_9d8e359c3b1041e5::magicbulletsharedfunc( makeweapon( "sat_vtol_warship_proj_mp" ), missileorigin, missileorigin + anglestoforward( self.angles ), self );
    missile.streakinfo = self.streakinfo;
    missile missile_settargetent( lockedonenemy );
    missile thread function_6c2de2873bfb2494( lockedonenemy );
    missile thread function_d24be18eba70df17( lockedonenemy );
    self.var_e7db8afd56641253[ self.var_e7db8afd56641253.size ] = lockedonenemy;
    self.owner playrumbleonpositionforclient( "defaultweapon_fire", self.origin );
    wait self.streakinfo.bundle.var_38b517a82955f4af ?? 0.5;
}

// Namespace vtol_warship
// Params 1, eflags: 0x4
// Checksum 0xde221c22, Offset: 0x189e
// Size: 0x15e
function private function_d3758c0078aba8f( streakinfo )
{
    if ( !self.var_288c9e3f82cafb17 )
    {
        return;
    }
    
    self.var_288c9e3f82cafb17 = undefined;
    
    if ( !self.var_2e9442213dc0616f.size > 0 )
    {
        self.owner playlocalsound( "kls_vtol_warship_no_target" );
        return;
    }
    
    self.var_e7db8afd56641253 = [];
    self.var_d0fce72a469c40c5 = 0;
    
    while ( true )
    {
        var_17aafe098a373d19 = 0;
        
        foreach ( lockedonenemy in self.var_2e9442213dc0616f )
        {
            if ( lockedonenemy.var_24f081efd87509f0 )
            {
                continue;
            }
            
            if ( self.var_c9de5f7a664b2c9d >= ( streakinfo.bundle.var_b3b977af67a42de3 ?? 6 ) || self.var_d0fce72a469c40c5 >= 1 )
            {
                break;
            }
            
            function_94abf3d922d2da6( lockedonenemy );
            var_17aafe098a373d19 = 1;
        }
        
        if ( !var_17aafe098a373d19 )
        {
            break;
        }
    }
    
    self.var_2e9442213dc0616f = [];
    self.var_e7db8afd56641253 = undefined;
    self.var_d0fce72a469c40c5 = undefined;
}

// Namespace vtol_warship
// Params 1, eflags: 0x4
// Checksum 0x5f2689d0, Offset: 0x1a04
// Size: 0x1a4
function private function_9f07f0f4e880604c( streakinfo )
{
    self endon( "death", "leaving", "crashing" );
    level endon( "game_ended" );
    
    if ( !self function_cb9640aa0dbf3a74() )
    {
        var_32dbca3143d9c4a5 = level.sharedfuncs[ #"flare_system" ][ #"defender_init" ];
        
        if ( isdefined( var_32dbca3143d9c4a5 ) )
        {
            self [[ var_32dbca3143d9c4a5 ]]( 0, 0, 0, 1, 0, &function_11f2dc1755b4907 );
        }
        
        self.owner setclientomnvar( "ui_killstreak_boost_button_enabled", 0 );
        return;
    }
    
    var_32dbca3143d9c4a5 = level.sharedfuncs[ #"flare_system" ][ #"defender_init" ];
    
    if ( isdefined( var_32dbca3143d9c4a5 ) )
    {
        self [[ var_32dbca3143d9c4a5 ]]( 10, 1, 10, 1, 0, &function_11f2dc1755b4907 );
    }
    
    self.owner setclientomnvar( "ui_killstreak_boost_button_enabled", 1 );
    
    while ( true )
    {
        var_ac96d340eccdeba6 = self.var_e8d7f39a5478703;
        self.var_e8d7f39a5478703 = self function_e8d7f39a5478703();
        
        if ( self.var_e8d7f39a5478703 && !var_ac96d340eccdeba6 )
        {
            self setscriptablepartstate( #"booster", #"on" );
            var_32dbca3143d9c4a5 = level.sharedfuncs[ #"flare_system" ][ #"hash_1101719e6ff74ce" ];
            
            if ( isdefined( var_32dbca3143d9c4a5 ) )
            {
                self [[ var_32dbca3143d9c4a5 ]]();
            }
        }
        else if ( !self.var_e8d7f39a5478703 && var_ac96d340eccdeba6 )
        {
            self setscriptablepartstate( #"booster", #"off" );
        }
        
        boostcharge = self function_8219169c22f3c66d();
        self.owner setclientomnvar( "ui_killstreak_boost_recharge_percentage", boostcharge );
        waitframe();
    }
}

// Namespace vtol_warship
// Params 1, eflags: 0x4
// Checksum 0x7b4033a5, Offset: 0x1bb0
// Size: 0x53
function private function_11f2dc1755b4907( params )
{
    if ( params.attacker.streakinfo )
    {
        self.owner thread killstreak_utility::playkillstreaktacomdialog( params.attacker.streakinfo, undefined, #"hash_9887046672b651ec" );
    }
}

// Namespace vtol_warship
// Params 1, eflags: 0x4
// Checksum 0xb8b22516, Offset: 0x1c0b
// Size: 0x41
function private function_d24be18eba70df17( targetent )
{
    level endon( "game_ended" );
    
    if ( targetent )
    {
        targetent.var_24f081efd87509f0 = 1;
    }
    
    self waittill( "death" );
    
    if ( targetent )
    {
        targetent.var_24f081efd87509f0 = 0;
    }
}

// Namespace vtol_warship
// Params 1, eflags: 0x4
// Checksum 0x1245b4a6, Offset: 0x1c54
// Size: 0x2b
function private function_6c2de2873bfb2494( targetent )
{
    self endon( "death" );
    level endon( "game_ended" );
    targetent waittill( "death" );
    self missile_cleartarget();
}

// Namespace vtol_warship
// Params 0, eflags: 0x4
// Checksum 0x7a808920, Offset: 0x1c87
// Size: 0x36
function private function_2a7a34efc7638f7f()
{
    var_b547f74d3db2a43e = self.owner;
    var_b547f74d3db2a43e thread player_utility::watchthermalinputchange();
    function_acc2aa2f5bdb1cd6();
    
    if ( isdefined( var_b547f74d3db2a43e ) )
    {
        var_b547f74d3db2a43e player_utility::stopwatchingthermalinputchange();
    }
}

// Namespace vtol_warship
// Params 0, eflags: 0xc
// Checksum 0xa5643478, Offset: 0x1cc5
// Size: 0xa1
function private function_acc2aa2f5bdb1cd6()
{
    self notify( "24b28a5332884aa4" );
    self endon( "24b28a5332884aa4" );
    self endon( "death", "leaving", "crashing" );
    var_b547f74d3db2a43e = self.owner;
    
    if ( !isdefined( self.streakinfo.bundle.var_cce52496889d53e2 ) )
    {
        return;
    }
    
    while ( true )
    {
        function_55af6d015c4cb895( var_b547f74d3db2a43e, self.streakinfo.bundle.var_cce52496889d53e2 );
        var_b547f74d3db2a43e waittill( "switch_thermal_mode" );
        function_fe2123dba85371ec( var_b547f74d3db2a43e );
        var_b547f74d3db2a43e waittill( "switch_thermal_mode" );
    }
}

// Namespace vtol_warship
// Params 4, eflags: 0x4
// Checksum 0x3db46c11, Offset: 0x1d6e
// Size: 0xef
function private function_e5e09b71bfd57d71( victim, einflictor, smeansofdeath, sweapon )
{
    if ( utility::issharedfuncdefined( #"medal", #"track_rapid_kill", 0 ) )
    {
        utility::callsharedfunc( #"medal", #"track_rapid_kill", "vtol_warship", sweapon );
    }
    
    if ( isdefined( self.rapidkill_data ) )
    {
        if ( isdefined( self.rapidkill_data[ "vtol_warship" ] ) && self.rapidkill_data[ "vtol_warship" ].rapidkill_count == 15 )
        {
            namespace_9d8e359c3b1041e5::doscoreeventsharedfunc( #"medal_overwhelmingforce" );
        }
    }
    
    if ( utility::issharedfuncdefined( #"medal", #"track_scorestreak_kill", 0 ) )
    {
        utility::callsharedfunc( #"medal", #"track_scorestreak_kill", "vtol_warship", victim );
    }
}

// Namespace vtol_warship
// Params 1, eflags: 0x4
// Checksum 0x792e0413, Offset: 0x1e65
// Size: 0x14
function private function_b539c85f0e992684( streakinfo )
{
    self notify( "finished_deploy_weapon" );
}

// Namespace vtol_warship
// Params 1, eflags: 0x4
// Checksum 0x806f9dd8, Offset: 0x1e81
// Size: 0x338, Type: bool
function private function_c1d54a36b82eb87( streakinfo )
{
    self endon( "disconnect" );
    level endon( "game_ended" );
    self notify( "using_remote" );
    var_87fc2c034785a46c = function_508530e3c7fe6b44( streakinfo );
    
    if ( !var_87fc2c034785a46c )
    {
        if ( utility::issharedfuncdefined( #"vehicle", #"decrementfauxvehiclecount" ) )
        {
            [[ utility::getsharedfunc( #"vehicle", #"decrementfauxvehiclecount" ) ]]();
        }
        
        vehicle_tracking::function_4f76f5b4541acef1();
        return false;
    }
    
    streakinfo.streakduration = 60;
    var_6e519cf217378eb1 = function_5160298b0316dd29( streakinfo );
    
    if ( !var_6e519cf217378eb1 )
    {
        val::reset_all( "vtolWarship" );
        
        if ( utility::issharedfuncdefined( #"vehicle", #"decrementfauxvehiclecount" ) )
        {
            [[ utility::getsharedfunc( #"vehicle", #"decrementfauxvehiclecount" ) ]]();
        }
        
        vehicle_tracking::function_4f76f5b4541acef1();
        streakinfo notify( "killstreak_finished_with_deploy_weapon" );
        return false;
    }
    
    if ( utility::issharedfuncdefined( #"game", #"hash_8926b881f898ea61" ) )
    {
        self [[ utility::getsharedfunc( #"game", #"hash_8926b881f898ea61" ) ]]( 1 );
    }
    
    vtolwarship = function_4d183c3b29dad60( self, streakinfo );
    self prestreamasset( "entity", vtolwarship, 1000 );
    
    if ( level.var_3bdd479f506243d0 )
    {
        vtolwarship.ksempapplycallback = &function_2e44af08a5496b9;
    }
    
    vehicle_tracking::function_4f76f5b4541acef1();
    
    if ( !isdefined( vtolwarship ) )
    {
        if ( utility::issharedfuncdefined( #"vehicle", #"decrementfauxvehiclecount" ) )
        {
            [[ utility::getsharedfunc( #"vehicle", #"decrementfauxvehiclecount" ) ]]();
        }
        
        streakinfo notify( "killstreak_finished_with_deploy_weapon" );
        return false;
    }
    
    thread utility::callsharedfunc( #"killstreak", #"hash_dd9f16672046c094", vtolwarship );
    
    if ( utility::issharedfuncdefined( #"killstreak", #"logkillstreakevent" ) )
    {
        self [[ utility::getsharedfunc( #"killstreak", #"logkillstreakevent" ) ]]( "chopper_gunner", self.origin );
    }
    
    var_7478b2ef0fec03b1 = streakinfo.bundle.usedsplashref;
    
    if ( utility::issharedfuncdefined( #"hud", #"teamplayercardsplash" ) )
    {
        self thread [[ utility::getsharedfunc( #"hud", #"teamplayercardsplash" ) ]]( var_7478b2ef0fec03b1, self );
    }
    
    var_65934120c2efeb81 = undefined;
    
    if ( utility::issharedfuncdefined( #"sound", #"playkillstreakdeploydialog" ) )
    {
        self [[ utility::getsharedfunc( #"sound", #"playkillstreakdeploydialog" ) ]]( streakinfo.streakname );
        var_65934120c2efeb81 = 2;
    }
    
    thread killstreak_utility::playkillstreaktacomdialog( streakinfo, "vtol_warship" + "_use", #"use", 1, var_65934120c2efeb81 );
    vtolwarship thread function_5b6d42d897321234( self );
    
    if ( utility::issharedfuncdefined( #"killstreak", #"hash_2a2fdd5408aca764" ) )
    {
        vtolwarship [[ utility::getsharedfunc( #"killstreak", #"hash_2a2fdd5408aca764" ) ]]();
    }
    
    vtolwarship function_620ea4f7a46db56a();
    return true;
}

// Namespace vtol_warship
// Params 1, eflags: 0x4
// Checksum 0x6120e2e7, Offset: 0x21c2
// Size: 0x9d, Type: bool
function private function_508530e3c7fe6b44( streakinfo )
{
    if ( utility::issharedfuncdefined( #"vehicle", #"incrementfauxvehiclecount" ) )
    {
        [[ utility::getsharedfunc( #"vehicle", #"incrementfauxvehiclecount" ) ]]();
    }
    
    if ( !vehicle_tracking::reserve_vehicle() )
    {
        if ( utility::issharedfuncdefined( #"hud", #"showerrormessage" ) )
        {
            [[ utility::getsharedfunc( #"hud", #"showerrormessage" ) ]]( %"killstreaks/too_many_vehicles" );
        }
        
        return false;
    }
    
    if ( level.gameended )
    {
        return false;
    }
    
    return true;
}

// Namespace vtol_warship
// Params 1, eflags: 0x4
// Checksum 0xee72e7e9, Offset: 0x2268
// Size: 0x95, Type: bool
function private function_5160298b0316dd29( streakinfo )
{
    if ( isdefined( level.killstreaktriggeredfunc ) )
    {
        if ( !level [[ level.killstreaktriggeredfunc ]]( streakinfo ) )
        {
            return false;
        }
    }
    
    deployweaponname = streakinfo.bundle.deployweaponname;
    deployresult = killstreakdeploy::streakdeploy_doweapontabletdeploy( streakinfo, undefined, undefined, undefined, &function_b539c85f0e992684, deployweaponname );
    
    if ( !deployresult )
    {
        return false;
    }
    
    if ( isdefined( level.killstreakbeginusefunc ) )
    {
        if ( !level [[ level.killstreakbeginusefunc ]]( streakinfo ) )
        {
            return false;
        }
    }
    
    return true;
}

// Namespace vtol_warship
// Params 2, eflags: 0x4
// Checksum 0x51e967cc, Offset: 0x2306
// Size: 0x8cd
function private function_4d183c3b29dad60( owner, streakinfo )
{
    bundle = streakinfo.bundle;
    owner disablephysicaldepthoffieldscripting();
    pathgoal = ( owner.origin + anglestoforward( owner.angles ) * 2000 ) * ( 1, 1, 0 );
    pathgoal += ( 0, 0, 2000 );
    angles = owner.angles;
    
    if ( isdefined( level.heli_structs_entrances ) && level.heli_structs_entrances.size > 0 )
    {
        var_53eeea462a8fe959 = randomint( level.heli_structs_entrances.size );
        
        if ( utility::issharedfuncdefined( #"chopper_gunner", #"hash_2ebe6213013cff11" ) )
        {
            var_53eeea462a8fe959 = level utility::callsharedfunc( #"chopper_gunner", #"hash_2ebe6213013cff11", owner.origin );
        }
        
        /#
            debugindex = getdvarint( @"hash_c1fa04efebbe3e6b", -1 );
            
            if ( debugindex != -1 )
            {
                var_53eeea462a8fe959 = debugindex;
            }
        #/
        
        entrancestruct = level.heli_structs_entrances[ var_53eeea462a8fe959 ];
        
        if ( utility::issharedfuncdefined( #"chopper_gunner", #"hash_24dfe1998e0f3142" ) )
        {
            goalstruct = [[ utility::getsharedfunc( #"chopper_gunner", #"hash_24dfe1998e0f3142" ) ]]( entrancestruct.script_linkto, level.heli_structs_goals );
            
            if ( isdefined( goalstruct ) )
            {
                newheightoffset = 200;
                heightoffset = ( 0, 0, goalstruct.origin[ 2 ] + newheightoffset );
                
                /#
                    var_526fa115c3fc4688 = getdvarint( @"hash_f3fcf3899fa2e1b0", 0 );
                    heightoffset += ( 0, 0, var_526fa115c3fc4688 );
                #/
                
                var_ef058b074a4eda1d = entrancestruct.origin * ( 1, 1, 0 ) + heightoffset;
                var_78591ed6a66cbafe = goalstruct.origin * ( 1, 1, 0 ) + heightoffset;
                entranceforward = vectornormalize( var_78591ed6a66cbafe - var_ef058b074a4eda1d );
                pathgoal = var_78591ed6a66cbafe + entranceforward * 500;
                angles = vectortoangles( entranceforward );
                
                if ( utility::issharedfuncdefined( #"vtol", #"hash_e2ce19e44daf22e3" ) )
                {
                    thread utility::callsharedfunc( #"vtol", #"hash_e2ce19e44daf22e3", owner, var_ef058b074a4eda1d );
                }
                
                /#
                    level thread debug_utility::drawsphere( var_ef058b074a4eda1d, 20, 60, ( 1, 0, 0 ) );
                    level thread debug_utility::drawline( var_ef058b074a4eda1d, var_78591ed6a66cbafe, 60, ( 1, 1, 1 ) );
                    level thread debug_utility::drawsphere( var_78591ed6a66cbafe, 20, 60, ( 0, 1, 0 ) );
                #/
            }
            else
            {
                /#
                    owner iprintlnbold( "<dev string:x24>" + entrancestruct.script_linkto + "<dev string:x37>" );
                #/
            }
        }
    }
    else if ( isdefined( streakinfo.var_85efcf1c5b41189b ) )
    {
        entranceinfo = [[ streakinfo.var_85efcf1c5b41189b ]]( owner );
        pathgoal = entranceinfo.pathgoal;
        angles = entranceinfo.angles;
    }
    else
    {
        owner iprintlnbold( "Level is missing heli structs, please set them up!" );
        pathgoal *= ( 1, 1, 0 );
    }
    
    vtolwarship = function_87c837c669e88625( streakinfo, pathgoal, angles );
    vtolwarship setcandamage( 0 );
    var_b6ba48086272dc92 = 40;
    turretindex = 0;
    shouldsnap = 1;
    vtolwarship setturrettargetlocalangles( ( var_b6ba48086272dc92, 0, 0 ), turretindex, shouldsnap );
    owner namespace_9d8e359c3b1041e5::freezecontrolssharedfunc( 1 );
    owner function_2d629b17d5984d1a( pathgoal, angles, bundle, vtolwarship );
    
    if ( !isdefined( vtolwarship ) )
    {
        return;
    }
    
    vtolwarship vehphys_forcekeyframedmotion();
    vtolwarship function_d2b8ee2e1275daaf( 1 );
    level thread killstreak_utility::function_6348c97b79ee8a08( vtolwarship, owner, &function_afd5c1049aabc96b );
    modifiedlifetime = 60;
    
    /#
        var_ae24eaad32921ae2 = getdvarint( @"hash_2c01d701bac5d9d3", 0 );
        
        if ( var_ae24eaad32921ae2 )
        {
            modifiedlifetime = 9999;
        }
    #/
    
    vtolwarship.ispiloted = 1;
    vtolwarship.speed = 100;
    vtolwarship.accel = 50;
    vtolwarship.lifetime = modifiedlifetime;
    vtolwarship.team = owner.team;
    vtolwarship.teamfriendlyto = owner.team;
    vtolwarship.owner = owner;
    vtolwarship.owner.vehicle = vtolwarship;
    vtolwarship.angles = angles;
    vtolwarship.streakinfo = streakinfo;
    vtolwarship.streakname = streakinfo.streakname;
    vtolwarship.flaresreservecount = 1;
    vtolwarship.pathgoal = pathgoal;
    vtolwarship.missilesleft = getdvarint( @"hash_52bf6045193decbf", 8 );
    vtolwarship.animname = "ks_chopper_gunner_vehicle_camera";
    vtolwarship.infinite_chopper = istrue( owner.infinite_chopper );
    vtolwarship.heightoffset = heightoffset;
    vtolwarship.var_4d91de78824da316 = streakinfo.bundle.var_3d706f46064a05eb;
    outofbounds::registerentforoob( vtolwarship, "killstreak" );
    utility::registersharedfunc( vtolwarship vehicle::get_ref(), #"hash_5b74b0cc7bc13e5c", &function_572f5f09e092f7f7 );
    utility::registersharedfunc( vtolwarship vehicle::get_ref(), #"hash_3365a912c11d2ba0", &function_d2c496ae44aad48b );
    vtolwarship.var_bdc51be80cbeef82 = bundle.var_bdc51be80cbeef82;
    killstreak_shared::function_28d986de72ce85f8( bundle.var_b9d390a05155bc2f );
    vtolwarship.killcament = spawn( "script_model", vtolwarship gettagorigin( vtolwarship tagexists( #"tag_camera_turret" ) ? #"tag_camera_turret" : #"tag_origin" ) );
    originoffset = ( bundle.var_15869b5e2c380579 ?? 0, bundle.var_15869a5e2c380346 ?? 0, bundle.var_1586995e2c380113 ?? 0 );
    vtolwarship.killcament linkto( vtolwarship, "tag_origin", originoffset, ( 0, 0, 0 ) );
    vtolwarship setvehicleteam( vtolwarship.team );
    
    if ( utility::issharedfuncdefined( #"chopper_gunner", #"attachxrays" ) )
    {
        vtolwarship = [[ utility::getsharedfunc( #"chopper_gunner", #"attachxrays" ) ]]( vtolwarship );
    }
    
    vtolwarship thread function_e402b58c1d031595( "disconnect", streakinfo );
    vtolwarship thread function_e402b58c1d031595( "joined_team", streakinfo );
    vtolwarship thread function_e402b58c1d031595( "joined_spectator", streakinfo );
    vtolwarship thread function_e402b58c1d031595( "player_fatal_death", streakinfo );
    maxhealth = vtolwarship.health;
    vtolwarship.health = maxhealth;
    vtolwarship.maxhealth = maxhealth;
    vtolwarship.currenthealth = maxhealth;
    vtolwarship sentientpoolmanager::registersentient( "Killstreak_Air", owner );
    vtolwarship function_ddb871232b119f6d( streakinfo.streakname );
    
    if ( utility::issharedfuncdefined( #"killstreak", #"addtoactivekillstreaklist" ) )
    {
        vtolwarship [[ utility::getsharedfunc( #"killstreak", #"addtoactivekillstreaklist" ) ]]( streakinfo.streakname, "Killstreak_Air", owner, 0, 1, 100 );
    }
    
    vtolwarship setotherent( owner );
    vtolwarship setcandamage( 1 );
    vtolwarship function_88c3b24439f8aa41( vtolwarship.speed );
    vtolwarship setscriptablepartstate( #"thrusters", #"dynamic", 0 );
    var_8a9b17e7cd21a2e6 = "tag_origin";
    level notify( "matchrecording_chopper", vtolwarship );
    self notify( "chopper_gunner_used" );
    namespace_918c8599c7009cb0::_stopshellshock();
    self.restoreangles = self getplayerangles();
    val::group_set( "vtolWarshipUse", 0 );
    self setcinematicmotionoverride( "player_chopper_gunner_ride_mp" );
    thread killstreak_utility::function_785239235d790099( "80_instant_noscale", 1 );
    self setclientomnvar( "ui_apache_screens_state", 1 );
    self painvisionoff();
    killstreak_shared::killstreak_savenvgstate();
    vtolwarship playsoundtoplayer( "mp_killstreak_apache_transition_lr", self );
    killstreak_utility::playkillstreaktacomdialog( vtolwarship.streakinfo, undefined, #"arrive" );
    
    if ( !isdefined( vtolwarship ) || vtolwarship.isexploding )
    {
        return undefined;
    }
    
    vtolwarship notify( "start_chopper_use" );
    return vtolwarship;
}

// Namespace vtol_warship
// Params 0, eflags: 0x4
// Checksum 0x986173cf, Offset: 0x2bdc
// Size: 0xa
function private function_d2c496ae44aad48b()
{
    self notify( "killstreakExit" );
}

// Namespace vtol_warship
// Params 2, eflags: 0x4
// Checksum 0x1f0715d3, Offset: 0x2bee
// Size: 0x2d, Type: bool
function private function_572f5f09e092f7f7( trigger, vehicle )
{
    if ( trigger.targetname != "VTOL_OutOfBounds" )
    {
        return false;
    }
    
    return true;
}

// Namespace vtol_warship
// Params 1, eflags: 0x4
// Checksum 0x393bc64f, Offset: 0x2c24
// Size: 0x108
function private function_ddb871232b119f6d( streakname )
{
    killstreakvehicle = self;
    scorepopup = "destroyed_" + streakname;
    vodestroyed = undefined;
    destroyedsplash = "callout_destroyed_" + streakname;
    var_c96bcef6709d6df1 = vehicle_damage::set_vehicle_hit_damage_data( streakname, 12 );
    var_d188942a41771ea1 = undefined;
    premoddamagecallback = &function_772f2e9becd13570;
    postmoddamagecallback = &function_8c10f5118434ccf3;
    deathcallback = &function_ade70fd72e758d8f;
    killstreak_utility::killstreak_setupvehicledamagefunctionality( streakname, killstreakvehicle, scorepopup, vodestroyed, destroyedsplash, var_c96bcef6709d6df1, var_d188942a41771ea1, premoddamagecallback, postmoddamagecallback, deathcallback );
    vehicle_tracking::register_instance( self, self.owner, self.owner.team );
    vehicle_occupancy::register_instance( self );
    killstreak_utility::function_b555369eba6b0252( 1, 1500, &function_1d7c593d0375d968 );
    killstreak_utility::function_b555369eba6b0252( 2, 1000, &function_6e7c227b5603c41d );
    killstreak_utility::function_b555369eba6b0252( 3, 500, &function_6d08146f478e207d );
}

// Namespace vtol_warship
// Params 2, eflags: 0x4
// Checksum 0x737ccbc5, Offset: 0x2d34
// Size: 0xf5
function private function_e402b58c1d031595( exitaction, streakinfo )
{
    vtol = self;
    owner = self.owner;
    vtol endon( "death", "exit_chopper_intro", "start_chopper_use" );
    level endon( "game_ended" );
    owner waittill( exitaction );
    
    if ( owner )
    {
        owner cameraunlink();
        owner disablephysicaldepthoffieldscripting();
        owner val::group_reset( "vtolWarshipUse" );
        owner val::reset_all( "vtolWarship" );
        owner killstreak_utility::function_d546aaa588f088c3( streakinfo.streakname, "off" );
        owner setclientomnvar( "ui_apache_screens_state", 0 );
        owner painvisionon();
        owner killstreak_shared::killstreak_restorenvgstate();
        owner killstreak_utility::killstreak_setmainvision( "" );
        owner killstreak_utility::function_f1c03b279632ba1e();
        owner namespace_9d8e359c3b1041e5::freezecontrolssharedfunc( 0 );
        level thread game_utility::fadetoblackforplayer( owner, 0 );
    }
    
    thread function_afd5c1049aabc96b();
    self notify( "exit_chopper_intro" );
}

// Namespace vtol_warship
// Params 0, eflags: 0x4
// Checksum 0x4823be2a, Offset: 0x2e31
// Size: 0x85
function private function_ca56677832f3e163()
{
    vtol = self;
    wait 0.1;
    
    if ( vtol && vtol.health > 0 && vtol.owner )
    {
        turretindex = 0;
        vtol function_de7788e44e24a2c9( 0, turretindex );
        var_13fbe074b3e52d31 = vtol getturretworldangles( turretindex );
        vtol.owner setplayerangles( var_13fbe074b3e52d31 );
        vtol.owner namespace_9d8e359c3b1041e5::freezecontrolssharedfunc( 0 );
    }
}

// Namespace vtol_warship
// Params 1, eflags: 0x4
// Checksum 0xdaf5feaa, Offset: 0x2ebe
// Size: 0x4a5
function private function_5b6d42d897321234( gunner )
{
    self endon( "death", "explode", "leaving", "crashing" );
    level endon( "game_ended" );
    bundle = self.streakinfo.bundle;
    
    if ( isdefined( level.var_d8f10f1cfdbaac7e ) )
    {
        thread [[ level.var_d8f10f1cfdbaac7e ]]( self.streakinfo );
    }
    
    if ( utility::issharedfuncdefined( #"vehicle", #"decrementfauxvehiclecount" ) )
    {
        [[ utility::getsharedfunc( #"vehicle", #"decrementfauxvehiclecount" ) ]]();
    }
    
    gunner = self.owner;
    gunner disablephysicaldepthoffieldscripting();
    gunner val::set( "vtolWarship", "allow_movement", 1 );
    gunner val::set( "vtolWarship", "fire", 1 );
    gunner val::set( "vtolWarship", "ads", 1 );
    gunner cameraunlink();
    gunner thread killstreak_utility::function_785239235d790099( "default" );
    gunner namespace_918c8599c7009cb0::_shellshock( %"killstreak_veh_camera_mp", #"top", self.lifetime, 0 );
    function_c39662f110e6533( 1 );
    
    if ( isdefined( level.choppervisionset ) )
    {
        self.currentvisionset = level.choppervisionset;
    }
    
    if ( !isdefined( self.playersfx ) )
    {
        self.playersfx = spawn( "script_origin", self.origin );
        self.playersfx linkto( self );
    }
    
    if ( utility::issharedfuncdefined( #"chopper_gunner", #"hash_fd6c8efa17b475bf" ) )
    {
        self thread [[ utility::getsharedfunc( #"chopper_gunner", #"hash_fd6c8efa17b475bf" ) ]]();
    }
    else
    {
        weapon_utility::setlockedoncallback( self, &function_c16941deceaec52 );
    }
    
    if ( utility::issharedfuncdefined( #"chopper_gunner", #"hash_7a22056416abf8db" ) )
    {
        self thread [[ utility::getsharedfunc( #"chopper_gunner", #"hash_7a22056416abf8db" ) ]]();
    }
    else
    {
        weapon_utility::setlockedonremovedcallback( self, &function_b0d827e1f17fdb08 );
    }
    
    self setcandamage( 1 );
    thread function_2a7a34efc7638f7f();
    thread function_95b96817b2ff3b73();
    thread function_f3874779b1531e7b();
    thread function_e9961c58f7e89f06( "disconnect" );
    thread function_e9961c58f7e89f06( "joined_team" );
    thread function_e9961c58f7e89f06( "joined_spectator" );
    thread function_e9961c58f7e89f06( "team_kill_punish" );
    thread function_e9961c58f7e89f06( "player_fatal_death" );
    thread function_e9961c58f7e89f06( "last_stand_enter" );
    thread function_b3ccbf49a7ca14e3();
    thread function_52da1e5ada18296c();
    
    if ( !self.infinite_chopper )
    {
        thread function_4c53dec33de9708e();
        self.owner setclientomnvar( "ui_killstreak_countdown", gettime() + int( self.lifetime * 1000 ) );
    }
    
    thread function_ed5b0228f408cbfc( self.owner, self.lifetime, self.infinite_chopper );
    
    if ( utility::issharedfuncdefined( #"chopper_gunner", #"hash_1b30f8a402dc719c" ) )
    {
        self thread [[ utility::getsharedfunc( #"chopper_gunner", #"hash_1b30f8a402dc719c" ) ]]();
    }
    
    if ( isdefined( level.choppervisionset ) )
    {
        self.currentvisionset = level.choppervisionset;
    }
    
    if ( self.currentvisionset )
    {
        gunner killstreak_utility::killstreak_setmainvision( self.currentvisionset );
    }
    
    gunner killstreak_utility::function_d546aaa588f088c3( self.streakinfo.streakname, "on" );
    gunner setclientomnvar( "ui_apache_screens_state", 0 );
    gunner setclientomnvar( "ui_apache_controls", 1 );
    gunner setclientomnvar( "ui_killstreak_weapon_1_ammo", self.missilesleft );
    gunner setclientomnvar( "ui_killstreak_health", self.health / self.maxhealth );
    gunner setclientomnvar( "ui_killstreak_flares", self.flaresreservecount );
    gunner setclientomnvar( "ui_killstreak_damage_state", 0 );
    self.playersfx playloopsound( "veh_apache_killstreak_amb_lr" );
    
    if ( utility::issharedfuncdefined( #"vtol", #"hash_f301da7513baf73" ) )
    {
        utility::callsharedfunc( #"vtol", #"hash_f301da7513baf73", gunner );
    }
    
    gunner setclienttriggeraudiozone( "kls_sat_vtol_warship", 0.5 );
    
    if ( gunner.ksempd )
    {
        function_ade70fd72e758d8f( gunner.var_c7dc16398800176e );
    }
    
    turretindex = 0;
    self.owner usevehicle( self, turretindex );
    thread function_ca56677832f3e163();
    
    if ( self vehicle_isphysveh() )
    {
        self vehphys_setdefaultmotion();
    }
    
    thread function_11a39ea515767fcc();
}

// Namespace vtol_warship
// Params 0, eflags: 0x4
// Checksum 0x7880dc4d, Offset: 0x336b
// Size: 0x1c
function private function_c16941deceaec52()
{
    vehicle_omnvar::show_warning( "missileLocking", self.owner, "killstreak" );
}

// Namespace vtol_warship
// Params 0, eflags: 0x4
// Checksum 0x572412d9, Offset: 0x338f
// Size: 0x1c
function private function_b0d827e1f17fdb08()
{
    vehicle_omnvar::hide_warning( "missileLocking", self.owner, "killstreak" );
}

// Namespace vtol_warship
// Params 0, eflags: 0x4
// Checksum 0x53753ccf, Offset: 0x33b3
// Size: 0xba
function private function_95b96817b2ff3b73()
{
    vtol = self;
    vtol endon( "death", "leaving", "crashing" );
    level endon( "game_ended" );
    var_a51564e233f75aca = 500;
    
    while ( true )
    {
        vtol waittill( "missile_fire", missile );
        vtol.owner earthquakeforplayer( 0.15, 0.1, vtol.origin, 150 );
        missile.streakinfo = vtol.streakinfo;
        vtol.streakinfo.shots_fired++;
        missile thread function_7a9a09f74e065f7( vtol.owner );
    }
}

// Namespace vtol_warship
// Params 0, eflags: 0x4
// Checksum 0x464cc2cd, Offset: 0x3475
// Size: 0x92
function private function_4c53dec33de9708e()
{
    vtol = self;
    vtol endon( "death", "explode", "leaving", "crashing", "game_ended" );
    var_b7d27de865b870d5 = vtol.lifetime * 0.5;
    wait var_b7d27de865b870d5;
    vtol killstreak_utility::playkillstreaktacomdialog( vtol.streakinfo, undefined, #"halfway" );
    wait var_b7d27de865b870d5;
    vtol killstreak_utility::playkillstreaktacomdialog( vtol.streakinfo, undefined, #"leave" );
    vtol thread function_fc1ada72f4e5fde5();
}

// Namespace vtol_warship
// Params 0, eflags: 0x4
// Checksum 0x4c562e2b, Offset: 0x350f
// Size: 0x76
function private function_f3874779b1531e7b()
{
    vtol = self;
    vtol.owner endon( "disconnect" );
    vtol endon( "death", "explode", "leaving", "crashing" );
    level utility::waittill_any( "start_game_ended", "game_ended" );
    self.recordedgameendstats = 1;
    self.owner killstreak_utility::recordkillstreakendstats( self.streakinfo );
    thread function_fc1ada72f4e5fde5();
}

// Namespace vtol_warship
// Params 1, eflags: 0x4
// Checksum 0xf039eeab, Offset: 0x358d
// Size: 0x71
function private function_e9961c58f7e89f06( exitaction )
{
    vtol = self;
    vtol endon( "death", "explode", "leaving", "crashing" );
    level endon( "game_ended" );
    vtol.owner waittill( exitaction );
    
    if ( exitaction == "player_fatal_death" )
    {
        vtol thread function_fc1ada72f4e5fde5();
        return;
    }
    
    vtol thread function_29f2aa6304195825();
    vtol thread function_afd5c1049aabc96b();
}

// Namespace vtol_warship
// Params 0, eflags: 0x4
// Checksum 0x95cf7101, Offset: 0x3606
// Size: 0x236
function private function_b3ccbf49a7ca14e3()
{
    vtol = self;
    vtol endon( "death", "leaving", "crashing" );
    vtol.owner endon( "disconnect" );
    level endon( "game_ended" );
    vtol.var_def1d41fdfcdaa7 = 0;
    vtol.var_5b044033d5ec9a1a = undefined;
    vtol childthread function_efec3ad2e536f69e();
    vtol childthread function_d48af4024c78dbfb();
    streakinfo = vtol.streakinfo;
    missile_ref = streakinfo.bundle.var_ae0d3ee4d0b28e82;
    
    while ( true )
    {
        if ( vtol.var_def1d41fdfcdaa7 != 0 )
        {
            wait 2;
            
            if ( vtol.var_5b044033d5ec9a1a == "vtol_warship_turret_mp" )
            {
                if ( vtol.var_def1d41fdfcdaa7 == 1 )
                {
                    vtol killstreak_utility::playkillstreaktacomdialog( streakinfo, undefined, #"hash_aaf65ee5e704de51" );
                }
                else if ( vtol.var_def1d41fdfcdaa7 == 2 )
                {
                    vtol killstreak_utility::playkillstreaktacomdialog( streakinfo, undefined, #"hash_aaf65be5e704d938" );
                }
                else if ( vtol.var_def1d41fdfcdaa7 == 3 )
                {
                    vtol killstreak_utility::playkillstreaktacomdialog( streakinfo, undefined, #"hash_aaf65ce5e704daeb" );
                }
                else if ( vtol.var_def1d41fdfcdaa7 > 3 )
                {
                    vtol killstreak_utility::playkillstreaktacomdialog( streakinfo, undefined, #"hash_ac4dd1ce75452ee6" );
                }
            }
            else if ( vtol.var_5b044033d5ec9a1a == "sat_vtol_warship_proj_mp" )
            {
                if ( vtol.var_def1d41fdfcdaa7 == 1 )
                {
                    vtol killstreak_utility::playkillstreaktacomdialog( streakinfo, undefined, #"hash_7f843fe6333af730" );
                }
                else if ( vtol.var_def1d41fdfcdaa7 == 2 )
                {
                    vtol killstreak_utility::playkillstreaktacomdialog( streakinfo, undefined, #"hash_7f8442e6333afc49" );
                }
                else if ( vtol.var_def1d41fdfcdaa7 == 3 )
                {
                    vtol killstreak_utility::playkillstreaktacomdialog( streakinfo, undefined, #"hash_7f8441e6333afa96" );
                }
                else if ( vtol.var_def1d41fdfcdaa7 > 3 )
                {
                    vtol killstreak_utility::playkillstreaktacomdialog( streakinfo, undefined, #"hash_c183e1a949590f7d" );
                }
            }
            
            vtol.var_def1d41fdfcdaa7 = 0;
            vtol.var_5b044033d5ec9a1a = undefined;
            wait 1;
        }
        
        waitframe();
    }
}

// Namespace vtol_warship
// Params 0, eflags: 0x4
// Checksum 0x7b67d678, Offset: 0x3844
// Size: 0x67
function private function_efec3ad2e536f69e()
{
    vtol = self;
    
    while ( true )
    {
        vtol.owner waittill( "update_rapid_kill_buffered", recentkills, var_95795539e2a8343 );
        
        if ( isdefined( recentkills ) && isstring( var_95795539e2a8343 ) )
        {
            vtol.var_def1d41fdfcdaa7++;
            vtol.var_5b044033d5ec9a1a = var_95795539e2a8343;
        }
    }
}

// Namespace vtol_warship
// Params 0, eflags: 0x4
// Checksum 0xea404b12, Offset: 0x38b3
// Size: 0x67
function private function_d48af4024c78dbfb()
{
    vtol = self;
    
    while ( true )
    {
        vtol.owner waittill( "update_rapid_agent_kill_buffered", recentkills, weaponname );
        
        if ( isdefined( recentkills ) && isstring( weaponname ) )
        {
            vtol.var_def1d41fdfcdaa7++;
            vtol.var_5b044033d5ec9a1a = weaponname;
        }
    }
}

/#

    // Namespace vtol_warship
    // Params 0, eflags: 0x4
    // Checksum 0x3e98006b, Offset: 0x3922
    // Size: 0x43, Type: dev
    function private printspeed()
    {
        while ( self )
        {
            speed = self vehicle_getspeed();
            print3d( self.origin, speed, ( 1, 0, 0 ), 1, 10, 1, 1 );
            waitframe();
        }
    }

#/

// Namespace vtol_warship
// Params 0
// Checksum 0x4c332e06, Offset: 0x396d
// Size: 0x160
function function_fc1ada72f4e5fde5()
{
    self endon( "death", "crashing" );
    level callback::callback( #"killstreak_finish_use", { #streakinfo:self.streakinfo } );
    
    if ( utility::issharedfuncdefined( #"vtol", #"hash_6a8f8f08a5f76ac" ) )
    {
        utility::callsharedfunc( #"vtol", #"hash_6a8f8f08a5f76ac" );
        return;
    }
    
    /#
    #/
    
    thread function_29f2aa6304195825();
    self setscriptablepartstate( #"camera_turret", #"show", 0 );
    var_32dbca3143d9c4a5 = level.sharedfuncs[ #"flare_system" ][ #"hash_93285145eafb4db4" ];
    
    if ( isdefined( var_32dbca3143d9c4a5 ) )
    {
        self [[ var_32dbca3143d9c4a5 ]]( 0 );
    }
    
    self clearlookatent();
    self notify( "leaving" );
    pathgoal = self.origin + anglestoforward( ( 0, self.angles[ 1 ], 0 ) ) * 100000;
    wait 1;
    self.owner killstreak_utility::playkillstreaktacomdialog( self.streakinfo, undefined, #"timeout" );
    self function_5a9a3101070af0ea( 250 );
    function_88c3b24439f8aa41( 250 );
    function_9e2dc3451d5a7f99( pathgoal, 0, 100, 1, 0 );
    utility::waittill_any_timeout( 20, "near_goal" );
    self notify( "gone" );
    thread function_fcdb47f9aa117021( 0 );
}

// Namespace vtol_warship
// Params 1, eflags: 0x4
// Checksum 0xb12ace50, Offset: 0x3ad5
// Size: 0xb6, Type: bool
function private function_772f2e9becd13570( data )
{
    if ( !level.var_deb9d2b3de25799b )
    {
        return true;
    }
    
    var_2e92350940c6845e = level.sharedfuncs[ #"killstreak" ][ #"getmodifieddamageusingdamagetuning" ];
    
    if ( !isdefined( var_2e92350940c6845e ) )
    {
        return true;
    }
    
    data.damage = self [[ var_2e92350940c6845e ]]( data.attacker, data.objweapon, data.meansofdeath, data.damage, self.maxhealth, self.streakinfo.bundle.var_20cb8f4e47f3353e, data );
    return true;
}

// Namespace vtol_warship
// Params 1, eflags: 0x4
// Checksum 0xc4dce5eb, Offset: 0x3b94
// Size: 0x18f, Type: bool
function private function_8c10f5118434ccf3( data )
{
    attacker = data.attacker;
    objweapon = data.objweapon;
    type = data.meansofdeath;
    damage = data.damage;
    idflags = data.idflags;
    
    if ( self.owner && self.owner.vehicle )
    {
        var_44320290cb66d730 = "light";
        
        if ( isexplosivedamagemod( type ) )
        {
            if ( ceil( damage / self.maxhealth ) >= 0.33 )
            {
                self.owner earthquakeforplayer( 0.25, 0.2, self.origin, 150 );
                self.owner playrumbleonentity( "damage_heavy" );
                var_44320290cb66d730 = "heavy";
            }
            else
            {
                self.owner earthquakeforplayer( 0.15, 0.15, self.origin, 150 );
                self.owner playrumbleonentity( "damage_light" );
            }
        }
        
        if ( self.currentvisionset )
        {
            self.owner killstreak_shared::function_9fd22f7d1a941d8a( self.currentvisionset, var_44320290cb66d730 );
        }
    }
    
    self.currenthealth -= damage;
    killstreak_utility::killstreak_updatedamagestate( self.currenthealth );
    return true;
}

// Namespace vtol_warship
// Params 0, eflags: 0x4
// Checksum 0xa9c77123, Offset: 0x3d2c
// Size: 0x35
function private function_1d7c593d0375d968()
{
    self setscriptablepartstate( "body_damage_light", "on" );
    self.owner killstreak_utility::playkillstreaktacomdialog( self.streakinfo, undefined, #"damage_light" );
}

// Namespace vtol_warship
// Params 0, eflags: 0x4
// Checksum 0xfd1f9842, Offset: 0x3d69
// Size: 0x12
function private function_6e7c227b5603c41d()
{
    self setscriptablepartstate( "body_damage_medium", "on" );
}

// Namespace vtol_warship
// Params 0, eflags: 0x4
// Checksum 0x67cf8383, Offset: 0x3d83
// Size: 0x35
function private function_6d08146f478e207d()
{
    self setscriptablepartstate( "body_damage_heavy", "on" );
    self.owner killstreak_utility::playkillstreaktacomdialog( self.streakinfo, undefined, #"damage_heavy" );
}

// Namespace vtol_warship
// Params 1, eflags: 0x4
// Checksum 0x4ecf7ed7, Offset: 0x3dc0
// Size: 0x3f, Type: bool
function private function_ade70fd72e758d8f( data )
{
    self.killedbyweapon = data.objweapon;
    thread function_d641e4509173f2e3( data.attacker, data.objweapon );
    return true;
}

// Namespace vtol_warship
// Params 2, eflags: 0x4
// Checksum 0x9e6d6e51, Offset: 0x3e08
// Size: 0x7c
function private function_d641e4509173f2e3( attacker, killedbyweapon )
{
    self endon( "explode" );
    var_e6cea5dba02375a5 = isplayer( attacker ) && attacker.isjuggernaut;
    
    if ( self.owner && self.owner.vehicle )
    {
        thread function_29f2aa6304195825( 1 );
    }
    
    function_29f213d7f790dfb1( 150, killedbyweapon );
    thread function_afd5c1049aabc96b();
}

// Namespace vtol_warship
// Params 3, eflags: 0x4
// Checksum 0xca757796, Offset: 0x3e8c
// Size: 0x206
function private function_29f213d7f790dfb1( speed, weaponkilledby, var_efd6abd0ea217b3d )
{
    self endon( "explode" );
    self.iscrashing = 1;
    self clearlookatent();
    self notify( "crashing" );
    self setscriptablepartstate( "engine_explosion", "on", 0 );
    self function_81aef1578a91f39e();
    function_88c3b24439f8aa41( speed );
    glassdamagestate = "missile_damage";
    
    if ( weapon_utility::isbulletweapon( weaponkilledby ) )
    {
        glassdamagestate = "bullet_damage";
    }
    
    self setscriptablepartstate( "glass", glassdamagestate, 0 );
    bundle = self.streakinfo.bundle;
    mindistance = bundle.var_9a34a6c279ea5695 ?? 500;
    maxdistance = bundle.var_9a5890c27a12a0eb ?? 4000;
    distance = randomintrange( mindistance, maxdistance );
    var_61f902b2dd6fc262 = function_b6329a337482233f( distance, bundle.var_9960ca45b9fc4126 ?? 1100 );
    
    /#
        if ( var_efd6abd0ea217b3d )
        {
            sphere( var_61f902b2dd6fc262, 100, ( 0, 1, 0 ), 0, 500 );
            line( self.origin, var_61f902b2dd6fc262, ( 0, 1, 0 ), 1, 0, 500 );
        }
    #/
    
    function_9e2dc3451d5a7f99( var_61f902b2dd6fc262, 0, 100, 0, 1 );
    thread function_c019b1f2d6e3f0ea( speed, bundle.var_eb725408b25c95db ?? 35 );
    self function_d2b8ee2e1275daaf( 0 );
    self vehphys_enablecollisioncallback( 1 );
    thread function_6886803dbdf02738();
    var_44aa5bb822b01ff0 = bundle.var_59c1f28fba40f5b5 ?? 5;
    msg = utility::waittill_any_timeout( var_44aa5bb822b01ff0, "collision", "near_goal" );
    self notify( "stop_trace_for_any_collision" );
    self function_d2b8ee2e1275daaf( 1 );
    self vehphys_enablecollisioncallback( 0 );
    killstreak_utility::function_daa9374e3f6779a5( self.streakinfo.streakname, "pilot" );
}

// Namespace vtol_warship
// Params 0, eflags: 0xc
// Checksum 0xd5b1b869, Offset: 0x409a
// Size: 0xc0
function private function_6886803dbdf02738()
{
    self notify( "884ecbe9df77c578" );
    self endon( "884ecbe9df77c578" );
    self endon( "traceForAnyCollision", "death", "stop_trace_for_any_collision" );
    ignorelist = [ self ];
    
    while ( true )
    {
        currentpos = self.origin;
        velocity = self vehicle_getvelocity();
        testpos = currentpos + velocity * level.framedurationseconds;
        var_7959d0c586d66b13 = trace::sphere_trace( currentpos, testpos, 250, ignorelist );
        obstructed = 0;
        
        if ( isdefined( var_7959d0c586d66b13 ) )
        {
            if ( var_7959d0c586d66b13[ "hittype" ] != "hittype_none" )
            {
                self notify( "collision" );
            }
        }
        
        waitframe();
        
        if ( !isdefined( self ) )
        {
            return;
        }
    }
}

// Namespace vtol_warship
// Params 2, eflags: 0x4
// Checksum 0x945ac1a9, Offset: 0x4162
// Size: 0x78
function private function_c019b1f2d6e3f0ea( speed, acceleration )
{
    self endon( "death" );
    yawspeed = 0;
    self function_eb88c4e66edbc855( "p2p", "turnYawDegrees", angleclamp( self.angles[ 1 ] - 90 ) );
    
    while ( true )
    {
        yawspeed += acceleration * level.framedurationseconds;
        self function_eb88c4e66edbc855( "p2p", "turnYawSpeed", yawspeed );
        waitframe();
    }
}

// Namespace vtol_warship
// Params 2, eflags: 0x4
// Checksum 0x21580eb5, Offset: 0x41e2
// Size: 0x1da
function private function_b6329a337482233f( crashdist, var_9960ca45b9fc4126 )
{
    crashstart = self.origin;
    crashoffset = ( 0, 0, var_9960ca45b9fc4126 );
    crashpos = undefined;
    jetforward = anglestoforward( self.angles );
    jetright = anglestoright( self.angles );
    
    /#
        if ( getdvarint( @"hash_f767cd931c8c9305", 0 ) > 0 )
        {
            crashend = crashstart - ( 0, 0, var_9960ca45b9fc4126 );
            crashpos = crashend;
            return crashpos;
        }
    #/
    
    crashend = crashstart + jetforward * crashdist - crashoffset;
    
    if ( trace::ray_trace_passed( crashstart, crashend, self ) )
    {
        crashpos = crashend;
        return crashpos;
    }
    
    crashend = crashstart - jetforward * crashdist - crashoffset;
    
    if ( trace::ray_trace_passed( crashstart, crashend, self ) )
    {
        crashpos = crashend;
        return crashpos;
    }
    
    crashend = crashstart + jetright * crashdist - crashoffset;
    
    if ( trace::ray_trace_passed( crashstart, crashend, self ) )
    {
        crashpos = crashend;
        return crashpos;
    }
    
    crashend = crashstart - jetright * crashdist - crashoffset;
    
    if ( trace::ray_trace_passed( crashstart, crashend, self ) )
    {
        crashpos = crashend;
        return crashpos;
    }
    
    crashend = crashstart + 0.707 * crashdist * ( jetforward + jetright ) - crashoffset;
    
    if ( trace::ray_trace_passed( crashstart, crashend, self ) )
    {
        crashpos = crashend;
        return crashpos;
    }
    
    crashend = crashstart + 0.707 * crashdist * ( jetforward - jetright ) - crashoffset;
    
    if ( trace::ray_trace_passed( crashstart, crashend, self ) )
    {
        crashpos = crashend;
        return crashpos;
    }
    
    crashend = crashstart + 0.707 * crashdist * ( jetright - jetforward ) - crashoffset;
    crashtrace = trace::ray_trace( crashstart, crashend, self );
    
    if ( trace::ray_trace_passed( crashstart, crashend, self ) )
    {
        crashpos = crashend;
        return crashpos;
    }
    
    crashend = crashstart + 0.707 * crashdist * ( -1 * jetforward - jetright ) - crashoffset;
    
    if ( trace::ray_trace_passed( crashstart, crashend, self ) )
    {
        crashpos = crashend;
        return crashpos;
    }
    
    return crashpos;
}

// Namespace vtol_warship
// Params 0, eflags: 0x4
// Checksum 0x14f73527, Offset: 0x43c5
// Size: 0x9a
function private function_afd5c1049aabc96b()
{
    if ( self.isexploding )
    {
        return;
    }
    
    self.owner thread killstreak_utility::playkillstreaktacomdialog( self.streakinfo, undefined, #"destroyed" );
    self notify( "explode" );
    self.isexploding = 1;
    level callback::callback( #"killstreak_finish_use", { #streakinfo:self.streakinfo } );
    self setscriptablepartstate( "explode", "on", 0 );
    self setscriptablepartstate( "explode_smoke", "on", 0 );
    wait 0.35;
    thread function_fcdb47f9aa117021( 1 );
}

// Namespace vtol_warship
// Params 1
// Checksum 0x80795008, Offset: 0x4467
// Size: 0xfc
function function_fcdb47f9aa117021( wasdestroyed )
{
    if ( self.var_4cddc943547d452d )
    {
        return;
    }
    
    self.var_4cddc943547d452d = 1;
    
    /#
        if ( utility::issharedfuncdefined( #"player", #"printgameaction" ) )
        {
            [[ utility::getsharedfunc( #"player", #"printgameaction" ) ]]( "<dev string:x49>", self.owner );
        }
    #/
    
    self.streakinfo.expiredbydeath = istrue( wasdestroyed );
    
    if ( !self.recordedgameendstats )
    {
        self.owner killstreak_utility::recordkillstreakendstats( self.streakinfo );
    }
    
    self stoploopsound();
    
    if ( isdefined( self.firetarget ) )
    {
        self.firetarget delete();
    }
    
    if ( isdefined( self.killcament ) )
    {
        self.killcament delete();
    }
    
    vehicle_tracking::deregister_instance( self );
    vehicle_occupancy::deregister_instance( self );
    vehicle_tracking::delete_vehicle( self );
}

// Namespace vtol_warship
// Params 1
// Checksum 0x43b70f80, Offset: 0x456b
// Size: 0x1e8
function function_29f2aa6304195825( iscrashing )
{
    owner = self.owner;
    
    if ( !isdefined( owner ) )
    {
        return;
    }
    
    if ( owner isvehicleactive() )
    {
        owner leavevehicle();
    }
    
    streakinfo = self.streakinfo;
    namespace_9d8e359c3b1041e5::clearoobsharedfunc( self, 1 );
    
    if ( isdefined( level.var_fa0d180f4b71bc0e ) )
    {
        thread [[ level.var_fa0d180f4b71bc0e ]]( streakinfo );
    }
    
    owner.vehicle = undefined;
    thread function_93dcd1d0293867bb( owner, iscrashing, streakinfo );
    owner notify( "vtolWarship_returning_player" );
    owner endon( "disconnect" );
    
    if ( utility::issharedfuncdefined( #"game", #"hash_8926b881f898ea61" ) )
    {
        owner [[ utility::getsharedfunc( #"game", #"hash_8926b881f898ea61" ) ]]( 0 );
    }
    
    if ( isdefined( self.playersfx ) )
    {
        self.playersfx stoploopsound();
        self.playersfx delete();
    }
    
    function_b0d827e1f17fdb08();
    owner clearclienttriggeraudiozone( 0.5 );
    owner val::set( "vtolWarship", "allow_movement", 0 );
    owner clearcinematicmotionoverride();
    owner player_utility::setthermalvision( 0 );
    function_fe2123dba85371ec( owner );
    owner killstreak_utility::function_d546aaa588f088c3( streakinfo.streakname, "off" );
    owner setclientomnvar( "ui_apache_controls", 0 );
    owner killstreak_utility::killstreak_setmainvision( "" );
    owner namespace_918c8599c7009cb0::_stopshellshock();
    owner val::group_reset( "vtolWarshipUse" );
    owner val::reset_all( "vtolWarship" );
    level thread killstreak_utility::restorekillstreakplayerangles( owner );
    owner killstreak_utility::function_f1c03b279632ba1e();
    owner namespace_9d8e359c3b1041e5::freezecontrolssharedfunc( 0 );
    owner setclientomnvar( "ui_apache_screens_state", 0 );
    owner painvisionon();
    owner killstreak_shared::killstreak_restorenvgstate();
    owner killstreak_shared::function_b3302c4317df36c6();
    owner notify( "vtolWarship_finished_crash_anim" );
    streakinfo notify( "killstreak_finished_with_deploy_weapon" );
}

// Namespace vtol_warship
// Params 3, eflags: 0x4
// Checksum 0xfe58089c, Offset: 0x475b
// Size: 0xb5
function private function_93dcd1d0293867bb( owner, iscrashing, streakinfo )
{
    if ( !iscrashing )
    {
        return;
    }
    
    self endon( "explode" );
    owner endon( "disconnect" );
    streakinfo endon( "killstreak_finished_with_deploy_weapon" );
    level endon( "game_ended" );
    self waittill( "death" );
    owner killstreak_utility::killstreak_setmainvision( "killstreak_static" );
    owner cameraunlink();
    owner killstreak_utility::killstreak_setmainvision( "" );
    level thread killstreak_utility::restorekillstreakplayerangles( owner );
    owner killstreak_utility::function_f1c03b279632ba1e();
    owner namespace_9d8e359c3b1041e5::freezecontrolssharedfunc( 0 );
    owner setclientomnvar( "ui_apache_screens_state", 0 );
    owner painvisionon();
    owner killstreak_shared::killstreak_restorenvgstate();
    streakinfo notify( "killstreak_finished_with_deploy_weapon" );
}

// Namespace vtol_warship
// Params 0, eflags: 0x4
// Checksum 0x424a5626, Offset: 0x4818
// Size: 0x5f
function private function_11a39ea515767fcc()
{
    self endon( "death", "leaving", "crashing" );
    
    if ( utility::issharedfuncdefined( #"killstreak", #"allowridekillstreakplayerexit" ) )
    {
        self thread [[ utility::getsharedfunc( #"killstreak", #"allowridekillstreakplayerexit" ) ]]( "leaving" );
    }
    
    self waittill( "killstreakExit" );
    thread function_fc1ada72f4e5fde5();
}

// Namespace vtol_warship
// Params 1, eflags: 0x4
// Checksum 0x1e3e9155, Offset: 0x487f
// Size: 0x8a
function private function_7a9a09f74e065f7( owner )
{
    owner endon( "disconnect" );
    level endon( "game_ended" );
    self waittill( "explode", position );
    owner notify( "gunner_turret_impact", position );
    
    if ( utility::issharedfuncdefined( #"spawn", #"addSpawnInfluencer" ) )
    {
        [[ utility::getsharedfunc( #"spawn", #"addSpawnInfluencer" ) ]]( #"hash_eafb9a6b88def4ca", position, owner.team, owner );
    }
}

// Namespace vtol_warship
// Params 1, eflags: 0x4
// Checksum 0xdf913dbb, Offset: 0x4911
// Size: 0x1a
function private function_2e44af08a5496b9( data )
{
    if ( isdefined( self ) )
    {
        function_ade70fd72e758d8f( data );
    }
}

// Namespace vtol_warship
// Params 3, eflags: 0x4
// Checksum 0x7e68254d, Offset: 0x4933
// Size: 0xc9
function private function_87c837c669e88625( streakinfo, origin, angles )
{
    vehicletype = self.team == "axis" ? streakinfo.bundle.var_f1ab087ef28afda5 : streakinfo.bundle.var_7bea6124daa9fa8a;
    spawndata = { #vehicletype:vehicletype, #targetname:streakinfo.streakname, #angles:angles, #origin:origin };
    vtolwarship = vehicle_tracking::spawn_vehicle( spawndata );
    vtolwarship addcomponent( "p2p" );
    return vtolwarship;
}

// Namespace vtol_warship
// Params 5
// Checksum 0x7072f5ff, Offset: 0x4a05
// Size: 0xb0
function function_9e2dc3451d5a7f99( goalpoint, stopatgoal, goaldistance, var_33a7f54f64823521, var_868c803718f8f155 )
{
    self function_eb88c4e66edbc855( "p2p", "goalPoint", goalpoint );
    self function_eb88c4e66edbc855( "p2p", "stopAtGoal", stopatgoal );
    self function_eb88c4e66edbc855( "p2p", "goalThreshold", goaldistance );
    self function_eb88c4e66edbc855( "p2p", "reachGoal2DEnable", var_33a7f54f64823521 );
    self function_eb88c4e66edbc855( "p2p", "vtol3DReachGoalHeightEnable", var_868c803718f8f155 );
    self function_eb88c4e66edbc855( "p2p", "stopAtGoalOscillationFrequency", 0.25 );
    self function_eb88c4e66edbc855( "p2p", "vtol3DStrafeInputEnable", 0 );
}

// Namespace vtol_warship
// Params 1
// Checksum 0xa4968d00, Offset: 0x4abd
// Size: 0x24
function function_88c3b24439f8aa41( speedmph )
{
    self function_eb88c4e66edbc855( "p2p", "manualSpeed", utility::mph_to_ips( speedmph ) );
}

