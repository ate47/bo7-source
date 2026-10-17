#using scripts\common\ai\ai_spawn_director;
#using scripts\common\callbacks;
#using scripts\common\system;
#using scripts\common\utility;
#using scripts\mp\gametypes\ob;

#namespace namespace_83cda125ae2647eb;

// Namespace namespace_83cda125ae2647eb
// Params 0, eflags: 0x5
// Checksum 0x606b4ed5, Offset: 0x1fe
// Size: 0x1d
function private autoexec __init__system__()
{
    system::register( #"hash_635c0e94097aca5e", undefined, &function_7cf8dacb278a2665, &postmain_init );
}

// Namespace namespace_83cda125ae2647eb
// Params 0, eflags: 0x4
// Checksum 0xdf683013, Offset: 0x223
// Size: 0x1d
function private function_7cf8dacb278a2665()
{
    if ( !system_enabled() )
    {
        return;
    }
    
    setdvar( @"hash_7d1696adf147e214", 1 );
}

// Namespace namespace_83cda125ae2647eb
// Params 0, eflags: 0x4
// Checksum 0x6e3bd544, Offset: 0x248
// Size: 0x1eb
function private postmain_init()
{
    if ( !system_enabled() )
    {
        return;
    }
    
    utility::flag_wait( "ai_spawn_director_create_script_processed" );
    var_f045c089c398b5ab = [ { #aitype:"sat_spawner_zombie_base_ob", #weight:3 }, { #aitype:"sat_spawner_zombie_base_armored_heavy_ob", #weight:2 }, { #aitype:"sat_spawner_zombie_base_toxic_ob", #weight:1 } ];
    level.var_eca319d5d9b0a595 = [];
    total_weight = 0;
    
    foreach ( config in var_f045c089c398b5ab )
    {
        total_weight += config.weight;
        level.var_eca319d5d9b0a595[ total_weight - 1 ] = config.aitype;
    }
    
    level.var_f870b04704edf90 = total_weight;
    level callback::add( #"on_ai_killed", &function_8c5e06ee1e60aeb7 );
    var_ba91a5068bf4af4b = function_3d653c10296f0b1b( 1, 0 );
    
    foreach ( requestid in var_ba91a5068bf4af4b )
    {
        if ( !isdefined( level.var_a20b02d86621e9ed[ requestid ] ) )
        {
            level.var_a20b02d86621e9ed[ requestid ] = [];
        }
        
        ai_spawn_director::function_a49c35b72d6b6fea( requestid, &function_57f3e9c1e99f430f );
    }
}

// Namespace namespace_83cda125ae2647eb
// Params 0, eflags: 0x4
// Checksum 0x7e38d164, Offset: 0x43b
// Size: 0x40
function private system_enabled()
{
    gametype_settings = ob::get_ob_settings();
    
    if ( level.var_a67a07be9f1df1cc || gametype_settings.var_aab22481530ff9ff )
    {
        return 0;
    }
    
    return getdvarint( @"hash_af9c490242b10d51", 1 );
}

// Namespace namespace_83cda125ae2647eb
// Params 2, eflags: 0x4
// Checksum 0x62eae2c5, Offset: 0x484
// Size: 0x1d8
function private function_74159603fda2c3da( zoneindex, location )
{
    endon_notify = "zombie_rebirth_update_zone_tags_" + zoneindex;
    level notify( endon_notify );
    level endon( endon_notify );
    wait 5;
    
    if ( !getdvarint( @"hash_466d098eed7d3d9f", 0 ) )
    {
        zone = function_b413557ed93d136f( location );
        
        if ( zone.var_20d6d0656474ee79 )
        {
            function_2a814d41ec6b9609( zoneindex, "ob_zombie_ambient", 0 );
            function_2a814d41ec6b9609( zoneindex, "ob_zombie_encounter_dense", 0 );
            function_2a814d41ec6b9609( zoneindex, "ob_merc_ambient", 1 );
        }
        else
        {
            function_2a814d41ec6b9609( zoneindex, "ob_zombie_ambient", 1 );
            function_2a814d41ec6b9609( zoneindex, "ob_zombie_encounter_dense", 1 );
            function_2a814d41ec6b9609( zoneindex, "ob_merc_ambient", 0 );
        }
        
        return;
    }
    
    subzones = function_6978793539ff1cb4( zoneindex );
    
    foreach ( subzone in subzones )
    {
        if ( subzone.var_20d6d0656474ee79 )
        {
            function_5866063fb64cf1a9( zoneindex, subzone.subzoneindex, "ob_zombie_ambient", 0 );
            function_5866063fb64cf1a9( zoneindex, subzone.subzoneindex, "ob_zombie_encounter_dense", 0 );
            function_5866063fb64cf1a9( zoneindex, subzone.subzoneindex, "ob_merc_ambient", 1 );
            continue;
        }
        
        function_5866063fb64cf1a9( zoneindex, subzone.subzoneindex, "ob_zombie_ambient", 1 );
        function_5866063fb64cf1a9( zoneindex, subzone.subzoneindex, "ob_zombie_encounter_dense", 1 );
        function_5866063fb64cf1a9( zoneindex, subzone.subzoneindex, "ob_merc_ambient", 0 );
    }
}

// Namespace namespace_83cda125ae2647eb
// Params 3, eflags: 0x4
// Checksum 0xb51e105d, Offset: 0x664
// Size: 0x112
function private function_57f3e9c1e99f430f( requestid, userdata, data )
{
    if ( data.canreactivate )
    {
        function_ef57f478f96b050c( requestid, 0 );
        encounter_data = function_9b649316adcccbaa( requestid );
        
        if ( encounter_data )
        {
            overlap_zones = function_92feb781f39c229( encounter_data.origin, encounter_data.radius );
            
            foreach ( zone in overlap_zones )
            {
                zone_index = zone.zoneindex;
                function_2a814d41ec6b9609( zone_index, #"dirty", 1 );
                level thread function_74159603fda2c3da( zone_index, zone.midpoint );
            }
        }
    }
}

// Namespace namespace_83cda125ae2647eb
// Params 4, eflags: 0x4
// Checksum 0x1ca8bffe, Offset: 0x77e
// Size: 0x96
function private function_d73581a154790360( groupid, data, agent, ai_data )
{
    spawn_anim_alias = [ "spawn_fast", "spawn_hop" ];
    
    if ( isdefined( level.var_16f375d1b0d1c224 ) )
    {
        anim_data = { #angles:agent.angles, #origin:agent.origin };
        thread [[ level.var_16f375d1b0d1c224 ]]( agent, anim_data, spawn_anim_alias );
    }
}

// Namespace namespace_83cda125ae2647eb
// Params 2, eflags: 0x4
// Checksum 0x1e593cad, Offset: 0x81c
// Size: 0x38
function private function_a12005f19857de2c( groupid, zoneindex )
{
    assert( level.var_184e40f27076d3ef[ zoneindex ] == groupid );
    level.var_184e40f27076d3ef[ zoneindex ] = undefined;
}

// Namespace namespace_83cda125ae2647eb
// Params 1, eflags: 0x4
// Checksum 0xe8c339c6, Offset: 0x85c
// Size: 0xfe
function private function_9e1c5c6eb0765dd1( origin )
{
    zone_index = function_93c626f0d446b575( origin );
    
    if ( !isdefined( zone_index ) )
    {
        return;
    }
    
    if ( !isdefined( level.var_184e40f27076d3ef ) )
    {
        level.var_184e40f27076d3ef = [];
    }
    
    group_id = level.var_184e40f27076d3ef[ zone_index ];
    
    if ( !isdefined( group_id ) )
    {
        group_id = ai_spawn_director::function_e19f6a00c4bb7490( "rebirth_zombie" + zone_index, 0, 1, 1, 0, 1, 1 );
        
        if ( isdefined( group_id ) )
        {
            zone_info = function_b413557ed93d136f( origin );
            area_radius = min( zone_info.halfsize[ 0 ], zone_info.halfsize[ 1 ] );
            function_1ac3703e7bc56a8( group_id, zone_info.midpoint, area_radius );
            level.var_184e40f27076d3ef[ zone_index ] = group_id;
            ai_spawn_director::function_35aa3b1d92cd8207( "OnSpawned", group_id, &function_d73581a154790360 );
            ai_spawn_director::function_35aa3b1d92cd8207( "Shutdown", group_id, &function_a12005f19857de2c, zone_index );
        }
    }
    
    return group_id;
}

// Namespace namespace_83cda125ae2647eb
// Params 0, eflags: 0x4
// Checksum 0x8f44aaa6, Offset: 0x963
// Size: 0x93
function private function_343ffbeda0e05ccb()
{
    random_weight = randomint( level.var_f870b04704edf90 );
    
    foreach ( weight, aitype in level.var_eca319d5d9b0a595 )
    {
        if ( random_weight <= weight )
        {
            return aitype;
        }
    }
}

// Namespace namespace_83cda125ae2647eb
// Params 3, eflags: 0x4
// Checksum 0xedfb6bc0, Offset: 0x9fe
// Size: 0x7a
function private spawn_rebirth_zombie( origin, angles, delay = 1 )
{
    wait delay;
    origin = getclosestpointonnavmesh( origin );
    
    if ( !origin )
    {
        return;
    }
    
    group_id = function_9e1c5c6eb0765dd1( origin );
    
    if ( !isdefined( group_id ) )
    {
        return;
    }
    
    aitype = function_343ffbeda0e05ccb();
    ai_spawn_director::function_9893a28f1d682a28( group_id, aitype, origin, angles, undefined, undefined, undefined, "team_hundred_ninety" );
}

// Namespace namespace_83cda125ae2647eb
// Params 1, eflags: 0x4
// Checksum 0x7143588f, Offset: 0xa80
// Size: 0x87
function private function_8c5e06ee1e60aeb7( params )
{
    agent = self;
    
    if ( agent.death_source == "despawn" )
    {
        return;
    }
    
    if ( agent.unittype == "soldier" )
    {
        delay = params.smeansofdeath == "MOD_EXECUTION" ? 3 : 1;
        level thread spawn_rebirth_zombie( agent.origin, agent.angles, delay );
    }
}

