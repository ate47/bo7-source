#using script_4bc38131d8ecd20b;
#using scripts\common\callbacks;
#using scripts\common\devgui;
#using scripts\common\math;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\common\vortex;

#namespace namespace_10a0481b1db56804;

// Namespace namespace_10a0481b1db56804
// Params 0, eflags: 0x1
// Checksum 0xe6ebc421, Offset: 0xc5
// Size: 0x31
function autoexec init()
{
    level.var_3f62ff7bb284d4cd = [];
    level.var_5126d8de95e3777b = [];
    level.var_b6784f7a5cfd99a3 = [];
    thread function_3e02dc6582f71413();
    
    /#
        thread function_13347f239e7237d6();
    #/
}

// Namespace namespace_10a0481b1db56804
// Params 7
// Checksum 0xeb01f306, Offset: 0xfe
// Size: 0xfe
function register_elemental_storm( type, source_asset, radius, height, min_zombie_count = 3, var_94c8b5dd2c15fed8, var_b53642ccf10f9a68 )
{
    reg_storm = spawnstruct();
    reg_storm.type = type;
    reg_storm.radius = radius;
    reg_storm.height = height;
    reg_storm.source_asset = source_asset;
    reg_storm.min_zombie_count = min_zombie_count;
    reg_storm.var_94c8b5dd2c15fed8 = var_94c8b5dd2c15fed8;
    reg_storm.var_b53642ccf10f9a68 = var_b53642ccf10f9a68;
    
    if ( level.var_5126d8de95e3777b[ type ] )
    {
        assertmsg( "<dev string:x24>" + ( isstring( type ) ? type : "<dev string:x48>" ) );
        return;
    }
    
    level.var_5126d8de95e3777b[ type ] = reg_storm;
    return reg_storm;
}

// Namespace namespace_10a0481b1db56804
// Params 2
// Checksum 0x47fdf600, Offset: 0x205
// Size: 0x7f
function function_314bb0964f030c97( ai, element_type )
{
    if ( !level.var_5126d8de95e3777b[ element_type ] )
    {
        assertmsg( "<dev string:x49>" + ( isstring( element_type ) ? element_type : "<dev string:x48>" ) );
        return;
    }
    
    ai.var_ce4d08748f6af2fa = element_type;
    level.var_b6784f7a5cfd99a3[ level.var_b6784f7a5cfd99a3.size ] = ai;
    ai callback::add( "on_zombie_ai_killed", &function_f8dc71eb5e2ec544 );
}

// Namespace namespace_10a0481b1db56804
// Params 0, eflags: 0x4
// Checksum 0xdbd35001, Offset: 0x28c
// Size: 0x429
function private function_3e02dc6582f71413()
{
    level endon( #"game_ended" );
    
    while ( true )
    {
        clusters = [];
        
        foreach ( ai in level.var_b6784f7a5cfd99a3 )
        {
            if ( ai val::get( "disable_elemental_effect" ) )
            {
                continue;
            }
            
            cluster_id = function_26ecfc84dd696a( ai );
            
            if ( !isnumber( cluster_id ) )
            {
                continue;
            }
            
            cluster = clusters[ cluster_id ];
            
            if ( !cluster )
            {
                var_b180c1ec7ce5a767 = function_8f2913f79703b8e3( cluster_id );
                member_count = 0;
                team = undefined;
                valid_member = undefined;
                
                foreach ( member in var_b180c1ec7ce5a767[ "clusterMembers" ] )
                {
                    if ( !function_f9e4af90d656bfbf( member ) )
                    {
                        continue;
                    }
                    
                    if ( level.var_5126d8de95e3777b[ ai.var_ce4d08748f6af2fa ].var_b53642ccf10f9a68 )
                    {
                        if ( ![[ level.var_5126d8de95e3777b[ ai.var_ce4d08748f6af2fa ].var_b53642ccf10f9a68 ]]( member ) )
                        {
                            continue;
                        }
                    }
                    
                    member_count += 1;
                    
                    if ( !isdefined( team ) )
                    {
                        team = member.team;
                    }
                    
                    if ( !isdefined( valid_member ) )
                    {
                        valid_member = member;
                    }
                }
                
                is_storm_valid = member_count >= level.var_5126d8de95e3777b[ ai.var_ce4d08748f6af2fa ].min_zombie_count;
                cluster = { #valid_member:valid_member, #team:team, #is_storm_valid:is_storm_valid, #element_type:ai.var_ce4d08748f6af2fa, #origin:var_b180c1ec7ce5a767[ "origin" ], #id:cluster_id };
                clusters[ cluster_id ] = cluster;
            }
        }
        
        foreach ( cluster_id, cluster in clusters )
        {
            if ( !cluster.is_storm_valid )
            {
                continue;
            }
            
            storm = undefined;
            
            foreach ( current_storm in level.var_3f62ff7bb284d4cd )
            {
                if ( current_storm.cluster_id == cluster_id )
                {
                    storm = current_storm;
                    break;
                }
            }
            
            if ( storm )
            {
                update_storm( storm, cluster );
                continue;
            }
            
            storm = create_storm( cluster.element_type, cluster.origin );
            
            if ( storm )
            {
                update_storm( storm, cluster );
            }
        }
        
        foreach ( storm in level.var_3f62ff7bb284d4cd )
        {
            if ( function_be1f8e40dbfe3a3d( storm ) )
            {
                update_storm( storm, undefined );
            }
        }
        
        waitframe();
    }
}

// Namespace namespace_10a0481b1db56804
// Params 2, eflags: 0x4
// Checksum 0xdfa33611, Offset: 0x6bd
// Size: 0x195
function private update_storm( storm, cluster )
{
    storm.last_update_time = gettime();
    
    if ( cluster )
    {
        target_pos = cluster.origin;
        lerp_factor = level.framedurationseconds * 2;
        lerp_factor = clamp( math::remap( distance2d( storm.source.origin, target_pos ), 0, 50, 1, lerp_factor ), lerp_factor, 1 );
        new_pos = vectorlerp( storm.source.origin, target_pos, lerp_factor );
        storm.source.origin = new_pos;
        storm.team = cluster.team;
        storm.last_time_active = gettime();
        storm.cluster_id = cluster.id;
    }
    else
    {
        despawn_time = 3;
        
        if ( utility::time_has_passed( storm.last_time_active, despawn_time ) )
        {
            delete_storm( storm );
            return;
        }
    }
    
    element_info = level.var_5126d8de95e3777b[ storm.type ];
    
    if ( isfunction( element_info.var_94c8b5dd2c15fed8 ) )
    {
        [[ element_info.var_94c8b5dd2c15fed8 ]]( { #element_info:element_info, #cluster:cluster, #storm:storm } );
    }
}

// Namespace namespace_10a0481b1db56804
// Params 1, eflags: 0x4
// Checksum 0x6f0133b2, Offset: 0x85a
// Size: 0x23, Type: bool
function private function_be1f8e40dbfe3a3d( storm )
{
    if ( storm.last_update_time == gettime() )
    {
        return false;
    }
    
    return true;
}

// Namespace namespace_10a0481b1db56804
// Params 2, eflags: 0x4
// Checksum 0x2e350d6e, Offset: 0x886
// Size: 0xf0
function private create_storm( element_type, origin )
{
    registered_info = level.var_5126d8de95e3777b[ element_type ];
    
    if ( !registered_info )
    {
        assertmsg( "<dev string:x68>" );
        return;
    }
    
    storm = spawnstruct();
    storm.type = element_type;
    storm.last_update_time = -1;
    storm.last_time_active = -1;
    storm.team = undefined;
    storm.cluster_id = undefined;
    
    if ( registered_info.source_asset )
    {
        storm.source = utility::spawn_model( registered_info.source_asset, origin );
    }
    else
    {
        storm.source = { #origin:origin };
    }
    
    level.var_3f62ff7bb284d4cd[ level.var_3f62ff7bb284d4cd.size ] = storm;
    return storm;
}

// Namespace namespace_10a0481b1db56804
// Params 1, eflags: 0x4
// Checksum 0xc17f5101, Offset: 0x97f
// Size: 0x5a
function private delete_storm( storm )
{
    level.var_3f62ff7bb284d4cd = arrayremove( level.var_3f62ff7bb284d4cd, storm );
    
    if ( !isstruct( storm.source ) && isent( storm.source ) )
    {
        storm.source delete();
    }
}

// Namespace namespace_10a0481b1db56804
// Params 1, eflags: 0x4
// Checksum 0x6bb2dd6e, Offset: 0x9e1
// Size: 0x23
function private function_f8dc71eb5e2ec544( params )
{
    level.var_b6784f7a5cfd99a3 = arrayremove( level.var_b6784f7a5cfd99a3, self );
}

// Namespace namespace_10a0481b1db56804
// Params 1, eflags: 0x4
// Checksum 0xfa0f180, Offset: 0xa0c
// Size: 0x28, Type: bool
function private function_f9e4af90d656bfbf( ai )
{
    if ( ai zombie_stun::is_stunned() )
    {
        return false;
    }
    
    if ( ai vortex::is_pulled() )
    {
        return false;
    }
    
    return true;
}

/#

    // Namespace namespace_10a0481b1db56804
    // Params 0, eflags: 0x4
    // Checksum 0xb43a2adb, Offset: 0xa3d
    // Size: 0x4c, Type: dev
    function private function_13347f239e7237d6()
    {
        devgui::function_9082edeb5db93280( "<dev string:x91>" );
        devgui::add_devgui_func( "<dev string:xb2>", "<dev string:xd7>", &function_5b4fb81457dd8fcb );
        devgui::add_devgui_func( "<dev string:xfc>", "<dev string:x112>", &function_716ab79ec292a598 );
        devgui::function_77df7fe7dd273e10();
        level thread function_78d4fa3e944b47fd();
    }

    // Namespace namespace_10a0481b1db56804
    // Params 0, eflags: 0x4
    // Checksum 0xa6f3b145, Offset: 0xa91
    // Size: 0x1a, Type: dev
    function private function_5b4fb81457dd8fcb()
    {
        devgui::function_3f8a26ec96988e80( "<dev string:x128>", @"hash_4cc09bae4249fbe1" );
    }

    // Namespace namespace_10a0481b1db56804
    // Params 0, eflags: 0x4
    // Checksum 0x88a035cd, Offset: 0xab3
    // Size: 0xba, Type: dev
    function private function_78d4fa3e944b47fd()
    {
        level endon( #"game_ended" );
        
        while ( true )
        {
            waitframe();
            
            if ( !isdefined( level.var_3f62ff7bb284d4cd ) )
            {
                continue;
            }
            
            if ( getdvarint( @"hash_4cc09bae4249fbe1", 0 ) <= 0 )
            {
                continue;
            }
            
            foreach ( storm in level.var_3f62ff7bb284d4cd )
            {
                draw_storm( storm );
            }
        }
    }

    // Namespace namespace_10a0481b1db56804
    // Params 1, eflags: 0x4
    // Checksum 0x4268c27b, Offset: 0xb75
    // Size: 0x13a, Type: dev
    function private draw_storm( storm )
    {
        registered_info = level.var_5126d8de95e3777b[ storm.type ];
        color = ( 1, 0, 0 );
        cylinder( storm.source.origin - ( 0, 0, registered_info.height * 0.5 ), storm.source.origin + ( 0, 0, registered_info.height * 0.5 ), registered_info.radius, color, 1 );
        utility::draw_circle( storm.source.origin, 15, color, 1, 1, 1 );
        radius_text = registered_info.radius > 0 ? "<dev string:x13e>" + registered_info.radius : "<dev string:x48>";
        print3d( storm.source.origin + ( 0, 0, 32 ), "<dev string:x14a>" + radius_text, color );
    }

    // Namespace namespace_10a0481b1db56804
    // Params 1, eflags: 0x4
    // Checksum 0x59cda59a, Offset: 0xcb7
    // Size: 0x49, Type: dev
    function private function_716ab79ec292a598( params )
    {
        random_type = utility::random_key( level.var_5126d8de95e3777b );
        
        if ( random_type )
        {
            pos = devgui::function_97024c0a6d1256a6();
            create_storm( random_type, pos );
        }
    }

#/
