#using scripts\common\system;
#using scripts\common\utility;
#using scripts\mp\zm\systems\zm_quest;
#using scripts\mp\zm\systems\zm_save;
#using scripts\mp\zombie_intel;

#namespace zm_sat_mantis_intel;

// Namespace zm_sat_mantis_intel
// Params 0, eflags: 0x5
// Checksum 0x79138a87, Offset: 0x210
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"hash_ee754642c62ea65a", undefined, &__init__, undefined );
}

// Namespace zm_sat_mantis_intel
// Params 0
// Checksum 0xc09f75bc, Offset: 0x231
// Size: 0x1d
function __init__()
{
    if ( !getdvarint( @"hash_bb4d4e9d5661c0f9", 0 ) )
    {
        return;
    }
    
    level thread intel_setup();
}

// Namespace zm_sat_mantis_intel
// Params 0
// Checksum 0x6ed01466, Offset: 0x256
// Size: 0xd9
function intel_setup()
{
    level utility::flag_wait( "scriptables_ready" );
    level utility::flag_wait( "zm_sat_mantis_intel_create_script_completed" );
    zm_save::function_1f44a48caae2acbf();
    level.var_576311e16725542b = utility::getstruct( "chalk_d_1" );
    level.var_576312e16725565e = utility::getstruct( "chalk_d_2" );
    level.var_576313e167255891 = utility::getstruct( "chalk_d_3" );
    level.var_576314e167255ac4 = utility::getstruct( "chalk_d_4" );
    utility::spawn_model( "sat_zm_intel_mantis_doc_05", level.var_576311e16725542b.origin, level.var_576311e16725542b.angles );
    wait 5;
    level.var_b977508ae7c0e4c8 = zm_quest::function_91f9590e98d57ff6( level.var_576311e16725542b.origin, &function_9407baa28b9d4c8f, &chalk_hint, "medium_anyanglefov" );
}

// Namespace zm_sat_mantis_intel
// Params 2
// Checksum 0x7e4a4c64, Offset: 0x337
// Size: 0x40
function chalk_hint( interact, player )
{
    return { #var_26bbd300351fde34:0, #string:&"zm_sat_intel/chalk_interact", #type:"HINT_BUTTON" };
}

// Namespace zm_sat_mantis_intel
// Params 1
// Checksum 0x482a0ef8, Offset: 0x380
// Size: 0xb1
function function_9407baa28b9d4c8f( player )
{
    level.var_b977508ae7c0e4c8 freescriptable();
    intel::spawn_intel_at_location( undefined, undefined, level.var_576311e16725542b.origin, level.var_576311e16725542b.angles, "zmintel_sat_mantis_audiolog_7" );
    utility::spawn_model( "sat_zm_intel_mantis_doc_08", level.var_576312e16725565e.origin, level.var_576312e16725565e.angles );
    level.var_b977538ae7c0eb61 = zm_quest::function_91f9590e98d57ff6( level.var_576312e16725565e.origin, &function_db602eb2641aac94, &chalk_hint, "medium_anyanglefov" );
}

// Namespace zm_sat_mantis_intel
// Params 1
// Checksum 0xd5d68f7f, Offset: 0x439
// Size: 0xb1
function function_db602eb2641aac94( player )
{
    level.var_b977538ae7c0eb61 freescriptable();
    intel::spawn_intel_at_location( undefined, undefined, level.var_576312e16725565e.origin, level.var_576312e16725565e.angles, "zmintel_sat_mantis_audiolog_8" );
    utility::spawn_model( "sat_zm_intel_mantis_doc_07", level.var_576313e167255891.origin, level.var_576313e167255891.angles );
    level.var_b977528ae7c0e92e = zm_quest::function_91f9590e98d57ff6( level.var_576313e167255891.origin, &function_56ba94979f94ddf9, &chalk_hint, "medium_anyanglefov" );
}

// Namespace zm_sat_mantis_intel
// Params 1
// Checksum 0x32e8d912, Offset: 0x4f2
// Size: 0xb4
function function_56ba94979f94ddf9( player )
{
    level.var_b977528ae7c0e92e freescriptable();
    intel::spawn_intel_at_location( undefined, undefined, level.var_576313e167255891.origin, level.var_576313e167255891.angles, "zmintel_sat_mantis_audiolog_9" );
    utility::spawn_model( "sat_zm_intel_mantis_doc_06", level.var_576314e167255ac4.origin, level.var_576314e167255ac4.angles );
    intel::spawn_intel_at_location( undefined, undefined, level.var_576314e167255ac4.origin, level.var_576314e167255ac4.angles, "zmintel_sat_mantis_audiolog_10" );
}

