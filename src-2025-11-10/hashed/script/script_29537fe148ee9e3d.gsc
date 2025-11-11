#using script_53651341190c5aab;
#using scripts\engine\utility;

#namespace ai_lkp;

// Namespace ai_lkp
// Params 1
// Checksum 0x97e87ce3, Offset: 0x2f6
// Size: 0x134
function getfunction( funcid )
{
    switch ( funcid )
    {
        case #"hash_dab0d83df51da4d":
            return &onuserinit;
        case #"hash_722d767fd6d40f56":
            return &onuserterminate;
        case #"hash_8a6929c703898e78":
            return &setupmeetuppositions;
        case #"hash_3830c02ed29b9bd":
            return &reachedprimary;
        case #"hash_2a3b81fd59207935":
            return &setwatcherstoidle;
        case #"hash_1d9348daf6d1a5c7":
            return &callaceasefire;
        case #"hash_b3cada4cba95eb5d":
            return &setgoalposlkp;
        case #"hash_4f54865eea297354":
            return &reachedlkp;
        case #"hash_561e0f0540b7f727":
            return &setuppositionsnearlkp;
        case #"hash_dca2cd774e93c43b":
            return &reachedlkprandom;
        case #"hash_cb9a60b9c8cfca45":
            return &waitforlkpanimfinished;
        case #"hash_cc3a03d50cb74f10":
            return &function_43ddb2a71129b731;
        case #"hash_49987181712dbfd5":
            return &setstationary;
        case #"hash_303d74db152a39b9":
            return &interaction_common::function_ac09dd92b7250c46;
        case #"hash_2bb757aa70fc12dd":
            return &cleargoal;
    }
    
    assertmsg( "<dev string:x24>" + funcid );
}

// Namespace ai_lkp
// Params 1
// Checksum 0x5c195d32, Offset: 0x432
// Size: 0x2a2
function onuserinit( interactionid )
{
    if ( !isdefined( level.bseqinstancedata ) )
    {
        level.bseqinstancedata = [];
    }
    
    if ( !isdefined( level.bseqinstancedata[ interactionid ] ) )
    {
        level.bseqinstancedata[ interactionid ] = spawnstruct();
        level.bseqinstancedata[ interactionid ].var_66d5e5b005680ad1 = 0;
        level.bseqinstancedata[ interactionid ].var_719f77a34e64d6f5 = [];
    }
    
    if ( !isdefined( self.bseqinstancedata ) )
    {
        self.bseqinstancedata = spawnstruct();
        self.bseqinstancedata.var_5c3ecab4e65b2277 = 0;
    }
    
    self.var_a3a61cb7891f3136 = 1;
    self.bdisablereacquire = 1;
    self reacquireclear();
    self setcanusecover( 0, "bseq" );
    self.bseqinstancedata.speed = self aigetdesiredspeed();
    self aisetdesiredspeed( 120 );
    self function_461dc0438f85cf1d( 1 );
    self setbtgoalradius( 1, 20 );
    level.bseqinstancedata[ interactionid ].var_719f77a34e64d6f5[ level.bseqinstancedata[ interactionid ].var_719f77a34e64d6f5.size ] = self.origin;
    self.bseqinstancedata.allowedstances = [];
    self.bseqinstancedata.numallowedstances = 0;
    
    if ( self function_2b441168b3089ca4( "stand" ) )
    {
        self.bseqinstancedata.allowedstances[ self.bseqinstancedata.numallowedstances ] = "stand";
        self.bseqinstancedata.numallowedstances += 1;
    }
    
    if ( self function_2b441168b3089ca4( "crouch" ) )
    {
        self.bseqinstancedata.allowedstances[ self.bseqinstancedata.numallowedstances ] = "crouch";
        self.bseqinstancedata.numallowedstances += 1;
    }
    
    if ( self function_2b441168b3089ca4( "prone" ) )
    {
        self.bseqinstancedata.allowedstances[ self.bseqinstancedata.numallowedstances ] = "prone";
        self.bseqinstancedata.numallowedstances += 1;
    }
    
    self allowedstances( "stand" );
    self notify( "startlkpbehavior" );
}

// Namespace ai_lkp
// Params 1
// Checksum 0x387807db, Offset: 0x6dc
// Size: 0x193
function onuserterminate( interactionid )
{
    self clearbtgoal( 1 );
    self aiclearscriptdesiredspeed();
    self setcanusecover( 1, "bseq" );
    function_dd518df9ee8d217c( interactionid, "lkpanimtype", "none" );
    self stoplookat();
    self.bdisablereacquire = 0;
    self.var_a3a61cb7891f3136 = 0;
    
    if ( self.bseqinstancedata.numallowedstances == 3 )
    {
        self allowedstances( self.bseqinstancedata.allowedstances[ 0 ], self.bseqinstancedata.allowedstances[ 1 ], self.bseqinstancedata.allowedstances[ 2 ] );
    }
    else if ( self.bseqinstancedata.numallowedstances == 2 )
    {
        self allowedstances( self.bseqinstancedata.allowedstances[ 0 ], self.bseqinstancedata.allowedstances[ 1 ] );
    }
    else if ( self.bseqinstancedata.numallowedstances == 1 )
    {
        self allowedstances( self.bseqinstancedata.allowedstances[ 0 ] );
    }
    
    if ( !isalive( self ) )
    {
        function_dd518df9ee8d217c( interactionid, "death", 1 );
    }
    
    self.bseqinstancedata = undefined;
    primaryinvestigator = function_dd66b33f5942bdfb( "primary_investigator", interactionid );
    
    if ( !isdefined( primaryinvestigator ) || primaryinvestigator == self )
    {
        level.bseqinstancedata[ interactionid ] = undefined;
    }
    
    self notify( "endlkpbehavior" );
}

// Namespace ai_lkp
// Params 2
// Checksum 0xf6abbde2, Offset: 0x877
// Size: 0x7f
function setupmeetuppositions( statename, params )
{
    primaryinvestigator = function_dd66b33f5942bdfb( "primary_investigator" );
    primaryinvestigator endon( "death" );
    primaryinvestigator endon( "endlkpbehavior" );
    id = self getinteractionid();
    backupinvestigators = function_b8df72c609a7a6f7( "backup_investigator" );
    primaryinvestigatorpos = primaryinvestigator.origin;
    return function_ab171e929e5d17c7( primaryinvestigatorpos );
}

// Namespace ai_lkp
// Params 2
// Checksum 0x432ad51b, Offset: 0x8ff
// Size: 0xbc
function reachedprimary( statename, params )
{
    primaryinvestigator = function_dd66b33f5942bdfb( "primary_investigator" );
    primaryinvestigator endon( "death" );
    primaryinvestigator endon( "endlkpbehavior" );
    id = self getinteractionid();
    backupinvestigators = function_b8df72c609a7a6f7( "backup_investigator" );
    level.bseqinstancedata[ id ].var_66d5e5b005680ad1++;
    
    if ( level.bseqinstancedata[ id ].var_66d5e5b005680ad1 >= backupinvestigators.size )
    {
        function_dd518df9ee8d217c( id, "move_complete_initial", 1 );
        level.bseqinstancedata[ id ].var_66d5e5b005680ad1 = 0;
    }
}

// Namespace ai_lkp
// Params 2
// Checksum 0xc1394b41, Offset: 0x9c3
// Size: 0x91
function setwatcherstoidle( statename, params )
{
    primaryinvestigator = function_dd66b33f5942bdfb( "primary_investigator" );
    primaryinvestigator endon( "death" );
    primaryinvestigator endon( "endlkpbehavior" );
    id = self getinteractionid();
    self function_461dc0438f85cf1d( 1 );
    lastknownposition = function_521b5a0a07a246a8( id, "last_known_position" );
    self setlookat( lastknownposition + ( 0, 0, 63 ) );
    function_dd518df9ee8d217c( id, "lkpanimtype", "idle" );
}

// Namespace ai_lkp
// Params 2
// Checksum 0xf538c0b6, Offset: 0xa5c
// Size: 0x193
function callaceasefire( statename, params )
{
    self endon( "endlkpbehavior" );
    self endon( "death" );
    wait 0.2;
    id = self getinteractionid();
    nummembers = function_521b5a0a07a246a8( id, "num_members" );
    
    if ( isdefined( level.bseqinstancedata[ id ] ) && isdefined( level.bseqinstancedata ) && isdefined( level.bseqinstancedata[ id ].var_719f77a34e64d6f5 ) )
    {
        level.bseqinstancedata[ id ].var_719f77a34e64d6f5[ level.bseqinstancedata[ id ].var_719f77a34e64d6f5.size ] = self.origin;
        lastknownposition = function_521b5a0a07a246a8( id, "last_known_position" );
        level.bseqinstancedata[ id ].var_719f77a34e64d6f5[ level.bseqinstancedata[ id ].var_719f77a34e64d6f5.size ] = lastknownposition;
        var_fc8799351f124a26 = function_b8df72c609a7a6f7( "backup_investigator" );
        numwatchers = function_b8df72c609a7a6f7( "RestOfThem" );
        function_dd518df9ee8d217c( id, "num_backup_members", var_fc8799351f124a26.size );
        nummembers = var_fc8799351f124a26.size + numwatchers.size;
        function_dd518df9ee8d217c( id, "num_members", nummembers );
        
        if ( nummembers > 1 )
        {
            function_dd518df9ee8d217c( id, "lkpanimtype", "cease_fire" );
            self.var_c441720c90bf9002 = 1;
            addbattlechatternotify( self, self.enemy, "last_known_position", "cease_fire", 0 );
        }
    }
}

// Namespace ai_lkp
// Params 0
// Checksum 0xab3f7ae, Offset: 0xbf7
// Size: 0x8c
function function_530db05278f25c67()
{
    searchvolume = undefined;
    
    if ( isdefined( self.stealth ) && isdefined( level.stealth.combat_volumes ) && isdefined( level.stealth ) && isdefined( level.stealth.combat_volumes[ self.script_stealthgroup ] ) )
    {
        searchvolume = level.stealth.combat_volumes[ self.script_stealthgroup ];
    }
    else
    {
        searchvolume = self getgoalvolume();
    }
    
    return searchvolume;
}

// Namespace ai_lkp
// Params 2
// Checksum 0x463af8cd, Offset: 0xc8c
// Size: 0x172
function setgoalposlkp( statename, params )
{
    id = self getinteractionid();
    lastknownposition = function_521b5a0a07a246a8( id, "last_known_position" );
    newgoalpos = undefined;
    cignoreradius = 64;
    self setlookat( lastknownposition + ( 0, 0, 63 ) );
    function_dd518df9ee8d217c( id, "lkpanimtype", "none" );
    searchvolume = function_530db05278f25c67();
    
    if ( isdefined( searchvolume ) )
    {
        newgoalpos = findclosestlospointwithinvolume( searchvolume, lastknownposition + ( 0, 0, 63 ), lastknownposition, level.bseqinstancedata[ id ].var_719f77a34e64d6f5, 0 );
        
        if ( !isdefined( newgoalpos ) )
        {
            newgoalpos = findclosestnonlospointwithinvolume( searchvolume, lastknownposition + ( 0, 0, 63 ), lastknownposition, level.bseqinstancedata[ id ].var_719f77a34e64d6f5, cignoreradius );
        }
    }
    
    if ( !isdefined( newgoalpos ) )
    {
        newgoalpos = lastknownposition;
    }
    
    goalpos = self getclosestreachablepointonnavmesh( newgoalpos );
    level.bseqinstancedata[ id ].var_719f77a34e64d6f5[ level.bseqinstancedata[ id ].var_719f77a34e64d6f5.size ] = goalpos;
    
    /#
        if ( getdvarint( @"hash_9961f6e93a09b113" ) != 0 )
        {
            sphere( goalpos, 6, ( 1, 0, 0 ), 0, 100 );
        }
    #/
    
    return goalpos;
}

// Namespace ai_lkp
// Params 2
// Checksum 0xeefbfb44, Offset: 0xe07
// Size: 0x5b
function reachedlkp( statename, params )
{
    id = self getinteractionid();
    function_dd518df9ee8d217c( id, "lkpanimtype", "lost_target" );
    self.var_c441720c90bf9002 = 1;
    addbattlechatternotify( self, self.enemy, "last_known_position", "lost_target" );
}

// Namespace ai_lkp
// Params 2
// Checksum 0xba05531c, Offset: 0xe6a
// Size: 0x80
function setuppositionsnearlkp( statename, params )
{
    primaryinvestigator = function_dd66b33f5942bdfb( "primary_investigator" );
    primaryinvestigator endon( "death" );
    primaryinvestigator endon( "endlkpbehavior" );
    id = self getinteractionid();
    lastknownposition = function_521b5a0a07a246a8( id, "last_known_position" );
    self setlookat( lastknownposition + ( 0, 0, 63 ) );
    return function_ab171e929e5d17c7( lastknownposition );
}

// Namespace ai_lkp
// Params 2
// Checksum 0xfacdf402, Offset: 0xef3
// Size: 0xbc
function reachedlkprandom( statename, params )
{
    primaryinvestigator = function_dd66b33f5942bdfb( "primary_investigator" );
    primaryinvestigator endon( "death" );
    primaryinvestigator endon( "endlkpbehavior" );
    id = self getinteractionid();
    level.bseqinstancedata[ id ].var_66d5e5b005680ad1++;
    backupinvestigators = function_b8df72c609a7a6f7( "backup_investigator" );
    
    if ( level.bseqinstancedata[ id ].var_66d5e5b005680ad1 >= backupinvestigators.size )
    {
        function_dd518df9ee8d217c( id, "move_complete_lkp", 1 );
        level.bseqinstancedata[ id ].var_66d5e5b005680ad1 = 0;
    }
}

// Namespace ai_lkp
// Params 2
// Checksum 0x6d075b03, Offset: 0xfb7
// Size: 0x8e
function waitforlkpanimfinished( statename, params )
{
    self endon( "endlkpbehavior" );
    self endon( "death" );
    utility::waittill_any_timeout( 5, "exposed_lkp" );
    id = self getinteractionid();
    animtype = function_521b5a0a07a246a8( id, "lkpanimtype" );
    timeout = 10;
    
    if ( animtype == "idle" || animtype == "none" )
    {
        timeout = 2;
    }
    
    utility::waittill_any_timeout( timeout, "exposed_lkp_finished" );
}

// Namespace ai_lkp
// Params 2
// Checksum 0x42623409, Offset: 0x104d
// Size: 0x28
function setstationary( statename, params )
{
    self function_461dc0438f85cf1d( 1 );
    self setbtgoalradius( 1, params[ 0 ] );
}

// Namespace ai_lkp
// Params 1
// Checksum 0x57385646, Offset: 0x107d
// Size: 0x34, Type: bool
function function_43ddb2a71129b731( statename )
{
    goalradius = 16;
    pathlength = self pathdisttogoal();
    
    if ( pathlength <= goalradius )
    {
        return true;
    }
    
    return false;
}

// Namespace ai_lkp
// Params 1
// Checksum 0x660bb1db, Offset: 0x10ba
// Size: 0x14
function cleargoal( statename )
{
    self clearbtgoal( 1 );
}

// Namespace ai_lkp
// Params 2
// Checksum 0xea723848, Offset: 0x10d6
// Size: 0x3d
function function_dd66b33f5942bdfb( tag, interactionid )
{
    self endon( "death" );
    self endon( "endlkpbehavior" );
    users = function_b8df72c609a7a6f7( tag, interactionid );
    return users[ 0 ];
}

// Namespace ai_lkp
// Params 2
// Checksum 0x9c0aad5a, Offset: 0x111c
// Size: 0x48
function function_b8df72c609a7a6f7( tag, interactionid )
{
    self endon( "death" );
    self endon( "endlkpbehavior" );
    
    if ( !isdefined( interactionid ) )
    {
        interactionid = self getinteractionid();
    }
    
    users = getbsequserswithtag( interactionid, tag );
    return users;
}

// Namespace ai_lkp
// Params 1
// Checksum 0xda897454, Offset: 0x116d
// Size: 0x1b3
function function_ab171e929e5d17c7( primarypos )
{
    self endon( "death" );
    self endon( "endlkpbehavior" );
    id = self getinteractionid();
    cignoreradius = 100;
    searchvolume = function_530db05278f25c67();
    
    if ( isdefined( searchvolume ) )
    {
        newgoalpos = findclosestlospointwithinvolume( searchvolume, primarypos + ( 0, 0, 63 ), primarypos, level.bseqinstancedata[ id ].var_719f77a34e64d6f5, cignoreradius );
        
        if ( !isdefined( newgoalpos ) )
        {
            newgoalpos = findclosestnonlospointwithinvolume( searchvolume, primarypos + ( 0, 0, 63 ), primarypos, level.bseqinstancedata[ id ].var_719f77a34e64d6f5, cignoreradius );
        }
    }
    else
    {
        carearadius = 1000;
        newgoalpos = findclosestlospointwithinradius( self.origin, carearadius, primarypos + ( 0, 0, 63 ), primarypos, level.bseqinstancedata[ id ].var_719f77a34e64d6f5, cignoreradius );
    }
    
    if ( !isdefined( newgoalpos ) )
    {
        curpos = self.origin;
        variance = randomintrange( 100, 150 );
        newgoalpos = primarypos - variance * vectornormalize( primarypos - curpos );
    }
    
    goalpos = self getclosestreachablepointonnavmesh( newgoalpos );
    level.bseqinstancedata[ id ].var_719f77a34e64d6f5[ level.bseqinstancedata[ id ].var_719f77a34e64d6f5.size ] = goalpos;
    
    /#
        if ( getdvarint( @"hash_9961f6e93a09b113" ) != 0 )
        {
            sphere( goalpos, 6, ( 0, 0, 1 ), 0, 100 );
        }
    #/
    
    return goalpos;
}

