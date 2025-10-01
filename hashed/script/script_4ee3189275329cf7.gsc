#using script_16ea1b94f0f381b3;
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
#using scripts\mp\perks\perkfunctions;
#using scripts\mp\teams;
#using scripts\mp\utility\killstreak;
#using scripts\mp\utility\perk;
#using scripts\mp\utility\player;
#using scripts\mp\utility\points;
#using scripts\mp\weapons;

#namespace remote_robot;

// Namespace remote_robot
// Params 0, eflags: 0x5
// Checksum 0x1ef0c5f5, Offset: 0x7c6
// Size: 0x225
function private autoexec main()
{
    killstreaks::registerkillstreak( "remote_robot", &function_f71b4ae9d3d63954 );
    utility::registersharedfunc( #"juggernaut", #"initconfig", &juggernaut_mp::jugg_initconfig );
    utility::registersharedfunc( #"juggernaut", #"leveldata", &juggernaut_mp::jugg_leveldata );
    utility::registersharedfunc( #"juggernaut", #"dropcratefromscriptedheli", &juggernaut_mp::jugg_dropcratefromscriptedheli );
    utility::registersharedfunc( #"juggernaut", #"hash_85c2b54b16e302f3", &juggernaut_mp::jugg_makejuggernautcallback );
    utility::registersharedfunc( #"juggernaut", #"getMinigunWeapon", &function_226074f15c61b467 );
    utility::registersharedfunc( #"juggernaut", #"hash_31d0dfcec67f3414", &function_e37fa457234c87b );
    utility::registersharedfunc( #"juggernaut", #"hash_1b4bc8d3d3a59f75", &function_55d9471cef296b34 );
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
    level callback::add( #"player_death", &onplayerdeath );
}

// Namespace remote_robot
// Params 0
// Checksum 0x83d6ab53, Offset: 0x9f3
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
// Checksum 0xe517c431, Offset: 0xa78
// Size: 0x56
function function_41bffb9d49d9e59b( params )
{
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_remote_robot", undefined, undefined, [ "specialty_sixth_sense", "specialty_operative", "specialty_engineer", "specialty_special_target_info" ] );
    }
}

// Namespace remote_robot
// Params 1
// Checksum 0x63b56519, Offset: 0xad6
// Size: 0x219
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
    
    streakinfo.dropposition = function_72266bf8fa2efb5a();
    
    if ( !isdefined( streakinfo.dropposition ) )
    {
        if ( utility::issharedfuncdefined( #"hud", #"showerrormessage" ) )
        {
            self [[ utility::getsharedfunc( #"hud", #"showerrormessage" ) ]]( %"hash_2e0b77a71f30bcc" );
        }
        
        return 0;
    }
    
    thread killstreak_utility::function_a0f06b65f4e1e23a( streakinfo, undefined, #"arrive", 1 );
    deployweaponobj = makeweapon( "sat_ks_remote_device_mp" );
    streakinfo.var_47d906c0c5d19d0a = self getcurrentweapon();
    streakinfo.var_ec96691f3a2c45c0 = 0;
    deployresult = killstreakdeploy::streakdeploy_doweapontabletdeploy( streakinfo, undefined, undefined, undefined, undefined, "sat_ks_remote_device_mp", 0 );
    val::reset_all( "usingRemote" );
    
    if ( deployresult )
    {
        thread function_e37fa457234c87b( streakinfo );
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
    }
    else
    {
        self.usingremote = undefined;
        self notify( "stopped_using_remote" );
    }
    
    if ( utility::issharedfuncdefined( #"killstreak", #"addtoactivekillstreaklist" ) )
    {
        self [[ utility::getsharedfunc( #"killstreak", #"addtoactivekillstreaklist" ) ]]( "remote_robot", "Killstreak_Ground", self, 0, 1 );
    }
    
    return deployresult;
}

// Namespace remote_robot
// Params 0
// Checksum 0x21cfcd2d, Offset: 0xcf8
// Size: 0x3a8
function function_72266bf8fa2efb5a()
{
    var_1263a899db8d137f = 0;
    collisioncontents = trace::create_contents( 0, 1, 1, 1, 1, 0 );
    ignorelist = [];
    startpos = self.origin;
    startangles = self.angles;
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
        spawnpoint = getclosestpointonnavmesh( self.origin );
        movingplatforminfo = airdrop::function_6d2c704914d1e4b5( spawnpoint );
        
        if ( !isdefined( movingplatforminfo ) )
        {
            spawnpoint += ( 0, 0, 40 );
            endpoint = spawnpoint + ( 0, 0, 3000 );
            var_e30d1be41eb830f = physics_spherecast( spawnpoint, endpoint, 2.35294, collisioncontents, ignorelist, "physicsquery_all" );
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
        
        foreach ( spawnangle in spawnangles )
        {
            spawnpoint = getclosestpointonnavmesh( self.origin + spawnangle * ( var_1263a899db8d137f + 1 ) * 50 );
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
// Checksum 0xe95cace6, Offset: 0x10a8
// Size: 0x164
function function_3de2cd2ce6de68dd( var_e30d1be41eb830f, spawnpoint, var_a442c567bbc4858a, var_f916c6ea28dbc972 )
{
    var_1c896b70ed19ff18 = spawnstruct();
    var_1c896b70ed19ff18.var_d3f8a6ece5402f8f = 0;
    var_961d9647ba83f69f = 1;
    
    if ( var_e30d1be41eb830f.size > 0 )
    {
        foreach ( hitresult in var_e30d1be41eb830f )
        {
            surfacetype = physics_getsurfacetypefromflags( hitresult[ "surfaceflags" ] );
            
            if ( surfacetype[ "name" ] != "surftype_glass_pane" )
            {
                var_961d9647ba83f69f = 0;
                break;
            }
        }
    }
    
    if ( var_961d9647ba83f69f )
    {
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
    }
    
    return var_1c896b70ed19ff18;
}

// Namespace remote_robot
// Params 1
// Checksum 0x816fa979, Offset: 0x1215
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
// Checksum 0x62566f95, Offset: 0x12e5
// Size: 0x67
function function_226074f15c61b467()
{
    assert( killstreak::isjuggernaut(), "<dev string:x30>" );
    juggconfig = self.juggcontext.juggconfig ?? level.juggconfig;
    minigunweaponobj = weapon_utility::function_d2c8356dc369d9ce( juggconfig.classstruct.loadoutprimary );
    return minigunweaponobj;
}

// Namespace remote_robot
// Params 1
// Checksum 0xc7b7bc9, Offset: 0x1355
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
// Checksum 0xbe60d714, Offset: 0x1388
// Size: 0x9d2
function function_e37fa457234c87b( streakinfo )
{
    self endon( "remote_robot_ended" );
    level endon( "game_ended" );
    thread function_d3dd5cf54318cdbb( streakinfo );
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
    streakinfo.streakduration = modifiedlifetime;
    juggcontext = { #var_1717a034842e3ec3:int( modifiedlifetime * 1000 + gettime() ), #streakinfo:streakinfo, #var_80684ddb68796647:!( bundle.var_2efbf315050c1117 ?? 0 ), #var_d12b1fde7880be25:self.var_d1b3f29a9c852576, #var_cd97b289c3fd6df7:self.var_aab5beb67c1704ec ?? 0, #var_fb68c148d6ef3479:bundle.var_76a486bf714fc163 ?? 1, #var_8fae1508552d427a:bundle.var_a8dacb956eececb0 ?? 1, #prevexecution:self.operatorcustomization.execution, #var_47d906c0c5d19d0a:streakinfo.var_47d906c0c5d19d0a, #prevsuit:self.operatorcustomization.suit, #var_716d2096928c8cab:self.operatorcustomization.skinref, #var_af5c2804fe001d0e:self.angles, #var_427ed18aa1c070c:self.origin, #maskomnvar:"ui_gas_mask_juggernaut", #prevstance:self getstance(), #var_975438351ed2702c:self.operatorcustomization.geartype, #prevclothtype:self.clothtype, #prevhead:customization[ 1 ], #prevbody:customization[ 0 ], #prevclass:self.class, #prevhealth:self.health, #prevmaxhealth:self.maxhealth };
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
    
    if ( self getweaponslistprimaries().size > 1 )
    {
        juggcontext.var_1dada9372a229a6b = [];
        weaplist = self getweaponslistprimaries();
        meleeoverrideweapon = self getweaponmeleeslot();
        
        foreach ( weap in weaplist )
        {
            ismeleeoverrideweapon = !isnullweapon( meleeoverrideweapon ) && weap == meleeoverrideweapon;
            
            if ( !weap.isalternate )
            {
                var_e6eaf06d3a46fe9a = { #ismeleeoverrideweapon:ismeleeoverrideweapon, #stockammo:self getweaponammostock( weap ), #clipammo:self getweaponammoclip( weap ), #weaponobj:weap };
                juggcontext.var_1dada9372a229a6b[ juggcontext.var_1dada9372a229a6b.size ] = var_e6eaf06d3a46fe9a;
            }
            
            inventory_utility::_takeweapon( weap );
        }
    }
    
    self skydive_setbasejumpingstatus( 0 );
    streakinfo notify( "killstreak_finished_with_deploy_weapon" );
    waitframe();
    self.isjuggernaut = 1;
    self.var_56e1683c857afcf5 = undefined;
    self.var_e4dae87a649544c3 = 1;
    self.var_dc35d76e762774ed = 1;
    self.var_8799d8d2a29f8279 = bundle.var_6f1178426a21e8da ?? 1;
    self.var_e74f076f63e44ec0 = 16;
    self.var_aab5beb67c1704ec = 1;
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
        namespace_ac1cfbde1756873::function_e4d6a71507372662( self.minimapid, 0 );
    }
    
    if ( bundle.var_4731da2e1fa2575e )
    {
        level utility::callsharedfunc( #"gametype", #"hash_c0713b1d38d78d84", self );
        
        if ( self.carryobject )
        {
            self.carryobject thread gameobjects::setdropped();
        }
    }
    
    var_32dbca3143d9c4a5 = level.sharedfuncs[ #"hud" ][ #"teamplayercardsplash" ];
    
    if ( isdefined( var_32dbca3143d9c4a5 ) )
    {
        self [[ var_32dbca3143d9c4a5 ]]( streakinfo.bundle.usedsplashref, self );
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
// Checksum 0x752ea3f3, Offset: 0x1d63
// Size: 0x461
function function_d475ccedac0aeb2b( streakinfo )
{
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
        scene_struct = utility::spawn_model( "tag_origin", neworigin, self.angles );
        scene_struct scene::set_scriptbundle( "sat_scorestreak_remote_robot" );
        scene_struct.var_3544485fbc851ac2 = "tag_player";
        self showlegs();
        self.falldamageprotection = 1;
        scene_struct thread scene::play( [ self ], "shot_010", "sat_scorestreak_remote_robot" );
        bundle = killstreak::function_85b2d8e857ab4898( "remote_robot" );
        var_d15dd0d9dfc58c83 = self.team == "axis" ? bundle.var_bfb2f1773c87e8b4 : bundle.var_5eb7d62127a14921;
        function_d5c0b70528396ad2( var_d15dd0d9dfc58c83, bundle.var_efd06a2191fea341 );
        self lerpfovbypreset( "remote_robot_intro" );
        fullscreenfxparams = { #visionsetname:undefined, #postfxbundlename:"cer_mp_rcxd_drive" };
        self [[ level.sharedfuncs[ #"fullscreenfx" ][ #"hash_d6d2b1e7868b8f30" ] ]]( fullscreenfxparams );
        val::set( "remote_robot", "fire", 0 );
        val::set( "remote_robot", "interacts_with_oob_triggers", 0 );
        player::_freezecontrols( 1 );
        scene_struct thread function_c1bc2b97f94e008b( self, groundpos );
        self waittill( "remote_robot_landed" );
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
        scene_struct scene::stop();
        scene_struct.origin = groundpos;
        self.falldamageprotection = 0;
        self [[ level.sharedfuncs[ #"fullscreenfx" ][ #"hash_fd9af8d6ec7cc6fb" ] ]]( spawnstruct() );
        self lerpfovbypreset( "default" );
        scene_struct scene::play( [ self ], "shot_020", "sat_scorestreak_remote_robot" );
        self stopanimscriptsceneevent();
    }
    else
    {
        bundle = killstreak::function_85b2d8e857ab4898( "remote_robot" );
        var_d15dd0d9dfc58c83 = self.team == "axis" ? bundle.var_bfb2f1773c87e8b4 : bundle.var_5eb7d62127a14921;
        function_d5c0b70528396ad2( var_d15dd0d9dfc58c83, bundle.var_efd06a2191fea341 );
    }
    
    val::reset( "remote_robot", "fire" );
    val::reset( "remote_robot", "interacts_with_oob_triggers" );
    self notify( "remote_robot_intro_ended" );
    perkfunctions::setthirdpersonmode();
    self function_5dd5184dca17e29b( 0 );
    waitframe();
    self function_5dd5184dca17e29b( 1 );
    player::_freezecontrols( 0 );
    thread function_a1e03f6f9f4a3f0d();
    self notify( "intro_landing_finished" );
    self setclientomnvar( "ui_using_killstreak_remote", 0 );
    killstreak_utility::function_d546aaa588f088c3( "remote_robot", "on" );
    killstreak_shared::function_9fc2f7ee10890d99( "remote_robot" );
    hideoverlaytargetmarkerfriendly = 0;
    var_598d79add3230927 = streakinfo.bundle.var_598d79add3230927;
    var_f057b69340b14a5c = streakinfo.bundle.var_f057b69340b14a5c;
    killstreak_shared::killstreak_assigntargetmarkers( hideoverlaytargetmarkerfriendly, var_598d79add3230927, var_f057b69340b14a5c );
}

// Namespace remote_robot
// Params 2, eflags: 0x4
// Checksum 0xe649f145, Offset: 0x21cc
// Size: 0x1ac
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
    var_7d5ea3619dafa6e0 = function_3d9a237ee4e536ff( player.origin, groundpos );
    var_d70157b702fe0dcb = !isdefined( var_7d5ea3619dafa6e0 );
    
    while ( posz > endz )
    {
        player val::set( "remote_robot", "show_ui_out_of_bounds", 0 );
        currenttime = gettime();
        frametime = ( currenttime - lasttime ) * 0.001;
        lasttime = currenttime;
        var_4e15ac7fc82c86fd += gravity * -1 * frametime;
        var_213ea50e4377cc5f = posz + var_4e15ac7fc82c86fd * frametime;
        
        if ( !var_d70157b702fe0dcb )
        {
            if ( posz >= var_7d5ea3619dafa6e0[ 2 ] && var_213ea50e4377cc5f <= var_7d5ea3619dafa6e0[ 2 ] || abs( posz - var_7d5ea3619dafa6e0[ 2 ] ) < 10 )
            {
                glassradiusdamage( var_7d5ea3619dafa6e0, 175, 1000, 1000 );
                var_d70157b702fe0dcb = 1;
            }
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
// Checksum 0x9ec760bf, Offset: 0x2380
// Size: 0x7e
function private function_3d9a237ee4e536ff( startpos, endpos )
{
    var_872b3dd7d8e6e720 = trace::create_contents( 0, 0, 1 );
    var_5b6bf1e6c3c63613 = physics_raycast( startpos, endpos, var_872b3dd7d8e6e720, undefined, 0, "physicsquery_closest" );
    
    if ( var_5b6bf1e6c3c63613.size > 0 )
    {
        surfacetype = physics_getsurfacetypefromflags( var_5b6bf1e6c3c63613[ 0 ][ "surfaceflags" ] );
        
        if ( surfacetype[ "name" ] == "surftype_glass_pane" )
        {
            return var_5b6bf1e6c3c63613[ 0 ][ "position" ];
        }
    }
    
    return undefined;
}

// Namespace remote_robot
// Params 1
// Checksum 0xae44daf3, Offset: 0x2407
// Size: 0x3e
function watchgameended( streakinfo )
{
    self endon( "death_or_disconnect", "remote_robot_ended" );
    level waittill( "game_ended" );
    wait 0.5;
    
    if ( self )
    {
        juggernaut::jugg_removejuggernaut( { #var_bfdba4862ac6a877:1 } );
    }
}

// Namespace remote_robot
// Params 1
// Checksum 0x1d8ded12, Offset: 0x244d
// Size: 0x33
function function_7014eab38cc786fb( streakinfo )
{
    self endon( "death_or_disconnect" );
    level endon( "game_ended" );
    self endon( "remote_robot_ended" );
    self waittill( "remote_robot_manual_exit" );
    juggernaut::jugg_removejuggernaut();
}

// Namespace remote_robot
// Params 2
// Checksum 0xd14550fa, Offset: 0x2488
// Size: 0x17d
function function_5bd122ed059fc1ab( streakinfo, var_3cef575f8a291961 )
{
    self endon( "death_or_disconnect" );
    level endon( "game_ended" );
    self endon( "remote_robot_ended" );
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
    
    self waittill( "intro_landing_finished" );
    timeouttime = gettime() + streakinfo.lifetime * 1000;
    
    if ( streakinfo.bundle.var_641d6a75f1c561cf )
    {
        thread function_4552995e996638f( streakinfo.bundle, streakinfo.lifetime );
    }
    
    while ( true )
    {
        remainingtime = timeouttime - gettime();
        self setclientomnvar( "ui_remote_robot_lifetime_timer", remainingtime );
        self setclientomnvar( "ui_remote_robot_lifetime_progress", remainingtime / streakinfo.lifetime * 1000 );
        
        if ( remainingtime <= 0 )
        {
            break;
        }
        
        waitframe();
    }
    
    juggernaut::jugg_removejuggernaut();
}

// Namespace remote_robot
// Params 1, eflags: 0x4
// Checksum 0x754d04c9, Offset: 0x260d
// Size: 0x39
function private function_c5886af82b5f3df( data )
{
    data.attacker thread points::function_4f713a46699e559d( #"hash_105e8d0403353d48", data.objweapon );
    juggernaut::jugg_removejuggernaut();
}

// Namespace remote_robot
// Params 0
// Checksum 0x22504f58, Offset: 0x264e
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
// Checksum 0xebf81801, Offset: 0x271d
// Size: 0x11e
function playdeathfx( var_bfdba4862ac6a877 )
{
    bundle = killstreak::function_85b2d8e857ab4898( "remote_robot" );
    
    if ( var_bfdba4862ac6a877 )
    {
        self setscriptablepartstate( "death_fx", "instant_death" );
        waitframe();
    }
    else
    {
        player::_freezecontrols( 1 );
        self setscriptablepartstate( "death_fx", "on" );
        scene_struct = utility::spawn_model( "tag_origin", self.origin, self.angles );
        scene_struct scene::set_scriptbundle( "sat_scorestreak_remote_robot_death" );
        scene_struct thread scene::play( [ self ], "shot_010", "sat_scorestreak_remote_robot_death" );
        emp_debuff::play_emp_scramble( bundle.var_33622da4f3c62a36 ?? 3 );
        self.takedamage = 0;
        wait bundle.var_3b7f8da5aa3ba402 ?? 0;
        scene_struct thread scene::stop();
        self.takedamage = 1;
        emp_debuff::stop_emp_scramble( bundle.var_33622da4f3c62a36 ?? 3 );
        player::_freezecontrols( 0 );
        self setscriptablepartstate( "death_fx", "off" );
    }
    
    function_e76a54331a052d4d();
}

// Namespace remote_robot
// Params 1
// Checksum 0x7c1153b0, Offset: 0x2843
// Size: 0x60c
function function_55d9471cef296b34( damagedata )
{
    player = self;
    
    if ( !isdefined( player ) )
    {
        return;
    }
    
    if ( damagedata )
    {
        player thread killstreak_utility::function_a0f06b65f4e1e23a( player.juggcontext.streakinfo, undefined, #"destroyed" );
    }
    
    player playdeathfx( damagedata.var_bfdba4862ac6a877 );
    player function_66dc8b6ae969f66d( 0 );
    self disableplayermarks( #"killstreak" );
    
    if ( utility::issharedfuncdefined( #"killstreak", #"removefromactivekillstreaklist" ) )
    {
        self [[ utility::getsharedfunc( #"killstreak", #"removefromactivekillstreaklist" ) ]]( self getentitynumber() );
    }
    
    weapons::function_d5eafafe8f6a97bf( player );
    perk::removeperk( "specialty_remote_robot" );
    player callback::remove( #"player_damaged", &function_e05e7d5aa089092e );
    player.var_1d63f3432078fb2c = undefined;
    weapon_utility::setlockedoncallback( player, undefined );
    weapon_utility::setlockedonremovedcallback( player, undefined );
    weapon_utility::setincomingcallback( player, undefined );
    weapon_utility::setincomingremovedcallback( player, undefined );
    
    if ( damagedata.attacker && damagedata.attacker != player )
    {
        damagedata.attacker points::function_4f713a46699e559d( #"hash_105e8d0403353d48", damagedata.objweapon );
    }
    
    var_9ee096ed5e2572d1 = 0;
    function_a5ac1081fc661eed( var_9ee096ed5e2572d1 );
    function_6c1121cff1dae85( var_9ee096ed5e2572d1 );
    player.damage.var_fbe723a36365e86c = 0;
    
    if ( isdefined( player.juggcontext ) )
    {
        player function_d5c0b70528396ad2( player.juggcontext.var_716d2096928c8cab, player.juggcontext.prevsuit );
        player execution::_giveexecution( player.juggcontext.prevexecution );
    }
    
    if ( isalive( player ) && isdefined( player.juggcontext ) )
    {
        player inventory_utility::_takeweapon( player.juggcontext.var_71232d09502b83c );
        
        foreach ( weaponstruct in player.juggcontext.var_1dada9372a229a6b )
        {
            if ( weapon::isbackuppistol( weaponstruct.weaponobj ) )
            {
                self giveweapon( weaponstruct.weaponobj, 0, 0, 0, 1, 1 );
            }
            else
            {
                player inventory_utility::_giveweapon( weaponstruct.weaponobj );
            }
            
            player setweaponammoclip( weaponstruct.weaponobj, weaponstruct.clipammo );
            player setweaponammostock( weaponstruct.weaponobj, weaponstruct.stockammo );
            
            if ( weaponstruct.ismeleeoverrideweapon )
            {
                player assignweaponmeleeslot( weaponstruct.weaponobj );
            }
        }
        
        player switchtoweapon( player.juggcontext.var_47d906c0c5d19d0a );
        player setorigin( player.juggcontext.var_427ed18aa1c070c );
        player setplayerangles( player.juggcontext.var_af5c2804fe001d0e );
        player.maxhealth = player.juggcontext.prevmaxhealth;
        player.health = player.maxhealth;
    }
    
    player killstreak_shared::function_b3302c4317df36c6();
    player namespace_4fa2d3fe973ec15f::clearminimapid();
    player killstreak_utility::function_d546aaa588f088c3( "remote_robot", "off" );
    player killstreak_shared::function_76bbbe12ce816ed2();
    player function_92305205d36aa2e1( 1 );
    player.isjuggernaut = 0;
    player.var_e4dae87a649544c3 = 0;
    player.var_dc35d76e762774ed = 0;
    player.juggcontext.var_8fae1508552d427a = 0;
    player.juggcontext.var_fb68c148d6ef3479 = 0;
    player.var_aab5beb67c1704ec = player.juggcontext.var_cd97b289c3fd6df7;
    player.var_d1b3f29a9c852576 = player.juggcontext.var_d12b1fde7880be25;
    
    if ( isdefined( player.juggcontext.prevstance ) )
    {
        player setstance( player.juggcontext.prevstance, undefined, 1, 1 );
    }
    
    player.usingremote = undefined;
    player perkfunctions::function_1a8b6c7b9a39972();
    player namespace_9d8e359c3b1041e5::function_7c5eb0e985e1d8c4( player );
    
    if ( level.var_36218e71baa7e689 )
    {
        player.var_c5ccf9dff3b5e393 = undefined;
    }
    
    player notify( "stopped_using_remote" );
    
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
    self skydive_setbasejumpingstatus( 1 );
    player killstreak_utility::recordkillstreakendstats( player.juggcontext.streakinfo );
    player notify( "remote_robot_ended" );
}

// Namespace remote_robot
// Params 2, eflags: 0x4
// Checksum 0x9ab6c773, Offset: 0x2e57
// Size: 0x297
function private function_d5c0b70528396ad2( skin, suitoverride )
{
    self.operatorcustomization.skinref = skin;
    body = operator::function_4e6b11f7340acc24( skin );
    head = operator::function_115f78fb5f506daa( skin );
    operator = operator::function_30f20ce375c4ee40( skin );
    suit = suitoverride ?? utility::function_f825237e0eda5adf();
    self.operatorcustomization.suit = suit;
    gender = operator::getoperatorgender( operator );
    clothtype = operator::function_b1788ccf1b3c0ae9( skin );
    geartype = operator::function_d633420b529828e8( skin );
    self setcustomization( body, head );
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
// Checksum 0x39197f7e, Offset: 0x30f6
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
// Checksum 0x833df027, Offset: 0x319c
// Size: 0x112
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
    }
    else
    {
        val::reset( "remote_robot", "ladder" );
        val::reset( "remote_robot", "crate_use" );
        val::reset( "remote_robot", "swimming" );
        val::reset( "remote_robot", "weapon_pickup" );
        val::reset( "remote_robot", "offhand_throwback" );
        self enableexecutionvictim();
    }
    
    self.swim.var_401e9f3c6e4789da = var_9ee096ed5e2572d1;
}

// Namespace remote_robot
// Params 1
// Checksum 0x82ae1e58, Offset: 0x32b6
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
// Checksum 0x3ee03eba, Offset: 0x332e
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
// Checksum 0xf0cb2f93, Offset: 0x33c3
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
// Checksum 0x103d09a1, Offset: 0x348a
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
// Checksum 0x3088a195, Offset: 0x34fd
// Size: 0x2d
function function_952126ec59cb6a30( duration )
{
    utility::waittill_any_timeout( duration, "death", "remote_robot_ended" );
    self function_c67c92094ae6ccf7();
    self notify( "radar_ping_end" );
}

// Namespace remote_robot
// Params 1
// Checksum 0x629cb5e0, Offset: 0x3532
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
// Checksum 0xa752fc7c, Offset: 0x3629
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
// Checksum 0xd6fcc447, Offset: 0x365a
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
// Checksum 0x5f1ba3c3, Offset: 0x372b
// Size: 0x13
function function_e05e7d5aa089092e( var_37552aa2304f9f51 )
{
    function_dd789d49042395f();
}

// Namespace remote_robot
// Params 0
// Checksum 0x4951dbe0, Offset: 0x3746
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
// Checksum 0x7329f90, Offset: 0x382a
// Size: 0xc0
function onplayerdeath( params )
{
    if ( player_utility::function_51a0c300008ab56b( self, params.attacker ) )
    {
        return;
    }
    
    if ( params.attacker.isjuggernaut == 0 || !isdefined( params.attacker.juggcontext ) )
    {
        return;
    }
    
    params.attacker.juggcontext.streakinfo.kills++;
    params.attacker setclientomnvar( "ui_remote_robot_enemies_killed", params.attacker.juggcontext.streakinfo.kills );
}

// Namespace remote_robot
// Params 2, eflags: 0xc
// Checksum 0x33995c62, Offset: 0x38f2
// Size: 0xeb
function private function_6fe699c5d9519c2e( duration, magnitude )
{
    self notify( "192ef2180c456dd8" );
    self endon( "192ef2180c456dd8" );
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
// Checksum 0x9cd83d1a, Offset: 0x39e5
// Size: 0x239
function private function_136d64393bcef0e( duration, attacker )
{
    var_4def85334452c060 = attacker.var_4def85334452c060;
    bundle = var_4def85334452c060.bundle;
    var_65cfd078ed606a6c = var_4def85334452c060.weaponref;
    data = damage_utility::packdamagedata( attacker, self, 1, var_65cfd078ed606a6c );
    data.var_4f713a46699e559d = 0;
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
// Checksum 0xde4f8ab0, Offset: 0x3c26
// Size: 0x1f
function private function_b262ef3b6aea5f88( duration )
{
    self endon( "death_or_disconnect" );
    level endon( "game_ended" );
    wait duration;
}

// Namespace remote_robot
// Params 2, eflags: 0x4
// Checksum 0x9700eec9, Offset: 0x3c4d
// Size: 0xa1
function private hack( hackeffect, attacker )
{
    if ( !hackeffect.var_135f82267fbeaa5b || !hackeffect.speedscale )
    {
        return;
    }
    
    self.owner thread killstreak_utility::function_a0f06b65f4e1e23a( self.streakinfo, undefined, #"hash_bee0342dceb8fa9c" );
    self setscriptablepartstate( "hack", "hack_shocked" );
    thread function_6fe699c5d9519c2e( hackeffect.var_135f82267fbeaa5b / 1000, hackeffect.speedscale );
    thread function_136d64393bcef0e( hackeffect.var_135f82267fbeaa5b / 1000, attacker );
}

// Namespace remote_robot
// Params 1, eflags: 0x4
// Checksum 0xf255756e, Offset: 0x3cf6
// Size: 0xa9
function private empapplied( data )
{
    bundle = level.streakglobals.streakbundles[ "remote_robot" ];
    
    if ( !bundle.var_534963a55132e00b || !bundle.var_f087abc7062c2533 )
    {
        return;
    }
    
    self setscriptablepartstate( "emp", "on" );
    function_6fe699c5d9519c2e( bundle.var_534963a55132e00b, bundle.var_f087abc7062c2533 );
    
    if ( isdefined( self ) && isalive( self ) && self.isjuggernaut )
    {
        self setscriptablepartstate( "emp", "off" );
    }
}

// Namespace remote_robot
// Params 0, eflags: 0x4
// Checksum 0x6863e008, Offset: 0x3da7
// Size: 0x14
function private lockedoncallback()
{
    vehicle_omnvar::show_warning( "missileLocking", self, "killstreak" );
}

// Namespace remote_robot
// Params 0, eflags: 0x4
// Checksum 0x76cbe3f8, Offset: 0x3dc3
// Size: 0x14
function private lockedonremovedcallback()
{
    vehicle_omnvar::hide_warning( "missileLocking", self, "killstreak" );
}

// Namespace remote_robot
// Params 0, eflags: 0x4
// Checksum 0xaadc68f2, Offset: 0x3ddf
// Size: 0x14
function private incomingcallback()
{
    vehicle_omnvar::show_warning( "missileIncoming", self, "killstreak" );
}

// Namespace remote_robot
// Params 0, eflags: 0x4
// Checksum 0x3a550047, Offset: 0x3dfb
// Size: 0x14
function private incomingremovedcallback()
{
    vehicle_omnvar::hide_warning( "missileIncoming", self, "killstreak" );
}

// Namespace remote_robot
// Params 1, eflags: 0x4
// Checksum 0x599b4977, Offset: 0x3e17
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

