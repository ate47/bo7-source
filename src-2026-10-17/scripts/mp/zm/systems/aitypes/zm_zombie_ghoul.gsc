#using scripts\mp\zm\spawners\zone_spawner;
#using scripts\mp\zm\zm_utility;

#namespace zm_zombie_ghoul;

// Namespace zm_zombie_ghoul
// Params 2
// Checksum 0x6616aa3a, Offset: 0x76
// Size: 0x23
function precache( classname, aitypescriptbundle )
{
    level.var_601b5149340f96ae = &function_601b5149340f96ae;
}

// Namespace zm_zombie_ghoul
// Params 0, eflags: 0x4
// Checksum 0x49ec1d4a, Offset: 0xa1
// Size: 0x6c, Type: bool
function private function_601b5149340f96ae()
{
    n_round = zm_utility::get_round_number();
    var_674e91ac9e52a4ee = level.var_a009ab14ee0d3223.var_75817f97ecc62f4[ self.evolution.next_subclass ] ?? 999;
    return n_round >= var_674e91ac9e52a4ee && zone_spawner::can_spawn_agent( self.evolution.next_subclass );
}

