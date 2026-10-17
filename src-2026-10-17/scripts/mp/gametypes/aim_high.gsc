#using script_2b51dca51198db31;
#using scripts\common\utility;
#using scripts\mp\damage;

#namespace aim_high;

// Namespace aim_high
// Params 0, eflags: 0x1
// Checksum 0xf94c8df8, Offset: 0xd2
// Size: 0x1b
function autoexec main()
{
    if ( !getdvarint( @"hash_9e466fa03585c99e", 0 ) )
    {
        init();
    }
}

// Namespace aim_high
// Params 0, eflags: 0x4
// Checksum 0x2b390ddf, Offset: 0xf5
// Size: 0x9b
function private init()
{
    level.headshotDamageMultiplier = getmatchrulesdata( "commonOption", "headshotDamageMultiplier" );
    level.bodydamagemultiplier = getmatchrulesdata( "commonOption", "nonHeadshotDamageMultiplier" );
    
    if ( !( level.headshotDamageMultiplier || !level.nonHeadshotDamageMultiplier ) )
    {
        return;
    }
    
    if ( level.headshotDamageMultiplier != 1 || level.bodydamagemultiplier != 1 )
    {
        damage::register_scripted_damage_override_func( &player_damage_override );
    }
    
    if ( level.bodydamagemultiplier < 1 )
    {
        damage::function_231589aee53ae064( &function_4aae200be06f56ae );
    }
}

// Namespace aim_high
// Params 1, eflags: 0x4
// Checksum 0xb1ea85b4, Offset: 0x198
// Size: 0x5b
function private function_4aae200be06f56ae( hitparams )
{
    str_means_of_death = hitparams.meansofdeath;
    str_hit_loc = hitparams.hitlocation;
    
    if ( !utility::isbulletdamage( str_means_of_death ) )
    {
        return;
    }
    
    if ( damage_utility::isheadshot( str_hit_loc, str_means_of_death ) )
    {
        return;
    }
    
    return "hitarmorlight";
}

// Namespace aim_high
// Params 10, eflags: 0x4
// Checksum 0x30f70b13, Offset: 0x1fb
// Size: 0xd5
function private player_damage_override( e_inflictor, e_attacker, n_damage, id_flags, str_means_of_death, obj_weapon, v_point, v_dir, str_hit_loc, var_10a6b9eadfe28ee1 )
{
    if ( !isdefined( level.headshotDamageMultiplier ) )
    {
        level.headshotDamageMultiplier = 1;
    }
    
    if ( !isdefined( level.bodydamagemultiplier ) )
    {
        level.bodydamagemultiplier = 1;
    }
    
    if ( utility::isbulletdamage( str_means_of_death ) )
    {
        n_multiplier = damage_utility::isheadshot( str_hit_loc, str_means_of_death, e_attacker ) ? level.headshotDamageMultiplier : level.bodydamagemultiplier;
    }
    else
    {
        n_multiplier = 1;
    }
    
    return n_multiplier * n_damage;
}

