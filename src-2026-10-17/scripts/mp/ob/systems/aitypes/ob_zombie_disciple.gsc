#using scripts\common\utility;
#using scripts\mp\agents\agent_utils;

#namespace ob_zombie_disciple;

// Namespace ob_zombie_disciple
// Params 2
// Checksum 0xb356b576, Offset: 0x85
// Size: 0x3d
function precache( classname, aitypescriptbundle )
{
    aitypes = agent_utils::get_aitype_by_subclass( "zombie_base" );
    level.var_c9fa5883a2c15ba5 = utility::array_random( aitypes );
}

