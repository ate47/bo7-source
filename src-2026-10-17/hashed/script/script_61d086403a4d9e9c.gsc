#using scripts\common\callbacks;

#namespace specialty_fast_reviver_25;

// Namespace specialty_fast_reviver_25
// Params 0, eflags: 0x5
// Checksum 0xcf401c6d, Offset: 0x93
// Size: 0x18
function private autoexec preinit()
{
    level callback::add( #"register_perk", &function_3f74064a5ef5ee06 );
}

// Namespace specialty_fast_reviver_25
// Params 1, eflags: 0x4
// Checksum 0x91397c1d, Offset: 0xb3
// Size: 0x3a
function private function_3f74064a5ef5ee06( params )
{
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_fast_reviver_25", &setspecialty, &unsetspecialty, [] );
    }
}

// Namespace specialty_fast_reviver_25
// Params 0, eflags: 0x4
// Checksum 0x4e48a18b, Offset: 0xf5
// Size: 0x2
function private setspecialty()
{
    
}

// Namespace specialty_fast_reviver_25
// Params 0, eflags: 0x4
// Checksum 0x7eff15e5, Offset: 0xff
// Size: 0x2
function private unsetspecialty()
{
    
}

