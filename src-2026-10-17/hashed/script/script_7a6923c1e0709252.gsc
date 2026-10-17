#using scripts\common\system;

#namespace namespace_94707b424a942b9c;

// Namespace namespace_94707b424a942b9c
// Params 0, eflags: 0x5
// Checksum 0x4e9f566d, Offset: 0xd9
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"hash_d0df44637968b505", undefined, &init, undefined );
}

// Namespace namespace_94707b424a942b9c
// Params 0, eflags: 0x4
// Checksum 0xa8d5d062, Offset: 0xfa
// Size: 0x80
function private init()
{
    if ( !isdefined( level.var_ef6fc50ff40f47a8 ) )
    {
        level.var_ef6fc50ff40f47a8 = [];
    }
    
    level.var_ef6fc50ff40f47a8[ level.var_ef6fc50ff40f47a8.size ] = "t10_pi_p13_usugar9_mp";
    level.var_ef6fc50ff40f47a8[ level.var_ef6fc50ff40f47a8.size ] = "t10_sn_p08_ultiger_mp";
    level.var_ef6fc50ff40f47a8[ level.var_ef6fc50ff40f47a8.size ] = "t10_la_p18_stisaac_mp";
    level.var_ef6fc50ff40f47a8[ level.var_ef6fc50ff40f47a8.size ] = "t10_ar_p05_rmary2_mp";
}

