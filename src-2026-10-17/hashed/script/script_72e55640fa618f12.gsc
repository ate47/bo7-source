#using script_53fd31a65517fe9b;
#using scripts\common\devgui;
#using scripts\common\scriptable;
#using scripts\common\utility;
#using scripts\common\vehicle_occupancy;
#using scripts\mp\challenges;

#namespace namespace_db3f33f8e4b2dfad;

// Namespace namespace_db3f33f8e4b2dfad
// Params 0, eflags: 0x1
// Checksum 0xbf65366c, Offset: 0x56f
// Size: 0xa
function autoexec main()
{
    level thread init();
}

// Namespace namespace_db3f33f8e4b2dfad
// Params 0
// Checksum 0xd7ad917e, Offset: 0x581
// Size: 0x2c
function init()
{
    level thread function_9c4dc1d7e423ea();
    
    if ( getdvarint( @"hash_f1dde303a997d853", 1 ) )
    {
        level thread function_26db1b442a3a85a5();
    }
    
    level thread function_17b7e8ce9448e636();
}

// Namespace namespace_db3f33f8e4b2dfad
// Params 0
// Checksum 0x84ad6f0b, Offset: 0x5b5
// Size: 0x1b9
function function_9c4dc1d7e423ea()
{
    utility::flag_wait( "scriptables_ready" );
    waitframe();
    var_ce5ba7916c9dfde7 = getentitylessscriptablearray( "arcwire_transmitter", #script_noteworthy );
    
    foreach ( var_5eb0d669ac2177f5 in var_ce5ba7916c9dfde7 )
    {
        var_5eb0d669ac2177f5 setscriptablepartstate( "arcwire_transmitter", "standby" );
        var_5eb0d669ac2177f5.additional_cooldown = getdvarfloat( @"hash_b8c99db6430e83c1", 5 );
        var_5eb0d669ac2177f5.doors = getentitylessscriptablearray( "lockdown_door", #targetname );
        
        foreach ( door in var_5eb0d669ac2177f5.doors )
        {
            door.delay_min = getdvarfloat( @"hash_3ad78e32a441bf56", 0.25 );
            door.delay_max = getdvarfloat( @"hash_3afa8032a467e844", 0.5 );
            door notify( #"activate" );
        }
    }
    
    scriptable::scriptable_addusedcallbackbypart( "arcwire_transmitter", &arcwire_transmitter_activate );
    scriptable::scriptable_addnotifycallback( "transmitter_damaged", &function_fb950ab48ffdecc9 );
}

// Namespace namespace_db3f33f8e4b2dfad
// Params 6
// Checksum 0xb81fe93e, Offset: 0x776
// Size: 0x42
function arcwire_transmitter_activate( e_instance, str_part, str_state, e_player, b_auto_use, str_use_string )
{
    e_instance thread function_4986bd835415d1a9();
}

// Namespace namespace_db3f33f8e4b2dfad
// Params 4
// Checksum 0x3096a52, Offset: 0x7c0
// Size: 0x30
function function_fb950ab48ffdecc9( e_instance, str_note, n_param, var_533710b0b76c405a )
{
    e_instance thread function_4986bd835415d1a9();
}

// Namespace namespace_db3f33f8e4b2dfad
// Params 0
// Checksum 0x64b17929, Offset: 0x7f8
// Size: 0xd1
function function_4986bd835415d1a9()
{
    self notify( #"hash_11c8bb9bbe1acb9e" );
    self endon( #"hash_11c8bb9bbe1acb9e" );
    wait getdvarfloat( @"hash_d7a8a70a3a516a23", 30 );
    a_doors = getentitylessscriptablearray( "lockdown_door", #targetname );
    
    foreach ( door in a_doors )
    {
        if ( door getscriptablepartstate( "arcwire_receiver" ) == "reset" )
        {
            door notify( #"activate", self );
        }
    }
}

#using_animtree( "scriptables" );

// Namespace namespace_db3f33f8e4b2dfad
// Params 0
// Checksum 0x2735cfbd, Offset: 0x8d1
// Size: 0x675
function function_26db1b442a3a85a5()
{
    waitframe();
    br_crane::init_anim( "nw_to_sw", %s4_cyclops_crane_nw_to_sw );
    br_crane::init_anim( "nw_to_tnw", %s4_cyclops_crane_nw_to_tnw );
    br_crane::init_anim( "sw_to_nw", %s4_cyclops_crane_sw_to_nw );
    br_crane::init_anim( "sw_to_tsw", %s4_cyclops_crane_sw_to_tsw );
    br_crane::init_anim( "tnw_to_nw", %s4_cyclops_crane_tnw_to_nw );
    br_crane::init_anim( "tnw_to_tsw", %s4_cyclops_crane_tnw_to_tsw );
    br_crane::init_anim( "tsw_to_sw", %s4_cyclops_crane_tsw_to_sw );
    br_crane::init_anim( "tsw_to_tnw", %s4_cyclops_crane_tsw_to_tnw );
    br_crane::init_anim( "ne_to_se", %s4_cyclops_crane_east_ne_to_se );
    br_crane::init_anim( "ne_to_tne", %s4_cyclops_crane_east_ne_to_tne );
    br_crane::init_anim( "se_to_ne", %s4_cyclops_crane_east_se_to_ne );
    br_crane::init_anim( "se_to_tse", %s4_cyclops_crane_east_se_to_tse );
    br_crane::init_anim( "tne_to_ne", %s4_cyclops_crane_east_tne_to_ne );
    br_crane::init_anim( "tne_to_tse", %s4_cyclops_crane_east_tne_to_tse );
    br_crane::init_anim( "tse_to_se", %s4_cyclops_crane_east_tse_to_se );
    br_crane::init_anim( "tse_to_tne", %s4_cyclops_crane_east_tse_to_tne );
    level notify( #"crane_anim_init_complete" );
    tne = br_crane::get_destination( "crane_destination_tower_tower_northeast" );
    ne = br_crane::get_destination( "crane_destination_tower_northeast" );
    tse = br_crane::get_destination( "crane_destination_tower_tower_southeast" );
    se = br_crane::get_destination( "crane_destination_tower_southeast" );
    br_crane::set_path_anims( ne, se, level.cranes.animstructs[ "ne_to_se" ] );
    br_crane::set_path_anims( ne, tne, level.cranes.animstructs[ "ne_to_tne" ] );
    br_crane::set_path_anims( se, ne, level.cranes.animstructs[ "se_to_ne" ] );
    br_crane::set_path_anims( se, tse, level.cranes.animstructs[ "se_to_tse" ] );
    br_crane::set_path_anims( tne, ne, level.cranes.animstructs[ "tne_to_ne" ] );
    br_crane::set_path_anims( tne, tse, level.cranes.animstructs[ "tne_to_tse" ] );
    br_crane::set_path_anims( tse, se, level.cranes.animstructs[ "tse_to_se" ] );
    br_crane::set_path_anims( tse, tne, level.cranes.animstructs[ "tse_to_tne" ] );
    br_crane::set_path_anims( ne, tse, [ level.cranes.animstructs[ "ne_to_tne" ], level.cranes.animstructs[ "tne_to_tse" ] ] );
    br_crane::set_path_anims( tse, ne, [ level.cranes.animstructs[ "tse_to_tne" ], level.cranes.animstructs[ "tne_to_ne" ] ] );
    br_crane::set_path_anims( se, tne, [ level.cranes.animstructs[ "se_to_tse" ], level.cranes.animstructs[ "tse_to_tne" ] ] );
    br_crane::set_path_anims( tne, se, [ level.cranes.animstructs[ "tne_to_tse" ], level.cranes.animstructs[ "tse_to_se" ] ] );
    tsw = br_crane::get_destination( "crane_destination_tower_tower_southwest" );
    sw = br_crane::get_destination( "crane_destination_tower_southwest" );
    tnw = br_crane::get_destination( "crane_destination_tower_tower_northwest" );
    nw = br_crane::get_destination( "crane_destination_tower_northwest" );
    br_crane::set_path_anims( nw, sw, level.cranes.animstructs[ "nw_to_sw" ] );
    br_crane::set_path_anims( nw, tnw, level.cranes.animstructs[ "nw_to_tnw" ] );
    br_crane::set_path_anims( sw, nw, level.cranes.animstructs[ "sw_to_nw" ] );
    br_crane::set_path_anims( sw, tsw, level.cranes.animstructs[ "sw_to_tsw" ] );
    br_crane::set_path_anims( tnw, nw, level.cranes.animstructs[ "tnw_to_nw" ] );
    br_crane::set_path_anims( tnw, tsw, level.cranes.animstructs[ "tnw_to_tsw" ] );
    br_crane::set_path_anims( tsw, sw, level.cranes.animstructs[ "tsw_to_sw" ] );
    br_crane::set_path_anims( tsw, tnw, level.cranes.animstructs[ "tsw_to_tnw" ] );
    br_crane::set_path_anims( nw, tsw, [ level.cranes.animstructs[ "nw_to_tnw" ], level.cranes.animstructs[ "tnw_to_tsw" ] ] );
    br_crane::set_path_anims( tsw, nw, [ level.cranes.animstructs[ "tsw_to_tnw" ], level.cranes.animstructs[ "tnw_to_nw" ] ] );
    br_crane::set_path_anims( sw, tnw, [ level.cranes.animstructs[ "sw_to_tsw" ], level.cranes.animstructs[ "tsw_to_tnw" ] ] );
    br_crane::set_path_anims( tnw, sw, [ level.cranes.animstructs[ "tnw_to_tsw" ], level.cranes.animstructs[ "tsw_to_sw" ] ] );
    
    /#
        function_b1c1372cf9ce6fc1();
    #/
    
    /#
        function_abd0921da95b7485();
    #/
}

// Namespace namespace_db3f33f8e4b2dfad
// Params 0
// Checksum 0x97bb50b9, Offset: 0xf4e
// Size: 0x85
function function_c76f52708c118112()
{
    foreach ( crane in level.cranes.instances )
    {
        crane thread function_37225a5d4ee78942();
    }
}

// Namespace namespace_db3f33f8e4b2dfad
// Params 0
// Checksum 0x21fd2f62, Offset: 0xfdb
// Size: 0xd0
function function_37225a5d4ee78942()
{
    level endon( #"game_ended" );
    
    while ( self.b_moving )
    {
        waitframe();
    }
    
    foreach ( destination in self.default_destinations )
    {
        if ( destination == self.s_destination )
        {
            return;
        }
    }
    
    thread br_crane::move( self.s_destination, function_628bac9faa9d1e86( self.default_destinations, self.s_destination.origin )[ 0 ] );
}

/#

    // Namespace namespace_db3f33f8e4b2dfad
    // Params 0
    // Checksum 0x96ceea94, Offset: 0x10b3
    // Size: 0x178, Type: dev
    function function_b1c1372cf9ce6fc1()
    {
        devgui::function_9082edeb5db93280( "<dev string:x24>" );
        devgui::function_cd4e263c1f3018ae( "<dev string:x37>", "<dev string:x51>", &br_crane::function_99090912ffe7a02f );
        devgui::function_cd4e263c1f3018ae( "<dev string:x62>", "<dev string:x7d>", &br_crane::function_99090912ffe7a02f );
        devgui::function_cd4e263c1f3018ae( "<dev string:x8f>", "<dev string:xa9>", &br_crane::function_99090912ffe7a02f );
        devgui::function_cd4e263c1f3018ae( "<dev string:xba>", "<dev string:xd5>", &br_crane::function_99090912ffe7a02f );
        devgui::function_cd4e263c1f3018ae( "<dev string:xe7>", "<dev string:x102>", &br_crane::function_99090912ffe7a02f );
        devgui::function_cd4e263c1f3018ae( "<dev string:x114>", "<dev string:x130>", &br_crane::function_99090912ffe7a02f );
        devgui::function_cd4e263c1f3018ae( "<dev string:x143>", "<dev string:x15e>", &br_crane::function_99090912ffe7a02f );
        devgui::function_cd4e263c1f3018ae( "<dev string:x170>", "<dev string:x18c>", &br_crane::function_99090912ffe7a02f );
        devgui::function_cd4e263c1f3018ae( "<dev string:x19f>", "<dev string:x1be>", &br_crane::function_99090912ffe7a02f );
        devgui::function_cd4e263c1f3018ae( "<dev string:x1cf>", "<dev string:x1ef>", &br_crane::function_99090912ffe7a02f );
        devgui::function_cd4e263c1f3018ae( "<dev string:x201>", "<dev string:x220>", &br_crane::function_99090912ffe7a02f );
        devgui::function_cd4e263c1f3018ae( "<dev string:x231>", "<dev string:x251>", &br_crane::function_99090912ffe7a02f );
        devgui::function_cd4e263c1f3018ae( "<dev string:x263>", "<dev string:x283>", &br_crane::function_99090912ffe7a02f );
        devgui::function_cd4e263c1f3018ae( "<dev string:x295>", "<dev string:x2b6>", &br_crane::function_99090912ffe7a02f );
        devgui::function_cd4e263c1f3018ae( "<dev string:x2c9>", "<dev string:x2e9>", &br_crane::function_99090912ffe7a02f );
        devgui::function_cd4e263c1f3018ae( "<dev string:x2fb>", "<dev string:x31c>", &br_crane::function_99090912ffe7a02f );
        devgui::function_77df7fe7dd273e10();
    }

    // Namespace namespace_db3f33f8e4b2dfad
    // Params 0
    // Checksum 0x4be5fc0e, Offset: 0x1233
    // Size: 0x2e, Type: dev
    function function_abd0921da95b7485()
    {
        devgui::function_9082edeb5db93280( "<dev string:x32f>" );
        devgui::add_devgui_func( "<dev string:x33d>", "<dev string:x35f>", &function_c76f52708c118112 );
        devgui::function_77df7fe7dd273e10();
    }

#/

// Namespace namespace_db3f33f8e4b2dfad
// Params 0
// Checksum 0xc04b6b4a, Offset: 0x1269
// Size: 0x185
function function_17b7e8ce9448e636()
{
    var_8d9ba1bb04ea1d33 = spawn( "noent_volume_trigger_box", ( 19993, -15157, 3774 ), 0, ( 709.5, 718, 386.5 ), ( 709.5, 718, 386.5 ) );
    var_8d9ba1bb04ea1d33.var_605222329e6620a1 = [];
    var_8d9ba1bb04ea1d33.var_605222329e6620a1[ var_8d9ba1bb04ea1d33.var_605222329e6620a1.size ] = { #tag:"north", #origin:( 19993, -15157, 3774 ) + ( 0, 718, 0 ) };
    var_8d9ba1bb04ea1d33.var_605222329e6620a1[ var_8d9ba1bb04ea1d33.var_605222329e6620a1.size ] = { #tag:"east", #origin:( 19993, -15157, 3774 ) + ( 709.5, 0, 0 ) };
    var_8d9ba1bb04ea1d33.var_605222329e6620a1[ var_8d9ba1bb04ea1d33.var_605222329e6620a1.size ] = { #tag:"south", #origin:( 19993, -15157, 3774 ) - ( 0, 718, 0 ) };
    var_8d9ba1bb04ea1d33.var_605222329e6620a1[ var_8d9ba1bb04ea1d33.var_605222329e6620a1.size ] = { #tag:"west", #origin:( 19993, -15157, 3774 ) - ( 709.5, 0, 0 ) };
    var_8d9ba1bb04ea1d33 thread function_94591ef99f231b37();
}

// Namespace namespace_db3f33f8e4b2dfad
// Params 0
// Checksum 0x92ae59a3, Offset: 0x13f6
// Size: 0x6e
function function_94591ef99f231b37()
{
    level endon( #"game_ended" );
    
    while ( true )
    {
        self waittill( #"trigger", ent );
        
        if ( isplayer( ent ) || ent.isheli )
        {
            if ( ent isonground() )
            {
                continue;
            }
            
            if ( ent.var_4b93d9eb95843271 )
            {
                continue;
            }
            
            ent thread function_a31e8d67b77e0fe0( self );
        }
    }
}

// Namespace namespace_db3f33f8e4b2dfad
// Params 1
// Checksum 0x1d8f5473, Offset: 0x146c
// Size: 0x162
function function_a31e8d67b77e0fe0( trigger )
{
    level endon( #"game_ended" );
    self.var_4b93d9eb95843271 = function_234bc827d65e428( trigger.var_605222329e6620a1 );
    
    while ( isalive( self ) && self istouching( trigger ) )
    {
        if ( self isonground() )
        {
            self.var_4b93d9eb95843271 = undefined;
            return;
        }
        
        waitframe();
    }
    
    if ( !isdefined( self ) )
    {
        return;
    }
    
    if ( !isalive( self ) )
    {
        return;
    }
    
    if ( function_234bc827d65e428( trigger.var_605222329e6620a1 ) == self.var_4b93d9eb95843271 )
    {
        self.var_4b93d9eb95843271 = undefined;
        return;
    }
    
    if ( self.origin[ 2 ] < 3335 )
    {
        self.var_4b93d9eb95843271 = undefined;
        return;
    }
    
    self.var_4b93d9eb95843271 = undefined;
    
    if ( isplayer( self ) )
    {
        challenges::function_37e945722d6497f3( self, "overlook_fly_through", 1 );
        return;
    }
    
    occupants = vehicle_occupancy::get_all_occupants( self );
    
    foreach ( player in occupants )
    {
        challenges::function_37e945722d6497f3( player, "overlook_fly_through", 1 );
    }
}

// Namespace namespace_db3f33f8e4b2dfad
// Params 1
// Checksum 0xc2ca04c7, Offset: 0x15d6
// Size: 0x27
function function_234bc827d65e428( var_605222329e6620a1 )
{
    return function_628bac9faa9d1e86( var_605222329e6620a1, self.origin )[ 0 ].tag;
}

