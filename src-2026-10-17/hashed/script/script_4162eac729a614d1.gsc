#using scripts\common\callbacks;

#namespace specialty_adaptive_ads_speed;

// Namespace specialty_adaptive_ads_speed
// Params 0, eflags: 0x5
// Checksum 0xe812e986, Offset: 0x96
// Size: 0x18
function private autoexec preinit()
{
    level callback::add( #"register_perk", &function_75836d9c57d82380 );
}

// Namespace specialty_adaptive_ads_speed
// Params 1, eflags: 0x4
// Checksum 0x470c57f3, Offset: 0xb6
// Size: 0x32
function private function_75836d9c57d82380( params )
{
    if ( isdefined( params.var_a2358848c4408242 ) )
    {
        level [[ params.var_a2358848c4408242 ]]( "specialty_adaptive_ads_speed", undefined, undefined, [] );
    }
}

