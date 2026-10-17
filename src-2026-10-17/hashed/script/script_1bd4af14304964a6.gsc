#namespace namespace_2bbb671b69e96192;

// Namespace namespace_2bbb671b69e96192
// Params 0, eflags: 0x1
// Checksum 0xe869e77b, Offset: 0x96
// Size: 0x2d
function autoexec init()
{
    if ( !isdefined( level.var_79987b283d0c90da ) )
    {
        level.var_79987b283d0c90da = [];
    }
    
    level.var_79987b283d0c90da[ "t10_sn_p08_ultiger_rec_vault" ] = &weapon_inspect;
}

// Namespace namespace_2bbb671b69e96192
// Params 1, eflags: 0x4
// Checksum 0x66430b69, Offset: 0xcb
// Size: 0x4e
function private weapon_inspect( weapon )
{
    self endon( #"death_or_disconnect" );
    self setscriptablepartstate( #"hash_136280dc04cdcc01", #"error" );
    wait 2.2;
    self setscriptablepartstate( #"hash_136280dc04cdcc01", #"normal" );
}

