#using scripts\common\callbacks;

#namespace specialty_ammo_on_kill;

// Namespace specialty_ammo_on_kill
// Params 0, eflags: 0x1
// Checksum 0x1024a8ab, Offset: 0x90
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_ammo_on_kill
// Params 1
// Checksum 0x1dc88ea4, Offset: 0xb0
// Size: 0x4a
function registerspecialty( params )
{
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_ammo_on_kill", &function_c3ab919af19042b8 );
        level callback::add( #"on_ai_killed", &function_48ca7485cd41b9e3 );
    }
}

// Namespace specialty_ammo_on_kill
// Params 1, eflags: 0x4
// Checksum 0x1df1066a, Offset: 0x102
// Size: 0x8f
function private function_48ca7485cd41b9e3( params )
{
    if ( isplayer( params.eattacker ) && isdefined( params.eattacker.perks[ "specialty_ammo_on_kill" ] ) )
    {
        params.eattacker endon( #"death" );
        params.eattacker endon( #"hash_255a14471cab1008" );
        weaponobj = params.eattacker getcurrentweapon();
        giveextraammo( params, weaponobj );
    }
}

// Namespace specialty_ammo_on_kill
// Params 2, eflags: 0x4
// Checksum 0xc6306d48, Offset: 0x199
// Size: 0xac
function private giveextraammo( params, weaponobj )
{
    n_clip_max = weaponclipsize( weaponobj );
    n_clip_current = params.eattacker getweaponammoclip( weaponobj );
    extra_ammo = level.perkbundles[ "specialty_ammo_on_kill" ].ammoonkill;
    var_473334703aff960b = n_clip_max * extra_ammo;
    current_ammo_difference = n_clip_max - n_clip_current;
    total_ammo_give = min( var_473334703aff960b + n_clip_current, n_clip_max );
    params.eattacker setweaponammoclip( weaponobj, int( total_ammo_give ) );
}

// Namespace specialty_ammo_on_kill
// Params 0
// Checksum 0xe0e44f05, Offset: 0x24d
// Size: 0x16
function function_c3ab919af19042b8()
{
    if ( isplayer( self ) )
    {
        self notify( #"hash_255a14471cab1008" );
    }
}

