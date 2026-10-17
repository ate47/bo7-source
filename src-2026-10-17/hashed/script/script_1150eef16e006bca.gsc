#using script_dc8e00418efcae7;
#using scripts\common\callbacks;

#namespace namespace_b0ad4e0810767396;

// Namespace namespace_b0ad4e0810767396
// Params 0, eflags: 0x1
// Checksum 0xcc8e9866, Offset: 0x76
// Size: 0x18
function autoexec main()
{
    level callback::add( #"player_weapon_change", &function_ad0387179f45f874 );
}

// Namespace namespace_b0ad4e0810767396
// Params 1, eflags: 0x4
// Checksum 0x59c21154, Offset: 0x96
// Size: 0x5e
function private function_ad0387179f45f874( params )
{
    if ( params.weapon hasattachmenthash( %"sat_bar_bloom_sm_otter" ) )
    {
        thread damage_range_indicator::function_f0076932d98e2191();
        self.var_ad0387179f45f874 = 1;
        return;
    }
    
    if ( self.var_ad0387179f45f874 )
    {
        self notify( #"hash_b5fcbc77ee7be0ee" );
        self.var_ad0387179f45f874 = undefined;
    }
}

