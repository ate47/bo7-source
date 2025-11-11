#using script_5262c59c62fa4892;
#using script_53651341190c5aab;
#using scripts\asm\asm;
#using scripts\common\cap;
#using scripts\common\values;
#using scripts\engine\utility;

#namespace ai_revival;

// Namespace ai_revival
// Params 1
// Checksum 0x8a3b144f, Offset: 0x367
// Size: 0x122
function getfunction( funcid )
{
    switch ( funcid )
    {
        case #"hash_dab0d83df51da4d":
            return &onuserinit;
        case #"hash_722d767fd6d40f56":
            return &onuserterminate;
        case #"hash_902f9e79d5e57c83":
            return &oneventreceived;
        case #"hash_ae182ac0084f18fa":
            return &movingtodyingguy;
        case #"hash_cfc067e44f70f86b":
            return &reviving;
        case #"hash_e7ffa3549475787":
            return &dyingguybeingrevived;
        case #"hash_f5cf55913a442596":
            return &earlyrevivedsuccess;
        case #"hash_303d74db152a39b9":
            return &interaction_common::function_ac09dd92b7250c46;
        case #"hash_707105c84039143f":
            return &tookdamageduringrevive;
        case #"hash_be6abeab18f64c91":
            return &moveintoposition;
        case #"hash_25397093dba07e3a":
            return &remoterevive;
        case #"hash_2a5b537d23266f19":
            return &providecoverfire;
        case #"hash_669a3d0df855846d":
            return &beingremoterevived;
        case #"hash_18372b0f69e4b08c":
            return &waitforreviver;
    }
    
    assertmsg( "<dev string:x24>" + funcid );
}

// Namespace ai_revival
// Params 1
// Checksum 0xfca99481, Offset: 0x491
// Size: 0x58
function onuserinit( interactionid )
{
    self.revival = spawnstruct();
    self.revival.initialhealth = self.health;
    
    if ( self.doinglongdeath )
    {
        self.revival.var_e0abaa4348755a5c = 1;
    }
}

// Namespace ai_revival
// Params 1
// Checksum 0x15667445, Offset: 0x4f1
// Size: 0x219
function onuserterminate( interactionid )
{
    /#
        if ( isagent( self ) )
        {
            assert( self isscriptable(), "<dev string:x45>" + self.agent_type + "<dev string:x55>" );
        }
    #/
    
    scriptablepart = "revival_helper_stim";
    
    if ( self isscriptable() && self getscriptablehaspart( scriptablepart ) )
    {
        self setscriptablepartstate( scriptablepart, "default" );
    }
    
    self.pushable = 1;
    self.skipdyingbackcrawl = 0;
    var_f490ba353e0a8231 = isalive( self );
    var_e0abaa4348755a5c = self.revival.var_e0abaa4348755a5c;
    
    if ( self islinked() )
    {
        /#
            println( "<dev string:x71>" );
            println( "<dev string:x9b>" );
            
            if ( var_e0abaa4348755a5c )
            {
                println( "<dev string:xab>" );
            }
            else
            {
                println( "<dev string:xbe>" );
            }
            
            if ( var_f490ba353e0a8231 )
            {
                println( "<dev string:xcd>" );
            }
            else
            {
                println( "<dev string:xd8>" );
            }
            
            println( "<dev string:xe5>" );
        #/
        
        self motionwarpcancel();
        self unlink();
    }
    
    if ( !var_f490ba353e0a8231 )
    {
        function_dd518df9ee8d217c( interactionid, "death", 1 );
    }
    else
    {
        if ( var_e0abaa4348755a5c )
        {
            self.ignoreall = 0;
        }
        else
        {
            if ( self.stealth_bsmstate == 0 )
            {
                function_dd518df9ee8d217c( interactionid, "stealth_idle", 1 );
            }
            else if ( self.asmname == self.defaultasm )
            {
                function_dd518df9ee8d217c( interactionid, "death", 1 );
            }
            
            self.customarrivalstanceoverride = undefined;
            self.var_f683b9aaeb09d20e = 0;
            self.var_7362dcf4058bc522 = 0;
            self clearbtgoal( 3 );
            
            if ( self.var_c7d51f68e3d4a6e1 )
            {
                function_ea3f4aa8f5f16cdf();
                coveringfirecleanup();
            }
        }
        
        if ( self.doinglongdeath )
        {
            var_7887ce13fb8c4d0e = self.revive_bleedouttime ?? 5000;
            self.desiredtimeofdeath = gettime() + var_7887ce13fb8c4d0e;
        }
        
        utility::delaythreadendon( 5, "death", &val::reset_all, "revival" );
    }
    
    self notify( "end_revival" );
}

// Namespace ai_revival
// Params 3
// Checksum 0x956e175d, Offset: 0x712
// Size: 0x8e, Type: bool
function oneventreceived( receiver, info, origin )
{
    if ( info == "focused_on" && !utility::doinglongdeath() )
    {
        distsq = distancesquared( receiver.origin, origin );
        breakoutdist = 200;
        
        if ( distsq < breakoutdist * breakoutdist && !function_521b5a0a07a246a8( self getinteractionid(), "death" ) )
        {
            function_dd518df9ee8d217c( self getinteractionid(), "death", 1 );
            return true;
        }
    }
    
    return false;
}

// Namespace ai_revival
// Params 2
// Checksum 0xab90f9d8, Offset: 0x7a9
// Size: 0x40d
function movingtodyingguy( statename, params )
{
    self endon( "death" );
    self endon( "end_revival" );
    dyingguy = getdyingguy();
    
    if ( !isdefined( dyingguy ) )
    {
        earlyoutinteraction();
    }
    
    dyingguy endon( "death" );
    dyingguy endon( "end_revival" );
    goalrad = 10;
    dyingguypos = dyingguy.origin;
    self setbtgoalpos( 3, dyingguypos );
    self setbtgoalradius( 3, goalrad );
    self waittill( "path_set" );
    val::set( "revival", "attackeraccuracy", 0 );
    dyingguy val::set( "revival", "attackeraccuracy", 0 );
    dyingguy.desiredtimeofdeath += 20000;
    self.var_f683b9aaeb09d20e = 1;
    self.var_7362dcf4058bc522 = 1;
    var_238f3d0246d8726d = 200;
    
    for ( pathlength = self pathdisttogoal(); pathlength > var_238f3d0246d8726d ; pathlength = self pathdisttogoal() )
    {
        if ( !isdefined( dyingguy ) )
        {
            earlyoutinteraction();
        }
        
        dyingguypos = dyingguy.origin;
        self setbtgoalpos( 3, dyingguypos );
        wait 0.2;
    }
    
    if ( !isdefined( dyingguy ) )
    {
        earlyoutinteraction();
    }
    
    dyingguy animmode( "angle deltas" );
    dyingguy.skipdyingbackcrawl = 1;
    dyingguy asmfireevent( dyingguy.asmname, "dying_back_crawl_done" );
    dyingguypos = dyingguy.origin;
    dyingguy.pushable = 0;
    self.pushable = 0;
    introalias = function_dd687aabb00ca84e( dyingguy );
    rolestring = "reviving_guy";
    capinfo = getcapinfoforrole( self, rolestring );
    arcanimset = capinfo.animation;
    introstate = "reviving_intro";
    alias = archetypegetalias( arcanimset, introstate, introalias, 0 );
    animation = alias.anims;
    startorigin = getstartorigin( dyingguy.origin, dyingguy.angles, animation );
    startangles = getstartangles( dyingguy.origin, dyingguy.angles, animation );
    
    if ( !ispointonnavmesh( startorigin, self ) )
    {
        newalias = function_8e6601c7cd695bf1( introalias );
        alias = archetypegetalias( arcanimset, introstate, newalias, 0 );
        animation = alias.anims;
        startorigin = getstartorigin( dyingguy.origin, dyingguy.angles, animation );
        startangles = getstartangles( dyingguy.origin, dyingguy.angles, animation );
        
        if ( !ispointonnavmesh( startorigin, self ) )
        {
            dyingguy.var_38a06ee92c60ee9e = 0;
            function_dd518df9ee8d217c( self getinteractionid(), "death", 1 );
        }
    }
    
    self.revivetargetpos = startorigin;
    self setbtgoalpos( 3, self.revivetargetpos );
    self.revivetargetangles = startangles;
    self.customarrivalangles = self.revivetargetangles;
    self.customarrivalstanceoverride = "crouch";
    var_6dae028fbad50a3 = 2;
    utility::waittill_any_timeout( var_6dae028fbad50a3, "bt_goal" );
    
    while ( self.arriving )
    {
        waitframe();
    }
    
    if ( !isdefined( dyingguy ) )
    {
        earlyoutinteraction();
    }
    
    self.customarrivalstanceoverride = undefined;
    var_2552b57970937635 = 1024;
    var_9d37a8cc37caafc8 = distancesquared( self.origin, self.revivetargetpos );
    
    if ( var_9d37a8cc37caafc8 < var_2552b57970937635 )
    {
        cap::cap_start( "cap_ai_revival", "caps/interactions/cap_ai_revival" );
        self waittill( "reviving_intro_starts" );
    }
    else
    {
        function_dd518df9ee8d217c( self getinteractionid(), "death", 1 );
    }
    
    self.var_f683b9aaeb09d20e = 0;
    self clearbtgoal( 3 );
}

// Namespace ai_revival
// Params 2
// Checksum 0xc86ec8db, Offset: 0xbbe
// Size: 0x7e
function reviving( statename, params )
{
    self endon( "death" );
    self endon( "end_revival" );
    self endon( "cap_exit_completed" );
    childthread adjustpos();
    wait 0.3;
    downedguy = getdyingguy();
    self.var_f683b9aaeb09d20e = 0;
    
    if ( isdefined( downedguy ) )
    {
        self linktoblendtotag( downedguy, "tag_sync" );
    }
    
    self waittill( "cap_exit_completed" );
    self.var_3724cf9bb3ac6bf7 = gettime();
}

// Namespace ai_revival
// Params 2
// Checksum 0x13143c10, Offset: 0xc44
// Size: 0xe8
function dyingguybeingrevived( statename, params )
{
    self endon( "death" );
    self endon( "end_revival" );
    cap::cap_start( "cap_ai_revival", "caps/interactions/cap_ai_revival" );
    
    while ( !asm::asm_ephemeraleventfired( "being_revived", "end" ) )
    {
        frametime = level.frameduration;
        self.desiredtimeofdeath += level.frameduration;
        waitframe();
    }
    
    self.doinglongdeath = 0;
    
    if ( level.longdeath.var_1fd610248bd001c2 > 0 )
    {
        self.health = int( level.longdeath.var_1fd610248bd001c2 * self.maxhealth );
    }
    else
    {
        self.health = 150;
    }
    
    self waittill( "cap_exit_completed" );
    function_410675d68e6e1260();
}

// Namespace ai_revival
// Params 2
// Checksum 0x52f95f79, Offset: 0xd34
// Size: 0xaf
function earlyrevivedsuccess( statename, params )
{
    self endon( "death" );
    self endon( "end_revival" );
    asm::asm_fireevent( self.asmname, "early_revived_success" );
    
    if ( self.doinglongdeath )
    {
        self.doinglongdeath = 0;
        
        if ( level.longdeath.var_1fd610248bd001c2 > 0 )
        {
            self.health = int( level.longdeath.var_1fd610248bd001c2 * self.maxhealth );
        }
        else
        {
            self.health = 150;
        }
    }
    
    self waittill( "cap_exit_completed" );
    function_410675d68e6e1260();
}

// Namespace ai_revival
// Params 2
// Checksum 0x1f2c35a7, Offset: 0xdeb
// Size: 0x11c
function moveintoposition( statename, params )
{
    self endon( "death" );
    self endon( "end_revival" );
    self setcanusecover( 0 );
    self allowedstances( "stand" );
    self.revivetarget = getdyingguy();
    targetpos = self.revivetarget.origin;
    canseedyingguy = self cansee( self.revivetarget );
    
    if ( !canseedyingguy || distancesquared( self.origin, targetpos ) > self.var_170e6bf47c501c90 * self.var_170e6bf47c501c90 )
    {
        targeteyepos = self.revivetarget getapproxeyepos();
        goalpos = findclosestlospointwithinradius( targeteyepos, self.var_170e6bf47c501c90, targeteyepos, self.origin );
        self setbtgoalpos( 3, goalpos );
        self setbtgoalradius( 3, 32 );
        self waittill( "bt_goal" );
    }
    else
    {
        self function_461dc0438f85cf1d( 3 );
    }
    
    while ( self.arriving )
    {
        waitframe();
    }
}

// Namespace ai_revival
// Params 2
// Checksum 0x3287f18d, Offset: 0xf0f
// Size: 0x3e
function remoterevive( statename, params )
{
    self endon( "death" );
    self endon( "end_revival" );
    cap::cap_start( "cap_ai_revival", "caps/interactions/cap_ai_revival" );
    self waittill( "cap_exit_completed" );
}

// Namespace ai_revival
// Params 2
// Checksum 0xe6dae19c, Offset: 0xf55
// Size: 0x98
function providecoverfire( statename, params )
{
    self endon( "death" );
    self endon( "end_revival" );
    self.revivetarget = undefined;
    self.bulletsinclip = weaponclipsize( self.weapon );
    self.cachemaxfaceenemydist = self.maxfaceenemydist;
    self.maxfaceenemydist = 2048;
    self.providecoveringfire = 1;
    self.balwayscoverexposed = 1;
    self.shootstyleoverride = "full";
    wait self.var_8b0758c75353b418;
    coveringfirecleanup();
}

// Namespace ai_revival
// Params 2
// Checksum 0x4394ece1, Offset: 0xff5
// Size: 0x2d
function waitforreviver( statename, params )
{
    self endon( "death" );
    self endon( "end_revival" );
    self waittill( "shot_by_revive_pistol" );
}

// Namespace ai_revival
// Params 2
// Checksum 0xe065783, Offset: 0x102a
// Size: 0x5a
function beingremoterevived( statename, params )
{
    self endon( "death" );
    self endon( "end_revival" );
    cap::cap_start( "cap_ai_revival", "caps/interactions/cap_ai_revival" );
    self waittill( "cap_exit_completed" );
    self.doinglongdeath = 0;
    self.health = self.maxhealth;
}

// Namespace ai_revival
// Params 0, eflags: 0x4
// Checksum 0x87841316, Offset: 0x108c
// Size: 0x4b
function private coveringfirecleanup()
{
    if ( !isdefined( self.cachemaxfaceenemydist ) )
    {
        return;
    }
    
    self.providecoveringfire = 0;
    self.balwayscoverexposed = 0;
    self.shootstyleoverride = undefined;
    self.maxfaceenemydist = self.cachemaxfaceenemydist;
    self.cachemaxfaceenemydist = undefined;
}

// Namespace ai_revival
// Params 0, eflags: 0x4
// Checksum 0x80907b83, Offset: 0x10df
// Size: 0x3a
function private function_ea3f4aa8f5f16cdf()
{
    self.ignoreall = 0;
    self.combatmode = "cover";
    self setcanusecover( 1 );
    self allowedstances( "stand", "crouch" );
    self clearbtgoal( 3 );
}

// Namespace ai_revival
// Params 0, eflags: 0x4
// Checksum 0x1508617f, Offset: 0x1121
// Size: 0x21
function private function_410675d68e6e1260()
{
    helper = function_7ea6d66bfed6ffa9();
    
    if ( isdefined( helper ) )
    {
        helper unlink();
    }
}

// Namespace ai_revival
// Params 0, eflags: 0x4
// Checksum 0x4f701a90, Offset: 0x114a
// Size: 0x13a
function private adjustpos()
{
    startpos = self.origin;
    startangles = self.angles;
    assert( isdefined( self.revivetargetpos ) && isdefined( self.revivetargetangles ), "<dev string:x117>" );
    
    if ( !isdefined( self.revivetargetpos ) || !isdefined( self.revivetargetangles ) )
    {
        return;
    }
    
    stilltoofar = distancesquared( startpos, self.revivetargetpos ) > 100;
    var_c3f330787d5d2243 = absangleclamp180( startangles[ 1 ] - self.revivetargetangles[ 1 ] ) > 7;
    
    if ( stilltoofar || var_c3f330787d5d2243 )
    {
        interval = 300;
        endtime = gettime() + interval;
        
        while ( endtime > gettime() )
        {
            fraction = 1 - ( endtime - gettime() ) / interval;
            newpos = vectorlerp( startpos, self.revivetargetpos, fraction );
            newangles = anglelerpquatfrac( startangles, self.revivetargetangles, fraction );
            self forceteleport( newpos, newangles );
            waitframe();
        }
    }
}

// Namespace ai_revival
// Params 1, eflags: 0x4
// Checksum 0xe32c706c, Offset: 0x128c
// Size: 0x48
function private function_dd687aabb00ca84e( dyingguy )
{
    var_13951377932b459f = 6;
    damagedirsuffix = "_back";
    
    if ( isdefined( dyingguy ) )
    {
        var_13951377932b459f = cap_ai_revival::function_a7df89d3e427d246( dyingguy, self );
        damagedirsuffix = dyingguy cap_ai_revival::getdamagedirectionsuffix();
    }
    
    return var_13951377932b459f + damagedirsuffix;
}

// Namespace ai_revival
// Params 1, eflags: 0x4
// Checksum 0x390f6836, Offset: 0x12dd
// Size: 0x39
function private function_8e6601c7cd695bf1( alias )
{
    if ( alias[ 0 ] == "4" )
    {
        return ( "6" + getsubstr( alias, 1 ) );
    }
    
    return "4" + getsubstr( alias, 1 );
}

// Namespace ai_revival
// Params 0, eflags: 0x4
// Checksum 0xc3f6b075, Offset: 0x131e
// Size: 0x19
function private earlyoutinteraction()
{
    function_dd518df9ee8d217c( self getinteractionid(), "death", 1 );
    self leaveinteraction();
}

// Namespace ai_revival
// Params 0, eflags: 0x4
// Checksum 0x39bba025, Offset: 0x133f
// Size: 0x2b
function private getdyingguy()
{
    id = self getinteractionid();
    users = getbsequserswithtag( id, "dying_guy" );
    return users[ 0 ];
}

// Namespace ai_revival
// Params 0, eflags: 0x4
// Checksum 0xbec4d14a, Offset: 0x1373
// Size: 0x2b
function private function_7ea6d66bfed6ffa9()
{
    id = self getinteractionid();
    users = getbsequserswithtag( id, "reviving_guy" );
    return users[ 0 ];
}

// Namespace ai_revival
// Params 4, eflags: 0x4
// Checksum 0x3870f92a, Offset: 0x13a7
// Size: 0x6b, Type: bool
function private tookdamageduringrevive( asmname, statename, tostatename, params )
{
    if ( !self.revival )
    {
        return false;
    }
    
    if ( self.health < self.revival.initialhealth )
    {
        function_dd518df9ee8d217c( self getinteractionid(), "death", 1 );
        return true;
    }
    
    return false;
}

