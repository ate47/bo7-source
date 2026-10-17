#using scripts\common\callbacks;

#namespace specialty_enemy_ads_awareness_immunity;

// Namespace specialty_enemy_ads_awareness_immunity
// Params 0, eflags: 0x1
// Checksum 0xa59bcd9e, Offset: 0xa0
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_enemy_ads_awareness_immunity
// Params 1
// Checksum 0x9d18916a, Offset: 0xc0
// Size: 0x3a
function registerspecialty( params )
{
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_enemy_ads_awareness_immunity", &function_df44041306d64b9b, &function_a1865ea45108dc28, [] );
    }
}

// Namespace specialty_enemy_ads_awareness_immunity
// Params 0
// Checksum 0x3bf0c22f, Offset: 0x102
// Size: 0xd
function function_df44041306d64b9b()
{
    self.var_36a00ee4342585a9 = 1;
}

// Namespace specialty_enemy_ads_awareness_immunity
// Params 0
// Checksum 0x607e6189, Offset: 0x117
// Size: 0xc
function function_a1865ea45108dc28()
{
    self.var_36a00ee4342585a9 = undefined;
}

