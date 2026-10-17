#using script_194f8050b4a6d3a1;
#using script_1aae2eb1ef28b239;
#using script_2aa77b5f4dfc2051;
#using script_53d999e26576a580;
#using script_6a15e432500b045a;
#using script_f01501ac138f999;
#using scripts\common\activity_nexus\activity_common;
#using scripts\common\ai\ai_spawn_director;
#using scripts\common\system;
#using scripts\common\utility;
#using scripts\mp\hud_message;
#using scripts\mp\loot\common_item;

#namespace activity_bongo_surprise_shipment;

// Namespace activity_bongo_surprise_shipment
// Params 0, eflags: 0x5
// Checksum 0x98f2b8e7, Offset: 0x2bb
// Size: 0x33
function private autoexec __init__system__()
{
    system::register( #"activity_bongo_surprise_shipment", [ #"activity_common", #"mp_saw_avalon_bongo_surprise_shipments_cs" ], &function_538033a540e63c70, undefined );
}

// Namespace activity_bongo_surprise_shipment
// Params 0, eflags: 0x4
// Checksum 0x652cca57, Offset: 0x2f6
// Size: 0x13
function private function_538033a540e63c70()
{
    activity_common::registeractivitytype( "BONGO_SURPRISE_SHIPMENT", &activity_type_init );
}

// Namespace activity_bongo_surprise_shipment
// Params 0, eflags: 0x4
// Checksum 0xd43e9ca9, Offset: 0x311
// Size: 0xe5
function private activity_type_init()
{
    activity_common::function_944074f3079c1d4e( "BONGO_SURPRISE_SHIPMENT", 0, &activity_setup );
    activity_common::function_944074f3079c1d4e( "BONGO_SURPRISE_SHIPMENT", 1, &activity_begin );
    activity_common::function_944074f3079c1d4e( "BONGO_SURPRISE_SHIPMENT", 3, &activity_destroy );
    activity_common::function_944074f3079c1d4e( "BONGO_SURPRISE_SHIPMENT", 4, &get_center );
    activity_common::function_2dd4f07fa5c3e911( "ActivitySuccess", &surprise_shipment_activity_success, "BONGO_SURPRISE_SHIPMENT" );
    activity_common::function_2dd4f07fa5c3e911( "PlayerJoin", &player_joined, "BONGO_SURPRISE_SHIPMENT" );
    activity_common::function_2dd4f07fa5c3e911( "PlayerLeave", &player_left, "BONGO_SURPRISE_SHIPMENT" );
    activity_common::function_2dd4f07fa5c3e911( "ObjectiveMarkerSpawned", &function_fda95776c64b4592, "BONGO_SURPRISE_SHIPMENT" );
    namespace_9085ae059032a84f::function_74af1ab4059e3c06( "saw_bongo_activity_surprise_shipment", "saw_bongo_activity_surprise_shipment" );
    
    if ( !isdefined( level.var_1aff81a7080bac1b ) )
    {
        level.var_1aff81a7080bac1b = [];
    }
    
    level.var_1aff81a7080bac1b[ "saw_bongo_activity_surprise_shipment_objective_marker" ] = %"ping_location_go";
}

// Namespace activity_bongo_surprise_shipment
// Params 0, eflags: 0x4
// Checksum 0x18c22a12, Offset: 0x3fe
// Size: 0x198
function private activity_setup()
{
    activity_instance = self;
    activity_instance endon( #"activity_ended" );
    activity_instance endon( #"instance_destroyed" );
    activity_instance.variantdata = namespace_9085ae059032a84f::function_9129cd8075c85c09( activity_instance );
    function_bc041d7a3efbfe87( activity_instance.varianttag, activity_instance.variantdata );
    ref_struct = getent( self.varianttag + "_container", #targetname );
    activity_instance.container_scriptable = spawnscriptable( "saw_ob_surprise_shipping_container_bongo", ref_struct.origin, ref_struct.angles );
    activity_instance.container_scriptable setscriptablepartstate( "state", "visible" );
    activity_instance.container_scriptable setscriptablepartstate( "obstacle", "closed" );
    
    foreach ( scriptable in getentitylessscriptablearray( "activity_bongo_surprise_shipment_cover", "script_noteworthy", ref_struct.origin, getdvarfloat( @"hash_7d7f3fb8d3795ca1", 500 ) ) )
    {
        scriptable setscriptablepartstate( #"state", #"visible" );
    }
    
    namespace_9085ae059032a84f::function_16b3cfd89a1669f7( 2, activity_instance );
    childthread player_proximity_watcher();
}

// Namespace activity_bongo_surprise_shipment
// Params 0, eflags: 0x4
// Checksum 0xb2973cc9, Offset: 0x59e
// Size: 0x152
function private player_proximity_watcher()
{
    activity_instance = self;
    origin = activity_instance_common::function_776ee11e7acc64a5( activity_instance );
    
    /#
        var_ae876b0e633ab4b5 = getdvarint( @"hash_e1ff000a20fe6bef", 0 ) == 1;
    #/
    
    while ( true )
    {
        playersinradius = getplayersinradius( origin, activity_instance.variantdata.openradius );
        
        foreach ( player in playersinradius )
        {
            if ( !player isonground() )
            {
                continue;
            }
            
            activity_instance.initiatingteam = player.team;
            activity_instance_common::function_46135a69bddfec2c( activity_instance );
            br_activity_util::activitylog( activity_instance, "Opened by " + player.name );
            return;
        }
        
        /#
            if ( var_ae876b0e633ab4b5 )
            {
                sphere( origin, activity_instance.variantdata.openradius, ( 0, 1, 0 ), 0, 20 );
            }
        #/
        
        wait 1;
    }
}

// Namespace activity_bongo_surprise_shipment
// Params 0, eflags: 0x4
// Checksum 0xd8d41ee9, Offset: 0x6f8
// Size: 0x99
function private activity_begin()
{
    activity_instance = self;
    self.container_scriptable setscriptablepartstate( "audio", "warning" );
    self.focusstage = 1;
    namespace_9085ae059032a84f::function_16b3cfd89a1669f7( 1, activity_instance );
    wait activity_instance.variantdata.opendelay;
    activity_instance.container_scriptable setscriptablepartstate( "state", "activate" );
    activity_instance.container_scriptable setscriptablepartstate( "obstacle", "open" );
    activity_instance spawnencounter();
    activity_instance thread progress_watcher();
}

// Namespace activity_bongo_surprise_shipment
// Params 2, eflags: 0x4
// Checksum 0xf6ccbf24, Offset: 0x799
// Size: 0x84
function private function_bc041d7a3efbfe87( variantname, data )
{
    assert( isdefined( game[ "<dev string:x24>" ] ) );
    
    if ( !isdefined( game[ "dialog" ][ "surprise_shipping_" + variantname + "_approach" ] ) )
    {
        game[ "dialog" ][ "surprise_shipping_" + variantname + "_approach" ] = data.var_4310ead0bb84e72b;
        game[ "dialog" ][ "surprise_shipping_" + variantname + "_success" ] = data.var_722663430868f18e;
    }
}

// Namespace activity_bongo_surprise_shipment
// Params 0, eflags: 0x4
// Checksum 0x24ec231e, Offset: 0x825
// Size: 0x6c
function private progress_watcher()
{
    activity_instance = self;
    activity_instance endon( #"instance_destroyed" );
    namespace_9085ae059032a84f::updateprogress( 0, activity_instance, activity_instance.enemies.size );
    
    while ( true )
    {
        activity_instance waittill( #"update_progress" );
        namespace_9085ae059032a84f::updateprogress( activity_instance.numkilled ?? 0, activity_instance, activity_instance.enemies.size );
    }
}

// Namespace activity_bongo_surprise_shipment
// Params 1, eflags: 0x4
// Checksum 0x540cfecb, Offset: 0x899
// Size: 0x22f
function private surprise_shipment_activity_success( relevant_info_struct )
{
    playerlist = relevant_info_struct.playerlist;
    activity = self;
    
    if ( isdefined( playerlist ) && isdefined( activity ) )
    {
        foreach ( player in playerlist )
        {
            if ( player.team == activity.initiatingteam )
            {
                player thread hud_message::showsplash( "br_bongo_surprise_container_activity_success" );
                level thread br_public::brleaderdialogplayer( "surprise_shipping_" + self.varianttag + "_success", player, 1, undefined, 2, undefined, self.variantdata.var_11f87a6ededa3182 );
            }
        }
    }
    
    list = activity.variantdata.crateitems;
    spawnoptions = common_item::items_initspawnoptions_spawnfromposition( activity_instance_common::function_776ee11e7acc64a5( activity ), activity.container_scriptable.angles + ( 0, 50, 0 ) );
    spawnoptions.payload = [ #"teamselect", activity.initiatingteam ];
    spawnoptions.var_8e48a889d5a11dee = 0;
    spawnoptions.var_cb3b9e54c815a592 = 1;
    spawnoptions.var_8934e0ace9b7d996 = 20;
    spawnoptions.var_8958d2ace9e03584 = 20;
    spawnoptions.spawningteam = activity.initiatingteam;
    numitems = randomintrange( activity.variantdata.minrewards, activity.variantdata.maxrewards + 1 );
    common_item::function_38cde6a6acb68ea6( list, numitems, spawnoptions );
    br_activity_util::function_381d1d8f56715c32( activity.initiatingteam, "activitiesCompleted" );
}

// Namespace activity_bongo_surprise_shipment
// Params 1, eflags: 0x4
// Checksum 0x71efa565, Offset: 0xad0
// Size: 0x38
function private function_fda95776c64b4592( relevant_info_struct )
{
    utility::callsharedfunc( #"bongo", #"hash_ccf830b44797af61", self.var_e7b6adbe385c7c18.scriptable );
}

// Namespace activity_bongo_surprise_shipment
// Params 1, eflags: 0x4
// Checksum 0xf8cc2da9, Offset: 0xb10
// Size: 0x147
function private player_joined( relevant_info_struct )
{
    self notify( #"hash_2046fc89f8c7364b" );
    
    if ( !isdefined( self.var_7b2ac829756f4854 ) )
    {
        self.var_7b2ac829756f4854 = [];
    }
    
    foreach ( player in relevant_info_struct.playerlist )
    {
        if ( !arraycontains( self.var_7b2ac829756f4854, player ) )
        {
            self.var_7b2ac829756f4854[ self.var_7b2ac829756f4854.size ] = player;
            level thread br_public::brleaderdialogplayer( "surprise_shipping_" + self.varianttag + "_approach", player, 1, undefined, 2, undefined, self.variantdata.var_90d2488226a1079f );
        }
        
        br_analytics::function_63a0465c6e14c930( self, player );
        
        if ( !getdvarint( @"hash_cc4ad12738832cc6", 0 ) && self.enemies.size )
        {
            namespace_9085ae059032a84f::function_a0a94881bc380bbf( 1, self, { #players:[ player ] } );
        }
    }
}

// Namespace activity_bongo_surprise_shipment
// Params 1, eflags: 0x4
// Checksum 0x1b5243c6, Offset: 0xc5f
// Size: 0xe4
function private player_left( relevant_info_struct )
{
    activity = self;
    activity endon( #"hash_2046fc89f8c7364b" );
    
    foreach ( player in relevant_info_struct.playerlist )
    {
        br_analytics::function_d9845418c8b51cff( activity, player );
    }
    
    if ( activity_instance_common::getactivitystate( activity ) == "Active" && activity_instance_common::function_be0fb090edaf64f( activity ) == 0 )
    {
        wait activity.variantdata.despawndelay;
        
        if ( activity )
        {
            activity_instance_common::endactivity( activity, 0 );
        }
    }
}

// Namespace activity_bongo_surprise_shipment
// Params 0, eflags: 0x4
// Checksum 0xa36e545, Offset: 0xd4b
// Size: 0x33
function private activity_destroy()
{
    activity_instance = self;
    
    if ( isdefined( activity_instance.request_id ) )
    {
        ai_spawn_director::cancel_spawn_request( activity_instance.request_id, 0, 1 );
    }
}

// Namespace activity_bongo_surprise_shipment
// Params 0, eflags: 0x4
// Checksum 0x3bce70d6, Offset: 0xd86
// Size: 0x25, Type: bool
function private get_center()
{
    return self.container_scriptable.origin ?? ( 0, 0, 0 );
}

// Namespace activity_bongo_surprise_shipment
// Params 0
// Checksum 0x27384d1a, Offset: 0xdb4
// Size: 0x9c
function spawnencounter()
{
    activity_instance = self;
    origin = activity_instance_common::function_776ee11e7acc64a5( self );
    encounter_name = "ai_encounter:" + activity_instance.variantdata.encounter;
    request_id = ai_spawn_director::spawn_request( encounter_name, origin, 100, 1, 1 );
    ai_spawn_director::function_71b3c575c1426546( request_id, &bot_spawned_callback, activity_instance );
    ai_spawn_director::function_5a08798970350207( request_id, &function_3e5a6b358c7fadf9, activity_instance );
    ai_spawn_director::function_a49c35b72d6b6fea( request_id, &function_e6648940e35ee232, activity_instance );
    activity_instance.request_id = request_id;
}

// Namespace activity_bongo_surprise_shipment
// Params 4, eflags: 0x4
// Checksum 0x139079b, Offset: 0xe58
// Size: 0x76
function private bot_spawned_callback( request_id, activity_instance, agent, data )
{
    br_activity_util::additemdrops( request_id, activity_instance, agent, data );
    agent waittill( #"death" );
    
    if ( !isdefined( activity_instance.numkilled ) )
    {
        activity_instance.numkilled = 0;
    }
    
    activity_instance.numkilled++;
    activity_instance notify( #"update_progress" );
}

// Namespace activity_bongo_surprise_shipment
// Params 2, eflags: 0x4
// Checksum 0xb34aa7e7, Offset: 0xed6
// Size: 0x29f
function private function_3e5a6b358c7fadf9( requestid, activity_instance )
{
    activity_instance endon( #"activity_ended" );
    activity_instance endon( #"instance_destroyed" );
    encounterdata = function_9b649316adcccbaa( requestid );
    activity_instance.enemies = encounterdata.ai;
    forward = anglestoright( activity_instance.container_scriptable.angles );
    right = anglestoforward( activity_instance.container_scriptable.angles );
    x_offsets = [ 72, 72, -72, -72, 96, 96, -96, -96 ];
    y_offsets = [ 12, -12, 12, -12, 12, -12, 12, -12 ];
    rotations = [ -90, -90, 90, 90, -90, -90, 90, 90 ];
    
    for ( i = 0; i < activity_instance.enemies.size ; i++ )
    {
        enemy = activity_instance.enemies[ i ];
        targetloc = activity_instance.container_scriptable.origin + forward * x_offsets[ i ] + right * y_offsets[ i ] + ( 0, 0, 11 );
        targetangles = activity_instance.container_scriptable.angles + ( 0, rotations[ i ], 0 );
        enemy forceteleport( targetloc, targetangles );
        enemy function_fa32376aaa88a7a2( activity_instance.container_scriptable.origin, 400 );
        enemygoalpos = targetloc + utility::function_d8f5310928e6277f() * activity_instance.variantdata.var_9ddbf7b3caa0aa95;
        enemy setgoalpos( enemygoalpos, 200 );
    }
    
    var_4e84c2b015521626 = undefined;
    
    if ( getdvarint( @"hash_cc4ad12738832cc6", 0 ) )
    {
        var_4e84c2b015521626 = teams::getteamdata( activity_instance.initiatingteam, "players" );
    }
    
    namespace_9085ae059032a84f::function_a0a94881bc380bbf( 1, activity_instance, { #players:var_4e84c2b015521626 } );
    activity_instance notify( #"update_progress" );
}

// Namespace activity_bongo_surprise_shipment
// Params 3, eflags: 0x4
// Checksum 0x3670cb1d, Offset: 0x117d
// Size: 0x62
function private function_e6648940e35ee232( request_id, activity_instance, data )
{
    if ( activity_instance_common::function_be0fb090edaf64f( activity_instance ) == 0 )
    {
        return;
    }
    
    player_list = activity_instance_common::function_4225efca86f0dea9( activity_instance );
    namespace_9085ae059032a84f::function_a0a94881bc380bbf( 2, activity_instance, { #players:player_list } );
    activity_instance_common::endactivity( activity_instance, 1 );
}

