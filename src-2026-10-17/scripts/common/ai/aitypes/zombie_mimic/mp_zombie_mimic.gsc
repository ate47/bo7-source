#using script_606754bc418969dc;
#using scripts\common\callbacks;
#using scripts\common\utility;
#using scripts\common\weapon;
#using scripts\mp\agents\agent_utils;

#namespace mp_zombie_mimic;

// Namespace mp_zombie_mimic
// Params 2
// Checksum 0xf63abc53, Offset: 0x104
// Size: 0xb1
function precache( classname, aitypescriptbundle )
{
    if ( isdefined( level.var_559af509a83b6172 ) )
    {
        return;
    }
    
    level.var_559af509a83b6172 = 1;
    level thread namespace_a3764ff99ce0cd56::function_de819190b982b94e();
    level.var_29b254229e44041c = "mimicproplist:jup_mimic_prop_list_default";
    namespace_a3764ff99ce0cd56::function_e38030e0f56f312b( 1, &namespace_a3764ff99ce0cd56::function_931cd02a834f49f7, &function_38ee6a14779dd269 );
    
    if ( !isdefined( level.var_35b49e9ab3037480 ) )
    {
        aitypes = agent_utils::get_aitype_by_subclass( "zombie_mimic" );
        level.var_35b49e9ab3037480 = utility::array_random( aitypes );
    }
    
    level callback::add( "mimic_spawned", &function_6d7e0baa4663e4b );
    level callback::add( "on_entity_hidden_in_prop", &function_e6e4d173c6451de8 );
}

// Namespace mp_zombie_mimic
// Params 1, eflags: 0x4
// Checksum 0x64518e8, Offset: 0x1bd
// Size: 0x2b
function private function_6d7e0baa4663e4b( params )
{
    weapon::registerkillstreakweaponmap( "zombie_mimic", self.grenadeweapon.basename );
}

// Namespace mp_zombie_mimic
// Params 1, eflags: 0x4
// Checksum 0xd128ac70, Offset: 0x1f0
// Size: 0x94, Type: bool
function private function_38ee6a14779dd269( lure_prop_struct )
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

// Namespace mp_zombie_mimic
// Params 1, eflags: 0x4
// Checksum 0x5891991e, Offset: 0x28d
// Size: 0x115
function private function_e6e4d173c6451de8( params )
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

