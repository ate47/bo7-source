#using script_2fe74ee229c972c3;
#using script_5bcddb9b3157c08c;
#using script_6c2f6a14fa53759e;
#using scripts\common\callbacks;
#using scripts\common\utility;
#using scripts\mp\agents\agent_utils;

#namespace skill_rampage;

// Namespace skill_rampage
// Params 0, eflags: 0x1
// Checksum 0xa513d034, Offset: 0x8b
// Size: 0x17
function autoexec main()
{
    shared_skills::function_b667da63ece9b966( #"rampage", &init );
}

// Namespace skill_rampage
// Params 0
// Checksum 0x87d43b91, Offset: 0xaa
// Size: 0x86
function init()
{
    utility::registersharedfunc( #"rampage", #"hash_f89602d29c289ca4", &function_1321989bae991e4f );
    utility::registersharedfunc( #"rampage", #"ongiveskill", &on_give_skill );
    utility::registersharedfunc( #"rampage", #"hash_4aa03f4559ac50a5", &function_c51f1692ecb73bfe );
    callback::add( #"on_ai_killed", &function_27e23881e5a37b5c );
    callback::add( #"player_death", &function_27e23881e5a37b5c );
}

// Namespace skill_rampage
// Params 1, eflags: 0x4
// Checksum 0x7ef17d2a, Offset: 0x138
// Size: 0x37
function private function_1321989bae991e4f( skill_bundle )
{
    if ( skill_bundle.var_bd25f191f2ff78f )
    {
        skill_bundle.var_38e132d7f76e934f = utility::function_4b74c15943231980( skill_bundle.var_bd25f191f2ff78f );
    }
}

// Namespace skill_rampage
// Params 1, eflags: 0x4
// Checksum 0x2754875a, Offset: 0x177
// Size: 0x97, Type: bool
function private on_give_skill( skill_bundle )
{
    assert( skill_bundle.var_38e132d7f76e934f, "<dev string:x24>" );
    assert( skill_bundle.var_80b0e1fbebcc8ddf, "<dev string:x4c>" );
    assert( skill_bundle.var_92249f919f7b7fc8, "<dev string:x71>" );
    assert( skill_bundle.var_2765e83c97f7b58, "<dev string:x9f>" );
    self.var_41325c50d6a52126 = { #lastweaponused:undefined, #var_38ab74b0227b60d6:undefined, #bundle:skill_bundle };
    return true;
}

// Namespace skill_rampage
// Params 1, eflags: 0x4
// Checksum 0x9d35b35, Offset: 0x217
// Size: 0x39
function private function_c51f1692ecb73bfe( skill_bundle )
{
    self notify( #"end_skill_rampage" );
    namespace_9bde28f6fb0d35d1::end_boost( #"rampage" );
    self.var_41325c50d6a52126 = undefined;
    function_fb53c860b03a94ea();
}

// Namespace skill_rampage
// Params 1, eflags: 0x4
// Checksum 0xffcf364b, Offset: 0x258
// Size: 0x94
function private function_27e23881e5a37b5c( params )
{
    attacker = params.attacker ?? params.eattacker;
    skill_data = attacker.var_41325c50d6a52126;
    
    if ( !skill_data )
    {
        return;
    }
    
    bundle = skill_data.bundle;
    rapid_kills_done = function_e23da3e70ef873dc( attacker, params, skill_data, bundle );
    
    if ( rapid_kills_done )
    {
        skill_data.var_38ab74b0227b60d6 = [];
        attacker thread do_damage_buff( bundle );
    }
}

// Namespace skill_rampage
// Params 1, eflags: 0xc
// Checksum 0xab7f964e, Offset: 0x2f4
// Size: 0xc1
function private do_damage_buff( bundle )
{
    self notify( #"hash_b48557e2c0d6070d" );
    self endon( #"hash_b48557e2c0d6070d" );
    self endon( #"end_skill_rampage" );
    self endon( #"death_or_disconnect" );
    
    /#
        if ( getdvarint( @"scr_skill_rampage_debug", 0 ) )
        {
            self iprintlnbold( "<dev string:xd6>" );
        }
    #/
    
    function_fb53c860b03a94ea();
    function_a646246d46144ab6();
    buff_duration = bundle.var_2765e83c97f7b58;
    namespace_9bde28f6fb0d35d1::function_faf7ed88035696ef( #"rampage", buff_duration, buff_duration, "end_skill_rampage" );
    wait buff_duration;
    function_fb53c860b03a94ea();
    
    /#
        if ( getdvarint( @"scr_skill_rampage_debug", 0 ) )
        {
            self iprintlnbold( "<dev string:xf7>" );
        }
    #/
}

// Namespace skill_rampage
// Params 0, eflags: 0xc
// Checksum 0xc1b7c3b7, Offset: 0x3bd
// Size: 0x32
function private function_a646246d46144ab6()
{
    self notify( #"hash_7e3399d0bc22b0a7" );
    self endon( #"hash_7e3399d0bc22b0a7" );
    agent_utils::function_bc89b9076dd93902( &on_damage_buffed );
    zombie_utils::function_dfae6a5bd222c586( &on_damage_buffed );
}

// Namespace skill_rampage
// Params 0, eflags: 0x4
// Checksum 0x5a2ea869, Offset: 0x3f7
// Size: 0x1a
function private function_fb53c860b03a94ea()
{
    agent_utils::function_def5273cfe3c9109( &on_damage_buffed );
    zombie_utils::function_10c0c35c21e3ed9d( &on_damage_buffed );
}

// Namespace skill_rampage
// Params 1, eflags: 0x4
// Checksum 0x8230d1e6, Offset: 0x419
// Size: 0xd5
function private on_damage_buffed( params )
{
    attacker = params.eattacker ?? params.attacker;
    assert( isplayer( attacker ) );
    skill_data = attacker.var_41325c50d6a52126;
    bundle = skill_data.bundle;
    current_damage = params.idamage;
    
    if ( params.sweapon == skill_data.lastweaponused )
    {
        current_damage *= bundle.var_92249f919f7b7fc8;
        attacker function_d5bf26cf8c19220b( bundle.var_e131d981b4f49a2e );
    }
    else
    {
        skill_data.lastweaponused = undefined;
        attacker function_fb53c860b03a94ea();
    }
    
    return current_damage;
}

// Namespace skill_rampage
// Params 1, eflags: 0x4
// Checksum 0x4e3b068, Offset: 0x4f7
// Size: 0x1a
function private function_d5bf26cf8c19220b( sfx )
{
    if ( sfx )
    {
        self playsoundtoplayer( sfx, self );
    }
}

// Namespace skill_rampage
// Params 4, eflags: 0x4
// Checksum 0xd6d723b3, Offset: 0x519
// Size: 0x1d0, Type: bool
function private function_e23da3e70ef873dc( attacker, params, skill_data, bundle )
{
    if ( !isdefined( skill_data.var_38ab74b0227b60d6 ) )
    {
        skill_data.var_38ab74b0227b60d6 = [];
    }
    
    current_time = gettime();
    skill_data.var_38ab74b0227b60d6[ skill_data.var_38ab74b0227b60d6.size ] = current_time;
    window_start = current_time - bundle.var_38e132d7f76e934f;
    var_d6c77036808a7aa = [];
    
    foreach ( timestamp in skill_data.var_38ab74b0227b60d6 )
    {
        if ( timestamp >= window_start )
        {
            var_d6c77036808a7aa[ var_d6c77036808a7aa.size ] = timestamp;
        }
    }
    
    if ( !utility::isbulletdamage( params.smeansofdeath ) )
    {
        var_d6c77036808a7aa = [];
        skill_data.lastweaponused = undefined;
        skill_data.var_38ab74b0227b60d6 = undefined;
        return false;
    }
    
    if ( function_baaad8889b53c41a( params, skill_data ) )
    {
        var_d6c77036808a7aa = [];
        var_d6c77036808a7aa[ var_d6c77036808a7aa.size ] = current_time;
    }
    
    skill_data.lastweaponused = params.sweapon;
    skill_data.var_38ab74b0227b60d6 = var_d6c77036808a7aa;
    
    /#
        if ( getdvarint( @"scr_skill_rampage_debug", 0 ) )
        {
            attacker iprintlnbold( "<dev string:x119>" + skill_data.var_38ab74b0227b60d6.size + "<dev string:x137>" + bundle.var_80b0e1fbebcc8ddf );
        }
    #/
    
    return skill_data.var_38ab74b0227b60d6.size >= bundle.var_80b0e1fbebcc8ddf;
}

// Namespace skill_rampage
// Params 2, eflags: 0x4
// Checksum 0xe4db584f, Offset: 0x6f2
// Size: 0x3b, Type: bool
function private function_baaad8889b53c41a( params, skill_data )
{
    return skill_data.lastweaponused && skill_data.lastweaponused != params.sweapon;
}

