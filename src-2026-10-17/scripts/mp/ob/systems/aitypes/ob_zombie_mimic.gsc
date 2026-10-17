#using script_606754bc418969dc;
#using scripts\common\ai\ai_spawn_director;
#using scripts\common\callbacks;
#using scripts\common\utility;
#using scripts\common\weapon;
#using scripts\mp\agents\agent_utils;

#namespace ob_zombie_mimic;

// Namespace ob_zombie_mimic
// Params 2
// Checksum 0xaf1674be, Offset: 0x13c
// Size: 0xb9
function precache( classname, aitypescriptbundle )
{
    if ( isdefined( level.var_c0d3161f15d40706 ) )
    {
        return;
    }
    
    level.var_c0d3161f15d40706 = 1;
    level thread namespace_a3764ff99ce0cd56::function_de819190b982b94e();
    level.var_29b254229e44041c = "mimicproplist:jup_mimic_prop_list_default";
    namespace_a3764ff99ce0cd56::function_e38030e0f56f312b( 1, &namespace_a3764ff99ce0cd56::function_931cd02a834f49f7, &function_d708dbc20efc48c5 );
    
    if ( !isdefined( level.var_35b49e9ab3037480 ) )
    {
        aitypes = agent_utils::get_aitype_by_subclass( "zombie_mimic" );
        level.var_35b49e9ab3037480 = utility::array_random( aitypes );
    }
    
    level callback::add( "mimic_spawned", &function_6d7e0baa4663e4b );
    level callback::add( "on_entity_hidden_in_prop", &function_6b76b64fa1f59a70 );
    level thread add_spawn_callback();
}

// Namespace ob_zombie_mimic
// Params 1
// Checksum 0x2f352110, Offset: 0x1fd
// Size: 0x2b
function function_6d7e0baa4663e4b( params )
{
    weapon::registerkillstreakweaponmap( "zombie_mimic", self.grenadeweapon.basename );
}

// Namespace ob_zombie_mimic
// Params 1
// Checksum 0xd3040f03, Offset: 0x230
// Size: 0x94, Type: bool
function function_d708dbc20efc48c5( lure_prop_struct )
{
    if ( lure_prop_struct.interact ishintinoperable() || !lure_prop_struct.interact isusableenabled() || !lure_prop_struct.interact isusable() )
    {
        return false;
    }
    
    if ( lure_prop_struct.interact isscriptable() && lure_prop_struct.interact getscriptablehaspart( "base" ) && lure_prop_struct.interact getscriptablepartstate( "base" ) == "power_off" )
    {
        return false;
    }
    
    return true;
}

// Namespace ob_zombie_mimic
// Params 3
// Checksum 0x8469c142, Offset: 0x2cd
// Size: 0x15f
function function_a3bfc96cf530146b( zombie, requestid, data )
{
    if ( issubstr( zombie.subclass, "zombie_mimic" ) )
    {
        if ( !data.alert && data.ambient )
        {
            var_dcd1065d9558c114 = namespace_a3764ff99ce0cd56::function_e1614198bafc8acf( zombie.origin, 3000, 1, 1 );
            valid_spawnpoints = [];
            prop_point = undefined;
            
            foreach ( point in var_dcd1065d9558c114 )
            {
                if ( point.script_noteworthy == "ambient_mimic_spawn" )
                {
                    valid_spawnpoints[ valid_spawnpoints.size ] = point;
                }
            }
            
            if ( valid_spawnpoints.size > 0 )
            {
                random_index = randomint( valid_spawnpoints.size );
                prop_point = valid_spawnpoints[ random_index ];
            }
            
            if ( isdefined( prop_point ) && isdefined( prop_point.proplist ) )
            {
                namespace_a3764ff99ce0cd56::function_93a8605debe833a4( [ prop_point ], zombie, undefined, prop_point.proplist );
            }
        }
    }
}

// Namespace ob_zombie_mimic
// Params 1
// Checksum 0x71e1a0e6, Offset: 0x434
// Size: 0x115
function function_6b76b64fa1f59a70( params )
{
    level endon( #"game_ended" );
    self notify( #"hash_680d8f6a58819720" );
    self endon( #"hash_680d8f6a58819720" );
    prop_array = self.prop_array;
    self waittill( #"death", killer, meansofdeath );
    
    if ( meansofdeath != "MOD_DESPAWN" )
    {
        return;
    }
    
    if ( !isarray( prop_array ) )
    {
        return;
    }
    
    foreach ( prop in prop_array )
    {
        if ( !isdefined( prop ) )
        {
            continue;
        }
        
        if ( isdefined( prop.var_8aa77779eb1a5e0b ) )
        {
            [[ prop.var_8aa77779eb1a5e0b ]]();
        }
        
        level thread namespace_a3764ff99ce0cd56::clean_up_prop( prop );
    }
}

// Namespace ob_zombie_mimic
// Params 0
// Checksum 0x3e9985f5, Offset: 0x551
// Size: 0x1a
function add_spawn_callback()
{
    utility::flag_wait( "ai_spawn_director_initialized" );
    ai_spawn_director::function_c83497dcedebe189( &function_a3bfc96cf530146b );
}

