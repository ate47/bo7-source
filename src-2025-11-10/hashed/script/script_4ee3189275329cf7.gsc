#using script_16ea1b94f0f381b3;
#using script_443d99fe707f1d9f;
#using script_608c50392df8c7d1;
#using script_76006a1eb71d956e;
#using scripts\common\callbacks;
#using scripts\common\scene;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\common\vehicle_omnvar_utility;
#using scripts\common\weapon;
#using scripts\cp_mp\emp_debuff;
#using scripts\cp_mp\execution;
#using scripts\cp_mp\killstreaks\airdrop;
#using scripts\cp_mp\killstreaks\killstreakdeploy;
#using scripts\cp_mp\operator;
#using scripts\cp_mp\utility\damage_utility;
#using scripts\cp_mp\utility\inventory_utility;
#using scripts\cp_mp\utility\killstreak_utility;
#using scripts\cp_mp\utility\player_utility;
#using scripts\cp_mp\utility\team_utility;
#using scripts\cp_mp\utility\weapon_utility;
#using scripts\engine\trace;
#using scripts\engine\utility;
#using scripts\killstreaks\killstreak_shared;
#using scripts\mp\class;
#using scripts\mp\gameobjects;
#using scripts\mp\gamescore;
#using scripts\mp\juggernaut;
#using scripts\mp\killstreaks\juggernaut_mp;
#using scripts\mp\killstreaks\killstreaks;
#using scripts\mp\objidpoolmanager;
#using scripts\mp\outofbounds;
#using scripts\mp\perks\perkfunctions;
#using scripts\mp\teams;
#using scripts\mp\utility\game;
#using scripts\mp\utility\killstreak;
#using scripts\mp\utility\outline;
#using scripts\mp\utility\perk;
#using scripts\mp\utility\player;
#using scripts\mp\utility\points;
#using scripts\mp\weapons;

#namespace remote_robot;

// Namespace remote_robot
// Params 0, eflags: 0x5
// Checksum 0xbab7d9df, Offset: 0x85a
// Size: 0x23b
function private autoexec main()
{
    killstreaks::registerkillstreak( "remote_robot", &function_f71b4ae9d3d63954 );
    utility::registersharedfunc( #"juggernaut", #"initconfig", &juggernaut_mp::jugg_initconfig );
    utility::registersharedfunc( #"juggernaut", #"leveldata", &juggernaut_mp::jugg_leveldata );
    utility::registersharedfunc( #"juggernaut", #"dropcratefromscriptedheli", &juggernaut_mp::jugg_dropcratefromscriptedheli );
    utility::registersharedfunc( #"juggernaut", #"makejuggernaut", &juggernaut_mp::jugg_makejuggernautcallback );
    utility::registersharedfunc( #"juggernaut", #"getMinigunWeapon", &function_226074f15c61b467 );
    utility::registersharedfunc( #"juggernaut", #"activatejuggernaut", &function_e37fa457234c87b );
    utility::registersharedfunc( #"juggernaut", #"removejuggernaut", &function_55d9471cef296b34 );
    utility::registersharedfunc( #"juggernaut", #"modifydamage", &function_6580bf9ba6e8ce2a );
    killstreak_shared::registerkillstreakinitfunction( getxhash( "remote_robot" ), &function_f73afa4f93891a9a );
    var_de4f97ad540a98f7 = utility::function_d0cb6b33aff40a94( #"remote_robot" );
    
    if ( isdefined( var_de4f97ad540a98f7 ) )
    {
        killstreaks::registerkillstreakdamagedealingweapon( "remote_robot", var_de4f97ad540a98f7, #"medium", 1 );
    }
    
    killstreaks::registerkillstreakdamagedealingweapon( "remote_robot", "sat_remote_robot_timeout_explosion", #"medium", 0 );
    killstreaks::registerkillstreakdamagedealingweapon( "remote_robot", "sat_remote_robot_landing_explosion", #"medium", 0 );
    
    /#
        setdevdvarifuninitialized( @"hash_2a7e29e8884635a3", 0 );
    #/
    
    classstruct = class::loadout_getclassstruct();
    classstruct.loadoutprimary = var_de4f97ad540a98f7;
    juggconfig = { #maxvehicledamagedivisor:5, #infiniteammo:1, #perks:[], #classstruct:classstruct };
    level.juggconfig = juggconfig;
    level callback::add( #"register_perk", &function_41bffb9d49d9e59b );
    level callback::add( #"player_death", &function_cd32264cb376a88a );
    level callback::add( #"on_ai_killed", &function_cd32264cb376a88a );
}

// Namespace remote_robot
// Params 0
// Checksum 0x182ed5e1, Offset: 0xa9d
// Size: 0x7d
function function_f73afa4f93891a9a()
{
    bundle = level.streakglobals.streakbundles[ "remote_robot" ];
    
    if ( bundle.var_584f271b3cfcc9f4 )
    {
        utility::add_fx( "remote_robot_death", bundle.var_584f271b3cfcc9f4 );
    }
    
    killstreak_utility::registervisibilityomnvarforkillstreak( "remote_robot", "on", 30 );
    utility::registersharedfunc( #"remote_robot", #"hack", &hack );
}

// Namespace remote_robot
// Params 1
// Checksum 0xb486453b, Offset: 0xb22
// Size: 0x2f
function function_41bffb9d49d9e59b( params )
{
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_remote_robot" );
    }
}

// Namespace remote_robot
// Params 1
// Checksum 0x92928c29, Offset: 0xb59
// Size: 0x2ae
function function_f71b4ae9d3d63954( streakinfo )
{
    if ( utility::issharedfuncdefined( #"juggernaut", #"hash_fd6ae1315c480eef" ) )
    {
        if ( !self [[ utility::getsharedfunc( #"juggernaut", #"hash_fd6ae1315c480eef" ) ]]( streakinfo ) )
        {
            return 0;
        }
    }
    
    if ( isdefined( level.killstreaktriggeredfunc ) )
    {
        if ( !level [[ level.killstreaktriggeredfunc ]]( streakinfo ) )
        {
            return 0;
        }
    }
    
    if ( weapon::function_ecbdce6df0e16a2a( #"remote_robot" ) )
    {
        weapons::function_3301c61ed3c28e3();
        return 0;
    }
    
    if ( self.var_e6e285922d86ab7f )
    {
        streakinfo.dropposition = getclosestpointonnavmesh( self.origin ) + ( 0, 0, 40 );
        
        if ( !isdefined( streakinfo.dropposition ) )
        {
            return 0;
        }
    }
    else
    {
        streakinfo.dropposition = function_72266bf8fa2efb5a();
        
        if ( !isdefined( streakinfo.dropposition ) )
        {
            if ( utility::issharedfuncdefined( #"hud", #"showerrormessage" ) )
            {
                self [[ utility::getsharedfunc( #"hud", #"showerrormessage" ) ]]( %"hash_2e0b77a71f30bcc" );
            }
            
            return 0;
        }
    }
    
    thread killstreak_utility::playkillstreaktacomdialog( streakinfo, undefined, #"arrive", 1, 2 );
    thread function_fde35f1461ef68b1();
    deployweaponobj = makeweapon( "sat_ks_remote_device_mp" );
    streakinfo.var_47d906c0c5d19d0a = self getcurrentweapon();
    streakinfo.var_ec96691f3a2c45c0 = 0;
    
    if ( self.var_adc43141e2117c18 )
    {
        deployresult = 1;
    }
    else
    {
        deployresult = killstreakdeploy::streakdeploy_doweapontabletdeploy( streakinfo, undefined, undefined, undefined, undefined, "sat_ks_remote_device_mp", 1, undefined, undefined, undefined, undefined, 1 );
    }
    
    val::reset_all( "usingRemote" );
    
    if ( deployresult )
    {
        thread function_e37fa457234c87b( streakinfo );
        
        if ( isdefined( self.var_aa0bd298d1ac2539 ) )
        {
            self.var_aa0bd298d1ac2539.inuse = undefined;
            self.var_aa0bd298d1ac2539 = undefined;
        }
        
        self.usingremote = "remote_robot";
        msg = undefined;
        msg = utility::waittill_any_return( "intro_sequence_started" );
        
        if ( !isdefined( msg ) )
        {
            deployresult = 0;
        }
        else if ( isdefined( level.killstreakbeginusefunc ) )
        {
            if ( !level [[ level.killstreakbeginusefunc ]]( streakinfo ) )
            {
                deployresult = 0;
            }
        }
        
        if ( utility::issharedfuncdefined( #"killstreak", #"addtoactivekillstreaklist" ) )
        {
            self [[ utility::getsharedfunc( #"killstreak", #"addtoactivekillstreaklist" ) ]]( "remote_robot", "Killstreak_Ground", self, 0, 1 );
        }
    }
    else
    {
        self.usingremote = undefined;
        self notify( "stopped_using_remote" );
    }
    
    return deployresult;
}

// Namespace remote_robot
// Params 1
// Checksum 0x3b5a81fe, Offset: 0xe10
// Size: 0xba
function function_c75696e00d6fb489( var_302e0347d2460db5 )
{
    if ( isdefined( level.var_e2f4b643d9aa57ae ) )
    {
        foreach ( point in level.var_e2f4b643d9aa57ae )
        {
            if ( !istrue( point.inuse ) )
            {
                point.inuse = 1;
                return point;
            }
        }
        
        waitframe();
    }
    
    return utility::random( level.var_e2f4b643d9aa57ae );
}

// Namespace remote_robot
// Params 0
// Checksum 0xf3c6c0d7, Offset: 0xed3
// Size: 0x3f3
function function_72266bf8fa2efb5a()
{
    var_1263a899db8d137f = 0;
    collisioncontents = trace::create_contents( 0, 1, 0, 1, 1 );
    ignorelist = [];
    startpos = self.origin;
    startangles = self.angles;
    
    if ( isdefined( level.var_e2f4b643d9aa57ae ) )
    {
        closestpos = function_c75696e00d6fb489( self );
        
        if ( isdefined( closestpos ) )
        {
            startpos = closestpos.origin;
            startangles = closestpos.angles;
            self.var_aa0bd298d1ac2539 = closestpos;
        }
    }
    
    forward = anglestoforward( startangles );
    right = anglestoright( startangles );
    var_a442c567bbc4858a = undefined;
    var_f916c6ea28dbc972 = undefined;
    
    while ( true )
    {
        if ( var_1263a899db8d137f > 50 )
        {
            return var_a442c567bbc4858a;
        }
        
        spawnangles = [ forward, forward * -1, 0.707 * ( forward + right ), 0.707 * ( forward - right ), right * -1, right, 0.707 * ( forward * -1 + right ), 0.707 * ( forward * -1 - right ) ];
        spawnpoint = getclosestpointonnavmesh( startpos );
        movingplatforminfo = airdrop::function_6d2c704914d1e4b5( spawnpoint );
        
        if ( !isdefined( movingplatforminfo ) )
        {
            spawnpoint += ( 0, 0, 40 );
            endpoint = spawnpoint + ( 0, 0, 3000 );
            var_e30d1be41eb830f = physics_spherecast( spawnpoint, endpoint, 2.35294, collisioncontents, ignorelist, "physicsquery_all" );
            
            if ( var_e30d1be41eb830f.size == 0 )
            {
                var_1c896b70ed19ff18 = function_3de2cd2ce6de68dd( var_e30d1be41eb830f, spawnpoint, var_a442c567bbc4858a, var_f916c6ea28dbc972 );
                
                if ( var_1c896b70ed19ff18.var_d3f8a6ece5402f8f )
                {
                    return spawnpoint;
                }
                else if ( isdefined( var_1c896b70ed19ff18.var_a442c567bbc4858a ) )
                {
                    var_a442c567bbc4858a = var_1c896b70ed19ff18.var_a442c567bbc4858a;
                    var_f916c6ea28dbc972 = var_1c896b70ed19ff18.var_f916c6ea28dbc972;
                }
            }
        }
        
        foreach ( spawnangle in spawnangles )
        {
            spawnpoint = getclosestpointonnavmesh( startpos + spawnangle * ( var_1263a899db8d137f + 1 ) * 50 );
            movingplatforminfo = airdrop::function_6d2c704914d1e4b5( spawnpoint );
            
            if ( isdefined( movingplatforminfo ) )
            {
                continue;
            }
            
            spawnpoint += ( 0, 0, 40 );
            endpoint = spawnpoint + ( 0, 0, 3000 );
            var_e30d1be41eb830f = physics_spherecast( spawnpoint, endpoint, 20, collisioncontents, ignorelist, "physicsquery_all" );
            
            /#
                if ( getdvarint( @"hash_2a7e29e8884635a3", 0 ) )
                {
                    line( spawnpoint, endpoint, ( 0, 1, 0 ), 1, 0, 300 );
                    
                    foreach ( hitresult in var_e30d1be41eb830f )
                    {
                        sphere( hitresult[ "<dev string:x24>" ], 20, ( 1, 0, 0 ), 0, 300 );
                    }
                }
            #/
            
            if ( var_e30d1be41eb830f.size > 0 )
            {
                continue;
            }
            
            var_1c896b70ed19ff18 = function_3de2cd2ce6de68dd( var_e30d1be41eb830f, spawnpoint, var_a442c567bbc4858a, var_f916c6ea28dbc972 );
            
            if ( var_1c896b70ed19ff18.var_d3f8a6ece5402f8f )
            {
                return spawnpoint;
            }
            
            if ( isdefined( var_1c896b70ed19ff18.var_a442c567bbc4858a ) )
            {
                var_a442c567bbc4858a = var_1c896b70ed19ff18.var_a442c567bbc4858a;
                var_f916c6ea28dbc972 = var_1c896b70ed19ff18.var_f916c6ea28dbc972;
            }
        }
        
        var_1263a899db8d137f++;
        waitframe();
    }
}

// Namespace remote_robot
// Params 4
// Checksum 0x433e87db, Offset: 0x12ce
// Size: 0xb9
function function_3de2cd2ce6de68dd( var_e30d1be41eb830f, spawnpoint, var_a442c567bbc4858a, var_f916c6ea28dbc972 )
{
    var_1c896b70ed19ff18 = spawnstruct();
    var_1c896b70ed19ff18.var_d3f8a6ece5402f8f = 0;
    var_7082227cce3a97f2 = function_9e864832ad01ac0d( spawnpoint );
    
    if ( var_7082227cce3a97f2.var_59843231c822ceab == 0 )
    {
        if ( !var_a442c567bbc4858a || var_f916c6ea28dbc972 < var_7082227cce3a97f2.distancesquared )
        {
            var_1c896b70ed19ff18.var_a442c567bbc4858a = spawnpoint;
            var_1c896b70ed19ff18.var_f916c6ea28dbc972 = var_7082227cce3a97f2.distancesquared;
        }
    }
    else
    {
        var_1c896b70ed19ff18.var_d3f8a6ece5402f8f = 1;
        return var_1c896b70ed19ff18;
    }
    
    return var_1c896b70ed19ff18;
}

// Namespace remote_robot
// Params 1
// Checksum 0xad799f9c, Offset: 0x1390
// Size: 0xc7
function function_9e864832ad01ac0d( var_54b132d0c562c6b1 )
{
    var_7082227cce3a97f2 = spawnstruct();
    var_7082227cce3a97f2.var_59843231c822ceab = 1;
    collisioncontents = trace::create_contents( 0, 1, 1, 1, 0, 1 );
    ignorelist = [];
    var_ce23ccc439350b2b = anglestoforward( self.angles ) * -1;
    offset = var_ce23ccc439350b2b * 150;
    hitresult = physics_raycast( var_54b132d0c562c6b1, var_54b132d0c562c6b1 + offset, collisioncontents, ignorelist, 0, "physicsquery_closest" );
    
    if ( hitresult.size > 0 )
    {
        var_7082227cce3a97f2.var_59843231c822ceab = 0;
        var_7082227cce3a97f2.distancesquared = distance2dsquared( var_54b132d0c562c6b1, hitresult[ 0 ][ "position" ] );
    }
    
    return var_7082227cce3a97f2;
}

// Namespace remote_robot
// Params 0
// Checksum 0x76f70b3f, Offset: 0x1460
// Size: 0x67
function function_226074f15c61b467()
{
    assert( killstreak::isjuggernaut(), "<dev string:x30>" );
    juggconfig = self.juggcontext.juggconfig ?? level.juggconfig;
    minigunweaponobj = weapon_utility::function_d2c8356dc369d9ce( juggconfig.classstruct.loadoutprimary );
    return minigunweaponobj;
}

// Namespace remote_robot
// Params 0, eflags: 0xc
// Checksum 0xe33e5269, Offset: 0x14d0
// Size: 0x105
function private function_fde35f1461ef68b1()
{
    self notify( "7f2c099e18674039" );
    self endon( "7f2c099e18674039" );
    self endon( "juggernaut_removed" );
    level endon( "game_ended" );
    msg = utility::waittill_any_return( "remote_robot_activate", "joined_team", "death_or_disconnect" );
    
    if ( msg == "remote_robot_activate" )
    {
        msg = utility::waittill_any_return( "intro_sequence_started", "joined_team" );
        
        if ( msg == "intro_sequence_started" )
        {
            self waittill( "joined_team" );
            
            if ( self.body )
            {
                self.body hide();
            }
            
            var_99a42fd542172c65 = 1;
        }
        
        self stopcinematicforplayer();
        self setclientomnvar( "ui_using_killstreak_remote", 0 );
        namespace_9d8e359c3b1041e5::function_f6af4ffa6dbb4645( "remote_robot", "on" );
        killstreak_shared::function_9fc2f7ee10890d99( "remote_robot" );
        
        if ( var_99a42fd542172c65 )
        {
            juggernaut::jugg_removejuggernaut( { #var_bfdba4862ac6a877:1 } );
        }
        else
        {
            function_55d9471cef296b34( { #var_bfdba4862ac6a877:1 } );
        }
        
        return;
    }
    
    self setclientomnvar( "ui_using_killstreak_remote", 0 );
}

// Namespace remote_robot
// Params 1
// Checksum 0xee3e96ee, Offset: 0x15dd
// Size: 0x2b
function function_d3dd5cf54318cdbb( streakinfo )
{
    self endon( "intro_sequence_started" );
    level endon( "game_ended" );
    self waittill( "death_or_disconnect" );
    function_55d9471cef296b34();
}

// Namespace remote_robot
// Params 1
// Checksum 0xc9641585, Offset: 0x1610
// Size: 0xaff
function function_e37fa457234c87b( streakinfo )
{
    self notify( "remote_robot_activate" );
    self endon( "remote_robot_ended", "joined_team" );
    level endon( "game_ended" );
    thread function_d3dd5cf54318cdbb( streakinfo );
    var_efe6594cf6bd9a25 = spawnvehicle( "tag_origin", "script_vehicle", "veh_sat_remote_robot_empty", self.origin, self.angles );
    var_efe6594cf6bd9a25 enablelinkto();
    var_efe6594cf6bd9a25 linkto( self );
    self.var_cea7d03870dc1372 = var_efe6594cf6bd9a25;
    self function_66dc8b6ae969f66d( 1 );
    
    if ( !isdefined( self.var_e6e285922d86ab7f ) )
    {
        var_96ba392a8ca08563 = streakinfo.bundle.var_819962c339af1b4d ?? "sat_remote_robot_scorestreak_transition";
        fullscreenfxparams = { #visionset:undefined, #postfxbundlename:var_96ba392a8ca08563 };
        self [[ level.sharedfuncs[ #"fullscreenfx" ][ #"hash_d6d2b1e7868b8f30" ] ]]( fullscreenfxparams );
        self playsoundtoplayer( "kls_jugbot_static_trans_plr", self );
        
        if ( self getscriptablepartstate( "remote_robot_intro_outro_fx", 1 ) != "intro" )
        {
            self setscriptablepartstate( "remote_robot_intro_outro_fx", "intro", 0 );
        }
        
        player::_freezecontrols( 1 );
        wait 0.38;
        
        if ( !isdefined( self ) )
        {
            return;
        }
        
        if ( namespace_9d8e359c3b1041e5::issuperinusesharedfunc() )
        {
            if ( utility::issharedfuncdefined( #"supers", #"superusefinished" ) )
            {
                self thread [[ utility::getsharedfunc( #"supers", #"superusefinished" ) ]]( 0, 0, 1 );
            }
        }
        
        player::_freezecontrols( 0 );
        self playcinematicforplayer( streakinfo.bundle.var_8dcf114aacb7a691 ?? "sat_scorestreak_transition" );
    }
    
    weapons::function_ef0cb557b1a93af9( self );
    thread function_9a9cfc886fefa649();
    thread function_3d88d06c1be4f2ed();
    
    if ( streakinfo.bundle.var_cfdb1d92778c12fd )
    {
        thread function_cad7693c8fafd6f( streakinfo.bundle );
    }
    
    self.damage.var_fbe723a36365e86c = 1;
    var_9ee096ed5e2572d1 = 1;
    function_a5ac1081fc661eed( var_9ee096ed5e2572d1 );
    function_6c1121cff1dae85( var_9ee096ed5e2572d1 );
    weapon_utility::setlockedoncallback( self, &lockedoncallback );
    weapon_utility::setlockedonremovedcallback( self, &lockedonremovedcallback );
    weapon_utility::setincomingcallback( self, &incomingcallback );
    weapon_utility::setincomingremovedcallback( self, &incomingremovedcallback );
    customization = operator::getoperatorcustomization();
    bundle = streakinfo.bundle;
    modifiedlifetime = bundle.var_af31fa3c4e76b37b ?? 60;
    
    if ( utility::issharedfuncdefined( #"juggernaut", #"hash_218fc0adf5bd9638" ) )
    {
        modifiedlifetime = utility::callsharedfunc( #"juggernaut", #"hash_218fc0adf5bd9638", modifiedlifetime );
    }
    
    streakinfo.streakduration = modifiedlifetime;
    juggcontext = { #var_1717a034842e3ec3:int( modifiedlifetime * 1000 + gettime() ), #streakinfo:streakinfo, #var_80684ddb68796647:!( bundle.var_2efbf315050c1117 ?? 0 ), #var_d12b1fde7880be25:self.var_d1b3f29a9c852576, #var_cd97b289c3fd6df7:self.var_aab5beb67c1704ec ?? 0, #var_307d13ca97e891d9:bundle.var_1f78f26ee860c087 ?? 1, #var_fb68c148d6ef3479:bundle.var_76a486bf714fc163 ?? 1, #var_8fae1508552d427a:bundle.var_a8dacb956eececb0 ?? 1, #prevexecution:self.operatorcustomization.execution, #var_47d906c0c5d19d0a:streakinfo.var_47d906c0c5d19d0a, #var_50260bc3539fcf43:operator::function_30f20ce375c4ee40( self.operatorcustomization.skinref ), #prevsuit:self.operatorcustomization.suit, #var_ecc2faa3dbc04e42:self.operatorcustomization.skinref, #var_af5c2804fe001d0e:self.angles, #var_427ed18aa1c070c:self.origin, #maskomnvar:"ui_gas_mask_juggernaut", #var_5e8ed45dc891b7a2:self.perkthirdperson, #prevstance:self getstance(), #var_975438351ed2702c:self.operatorcustomization.geartype, #prevclothtype:self.clothtype, #prevhead:customization[ 1 ], #prevbody:customization[ 0 ], #prevclass:self.class, #prevhealth:self.health, #prevmaxhealth:self.maxhealth };
    movingplatforminfo = airdrop::function_6d2c704914d1e4b5( self.origin );
    
    if ( isdefined( movingplatforminfo ) )
    {
        juggcontext.var_e2cfe4439bfa8b61 = movingplatforminfo.groundent;
        juggcontext.var_af44de24998be5e0 = self.origin - movingplatforminfo.groundent.origin;
    }
    
    self.juggcontext = juggcontext;
    
    if ( isdefined( bundle.var_9240dddb5a042ae ) )
    {
        execution::_giveexecution( bundle.var_9240dddb5a042ae );
    }
    
    loadoutperks = self.loadoutperks;
    
    foreach ( perk in loadoutperks )
    {
        while ( isdefined( self.perks[ perk ] ) )
        {
            perk::removeperk( perk );
        }
    }
    
    perk::giveperk( "specialty_remote_robot" );
    juggcontext.respawnitems = class::respawnitems_saveplayeritemstostruct( 1, 1, 0, 1, 1 );
    weaplist = self getweaponslistprimaries();
    
    foreach ( weap in weaplist )
    {
        inventory_utility::_takeweapon( weap );
    }
    
    if ( game_utility_mp::function_4818e8dcc8c3ec96() && !self.var_aac62f5d456cc12c )
    {
        self skydive_setbasejumpingstatus( 0 );
    }
    
    streakinfo notify( "killstreak_finished_with_deploy_weapon" );
    waitframe();
    self.isjuggernaut = 1;
    self.var_56e1683c857afcf5 = undefined;
    self.var_e4dae87a649544c3 = 1;
    self.var_dc35d76e762774ed = 1;
    self.var_8799d8d2a29f8279 = bundle.var_6f1178426a21e8da ?? 1;
    self.var_e74f076f63e44ec0 = 18;
    self.var_aab5beb67c1704ec = 1;
    self.var_7cd86348fc758d00 = bundle.var_c4d4adfb2c351c0b;
    self.var_d1b3f29a9c852576 = ( 0, 0, 40 );
    var_2b8539cdbeb60ebe = bundle.maxhealth ?? 4000;
    self.maxhealth = var_2b8539cdbeb60ebe;
    self.health = var_2b8539cdbeb60ebe;
    killstreak_utility::function_bea4bda17e40ffb0( self );
    var_de4f97ad540a98f7 = utility::function_d0cb6b33aff40a94( #"remote_robot" );
    juggcontext.classstruct = { #loadoutprimary:var_de4f97ad540a98f7 };
    var_71232d09502b83c = weapon::buildweapon( var_de4f97ad540a98f7 );
    inventory_utility::_giveweapon( var_71232d09502b83c );
    inventory_utility::_switchtoweaponimmediate( var_71232d09502b83c );
    weapon::fixupplayerweapons( self, var_71232d09502b83c );
    item_weapon::function_f9f12ddfa1766b72();
    juggcontext.juggconfig = level.juggconfig;
    
    if ( !isdefined( self.var_ec0bb630fbaa253a ) )
    {
        self.var_ec0bb630fbaa253a = [];
    }
    
    streakinfo.streakname = "remote_robot";
    self.juggcontext.var_71232d09502b83c = var_71232d09502b83c;
    
    /#
        var_ae24eaad32921ae2 = getdvarint( @"hash_2c01d701bac5d9d3", 0 );
        
        if ( var_ae24eaad32921ae2 )
        {
            modifiedlifetime = 9999;
        }
        
        var_c49ea531db34aa20 = getdvarint( @"hash_5f065bbb6eef7d55", 0 );
        
        if ( var_c49ea531db34aa20 > 0 )
        {
            modifiedlifetime = var_c49ea531db34aa20;
        }
    #/
    
    streakinfo.lifetime = modifiedlifetime;
    self.var_941f0a8363236c43 = self getthreatbiasgroup();
    createthreatbiasgroup( "remote_robot" );
    self setthreatbiasgroup( "remote_robot" );
    self notify( "jugg_mask_off" );
    self.juggoverlaystatelabel = undefined;
    self.juggoverlaystate = undefined;
    self.juggcontext.enemieskilled = 0;
    self setclientomnvar( juggcontext.maskomnvar, 0 );
    self setclientomnvar( "ui_remote_robot_enemies_killed", self.juggcontext.enemieskilled );
    self.var_ec0bb630fbaa253a[ var_de4f97ad540a98f7 ] = streakinfo;
    self.var_ec0bb630fbaa253a[ "sat_remote_robot_timeout_explosion" ] = streakinfo;
    self.var_ec0bb630fbaa253a[ "sat_remote_robot_landing_explosion" ] = streakinfo;
    callback::add( #"player_damaged", &function_e05e7d5aa089092e );
    self.var_1d63f3432078fb2c = 1;
    namespace_4fa2d3fe973ec15f::clearminimapid();
    
    if ( utility::issharedfuncdefined( #"game", #"createobjective" ) )
    {
        self.minimapid = self [[ utility::getsharedfunc( #"game", #"createobjective" ) ]]( bundle.minimapicon, self.team, 0, 1, 1 );
        objidpoolmanager::function_e4d6a71507372662( self.minimapid, 0 );
    }
    
    if ( bundle.var_4731da2e1fa2575e )
    {
        level utility::callsharedfunc( #"gametype", #"hash_c0713b1d38d78d84", self );
        
        if ( self.carryobject )
        {
            self.carryobject thread gameobjects::setdropped();
        }
    }
    
    if ( !self.var_7193c22a10fb5738 )
    {
        var_32dbca3143d9c4a5 = level.sharedfuncs[ #"hud" ][ #"teamplayercardsplash" ];
        
        if ( isdefined( var_32dbca3143d9c4a5 ) )
        {
            self [[ var_32dbca3143d9c4a5 ]]( streakinfo.bundle.usedsplashref, self );
        }
    }
    
    waitframe();
    self setclientomnvar( "ui_remote_robot_lifetime_timer", streakinfo.lifetime * 1000 );
    thread function_5bd122ed059fc1ab( streakinfo, 10000 );
    thread function_d475ccedac0aeb2b( streakinfo );
    thread function_7014eab38cc786fb( streakinfo );
    thread watchgameended( streakinfo );
    namespace_9d8e359c3b1041e5::function_9b4fb0a03905926d( self, &empapplied, undefined, undefined );
    
    if ( level.var_36218e71baa7e689 )
    {
        self.var_c5ccf9dff3b5e393 = &function_c5886af82b5f3df;
    }
    
    return 1;
}

// Namespace remote_robot
// Params 1
// Checksum 0x3cf7d548, Offset: 0x2118
// Size: 0x557
function function_d475ccedac0aeb2b( streakinfo )
{
    self endon( "remote_robot_ended" );
    self notify( "intro_sequence_started" );
    
    if ( !isdefined( self.var_e6e285922d86ab7f ) )
    {
        neworigin = streakinfo.dropposition + ( 0, 0, 10000 );
        startpos = neworigin;
        endpos = neworigin - ( 0, 0, 12000 );
        var_7b9ae2047be4c11d = trace::create_contents( 0, 1, 0, 1, 1, 0 );
        var_71b6289a4ca917c0 = physics_raycast( startpos, endpos, var_7b9ae2047be4c11d, undefined, 0, "physicsquery_closest" );
        groundpos = var_71b6289a4ca917c0[ 0 ][ "position" ] ?? streakinfo.dropposition;
        playerangles = self.angles;
        self.animname = "Player 1";
        self.juggcontext.scene_struct = utility::spawn_model( "tag_origin", neworigin, self.angles );
        self.juggcontext.scene_struct scene::set_scriptbundle( "sat_scorestreak_remote_robot" );
        self.juggcontext.scene_struct.var_3544485fbc851ac2 = "tag_player";
        self showlegs();
        self.falldamageprotection = 1;
        self.juggcontext.scene_struct thread scene::play( [ self ], "shot_010", "sat_scorestreak_remote_robot" );
        bundle = killstreak::function_85b2d8e857ab4898( "remote_robot" );
        var_d15dd0d9dfc58c83 = self.team == "axis" ? bundle.var_bfb2f1773c87e8b4 : bundle.var_5eb7d62127a14921;
        function_d5c0b70528396ad2( var_d15dd0d9dfc58c83, bundle.var_efd06a2191fea341 );
        self lerpfovbypreset( "remote_robot_intro" );
        fullscreenfxparams = { #visionsetname:undefined, #postfxbundlename:"cer_mp_rcxd_drive" };
        self [[ level.sharedfuncs[ #"fullscreenfx" ][ #"hash_d6d2b1e7868b8f30" ] ]]( fullscreenfxparams );
        val::set( "remote_robot", "fire", 0 );
        self.takedamage = 0;
        val::set( "remote_robot", "interacts_with_oob_triggers", 0 );
        player::_freezecontrols( 1 );
        self.juggcontext.scene_struct thread function_c1bc2b97f94e008b( self, groundpos );
        utility::waittill_any( "remote_robot_landed", "remote_robot_ended" );
        var_bf41620fc37842d8 = bundle.var_bf41620fc37842d8 ?? 50;
        var_ccf29e46628fffbf = bundle.var_ccf29e46628fffbf ?? 200;
        var_cccf8c4662699071 = bundle.var_cccf8c4662699071 ?? 50;
        
        /#
            if ( getdvarint( @"hash_2a7e29e8884635a3", 0 ) )
            {
                sphere( groundpos, var_bf41620fc37842d8, ( 1, 0, 0 ), 0, 100 );
            }
        #/
        
        self radiusdamage( groundpos, var_bf41620fc37842d8, var_ccf29e46628fffbf, var_cccf8c4662699071, self, "MOD_CRUSH", "sat_remote_robot_landing_explosion" );
        self.juggcontext.scene_struct scene::stop();
        self.juggcontext.scene_struct.origin = groundpos;
        self.falldamageprotection = 0;
        self [[ level.sharedfuncs[ #"fullscreenfx" ][ #"hash_fd9af8d6ec7cc6fb" ] ]]( spawnstruct() );
        self lerpfovbypreset( "default" );
        self.juggcontext.scene_struct scene::play( [ self ], "shot_020", "sat_scorestreak_remote_robot" );
        self stopanimscriptsceneevent();
    }
    else
    {
        bundle = killstreak::function_85b2d8e857ab4898( "remote_robot" );
        var_d15dd0d9dfc58c83 = self.team == "axis" ? bundle.var_bfb2f1773c87e8b4 : bundle.var_5eb7d62127a14921;
        function_d5c0b70528396ad2( var_d15dd0d9dfc58c83, bundle.var_efd06a2191fea341 );
    }
    
    thread function_310647bcdbdbff9();
    val::reset( "remote_robot", "fire" );
    val::reset( "remote_robot", "interacts_with_oob_triggers" );
    self.takedamage = 1;
    self disableusability();
    self notify( "remote_robot_intro_ended" );
    perkfunctions::setthirdpersonmode();
    self function_5dd5184dca17e29b( 0 );
    waitframe();
    self function_5dd5184dca17e29b( 1 );
    player::_freezecontrols( 0 );
    
    if ( !self.var_32b5f6d602b8ffc8 )
    {
        thread function_a1e03f6f9f4a3f0d();
    }
    
    self notify( "intro_landing_finished" );
    self setclientomnvar( "ui_using_killstreak_remote", 0 );
    namespace_9d8e359c3b1041e5::function_f6af4ffa6dbb4645( "remote_robot", "on" );
    killstreak_shared::function_9fc2f7ee10890d99( "remote_robot" );
    hideoverlaytargetmarkerfriendly = 0;
    var_598d79add3230927 = streakinfo.bundle.var_598d79add3230927;
    var_f057b69340b14a5c = streakinfo.bundle.var_f057b69340b14a5c;
    params = { #var_4ef38b0aefb507c6:var_f057b69340b14a5c, #var_d33b439c3dce3f3d:var_598d79add3230927, #hideoverlaytargetmarkerfriendly:hideoverlaytargetmarkerfriendly };
    killstreak_shared::killstreak_assigntargetmarkers( params );
    thread function_fc87adc3374cc9b3( streakinfo );
}

// Namespace remote_robot
// Params 1, eflags: 0x4
// Checksum 0x4f216f23, Offset: 0x2677
// Size: 0xd6
function private function_fc87adc3374cc9b3( streakinfo )
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self endon( "remote_robot_ended" );
    var_4565558cb4444c1e = [];
    bundle = killstreak::function_85b2d8e857ab4898( streakinfo.streakname );
    
    foreach ( data in bundle.var_e0715b47471288fb )
    {
        var_4565558cb4444c1e[ var_4565558cb4444c1e.size ] = data.killstreakname;
    }
    
    killstreak_shared::function_505d16f50dee75d2( var_4565558cb4444c1e );
}

// Namespace remote_robot
// Params 2, eflags: 0x4
// Checksum 0xaef254e6, Offset: 0x2755
// Size: 0x25e
function private function_c1bc2b97f94e008b( player, groundpos )
{
    player endon( "death_or_disconnect" );
    level endon( "game_ended" );
    player endon( "remote_robot_ended" );
    gravity = getdvarfloat( @"bg_gravity", 800 );
    startz = self.origin[ 2 ];
    endz = groundpos[ 2 ];
    assert( startz > endz, "<dev string:x88>" );
    posz = startz;
    var_4e15ac7fc82c86fd = 0;
    lasttime = gettime();
    var_1b601ee2e496eaf2 = function_b9c90667fb9126fa( player.origin, groundpos );
    var_efd00b722f4d0ede = 0;
    var_6d47a90080cfe4ca = var_1b601ee2e496eaf2.size > 0;
    
    while ( posz > endz )
    {
        player val::set( "remote_robot", "show_ui_out_of_bounds", 0 );
        currenttime = gettime();
        frametime = ( currenttime - lasttime ) * 0.001;
        lasttime = currenttime;
        var_4e15ac7fc82c86fd += gravity * -1 * frametime;
        var_213ea50e4377cc5f = posz + var_4e15ac7fc82c86fd * frametime;
        
        if ( var_6d47a90080cfe4ca )
        {
            if ( posz >= var_1b601ee2e496eaf2[ var_efd00b722f4d0ede ][ 2 ] && var_213ea50e4377cc5f <= var_1b601ee2e496eaf2[ var_efd00b722f4d0ede ][ 2 ] || abs( posz - var_1b601ee2e496eaf2[ var_efd00b722f4d0ede ][ 2 ] ) < 10 )
            {
                glassradiusdamage( var_1b601ee2e496eaf2[ var_efd00b722f4d0ede ], 175, 1000, 1000 );
                var_efd00b722f4d0ede++;
                var_6d47a90080cfe4ca = var_efd00b722f4d0ede < var_1b601ee2e496eaf2.size;
            }
        }
        
        currpos = player.origin;
        nextpos = player.origin + ( 0, 0, var_213ea50e4377cc5f );
        var_113555c7430c0744 = trace::create_contents( 0, 0, 0, 0, 0, 1 );
        var_27061cd880775f77 = physics_raycast( currpos, nextpos, var_113555c7430c0744, undefined, 0, "physicsquery_closest" );
        
        if ( var_27061cd880775f77.size > 0 )
        {
            var_a4199ba74ae86a1e = var_27061cd880775f77[ 0 ][ "entity" ];
            var_a4199ba74ae86a1e dodamage( var_a4199ba74ae86a1e.health, nextpos, player, player, "MOD_SCORESTREAK" );
        }
        
        posz = var_213ea50e4377cc5f;
        
        if ( posz < endz )
        {
            posz = endz;
        }
        
        self.origin = ( self.origin[ 0 ], self.origin[ 1 ], posz );
        waitframe();
    }
    
    player notify( "remote_robot_landed" );
}

// Namespace remote_robot
// Params 2, eflags: 0x4
// Checksum 0x19621b, Offset: 0x29bb
// Size: 0xf7
function private function_b9c90667fb9126fa( startpos, endpos )
{
    var_872b3dd7d8e6e720 = trace::create_contents( 0, 0, 1 );
    var_d49b5e808ce99520 = physics_raycast( startpos, endpos, var_872b3dd7d8e6e720, undefined, 0, "physicsquery_closest" );
    var_1b601ee2e496eaf2 = [];
    var_efd00b722f4d0ede = 0;
    
    foreach ( var_5b6bf1e6c3c63613 in var_d49b5e808ce99520 )
    {
        surfacetype = physics_getsurfacetypefromflags( var_5b6bf1e6c3c63613[ "surfaceflags" ] );
        
        if ( surfacetype[ "name" ] == "surftype_glass_pane" )
        {
            var_1b601ee2e496eaf2[ var_efd00b722f4d0ede ] = var_5b6bf1e6c3c63613[ "position" ];
            var_efd00b722f4d0ede++;
        }
    }
    
    return var_1b601ee2e496eaf2;
}

// Namespace remote_robot
// Params 1
// Checksum 0x47ec72a4, Offset: 0x2abb
// Size: 0x3e
function watchgameended( streakinfo )
{
    self endon( "death_or_disconnect", "juggernaut_removed" );
    level waittill( "game_ended" );
    wait 0.5;
    
    if ( self )
    {
        juggernaut::jugg_removejuggernaut( { #var_bfdba4862ac6a877:1 } );
    }
}

// Namespace remote_robot
// Params 1
// Checksum 0xa99501ae, Offset: 0x2b01
// Size: 0x62
function function_7014eab38cc786fb( streakinfo )
{
    self endon( "death_or_disconnect" );
    level endon( "game_ended" );
    self endon( "juggernaut_removed" );
    self waittill( "remote_robot_manual_exit", var_bfdba4862ac6a877 );
    damagedata = spawnstruct();
    
    if ( var_bfdba4862ac6a877 )
    {
        damagedata.var_bfdba4862ac6a877 = 1;
    }
    
    juggernaut::jugg_removejuggernaut( damagedata );
}

// Namespace remote_robot
// Params 2
// Checksum 0x19806f70, Offset: 0x2b6b
// Size: 0x195
function function_5bd122ed059fc1ab( streakinfo, var_3cef575f8a291961 )
{
    self endon( "death_or_disconnect" );
    level endon( "game_ended" );
    self endon( "juggernaut_removed" );
    var_9d8e288d4d2a1acf = 1 / ( level.framedurationseconds ?? 0.016 );
    var_e0c7f53f1576bc69 = self function_a6eea2c0e9886261();
    droptime = sqrt( 2 * var_3cef575f8a291961 / var_e0c7f53f1576bc69 );
    var_17530b1167ed3df1 = 1 / droptime / var_9d8e288d4d2a1acf;
    var_d8b709fce4e79bcc = 0;
    
    while ( true )
    {
        var_d8b709fce4e79bcc += var_17530b1167ed3df1;
        
        if ( var_d8b709fce4e79bcc >= 1 )
        {
            var_d8b709fce4e79bcc = 1;
            self setclientomnvar( "ui_remote_robot_lifetime_progress", var_d8b709fce4e79bcc );
            break;
        }
        
        self setclientomnvar( "ui_remote_robot_lifetime_progress", var_d8b709fce4e79bcc );
        waitframe();
    }
    
    if ( !isdefined( self.var_e6e285922d86ab7f ) )
    {
        self waittill( "intro_landing_finished" );
    }
    
    timeouttime = gettime() + streakinfo.lifetime * 1000;
    
    if ( streakinfo.bundle.var_641d6a75f1c561cf )
    {
        thread function_4552995e996638f( streakinfo.bundle, streakinfo.lifetime );
    }
    
    while ( true )
    {
        remainingtime = timeouttime - gettime();
        self setclientomnvar( "ui_remote_robot_lifetime_timer", max( remainingtime, 0 ) );
        self setclientomnvar( "ui_remote_robot_lifetime_progress", max( remainingtime / streakinfo.lifetime * 1000, 0 ) );
        
        if ( remainingtime <= 0 )
        {
            break;
        }
        
        waitframe();
    }
    
    juggernaut::jugg_removejuggernaut();
}

// Namespace remote_robot
// Params 0
// Checksum 0xb8c3143b, Offset: 0x2d08
// Size: 0x28d
function function_310647bcdbdbff9()
{
    self notify( "1e4080825b5a24e6" );
    self endon( "1e4080825b5a24e6" );
    self endon( "remote_robot_ended", "disconnect" );
    
    if ( !isdefined( self.juggcontext.var_a82ef22299b4c38c ) )
    {
        self.juggcontext.var_a82ef22299b4c38c = [];
    }
    
    bundle = killstreak::function_85b2d8e857ab4898( "remote_robot" );
    
    while ( true )
    {
        enemies = team_utility::getenemyplayers( self.team, 0 );
        
        foreach ( enemy in enemies )
        {
            var_2cca33222acc9fa9 = isdefined( enemy.perks[ "specialty_coldblooded" ] );
            var_6f0d2687cde7d6bf = undefined;
            
            foreach ( var_458e90ebd3bf709f in self.juggcontext.var_a82ef22299b4c38c )
            {
                if ( var_458e90ebd3bf709f.entity == enemy )
                {
                    var_6f0d2687cde7d6bf = var_458e90ebd3bf709f;
                    break;
                }
            }
            
            var_aabf5b8d4b653bbc = isdefined( var_6f0d2687cde7d6bf );
            
            if ( var_aabf5b8d4b653bbc && ( var_2cca33222acc9fa9 || !isalive( enemy ) ) )
            {
                outline::outlinedisable( var_6f0d2687cde7d6bf.id, var_6f0d2687cde7d6bf.entity );
                self.juggcontext.var_a82ef22299b4c38c = arrayremove( self.juggcontext.var_a82ef22299b4c38c, var_6f0d2687cde7d6bf );
                continue;
            }
            
            if ( !var_aabf5b8d4b653bbc && !var_2cca33222acc9fa9 )
            {
                var_6f0d2687cde7d6bf = {};
                var_6f0d2687cde7d6bf.entity = enemy;
                var_6f0d2687cde7d6bf.id = outline::outlineenableforplayer( enemy, self, bundle.var_5a68e8016fdded81 ?? "sat_remote_robot_enemy", "killstreak" );
                self.juggcontext.var_a82ef22299b4c38c[ self.juggcontext.var_a82ef22299b4c38c.size ] = var_6f0d2687cde7d6bf;
            }
        }
        
        wait 0.1;
    }
}

// Namespace remote_robot
// Params 1, eflags: 0x4
// Checksum 0x6e68cccf, Offset: 0x2f9d
// Size: 0x39
function private function_c5886af82b5f3df( data )
{
    data.attacker thread points::doscoreevent( #"hash_105e8d0403353d48", data.objweapon );
    juggernaut::jugg_removejuggernaut();
}

// Namespace remote_robot
// Params 0
// Checksum 0x176619be, Offset: 0x2fde
// Size: 0xc7
function function_e76a54331a052d4d()
{
    bundle = level.streakglobals.streakbundles[ "remote_robot" ];
    var_702c44c513f07cea = bundle.var_9f9dbc6d77e20d40 ?? 100;
    var_d1b43559cfa167f9 = bundle.var_4496093b1e3b0ad7 ?? 200;
    var_d1912759cf7b0177 = bundle.var_44b8f73b1e612af9 ?? 50;
    
    /#
        if ( getdvarint( @"hash_2a7e29e8884635a3", 0 ) )
        {
            sphere( self.origin, var_702c44c513f07cea, ( 1, 0, 0 ), 0, 60 );
        }
    #/
    
    self radiusdamage( self.origin, var_702c44c513f07cea, var_d1b43559cfa167f9, var_d1912759cf7b0177, self, "MOD_EXPLOSIVE", "sat_remote_robot_timeout_explosion" );
}

// Namespace remote_robot
// Params 1
// Checksum 0x2af1d4ec, Offset: 0x30ad
// Size: 0x1dd
function playdeathfx( var_bfdba4862ac6a877 )
{
    bundle = killstreak::function_85b2d8e857ab4898( "remote_robot" );
    
    if ( self.suit != bundle.var_efd06a2191fea341 )
    {
        return;
    }
    
    if ( var_bfdba4862ac6a877 )
    {
        self setscriptablepartstate( "death_fx", "instant_death" );
        waitframe();
    }
    else
    {
        val::set( "remote_robot", "fire", 0 );
        self setscriptablepartstate( "death_fx", "on" );
        
        if ( isdefined( self.juggcontext.scene_struct ) )
        {
            self.juggcontext.scene_struct delete();
        }
        
        self.juggcontext.scene_struct = utility::spawn_model( "tag_origin", self.origin, self.angles );
        self.juggcontext.scene_struct.var_3544485fbc851ac2 = undefined;
        self.juggcontext.scene_struct scene::set_scriptbundle( "sat_scorestreak_remote_robot_death" );
        self.juggcontext.scene_struct thread scene::play( [ self ], "shot_010", "sat_scorestreak_remote_robot_death" );
        emp_debuff::play_emp_scramble( bundle.var_33622da4f3c62a36 ?? 3 );
        self.takedamage = 0;
        utility::waittill_any_timeout( bundle.var_3b7f8da5aa3ba402 ?? 0, "remote_robot_ended" );
        self.juggcontext.scene_struct thread scene::stop();
        self.takedamage = 1;
        emp_debuff::stop_emp_scramble( bundle.var_33622da4f3c62a36 ?? 3 );
        val::reset( "remote_robot", "fire" );
        self setscriptablepartstate( "death_fx", "off" );
    }
    
    function_e76a54331a052d4d();
}

// Namespace remote_robot
// Params 1
// Checksum 0x388a36b, Offset: 0x3292
// Size: 0x2d
function function_42df8ef766e7ad78( params )
{
    if ( params.smeansofdeath == "MOD_TRIGGER_HURT" )
    {
        params.idamage = 0;
    }
}

// Namespace remote_robot
// Params 1
// Checksum 0x3b9fc34d, Offset: 0x32c7
// Size: 0x7f8
function function_55d9471cef296b34( damagedata )
{
    player = self;
    
    if ( !player callback::exists( #"hash_652eb614ba902b3d", &function_42df8ef766e7ad78 ) )
    {
        player callback::add( #"hash_652eb614ba902b3d", &function_42df8ef766e7ad78 );
    }
    
    if ( player.var_cea7d03870dc1372 )
    {
        if ( player.var_cea7d03870dc1372 islinked() )
        {
            player.var_cea7d03870dc1372 unlink();
        }
        
        player.var_cea7d03870dc1372 delete();
    }
    
    if ( !isdefined( player ) )
    {
        return;
    }
    
    if ( isdefined( damagedata.attacker.team ) && player_utility::isenemy( damagedata.attacker ) )
    {
        player thread killstreak_utility::playkillstreaktacomdialog( player.juggcontext.streakinfo, undefined, #"destroyed" );
    }
    
    player playdeathfx( damagedata.var_bfdba4862ac6a877 );
    
    if ( isdefined( player.juggcontext.scene_struct ) )
    {
        player.juggcontext.scene_struct scene::stop();
        player.juggcontext.scene_struct delete();
        player.juggcontext.scene_struct = undefined;
    }
    
    player function_66dc8b6ae969f66d( 0 );
    self disableplayermarks( #"killstreak" );
    
    if ( utility::issharedfuncdefined( #"killstreak", #"removefromactivekillstreaklist" ) )
    {
        self [[ utility::getsharedfunc( #"killstreak", #"removefromactivekillstreaklist" ) ]]( self getentitynumber() );
    }
    
    weapons::function_d5eafafe8f6a97bf( player );
    player perk::removeperk( "specialty_remote_robot" );
    player callback::remove( #"player_damaged", &function_e05e7d5aa089092e );
    player.var_1d63f3432078fb2c = undefined;
    weapon_utility::setlockedoncallback( player, undefined );
    weapon_utility::setlockedonremovedcallback( player, undefined );
    weapon_utility::setincomingcallback( player, undefined );
    weapon_utility::setincomingremovedcallback( player, undefined );
    
    if ( damagedata.attacker && damagedata.attacker != player )
    {
        damagedata.attacker points::doscoreevent( #"hash_105e8d0403353d48", damagedata.objweapon );
    }
    
    var_9ee096ed5e2572d1 = 0;
    function_a5ac1081fc661eed( var_9ee096ed5e2572d1 );
    function_6c1121cff1dae85( var_9ee096ed5e2572d1 );
    player.damage.var_fbe723a36365e86c = 0;
    
    if ( isdefined( player.juggcontext ) )
    {
        player function_d5c0b70528396ad2( player.juggcontext.var_ecc2faa3dbc04e42, player.juggcontext.prevsuit );
        player execution::_giveexecution( player.juggcontext.prevexecution );
    }
    
    if ( isalive( player ) && isdefined( player.juggcontext ) )
    {
        if ( self.isjuggernaut )
        {
            player inventory_utility::_takeweapon( player.juggcontext.var_71232d09502b83c );
        }
        
        item_weapon::function_f9f12ddfa1766b72();
        player switchtoweapon( player.juggcontext.var_47d906c0c5d19d0a );
        
        if ( !player.var_b8a3eb3d2a1c3998 )
        {
            var_373d2bc4e76f6fb3 = player.juggcontext.var_427ed18aa1c070c;
            
            if ( isdefined( player.juggcontext.var_e2cfe4439bfa8b61 ) )
            {
                var_373d2bc4e76f6fb3 = player.juggcontext.var_e2cfe4439bfa8b61.origin + player.juggcontext.var_af44de24998be5e0;
                
                if ( outofbounds::ispointinoutofbounds( var_373d2bc4e76f6fb3 ) )
                {
                    var_373d2bc4e76f6fb3 = getclosestpointonnavmesh( var_373d2bc4e76f6fb3 );
                }
            }
            
            player setorigin( var_373d2bc4e76f6fb3 );
            player setplayerangles( player.juggcontext.var_af5c2804fe001d0e );
        }
        
        player.maxhealth = player.juggcontext.prevmaxhealth;
        player.health = player.maxhealth;
    }
    
    player killstreak_shared::function_b3302c4317df36c6();
    player namespace_4fa2d3fe973ec15f::clearminimapid();
    player killstreak_utility::function_d546aaa588f088c3( "remote_robot", "off" );
    player killstreak_shared::function_76bbbe12ce816ed2();
    player enableusability();
    
    foreach ( var_458e90ebd3bf709f in player.juggcontext.var_a82ef22299b4c38c )
    {
        outline::outlinedisable( var_458e90ebd3bf709f.id, var_458e90ebd3bf709f.entity );
    }
    
    player.juggcontext.var_a82ef22299b4c38c = undefined;
    player function_92305205d36aa2e1( 1 );
    player.isjuggernaut = 0;
    player.var_e4dae87a649544c3 = 0;
    player.var_dc35d76e762774ed = 0;
    
    if ( isdefined( player.juggcontext ) )
    {
        player.juggcontext.var_8fae1508552d427a = 0;
        player.juggcontext.var_fb68c148d6ef3479 = 0;
        player.var_aab5beb67c1704ec = player.juggcontext.var_cd97b289c3fd6df7;
        player.var_d1b3f29a9c852576 = player.juggcontext.var_d12b1fde7880be25;
        
        if ( isdefined( player.juggcontext.prevstance ) )
        {
            player setstance( player.juggcontext.prevstance, undefined, 1, 1 );
        }
    }
    
    player.usingremote = undefined;
    player.var_7bbad00825f3c09a = 1;
    
    if ( !player.juggcontext.var_5e8ed45dc891b7a2 )
    {
        player perkfunctions::function_1a8b6c7b9a39972();
    }
    
    player.var_7cd86348fc758d00 = undefined;
    player namespace_9d8e359c3b1041e5::function_7c5eb0e985e1d8c4( player );
    
    if ( level.var_36218e71baa7e689 )
    {
        player.var_c5ccf9dff3b5e393 = undefined;
    }
    
    player notify( "stopped_using_remote" );
    player.var_7bbad00825f3c09a = undefined;
    
    if ( threatbiasgroupexists( self.var_941f0a8363236c43 ) )
    {
        self setthreatbiasgroup( self.var_941f0a8363236c43 );
    }
    
    self.var_941f0a8363236c43 = undefined;
    bundle = killstreak::function_85b2d8e857ab4898( "remote_robot" );
    
    if ( !isdefined( self.var_e6e285922d86ab7f ) )
    {
        var_96ba392a8ca08563 = bundle.var_819962c339af1b4d ?? "sat_remote_robot_scorestreak_transition";
        fullscreenfxparams = { #visionset:undefined, #postfxbundlename:var_96ba392a8ca08563 };
        self [[ level.sharedfuncs[ #"fullscreenfx" ][ #"hash_d6d2b1e7868b8f30" ] ]]( fullscreenfxparams );
        self playsoundtoplayer( "kls_jugbot_static_trans_plr", self );
    }
    
    self setscriptablepartstate( "remote_robot_intro_outro_fx", "outro_add_camo", 0 );
    
    if ( game_utility_mp::function_4818e8dcc8c3ec96() && !self.var_aac62f5d456cc12c )
    {
        self skydive_setbasejumpingstatus( 1 );
    }
    
    player killstreak_utility::recordkillstreakendstats( player.juggcontext.streakinfo );
    level callback::callback( #"killstreak_finish_use", { #streakinfo:player.juggcontext.streakinfo } );
    player notify( "remote_robot_ended" );
    
    if ( player callback::exists( #"hash_652eb614ba902b3d", &function_42df8ef766e7ad78 ) )
    {
        player callback::remove( #"hash_652eb614ba902b3d", &function_42df8ef766e7ad78 );
    }
}

// Namespace remote_robot
// Params 2, eflags: 0x4
// Checksum 0x36b9b63b, Offset: 0x3ac7
// Size: 0x273
function private function_d5c0b70528396ad2( skin, suitoverride )
{
    self.operatorcustomization.skinref = skin;
    operator = operator::function_30f20ce375c4ee40( skin );
    suit = suitoverride ?? utility::function_f825237e0eda5adf();
    self.operatorcustomization.suit = suit;
    gender = operator::getoperatorgender( operator );
    clothtype = operator::function_b1788ccf1b3c0ae9( skin );
    geartype = operator::function_d633420b529828e8( skin );
    self setoperatorcustomization( operator, skin );
    bodymodelname = self getcustomizationbody();
    headmodelname = self getcustomizationhead();
    bodymodelname = teams::function_7c810013ad96976( bodymodelname, headmodelname );
    player::_setsuit( self.operatorcustomization.suit );
    
    if ( isdefined( self.headmodel ) )
    {
        self detach( self.headmodel );
    }
    
    self setmodel( bodymodelname );
    self.bodymodel = bodymodelname;
    
    if ( isdefined( headmodelname ) )
    {
        self attach( headmodelname, "", 1 );
        self.headmodel = headmodelname;
    }
    
    self notify( "set_operator" );
    
    if ( gender == "1" )
    {
        self function_dbb6f7adbaeb1040( "female" );
        self.operatorcustomization.gender = "female";
    }
    else
    {
        self function_dbb6f7adbaeb1040( "" );
        self.operatorcustomization.gender = "male";
    }
    
    if ( !isdefined( clothtype ) || clothtype == "" )
    {
        clothtype = "vestlight";
    }
    
    if ( isdefined( self.operatorcustomization.clothtype ) && self.operatorcustomization.clothtype != clothtype )
    {
        self.operatorcustomization.clothtype = clothtype;
        self setclothtype( getxhash( clothtype ) );
    }
    
    if ( !isdefined( geartype ) || geartype == "" )
    {
        geartype = "millghtgr";
    }
    
    if ( isdefined( self.operatorcustomization.geartype ) && self.operatorcustomization.geartype != geartype )
    {
        self.operatorcustomization.geartype = geartype;
        self setgeartype( getxhash( geartype ) );
    }
}

// Namespace remote_robot
// Params 1
// Checksum 0x9648c4ea, Offset: 0x3d42
// Size: 0x9e
function function_973bf08a6abca875( ison )
{
    bundle = level.streakglobals.streakbundles[ "remote_robot" ];
    fullscreenfxparams = { #postfxbundlename:bundle.var_5fe08ba318a2131f };
    
    if ( ison )
    {
        self [[ level.sharedfuncs[ #"fullscreenfx" ][ #"hash_d6d2b1e7868b8f30" ] ]]( fullscreenfxparams );
        return;
    }
    
    self [[ level.sharedfuncs[ #"fullscreenfx" ][ #"hash_fd9af8d6ec7cc6fb" ] ]]( fullscreenfxparams );
}

// Namespace remote_robot
// Params 1
// Checksum 0x526dc5fc, Offset: 0x3de8
// Size: 0x12c
function function_a5ac1081fc661eed( var_9ee096ed5e2572d1 )
{
    self allowcrouch( !var_9ee096ed5e2572d1 );
    self allowprone( !var_9ee096ed5e2572d1 );
    self allowslide( !var_9ee096ed5e2572d1 );
    self allowdive( !var_9ee096ed5e2572d1 );
    self allowsupersprint( !var_9ee096ed5e2572d1 );
    
    if ( var_9ee096ed5e2572d1 )
    {
        val::set( "remote_robot", "ladder", 0 );
        val::set( "remote_robot", "crate_use", 0 );
        val::set( "remote_robot", "swimming", 0 );
        val::set( "remote_robot", "weapon_pickup", 0 );
        val::set( "remote_robot", "offhand_throwback", 0 );
        self disableexecutionvictim();
        class::blockclasschange();
    }
    else
    {
        val::reset( "remote_robot", "ladder" );
        val::reset( "remote_robot", "crate_use" );
        val::reset( "remote_robot", "swimming" );
        val::reset( "remote_robot", "weapon_pickup" );
        val::reset( "remote_robot", "offhand_throwback" );
        self enableexecutionvictim();
        class::unblockclasschange();
    }
    
    if ( self.swim )
    {
        self.swim.var_401e9f3c6e4789da = var_9ee096ed5e2572d1;
    }
}

// Namespace remote_robot
// Params 1
// Checksum 0xd479dd9, Offset: 0x3f1c
// Size: 0x70
function function_6c1121cff1dae85( var_9ee096ed5e2572d1 )
{
    val::set( "remote_robot", "health_regen", !var_9ee096ed5e2572d1 );
    val::set( "remote_robot", "supers", !var_9ee096ed5e2572d1 );
    val::set( "remote_robot", "equipment_primary", !var_9ee096ed5e2572d1 );
    val::set( "remote_robot", "equipment_secondary", !var_9ee096ed5e2572d1 );
    val::set( "remote_robot", "ledgehang", !var_9ee096ed5e2572d1 );
}

// Namespace remote_robot
// Params 0
// Checksum 0x3a6f8f78, Offset: 0x3f94
// Size: 0x8d
function function_9a9cfc886fefa649()
{
    self endon( "death_or_disconnect" );
    self endon( "remote_robot_ended" );
    bundle = killstreak::function_85b2d8e857ab4898( "remote_robot" );
    jumpheightscale = bundle.var_a7d9f6420a679214 ?? 1;
    
    while ( true )
    {
        utility::waittill_any( "swim_breathing_disabled_begin", "swim_breathing_disabled_end" );
        waitframe();
        
        if ( self.swim.underwater )
        {
            self function_92305205d36aa2e1( jumpheightscale );
        }
        else
        {
            self function_92305205d36aa2e1( 1 );
        }
        
        waitframe();
    }
}

// Namespace remote_robot
// Params 2
// Checksum 0x8abc8e6, Offset: 0x4029
// Size: 0xbf
function function_4552995e996638f( bundle, duration )
{
    if ( !bundle.var_641d6a75f1c561cf )
    {
        return;
    }
    
    self endon( "remote_robot_ended" );
    self endon( "disconnect" );
    self endon( "death" );
    level endon( "game_ended" );
    var_e06e6ccfab27c9f7 = bundle.var_4b348a9391c7f249 ?? 10;
    var_b5aa77dfc7841eb2 = duration - var_e06e6ccfab27c9f7;
    wait var_b5aa77dfc7841eb2;
    self.soundent = spawn( "script_origin", self.origin );
    self.soundent showonlytoplayer( self );
    self.soundent playloopsound( bundle.var_641d6a75f1c561cf );
    thread function_33cfd4085e5018ba( bundle, var_e06e6ccfab27c9f7 );
}

// Namespace remote_robot
// Params 2
// Checksum 0x21179105, Offset: 0x40f0
// Size: 0x6b
function function_33cfd4085e5018ba( bundle, duration )
{
    if ( !bundle.var_641d6a75f1c561cf )
    {
        return;
    }
    
    utility::waittill_any_timeout( duration, "death", "remote_robot_ended" );
    
    if ( self.soundent )
    {
        self.soundent stoploopsound( bundle.var_641d6a75f1c561cf );
        self.soundent delete();
    }
}

// Namespace remote_robot
// Params 1
// Checksum 0x372ab56b, Offset: 0x4163
// Size: 0x2d
function function_952126ec59cb6a30( duration )
{
    utility::waittill_any_timeout( duration, "death", "remote_robot_ended" );
    self function_c67c92094ae6ccf7();
    self notify( "radar_ping_end" );
}

// Namespace remote_robot
// Params 1
// Checksum 0x25e456aa, Offset: 0x4198
// Size: 0xef
function function_cad7693c8fafd6f( bundle )
{
    self endon( "remote_robot_ended" );
    self endon( "disconnect" );
    self endon( "death" );
    level endon( "game_ended" );
    
    if ( bundle.var_fc2426ed24b89bc8 )
    {
        pingduration = bundle.var_af31fa3c4e76b37b ?? 60;
    }
    
    if ( !isdefined( pingduration ) )
    {
        pingduration = bundle.var_c11039e6760bccbc ?? 0;
    }
    
    self.var_667ea7413e3ee64e = bundle.radarpingsweepradius;
    self waittill( "remote_robot_intro_ended" );
    self setclientomnvar( "radar_ping", function_43b5ed5a14a56573( #"scriptbundle_killstreak", bundle.var_d80db24c90d421fb ) );
    self function_744ec8023439271f( int( bundle.radarpingsweepradius ), int( bundle.radarpingsweeptime * 1000 ), int( bundle.var_2962c1bc94835e40 * 1000 ) );
    thread function_952126ec59cb6a30( pingduration );
}

// Namespace remote_robot
// Params 0
// Checksum 0x24cbe293, Offset: 0x428f
// Size: 0x29
function function_3d88d06c1be4f2ed()
{
    self endon( "remote_robot_ended" );
    self endon( "death" );
    level endon( "game_ended" );
    self waittill( "disconnect" );
    namespace_4fa2d3fe973ec15f::clearminimapid();
}

// Namespace remote_robot
// Params 6
// Checksum 0xed8cfcc7, Offset: 0x42c0
// Size: 0xc8
function function_6580bf9ba6e8ce2a( attacker, victim, objweapon, inflictor, smeansofdeath, damage )
{
    bundle = killstreak::function_85b2d8e857ab4898( "remote_robot" );
    
    if ( level.var_deb9d2b3de25799b && utility::issharedfuncdefined( #"killstreak", #"getmodifieddamageusingdamagetuning" ) )
    {
        damage = self [[ utility::getsharedfunc( #"killstreak", #"getmodifieddamageusingdamagetuning" ) ]]( attacker, objweapon, smeansofdeath, damage, self.maxhealth, bundle.var_20cb8f4e47f3353e, { #iskillstreak:1, #inflictor:inflictor } );
    }
    
    return damage;
}

// Namespace remote_robot
// Params 1
// Checksum 0x8c1c5547, Offset: 0x4391
// Size: 0x13
function function_e05e7d5aa089092e( var_37552aa2304f9f51 )
{
    function_dd789d49042395f();
}

// Namespace remote_robot
// Params 0
// Checksum 0x97baf986, Offset: 0x43ac
// Size: 0xdc
function function_dd789d49042395f()
{
    bundle = level.streakglobals.streakbundles[ "remote_robot" ];
    healthpercent = self.health / self.maxhealth;
    
    if ( healthpercent <= ( bundle.var_28bf756d926348df ?? 0.25 ) )
    {
        utility::function_32b24db3127bff40( "body_damage", "heavy" );
        return;
    }
    
    if ( healthpercent <= ( bundle.var_f8214c78be43288f ?? 0.5 ) )
    {
        utility::function_32b24db3127bff40( "body_damage", "medium" );
        return;
    }
    
    if ( healthpercent <= ( bundle.var_f2e309c373b6a0b2 ?? 0.75 ) )
    {
        utility::function_32b24db3127bff40( "body_damage", "light" );
        return;
    }
    
    utility::function_32b24db3127bff40( "body_damage", "off" );
}

// Namespace remote_robot
// Params 1
// Checksum 0x85a9eb14, Offset: 0x4490
// Size: 0xf0
function function_cd32264cb376a88a( params )
{
    attacker = params.attacker ?? params.eattacker;
    inflictor = params.inflictor ?? params.einflictor;
    
    if ( !isplayer( attacker ) )
    {
        return;
    }
    
    if ( player_utility::function_51a0c300008ab56b( self, attacker ) )
    {
        return;
    }
    
    if ( attacker.isjuggernaut == 0 || !isdefined( attacker.juggcontext ) )
    {
        return;
    }
    
    if ( attacker != inflictor )
    {
        return;
    }
    
    if ( attacker.var_bcf0a081c3d4a305 )
    {
        return;
    }
    
    attacker.juggcontext.streakinfo.kills++;
    attacker setclientomnvar( "ui_remote_robot_enemies_killed", attacker.juggcontext.streakinfo.kills );
}

// Namespace remote_robot
// Params 2, eflags: 0xc
// Checksum 0x58448a23, Offset: 0x4588
// Size: 0xeb
function private function_6fe699c5d9519c2e( duration, magnitude )
{
    self notify( "86e11f6dd024f269" );
    self endon( "86e11f6dd024f269" );
    self endon( "disconnect" );
    perk::removeperk( "specialty_remote_robot" );
    self allowsprint( 0 );
    self.var_5324448e4fea72e3 = 0;
    
    for ( i = 0; i < 5 ; i++ )
    {
        self.var_5324448e4fea72e3 -= magnitude;
        weapons::updatemovespeedscale();
        wait 0.2;
    }
    
    utility::waittill_any_timeout( duration, "remote_robot_ended", "death" );
    perk::giveperk( "specialty_remote_robot" );
    self allowsprint( 1 );
    
    for ( i = 0; i < 5 ; i++ )
    {
        self.var_5324448e4fea72e3 += magnitude;
        weapons::updatemovespeedscale();
        wait 0.2;
    }
    
    self.var_5324448e4fea72e3 = undefined;
}

// Namespace remote_robot
// Params 2, eflags: 0x4
// Checksum 0x9f4cde7, Offset: 0x467b
// Size: 0x239
function private function_136d64393bcef0e( duration, attacker )
{
    var_4def85334452c060 = attacker.var_4def85334452c060;
    bundle = var_4def85334452c060.bundle;
    var_65cfd078ed606a6c = var_4def85334452c060.weaponref;
    data = damage_utility::packdamagedata( attacker, self, 1, var_65cfd078ed606a6c );
    data.doscoreevent = 0;
    emp_debuff::apply_emp_struct( data, 0, 1 );
    gamescore::trackdebuffassist( attacker, self, var_65cfd078ed606a6c.basename );
    emp_debuff::play_emp_scramble( bundle.var_46cc13ca23ff97dd );
    
    if ( bundle.var_632bd4c2417cee0b )
    {
        self playloopsound( bundle.var_632bd4c2417cee0b );
    }
    
    if ( self.var_f997d7e36fbef3af )
    {
        foreach ( callback in self.var_f997d7e36fbef3af )
        {
            self [[ callback ]]();
        }
    }
    
    function_b262ef3b6aea5f88( duration );
    
    if ( self )
    {
        emp_debuff::remove_emp();
        
        if ( bundle.var_2ad1f7a54064db67 )
        {
            emp_debuff::stop_emp_scramble( bundle.var_46cc13ca23ff97dd );
            
            if ( bundle.var_632bd4c2417cee0b )
            {
                self stoploopsound( bundle.var_632bd4c2417cee0b, 1 );
            }
        }
        
        if ( player::isreallyalive( attacker ) )
        {
            gamescore::untrackdebuffassist( attacker, self, var_65cfd078ed606a6c.basename );
        }
        
        if ( self.var_14a1cc3e3b76a02c )
        {
            foreach ( callback in self.var_14a1cc3e3b76a02c )
            {
                self [[ callback ]]();
            }
        }
    }
}

// Namespace remote_robot
// Params 1, eflags: 0x4
// Checksum 0xc1b498e, Offset: 0x48bc
// Size: 0x1f
function private function_b262ef3b6aea5f88( duration )
{
    self endon( "death_or_disconnect" );
    level endon( "game_ended" );
    wait duration;
}

// Namespace remote_robot
// Params 2, eflags: 0x4
// Checksum 0xd3d7d516, Offset: 0x48e3
// Size: 0xa2
function private hack( hackeffect, attacker )
{
    if ( !hackeffect.var_135f82267fbeaa5b || !hackeffect.speedscale )
    {
        return;
    }
    
    thread killstreak_utility::playkillstreaktacomdialog( self.juggcontext.streakinfo, undefined, #"hash_bee0342dceb8fa9c" );
    self setscriptablepartstate( "hack", "hack_shocked" );
    thread function_6fe699c5d9519c2e( hackeffect.var_135f82267fbeaa5b / 1000, hackeffect.speedscale );
    thread function_136d64393bcef0e( hackeffect.var_135f82267fbeaa5b / 1000, attacker );
}

// Namespace remote_robot
// Params 1, eflags: 0x4
// Checksum 0xa77fa0fa, Offset: 0x498d
// Size: 0xa3
function private empapplied( data )
{
    bundle = level.streakglobals.streakbundles[ "remote_robot" ];
    
    if ( !bundle.var_534963a55132e00b || !bundle.var_f087abc7062c2533 )
    {
        return;
    }
    
    self setscriptablepartstate( "emp", "on" );
    function_6fe699c5d9519c2e( bundle.var_534963a55132e00b, bundle.var_f087abc7062c2533 );
    
    if ( isalive( self ) && self.isjuggernaut )
    {
        self setscriptablepartstate( "emp", "off" );
    }
}

// Namespace remote_robot
// Params 0, eflags: 0x4
// Checksum 0xa00eebd2, Offset: 0x4a38
// Size: 0x14
function private lockedoncallback()
{
    vehicle_omnvar::show_warning( "missileLocking", self, "killstreak" );
}

// Namespace remote_robot
// Params 0, eflags: 0x4
// Checksum 0x7874eccf, Offset: 0x4a54
// Size: 0x14
function private lockedonremovedcallback()
{
    vehicle_omnvar::hide_warning( "missileLocking", self, "killstreak" );
}

// Namespace remote_robot
// Params 0, eflags: 0x4
// Checksum 0x2a6cac84, Offset: 0x4a70
// Size: 0x14
function private incomingcallback()
{
    vehicle_omnvar::show_warning( "missileIncoming", self, "killstreak" );
}

// Namespace remote_robot
// Params 0, eflags: 0x4
// Checksum 0x7c37c36a, Offset: 0x4a8c
// Size: 0x14
function private incomingremovedcallback()
{
    vehicle_omnvar::hide_warning( "missileIncoming", self, "killstreak" );
}

// Namespace remote_robot
// Params 1, eflags: 0x4
// Checksum 0xfa46b5f5, Offset: 0x4aa8
// Size: 0xc2
function private function_a1e03f6f9f4a3f0d( overrideholdtime )
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self endon( "remote_robot_ended" );
    holdtime = 0.75;
    
    if ( isdefined( overrideholdtime ) )
    {
        holdtime = overrideholdtime;
    }
    
    updaterate = level.framedurationseconds;
    timerdirty = 1;
    
    while ( true )
    {
        timeused = 0;
        
        if ( timerdirty == 1 )
        {
            self setclientomnvar( "ui_exit_progress", 0 );
            timerdirty = 0;
        }
        
        while ( self usebuttonpressed() )
        {
            timeused += updaterate;
            timerdirty = 1;
            self setclientomnvar( "ui_exit_progress", timeused / holdtime );
            
            if ( timeused > holdtime )
            {
                self notify( "remote_robot_manual_exit" );
                return;
            }
            
            wait updaterate;
        }
        
        wait updaterate;
    }
}

