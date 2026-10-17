#using script_15ce43f40ea0fd2b;
#using script_49e4a4c208f44b76;
#using script_4bc38131d8ecd20b;
#using script_6c2f6a14fa53759e;
#using scripts\common\callbacks;
#using scripts\common\devgui;
#using scripts\common\system;
#using scripts\common\trace;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\mp\interaction;
#using scripts\mp\loot\common_item;
#using scripts\mp\zm\spawners\zone_spawner;
#using scripts\mp\zm\systems\agent_manager;
#using scripts\mp\zm\systems\zm_quest;
#using scripts\mp\zm\systems\zm_round_logic;
#using scripts\mp\zm\systems\zm_round_reward_bundle;
#using scripts\mp\zm\zm_utility;

#namespace namespace_12154c25a0962bfb;

// Namespace namespace_12154c25a0962bfb
// Params 0, eflags: 0x5
// Checksum 0x74d9dfa4, Offset: 0x3dc
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"hash_3bb235b5c67f59e8", undefined, undefined, &init );
}

// Namespace namespace_12154c25a0962bfb
// Params 0
// Checksum 0xf039c206, Offset: 0x3fd
// Size: 0x58
function init()
{
    if ( level.disable_firefly_plant_ee )
    {
        return;
    }
    
    level utility::flag_wait( "begin_round_logic" );
    level callback::add( "on_round_start", &on_round_start );
    init_fc();
    function_edb2e94d1cd9617b();
    level callback::add( "on_round_end", &function_7d80dc464f0838f4 );
    
    /#
        init_debug();
    #/
}

// Namespace namespace_12154c25a0962bfb
// Params 1
// Checksum 0x50327adb, Offset: 0x45d
// Size: 0x2a
function on_player_connect( params )
{
    zm_quest::function_b57dfe9625966b0b( #"misc", 0, #"hash_c5d3a55e28300150", 1, undefined, self );
}

// Namespace namespace_12154c25a0962bfb
// Params 0
// Checksum 0x63f3c85c, Offset: 0x48f
// Size: 0x470
function init_fc()
{
    if ( game_utility::getgametype() == "zm_rb_battle" )
    {
        var_685bb3e83805ab57 = utility::getstructarray( "ee_plant_fc_loc", "script_noteworthy" );
        
        foreach ( loc in var_685bb3e83805ab57 )
        {
            if ( loc.script_label == "disable_in_battlemode" )
            {
                continue;
            }
            
            fc_mdl = spawnscriptable( "sat_firefly_plant_ee_fc", loc.origin, ( 0, 0, 0 ) );
            fc_mdl.interact = interaction::register_interact( fc_mdl.origin + ( 0, 0, 25 ), 60, &use_fc, &function_33b5dafcb0954237 );
            fc_mdl.interact.my_owner = fc_mdl;
            
            if ( getdvarint( @"hash_988647b889dc2421", 0 ) )
            {
                /#
                    loc thread drawsphere();
                #/
            }
        }
        
        return;
    }
    
    if ( game_utility::function_21211f3255f8ea58() )
    {
        var_685bb3e83805ab57 = utility::getstructarray( "ee_plant_fc_loc", "script_noteworthy" );
        
        foreach ( loc in var_685bb3e83805ab57 )
        {
            if ( loc.script_label == "disable_in_sm" )
            {
                continue;
            }
            
            fc_mdl = spawnscriptable( "sat_firefly_plant_ee_fc", loc.origin, ( 0, 0, 0 ) );
            fc_mdl.interact = interaction::register_interact( fc_mdl.origin + ( 0, 0, 25 ), 60, &use_fc, &function_33b5dafcb0954237 );
            fc_mdl.interact.my_owner = fc_mdl;
            
            if ( getdvarint( @"hash_988647b889dc2421", 0 ) )
            {
                /#
                    loc thread drawsphere();
                #/
            }
        }
        
        var_bc4d506b89f0db74 = utility::getstructarray( "ee_plant_fc_loc_sm", "script_noteworthy" );
        
        foreach ( loc in var_bc4d506b89f0db74 )
        {
            fc_mdl = spawnscriptable( "sat_firefly_plant_ee_fc", loc.origin, ( 0, 0, 0 ) );
            fc_mdl.interact = interaction::register_interact( fc_mdl.origin + ( 0, 0, 25 ), 60, &use_fc, &function_33b5dafcb0954237 );
            fc_mdl.interact.my_owner = fc_mdl;
            
            if ( getdvarint( @"hash_988647b889dc2421", 0 ) )
            {
                /#
                    loc thread drawsphere();
                #/
            }
        }
        
        return;
    }
    
    var_685bb3e83805ab57 = utility::getstructarray( "ee_plant_fc_loc", "script_noteworthy" );
    
    foreach ( loc in var_685bb3e83805ab57 )
    {
        fc_mdl = spawnscriptable( "sat_firefly_plant_ee_fc", loc.origin, ( 0, 0, 0 ) );
        fc_mdl.interact = interaction::register_interact( fc_mdl.origin + ( 0, 0, 25 ), 60, &use_fc, &function_33b5dafcb0954237 );
        fc_mdl.interact.my_owner = fc_mdl;
        
        if ( getdvarint( @"hash_988647b889dc2421", 0 ) )
        {
            /#
                loc thread drawsphere();
            #/
        }
    }
}

// Namespace namespace_12154c25a0962bfb
// Params 1
// Checksum 0x6e6c099d, Offset: 0x907
// Size: 0x93
function use_fc( player )
{
    if ( isdefined( player ) && player.interactions_disabled )
    {
        return;
    }
    
    if ( player.var_1659ff9776cdbe24 )
    {
        return;
    }
    
    player.var_1659ff9776cdbe24 = 1;
    playsoundatpos( self.my_owner.origin, #"hash_ecbce2f9ae48a84e" );
    zm_quest::function_b57dfe9625966b0b( #"misc", 0, #"hash_c5d3a55e28300150", 2, undefined, player );
    self.my_owner freescriptable();
    self delete();
}

// Namespace namespace_12154c25a0962bfb
// Params 2
// Checksum 0x4726c3dd, Offset: 0x9a2
// Size: 0x70
function function_33b5dafcb0954237( interact, player )
{
    if ( player.var_1659ff9776cdbe24 )
    {
        return { #string:&"", #type:"HINT_NOBUTTON" };
    }
    
    return { #var_26bbd300351fde34:0, #string:&"zm_sat_firefly/plant_ee_fc_take", #type:"HINT_BUTTON" };
}

// Namespace namespace_12154c25a0962bfb
// Params 0
// Checksum 0xf1f100a7, Offset: 0xa1b
// Size: 0x2f4
function function_edb2e94d1cd9617b()
{
    if ( !isdefined( level.var_af87e86f84169561 ) )
    {
        level.var_af87e86f84169561 = [];
    }
    
    if ( game_utility::getgametype() == "zm_rb_battle" )
    {
        return;
    }
    
    if ( game_utility::function_21211f3255f8ea58() )
    {
        var_84b5be348c8166f = utility::getstructarray( "ee_plant_loc_survival", "script_noteworthy" );
        
        foreach ( loc in var_84b5be348c8166f )
        {
            if ( !isdefined( level.var_af87e86f84169561 ) )
            {
                level.var_af87e86f84169561 = [];
            }
            
            level.var_af87e86f84169561[ level.var_af87e86f84169561.size ] = loc;
            loc function_41d50b8c76cc943();
            loc.var_3dd8fc4fba7a6341 = interaction::register_interact( loc.origin + ( 0, 0, 25 ), 60, &spray_plant, &spray_plant_hint );
            loc.var_3dd8fc4fba7a6341.my_owner = loc;
            loc.var_12495ee1553a1bcc = 1;
            
            if ( getdvarint( @"hash_988647b889dc2421", 0 ) )
            {
                /#
                    loc thread drawsphere();
                #/
            }
        }
    }
    else
    {
        var_4fa3b7a4eaf4b426 = utility::getstructarray( "ee_plant_loc", "script_noteworthy" );
        var_4fa3b7a4eaf4b426 = arrayrandomize( var_4fa3b7a4eaf4b426 );
        
        foreach ( loc in var_4fa3b7a4eaf4b426 )
        {
            if ( !isdefined( level.var_af87e86f84169561 ) )
            {
                level.var_af87e86f84169561 = [];
            }
            
            level.var_af87e86f84169561[ level.var_af87e86f84169561.size ] = loc;
        }
        
        for ( i = 0; i < 8 ; i++ )
        {
            var_4fa3b7a4eaf4b426[ i ] function_41d50b8c76cc943();
            var_4fa3b7a4eaf4b426[ i ].var_3dd8fc4fba7a6341 = interaction::register_interact( var_4fa3b7a4eaf4b426[ i ].origin + ( 0, 0, 25 ), 60, &spray_plant, &spray_plant_hint );
            var_4fa3b7a4eaf4b426[ i ].var_3dd8fc4fba7a6341.my_owner = var_4fa3b7a4eaf4b426[ i ];
            var_4fa3b7a4eaf4b426[ i ].var_12495ee1553a1bcc = 1;
            
            if ( getdvarint( @"hash_988647b889dc2421", 0 ) )
            {
                /#
                    var_4fa3b7a4eaf4b426[ i ] thread drawsphere();
                #/
            }
        }
    }
    
    for ( i = 0; i < level.var_af87e86f84169561.size ; i++ )
    {
        level.var_af87e86f84169561[ i ].id = i;
    }
}

// Namespace namespace_12154c25a0962bfb
// Params 1
// Checksum 0x530318b4, Offset: 0xd17
// Size: 0x2d4
function function_7d80dc464f0838f4( params )
{
    if ( isdefined( level.var_af87e86f84169561 ) )
    {
        var_3f2c30c23ea70012 = 0;
        var_9dc34429628ba2e1 = [];
        
        foreach ( plant in level.var_af87e86f84169561 )
        {
            if ( isdefined( plant ) && plant.var_12495ee1553a1bcc )
            {
                var_3f2c30c23ea70012++;
                continue;
            }
            
            var_9dc34429628ba2e1[ var_9dc34429628ba2e1.size ] = plant.id;
        }
        
        var_a19f732a3c498f57 = min( 10, level.var_af87e86f84169561.size );
        var_43210e1e14803a21 = min( var_a19f732a3c498f57 - var_3f2c30c23ea70012, 2 );
        
        if ( var_43210e1e14803a21 > 0 )
        {
            if ( var_43210e1e14803a21 > var_9dc34429628ba2e1.size )
            {
                foreach ( plant_id in var_9dc34429628ba2e1 )
                {
                    if ( isdefined( plant_id ) )
                    {
                        level.var_af87e86f84169561[ plant_id ] function_41d50b8c76cc943();
                        level.var_af87e86f84169561[ plant_id ].var_3dd8fc4fba7a6341 = interaction::register_interact( plant.origin + ( 0, 0, 25 ), 60, &spray_plant, &spray_plant_hint );
                        level.var_af87e86f84169561[ plant_id ].var_3dd8fc4fba7a6341.my_owner = plant;
                        level.var_af87e86f84169561[ plant_id ].var_12495ee1553a1bcc = 1;
                    }
                }
                
                return;
            }
            
            var_9dc34429628ba2e1 = arrayrandomize( var_9dc34429628ba2e1 );
            
            for ( i = 0; i < var_43210e1e14803a21 ; i++ )
            {
                plant_id = var_9dc34429628ba2e1[ i ];
                level.var_af87e86f84169561[ plant_id ] function_41d50b8c76cc943();
                level.var_af87e86f84169561[ plant_id ].var_3dd8fc4fba7a6341 = interaction::register_interact( level.var_af87e86f84169561[ plant_id ].origin + ( 0, 0, 25 ), 60, &spray_plant, &spray_plant_hint );
                level.var_af87e86f84169561[ plant_id ].var_3dd8fc4fba7a6341.my_owner = level.var_af87e86f84169561[ plant_id ];
                level.var_af87e86f84169561[ plant_id ].var_12495ee1553a1bcc = 1;
            }
        }
    }
}

// Namespace namespace_12154c25a0962bfb
// Params 1
// Checksum 0x28b53cc, Offset: 0xff3
// Size: 0x82
function spray_plant( player )
{
    if ( isdefined( player ) && player.interactions_disabled )
    {
        return;
    }
    
    if ( !player.var_1659ff9776cdbe24 )
    {
        return;
    }
    
    if ( self.my_owner.var_3f2f90c281fdc6ef )
    {
        return;
    }
    
    if ( !isdefined( self.my_owner.my_plant ) )
    {
        return;
    }
    
    self.my_owner function_f4a060834caa6dcf();
    self.my_owner thread plant_growing();
}

// Namespace namespace_12154c25a0962bfb
// Params 2
// Checksum 0xadb45078, Offset: 0x107d
// Size: 0xe7
function spray_plant_hint( interact, player )
{
    if ( !player.var_1659ff9776cdbe24 )
    {
        return { #string:&"", #type:"HINT_NOBUTTON" };
    }
    
    if ( interact.my_owner.var_3f2f90c281fdc6ef )
    {
        return { #string:&"", #type:"HINT_NOBUTTON" };
    }
    
    if ( !isdefined( interact.my_owner.my_plant ) )
    {
        return { #string:&"", #type:"HINT_NOBUTTON" };
    }
    
    return { #var_26bbd300351fde34:0, #string:&"zm_sat_firefly/plant_ee_spary", #type:"HINT_BUTTON" };
}

// Namespace namespace_12154c25a0962bfb
// Params 0
// Checksum 0x7cc48585, Offset: 0x116d
// Size: 0x4c
function function_41d50b8c76cc943()
{
    self.my_plant = spawnscriptable( "sat_firefly_plant_ee", self.origin, self.angles );
    self.my_plant.my_owner = self;
    self.var_725afa5fbef29930 = [];
    thread function_acd3d9ac36659d8c();
}

// Namespace namespace_12154c25a0962bfb
// Params 0
// Checksum 0x85b0d3b9, Offset: 0x11c1
// Size: 0x98
function function_f4a060834caa6dcf()
{
    if ( !isdefined( self.attractor ) )
    {
        self.attractor = utility::spawn_model( "sat_zm_firefly_ee_plant_growth_plant_stage_01", self.origin, self.angles );
        self.attractor setcandamage( 1 );
        self.attractor disconnectpaths();
        self.attractor.my_owner = self;
        self.attractor.health = 999999;
        self.attractor.health_fake = 6;
    }
}

// Namespace namespace_12154c25a0962bfb
// Params 0
// Checksum 0x276f619a, Offset: 0x1261
// Size: 0x1a1
function plant_growing()
{
    level endon( #"game_ended" );
    self endon( #"hash_f83ac2efa1e76e3c" );
    self.var_3f2f90c281fdc6ef = 1;
    self.my_plant utility::function_7c10ea82c1e305b8( "spray effect", "on" );
    wait 1;
    thread function_bc6f18d0eb17632c();
    self.my_plant utility::function_7c10ea82c1e305b8( "growing effect", "sml" );
    self.attractor add_attractor();
    self.attractor thread function_79b601800a4d43b2();
    thread function_47f79f9b0ede0a6f();
    utility::waittill_any( "ee_plant_grow_hit_duration", "ee_toxic_growth_boost" );
    self.my_plant utility::function_7c10ea82c1e305b8( "base", "s2" );
    self.my_plant utility::function_7c10ea82c1e305b8( "growing effect", "med" );
    thread function_47f79f9b0ede0a6f();
    utility::waittill_any( "ee_plant_grow_hit_duration", "ee_toxic_growth_boost" );
    self.my_plant utility::function_7c10ea82c1e305b8( "base", "s3" );
    self.my_plant utility::function_7c10ea82c1e305b8( "growing effect", "med" );
    thread function_47f79f9b0ede0a6f();
    utility::waittill_any( "ee_plant_grow_hit_duration", "ee_toxic_growth_boost" );
    self.my_plant utility::function_7c10ea82c1e305b8( "base", "s4" );
    self.my_plant utility::function_7c10ea82c1e305b8( "growing effect", "lrg" );
    self.my_plant utility::function_7c10ea82c1e305b8( "growing effect", "off" );
    self.var_3f2f90c281fdc6ef = 0;
    self notify( #"hash_da2bf37bae0dc608" );
    wait 2;
    thread plant_death();
}

// Namespace namespace_12154c25a0962bfb
// Params 0
// Checksum 0x90b2e140, Offset: 0x140a
// Size: 0x3e
function function_47f79f9b0ede0a6f()
{
    level endon( #"game_ended" );
    self endon( #"ee_toxic_growth_boost" );
    
    if ( self.var_8389dd7674f36a3 )
    {
        wait 5;
    }
    else
    {
        wait 10;
    }
    
    self notify( #"ee_plant_grow_hit_duration" );
}

// Namespace namespace_12154c25a0962bfb
// Params 1
// Checksum 0x5f36f4d7, Offset: 0x1450
// Size: 0x89
function on_round_start( params )
{
    foreach ( root in level.var_af87e86f84169561 )
    {
        root notify( #"hash_12dfe73f0d6dbfdb" );
    }
}

// Namespace namespace_12154c25a0962bfb
// Params 0
// Checksum 0x54aff357, Offset: 0x14e1
// Size: 0x172
function drop_reward()
{
    if ( !self.my_plant )
    {
        return;
    }
    
    str_reward_list = "";
    n_round_number = zm_round_logic::get_rb_round_number();
    curstate = self.my_plant getscriptablepartstate( "base", 1 );
    
    if ( !curstate )
    {
        return;
    }
    
    var_8b5270de14dff72e = zm_round_reward_bundle::function_8cbad2bff5b7cc1( "zm_round_reward_bundle_zm_plant_ee_rewards", curstate );
    
    if ( self.var_8389dd7674f36a3 )
    {
        var_ced0ff9a7ff49099 = zm_round_reward_bundle::function_8cbad2bff5b7cc1( "zm_round_reward_bundle_zm_plant_ee_rewards", "bonus" );
        var_8b5270de14dff72e = arraycombineunique( var_8b5270de14dff72e, var_ced0ff9a7ff49099 );
    }
    
    item_contents = trace::create_contents( 0, 1, 1, 0, 1 );
    
    for ( i = 0; i < var_8b5270de14dff72e.size ; i++ )
    {
        itemspawnentryname = var_8b5270de14dff72e[ i ];
        
        if ( !isdefined( itemspawnentryname ) )
        {
            continue;
        }
        
        drop_offset = utility::randomvectorrangeflat( 40, 60 );
        drop_origin = self.my_plant.origin + drop_offset;
        drop_origin = utility::drop_to_ground( getclosestpointonnavmesh( drop_origin ) ?? drop_origin, 32, -32, undefined, item_contents ) + ( 0, 0, 4 );
        level common_item::function_47324f290423b2d1( getscriptbundle( itemspawnentryname ), self.my_plant.origin + ( 0, 0, 60 ), drop_origin );
    }
}

// Namespace namespace_12154c25a0962bfb
// Params 0
// Checksum 0xe4e5bcc, Offset: 0x165b
// Size: 0x2f
function plant_respawn_watcher()
{
    level endon( #"game_ended" );
    self waittill( #"hash_12dfe73f0d6dbfdb" );
    self waittill( #"hash_12dfe73f0d6dbfdb" );
    function_41d50b8c76cc943();
}

// Namespace namespace_12154c25a0962bfb
// Params 0
// Checksum 0xa59140f2, Offset: 0x1692
// Size: 0x18f
function plant_death()
{
    level endon( #"game_ended" );
    self notify( #"hash_f83ac2efa1e76e3c" );
    self.var_3f2f90c281fdc6ef = 0;
    self.var_3dd8fc4fba7a6341 delete();
    thread drop_reward();
    
    if ( self.my_plant utility::function_9f2c41c1dcc8c94( "base", "s1" ) )
    {
        self.my_plant utility::function_7c10ea82c1e305b8( "death effect", "sml" );
    }
    else if ( self.my_plant utility::function_9f2c41c1dcc8c94( "base", "s2" ) )
    {
        self.my_plant utility::function_7c10ea82c1e305b8( "death effect", "med" );
    }
    else if ( self.my_plant utility::function_9f2c41c1dcc8c94( "base", "s3" ) )
    {
        self.my_plant utility::function_7c10ea82c1e305b8( "death effect", "med" );
    }
    else if ( self.my_plant utility::function_9f2c41c1dcc8c94( "base", "s4" ) )
    {
        self.my_plant utility::function_7c10ea82c1e305b8( "death effect", "lrg" );
    }
    
    self.attractor remove_attractor();
    self.var_8389dd7674f36a3 = 0;
    self.var_12495ee1553a1bcc = 0;
    
    if ( isdefined( self.attractor ) )
    {
        self.attractor connectpaths();
        self.attractor delete();
    }
    
    wait 0.1;
    
    if ( isdefined( self.my_plant ) )
    {
        self.my_plant freescriptable();
    }
    
    thread function_61143576621ec643();
}

// Namespace namespace_12154c25a0962bfb
// Params 0
// Checksum 0x7f4c373f, Offset: 0x1829
// Size: 0x83
function add_attractor()
{
    attractor = zombie_attractor_manager::add_attractor( self, 2, 500, 1, undefined, &function_cc6605aa869c9c71 );
    zombie_attractor_manager::function_1497469a46932be2( attractor, self.origin, self.angles, 30, 5 );
    zombie_attractor_manager::function_4c34b0f066a9d9fe( attractor, 360 );
    zombie_attractor_manager::function_a2aab3762aaa055f( attractor, self.origin + ( 0, 0, 15 ), ( 15, 15, 15 ), self.angles );
}

// Namespace namespace_12154c25a0962bfb
// Params 0
// Checksum 0xa6a6b7cb, Offset: 0x18b4
// Size: 0xa
function remove_attractor()
{
    zombie_attractor_manager::remove_attractor( self );
}

// Namespace namespace_12154c25a0962bfb
// Params 2
// Checksum 0x3fabe714, Offset: 0x18c6
// Size: 0xfa, Type: bool
function function_cc6605aa869c9c71( attractor, zombie )
{
    if ( zombie.aicategory == "hvt" || zombie.aicategory == "elite" || zombie.aicategory == "special" )
    {
        return false;
    }
    
    if ( !zombie.var_44be5f78aaf9a15 )
    {
        return false;
    }
    
    foreach ( player in level.players )
    {
        if ( distance( player.origin, zombie.origin ) < 50 )
        {
            return false;
        }
    }
    
    return true;
}

// Namespace namespace_12154c25a0962bfb
// Params 0
// Checksum 0xb6d681e1, Offset: 0x19c9
// Size: 0x11b
function function_79b601800a4d43b2()
{
    level endon( #"game_ended" );
    self.my_owner endon( #"hash_f83ac2efa1e76e3c" );
    self.my_owner endon( #"hash_da2bf37bae0dc608" );
    
    while ( true )
    {
        self waittill( #"damage", idamage, eattacker, vdir, vpoint, smeansofdeath, smodelname, stagname, spartname, idflags, objweapon, origin, angles, normal, einflictor, eventid );
        
        if ( !isplayer( eattacker ) && isdefined( self ) )
        {
            self.health_fake--;
            
            if ( self.health_fake == 0 )
            {
                self.my_owner thread plant_death();
            }
        }
    }
}

// Namespace namespace_12154c25a0962bfb
// Params 0
// Checksum 0x2ae5a198, Offset: 0x1aec
// Size: 0x113
function function_bc6f18d0eb17632c()
{
    level endon( #"game_ended" );
    self endon( #"hash_da2bf37bae0dc608" );
    self endon( #"hash_f83ac2efa1e76e3c" );
    a_s_spawn_locs = utility::getstructarray( self.target, "targetname" );
    
    while ( true )
    {
        spawner = utility::array_random( a_s_spawn_locs );
        zombie = agent_manager::spawn_agent( "zombie_base", spawner.origin, spawner.angles );
        
        if ( !isdefined( zombie ) )
        {
            waitframe();
            continue;
        }
        
        self.var_725afa5fbef29930[ self.var_725afa5fbef29930.size ] = zombie;
        zombie.no_powerups = 1;
        zombie.kiastring = #"zombie_kia_mission_kill";
        zombie zombie_utils::function_a8ce00e0448cb6f0( "run", "zm_quest", 6 );
        zombie utility::function_7c10ea82c1e305b8( "base", "base_purple_eyes" );
        zombie thread zone_spawner::function_ce10e453e7f7bb8e( spawner );
        zombie.var_44be5f78aaf9a15 = 1;
        wait 5;
    }
}

// Namespace namespace_12154c25a0962bfb
// Params 0
// Checksum 0x5aee7797, Offset: 0x1c07
// Size: 0x10e
function function_acd3d9ac36659d8c()
{
    level endon( #"game_ended" );
    self endon( #"hash_f83ac2efa1e76e3c" );
    
    while ( true )
    {
        foreach ( toxic_growth in level.var_80ec21e17cb08bce )
        {
            n_distance = distance( toxic_growth.origin, self.origin );
            
            if ( n_distance < 120 && isdefined( self.my_plant ) && !self.my_plant utility::function_9f2c41c1dcc8c94( "growing effect", "off" ) && !self.var_8389dd7674f36a3 )
            {
                self notify( #"ee_toxic_growth_boost" );
                self.var_8389dd7674f36a3 = 1;
            }
        }
        
        waitframe();
    }
}

// Namespace namespace_12154c25a0962bfb
// Params 0
// Checksum 0xe5b31dce, Offset: 0x1d1d
// Size: 0x8b
function function_61143576621ec643()
{
    foreach ( zom in self.var_725afa5fbef29930 )
    {
        if ( !isdefined( zom ) )
        {
            continue;
        }
        
        zom thread function_af2be6d1d08a19c7();
        wait 0.2;
    }
}

// Namespace namespace_12154c25a0962bfb
// Params 0, eflags: 0x4
// Checksum 0x12e2cb5c, Offset: 0x1db0
// Size: 0x1c4
function private function_af2be6d1d08a19c7()
{
    level endon( #"game_ended" );
    
    if ( !zm_utility::is_active_zombie( self ) )
    {
        return;
    }
    
    self endon( #"death" );
    wait randomfloatrange( 1, 1.25 );
    self.nuked = 1;
    self.no_powerups = 1;
    self.var_a13bed1ac47e1b2c = 1;
    self.full_gib = 1;
    self.var_65522105f3bdca37 = 1;
    zombie_stun::stun_ai( 100 );
    
    if ( !isdefined( level._effect[ "zombie_impact" ] ) )
    {
        level._effect[ "zombie_impact" ] = loadfxasset( "vfx_t10_levels_zm_quartz_machine_amp_impact" );
    }
    
    if ( !isdefined( level._effect[ "zombie_impact_blood" ] ) )
    {
        level._effect[ "zombie_impact_blood" ] = loadfxasset( "vfx_t10_levels_zm_quartz_machine_amp_impact_blood" );
    }
    
    impact_fx = utility::getfx( "zombie_impact" );
    var_b0a812f37b404b6e = utility::getfx( "zombie_impact_blood" );
    
    if ( isalive( self ) && self tagexists( "j_spine4" ) )
    {
        self.var_6cd99d11f4ac6027 = playfxontag( impact_fx, self, "j_spine4" );
    }
    
    wait randomfloatrange( 0.5, 1 );
    
    if ( isalive( self ) && self tagexists( "j_spine4" ) )
    {
        self.var_6cd99d11f4ac6027 = stopfxontag( impact_fx, self, "j_spine4" );
        self.pap_death_fx = playfxontag( var_b0a812f37b404b6e, self, "j_spine4" );
    }
    
    wait 0.25;
    
    if ( val::get( "damageshield_allow_delete" ) )
    {
        utility::callsharedfunc( #"ai", #"hash_c649178f35fe47cf" );
    }
    
    if ( isalive( self ) && !self.magic_bullet_shield && !val::get( "damageshield" ) )
    {
        self kill();
    }
}

/#

    // Namespace namespace_12154c25a0962bfb
    // Params 0
    // Checksum 0xe100a010, Offset: 0x1f7c
    // Size: 0x58, Type: dev
    function init_debug()
    {
        level.var_f5034eb09b895ca0 = 0;
        level.var_2fac0da144cc977b = 0;
        devgui::function_9082edeb5db93280( "<dev string:x24>" );
        devgui::add_devgui_func( "<dev string:x47>", "<dev string:x5a>", &function_4d6e96182db7cd13 );
        devgui::add_devgui_func( "<dev string:x6e>", "<dev string:x85>", &function_4d3ab832feb77b8c );
        devgui::function_77df7fe7dd273e10();
    }

    // Namespace namespace_12154c25a0962bfb
    // Params 0, eflags: 0x4
    // Checksum 0xe93d3242, Offset: 0x1fdc
    // Size: 0xc6, Type: dev
    function private function_4d6e96182db7cd13()
    {
        level endon( #"game_ended" );
        level.var_f5034eb09b895ca0 = !level.var_f5034eb09b895ca0;
        
        if ( level.var_af87e86f84169561 )
        {
            foreach ( loc in level.var_af87e86f84169561 )
            {
                if ( !level.var_f5034eb09b895ca0 )
                {
                    loc notify( #"hash_c71cda35fbb1a41e" );
                    continue;
                }
                
                loc thread drawsphere();
            }
        }
    }

    // Namespace namespace_12154c25a0962bfb
    // Params 0, eflags: 0x4
    // Checksum 0xf08469e3, Offset: 0x20aa
    // Size: 0xdf, Type: dev
    function private function_4d3ab832feb77b8c()
    {
        level endon( #"game_ended" );
        level.var_2fac0da144cc977b = !level.var_2fac0da144cc977b;
        var_685bb3e83805ab57 = utility::getstructarray( "<dev string:x9d>", "<dev string:xad>" );
        
        if ( var_685bb3e83805ab57 )
        {
            foreach ( loc in var_685bb3e83805ab57 )
            {
                if ( !level.var_2fac0da144cc977b )
                {
                    loc notify( #"hash_6f9a1617bc016272" );
                    continue;
                }
                
                loc thread drawsphere( ( 0, 1, 1 ) );
            }
        }
    }

    // Namespace namespace_12154c25a0962bfb
    // Params 1
    // Checksum 0x159ecbad, Offset: 0x2191
    // Size: 0x85, Type: dev
    function drawsphere( color )
    {
        self notify( #"hash_80638891a949b155" );
        self endon( #"hash_80638891a949b155" );
        level endon( #"game_ended" );
        self endon( #"hash_c71cda35fbb1a41e" );
        self endon( #"hash_6f9a1617bc016272" );
        sphere_color = color ?? ( 0, 1, 0 );
        
        while ( true )
        {
            sphere( self.origin, 5, sphere_color, 0 );
            waitframe();
        }
    }

#/
