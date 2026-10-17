#using scripts\common\callbacks;
#using scripts\mp\agents\agent_utils;
#using scripts\mp\zm\systems\zone_manager;
#using scripts\mp\zm\zm_utility;

#namespace zm_zombie_disciple;

// Namespace zm_zombie_disciple
// Params 2
// Checksum 0x82a7800d, Offset: 0x129
// Size: 0x123
function precache( classname, aitypescriptbundle )
{
    var_e79e2709aadecfd = agent_utils::get_aitype_by_subclass( "zombie_base" );
    base_aitype = undefined;
    
    foreach ( aitype in var_e79e2709aadecfd )
    {
        strlen = aitype.size;
        
        if ( !isdefined( base_aitype ) || base_aitype.size > strlen )
        {
            base_aitype = aitype;
        }
    }
    
    aitype_to_spawn = base_aitype;
    level.var_c9fa5883a2c15ba5 = aitype_to_spawn;
    
    if ( !isdefined( level.var_10208ef92cb393b5 ) )
    {
        callback::add( "on_zombie_disciple_skoll_spawned", &function_1940b732b387aaca );
        callback::add( "on_zombie_disciple_skoll_hvt_spawned", &function_1940b732b387aaca );
        callback::add( "disciple_check_passive_spawn_location", &disciple_check_passive_spawn_location );
        level.var_10208ef92cb393b5 = 1;
    }
}

// Namespace zm_zombie_disciple
// Params 1
// Checksum 0x807f038f, Offset: 0x254
// Size: 0x1d
function function_1940b732b387aaca( params )
{
    callback::add( "disciple_check_round_spawn_limits_requested", &function_5092ebdaa9629cf2 );
}

// Namespace zm_zombie_disciple
// Params 1
// Checksum 0x914b0234, Offset: 0x279
// Size: 0x41
function function_5092ebdaa9629cf2( params )
{
    var_a45189ff1e34f63c = 0;
    
    if ( zm_utility::get_active_zombies_count() < level.var_a009ab14ee0d3223.var_63a0ca44b877a390 )
    {
        self.var_a45189ff1e34f63c = 1;
    }
}

// Namespace zm_zombie_disciple
// Params 1
// Checksum 0x49043548, Offset: 0x2c2
// Size: 0x3b, Type: bool
function disciple_check_passive_spawn_location( params )
{
    zone = zone_manager::function_90e5c3e2272b0130( params.location );
    return isdefined( zone ) && zone.is_active;
}

