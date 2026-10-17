#using scripts\asm\asm;

#namespace namespace_e35cf5e19cb4a348;

// Namespace namespace_e35cf5e19cb4a348
// Params 0
// Checksum 0x50be8b7c, Offset: 0x81
// Size: 0x9
function function_51e38bfee277eed1()
{
    thread manage_puke();
}

// Namespace namespace_e35cf5e19cb4a348
// Params 0, eflags: 0x4
// Checksum 0x263194ac, Offset: 0x92
// Size: 0x35
function private manage_puke()
{
    self endon( #"death" );
    self endon( #"puke_end" );
    asm::function_7256f5ba459c840b( "puke_in" );
    wait 3;
    self notify( #"puke_zombies" );
}

