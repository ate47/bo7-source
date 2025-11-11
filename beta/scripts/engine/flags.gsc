#using scripts\engine\utility;

#namespace flags;

// Namespace flags
// Params 0
// Checksum 0xf14e3ea4, Offset: 0x9a
// Size: 0x52
function init_flags()
{
    if ( !utility::add_init_script( "init_flags", &init_flags ) )
    {
        return;
    }
    
    level.flag = [];
    level.flags_lock = [];
    level.generic_index = 0;
    level.flag_struct = spawnstruct();
    level.flag_struct assign_unique_id();
}

// Namespace flags
// Params 0
// Checksum 0x2c88b37c, Offset: 0xf4
// Size: 0x24
function assign_unique_id()
{
    self.unique_id = "generic" + level.generic_index;
    level.generic_index++;
}

