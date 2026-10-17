#using scripts\common\callbacks;

#namespace specialty_longer_bleedout;

// Namespace specialty_longer_bleedout
// Params 0, eflags: 0x5
// Checksum 0x4eae64d9, Offset: 0x93
// Size: 0x18
function private autoexec preinit()
{
    level callback::add( #"register_perk", &function_96dc08f4e8f2d042 );
}

// Namespace specialty_longer_bleedout
// Params 1, eflags: 0x4
// Checksum 0x315211bd, Offset: 0xb3
// Size: 0x3a
function private function_96dc08f4e8f2d042( params )
{
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_longer_bleedout", &setspecialty, &unsetspecialty, [] );
    }
}

// Namespace specialty_longer_bleedout
// Params 0, eflags: 0x4
// Checksum 0x42a661a, Offset: 0xf5
// Size: 0x30
function private setspecialty()
{
    player = self;
    player.var_18f4ebec6ae0c1db = player.var_9842326056fd7207.var_18f4ebec6ae0c1db;
}

// Namespace specialty_longer_bleedout
// Params 0, eflags: 0x4
// Checksum 0x717ba036, Offset: 0x12d
// Size: 0x1a
function private unsetspecialty()
{
    player = self;
    player.var_18f4ebec6ae0c1db = undefined;
}

