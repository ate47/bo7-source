#using script_433d8f78f7e5fb;
#using scripts\anim\battlechatter_ai;
#using scripts\anim\battlechatter_events;
#using scripts\anim\dialogue;
#using scripts\asm\asm;
#using scripts\common\callbacks;
#using scripts\common\debug;
#using scripts\common\utility;
#using scripts\engine\throttle;
#using scripts\engine\utility;

#namespace battlechatter;

// Namespace battlechatter
// Params 0
// Checksum 0x7a875317, Offset: 0x145a
// Size: 0x83b
function init_battlechatter()
{
    if ( getdvarint( @"bcs_enable", 1 ) != 1 )
    {
        return;
    }
    
    if ( function_26f033175a745a9e() )
    {
        if ( level.battlechatterinit )
        {
            return;
        }
        
        level.battlechatterinit = 1;
        level callback::add( #"on_ai_damaged", &ondamaged );
        level callback::add( #"player_damaged", &ondamaged );
        level callback::add( #"on_ai_killed", &onkilled );
        level callback::add( #"player_death", &onkilled );
        level callback::add( #"player_laststand", &onkilled );
        level callback::add( #"hash_10831fc4ff641282", &function_20c3b78415f5d631 );
        level thread function_5badabdd0907701d();
        return;
    }
    
    setdvarifuninitialized( @"bcs_enable", 1 );
    setdvarifuninitialized( @"bcs_debug", 0 );
    setdvarifuninitialized( @"hash_44ef18550505e010", 0 );
    setdvarifuninitialized( @"hash_350b154807f4d745", 0 );
    setdvarifuninitialized( @"hash_4b7858e66804e305", 0 );
    setdvarifuninitialized( @"hash_5aea525f549d2546", 0 );
    
    if ( isdefined( level.battlechatter ) )
    {
        return;
    }
    
    level.battlechatter = spawnstruct();
    level.battlechatter.states = [];
    level.battlechatter.delays = [];
    level.battlechatter.names = [];
    level.battlechatter.events = [];
    level.battlechatter.variations = [];
    setdvarifuninitialized( @"hash_495535a4877b324d", "off" );
    setdvarifuninitialized( @"hash_87dca5163728ce02", "off" );
    setdvarifuninitialized( @"hash_ce7cfdf8678edb2", "off" );
    setdvarifuninitialized( @"hash_70aaec0e43322fea", "off" );
    setdvarifuninitialized( @"hash_6f38327ed1f7340f", "off" );
    setdvarifuninitialized( @"hash_702217ae066916b9", "" );
    setdvarifuninitialized( @"hash_21778f568437cd09", "" );
    setdvarifuninitialized( @"debug_bcprint", "off" );
    setdvarifuninitialized( @"hash_1c663353dae9fab0", "off" );
    setdvarifuninitialized( @"hash_9627c73338f91622", "off" );
    setdvarifuninitialized( @"hash_3cb0b3f110a54cf2", "csv" );
    setdvarifuninitialized( @"hash_ef12a290c14c553f", "off" );
    anim.bcprintfailprefix = "^1***** BCS FAILURE: ";
    anim.bcprintwarnprefix = "^3***** BCS WARNING: ";
    battlechatter_events::event_init();
    function_e4b05c2557b90c3e();
    function_9e01c01a8c874beb();
    
    if ( getprojectname() == "T10" )
    {
        function_18c45c9c1dafc921();
    }
    else if ( getprojectname() == "JUP" )
    {
        function_6fe2c52868802607();
    }
    
    if ( isdefined( level.var_2455b11118b14695 ) )
    {
        [[ level.var_2455b11118b14695 ]]();
    }
    
    addloopstate( "idle", &battlechatter_events::function_c1dca3ae9b4dd47e );
    addloopstate( "investigate", &battlechatter_events::function_69a7d2c4525e307d );
    addloopstate( "hunt", &battlechatter_events::function_8b75abd29a184ebf );
    addloopstate( "combat", &battlechatter_events::function_66fb0aa6e7887b38 );
    setchatterdelay( "default", level.battlechatteroverrides.idlemindelay, level.battlechatteroverrides.idlemaxdelay );
    setchatterdelay( "idle", level.battlechatteroverrides.idlemindelay, level.battlechatteroverrides.idlemaxdelay );
    setchatterdelay( "hunt", level.battlechatteroverrides.huntmindelay, level.battlechatteroverrides.huntmaxdelay );
    setchatterdelay( "combat", level.battlechatteroverrides.combatmindelay, level.battlechatteroverrides.combatmaxdelay );
    addeventfunc( "announce", &battlechatter_events::announceevent );
    addeventfunc( "return_to_idle", &battlechatter_events::function_6cc3a5d13a9ed019 );
    addeventfunc( "enter_hunt", &battlechatter_events::function_60a8c67006abef53 );
    addeventfunc( "join_combat", &battlechatter_events::joincombatevent );
    addeventfunc( "enter_combat", &battlechatter_events::entercombatevent );
    addeventfunc( "red_alert", &battlechatter_events::function_11bba4f1dd5d04d7 );
    
    foreach ( deck in level.battlechatter.events )
    {
        deck utility::deck_shuffle();
    }
    
    if ( !isdefined( level.bcs_mindist ) )
    {
        level.bcs_mindist = 200;
    }
    
    if ( !isdefined( level.var_deceff995bc40063 ) )
    {
        level.var_deceff995bc40063 = squared( level.bcs_mindist );
    }
    
    if ( !isdefined( level.bcs_neardist ) )
    {
        level.bcs_neardist = 650;
    }
    
    if ( !isdefined( level.var_822444fd128d6523 ) )
    {
        level.var_822444fd128d6523 = squared( level.bcs_neardist );
    }
    
    if ( !isdefined( level.var_d9e54908db3a5ba3 ) )
    {
        level.var_d9e54908db3a5ba3 = 850;
    }
    
    if ( !isdefined( level.var_38a0031c43023615 ) )
    {
        level.var_38a0031c43023615 = squared( level.var_d9e54908db3a5ba3 );
    }
    
    if ( !isdefined( level.bcs_fardist ) )
    {
        level.bcs_fardist = 1400;
    }
    
    if ( !isdefined( level.var_abf4710b2183b7ee ) )
    {
        level.var_abf4710b2183b7ee = squared( level.bcs_fardist );
    }
    
    setsaveddvar( @"hash_ab202f8049b3210a", level.bcs_fardist );
    
    if ( !isdefined( level.bcs_maxdist ) )
    {
        level.bcs_maxdist = 2000;
    }
    
    if ( !isdefined( level.bcs_maxdistsqrd ) )
    {
        level.bcs_maxdistsqrd = squared( level.bcs_maxdist );
    }
    
    if ( !isdefined( level.var_b0ea930c0b776ea ) )
    {
        level.var_b0ea930c0b776ea = 300;
    }
    
    if ( !isdefined( level.var_1d73f5d7bc63e580 ) )
    {
        level.var_1d73f5d7bc63e580 = squared( level.var_b0ea930c0b776ea );
    }
    
    if ( !isdefined( level.var_310b9df621efc830 ) )
    {
        level.var_310b9df621efc830 = 590;
    }
    
    if ( !isdefined( level.var_26a599e8b70f7e2e ) )
    {
        level.var_26a599e8b70f7e2e = squared( level.var_310b9df621efc830 );
    }
    
    if ( !isdefined( level.var_a10c1a92d596bcd7 ) )
    {
        level.var_a10c1a92d596bcd7 = level.bcs_neardist;
    }
    
    if ( !isdefined( level.var_40957c5b94fc5b91 ) )
    {
        level.var_40957c5b94fc5b91 = squared( level.var_a10c1a92d596bcd7 );
    }
    
    if ( !isdefined( level.var_94db8a156aebbf80 ) )
    {
        level.var_94db8a156aebbf80 = 360;
    }
    
    if ( !isdefined( level.var_99abab0c8b7b991e ) )
    {
        level.var_99abab0c8b7b991e = squared( level.var_94db8a156aebbf80 );
    }
    
    if ( !isdefined( level.var_1944a83fd1835aa9 ) )
    {
        level.var_1944a83fd1835aa9 = 650;
    }
    
    if ( !isdefined( level.var_2669df2a353bf04b ) )
    {
        level.var_2669df2a353bf04b = squared( level.var_1944a83fd1835aa9 );
    }
    
    if ( !isdefined( level.var_79b689f7a1d9a2c ) )
    {
        level.var_79b689f7a1d9a2c = 120;
    }
    
    level.var_a99c5a25405545fc = 10;
    
    if ( isdefined( anim.squads ) )
    {
        foreach ( squad in anim.squads )
        {
            squad init_squadbattlechatter();
        }
    }
    
    anim.squadcreatefunc = &init_squadbattlechatter;
    
    if ( !isdefined( anim.bcs_locations ) )
    {
        function_8ea2174cb22cb502();
    }
    
    namespace_326cae52b2158981::bcs_setup_countryids();
    
    /#
        thread function_1885b87626c9fc2a();
    #/
    
    level thread bcs_loop();
    level thread bcs_waittill();
}

// Namespace battlechatter
// Params 0, eflags: 0x4
// Checksum 0x2b538658, Offset: 0x1c9d
// Size: 0x40e
function private function_5badabdd0907701d()
{
    while ( true )
    {
        level waittill( "bc_notify", data_array );
        
        foreach ( data in data_array )
        {
            if ( !( isdefined( data.entity ) && isdefined( data.category ) ) )
            {
                continue;
            }
            
            if ( data.category == "nothing" )
            {
                continue;
            }
            
            var_3aec0c6defed4e13 = [ data.entity ];
            
            if ( isendstr( data.category, "radio" ) )
            {
                var_3aec0c6defed4e13[ var_3aec0c6defed4e13.size ] = data.entity;
            }
            else if ( isdefined( data.otherentity ) )
            {
                var_3aec0c6defed4e13[ var_3aec0c6defed4e13.size ] = data.otherentity;
            }
            
            conversation = function_833d9fb17742b565( data.category, var_3aec0c6defed4e13 );
            dlog_recordevent( "dlog_event_bc_tree_conversation", [ "conversation", data.category, "conversation_defined", isdefined( conversation ), "agent_1_entity_number", data.entity getentitynumber(), "agent_2_entity_number", isdefined( data.otherentity ) ? data.otherentity getentitynumber() : 0, "agent_1_origin_x", data.entity.origin[ 0 ], "agent_1_origin_y", data.entity.origin[ 1 ], "agent_1_origin_z", data.entity.origin[ 2 ], "agent_2_origin_x", data.otherentity.origin[ 0 ] ?? 0, "agent_2_origin_y", data.otherentity.origin[ 1 ] ?? 0, "agent_2_origin_z", data.otherentity.origin[ 2 ] ?? 0 ] );
            
            if ( conversation )
            {
                data.entity.conversation = conversation;
                
                if ( data.otherentity )
                {
                    data.otherentity.conversation = conversation;
                }
            }
            
            /#
                foreach ( entity in isdefined( data.otherentity ) ? [ data.entity, data.otherentity ] : [ data.entity ] )
                {
                    entity debug_say( data.category, ( 0, 0, 1 ) );
                }
                
                if ( getdvarint( @"hash_405ab2103bec04b0", 0 ) == 1 && isdefined( data.otherentity ) )
                {
                    level thread debug::line( data.entity, data.otherentity, ( 1, 1, 1 ), 5 );
                }
            #/
        }
    }
}

// Namespace battlechatter
// Params 1
// Checksum 0x72ea2bca, Offset: 0x20b3
// Size: 0x20
function clear_flag( flag )
{
    self notify( "SetBattlechatterFlag " + flag );
    self setbattlechatterflag( flag, 0 );
}

/#

    // Namespace battlechatter
    // Params 2, eflags: 0x4
    // Checksum 0xfe1310e4, Offset: 0x20db
    // Size: 0xaf, Type: dev
    function private debug_say( thing, color )
    {
        if ( !isdefined( color ) )
        {
            color = ( 1, 1, 1 );
        }
        
        if ( getdvarint( @"hash_405ab2103bec04b0", 0 ) == 1 )
        {
            if ( !isdefined( self.debugoffset ) )
            {
                self.debugoffset = 0;
            }
            
            print3d( self.origin + ( 0, 0, 80 + 15 * self.debugoffset ), self.debugoffset + "<dev string:x24>" + thing, color, 1, 1, 400, 1 );
            self.debugoffset = ( self.debugoffset + 1 ) % 10;
        }
    }

#/

// Namespace battlechatter
// Params 1, eflags: 0x4
// Checksum 0x576beb5d, Offset: 0x2192
// Size: 0x10f
function private ondamaged( params )
{
    if ( isagent( params.eattacker ) || isactor( params.eattacker ) )
    {
        params.eattacker setbattlechatterflag( "damaged_enemy", 1, 3 );
    }
    
    if ( isagent( self ) )
    {
        self setbattlechatterflag( "damaged_recently", 1, 3 );
        
        if ( params.var_e978b810a3f209c4 > self.helmethealth )
        {
            if ( self.helmethealth > 0 )
            {
                self setbattlechatterflag( "hit_helmet", 1, 3 );
            }
            else if ( params.var_e978b810a3f209c4 > 0 )
            {
                self setbattlechatterflag( "broke_helmet", 1, 3 );
            }
        }
        
        if ( params.var_426913ab397d3d28 > self.armorhealth )
        {
            if ( self.armorhealth > 0 )
            {
                self setbattlechatterflag( "hit_armor", 1, 3 );
                return;
            }
            
            if ( params.var_426913ab397d3d28 > 0 )
            {
                self setbattlechatterflag( "broke_armor", 1, 3 );
            }
        }
    }
}

// Namespace battlechatter
// Params 1, eflags: 0x4
// Checksum 0x4f0a0bc3, Offset: 0x22a9
// Size: 0x151
function private onkilled( params )
{
    attacker = params.eattacker ?? params.attacker;
    
    if ( isagent( attacker ) || isactor( attacker ) )
    {
        attacker setbattlechatterflag( "killed_enemy", 1, 3 );
        
        if ( isagent( attacker.boss ) || isactor( attacker.boss ) )
        {
            attacker.boss setbattlechatterflag( "killed_enemy", 1, 3 );
        }
        
        foreach ( agent in utility::agentsnear( self.origin, 600 ) )
        {
            agent setbattlechatterflag( "near_killed_enemy", 1, 12 );
        }
    }
    
    if ( ( isagent( self ) || isactor( self ) ) && self.conversation )
    {
        function_82faa0d0c4b6397( self.conversation, 1 );
        self.conversation = undefined;
    }
}

// Namespace battlechatter
// Params 1, eflags: 0x4
// Checksum 0xdcbe84c2, Offset: 0x2402
// Size: 0x1f8
function private function_20c3b78415f5d631( params )
{
    foreach ( state, flag in [ 4:"from_unset", 3:"from_combat", "from_hunt", 1:"from_investigate", 0:"from_idle" ] )
    {
        self setbattlechatterflag( flag, params.fromstate == state );
    }
    
    if ( params.tostate == 3 )
    {
        self setbattlechatterflag( "out_of_combat_for_30_seconds", 0 );
    }
    else if ( params.tostate == 0 )
    {
        self setbattlechatterflag( "out_of_combat_for_30_seconds", 1 );
    }
    
    if ( params.tostate > params.fromstate && self.conversation )
    {
        function_82faa0d0c4b6397( self.conversation, 1 );
        self.conversation = undefined;
    }
    
    foreach ( combattype in [ "first_combat", "combat", "join_combat" ] )
    {
        self setbattlechatterflag( combattype, params.combattype == combattype );
    }
    
    if ( params.tostate == 3 )
    {
        return;
    }
    
    self endon( "stealth_state_change" );
    self endon( "death" );
    wait 30;
    self setbattlechatterflag( "out_of_combat_for_30_seconds", 1 );
}

// Namespace battlechatter
// Params 0, eflags: 0x4
// Checksum 0x21570439, Offset: 0x2602
// Size: 0x122e
function private function_9e01c01a8c874beb()
{
    level.battlechatter.settings[ "coverme" ] = [ 0.1, 1, 10 ];
    level.battlechatter.settings[ "coverfire" ] = [ 0.1, 1, 10 ];
    level.battlechatter.settings[ "lost_target" ] = [ 0, 2, 5 ];
    level.battlechatter.settings[ "cease_fire" ] = [ 0, 2, 5 ];
    level.battlechatter.settings[ "combat_hunt" ] = [ 0.9, 2, 5 ];
    level.battlechatter.settings[ "hunt" ] = [ 0.9, 2, 5 ];
    level.battlechatter.settings[ "reacquire_push_towards" ] = [ 0.4, 2, 10 ];
    level.battlechatter.settings[ "combat_unaware" ] = [ 0.9, 2, 5 ];
    level.battlechatter.settings[ "incoming_vehicle_response" ] = [ 0, 0, 20 ];
    level.battlechatter.settings[ "_interrupt" ] = [ 0.9, 0, 1 ];
    level.battlechatter.settings[ "aquired_target" ] = [ 0.5, 2, 15 ];
    level.battlechatter.settings[ "order_attack" ] = [ 0.6, 2, 15 ];
    level.battlechatter.settings[ "enemy_direction" ] = [ 0, 2, 15 ];
    level.battlechatter.settings[ "getting_cover" ] = [ 0.4, 2, 15 ];
    level.battlechatter.settings[ "enemy_getting_cover" ] = [ 0.4, 2, 15 ];
    level.battlechatter.settings[ "target_getting_cover" ] = [ 0.4, 2, 15 ];
    level.battlechatter.settings[ "ally_exposure" ] = [ 0, 1, 15 ];
    level.battlechatter.settings[ "combat_status" ] = [ 0, 1, 15 ];
    level.battlechatter.settings[ "enemy_weapon" ] = [ 0.3, 1, 15 ];
    level.battlechatter.settings[ "hostile_burst" ] = [ 0, 1, 20 ];
    level.battlechatter.settings[ "use_" ] = [ 0.2, 1, 10 ];
    level.battlechatter.settings[ "enemy_using_" ] = [ 0.3, 0.5, 10 ];
    level.battlechatter.settings[ "grenade_danger" ] = [ 0.8, 0.5, 10 ];
    level.battlechatter.settings[ "hurt_by_" ] = [ 0.8, 0.5, 10 ];
    level.battlechatter.settings[ "attacking" ] = [ 0.5, 1, 15 ];
    level.battlechatter.settings[ "enemy_reloading" ] = [ 0.6, 1, 10 ];
    level.battlechatter.settings[ "reloading" ] = [ 0.3, 1, 15 ];
    level.battlechatter.settings[ "ammo_status" ] = [ 0.1, 1, 15 ];
    level.battlechatter.settings[ "enemy_movement" ] = [ 0.3, 1, 15 ];
    level.battlechatter.settings[ "enemy_movement_moving" ] = [ 0.2, 1, 15 ];
    level.battlechatter.settings[ "enemy_movement_climbing_up" ] = [ 0.2, 1, 20 ];
    level.battlechatter.settings[ "enemy_movement_moving_up" ] = [ 0.2, 1, 20 ];
    level.battlechatter.settings[ "ally_movement" ] = [ 0, 1, 15 ];
    level.battlechatter.settings[ "killfirm" ] = [ 0, 2, 15 ];
    level.battlechatter.settings[ "player_killfirm" ] = [ 0, 2, 30 ];
    level.battlechatter.settings[ "casualties" ] = [ 0.3, 3, 15 ];
    level.battlechatter.settings[ "casualty" ] = [ 0.3, 2, 15 ];
    level.battlechatter.settings[ "friendlyfire" ] = [ 1, 0, 3 ];
    level.battlechatter.settings[ "idle_convo" ] = [ 0.3, 1, 60 ];
    level.battlechatter.settings[ "idle" ] = [ 0.2, 1, 60 ];
    level.battlechatter.settings[ "patrol_curious" ] = [ 0.3, 0, 15 ];
    level.battlechatter.settings[ "investigate_start" ] = [ 0.5, 2, 15 ];
    level.battlechatter.settings[ "investigate_pos_reached" ] = [ 0.5, 2, 15 ];
    level.battlechatter.settings[ "saw_corpse_1" ] = [ 0.6, 0, 10 ];
    level.battlechatter.settings[ "saw_corpse_2" ] = [ 0.6, 0, 10 ];
    level.battlechatter.settings[ "found_corpse" ] = [ 0.8, 1, 10 ];
    level.battlechatter.settings[ "found_corpse_1" ] = "found_corpse";
    level.battlechatter.settings[ "found_corpse_2" ] = "found_corpse";
    level.battlechatter.settings[ "found_corpse_3" ] = "found_corpse";
    level.battlechatter.settings[ "announce_" ] = [ 0.8, 1, 10 ];
    level.battlechatter.settings[ "return_to_idle" ] = [ 0.2, 2, 15 ];
    level.battlechatter.settings[ "returned_to_idle_pos" ] = [ 0.2, 2, 15 ];
    level.battlechatter.settings[ "enter_hunt_1" ] = [ 0.9, 0.5, 10 ];
    level.battlechatter.settings[ "enter_hunt_2" ] = "enter_hunt_1";
    level.battlechatter.settings[ "enter_hunt_3" ] = "enter_hunt_1";
    level.battlechatter.settings[ "enter_hunt_4" ] = "enter_hunt_1";
    level.battlechatter.settings[ "enter_hunt_5" ] = "enter_hunt_1";
    level.battlechatter.settings[ "enter_hunt_6" ] = "enter_hunt_1";
    level.battlechatter.settings[ "hunt_ask_found" ] = "enter_hunt_1";
    level.battlechatter.settings[ "hunt_solo" ] = "enter_hunt_1";
    level.battlechatter.settings[ "enter_hunt_followup" ] = "enter_hunt_1";
    level.battlechatter.settings[ "initial_combat" ] = [ 0.9, 0.5, 20 ];
    level.battlechatter.settings[ "initial_combat_2" ] = "initial_combat";
    level.battlechatter.settings[ "initial_combat_N" ] = "initial_combat";
    level.battlechatter.settings[ "initial_combat_nonshot_1" ] = "initial_combat";
    level.battlechatter.settings[ "initial_combat_nonshot_2" ] = "initial_combat";
    level.battlechatter.settings[ "initial_combat_nonshot_N" ] = "initial_combat";
    level.battlechatter.settings[ "comb_rs_saw_enemy_on_pos" ] = "initial_combat";
    level.battlechatter.settings[ "comb_rs_saw_enemy_out_pos" ] = "initial_combat";
    level.battlechatter.settings[ "comb_rs_saw_shot_but_enemy_hid" ] = "initial_combat";
    level.battlechatter.settings[ "comb_full_default" ] = "initial_combat";
    level.battlechatter.settings[ "comb_full_unaware_sniper" ] = "initial_combat";
    level.battlechatter.settings[ "comb_full_unaware_lmg" ] = "initial_combat";
    level.battlechatter.settings[ "comb_full_unaware_shotgun" ] = "initial_combat";
    level.battlechatter.settings[ "comb_full_aware_sniper" ] = "initial_combat";
    level.battlechatter.settings[ "comb_full_aware_lmg" ] = "initial_combat";
    level.battlechatter.settings[ "comb_full_aware_shotgun" ] = "initial_combat";
    level.battlechatter.settings[ "comb_fulld_didnt_see_shooting" ] = "initial_combat";
    level.battlechatter.settings[ "comb_fulld_enemy_open" ] = "initial_combat";
    level.battlechatter.settings[ "comb_fulld_enemy_cover" ] = "initial_combat";
    level.battlechatter.settings[ "comb_fulld_enemies_open" ] = "initial_combat";
    level.battlechatter.settings[ "comb_fulld_enemies_cover" ] = "initial_combat";
    level.battlechatter.settings[ "enter_combat" ] = [ 0.9, 0.5, 15 ];
    level.battlechatter.settings[ "join_combat" ] = [ 0.5, 3, 15 ];
    level.battlechatter.settings[ "losing_target_water" ] = [ 0, 2, 5 ];
    level.battlechatter.settings[ "losing_target" ] = [ 0.6, 2, 5 ];
    level.battlechatter.settings[ "status_report" ] = [ 0.1, 1, 35 ];
    level.battlechatter.settings[ "corpse_status_report" ] = [ 0, 1, 120 ];
    level.battlechatter.settings[ "red_alert_1" ] = [ 1, 5, 10 ];
    level.battlechatter.settings[ "red_alert_N" ] = "red_alert_1";
    level.battlechatter.settings[ "react_first_combat" ] = [ 0.9, 0.5, 20 ];
    level.battlechatter.settings[ "flanked_1" ] = [ 1, 0, 5 ];
    level.battlechatter.settings[ "flanked_N" ] = "flanked_1";
    level.battlechatter.settings[ "enemy_sighted_1" ] = [ 0.9, 0, 5 ];
    level.battlechatter.settings[ "enemy_sighted_N" ] = "enemy_sighted_1";
    level.battlechatter.settings[ "target_wounded" ] = [ 0.2, 1, 15 ];
    level.battlechatter.settings[ "target_unhurt" ] = [ 0.2, 1, 15 ];
    level.battlechatter.settings[ "wounded" ] = [ 0.2, 1, 15 ];
    level.battlechatter.settings[ "cover_destroyed" ] = [ 0.5, 0, 10 ];
    var_4261db766ae013d6 = getdvarint( @"hash_2e9b4d77df5b8514" ) * 0.001;
    level.battlechatter.settings[ "lost_target_elapsed_1" ] = [ 0.6, 0.5, var_4261db766ae013d6 ];
    level.battlechatter.settings[ "lost_target_elapsed_2" ] = [ 0.6, 0.5, var_4261db766ae013d6 ];
    level.battlechatter.settings[ "hunt_initial" ] = [ 0.9, 0.5, 10 ];
    level.battlechatter.settings[ "hunt_solo_enter" ] = "hunt_initial";
    level.battlechatter.settings[ "hunt_solo_loop" ] = "hunt_initial";
    level.battlechatter.settings[ "hunt_duo_enter" ] = "hunt_initial";
    level.battlechatter.settings[ "hunt_duo_loop_near" ] = "hunt_initial";
    level.battlechatter.settings[ "hunt_duo_loop_far_1" ] = "hunt_initial";
    level.battlechatter.settings[ "hunt_duo_loop_far_2" ] = "hunt_initial";
    level.battlechatter.settings[ "semtex_stuck" ] = [ 0.9, 0.5, 10 ];
    level.battlechatter.settings[ "react_player" ] = [ 0.5, 0.2, 12 ];
    level.battlechatter.settings[ "deploy_equipment" ] = [ 0.8, 0.2, 12 ];
}

// Namespace battlechatter
// Params 0, eflags: 0x4
// Checksum 0x80847211, Offset: 0x3838
// Size: 0x2e
function private function_6fe2c52868802607()
{
    level.battlechatter.settings[ "investigate_loop" ] = [ 0, 2, 5 ];
}

// Namespace battlechatter
// Params 0, eflags: 0x4
// Checksum 0xe51da947, Offset: 0x386e
// Size: 0x5fc
function private function_18c45c9c1dafc921()
{
    level.battlechatter.settings[ "killfirm" ] = [ 0, 2, 20 ];
    level.battlechatter.settings[ "enemy_using_rpg" ] = [ 0.3, 0.5, 30 ];
    level.battlechatter.settings[ "enemy_sniper" ] = [ 0.3, 0.5, 30 ];
    level.battlechatter.settings[ "target_wounded" ] = [ 0.2, 1, 60 ];
    level.battlechatter.settings[ "target_unhurt" ] = [ 0.2, 1, 60 ];
    level.battlechatter.settings[ "wounded" ] = [ 0.2, 1, 60 ];
    level.battlechatter.settings[ "aquired_target" ] = [ 0.5, 2, 60 ];
    level.battlechatter.settings[ "ally_movement" ] = [ 0, 1, 60 ];
    level.battlechatter.settings[ "order_attack" ] = [ 0.5, 1, 60 ];
    level.battlechatter.settings[ "enemy_reloading" ] = [ 0.6, 1, 30 ];
    level.battlechatter.settings[ "attacking" ] = [ 0.5, 1, 30 ];
    level.battlechatter.settings[ "reloading" ] = [ 0.3, 1, 30 ];
    level.battlechatter.settings[ "ammo_status" ] = [ 0.1, 1, 30 ];
    level.battlechatter.settings[ "enemy_movement" ] = [ 0.3, 1, 30 ];
    level.battlechatter.settings[ "enemy_movement_moving" ] = [ 0.2, 1, 30 ];
    level.battlechatter.settings[ "ally_movement" ] = [ 0, 1, 30 ];
    level.battlechatter.settings[ "enemy_movement_climbing_up" ] = [ 0.2, 1, 40 ];
    level.battlechatter.settings[ "enemy_movement_moving_up" ] = [ 0.2, 1, 40 ];
    level.battlechatter.settings[ "investigate_loop" ] = [ 0, 2, 5 ];
    level.battlechatter.settings[ "ae_entered_area" ] = [ 0.85, 5, 6 ];
    level.battlechatter.settings[ "ae_entered_area_personal" ] = [ 0.8, 5, 6 ];
    level.battlechatter.settings[ "ae_thrown_out" ] = [ 0.5, 0.4, 8 ];
    level.battlechatter.settings[ "ae_special_success" ] = [ 0.3, 0.4, 8 ];
    level.battlechatter.settings[ "ae_grunt_pickup_armor" ] = [ 0.3, 0.4, 6 ];
    level.battlechatter.settings[ "ae_request_armor" ] = [ 0.3, 0.4, 6 ];
    level.battlechatter.settings[ "ae_charge_gas" ] = [ 0.5, 0.2, 6 ];
    level.battlechatter.settings[ "ae_flavor" ] = [ 0, 0.2, 10 ];
    level.battlechatter.settings[ "ae_dm_spinup" ] = [ 0.1, 0.2, 10 ];
    level.battlechatter.settings[ "ae_general" ] = [ 0.1, 0.2, 6 ];
    level.battlechatter.settings[ "ae_dm_close" ] = "ae_general";
    level.battlechatter.settings[ "ae_riotshield_block" ] = "ae_general";
    level.battlechatter.settings[ "ae_seeker_close" ] = "ae_general";
    level.battlechatter.settings[ "ae_seeker_shot_player" ] = "ae_general";
}

// Namespace battlechatter
// Params 0
// Checksum 0xf23d99b2, Offset: 0x3e72
// Size: 0x1e9
function bcs_waittill()
{
    level endon( "battlechatter disabled" );
    
    while ( true )
    {
        level waittill( "bc_notify", data_array );
        
        foreach ( data in data_array )
        {
            if ( !( isdefined( data.entity ) && isdefined( data.category ) ) )
            {
                continue;
            }
            
            /#
                if ( getdvarint( @"hash_350b154807f4d745" ) )
                {
                    if ( isdefined( data.subcategory ) && data.category != data.subcategory )
                    {
                        text = data.category + "<dev string:x2a>" + data.subcategory;
                    }
                    else
                    {
                        text = data.category;
                    }
                    
                    if ( utility::issharedfuncdefined( #"stealth_debug", #"hash_443faf8f48737297" ) )
                    {
                        data.entity thread [[ utility::getsharedfunc( #"stealth_debug", #"hash_443faf8f48737297" ) ]]( "<dev string:x31>" + data.category, ( 0, 1, 0 ), 1, 0.5, ( 0, 0, 40 ), 5 );
                    }
                }
            #/
            
            notifyhandled = function_df70a19285f4de71( data );
            
            if ( !notifyhandled && chatterallowed( data.entity, 1, data.category ) )
            {
                notifyhandled = function_321d2815afe991f5( data );
            }
            
            /#
                function_4c3d5af8f9c8b650( data, notifyhandled );
            #/
        }
    }
}

// Namespace battlechatter
// Params 1
// Checksum 0xd0e09aa2, Offset: 0x4063
// Size: 0x698
function function_321d2815afe991f5( data )
{
    assert( isdefined( data ) );
    assert( isdefined( data.entity ) );
    assert( isdefined( data.category ) );
    
    if ( data.entity executeevent( data.category, data.params ) )
    {
        return 1;
    }
    
    switch ( data.category )
    {
        case #"hash_4c8ad9f2942ea5b":
            data.entity thread bcs_statechange( data );
            break;
        case #"hash_1044d327487d801a":
        case #"hash_184bba7053cc1c15":
        case #"hash_20cd76d83c2f7487":
            if ( getprojectname() == "T10" )
            {
                if ( !data.entity check_cooldown( "ally_movement" ) )
                {
                    return 0;
                }
            }
            
            data.entity clear_cooldown( "ally_movement" );
            data.entity thread battlechatter_events::moveevent();
            break;
        case #"hash_d6c61718f24df768":
            data.entity thread battlechatter_events::targetmoveevent( data.otherentity, data.subcategory );
            break;
        case #"hash_5a5c93f2debb75c":
            data.entity thread battlechatter_events::initialcombatevent( data.params[ 1 ], data.params[ 2 ] );
            break;
        case #"hash_3ee703de5a8989c6":
            data.entity thread battlechatter_events::firstcombatevent();
            break;
        case #"hash_eeed4ce2a5de2aa5":
            if ( data.subcategory == "losing_target" )
            {
                data.entity thread battlechatter_events::function_4cac457f943a8c93( data.otherentity );
            }
            else if ( data.subcategory == "lost_target" )
            {
                data.entity function_8e55175c05f5c74c( "lost_target", "ask_target_location" );
            }
            else if ( data.subcategory == "cease_fire" )
            {
                data.entity function_8e55175c05f5c74c( "cease_fire", "hunt_order_hold" );
            }
            else if ( data.subcategory == "lost_target_elapsed" )
            {
                data.entity thread battlechatter_events::function_afa3372bcb718c00( data.otherentity );
            }
            
            break;
        case #"hash_37bb23543c319104":
            if ( data.subcategory == "hunt" )
            {
                data.entity thread battlechatter_events::function_2a54054a9b4db4f9();
            }
            
            break;
        case #"hash_bb388ae078895394":
            data.entity thread battlechatter_events::function_47f346f1883ddebb();
            break;
        case #"hash_3f894d6ee31df868":
            if ( data.subcategory == "combat_unaware" )
            {
                data.entity function_8e55175c05f5c74c( "combat_unaware", "hunt_reactions" );
            }
            
            break;
        case #"hash_1fe1f9ada345556c":
            if ( data.subcategory == "investigateposreached" )
            {
                if ( isdefined( data.params[ 2 ] ) && data.params[ 2 ] == "saw_corpse" )
                {
                    return;
                }
                
                data.entity thread battlechatter_events::function_40f23048eea1f156();
            }
            
            break;
        case #"hash_1879579c479117e0":
            if ( data.subcategory == "dodge_vehicle_start" )
            {
                data.entity function_8e55175c05f5c74c( "incoming_vehicle_response", utility::random( [ "hunt_reactions", "cmb_reactions" ] ) );
            }
            
            break;
        case #"hash_124fc72bb55490ec":
            data.entity thread battlechatter_events::reloadevent();
            break;
        case #"hash_ecb83a34dd571174":
            data.entity thread battlechatter_events::moveevent( data.subcategory );
            break;
        case #"hash_661532715a742ebf":
            data.entity thread battlechatter_events::friendlyfireevent();
            break;
        case #"hash_58018e5cda140b2d":
            data.entity thread battlechatter_events::function_8e395f0842773dd3();
            break;
        case #"hash_c718a89b94ffdc2":
            data.entity thread battlechatter_events::function_64413ad08f9e3672();
            break;
        case #"hash_2d1406e602f0875d":
            data.entity thread battlechatter_events::attackevent();
            data.entity thread battlechatter_events::function_d287030420cc6ee2();
            break;
        case #"hash_ab2e692ee80521f8":
            data.entity thread battlechatter_events::burnevent( data.subcategory );
            break;
        case #"hash_8f9bb78729a54b2c":
        case #"hash_fbd5bcbb1cbe3154":
            data.entity thread battlechatter_events::function_4790a4ccd4fe3746( data.otherentity );
            break;
        case #"hash_a0721fe4fd9580f5":
            data.entity thread battlechatter_events::shootevent( data.subcategory );
            break;
        case #"hash_57203b1e53d3a619":
            if ( isalive( data.entity ) )
            {
                data.entity function_8e55175c05f5c74c( "wounded", "wounded" );
            }
            
            break;
        case #"hash_7a09a268a01b5f84":
            data.entity thread battlechatter_events::function_745bf8f1071be2bc();
            break;
        case #"hash_affe6c9db8e997d3":
            data.entity thread battlechatter_events::function_2fb3a283d2aa9e1f();
            data.entity thread battlechatter_events::function_98586cfd4d082843();
            break;
        case #"hash_278c7959b357bf3e":
            data.entity thread battlechatter_events::function_136b9fca48877622();
            break;
        case #"hash_2be091d2ce1d5a7d":
            data.entity battlechatter_events::curiousevent( data.params[ 0 ], data.otherentity );
            break;
        case #"hash_114684693ab64de4":
            data.entity thread battlechatter_events::function_cb74fea047bccaf8( data.subcategory );
            break;
        case #"hash_437da1cbb8837b5d":
            data.entity thread battlechatter_events::function_4985ccd0c0d55ef3( data.subcategory );
            break;
        default:
            return 0;
    }
    
    return 1;
}

// Namespace battlechatter
// Params 1
// Checksum 0x1a4d0772, Offset: 0x4704
// Size: 0xee, Type: bool
function function_df70a19285f4de71( data )
{
    assert( isdefined( data ) );
    assert( isdefined( data.entity ) );
    assert( isdefined( data.category ) );
    
    switch ( data.category )
    {
        case #"hash_631f416c3d8360d4":
            data.entity thread battlechatter_events::useevent( data.subcategory, utility::cointoss() );
            break;
        case #"hash_12cb1aa4c57395":
            data.entity thread battlechatter_events::grenadedangerevent( data.otherentity );
            break;
        case #"hash_9a35360cb2dc98e6":
            data.entity thread battlechatter_events::useevent( data.subcategory, 1 );
            break;
        default:
            return false;
    }
    
    return true;
}

// Namespace battlechatter
// Params 1
// Checksum 0xc2b5d19e, Offset: 0x47fb
// Size: 0x135
function bcs_statechange( data )
{
    previousstate = data.params[ 0 ];
    currentstate = data.params[ 1 ];
    ai_event = data.params[ 2 ];
    var_ad9711912754c77e = function_e02d101943406091( data.otherentity );
    
    if ( previousstate == 4 )
    {
        return;
    }
    
    if ( previousstate == currentstate )
    {
        return;
    }
    
    self notify( "bcs_stateChange", previousstate, currentstate );
    
    switch ( currentstate )
    {
        case 0:
            return battlechatter_events::function_6cc3a5d13a9ed019( previousstate );
        case 1:
            if ( var_ad9711912754c77e )
            {
                return battlechatter_events::function_3e0ffbbb5ac53efe();
            }
            else
            {
                return battlechatter_events::enterinvestigateevent( ai_event );
            }
        case 2:
            return battlechatter_events::function_60a8c67006abef53();
        case 3:
            battlechatter_events::function_cd57bb745df5f738();
            
            if ( previousstate <= 2 )
            {
                self.var_8ce29ad1168f36c5 = gettime();
            }
            
            if ( previousstate < 2 )
            {
                if ( var_ad9711912754c77e )
                {
                    return battlechatter_events::function_554ecda4a99dea75();
                }
                else
                {
                    return battlechatter_events::function_59b6754d05797405( previousstate, ai_event );
                }
            }
            else
            {
                return battlechatter_events::entercombatevent();
            }
            
            break;
    }
}

// Namespace battlechatter
// Params 1
// Checksum 0x6d9a01af, Offset: 0x4938
// Size: 0x2e
function function_c466723bbd1d42d( dist )
{
    level.bcs_maxdist = 2048;
    level.bcs_maxdistsqrd = squared( level.bcs_maxdist );
}

// Namespace battlechatter
// Params 1
// Checksum 0x9f1eacce, Offset: 0x496e
// Size: 0x17
function init_battlechatteroverrides( overrides )
{
    level.battlechatteroverrides = overrides;
}

// Namespace battlechatter
// Params 0
// Checksum 0x93e7fe11, Offset: 0x498d
// Size: 0xa2
function function_e4b05c2557b90c3e()
{
    if ( !isdefined( level.battlechatteroverrides ) )
    {
        level.battlechatteroverrides = spawnstruct();
        level.battlechatteroverrides.idlemindelay = 10;
        level.battlechatteroverrides.idlemaxdelay = 16;
        level.battlechatteroverrides.huntmindelay = 4;
        level.battlechatteroverrides.huntmaxdelay = 12;
        level.battlechatteroverrides.combatmindelay = 1;
        level.battlechatteroverrides.combatmaxdelay = 2;
        return;
    }
}

// Namespace battlechatter
// Params 0
// Checksum 0x46ab5489, Offset: 0x4a37
// Size: 0x26
function init_squadbattlechatter()
{
    squad = self;
    squad.chatinitialized = 1;
    squad notify( "squad chat initialized" );
}

// Namespace battlechatter
// Params 0
// Checksum 0xa41800a, Offset: 0x4a65
// Size: 0xc, Type: bool
function bcsenabled()
{
    return isdefined( level.battlechatter );
}

// Namespace battlechatter
// Params 6
// Checksum 0xc51bf6b5, Offset: 0x4a7a
// Size: 0xe6
function bcs_setup_voice( voice, countryid, numvoices, var_24271cf266aff0bf, combatmapid, stealthmapid )
{
    if ( !isdefined( var_24271cf266aff0bf ) )
    {
        var_24271cf266aff0bf = 0;
    }
    
    anim.usedids[ voice ] = [];
    
    for ( i = 0; i < numvoices ; i++ )
    {
        anim.usedids[ voice ][ i ] = spawnstruct();
        anim.usedids[ voice ][ i ].count = 0;
        anim.usedids[ voice ][ i ].npcid = "" + i + 1;
    }
    
    anim.countryids[ voice ] = countryid;
    anim.var_4ef5299ac30c33e6[ countryid ] = combatmapid;
    anim.var_c285202ed79ffced[ countryid ] = stealthmapid;
}

// Namespace battlechatter
// Params 0
// Checksum 0x2da32ef0, Offset: 0x4b68
// Size: 0x125
function function_8ea2174cb22cb502()
{
    assert( !isdefined( anim.bcs_locations ) );
    triggers = getentarray( "trigger_multiple", #code_classname );
    location_triggers = [];
    
    foreach ( trigger in triggers )
    {
        if ( !issubstr( trigger.classname, "trigger_multiple_bcs" ) )
        {
            continue;
        }
        
        location_triggers[ location_triggers.size ] = trigger;
        trigger.location = getsubstr( trigger.classname, 24, trigger.classname.size );
        
        if ( trigger.spawnflags & 1 )
        {
            trigger.islandmark = 1;
        }
    }
    
    level.battlechatter.location_triggers = location_triggers;
}

// Namespace battlechatter
// Params 0
// Checksum 0x30199cf7, Offset: 0x4c95
// Size: 0x14
function shutdown_battlechatter()
{
    level.battlechatter = undefined;
    level notify( "battlechatter disabled" );
}

// Namespace battlechatter
// Params 0
// Checksum 0x3dcba2c0, Offset: 0x4cb1
// Size: 0xc7
function bcs_loop()
{
    level endon( "battlechatter disabled" );
    wait 1;
    
    for ( ;; )
    {
        if ( !isdefined( level.players ) || level.players.size < 1 )
        {
        }
        else
        {
            players = level.players;
            var_f4ef5b0da10c23ca = throttle::function_f60fd6b686168f09( "bscProcessPlayer", 2 );
            
            for ( p = 0; p < players.size ; p++ )
            {
                player = players[ p ];
                
                if ( !isalive( player ) || !isdefined( player.origin ) )
                {
                    continue;
                }
                
                if ( player.bcs_isprocessing )
                {
                    continue;
                }
                
                player thread function_b5f83d119f8258e5();
                throttle::function_793863e476bf1524( var_f4ef5b0da10c23ca );
            }
        }
        
        waitframe();
    }
}

// Namespace battlechatter
// Params 0
// Checksum 0x8a31bd13, Offset: 0x4d80
// Size: 0x293
function function_b5f83d119f8258e5()
{
    self endon( "death_or_disconnect" );
    
    if ( !self.bcs_init )
    {
        thread bcs_initplayer();
        self.bcs_init = 1;
    }
    
    nearby_ai = getaiinrange( self.origin, level.var_d9e54908db3a5ba3 );
    
    if ( nearby_ai.size <= 0 )
    {
        return;
    }
    
    self.bcs_isprocessing = 1;
    nearby_ai = sortbydistance( nearby_ai, self.origin );
    count = min( nearby_ai.size, 10 );
    
    for ( i = 0; i < count ; i++ )
    {
        waitframe();
        count_ratio = ( i + 1 ) / count;
        
        if ( utility::percent_chance( ( 1 - count_ratio ) * 15 ) )
        {
            continue;
        }
        
        guy = nearby_ai[ i ];
        
        if ( !isalive( guy ) || !isdefined( guy.battlechatter ) || guy.battlechatter.executingloop )
        {
            continue;
        }
        
        team = guy.team;
        origin = guy.origin;
        
        if ( !( isdefined( team ) && isdefined( origin ) ) || team == "neutral" )
        {
            continue;
        }
        
        if ( gettime() < guy.battlechatter.nextlooptime )
        {
            /#
                if ( getdvarint( @"hash_44ef18550505e010" ) )
                {
                    print3d( origin + ( 0, 0, 80 ), "<dev string:x3a>", ( 1, 1, 1 ), 1, 0.3, 1, 1 );
                }
            #/
            
            continue;
        }
        
        state = guy getcombatstate();
        
        if ( !isdefined( state ) )
        {
            continue;
        }
        
        if ( state == "dead" )
        {
            continue;
        }
        
        if ( state == "combat" && guy function_3146b0fcae68998f() )
        {
            continue;
        }
        
        /#
            if ( getdvarint( @"hash_44ef18550505e010" ) )
            {
                function_d2b2c63c412fae( "<dev string:x4f>" + "<dev string:x58>" + state + "<dev string:x66>" + "<dev string:x6f>" );
                print3d( origin + ( 0, 0, 100 ), "<dev string:x78>", ( 1, 1, 1 ), 1, 0.3, 20, 1 );
            }
        #/
        
        guy thread executeloopstate( state );
        
        if ( utility::issp() )
        {
            guy function_6240e9af090bfb1();
        }
        else
        {
            guy function_4af9773d268acf12();
        }
        
        break;
    }
    
    self.bcs_isprocessing = 0;
}

// Namespace battlechatter
// Params 1
// Checksum 0x3c053b9a, Offset: 0x501b
// Size: 0x2f, Type: bool
function function_1d3591529c0364a9( var_30c44076b011eecc )
{
    return isstring( var_30c44076b011eecc ) && arraycontains( [ "frag_grenade", "semtex" ], var_30c44076b011eecc );
}

// Namespace battlechatter
// Params 0
// Checksum 0x8ec47988, Offset: 0x5053
// Size: 0x2f
function bcs_initplayer()
{
    self endon( "death" );
    self notify( "bcs_initPlayer" );
    self endon( "bcs_initPlayer" );
    childthread function_d9f87bceb3f6d07c();
    childthread function_8f242cbb1c70bdc6();
    childthread function_4f4f1017a3d6750();
}

// Namespace battlechatter
// Params 0
// Checksum 0x37d4e0c5, Offset: 0x508a
// Size: 0x3e
function function_d9f87bceb3f6d07c()
{
    self endon( "disconnect" );
    
    while ( true )
    {
        self waittill( "weapon_fired", weapon );
        self.last_weapon_fired_time = gettime();
        self.last_weapon_fired = weapon;
    }
}

// Namespace battlechatter
// Params 0
// Checksum 0xc1bbd721, Offset: 0x50d0
// Size: 0x74
function function_8f242cbb1c70bdc6()
{
    while ( true )
    {
        self waittill( "grenade_fire", grenade );
        
        if ( isdefined( grenade.weapon_object ) )
        {
            bcs_subcategory = battlechatter_events::function_e08b029c30762ab3( grenade.weapon_object );
            
            if ( isdefined( bcs_subcategory ) )
            {
                function_98ae1f41148cc661( self, undefined, "grenade_throw", bcs_subcategory );
                
                if ( function_1d3591529c0364a9( bcs_subcategory ) )
                {
                    function_98ae1f41148cc661( self, grenade, "grenade_danger" );
                }
            }
        }
    }
}

// Namespace battlechatter
// Params 0
// Checksum 0xd544005f, Offset: 0x514c
// Size: 0x4e
function function_4f4f1017a3d6750()
{
    while ( true )
    {
        self waittill( "missile_fire", missile, objweapon );
        bcs_subcategory = battlechatter_events::function_e08b029c30762ab3( objweapon );
        
        if ( isdefined( bcs_subcategory ) )
        {
            function_98ae1f41148cc661( self, undefined, "use", bcs_subcategory );
        }
    }
}

/#

    // Namespace battlechatter
    // Params 0
    // Checksum 0xbf565519, Offset: 0x51a2
    // Size: 0xb5, Type: dev
    function function_731b7eef54fdd8d2()
    {
        self endon( "<dev string:x85>" );
        self.var_731b7eef54fdd8d2 = 1;
        
        while ( isdefined( level.players[ 0 ] ) && isdefined( self.origin ) && isdefined( level.players[ 0 ].origin ) )
        {
            print3d( self.origin + ( 0, 0, 60 ), floor( distance( level.players[ 0 ].origin, self.origin ) ), ( 1, 1, 1 ), 1, 0.5, 1, 1 );
            waitframe();
        }
        
        self.var_731b7eef54fdd8d2 = undefined;
    }

#/

// Namespace battlechatter
// Params 2
// Checksum 0x71662505, Offset: 0x525f
// Size: 0xe6
function function_6240e9af090bfb1( seconds, shoulddisablecombat )
{
    if ( !isdefined( seconds ) )
    {
        seconds = function_8f6e6ce3c52b4136( getcombatstate() ) / 1000;
    }
    
    if ( !( isdefined( self.origin ) && isdefined( self.team ) ) )
    {
        return function_4af9773d268acf12( seconds, shoulddisablecombat );
    }
    
    foreach ( ai in getaiinrange( self.origin, level.bcs_neardist, self.team ) )
    {
        ai function_4af9773d268acf12( seconds, shoulddisablecombat );
    }
}

// Namespace battlechatter
// Params 2
// Checksum 0x81b4df21, Offset: 0x534d
// Size: 0x89
function function_4af9773d268acf12( seconds, shoulddisablecombat )
{
    if ( !isdefined( self.battlechatter ) )
    {
        return;
    }
    
    if ( !isdefined( seconds ) )
    {
        delay_ms = function_8f6e6ce3c52b4136( getcombatstate() );
    }
    else
    {
        delay_ms = seconds * 1000;
    }
    
    self.battlechatter.nextlooptime = gettime() + delay_ms;
    
    if ( shoulddisablecombat )
    {
        self.battlechatter.var_8568b6a2b1bdc9a2 = gettime() + delay_ms;
    }
}

// Namespace battlechatter
// Params 3
// Checksum 0xf7866b78, Offset: 0x53de
// Size: 0x79
function setchatterdelay( state, min_delay, max_delay )
{
    assert( isnumber( min_delay ), "<dev string:x8e>" );
    assert( isnumber( max_delay ), "<dev string:xac>" );
    assert( min_delay <= max_delay, "<dev string:xca>" );
    level.battlechatter.delays[ state ] = [ min_delay, max_delay ];
}

// Namespace battlechatter
// Params 1
// Checksum 0x31f3bbf6, Offset: 0x545f
// Size: 0x5f
function function_8f6e6ce3c52b4136( state )
{
    range = level.battlechatter.delays[ state ];
    
    if ( !isdefined( range ) )
    {
        range = level.battlechatter.delays[ "default" ];
    }
    
    return randomfloatrange( range[ 0 ], range[ 1 ] ) * 1000;
}

// Namespace battlechatter
// Params 2
// Checksum 0x6a228efb, Offset: 0x54c7
// Size: 0x58
function addloopstate( state, func )
{
    if ( !isdefined( level.battlechatter ) )
    {
        return;
    }
    
    assert( isdefined( level.battlechatter.states ) );
    level.battlechatter.states[ state ] = func;
}

// Namespace battlechatter
// Params 1
// Checksum 0xc01acfe8, Offset: 0x5527
// Size: 0xa3
function executeloopstate( state )
{
    self endon( "death" );
    
    if ( !isdefined( level.battlechatter ) )
    {
        return;
    }
    
    assert( isdefined( level.battlechatter.states ) );
    func = level.battlechatter.states[ state ];
    
    if ( !isdefined( func ) )
    {
        return;
    }
    
    self.battlechatter.executingloop = 1;
    result = self [[ func ]]();
    self.battlechatter.executingloop = undefined;
    return result;
}

// Namespace battlechatter
// Params 6
// Checksum 0xaa3400a4, Offset: 0x55d3
// Size: 0x116
function addevent( event_name, sequence, priority, timeout, cooldown, endons )
{
    if ( !isdefined( level.battlechatter.events[ event_name ] ) )
    {
        level.battlechatter.events[ event_name ] = utility::create_deck();
    }
    
    event = spawnstruct();
    event.sequence = sequence;
    event.priority = priority;
    event.timeout = timeout;
    event.cooldown = cooldown;
    event.endons = endons;
    index = level.battlechatter.events[ event_name ].items.size;
    level.battlechatter.events[ event_name ].items[ index ] = event;
}

// Namespace battlechatter
// Params 2
// Checksum 0x12938d0c, Offset: 0x56f1
// Size: 0x9e
function addeventfunc( event_name, func )
{
    if ( !isdefined( level.battlechatter.events[ event_name ] ) )
    {
        level.battlechatter.events[ event_name ] = utility::create_deck();
    }
    
    index = level.battlechatter.events[ event_name ].items.size;
    level.battlechatter.events[ event_name ].items[ index ] = func;
}

// Namespace battlechatter
// Params 2
// Checksum 0x4f3a42b9, Offset: 0x5797
// Size: 0x156
function removeevent( event_name, var_ff30c6ef2e28a78 )
{
    if ( !isdefined( level.battlechatter.events ) )
    {
        return;
    }
    
    if ( !isdefined( level.battlechatter.events[ event_name ] ) )
    {
        return;
    }
    
    new_items = [];
    
    foreach ( index, var_d0c4787c4209e80f in level.battlechatter.events[ event_name ].items )
    {
        if ( var_d0c4787c4209e80f == var_ff30c6ef2e28a78 )
        {
            if ( level.battlechatter.events[ event_name ].index > index )
            {
                level.battlechatter.events[ event_name ].index--;
            }
            
            continue;
        }
        
        new_items[ new_items.size ] = var_d0c4787c4209e80f;
    }
    
    level.battlechatter.events[ event_name ].items = new_items;
}

// Namespace battlechatter
// Params 2
// Checksum 0xb3086022, Offset: 0x58f5
// Size: 0xd1, Type: bool
function executeevent( event_name, params )
{
    if ( !chatterallowed( self ) )
    {
        return true;
    }
    
    if ( !isdefined( level.battlechatter.events[ event_name ] ) )
    {
        return false;
    }
    
    event = level.battlechatter.events[ event_name ] utility::deck_draw();
    
    if ( isarray( params ) )
    {
        params = function_5713d46873b29625( params );
    }
    
    if ( isfunction( event ) )
    {
        thread dialogue::call_with_params_script( event, params );
    }
    else
    {
        thread function_b63bed8df8e4202a( event_name, event.sequence, event.priority, event.timeout, event.cooldown, event.endons );
    }
    
    return true;
}

// Namespace battlechatter
// Params 0
// Checksum 0xb61ffde1, Offset: 0x59cf
// Size: 0x27
function getallteams()
{
    return [ "axis", "allies", "neutral", "team3" ];
}

// Namespace battlechatter
// Params 0
// Checksum 0x90cddeb, Offset: 0x59ff
// Size: 0x1e
function getcombatteams()
{
    return [ "axis", "allies", "team3" ];
}

// Namespace battlechatter
// Params 0
// Checksum 0xd86a50ee, Offset: 0x5a26
// Size: 0x15
function getenemyteams()
{
    return [ "axis", "team3" ];
}

// Namespace battlechatter
// Params 0
// Checksum 0x2bedf57f, Offset: 0x5a44
// Size: 0x15
function function_f124e89229d237d()
{
    return [ "allies", "neutral" ];
}

// Namespace battlechatter
// Params 6
// Checksum 0x1bf94786, Offset: 0x5a62
// Size: 0x5b
function function_b63bed8df8e4202a( var_add69db22c3e940e, sequence, priority, timeout, cooldown, endons )
{
    chatter = createchatter( var_add69db22c3e940e, sequence, priority, timeout, cooldown, endons );
    return playchatter( chatter );
}

// Namespace battlechatter
// Params 4
// Checksum 0x395b3dc5, Offset: 0x5ac6
// Size: 0x95
function function_8e55175c05f5c74c( var_add69db22c3e940e, sequence, var_981f7b2cc3884170, endons )
{
    if ( !isdefined( var_981f7b2cc3884170 ) )
    {
        var_981f7b2cc3884170 = level.battlechatter.settings[ var_add69db22c3e940e ];
    }
    
    if ( isstring( var_981f7b2cc3884170 ) )
    {
        var_981f7b2cc3884170 = level.battlechatter.settings[ var_981f7b2cc3884170 ];
    }
    
    if ( !isdefined( var_981f7b2cc3884170 ) )
    {
        /#
            iprintlnbold( "<dev string:xff>" + var_add69db22c3e940e );
        #/
        
        return;
    }
    
    return function_b63bed8df8e4202a( var_add69db22c3e940e, sequence, var_981f7b2cc3884170[ 0 ], var_981f7b2cc3884170[ 1 ], var_981f7b2cc3884170[ 2 ], endons );
}

// Namespace battlechatter
// Params 1, eflags: 0x4
// Checksum 0xc3ccee03, Offset: 0x5b64
// Size: 0x215
function private playchatter( chatter )
{
    retstruct = undefined;
    speaker = self.vo_parent ?? self;
    
    /#
        if ( getdvarint( @"bcs_debug" ) == 1 || getdvarint( @"bcs_debug" ) == 2 )
        {
            retstruct = spawnstruct();
        }
    #/
    
    if ( !chatter.forced && !speaker canchatter( undefined, undefined, retstruct ) )
    {
        /#
            if ( getdvarint( @"bcs_debug" ) == 2 )
            {
                function_d2b2c63c412fae( "<dev string:x11d>" + ( chatter.name ?? "<dev string:x133>" ) + "<dev string:x142>" + function_5082101982db4c30( speaker ) + "<dev string:x142>" + ( retstruct.text ?? "<dev string:x147>" ) );
            }
        #/
        
        chatter.finished_or_cancelled = 1;
        chatter notify( "finished_or_cancelled" );
        return 0;
    }
    
    if ( isdefined( chatter.name ) && !check_cooldown( chatter.name ) )
    {
        /#
            if ( getdvarint( @"bcs_debug" ) == 2 )
            {
                var_1b7171454d9016c5 = function_b1fcddf5ab7db4d8( chatter.name );
                extra = "<dev string:x147>";
                
                if ( var_1b7171454d9016c5 != chatter.name )
                {
                    extra = "<dev string:x14b>" + var_1b7171454d9016c5;
                }
                
                function_d2b2c63c412fae( "<dev string:x15e>" + chatter.name + "<dev string:x142>" + function_5082101982db4c30( speaker ) + extra );
            }
        #/
        
        chatter.finished_or_cancelled = 1;
        chatter notify( "finished_or_cancelled" );
        return 0;
    }
    
    if ( utility::issp() )
    {
        speaker function_6240e9af090bfb1();
    }
    else
    {
        speaker function_4af9773d268acf12();
    }
    
    speaker set_cooldown( chatter.name, chatter.cooldown );
    level.battlechatter notify( "chatter_added", chatter );
    chatter thread function_c383bd09ff253af8();
    return chatter;
}

// Namespace battlechatter
// Params 6
// Checksum 0xdf026df3, Offset: 0x5d82
// Size: 0x5b
function function_a0286b4f2f02e98d( name, sequence, priority, timeout, cooldown, endons )
{
    chatter = createchatter( name, sequence, priority, timeout, cooldown, endons );
    return waitplaychatter( chatter );
}

// Namespace battlechatter
// Params 1
// Checksum 0x95054d3d, Offset: 0x5de6
// Size: 0x1e
function waitplaychatter( chatter )
{
    playchatter( chatter );
    waitchatter( chatter );
}

// Namespace battlechatter
// Params 1
// Checksum 0x3a13822b, Offset: 0x5e0c
// Size: 0x4f
function waitchatter( chatter )
{
    if ( !isstruct( chatter ) )
    {
        return;
    }
    
    if ( !chatter.finished_or_cancelled )
    {
        chatter waittill( "finished_or_cancelled" );
    }
    
    var_7237854e3be197ca = chatter.finished;
    
    if ( isdefined( var_7237854e3be197ca ) )
    {
        return var_7237854e3be197ca;
    }
}

// Namespace battlechatter
// Params 0
// Checksum 0xc56762c2, Offset: 0x5e63
// Size: 0x401
function function_c383bd09ff253af8()
{
    self.finished = 0;
    self.finished_or_cancelled = 0;
    self.speaker.var_e4fec99876f6a732 = self.scope;
    self.speaker notify( "started_queue_wait", self );
    cancelled = self.scope_ents[ self.scope ] dialogue::function_4cbd60ce1a602523( self, self.timeout, self.endons );
    self.speaker notify( "finished_queue_wait", self, cancelled );
    speaker = self.speaker.vo_parent ?? self.speaker;
    
    if ( !cancelled && ( self.forced || speaker canchatter() ) )
    {
        level.battlechatter notify( "chatter_started", self );
        self.speaker.var_569f79b89b587aba = self.priority;
        
        foreach ( ent in self.scope_ents )
        {
            ent dialogue::function_4d50dc614a5b945a( self );
        }
        
        self notify( "proceeded" );
        
        while ( isdefined( self.finished ) && !self.finished )
        {
            self.finished = function_80199f905399605b();
        }
        
        if ( utility::is_dead_or_dying( self.speaker ) )
        {
            self.speaker dialogue::stop_dialogue();
            
            if ( isdefined( self.var_6821aab8faada2ab ) )
            {
                self.listener function_8e55175c05f5c74c( self.name + "_interrupt", self.var_6821aab8faada2ab, level.battlechatter.settings[ "_interrupt" ] );
            }
        }
        
        if ( self.finished )
        {
            if ( self.name == "idle_convo" || self.name == "idle" )
            {
                self.speaker set_cooldown( self.name, level.var_a99c5a25405545fc );
            }
            else
            {
                self.speaker set_cooldown( self.name, self.cooldown );
            }
        }
        
        foreach ( ent in self.scope_ents )
        {
            ent dialogue::remove_vo_data( self );
        }
    }
    else
    {
        self notify( "proceeded" );
        
        /#
            if ( getdvarint( @"bcs_debug" ) == 2 && self.speaker canchatter() )
            {
                function_d2b2c63c412fae( "<dev string:x172>" + ( self.name ?? "<dev string:x133>" ) + "<dev string:x142>" + function_5082101982db4c30( self.speaker ) );
            }
            else if ( getdvarint( @"bcs_debug" ) == 2 )
            {
                function_d2b2c63c412fae( "<dev string:x185>" + ( self.name ?? "<dev string:x133>" ) + "<dev string:x142>" + function_5082101982db4c30( self.speaker ) );
            }
        #/
    }
    
    dialogue::function_d621ed37c021620a( self.scope_ents );
    self.speaker notify( "chatter_finished_or_cancelled", self );
    level.battlechatter notify( "chatter_finished_or_cancelled", self );
    self.finished_or_cancelled = 1;
    self notify( "finished_or_cancelled" );
}

// Namespace battlechatter
// Params 0
// Checksum 0x59fa3789, Offset: 0x626c
// Size: 0xae8
function function_80199f905399605b()
{
    dead_or_dying = utility::is_dead_or_dying( self.speaker );
    in_takedown = self.speaker function_8a9e492c66066776();
    
    if ( dead_or_dying || in_takedown )
    {
        if ( isdefined( self.var_6821aab8faada2ab ) )
        {
            switchspeaker();
            self.sequence = self.var_6821aab8faada2ab;
            self.index = 0;
            self.var_6821aab8faada2ab = undefined;
        }
        else
        {
            /#
                if ( getdvarint( @"bcs_debug" ) )
                {
                    if ( dead_or_dying )
                    {
                        function_d2b2c63c412fae( "<dev string:x1a6>" + ( self.name ?? "<dev string:x133>" ) + "<dev string:x142>" + debug::function_a8ee5e70fb7d68d0( self.speaker ) );
                        return;
                    }
                    
                    function_d2b2c63c412fae( "<dev string:x1bc>" + ( self.name ?? "<dev string:x133>" ) + "<dev string:x142>" + debug::function_a8ee5e70fb7d68d0( self.speaker ) );
                }
            #/
            
            return;
        }
    }
    
    self.speaker notify( "stop_bcs_sequence" );
    self.speaker endon( "death" );
    self.speaker endon( "stop_bcs_sequence" );
    self.speaker endon( "removed from battleChatter" );
    endon_ent = self.speaker;
    
    foreach ( endon_data in self.endons )
    {
        if ( isent( endon_data ) || isstruct( endon_data ) )
        {
            endon_ent = endon_data;
            continue;
        }
        
        if ( isstring( endon_data ) )
        {
            endon_ent endon( endon_data );
        }
    }
    
    if ( !( isdefined( self.sequence ) && isdefined( self.index ) ) )
    {
        /#
            if ( getdvarint( @"bcs_debug" ) )
            {
                function_d2b2c63c412fae( "<dev string:x1d9>" + ( self.name ?? "<dev string:x133>" ) );
            }
        #/
        
        return;
    }
    
    vo_queue = level.vo_teams[ self.speaker.team ].vo_queue;
    
    if ( vo_queue.size > 0 && vo_queue[ 0 ].priority > self.priority )
    {
        /#
            if ( getdvarint( @"bcs_debug" ) )
            {
                function_d2b2c63c412fae( "<dev string:x1fb>" + ( self.name ?? "<dev string:x133>" ) + "<dev string:x211>" + self.priority + "<dev string:x216>" + ( vo_queue[ 0 ].name ?? "<dev string:x133>" ) + "<dev string:x211>" + vo_queue[ 0 ].priority );
            }
        #/
        
        return;
    }
    
    if ( self.index >= self.sequence.size )
    {
        return 1;
    }
    
    self.alias = undefined;
    
    if ( utility::issp() )
    {
        self.speaker function_6240e9af090bfb1();
    }
    else
    {
        self.speaker function_4af9773d268acf12();
    }
    
    segment = self.sequence[ self.index ];
    self.index++;
    
    if ( isstring( segment ) )
    {
        self.alias = constructalias( segment );
        
        /#
            self.sequence[ self.index - 1 ] = self.alias;
        #/
        
        if ( !soundexists( self.alias ) )
        {
            if ( self.var_e766c94762317eec )
            {
                self.var_e766c94762317eec = undefined;
                return 0;
            }
            
            /#
                if ( getdvarint( @"bcs_debug" ) )
                {
                    if ( !isdefined( self.speaker.battlechatter.countryid ) )
                    {
                        function_d2b2c63c412fae( "<dev string:x21d>" + ( self.name ?? "<dev string:x133>" ) + "<dev string:x231>" + self.speaker getentitynumber() + "<dev string:x23a>" + ( anim.countryids[ self.speaker.voice ] ?? "<dev string:x147>" ) + "<dev string:x252>" + ( self.speaker.voice ?? "<dev string:x147>" ) );
                    }
                    else if ( self.alias == "<dev string:x147>" )
                    {
                        function_d2b2c63c412fae( "<dev string:x25c>" + ( self.name ?? "<dev string:x133>" ) + "<dev string:x27b>" + self.speaker.battlechatter.countryid + "<dev string:x282>" + segment + "<dev string:x288>" );
                        
                        if ( !isdefined( level.battlechatter.var_63a95eda8c446908 ) )
                        {
                            level.battlechatter.var_63a95eda8c446908 = [];
                        }
                        
                        if ( !isdefined( level.battlechatter.var_63a95eda8c446908[ segment ] ) && ( !isai( self.speaker ) || self.speaker.team == "<dev string:x28d>" || !level.var_5c667f1aff59def9 ) )
                        {
                            if ( !isdefined( level.battlechatter.var_2f0e16fc6b6dd046 ) )
                            {
                                level.battlechatter.var_2f0e16fc6b6dd046 = [];
                            }
                            
                            if ( !isdefined( level.battlechatter.var_2f0e16fc6b6dd046[ segment ] ) )
                            {
                                level.battlechatter.var_2f0e16fc6b6dd046[ segment ] = 0;
                            }
                            
                            level.battlechatter.var_2f0e16fc6b6dd046[ segment ]++;
                            thread function_b036621f1a4d4177();
                        }
                    }
                    else
                    {
                        function_d2b2c63c412fae( "<dev string:x295>" + ( self.name ?? "<dev string:x133>" ) + "<dev string:x2af>" + self.alias + "<dev string:x2b6>" + "<dev string:x2c1>" + self.speaker.battlechatter.countryid + "<dev string:x282>" + segment + "<dev string:x288>" );
                        
                        if ( !isdefined( level.battlechatter.missingsoundalias ) )
                        {
                            level.battlechatter.missingsoundalias = [];
                        }
                        
                        if ( !isdefined( level.battlechatter.var_63a95eda8c446908 ) )
                        {
                            level.battlechatter.var_63a95eda8c446908 = [];
                        }
                        
                        if ( !isdefined( level.battlechatter.missingsoundalias[ self.alias ] ) )
                        {
                            level.battlechatter.missingsoundalias[ self.alias ] = 0;
                        }
                        
                        level.battlechatter.missingsoundalias[ self.alias ]++;
                        thread function_b036621f1a4d4177();
                    }
                    
                    return 0;
                }
            #/
            
            return;
        }
        
        /#
            if ( getdvarint( @"bcs_debug" ) == 1 || getdvarint( @"bcs_debug" ) == 2 )
            {
                retstruct = spawnstruct();
            }
        #/
        
        speaker = self.speaker.vo_parent ?? self.speaker;
        
        if ( !self.forced && !speaker canchatter( undefined, undefined, retstruct ) )
        {
            /#
                if ( getdvarint( @"bcs_debug" ) )
                {
                    function_d2b2c63c412fae( "<dev string:x2c6>" + ( self.name ?? "<dev string:x133>" ) + "<dev string:x142>" + function_5082101982db4c30( self.speaker.vo_parent ?? self.speaker ) + "<dev string:x142>" + ( retstruct.text ?? undefined ) );
                }
            #/
            
            return;
        }
        
        if ( !dialogue::has_priority( self.scope_ents[ self.scope ].vo_active, 1 ) )
        {
            /#
                if ( getdvarint( @"bcs_debug" ) )
                {
                    function_d2b2c63c412fae( "<dev string:x2e0>" + ( self.name ?? "<dev string:x133>" ) );
                }
            #/
            
            return;
        }
        
        /#
            if ( getdvarint( @"bcs_debug" ) && !self.var_ba0730f9ff4c9cc8 )
            {
                self.var_ba0730f9ff4c9cc8 = 1;
                function_d2b2c63c412fae( "<dev string:x2f7>" + ( self.name ?? "<dev string:x133>" ) + "<dev string:x142>" + function_5082101982db4c30( self.owner ) );
            }
        #/
        
        finished = self.speaker dialogue::say_dialogue( self.alias, self.receivers );
        
        if ( !finished )
        {
            /#
                if ( getdvarint( @"bcs_debug" ) )
                {
                    function_d2b2c63c412fae( "<dev string:x305>" + ( self.name ?? "<dev string:x133>" ) );
                }
            #/
            
            return;
        }
        
        return 0;
    }
    else if ( isnumber( segment ) )
    {
        if ( segment <= 0 )
        {
            return 0;
        }
        
        wait segment;
        return 0;
    }
    else if ( isent( segment ) || isstruct( segment ) )
    {
        result = switchspeaker( segment );
        
        if ( isint( result ) && result == 0 )
        {
            /#
                if ( getdvarint( @"bcs_debug" ) )
                {
                    function_d2b2c63c412fae( "<dev string:x31e>" + ( self.name ?? "<dev string:x133>" ) );
                }
            #/
            
            return;
        }
        else
        {
            return 0;
        }
    }
    else if ( isfunction( segment ) )
    {
        result = self [[ segment ]]();
        
        if ( isdefined( result ) )
        {
            if ( isint( result ) && result == 0 )
            {
                /#
                    if ( getdvarint( @"bcs_debug" ) )
                    {
                        function_d2b2c63c412fae( "<dev string:x33c>" + ( self.name ?? "<dev string:x133>" ) + "<dev string:x359>" + self.index - 1 + "<dev string:x288>" );
                    }
                #/
                
                return;
            }
            
            if ( isarray( result ) )
            {
                self.sequence = utility::function_a29adc1232d07a43( self.sequence, result, self.index );
            }
            else
            {
                arrayinsert( self.sequence, result, self.index );
            }
        }
        
        return 0;
    }
    else if ( isarray( segment ) )
    {
        self.sequence = utility::function_a29adc1232d07a43( self.sequence, segment, self.index );
        return 0;
    }
    
    /#
        if ( getdvarint( @"bcs_debug" ) )
        {
            function_d2b2c63c412fae( "<dev string:x366>" + self.index + "<dev string:x383>" + ( self.name ?? "<dev string:x133>" ) );
        }
    #/
}

/#

    // Namespace battlechatter
    // Params 2
    // Checksum 0xa04de8ae, Offset: 0x6d5d
    // Size: 0x3d, Type: dev
    function function_d2b2c63c412fae( text, var_b668a74ff68f069c )
    {
        if ( isdefined( var_b668a74ff68f069c ) )
        {
            var_b668a74ff68f069c.text = text;
            return;
        }
        
        debug::function_9d6fee9cf5908ddc( text );
        println( text );
    }

    // Namespace battlechatter
    // Params 0
    // Checksum 0xb5a6464f, Offset: 0x6da2
    // Size: 0x6cf, Type: dev
    function function_1885b87626c9fc2a()
    {
        level endon( "<dev string:x391>" );
        player = undefined;
        
        for ( ;; )
        {
            if ( !getdvarint( @"bcs_debug" ) || !( isdefined( level.battlechatter ) && isdefined( level.vo_active ) ) )
            {
            }
            else
            {
                vid_width = getdvarint( @"vid_width", 1920 );
                vid_height = getdvarint( @"vid_height", 1080 );
                var_32625d7e073bc1e = getdvarint( @"vid_width" ) / 1920;
                var_385d1ba08a253da1 = getdvarint( @"vid_height" ) / 1080;
                setdvarifuninitialized( @"hash_91d2bfdbf8875369", 350 );
                setdvarifuninitialized( @"hash_91d2bedbf8875136", 250 );
                setdvarifuninitialized( @"hash_4fd3148b1459a83", 0.8 );
                base_x = getdvarint( @"hash_91d2bfdbf8875369" ) * var_32625d7e073bc1e;
                base_y = getdvarint( @"hash_91d2bedbf8875136" ) * var_385d1ba08a253da1;
                base_scale = getdvarfloat( @"hash_4fd3148b1459a83" ) * var_385d1ba08a253da1;
                ln_height = 0;
                
                for ( k = 0; k < level.vo_active.size ; k++ )
                {
                    if ( !level.vo_active[ k ].ischatter )
                    {
                        continue;
                    }
                    
                    chatter = level.vo_active[ k ];
                    sequence = chatter.sequence;
                    
                    if ( isdefined( chatter.name ) )
                    {
                        speaker = chatter.speaker.vo_parent ?? chatter.speaker;
                        
                        if ( isstruct( chatter.speaker ) && isdefined( chatter.speaker.vo_parent ) )
                        {
                            speaker_text = "<dev string:x3ab>" + speaker getentitynumber() + "<dev string:x3b1>";
                        }
                        else if ( isstruct( chatter.speaker ) )
                        {
                            speaker_text = "<dev string:x3ab>" + "<dev string:x3bb>" + "<dev string:x3b1>";
                        }
                        else
                        {
                            speaker_text = "<dev string:x3ab>" + speaker getentitynumber();
                        }
                        
                        event_info = "<dev string:x3c3>" + speaker_text + "<dev string:x24>" + chatter.name + "<dev string:x3ca>";
                        
                        if ( !isdefined( speaker.team ) )
                        {
                            color = ( 1, 1, 1 );
                        }
                        else
                        {
                            color = speaker.team == "<dev string:x3d1>" ? ( 0.1, 0.9, 0.1 ) : ( 1, 0.2, 0.2 );
                        }
                        
                        pos_y = base_y + ln_height;
                        printtoscreen2d( base_x + 2, pos_y, event_info, ( 0, 0, 0 ), 1.75 * base_scale );
                        printtoscreen2d( base_x, pos_y + 2, event_info, ( 0, 0, 0 ), 1.75 * base_scale );
                        printtoscreen2d( base_x, pos_y, event_info, color, 1.75 * base_scale );
                        
                        if ( !isdefined( player ) )
                        {
                            player = getclosestplayer( ( 0, 0, 0 ) );
                        }
                        
                        if ( isdefined( player ) )
                        {
                            cam_x = mapfloat( 0, vid_width, 380, -380, base_x * 0.5 );
                            cam_y = mapfloat( 0, vid_height, -240, 240, pos_y * 0.5 );
                            var_5c6dd671289b46c4 = player function_bdb033038ede75bf( ( cam_x, cam_y, 0 ), 65, 5, 1 );
                            line( speaker.origin, var_5c6dd671289b46c4, color );
                            debugstar( speaker.origin, color, 1, speaker_text );
                        }
                        
                        ln_height += 30 * base_scale;
                    }
                    
                    for ( i = 0; i < sequence.size ; i++ )
                    {
                        display_ln = undefined;
                        segment = sequence[ i ];
                        
                        if ( isstring( segment ) )
                        {
                            if ( !isstartstr( segment, "<dev string:x3db>" ) )
                            {
                                alias = segment;
                            }
                            else
                            {
                                alias = chatter constructalias( segment );
                                alias = getsubstr( alias, 6, alias.size );
                            }
                            
                            display_ln = "<dev string:x3e2>" + ( alias ?? segment );
                        }
                        else if ( isnumber( segment ) )
                        {
                            display_ln = "<dev string:x3eb>" + segment + "<dev string:x3f5>";
                        }
                        else if ( isent( segment ) )
                        {
                            ent_num = "<dev string:x3ab>" + segment getentitynumber();
                            display_ln = "<dev string:x3fd>";
                            
                            if ( isdefined( segment.animname ) )
                            {
                                display_ln += segment.animname + "<dev string:x414>" + ent_num + "<dev string:x41a>";
                            }
                            else
                            {
                                display_ln += ent_num;
                            }
                        }
                        else if ( isstruct( segment ) && isdefined( segment.vo_parent ) )
                        {
                            ent_num = "<dev string:x3ab>" + segment.vo_parent getentitynumber();
                            display_ln = "<dev string:x3fd>";
                            
                            if ( isdefined( segment.vo_parent.animname ) )
                            {
                                display_ln += segment.vo_parent.animname + "<dev string:x41f>" + ent_num + "<dev string:x41a>";
                            }
                            else
                            {
                                display_ln += ent_num + "<dev string:x42d>";
                            }
                        }
                        else if ( isfunction( segment ) )
                        {
                            display_ln = "<dev string:x439>";
                        }
                        
                        if ( isdefined( display_ln ) )
                        {
                            is_index = i == chatter.index - 1;
                            color = is_index ? ( 1, 1, 0 ) : ( 1, 1, 1 );
                            space = ( is_index ? 32 : 25 ) * base_scale;
                            scale = ( is_index ? 1.85 : 1.5 ) * base_scale;
                            printtoscreen2d( base_x + 2, base_y + 2 + ln_height + is_index * 10 * base_scale, display_ln, ( 0, 0, 0 ), scale );
                            printtoscreen2d( base_x + 2, base_y + 2 + ln_height + is_index * 10 * base_scale, display_ln, ( 0, 0, 0 ), scale );
                            printtoscreen2d( base_x, base_y + ln_height + is_index * 10 * base_scale, display_ln, color, scale );
                            ln_height += space;
                        }
                    }
                    
                    if ( k < level.vo_active.size - 1 )
                    {
                        printtoscreen2d( base_x, base_y + ln_height, "<dev string:x44a>", ( 1, 1, 1 ), 1.5 * base_scale );
                        ln_height += 30 * base_scale;
                    }
                }
            }
            
            waitframe();
        }
    }

#/

// Namespace battlechatter
// Params 6, eflags: 0x4
// Checksum 0x796a6144, Offset: 0x7479
// Size: 0x1b4
function private createchatter( name, sequence, priority, timeout, cooldown, endons )
{
    chatter = spawnstruct();
    chatter.name = name;
    chatter.scope = level.battlechatter.scope ?? "team";
    chatter.owner = self;
    chatter.speaker = self;
    chatter.scope_ents = dialogue::function_bf5715bcec0f160a();
    chatter.ischatter = 1;
    
    if ( !isarray( sequence ) )
    {
        sequence = [ sequence ];
    }
    
    chatter.index = 0;
    chatter.sequence = sequence;
    chatter.forced = isdefined( level.battlechatter ) && isdefined( self.battlechatter ) && self.battlechatter.friendlyfire_force && name == "friendlyfire";
    chatter.priority = priority ?? 0;
    chatter.timeout = timeout ?? 1;
    chatter.cooldown = cooldown ?? 0;
    chatter.endons = endons ?? [];
    chatter.overlap = 1;
    
    if ( !isarray( chatter.endons ) )
    {
        chatter.endons = [ chatter.endons ];
    }
    
    return chatter;
}

// Namespace battlechatter
// Params 1
// Checksum 0x9610b8eb, Offset: 0x7636
// Size: 0xa5
function function_79675a6fd5f1a905( sequence )
{
    foreach ( segment in sequence )
    {
        if ( isarray( segment ) )
        {
            var_7237854e3be197ca = function_79675a6fd5f1a905( segment );
            
            if ( isdefined( var_7237854e3be197ca ) )
            {
                return var_7237854e3be197ca;
            }
        }
        
        if ( isent( segment ) )
        {
            return segment;
        }
    }
}

// Namespace battlechatter
// Params 1
// Checksum 0xfaee46bc, Offset: 0x76e3
// Size: 0xa5
function getfirststring( sequence )
{
    foreach ( segment in sequence )
    {
        if ( isarray( segment ) )
        {
            var_7237854e3be197ca = getfirststring( segment );
            
            if ( isdefined( var_7237854e3be197ca ) )
            {
                return var_7237854e3be197ca;
            }
        }
        
        if ( isstring( segment ) )
        {
            return segment;
        }
    }
}

// Namespace battlechatter
// Params 1
// Checksum 0xa75e61e5, Offset: 0x7790
// Size: 0x30e
function constructalias( event_string )
{
    if ( isstartstr( event_string, "dx_" ) )
    {
        return event_string;
    }
    
    if ( !isstartstr( event_string, "~" ) && !isstartstr( event_string, "c_" ) && !isstartstr( event_string, "s_" ) )
    {
        event_string = self.speaker battlechatter_events::event_lookup( event_string );
    }
    
    if ( !isdefined( event_string ) )
    {
        return "";
    }
    
    if ( isarray( event_string ) )
    {
        if ( event_string.size > 0 )
        {
            event_string = event_string[ 0 ];
        }
        else
        {
            return "";
        }
    }
    
    if ( isstartstr( event_string, "dx_" ) )
    {
        return event_string;
    }
    
    if ( !( isdefined( self.speaker ) && isdefined( self.speaker.battlechatter ) ) )
    {
        return "";
    }
    
    segs = strtok( event_string, "_" );
    char = function_c34193e3513bfac2( self.speaker ) ?? "";
    countryid = self.speaker.battlechatter.countryid ?? "";
    
    if ( isdefined( self.speaker.battlechatter.countryidoverride ) )
    {
        countryid = self.speaker.battlechatter.countryidoverride;
    }
    
    if ( segs.size > 2 )
    {
        if ( isdefined( countryid ) )
        {
            if ( segs[ 0 ] == "s" )
            {
                segs[ 0 ] = anim.var_c285202ed79ffced[ countryid ];
            }
            else
            {
                segs[ 0 ] = anim.var_4ef5299ac30c33e6[ countryid ];
            }
        }
        
        if ( !( isdefined( countryid ) && isdefined( segs[ 0 ] ) ) )
        {
            if ( getprojectname() == "T10" )
            {
                segs[ 0 ] = "hcom";
            }
            else if ( isstartstr( event_string, "c" ) )
            {
                segs[ 0 ] = "hrbc";
            }
            else
            {
                segs[ 0 ] = "hrcm";
            }
        }
    }
    
    switch ( segs.size )
    {
        case 4:
            return ( "dx_bc_" + segs[ 0 ] + "_" + segs[ 1 ] + "_" + char + "_" + segs[ 2 ] + "_" + segs[ 3 ] );
        case 3:
            return ( "dx_bc_" + segs[ 0 ] + "_" + segs[ 1 ] + "_" + char + "_" + segs[ 2 ] );
        case 2:
            return ( "dx_bc_" + segs[ 0 ] + "_" + char + "_" + segs[ 1 ] );
        case 1:
            if ( self.speaker.battlechatter.isleader )
            {
                return ( "dx_guid" + segs[ 0 ] );
            }
            else
            {
                return ( "dx_guid" + segs[ 0 ] + "_" + char );
            }
        default:
            assertmsg( "<dev string:x46f>" + event_string + "<dev string:x490>" );
            break;
    }
}

// Namespace battlechatter
// Params 1
// Checksum 0x6046fce2, Offset: 0x7aa6
// Size: 0x68
function lookupchatter( event_string )
{
    if ( !isdefined( level.battlechatter.event_decks ) )
    {
        createeventdecks();
    }
    
    if ( isdefined( level.battlechatter.event_decks[ event_string ] ) )
    {
        return level.battlechatter.event_decks[ event_string ] utility::deck_draw();
    }
    
    return event_string;
}

// Namespace battlechatter
// Params 0
// Checksum 0x7af893a0, Offset: 0x7b16
// Size: 0x17
function createeventdecks()
{
    level.battlechatter.event_decks = [];
}

// Namespace battlechatter
// Params 1
// Checksum 0x1acc8dd, Offset: 0x7b35
// Size: 0xf2
function function_c34193e3513bfac2( speaker )
{
    if ( isdefined( speaker.battlechatter.charoverride ) )
    {
        return tolower( speaker.battlechatter.charoverride );
    }
    
    npcid = speaker.battlechatter.npcid ?? "";
    
    if ( npcid.size == 4 )
    {
        return tolower( npcid );
    }
    
    countryid = speaker.battlechatter.countryid ?? "";
    
    if ( isdefined( speaker.battlechatter.countryidoverride ) )
    {
        countryid = speaker.battlechatter.countryidoverride;
    }
    
    if ( countryid == "RU" )
    {
        return tolower( countryid + "0" + npcid );
    }
    
    return tolower( countryid + npcid );
}

// Namespace battlechatter
// Params 1
// Checksum 0x87dda396, Offset: 0x7c30
// Size: 0xa6
function getmodeprefix( type = "stealth" )
{
    switch ( type )
    {
        case #"hash_3d5f49f17b95335c":
            otn = getdvar( @"hash_495535a4877b324d" ) != "off";
            return ( otn ? "otn_" : "cst_" );
        case #"hash_44e999799ff10fce":
            return "vom_";
        default:
            otn = getdvar( @"hash_87dca5163728ce02" ) != "off";
            return ( otn ? "otn_" : "cbc_" );
    }
}

// Namespace battlechatter
// Params 0
// Checksum 0xcc679a7f, Offset: 0x7cde
// Size: 0xae
function getgamemode()
{
    var_7237854e3be197ca = level.gamemode;
    
    if ( isdefined( var_7237854e3be197ca ) )
    {
        return var_7237854e3be197ca;
    }
    
    mapname = getdvar( @"mapname" );
    
    switch ( getsubstr( mapname, 0, 3 ) )
    {
        case #"hash_2865036c1ee43ae5":
            if ( getsubstr( mapname, 0, 6 ) == "mp_br_" )
            {
                level.gamemode = "br";
            }
            else
            {
                level.gamemode = "mp";
            }
            
            break;
        default:
            level.gamemode = "sp";
            break;
    }
    
    return level.gamemode;
}

// Namespace battlechatter
// Params 0
// Checksum 0xf5977b8a, Offset: 0x7d95
// Size: 0x115
function getlocation()
{
    if ( !isdefined( level.battlechatter.location_triggers ) )
    {
        return;
    }
    
    location_triggers = self getistouchingentities( level.battlechatter.location_triggers );
    
    if ( location_triggers.size == 0 )
    {
        return;
    }
    
    locations = [];
    
    foreach ( trigger in location_triggers )
    {
        var_ac131861d5a7c389 = isdefined( trigger.islandmark ) && level.player istouching( trigger );
        
        if ( var_ac131861d5a7c389 || !isdefined( trigger.location ) )
        {
            continue;
        }
        
        locations[ locations.size ] = trigger.location;
    }
    
    return utility::random( locations );
}

// Namespace battlechatter
// Params 3
// Checksum 0x9cf42fc9, Offset: 0x7eb3
// Size: 0x1c4, Type: bool
function chatterallowed( guy, do_debug, var_2538a549cb545543 )
{
    if ( !( isdefined( level.battlechatter ) && isdefined( guy.battlechatter ) ) )
    {
        /#
            if ( do_debug && getdvarint( @"bcs_debug" ) >= 2 )
            {
                function_d2b2c63c412fae( "<dev string:x11d>" + ( var_2538a549cb545543 ?? "<dev string:x133>" ) + "<dev string:x142>" + function_5082101982db4c30( guy ) + "<dev string:x495>" );
            }
        #/
        
        return false;
    }
    
    if ( level.battlechatterdisabled )
    {
        /#
            if ( do_debug && getdvarint( @"bcs_debug" ) >= 2 )
            {
                function_d2b2c63c412fae( "<dev string:x11d>" + ( var_2538a549cb545543 ?? "<dev string:x133>" ) + "<dev string:x142>" + function_5082101982db4c30( guy ) + "<dev string:x4cd>" );
            }
        #/
        
        return false;
    }
    
    if ( !guy.battlechatterallowed )
    {
        /#
            if ( do_debug && getdvarint( @"bcs_debug" ) >= 2 )
            {
                function_d2b2c63c412fae( "<dev string:x11d>" + ( var_2538a549cb545543 ?? "<dev string:x133>" ) + "<dev string:x142>" + function_5082101982db4c30( guy ) + "<dev string:x4f4>" );
            }
        #/
        
        return false;
    }
    
    if ( isdefined( level.battlechatterdisabledteams ) )
    {
        team = guy.team ?? "";
        
        if ( level.battlechatterdisabledteams[ team ] )
        {
            /#
                if ( do_debug && getdvarint( @"bcs_debug" ) >= 2 )
                {
                    function_d2b2c63c412fae( "<dev string:x11d>" + ( var_2538a549cb545543 ?? "<dev string:x133>" ) + "<dev string:x142>" + function_5082101982db4c30( guy ) + "<dev string:x519>" + team + "<dev string:x53e>" );
                }
            #/
            
            return false;
        }
    }
    
    return true;
}

// Namespace battlechatter
// Params 0
// Checksum 0xbca59104, Offset: 0x8080
// Size: 0x4a
function function_8a9e492c66066776()
{
    if ( !isdefined( self ) )
    {
        return 0;
    }
    
    if ( isai( self ) )
    {
        if ( utility::issharedfuncdefined( #"executions", #"is_in_takedown" ) )
        {
            return self [[ utility::getsharedfunc( #"executions", #"is_in_takedown" ) ]]();
        }
    }
    
    return 0;
}

// Namespace battlechatter
// Params 4
// Checksum 0x4204f45b, Offset: 0x80d3
// Size: 0x211, Type: bool
function canchatter( requiredstate, sighttarget, var_b668a74ff68f069c, lastsighttime )
{
    if ( utility::is_dead_or_dying( self ) || !( isdefined( self.team ) && isdefined( self.origin ) ) || !chatterallowed( self ) )
    {
        /#
            if ( getdvarint( @"bcs_debug" ) == 3 || isdefined( var_b668a74ff68f069c ) )
            {
                function_d2b2c63c412fae( "<dev string:x54c>", var_b668a74ff68f069c );
            }
        #/
        
        return false;
    }
    
    if ( function_8a9e492c66066776() )
    {
        /#
            if ( getdvarint( @"bcs_debug" ) == 3 || isdefined( var_b668a74ff68f069c ) )
            {
                function_d2b2c63c412fae( "<dev string:x57b>", var_b668a74ff68f069c );
            }
        #/
    }
    
    if ( isdefined( requiredstate ) && getcombatstate() != requiredstate )
    {
        /#
            if ( getdvarint( @"bcs_debug" ) == 3 || isdefined( var_b668a74ff68f069c ) )
            {
                function_d2b2c63c412fae( "<dev string:x58a>", var_b668a74ff68f069c );
            }
        #/
        
        return false;
    }
    
    if ( isdefined( sighttarget ) )
    {
        if ( !isdefined( lastsighttime ) )
        {
            lastsighttime = 2;
        }
        
        if ( !self seerecently( sighttarget, lastsighttime ) )
        {
            /#
                if ( getdvarint( @"bcs_debug" ) == 3 || isdefined( var_b668a74ff68f069c ) )
                {
                    function_d2b2c63c412fae( "<dev string:x5bb>", var_b668a74ff68f069c );
                }
            #/
            
            return false;
        }
    }
    
    if ( self.in_melee_death )
    {
        /#
            if ( getdvarint( @"bcs_debug" ) == 3 || isdefined( var_b668a74ff68f069c ) )
            {
                function_d2b2c63c412fae( "<dev string:x5e3>", var_b668a74ff68f069c );
            }
        #/
        
        return false;
    }
    
    if ( self._animactive && !self.battlechatter.allowanimactive )
    {
        /#
            if ( getdvarint( @"bcs_debug" ) == 3 || isdefined( var_b668a74ff68f069c ) )
            {
                function_d2b2c63c412fae( "<dev string:x5f5>", var_b668a74ff68f069c );
            }
        #/
        
        return false;
    }
    
    if ( isplayer( self ) )
    {
        return true;
    }
    
    if ( !getplayersinrange( self.origin, level.bcs_fardist ).size > 0 )
    {
        /#
            if ( isdefined( var_b668a74ff68f069c ) )
            {
                function_d2b2c63c412fae( "<dev string:x607>", var_b668a74ff68f069c );
            }
        #/
        
        return false;
    }
    
    return true;
}

// Namespace battlechatter
// Params 1
// Checksum 0x44d6fbf4, Offset: 0x82ed
// Size: 0x28
function bc_prefix( type )
{
    return "dx_" + getmodeprefix( type ) + function_c34193e3513bfac2( self ) + "_";
}

// Namespace battlechatter
// Params 1, eflags: 0x4
// Checksum 0x7094de50, Offset: 0x831e
// Size: 0x40
function private function_b1fcddf5ab7db4d8( chatter_name )
{
    chatter_settings = level.battlechatter.settings[ chatter_name ];
    
    if ( isstring( chatter_settings ) )
    {
        return chatter_settings;
    }
    
    return chatter_name;
}

// Namespace battlechatter
// Params 2
// Checksum 0xa9ad56d5, Offset: 0x8366
// Size: 0x135, Type: bool
function check_cooldown( name, players )
{
    name = function_b1fcddf5ab7db4d8( name );
    
    if ( !isdefined( players ) )
    {
        if ( utility::issp() )
        {
            players = [ level.player ];
        }
        else
        {
            players = getplayersinrange( self.origin, level.bcs_fardist );
        }
    }
    
    foreach ( player in players )
    {
        if ( !( isdefined( player.bcs_cooldowns ) && isdefined( player.bcs_cooldowns[ self.team ] ) ) )
        {
            continue;
        }
        
        if ( !isdefined( player.bcs_cooldowns[ self.team ][ name ] ) )
        {
            continue;
        }
        
        if ( gettime() < player.bcs_cooldowns[ self.team ][ name ] )
        {
            return false;
        }
    }
    
    return true;
}

// Namespace battlechatter
// Params 3
// Checksum 0xd69bb332, Offset: 0x84a4
// Size: 0x44, Type: bool
function function_bff9aef8d7c8e8a9( name, duration, players )
{
    name = function_b1fcddf5ab7db4d8( name );
    
    if ( !check_cooldown( name, players ) )
    {
        return false;
    }
    
    set_cooldown( name, duration, players );
    return true;
}

// Namespace battlechatter
// Params 3
// Checksum 0x64fc20be, Offset: 0x84f1
// Size: 0x197
function set_cooldown( name, duration, players )
{
    if ( !( isdefined( duration ) && isdefined( name ) && isdefined( self.origin ) ) )
    {
        return;
    }
    
    name = function_b1fcddf5ab7db4d8( name );
    
    if ( !isdefined( players ) )
    {
        if ( utility::issp() )
        {
            players = [ level.player ];
        }
        else
        {
            players = getplayersinrange( self.origin, level.bcs_fardist );
        }
    }
    
    foreach ( player in players )
    {
        if ( !isdefined( player.bcs_cooldowns ) )
        {
            player.bcs_cooldowns = [];
        }
        
        if ( !isdefined( player.bcs_cooldowns[ self.team ] ) )
        {
            player.bcs_cooldowns[ self.team ] = [];
        }
        
        player.bcs_cooldowns[ self.team ][ name ] = gettime() + duration * 1000;
        
        if ( utility::ismp() )
        {
            player.bcs_cooldowns[ self.team ] = function_60af3649d76450da( player.bcs_cooldowns[ self.team ], 5 );
        }
    }
}

// Namespace battlechatter
// Params 1
// Checksum 0x72da9191, Offset: 0x8690
// Size: 0x11a
function clear_cooldown( name )
{
    if ( !( isdefined( name ) && isdefined( self.origin ) ) )
    {
        return;
    }
    
    name = function_b1fcddf5ab7db4d8( name );
    
    if ( utility::issp() )
    {
        players = [ level.player ];
    }
    else
    {
        players = getplayersinrange( self.origin, level.bcs_fardist );
    }
    
    foreach ( player in players )
    {
        if ( !isdefined( player.bcs_cooldowns ) )
        {
            continue;
        }
        
        if ( !isdefined( player.bcs_cooldowns[ self.team ] ) )
        {
            continue;
        }
        
        player.bcs_cooldowns[ self.team ][ name ] = undefined;
    }
}

// Namespace battlechatter
// Params 1
// Checksum 0xbad706df, Offset: 0x87b2
// Size: 0x17c
function switchspeaker( new_speaker )
{
    if ( !isdefined( new_speaker ) )
    {
        new_speaker = self.listener;
    }
    
    if ( !isdefined( new_speaker ) )
    {
        new_speaker = function_cafa639f15ad2523();
    }
    
    if ( isint( new_speaker ) && new_speaker == 0 )
    {
        return 0;
    }
    
    foreach ( ent in self.scope_ents )
    {
        ent dialogue::remove_vo_data( self );
    }
    
    self.listener = self.speaker;
    self.speaker = new_speaker;
    self.speaker.var_569f79b89b587aba = self.priority;
    self.scope_ents = self.speaker dialogue::function_bf5715bcec0f160a();
    
    foreach ( ent in self.scope_ents )
    {
        ent dialogue::function_4d50dc614a5b945a( self );
    }
}

// Namespace battlechatter
// Params 0
// Checksum 0xffac10cb, Offset: 0x8936
// Size: 0x27
function function_cafa639f15ad2523()
{
    var_7237854e3be197ca = self.speaker function_e2914765523651ec();
    
    if ( isdefined( var_7237854e3be197ca ) )
    {
        return var_7237854e3be197ca;
    }
    
    return 0;
}

// Namespace battlechatter
// Params 0
// Checksum 0xd701448c, Offset: 0x8966
// Size: 0x27
function function_a11a364f995e0267()
{
    var_7237854e3be197ca = self.speaker getclosestfriendlyspeaker();
    
    if ( isdefined( var_7237854e3be197ca ) )
    {
        return var_7237854e3be197ca;
    }
    
    return 0;
}

// Namespace battlechatter
// Params 0
// Checksum 0x3863bcc6, Offset: 0x8996
// Size: 0x27
function function_719609ee364b3a79()
{
    var_7237854e3be197ca = self.speaker function_35122f7ab1b5d14f();
    
    if ( isdefined( var_7237854e3be197ca ) )
    {
        return var_7237854e3be197ca;
    }
    
    return 0;
}

// Namespace battlechatter
// Params 0
// Checksum 0x2472848c, Offset: 0x89c6
// Size: 0x27
function function_9619ea8607ade59d()
{
    var_7237854e3be197ca = function_b394d5ccfe1e9f93( self.speaker );
    
    if ( isdefined( var_7237854e3be197ca ) )
    {
        return var_7237854e3be197ca;
    }
    
    return 0;
}

// Namespace battlechatter
// Params 0
// Checksum 0xe83f309e, Offset: 0x89f6
// Size: 0x27
function function_26e971b16e545fce()
{
    var_7237854e3be197ca = function_430ce31cc09b55c0( self.speaker );
    
    if ( isdefined( var_7237854e3be197ca ) )
    {
        return var_7237854e3be197ca;
    }
    
    return 0;
}

// Namespace battlechatter
// Params 0
// Checksum 0x852fe0ed, Offset: 0x8a26
// Size: 0xd2
function getsubordinates()
{
    rank = getrankvalue();
    
    if ( !isdefined( rank ) )
    {
        return getaiarray( self.team );
    }
    
    subordinates = [];
    
    foreach ( guy in getaiarray( self.team ) )
    {
        if ( guy == self )
        {
            continue;
        }
        
        guy_rank = guy getrankvalue();
        
        if ( guy_rank < rank )
        {
            subordinates[ subordinates.size ] = guy;
        }
    }
    
    return subordinates;
}

// Namespace battlechatter
// Params 0
// Checksum 0x428cbe06, Offset: 0x8b01
// Size: 0xd2
function getsuperiors()
{
    rank = getrankvalue();
    
    if ( !isdefined( rank ) )
    {
        return getaiarray( self.team );
    }
    
    superiors = [];
    
    foreach ( guy in getaiarray( self.team ) )
    {
        if ( guy == self )
        {
            continue;
        }
        
        guy_rank = guy getrankvalue();
        
        if ( guy_rank > rank )
        {
            superiors[ superiors.size ] = guy;
        }
    }
    
    return superiors;
}

// Namespace battlechatter
// Params 0
// Checksum 0xacd2d195, Offset: 0x8bdc
// Size: 0x34
function function_346592950fc5f27e()
{
    return self.team == "axis" || self.team == "team3" ? "allies" : "bad_guys";
}

// Namespace battlechatter
// Params 0
// Checksum 0xaa069283, Offset: 0x8c19
// Size: 0x6c
function function_1272ffe375c8a106()
{
    npcid = undefined;
    
    if ( isdefined( self.battlechatter ) )
    {
        npcid = self.battlechatter.npcid;
    }
    
    new_speaker = function_d3900dfe78938e4f( self.origin, getsubordinates(), npcid );
    
    if ( !isdefined( new_speaker ) )
    {
        new_speaker = getclosestfriendlyspeaker( self.team );
    }
    
    return new_speaker;
}

// Namespace battlechatter
// Params 0
// Checksum 0xd6c5eef4, Offset: 0x8c8e
// Size: 0x6c
function function_4c093965853024b()
{
    npcid = undefined;
    
    if ( isdefined( self.battlechatter ) )
    {
        npcid = self.battlechatter.npcid;
    }
    
    new_speaker = function_d3900dfe78938e4f( self.origin, getsuperiors(), npcid );
    
    if ( !isdefined( new_speaker ) )
    {
        new_speaker = getclosestfriendlyspeaker( self.team );
    }
    
    return new_speaker;
}

// Namespace battlechatter
// Params 0
// Checksum 0x1feb1841, Offset: 0x8d03
// Size: 0x63
function function_35122f7ab1b5d14f()
{
    npcid = undefined;
    
    if ( isdefined( self.battlechatter ) )
    {
        npcid = self.battlechatter.npcid;
    }
    
    new_speaker = function_ce7df4ebf491561c( getsubordinates(), npcid );
    
    if ( !isdefined( new_speaker ) )
    {
        new_speaker = function_e2914765523651ec( self.team );
    }
    
    return new_speaker;
}

// Namespace battlechatter
// Params 0
// Checksum 0x3adea9e0, Offset: 0x8d6f
// Size: 0x63
function function_c94619f57e9621c0()
{
    npcid = undefined;
    
    if ( isdefined( self.battlechatter ) )
    {
        npcid = self.battlechatter.npcid;
    }
    
    new_speaker = function_ce7df4ebf491561c( getsuperiors(), npcid );
    
    if ( !isdefined( new_speaker ) )
    {
        new_speaker = function_e2914765523651ec( self.team );
    }
    
    return new_speaker;
}

// Namespace battlechatter
// Params 4
// Checksum 0x7b64428a, Offset: 0x8ddb
// Size: 0xc8
function getclosestfriendlyspeaker( team = self.team, requiredstate, requiresight, maxdist = level.bcs_neardist )
{
    if ( !isdefined( team ) || team == "dead" )
    {
        return;
    }
    
    if ( !isdefined( self.origin ) )
    {
        return;
    }
    
    npcid = undefined;
    
    if ( isdefined( self.battlechatter.npcid ) )
    {
        npcid = self.battlechatter.npcid;
    }
    
    return function_d3900dfe78938e4f( self.origin, getaiinrange( self.origin, maxdist, team ), npcid, requiredstate, requiresight );
}

// Namespace battlechatter
// Params 4
// Checksum 0x41bd6124, Offset: 0x8eac
// Size: 0x9c
function getclosestenemyspeaker( team, requiredstate, requiresight, maxdist )
{
    if ( !( isdefined( self.enemy ) && isdefined( self.enemy.team ) ) )
    {
        return;
    }
    
    if ( !isdefined( team ) )
    {
        team = self.enemy.team;
    }
    
    if ( !isdefined( maxdist ) )
    {
        maxdist = level.bcs_neardist;
    }
    
    return function_d3900dfe78938e4f( self.origin, getaiinrange( self.origin, maxdist, team ), undefined, requiredstate, requiresight );
}

// Namespace battlechatter
// Params 4
// Checksum 0x977ca089, Offset: 0x8f51
// Size: 0x92
function function_e2914765523651ec( team = self.team, requiredstate, requiresight, maxdist = level.bcs_neardist )
{
    npcid = undefined;
    
    if ( isdefined( self.battlechatter ) )
    {
        npcid = self.battlechatter.npcid;
    }
    
    return function_ce7df4ebf491561c( getaiinrange( self.origin, maxdist, team ), npcid, requiredstate, requiresight );
}

// Namespace battlechatter
// Params 5
// Checksum 0xb1f5c8e2, Offset: 0x8fec
// Size: 0xa7
function function_488fbba7b008e1e5( team, requiredstate, requiresight, maxdist, lastsighttime )
{
    if ( !( isdefined( self.enemy ) && isdefined( self.enemy.team ) ) )
    {
        return;
    }
    
    if ( !isdefined( team ) )
    {
        team = self.enemy.team;
    }
    
    if ( !isdefined( maxdist ) )
    {
        maxdist = level.bcs_neardist;
    }
    
    return function_ce7df4ebf491561c( getaiinrange( self.enemy.origin, maxdist, team ), undefined, requiredstate, requiresight, lastsighttime );
}

// Namespace battlechatter
// Params 5
// Checksum 0xa1c34c54, Offset: 0x909c
// Size: 0x1cd
function function_d3900dfe78938e4f( origin, possible_speakers, excludeid, requiredstate, requiresight )
{
    closest_distsq = undefined;
    closest_guy = undefined;
    sighttarget = undefined;
    
    if ( requiresight )
    {
        sighttarget = self;
    }
    
    foreach ( guy in possible_speakers )
    {
        if ( issentient( self ) && guy == self )
        {
            continue;
        }
        
        if ( guy dialogue::function_ef3bb46d2024effd() || !guy canchatter( requiredstate, sighttarget ) || guy.battlechatter.npcid == excludeid )
        {
            continue;
        }
        
        if ( isdefined( guy.battlechatter ) && guy.battlechatter.ishero )
        {
            continue;
        }
        
        if ( isdefined( guy.battlechatter.countryid ) && isdefined( self.battlechatter.countryid ) && guy.battlechatter.countryid != self.battlechatter.countryid )
        {
            continue;
        }
        
        distsq = distance2dsquared( guy.origin, origin );
        
        if ( !isdefined( closest_distsq ) || distsq < closest_distsq )
        {
            closest_distsq = distsq;
            closest_guy = guy;
        }
    }
    
    return closest_guy;
}

// Namespace battlechatter
// Params 5
// Checksum 0xc990825d, Offset: 0x9272
// Size: 0x1fa
function function_ce7df4ebf491561c( possible_speakers, excludeid, requiredstate, requiresight, lastsighttime )
{
    best_guy = undefined;
    sighttarget = undefined;
    
    if ( requiresight )
    {
        sighttarget = self;
    }
    
    isselfsentient = issentient( self );
    
    foreach ( guy in possible_speakers )
    {
        if ( isselfsentient && guy == self )
        {
            continue;
        }
        
        if ( isdefined( guy.battlechatter.countryid ) && guy.team === self.team && isdefined( self.battlechatter.countryid ) && guy.battlechatter.countryid != self.battlechatter.countryid )
        {
            continue;
        }
        
        if ( 1 && isdefined( guy._blackboard.currentvehicle ) )
        {
            continue;
        }
        
        if ( guy dialogue::function_ef3bb46d2024effd() || !guy canchatter( requiredstate, sighttarget, undefined, lastsighttime ) )
        {
            continue;
        }
        
        if ( isdefined( guy.battlechatter ) && guy.battlechatter.npcid == excludeid )
        {
            continue;
        }
        
        if ( !isdefined( guy.var_861991271473c76 ) )
        {
            return guy;
        }
        
        if ( !isdefined( best_guy ) || guy.var_861991271473c76 < best_guy.var_861991271473c76 )
        {
            best_guy = guy;
        }
    }
    
    return best_guy;
}

// Namespace battlechatter
// Params 1
// Checksum 0xeb1ccadd, Offset: 0x9475
// Size: 0xa8
function getspeakers( team = self.team )
{
    possible_speakers = [];
    
    foreach ( guy in getaiarray( team ) )
    {
        if ( guy canchatter() )
        {
            possible_speakers[ possible_speakers.size ] = guy;
        }
    }
    
    return possible_speakers;
}

// Namespace battlechatter
// Params 2
// Checksum 0x15f7b250, Offset: 0x9526
// Size: 0x7f
function getplayersinrange( origin, radius )
{
    assert( isdefined( origin ) && isdefined( radius ) );
    
    if ( utility::issp() && distancesquared( origin, level.player.origin ) < squared( radius ) )
    {
        return [ level.player ];
    }
    
    if ( isdefined( level.var_417561f3a462d6c3 ) )
    {
        return [[ level.var_417561f3a462d6c3 ]]( origin, radius );
    }
    
    return [];
}

// Namespace battlechatter
// Params 5
// Checksum 0x7f954548, Offset: 0x95ae
// Size: 0x1b5
function function_130be1768e41d1d4( origin, radius, category, subcategory, options )
{
    assert( !( isdefined( options.team ) && isdefined( options.var_282bf9970a98e27e ) ), "<dev string:x621>" );
    
    if ( isdefined( options.var_282bf9970a98e27e ) )
    {
        ai = function_1d2c927ed696138b( origin, radius, options.var_282bf9970a98e27e );
    }
    else
    {
        ai = getaiinrange( origin, radius, options.team );
    }
    
    foreach ( guy in ai )
    {
        if ( options.otherent == guy )
        {
            continue;
        }
        
        if ( !isdefined( guy.battlechatter.countryid ) )
        {
            continue;
        }
        
        if ( origin[ 2 ] - guy.origin[ 2 ] > options.var_830f408a86b9bb88 )
        {
            continue;
        }
        
        if ( origin[ 2 ] - guy.origin[ 2 ] < options.var_8332568a86e033a2 )
        {
            continue;
        }
        
        function_98ae1f41148cc661( guy, options.otherent, category, subcategory, options.delay ?? randomfloatrange( 0.75, 1.5 ) );
    }
}

// Namespace battlechatter
// Params 3
// Checksum 0x8cc5840, Offset: 0x976b
// Size: 0x51
function getaiinrange( origin, radius, team )
{
    if ( isdefined( level.var_8e07c78f18ec732d ) )
    {
        return [[ level.var_8e07c78f18ec732d ]]( origin, radius, team );
    }
    
    if ( isdefined( team ) )
    {
        return getaiarrayinradius( origin, radius, team );
    }
    
    return getaiarrayinradius( origin, radius );
}

// Namespace battlechatter
// Params 1
// Checksum 0x580e3609, Offset: 0x97c5
// Size: 0xf7
function getenemiesinrange( radius )
{
    if ( !( isdefined( self.enemy.origin ) && isdefined( self.enemy ) && isdefined( self.enemy.team ) ) )
    {
        return [];
    }
    
    if ( !isdefined( radius ) )
    {
        radius = level.bcs_maxdist;
    }
    
    enemies = getaiinrange( self.enemy.origin, radius, self.enemy.team );
    
    if ( isdefined( self.team ) && self.team != "allies" && self.team != "neutral" )
    {
        players = getplayersinrange( self.enemy.origin, radius );
        enemies = arraycombine( enemies, players );
    }
    
    return enemies;
}

// Namespace battlechatter
// Params 3
// Checksum 0x2363844, Offset: 0x98c5
// Size: 0xee
function function_1d2c927ed696138b( origin, radius, my_team )
{
    enemiesinrange = [];
    
    if ( isdefined( my_team ) && isdefined( origin ) )
    {
        if ( !isdefined( radius ) )
        {
            radius = level.bcs_maxdist;
        }
        
        aiinrange = getaiinrange( origin, radius );
        
        if ( isdefined( aiinrange ) )
        {
            foreach ( ai in aiinrange )
            {
                if ( !isdefined( ai ) )
                {
                    continue;
                }
                
                if ( ai.team == my_team )
                {
                    continue;
                }
                
                enemiesinrange[ enemiesinrange.size ] = ai;
            }
        }
    }
    
    return enemiesinrange;
}

// Namespace battlechatter
// Params 2
// Checksum 0xaeb15a29, Offset: 0x99bc
// Size: 0x34, Type: bool
function isnear( target, radius )
{
    return distancesquared( target.origin, self.origin ) < squared( radius );
}

// Namespace battlechatter
// Params 2
// Checksum 0x9c22d31f, Offset: 0x99f9
// Size: 0x30
function function_650fcb19271636b2( var_d8505586e0d897f5, var_f2c2e2068164d350 )
{
    if ( isdefined( self.voice ) && self hasfemalevoice() )
    {
        return var_f2c2e2068164d350;
    }
    
    return var_d8505586e0d897f5;
}

// Namespace battlechatter
// Params 4
// Checksum 0x215e991d, Offset: 0x9a32
// Size: 0x84
function function_b44fb00b1156ebd0( enemy, var_5d2ede05ccf2f3e8, var_5d385e0da3c3ca8f, enemies )
{
    if ( isdefined( self.battlechatter ) && enemy == self.battlechatter.target )
    {
        return var_5d2ede05ccf2f3e8;
    }
    
    if ( !utility::ismp() && !isdefined( enemies ) )
    {
        enemies = getenemiesinrange();
    }
    
    if ( !utility::ismp() && enemies.size > 1 )
    {
        return var_5d385e0da3c3ca8f;
    }
    
    return var_5d2ede05ccf2f3e8;
}

// Namespace battlechatter
// Params 1
// Checksum 0xdd8579fd, Offset: 0x9abf
// Size: 0x4c
function set_target( target )
{
    guy = self;
    
    if ( self.ischatter )
    {
        guy = self.speaker;
    }
    
    if ( !isdefined( target ) )
    {
        target = guy.enemy;
    }
    
    guy function_b839cd17a1fcb5d2( target );
}

// Namespace battlechatter
// Params 0
// Checksum 0xb784fc83, Offset: 0x9b13
// Size: 0xa
function clear_target()
{
    function_b839cd17a1fcb5d2( undefined );
}

// Namespace battlechatter
// Params 1
// Checksum 0xc301bdaf, Offset: 0x9b25
// Size: 0xfb
function function_b839cd17a1fcb5d2( target )
{
    if ( isdefined( self.origin ) && isdefined( self.team ) )
    {
        foreach ( ally in getaiinrange( self.origin, level.bcs_maxdist, self.team ) )
        {
            if ( isdefined( ally.battlechatter ) )
            {
                ally.battlechatter.target = target;
            }
        }
        
        return;
    }
    
    if ( isdefined( self.battlechatter ) )
    {
        self.battlechatter.target = target;
    }
}

// Namespace battlechatter
// Params 1
// Checksum 0x9ac063b2, Offset: 0x9c28
// Size: 0x13
function function_5efbf583e218d4f3( params )
{
    thread function_89d01d6c378dcfc5();
}

// Namespace battlechatter
// Params 0
// Checksum 0x4099047d, Offset: 0x9c43
// Size: 0x250
function function_89d01d6c378dcfc5()
{
    if ( !( isdefined( level.battlechatter ) && isdefined( self ) ) )
    {
        return;
    }
    
    if ( self.nocorpse )
    {
        return;
    }
    
    if ( !( isdefined( self.battlechatter ) && isdefined( self.battlechatter.countryid ) ) )
    {
        return;
    }
    
    if ( !isdefined( level.var_37c0365dad77223 ) )
    {
        return;
    }
    
    corpse = undefined;
    num_tries = 10;
    var_e4890a00d660c30f = 1.5;
    countryid = self.battlechatter.countryid;
    name = self.battlechatter.name;
    voice = self.voice;
    team = self.team;
    count = 0;
    
    while ( count < num_tries && !isdefined( corpse ) )
    {
        array = [[ level.var_37c0365dad77223 ]]( self.origin, level.bcs_neardist );
        
        foreach ( corpseent in array )
        {
            if ( corpseent.birthtime == gettime() && distancesquared( corpseent.origin, self.origin ) <= var_e4890a00d660c30f )
            {
                corpse = corpseent;
                break;
            }
        }
        
        count++;
        waitframe();
    }
    
    if ( !isdefined( corpse ) )
    {
        return;
    }
    
    corpse.battlechatter = spawnstruct();
    corpse.battlechatter.countryid = countryid;
    corpse.battlechatter.name = name;
    corpse.voice = voice;
    corpse.battlechatterallowed = 1;
    corpse.team = team;
    
    if ( isdefined( level.stealth ) )
    {
        corpse thread battlechatter_ai::corpseloop();
    }
}

// Namespace battlechatter
// Params 1
// Checksum 0x32e7ffe7, Offset: 0x9e9b
// Size: 0x15
function select_random( array )
{
    return array[ randomint( array.size ) ];
}

// Namespace battlechatter
// Params 2
// Checksum 0x35aa599e, Offset: 0x9eb9
// Size: 0x9f
function random_variation( base, count )
{
    if ( !isdefined( level.battlechatter.variations[ base ] ) )
    {
        array = [];
        
        for ( i = 0; i < count ; i++ )
        {
            array[ i ] = base + i;
        }
        
        level.battlechatter.variations[ base ] = utility::create_deck( array, 1, 1, 1 );
    }
    
    return level.battlechatter.variations[ base ] utility::deck_draw();
}

// Namespace battlechatter
// Params 0
// Checksum 0x6335aa7c, Offset: 0x9f61
// Size: 0x99
function getrankvalue()
{
    if ( !isdefined( self.airank ) )
    {
        return undefined;
    }
    
    switch ( self.airank )
    {
        case #"hash_f26abb676d8bacec":
            return 0;
        case #"hash_66b7b438a1ca57c2":
            return 1;
        case #"hash_7f4da8c6011cd2d4":
            return 2;
        case #"hash_1453ef0182122bcb":
            return 3;
        case #"hash_9400db43df3e85c2":
            return 4;
        case #"hash_bcc86315db6ecf35":
            return 5;
        case #"hash_f1891197c342b74b":
            return 6;
        default:
            return undefined;
    }
}

// Namespace battlechatter
// Params 0
// Checksum 0x8dcc7004, Offset: 0xa002
// Size: 0x10d
function function_735a51a18ea3f10e()
{
    if ( !isdefined( level.battlechatter.callsigns ) )
    {
        callsigns = [];
        
        foreach ( ai in getaiarray() )
        {
            if ( isdefined( ai.callsign ) )
            {
                callsigns[ callsigns.size ] = ai.callsign;
            }
        }
        
        if ( callsigns.size > 0 )
        {
            level.battlechatter.callsigns = utility::create_deck( callsigns );
        }
    }
    
    if ( isdefined( level.battlechatter.callsigns ) )
    {
        self.callsign = level.battlechatter.callsigns utility::deck_draw();
    }
}

// Namespace battlechatter
// Params 6
// Checksum 0x264c06c7, Offset: 0xa117
// Size: 0xa6
function addeventplaybcs( type, name, modifier, delay, stealthevent, force )
{
    self endon( "death" );
    self endon( "removed from battleChatter" );
    self endon( "cancel speaking" );
    self endon( "stop event play bcs" );
    
    if ( !isdefined( modifier ) )
    {
        return;
    }
    
    if ( isdefined( delay ) )
    {
        wait delay;
    }
    
    if ( name == "state_change" )
    {
        executed = executeevent( modifier );
        return;
    }
    
    executed = executeevent( "announce", [ modifier, stealthevent ] );
}

// Namespace battlechatter
// Params 0
// Checksum 0x394ec7d0, Offset: 0xa1c5
// Size: 0x4b
function function_97b58bd147bf0b06()
{
    radio = self.speaker dialogue::get_radio_emitter();
    radio.battlechatter.npcid = "l1r";
    radio.name = "Team Leader (Radio)";
    return radio;
}

// Namespace battlechatter
// Params 2
// Checksum 0x939fb10a, Offset: 0xa219
// Size: 0x39c
function function_b394d5ccfe1e9f93( guy, isleader )
{
    if ( !isdefined( guy ) )
    {
        guy = self.speaker;
    }
    
    if ( !( isdefined( guy.voice ) && isdefined( guy.battlechatter ) ) )
    {
        return;
    }
    
    radio = spawnstruct();
    radio.vo_parent = guy;
    radio.origin = guy.origin;
    radio.isradioemitter = 1;
    radio.battlechatterallowed = 1;
    radio.team = self.team ?? "allies";
    radio.battlechatter = spawnstruct();
    
    if ( !isdefined( guy.battlechatter.countryid ) )
    {
        guy.battlechatter.countryid = "AQS";
    }
    
    if ( isleader )
    {
        radio.battlechatter.isleader = 1;
        radio.battlechatter.lookupid = guy.battlechatter.countryid + "_L";
        radio.battlechatter.name = "actual";
        
        switch ( guy.battlechatter.countryid )
        {
            case #"hash_782a246ccf672edf":
                npcids = [ "pmcl" ];
                break;
            case #"hash_8a9636c94e6076d":
                npcids = [ "crtl" ];
                break;
            case #"hash_fab89df6bdd4bc00":
                npcids = [ "rusl" ];
                break;
            case #"hash_4438aa6cb42c06a3":
                npcids = [ "konl" ];
                break;
            case #"hash_7850676ccf85ad6c":
                npcids = [ "panl" ];
                break;
            case #"hash_e9a4756c844899c3":
                npcids = [ "gtgl" ];
                break;
            case #"hash_35a2bd6cac97d049":
                npcids = [ "irql" ];
                break;
            case #"hash_178adf6c9cb5b60c":
                npcids = [ "musl" ];
                break;
            case #"hash_8d55d6c9508903d":
                npcids = [ "kgfl" ];
            case #"hash_f8933b6c8c234a3c":
            default:
                npcids = [ "aqld" ];
                break;
        }
    }
    else
    {
        npcids = [];
        
        foreach ( usedid in anim.usedids[ guy.voice ] )
        {
            if ( usedid.npcid != guy.battlechatter.npcid )
            {
                npcids[ npcids.size ] = usedid.npcid;
            }
        }
    }
    
    radio.battlechatter.countryid = guy.battlechatter.countryid;
    radio.battlechatter.npcid = utility::random( npcids );
    return radio;
}

// Namespace battlechatter
// Params 1
// Checksum 0x6c3f666, Offset: 0xa5be
// Size: 0x16
function function_430ce31cc09b55c0( guy )
{
    return function_b394d5ccfe1e9f93( guy, 1 );
}

// Namespace battlechatter
// Params 0
// Checksum 0x2183b8cb, Offset: 0xa5dd
// Size: 0x107
function getname()
{
    if ( !( isdefined( self.battlechatter ) && isdefined( self.battlechatter.countryid ) ) )
    {
        return;
    }
    
    if ( !isdefined( self.battlechatter.name ) )
    {
        if ( !isdefined( level.battlechatter.names[ self.battlechatter.countryid ] ) )
        {
            namespace_326cae52b2158981::function_b0cd39ab5c17dcba( self.battlechatter.countryid );
            
            if ( !isdefined( level.battlechatter.names[ self.battlechatter.countryid ] ) )
            {
                return;
            }
        }
        
        self.battlechatter.name = level.battlechatter.names[ self.battlechatter.countryid ] utility::deck_draw();
    }
    
    return self.battlechatter.name;
}

// Namespace battlechatter
// Params 1
// Checksum 0x228f58d5, Offset: 0xa6ed
// Size: 0x49
function getclosestplayer( origin )
{
    if ( !isdefined( level.players ) )
    {
        return level.player;
    }
    else if ( level.players.size == 0 )
    {
        return undefined;
    }
    
    return sortbydistance( level.players, origin )[ 0 ];
}

// Namespace battlechatter
// Params 1
// Checksum 0x8414071d, Offset: 0xa73f
// Size: 0xce
function function_a9b9bc2e9ae0ab49( origin )
{
    if ( !isdefined( origin ) )
    {
        origin = self.origin;
    }
    
    region_trigs = getentarray( "bcs_region", #script_noteworthy );
    
    foreach ( trig in region_trigs )
    {
        if ( ispointinvolume( origin, trig ) && isdefined( trig.targetname ) )
        {
            return trig.targetname;
        }
    }
    
    return "none";
}

// Namespace battlechatter
// Params 0
// Checksum 0x64576a9f, Offset: 0xa816
// Size: 0x14d
function getcombatstate()
{
    if ( utility::is_dead_or_dying( self ) )
    {
        return "dead";
    }
    
    if ( isdefined( self.battlechatter.stateoverride ) )
    {
        result = self.battlechatter.stateoverride;
        
        if ( isfunction( result ) )
        {
            result = self [[ result ]]();
        }
        
        var_7237854e3be197ca = result;
        
        if ( isdefined( var_7237854e3be197ca ) )
        {
            return var_7237854e3be197ca;
        }
    }
    
    if ( !isdefined( level.stealth ) )
    {
        return ( isai( self ) && self iscurrentenemyvalid() ? "combat" : "idle" );
    }
    
    if ( isdefined( self.fnisinstealthidle ) && [[ self.fnisinstealthidle ]]() )
    {
        return "idle";
    }
    
    if ( isdefined( self.fnisinstealthinvestigate ) && [[ self.fnisinstealthinvestigate ]]() )
    {
        return "investigate";
    }
    
    if ( isdefined( self.fnisinstealthhunt ) && [[ self.fnisinstealthhunt ]]() )
    {
        return "hunt";
    }
    
    if ( isdefined( self.fnisinstealthcombat ) && [[ self.fnisinstealthcombat ]]() )
    {
        return "combat";
    }
    
    return isai( self ) && self iscurrentenemyvalid() ? "combat" : "unset";
}

// Namespace battlechatter
// Params 3
// Checksum 0xcc81bd79, Offset: 0xa96b
// Size: 0x1e
function addcustombc( array, states, random )
{
    
}

// Namespace battlechatter
// Params 3
// Checksum 0x424cb279, Offset: 0xa991
// Size: 0x1e
function setcurrentcustombcevent( event, states, looping )
{
    
}

// Namespace battlechatter
// Params 1
// Checksum 0xabcf1f8c, Offset: 0xa9b7
// Size: 0x59, Type: bool
function function_399b48e93d70a156( state )
{
    if ( !( isdefined( level.battlechatter.customstealth ) && isdefined( level.battlechatter.customstealth[ state ] ) ) )
    {
        return false;
    }
    
    return level.battlechatter.customstealth[ state ].size > 0;
}

// Namespace battlechatter
// Params 1
// Checksum 0x4815c1b7, Offset: 0xaa19
// Size: 0xaa
function function_c5edc4d3fdb3dea1( state )
{
    assert( isdefined( level.battlechatter.customstealth ), "<dev string:x64d>" );
    index = level.battlechatter.customstealthindexes[ state ];
    sequence = level.battlechatter.customstealth[ state ][ index ];
    index++;
    
    if ( index >= level.battlechatter.customstealth[ state ].size )
    {
        level.battlechatter.customstealth[ state ] = [];
    }
    
    return sequence;
}

// Namespace battlechatter
// Params 3
// Checksum 0xdeebc43e, Offset: 0xaacc
// Size: 0x19c
function function_82e45e3126ee778a( array, states, random )
{
    if ( !isdefined( level.battlechatter.customstealth ) )
    {
        level.battlechatter.customstealth = [];
    }
    
    if ( !isarray( states ) )
    {
        states = [ states ];
    }
    
    foreach ( state in states )
    {
        if ( !isdefined( level.battlechatter.customstealth[ state ] ) )
        {
            level.battlechatter.customstealth[ state ] = [];
        }
        
        foreach ( sequence in array )
        {
            size = level.battlechatter.customstealth[ state ].size;
            level.battlechatter.customstealth[ state ][ size ] = sequence;
        }
    }
}

// Namespace battlechatter
// Params 1
// Checksum 0x4f666936, Offset: 0xac70
// Size: 0x5c
function getrelativeangles( ent )
{
    assert( isdefined( ent ) );
    angles = ent.angles;
    
    if ( !isplayer( ent ) )
    {
        if ( isdefined( self.node ) )
        {
            angles = self.node.angles;
        }
    }
    
    return angles;
}

// Namespace battlechatter
// Params 1
// Checksum 0x1da9ffde, Offset: 0xacd5
// Size: 0x20, Type: bool
function sideisleftright( side )
{
    return side == "left" || side == "right";
}

// Namespace battlechatter
// Params 3
// Checksum 0xe9d22d9, Offset: 0xacfe
// Size: 0xba
function getdirectionfacingflank( vorigin, vpoint, vfacing )
{
    var_d2668318c7a0e07d = vectortoangles( vfacing );
    anglestopoint = vectortoangles( vpoint - vorigin );
    angle = var_d2668318c7a0e07d[ 1 ] - anglestopoint[ 1 ];
    angle += 360;
    angle = int( angle ) % 360;
    
    if ( angle > 315 || angle < 45 )
    {
        direction = "front";
    }
    else if ( angle < 135 )
    {
        direction = "right";
    }
    else if ( angle < 225 )
    {
        direction = "rear";
    }
    else
    {
        direction = "left";
    }
    
    return direction;
}

// Namespace battlechatter
// Params 1
// Checksum 0x5694c136, Offset: 0xadc1
// Size: 0x11e
function normalizecompassdirection( direction )
{
    assert( isdefined( direction ) );
    new = undefined;
    
    switch ( direction )
    {
        case #"hash_b9ff0a9f617355e4":
            new = "n";
            break;
        case #"hash_b66b59dcd06dfad3":
            new = "nw";
            break;
        case #"hash_a1e9b77432f55b0e":
            new = "w";
            break;
        case #"hash_abed5ad834825ff1":
            new = "sw";
            break;
        case #"hash_fbd39e4f5634905a":
            new = "s";
            break;
        case #"hash_8856b747c93e7793":
            new = "se";
            break;
        case #"hash_22ce3b03c1e51a9c":
            new = "e";
            break;
        case #"hash_493bfd7122639b31":
            new = "ne";
            break;
        case #"hash_c1ae739be788bf38":
            new = "impossible";
            break;
        default:
            assertmsg( "<dev string:x69a>" + direction );
            return;
    }
    
    assert( isdefined( new ) );
    return new;
}

// Namespace battlechatter
// Params 2
// Checksum 0x7961ae9f, Offset: 0xaee8
// Size: 0x133
function getdirectioncompass( vorigin, vpoint )
{
    angles = vectortoangles( vpoint - vorigin );
    angle = angles[ 1 ];
    northyaw = getnorthyaw();
    angle -= northyaw;
    
    if ( angle < 0 )
    {
        angle += 360;
    }
    else if ( angle > 360 )
    {
        angle -= 360;
    }
    
    if ( angle < 22.5 || angle > 337.5 )
    {
        direction = "north";
    }
    else if ( angle < 67.5 )
    {
        direction = "northwest";
    }
    else if ( angle < 112.5 )
    {
        direction = "west";
    }
    else if ( angle < 157.5 )
    {
        direction = "southwest";
    }
    else if ( angle < 202.5 )
    {
        direction = "south";
    }
    else if ( angle < 247.5 )
    {
        direction = "southeast";
    }
    else if ( angle < 292.5 )
    {
        direction = "east";
    }
    else if ( angle < 337.5 )
    {
        direction = "northeast";
    }
    else
    {
        direction = "impossible";
    }
    
    return direction;
}

// Namespace battlechatter
// Params 2
// Checksum 0x6dd21b84, Offset: 0xb024
// Size: 0x3c
function getdistancemeters( source, target )
{
    distanceinches = distance2d( source, target );
    distancemeters = 0.0254 * distanceinches;
    return distancemeters;
}

// Namespace battlechatter
// Params 2
// Checksum 0x28b933da, Offset: 0xb069
// Size: 0xf4
function getdistancemetersnormalized( source, target )
{
    distancemeters = getdistancemeters( source, target );
    
    if ( distancemeters < 15 )
    {
        return "10";
    }
    
    if ( distancemeters < 25 )
    {
        return "20";
    }
    
    if ( distancemeters < 35 )
    {
        return "30";
    }
    
    if ( distancemeters < 45 )
    {
        return "40";
    }
    
    if ( distancemeters < 55 )
    {
        return "50";
    }
    
    if ( distancemeters < 65 )
    {
        return "60";
    }
    
    if ( distancemeters < 75 )
    {
        return "70";
    }
    
    if ( distancemeters < 85 )
    {
        return "80";
    }
    
    if ( distancemeters < 95 )
    {
        return "90";
    }
    
    if ( distancemeters < 125 )
    {
        return "100";
    }
    
    return undefined;
}

// Namespace battlechatter
// Params 2
// Checksum 0xae8913b2, Offset: 0xb165
// Size: 0x3c
function getdistancemiles( source, target )
{
    distanceinches = distance2d( source, target );
    distancemiles = 1.57828e-05 * distanceinches;
    return distancemiles;
}

// Namespace battlechatter
// Params 2
// Checksum 0xb10e1f63, Offset: 0xb1aa
// Size: 0x80
function getdistancemilesnormalized( source, target )
{
    distancemiles = getdistancemiles( source, target );
    
    if ( distancemiles < 5 )
    {
        return "4";
    }
    
    if ( distancemiles < 6 )
    {
        return "5";
    }
    
    if ( distancemiles < 7 )
    {
        return "6";
    }
    
    if ( distancemiles < 15 )
    {
        return "10";
    }
    
    return "15";
}

// Namespace battlechatter
// Params 1
// Checksum 0x56a803f5, Offset: 0xb232
// Size: 0x7b
function getfrontarcclockdirection( direction )
{
    assert( isdefined( direction ) );
    fadirection = "undefined";
    
    if ( direction == "10" || direction == "11" )
    {
        fadirection = "10";
    }
    else if ( direction == "12" )
    {
        fadirection = direction;
    }
    else if ( direction == "1" || direction == "2" )
    {
        fadirection = "2";
    }
    
    return fadirection;
}

// Namespace battlechatter
// Params 3
// Checksum 0x794c6968, Offset: 0xb2b6
// Size: 0x16c
function getdirectionfacingclock( viewerangles, viewerorigin, targetorigin )
{
    forward = anglestoforward( viewerangles );
    vfacing = vectornormalize( forward );
    var_d2668318c7a0e07d = vectortoangles( vfacing );
    anglestopoint = vectortoangles( targetorigin - viewerorigin );
    angle = var_d2668318c7a0e07d[ 1 ] - anglestopoint[ 1 ];
    angle += 360;
    angle = int( angle ) % 360;
    
    if ( angle > 345 || angle < 15 )
    {
        direction = "12";
    }
    else if ( angle < 45 )
    {
        direction = "1";
    }
    else if ( angle < 75 )
    {
        direction = "2";
    }
    else if ( angle < 105 )
    {
        direction = "3";
    }
    else if ( angle < 135 )
    {
        direction = "4";
    }
    else if ( angle < 165 )
    {
        direction = "5";
    }
    else if ( angle < 195 )
    {
        direction = "6";
    }
    else if ( angle < 225 )
    {
        direction = "7";
    }
    else if ( angle < 255 )
    {
        direction = "8";
    }
    else if ( angle < 285 )
    {
        direction = "9";
    }
    else if ( angle < 315 )
    {
        direction = "10";
    }
    else
    {
        direction = "11";
    }
    
    return direction;
}

// Namespace battlechatter
// Params 2
// Checksum 0xa67c0c0b, Offset: 0xb42b
// Size: 0xa7
function getdegreeselevation( viewerorigin, targetorigin )
{
    ht = targetorigin[ 2 ] - viewerorigin[ 2 ];
    dist = distance2d( viewerorigin, targetorigin );
    angle = atan( ht / dist );
    
    if ( angle < 15 || angle > 65 )
    {
        return angle;
    }
    
    if ( angle < 25 )
    {
        return 20;
    }
    
    if ( angle < 35 )
    {
        return 30;
    }
    
    if ( angle < 45 )
    {
        return 40;
    }
    
    if ( angle < 55 )
    {
        return 50;
    }
    
    if ( angle < 65 )
    {
        return 60;
    }
}

// Namespace battlechatter
// Params 1
// Checksum 0xb2780311, Offset: 0xb4da
// Size: 0x1a
function getvectorrightangle( vdir )
{
    return ( vdir[ 1 ], 0 - vdir[ 0 ], vdir[ 2 ] );
}

// Namespace battlechatter
// Params 1
// Checksum 0xe35c4c9c, Offset: 0xb4fd
// Size: 0x5e
function getvectorarrayaverage( avangles )
{
    var_cc4bc55d2af11847 = ( 0, 0, 0 );
    
    for ( i = 0; i < avangles.size ; i++ )
    {
        var_cc4bc55d2af11847 += avangles[ i ];
    }
    
    return ( var_cc4bc55d2af11847[ 0 ] / avangles.size, var_cc4bc55d2af11847[ 1 ] / avangles.size, var_cc4bc55d2af11847[ 2 ] / avangles.size );
}

// Namespace battlechatter
// Params 1
// Checksum 0x6b4b74af, Offset: 0xb564
// Size: 0x28, Type: bool
function function_e02d101943406091( otherent )
{
    if ( !isdefined( otherent ) )
    {
        return false;
    }
    
    if ( !otherent.disguised )
    {
        return false;
    }
    
    return true;
}

// Namespace battlechatter
// Params 1
// Checksum 0x37fcddbb, Offset: 0xb595
// Size: 0xc
function get_text( segment )
{
    
}

// Namespace battlechatter
// Params 2
// Checksum 0xd6185591, Offset: 0xb5a9
// Size: 0x2a
function set_battlechatter_variable( team, val )
{
    level.battlechatter[ team ] = val;
    update_battlechatter_hud();
}

// Namespace battlechatter
// Params 0
// Checksum 0xfabeeaab, Offset: 0xb5db
// Size: 0x1ef
function update_battlechatter_hud()
{
    /#
        if ( getdvarint( @"loc_warnings", 0 ) == 1 )
        {
            return;
        }
        
        if ( getdvar( @"hash_2f6380dc3031a0fc", "<dev string:x147>" ) != "<dev string:x147>" )
        {
            return;
        }
        
        if ( !isdefined( level.bcs_hud ) )
        {
            x = -50;
            y = 460;
            x_offset = 22;
            hud = newhudelem();
            hud.x = x;
            hud.y = y;
            hud.color = ( 0.4, 0.55, 0.9 );
            level.bcs_hud = hud;
        }
        
        if ( getdvar( @"debug_battlechatter" ) != "<dev string:x6c0>" )
        {
            level.bcs_hud settext( "<dev string:x147>" );
            return;
        }
        
        msg = "<dev string:x6c6>";
        count = 0;
        
        if ( isdefined( level.battlechatter ) )
        {
            teams = [];
            teams[ "<dev string:x3d1>" ] = level.battlechatter[ "<dev string:x3d1>" ];
            teams[ "<dev string:x28d>" ] = level.battlechatter[ "<dev string:x28d>" ];
            
            foreach ( team, val in teams )
            {
                if ( val )
                {
                    msg = msg + team + "<dev string:x142>";
                    count++;
                }
            }
        }
        else
        {
            msg += "<dev string:x6e1>";
            count++;
        }
        
        if ( count == 0 )
        {
            msg += "<dev string:x704>";
        }
        
        level.bcs_hud settext( msg );
    #/
}

// Namespace battlechatter
// Params 0
// Checksum 0x1cd5ef54, Offset: 0xb7d2
// Size: 0x155
function bcprint_info()
{
    self endon( "death" );
    
    /#
        id = self.battlechatter.npcid;
        
        if ( !isdefined( id ) )
        {
            id = "<dev string:x147>";
        }
        
        countryid = self.battlechatter.countryid;
        
        if ( !isdefined( countryid ) )
        {
            countryid = "<dev string:x147>";
        }
        
        while ( true )
        {
            if ( battlechatter_canprint() )
            {
                if ( !isdefined( self.battlechatterallowed ) || self.battlechatter_removed )
                {
                    print3d( self.origin + ( 0, 0, 24 ), "<dev string:x712>", ( 1, 0, 1 ), 1, 0.35, 1 );
                }
                else if ( self.battlechatterallowed )
                {
                    print3d( self.origin + ( 0, 0, 24 ), "<dev string:x721>" + countryid + id, ( 0, 1, 0 ), 1, 0.35, 1 );
                }
                else
                {
                    print3d( self.origin + ( 0, 0, 24 ), "<dev string:x721>" + countryid + id, ( 1, 0, 0 ), 1, 0.35, 1 );
                }
            }
            
            waitframe();
        }
    #/
}

// Namespace battlechatter
// Params 0
// Checksum 0xc603e11f, Offset: 0xb92f
// Size: 0x3a, Type: bool
function battlechatter_canprint()
{
    /#
        if ( getdvar( @"debug_bcprint" ) == self.team || getdvar( @"debug_bcprint" ) == "<dev string:x729>" )
        {
            return true;
        }
    #/
    
    return false;
}

// Namespace battlechatter
// Params 0
// Checksum 0x64f50a76, Offset: 0xb972
// Size: 0x3a, Type: bool
function battlechatter_canprintdump()
{
    /#
        if ( getdvar( @"hash_9627c73338f91622" ) == self.team || getdvar( @"hash_9627c73338f91622" ) == "<dev string:x729>" )
        {
            return true;
        }
    #/
    
    return false;
}

/#

    // Namespace battlechatter
    // Params 2
    // Checksum 0x290fabf9, Offset: 0xb9b5
    // Size: 0xb8, Type: dev
    function battlechatter_print( alias, color )
    {
        if ( !battlechatter_canprint() )
        {
            return;
        }
        
        if ( !isdefined( color ) )
        {
            color = "<dev string:x730>";
        }
        
        colorkey = "<dev string:x730>";
        
        switch ( color )
        {
            case #"hash_97430f6c58e61cbc":
                colorkey = "<dev string:x740>";
                break;
            case #"hash_2ac407c1cd5943a9":
                colorkey = "<dev string:x750>";
                break;
            case #"hash_6686d129776d649a":
                colorkey = "<dev string:x75e>";
                break;
        }
        
        println( colorkey + self.origin + "<dev string:x764>" + self.name + "<dev string:x76a>" + alias );
    }

    // Namespace battlechatter
    // Params 1
    // Checksum 0x9bd1b867, Offset: 0xba75
    // Size: 0x1df, Type: dev
    function battlechatter_printdump( alias )
    {
        if ( !battlechatter_canprintdump() )
        {
            return;
        }
        
        dumptype = getdvar( @"hash_3cb0b3f110a54cf2", "<dev string:x772>" );
        
        if ( dumptype != "<dev string:x772>" && dumptype != "<dev string:x779>" )
        {
            return;
        }
        
        var_8741cc0c336c78a0 = -1;
        
        if ( isdefined( level.var_66f4410fa44c341 ) )
        {
            var_8741cc0c336c78a0 = ( gettime() - level.var_66f4410fa44c341 ) / 1000;
        }
        
        level.var_66f4410fa44c341 = gettime();
        
        if ( dumptype == "<dev string:x772>" )
        {
            if ( !utility::flag_exist( "<dev string:x780>" ) )
            {
                utility::flag_init( "<dev string:x780>" );
            }
            
            if ( !isdefined( level.var_a5b74b32d1fe356a ) )
            {
                filepath = "<dev string:x79b>" + level.script + "<dev string:x7bf>";
                level.var_a5b74b32d1fe356a = openfile( filepath, "<dev string:x7c7>" );
            }
            
            aliastype = getaliastypefromsoundalias( alias );
            dumpstring = level.script + "<dev string:x7d0>" + self.operatorcustomization.voice + "<dev string:x7d0>" + aliastype;
            battlechatter_printdumpline( level.var_a5b74b32d1fe356a, dumpstring, "<dev string:x780>" );
            return;
        }
        
        if ( dumptype == "<dev string:x779>" )
        {
            if ( !utility::flag_exist( "<dev string:x7d5>" ) )
            {
                utility::flag_init( "<dev string:x7d5>" );
            }
            
            if ( !isdefined( level.var_81dcfda6de38eb66 ) )
            {
                filepath = "<dev string:x79b>" + level.script + "<dev string:x7f0>";
                level.var_81dcfda6de38eb66 = openfile( filepath, "<dev string:x7c7>" );
            }
            
            dumpstring = "<dev string:x7f8>" + var_8741cc0c336c78a0 + "<dev string:x7fd>";
            dumpstring += alias;
            battlechatter_printdumpline( level.var_81dcfda6de38eb66, dumpstring, "<dev string:x7d5>" );
        }
    }

    // Namespace battlechatter
    // Params 2
    // Checksum 0x7afa0793, Offset: 0xbc5c
    // Size: 0x2b, Type: dev
    function battlechatter_debugprint( alias, color )
    {
        battlechatter_print( alias, color );
        thread battlechatter_printdump( alias );
    }

    // Namespace battlechatter
    // Params 3
    // Checksum 0x291d0722, Offset: 0xbc8f
    // Size: 0x4f, Type: dev
    function battlechatter_printdumpline( file, str, controlflag )
    {
        if ( utility::flag( controlflag ) )
        {
            utility::flag_wait( controlflag );
        }
        
        utility::flag_set( controlflag );
        fprintln( file, str );
        utility::flag_clear( controlflag );
    }

#/

// Namespace battlechatter
// Params 1
// Checksum 0x7833fde, Offset: 0xbce6
// Size: 0xcc
function getaliastypefromsoundalias( alias )
{
    if ( getsubstr( alias, 0, 6 ) == "dx_vom" )
    {
        aliastype = getsubstr( alias, 7, alias.size );
    }
    else
    {
        if ( self == anim.player )
        {
            prefix = self.battlechatter.countryid + "_";
        }
        else if ( getsubstr( alias, 0, 6 ) == "dx_sbc" )
        {
            prefix = bc_prefix( "stealth" );
        }
        else
        {
            prefix = bc_prefix();
        }
        
        assert( issubstr( alias, prefix ), "<dev string:x808>" + alias + "<dev string:x837>" + prefix + "<dev string:x852>" );
        aliastype = getsubstr( alias, prefix.size, alias.size );
    }
    
    return aliastype;
}

// Namespace battlechatter
// Params 1
// Checksum 0x9da27b4f, Offset: 0xbdbb
// Size: 0x38
function function_8dbb97f7a0f85de2( seconds )
{
    if ( isdefined( self.battlechatter ) )
    {
        self.battlechatter.var_8568b6a2b1bdc9a2 = gettime() + seconds * 1000;
    }
}

// Namespace battlechatter
// Params 0
// Checksum 0x1d25fe97, Offset: 0xbdfb
// Size: 0xc0, Type: bool
function function_3146b0fcae68998f()
{
    if ( !canchatter( "combat" ) )
    {
        return true;
    }
    
    if ( utility::issp() && !isalive( level.player ) )
    {
        return true;
    }
    
    if ( !function_333c924b7c149360( 3 ) )
    {
        if ( isdefined( self.battlechatter.var_788421b4784edf9a ) || !isdefined( self._blackboard ) )
        {
            return true;
        }
        
        if ( !shotrecently( 3 ) )
        {
            self.battlechatter.var_788421b4784edf9a = gettime();
        }
        
        return true;
    }
    
    if ( !isdefined( self.battlechatter.var_8568b6a2b1bdc9a2 ) )
    {
        return false;
    }
    
    return self.battlechatter.var_8568b6a2b1bdc9a2 > gettime();
}

// Namespace battlechatter
// Params 2
// Checksum 0xae9a64c3, Offset: 0xbec4
// Size: 0xc6, Type: bool
function function_333c924b7c149360( timeseconds, requiresight = 0 )
{
    if ( self.pacifist || self.ignoreall || self.dontevershoot )
    {
        return false;
    }
    
    if ( !isdefined( self.enemy ) || utility::is_dead_or_dying( self.enemy ) )
    {
        return false;
    }
    
    if ( !utility::ismp() && requiresight && !self seerecently( self.enemy, timeseconds ) )
    {
        return false;
    }
    
    if ( isdefined( self.asmtrackasm ) && asm::asm_currentstatehasflag( self.asmtrackasm, "aim" ) )
    {
        return true;
    }
    
    if ( shotrecently( timeseconds ) )
    {
        return true;
    }
    
    return false;
}

// Namespace battlechatter
// Params 1
// Checksum 0x4fdaec75, Offset: 0xbf93
// Size: 0x2b, Type: bool
function shotrecently( timeseconds )
{
    return self._blackboard.shootparams_lastshoottime > gettime() - timeseconds * 1000;
}

// Namespace battlechatter
// Params 2
// Checksum 0xfd7a34f3, Offset: 0xbfc7
// Size: 0x9c
function function_60af3649d76450da( array, maxsize = array.size - 1 )
{
    foreach ( key, item in array )
    {
        if ( array.size <= maxsize )
        {
            return array;
        }
        
        array[ key ] = undefined;
    }
}

/#

    // Namespace battlechatter
    // Params 0
    // Checksum 0x27ecf567, Offset: 0xc06b
    // Size: 0x30, Type: dev
    function function_a7582e7ca9b907c5()
    {
        level endon( "<dev string:x858>" );
        level notify( "<dev string:x866>" );
        level endon( "<dev string:x866>" );
        
        while ( true )
        {
            waittillframeend();
            function_2f9773629c3fb45c( 1 );
            waitframe();
        }
    }

    // Namespace battlechatter
    // Params 1
    // Checksum 0x11556dbb, Offset: 0xc0a3
    // Size: 0x14a, Type: dev
    function function_2f9773629c3fb45c( debugdrawframeduration )
    {
        if ( !getdvarint( @"hash_4b7858e66804e305" ) )
        {
            return;
        }
        
        offsety = 20;
        debugposx = 50;
        debugposy = 500;
        debugtextcolor = ( 0, 1, 0 );
        debugtextscale = 1;
        debugtext = "<dev string:x88d>";
        printtoscreen2d( debugposx, debugposy, debugtext, debugtextcolor, debugtextscale, debugdrawframeduration );
        debugposy += offsety;
        
        if ( !isdefined( level.var_7ae4edfde7c1a849 ) || utility::queue_isempty( level.var_7ae4edfde7c1a849 ) )
        {
            return;
        }
        
        index = level.var_7ae4edfde7c1a849.rear;
        
        while ( index != level.var_7ae4edfde7c1a849.front )
        {
            debug_string = level.var_7ae4edfde7c1a849.array[ index ];
            
            if ( !isdefined( debug_string ) )
            {
                continue;
            }
            
            printtoscreen2d( debugposx, debugposy, debug_string, debugtextcolor, debugtextscale, debugdrawframeduration );
            debugposy += offsety;
            index--;
            
            if ( index < 0 )
            {
                index += level.var_7ae4edfde7c1a849.capacity;
            }
        }
    }

    // Namespace battlechatter
    // Params 2
    // Checksum 0x80975796, Offset: 0xc1f5
    // Size: 0x128, Type: dev
    function function_4c3d5af8f9c8b650( data, executed )
    {
        if ( !( isdefined( data ) && isdefined( data.category ) ) )
        {
            return;
        }
        
        if ( !isdefined( level.var_7ae4edfde7c1a849 ) )
        {
            level.var_7ae4edfde7c1a849 = utility::queue_create( 20 );
            level thread function_a7582e7ca9b907c5();
        }
        
        debug_string = "<dev string:x8a4>" + data.category;
        
        if ( isdefined( data.subcategory ) )
        {
            debug_string += "<dev string:x8b2>" + data.subcategory;
        }
        
        debug_string += "<dev string:x41a>";
        debug_string += "<dev string:x8b7>" + istrue( executed ) + "<dev string:x41a>";
        debug_string += "<dev string:x8c5>" + gettime() + "<dev string:x41a>";
        
        if ( level.var_7ae4edfde7c1a849.array.size == level.var_7ae4edfde7c1a849.capacity )
        {
            level.var_7ae4edfde7c1a849 = utility::function_6aa5e41ca11dd304( level.var_7ae4edfde7c1a849 );
        }
        
        level.var_7ae4edfde7c1a849 = utility::function_9e6c656b55f983f8( level.var_7ae4edfde7c1a849, debug_string );
    }

    // Namespace battlechatter
    // Params 1
    // Checksum 0xaff228a6, Offset: 0xc325
    // Size: 0x54, Type: dev
    function function_5082101982db4c30( var_f171ce7e894edf13 )
    {
        if ( isstruct( var_f171ce7e894edf13 ) )
        {
            if ( isdefined( var_f171ce7e894edf13.vo_parent ) )
            {
                return ( "<dev string:x8d1>" + debug::function_a8ee5e70fb7d68d0( var_f171ce7e894edf13.vo_parent ) );
            }
            else
            {
                return "<dev string:x8e6>";
            }
            
            return;
        }
        
        return debug::function_a8ee5e70fb7d68d0( var_f171ce7e894edf13 );
    }

    // Namespace battlechatter
    // Params 0
    // Checksum 0xcd69dfa4, Offset: 0xc381
    // Size: 0x371, Type: dev
    function function_b036621f1a4d4177()
    {
        self endon( "<dev string:x8f5>" );
        
        if ( level.battlechatter.var_b036621f1a4d4177 )
        {
            return;
        }
        
        if ( !isdefined( level.battlechatter.missingsoundalias ) )
        {
            level.battlechatter.missingsoundalias = [];
        }
        
        if ( !isdefined( level.battlechatter.var_2f0e16fc6b6dd046 ) )
        {
            level.battlechatter.var_2f0e16fc6b6dd046 = [];
        }
        
        level.battlechatter.var_b036621f1a4d4177 = 1;
        charwidth = 8;
        currxoff = 0;
        currmissing = [ 0, 0 ];
        printtime = 0.05;
        frames = 1;
        var_3fd593d40e72df2e = 0;
        height = [ 750, 730 ];
        header = [ "<dev string:x912>", "<dev string:x92b>" ];
        var_798d38e6e42161e5 = 20 * header.size;
        screenx = 185;
        scale = 1.4;
        var_fc4ddad9fe045399 = gettime();
        shift = 2;
        
        while ( getdvarint( @"bcs_debug" ) )
        {
            aliasarray = [ level.battlechatter.var_2f0e16fc6b6dd046, level.battlechatter.missingsoundalias ];
            
            for ( i = 0; i < header.size ; i++ )
            {
                out = "<dev string:x147>";
                
                if ( !aliasarray[ i ].size )
                {
                    continue;
                }
                
                key = getarraykey( aliasarray[ i ], currmissing[ i ] );
                value = aliasarray[ i ][ key ];
                printtoscreen2d( 20, height[ i ], header[ i ], ( 0, 1, 0 ), 1, frames );
                out = key + "<dev string:x942>" + value;
                printtoscreen2d( screenx - shift, height[ i ] - shift, out, ( 0, 0, 0 ), scale, frames );
                printtoscreen2d( screenx + shift, height[ i ] + shift, out, ( 0, 0, 0 ), scale, frames );
                printtoscreen2d( screenx, height[ i ], out, ( 0, 1, 0 ), scale, frames );
                var_3fd593d40e72df2e++;
                
                if ( !( var_3fd593d40e72df2e % var_798d38e6e42161e5 ) )
                {
                    currmissing[ i ]++;
                    
                    if ( currmissing[ i ] >= aliasarray[ i ].size )
                    {
                        currmissing[ i ] = 0;
                    }
                }
            }
            
            if ( getdvarint( @"hash_297223f9ffda9dec" ) && var_fc4ddad9fe045399 < gettime() )
            {
                var_fc4ddad9fe045399 = gettime() + 10000;
                
                for ( i = 0; i < header.size ; i++ )
                {
                    println( header[ i ] );
                    
                    foreach ( key, value in aliasarray[ i ] )
                    {
                        println( key + "<dev string:x942>" + value );
                    }
                }
            }
            
            wait printtime;
        }
        
        level.battlechatter.var_b036621f1a4d4177 = undefined;
    }

#/
