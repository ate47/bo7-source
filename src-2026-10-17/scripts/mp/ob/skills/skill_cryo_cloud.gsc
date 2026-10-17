#using script_2fe74ee229c972c3;
#using script_5fdf68c7957b0d13;
#using script_734dce84c468439b;
#using scripts\common\ai\ai_utility;
#using scripts\common\callbacks;
#using scripts\common\status_effects\effect_slow;
#using scripts\common\status_effects\status_effects;
#using scripts\common\utility;
#using scripts\common\weapon;

#namespace skill_cryo_cloud;

// Namespace skill_cryo_cloud
// Params 0, eflags: 0x1
// Checksum 0x97eafdd3, Offset: 0x12f
// Size: 0x2d
function autoexec main()
{
    shared_skills::function_b667da63ece9b966( #"cryo_cloud", &init );
    level callback::add( #"on_ai_damaged", &on_enemy_damaged );
}

// Namespace skill_cryo_cloud
// Params 0
// Checksum 0x2341fa1b, Offset: 0x164
// Size: 0x7a
function init()
{
    utility::registersharedfunc( #"cryo_cloud", #"ongiveskill", &on_give_skill );
    utility::registersharedfunc( #"cryo_cloud", #"hash_4aa03f4559ac50a5", &function_c51f1692ecb73bfe );
    utility::registersharedfunc( #"cryo_cloud", #"hash_f89602d29c289ca4", &function_1321989bae991e4f );
    utility::registersharedfunc( #"cryo_cloud", #"hash_8698c290a2e85469", &get_skill_weapons );
}

// Namespace skill_cryo_cloud
// Params 1, eflags: 0x4
// Checksum 0xf8b628d7, Offset: 0x1e6
// Size: 0xe7
function private function_1321989bae991e4f( skill_bundle )
{
    if ( skill_bundle.var_93d5b3d2ff68995e )
    {
        fx_asset = loadfxasset( skill_bundle.var_93d5b3d2ff68995e );
        fx_id_name = "cryo_cloud_fx_" + skill_bundle.skilllevel;
        level._effect[ fx_id_name ] = fx_asset;
        skill_bundle.var_32bfb1eebcafa7e3 = fx_id_name;
    }
    
    if ( skill_bundle.var_9e920f9d37d892fd )
    {
        skill_bundle.var_518c3f3f467402d9 = skill_bundle.var_9e920f9d37d892fd * 1000;
    }
    
    if ( skill_bundle.var_771f0731570bd7fc )
    {
        skill_bundle.var_36e834da355c05b0 = skill_bundle.var_771f0731570bd7fc * 1000;
    }
    
    if ( skill_bundle.var_4ebcaa2c7aab61f1 )
    {
        skill_bundle.var_ca7ed5586f7bc085 = skill_bundle.var_4ebcaa2c7aab61f1 * 1000;
    }
}

// Namespace skill_cryo_cloud
// Params 1, eflags: 0x4
// Checksum 0xa38f02b, Offset: 0x2d5
// Size: 0x276, Type: bool
function private on_give_skill( skill_bundle )
{
    assert( skill_bundle.var_32bfb1eebcafa7e3, "<dev string:x24>" );
    assert( skill_bundle.var_dbac0fe69791d34b, "<dev string:x6a>" );
    assert( skill_bundle.var_21b76b2c53ae7090, "<dev string:xaf>" );
    assert( skill_bundle.var_518c3f3f467402d9, "<dev string:xe9>" );
    assert( skill_bundle.var_36e834da355c05b0, "<dev string:x125>" );
    assert( skill_bundle.var_ca7ed5586f7bc085, "<dev string:x161>" );
    assert( skill_bundle.var_22fa00265baa416a, "<dev string:x1a1>" );
    assert( skill_bundle.var_27d94f800167705a, "<dev string:x1db>" );
    assert( skill_bundle.var_eda3e96c6f00159c, "<dev string:x219>" );
    assert( skill_bundle.var_ce44be0e930d1eae, "<dev string:x259>" );
    assert( skill_bundle.var_4ebcaa2c7aab61f1, "<dev string:x161>" );
    
    if ( skill_bundle.var_88f889d95cf8077b )
    {
        assert( skill_bundle.var_b4d39197799b5010, "<dev string:x298>" );
        assert( skill_bundle.var_b10a2b8c8c91e244, "<dev string:x2e1>" );
        assert( skill_bundle.var_738df51bddad5bc0, "<dev string:x327>" );
    }
    
    self.var_a5895ed4542cb7af = { #currentcooldown:0, #contagiousenemies:[], #bundle:skill_bundle };
    assert( !callback::exists( #"hash_b99dff90394eb45e", &function_6ee8c4a2e67771df ) );
    assert( !callback::exists( #"sensor_grenade_watch_enemy", &function_6ee8c4a2e67771df ) );
    callback::add( #"hash_b99dff90394eb45e", &function_6ee8c4a2e67771df );
    callback::add( #"sensor_grenade_watch_enemy", &function_6ee8c4a2e67771df );
    
    if ( skill_bundle.var_2475098232b29569 )
    {
        assert( skill_bundle.var_e8abaee73d5a0b6e, "<dev string:x36e>" );
        assert( skill_bundle.var_9c711684f83a727, "<dev string:x3b2>" );
        assert( skill_bundle.var_950294db34ac2ad7, "<dev string:x3fc>" );
        thread function_20a49135462df95a( self.var_a5895ed4542cb7af, skill_bundle );
    }
    
    /#
        thread function_14624944449f6a16( self.var_a5895ed4542cb7af, skill_bundle );
    #/
    
    return true;
}

// Namespace skill_cryo_cloud
// Params 1, eflags: 0x4
// Checksum 0x44a7cb2d, Offset: 0x554
// Size: 0x84
function private function_c51f1692ecb73bfe( skill_bundle )
{
    self notify( #"cryo_cloud_removed" );
    assert( callback::exists( #"hash_b99dff90394eb45e", &function_6ee8c4a2e67771df ) );
    assert( callback::exists( #"sensor_grenade_watch_enemy", &function_6ee8c4a2e67771df ) );
    callback::remove( #"hash_b99dff90394eb45e", &function_6ee8c4a2e67771df );
    callback::remove( #"sensor_grenade_watch_enemy", &function_6ee8c4a2e67771df );
    self.var_a5895ed4542cb7af = undefined;
}

// Namespace skill_cryo_cloud
// Params 1, eflags: 0x4
// Checksum 0xc8b2abad, Offset: 0x5e0
// Size: 0x1c
function private get_skill_weapons( skill_bundle )
{
    return [ skill_bundle.var_dbac0fe69791d34b ];
}

// Namespace skill_cryo_cloud
// Params 1, eflags: 0x4
// Checksum 0x5c42e9e9, Offset: 0x605
// Size: 0x5e
function private on_enemy_damaged( params )
{
    original_attacker = params.einflictor ?? params.eattacker;
    attacker = get_valid_attacker( original_attacker, params.objweapon );
    
    if ( !attacker )
    {
        return;
    }
    
    function_abdd8263a2317ba5( attacker );
}

// Namespace skill_cryo_cloud
// Params 1, eflags: 0x4
// Checksum 0x88d8f3e3, Offset: 0x66b
// Size: 0x44
function private function_6ee8c4a2e67771df( params )
{
    attacker = get_valid_attacker( self, params.objweapon );
    
    if ( !attacker )
    {
        return;
    }
    
    params.victim function_abdd8263a2317ba5( self );
}

// Namespace skill_cryo_cloud
// Params 2, eflags: 0x4
// Checksum 0x2e0dc7a7, Offset: 0x6b7
// Size: 0xc5
function private get_valid_attacker( original_attacker, weapon )
{
    attacker = original_attacker.owner ?? original_attacker;
    skill_data = attacker.var_a5895ed4542cb7af;
    bundle = skill_data.bundle;
    
    if ( !skill_data )
    {
        return;
    }
    
    if ( weapon::issuperweapon( weapon ) )
    {
        return;
    }
    
    if ( !original_attacker.isequipment && !weapon::isweaponequipment( weapon ) )
    {
        return;
    }
    
    ignored_weapons_list = bundle.var_1bb55fd6fe0b926f ?? [];
    
    if ( utility::callsharedfunc( #"skill", #"hash_51e6fd623b95a9a9", weapon, ignored_weapons_list ) )
    {
        return;
    }
    
    return attacker;
}

// Namespace skill_cryo_cloud
// Params 1, eflags: 0x4
// Checksum 0x6931acde, Offset: 0x785
// Size: 0x8a
function private function_abdd8263a2317ba5( attacker )
{
    skill_data = attacker.var_a5895ed4542cb7af;
    bundle = skill_data.bundle;
    curr_time = gettime();
    
    if ( skill_data.currentcooldown && skill_data.currentcooldown > curr_time )
    {
        return;
    }
    
    if ( !utility::percent_chance( bundle.var_21b76b2c53ae7090 ) )
    {
        return;
    }
    
    thread cryofreeze_ice_cloud( attacker, curr_time, skill_data, bundle );
}

// Namespace skill_cryo_cloud
// Params 4, eflags: 0x4
// Checksum 0x342bc4a6, Offset: 0x817
// Size: 0x254
function private cryofreeze_ice_cloud( attacker, curr_time, skill_data, bundle )
{
    level endon( #"game_ended" );
    skill_data.currentcooldown = curr_time + bundle.var_518c3f3f467402d9;
    duration = bundle.var_36e834da355c05b0;
    radius = bundle.var_22fa00265baa416a;
    spawn_sound = bundle.var_27d94f800167705a;
    despawn_sound = bundle.var_d40914ef8aedca03;
    height_offset = bundle.var_eda3e96c6f00159c;
    fx_id = bundle.var_32bfb1eebcafa7e3;
    idle_sound = bundle.var_5a09f0158fdfc63f;
    start_time = curr_time;
    last_time = curr_time;
    cloud_origin = ( self.origin[ 0 ], self.origin[ 1 ], self.origin[ 2 ] + height_offset );
    area = utility::spawn_tag_origin( cloud_origin, anglestoforward( self.angles ) );
    effect_id = utility::getfx( fx_id );
    area show();
    playfxontag( effect_id, area, "tag_origin" );
    area play_sound( spawn_sound );
    area play_sound_loop( idle_sound, 1 );
    
    while ( last_time - start_time < duration )
    {
        last_time = gettime();
        enemies_in_range = getaiarrayinradius( cloud_origin, radius );
        
        foreach ( enemy in enemies_in_range )
        {
            enemy thread function_fa254d81097de275( attacker, bundle.var_2475098232b29569, skill_data, bundle );
        }
        
        waitframe();
    }
    
    killfxontag( effect_id, area, "tag_origin" );
    area play_sound( despawn_sound, 0 );
    area play_sound_loop( idle_sound, 0 );
    area delete();
}

// Namespace skill_cryo_cloud
// Params 2, eflags: 0x4
// Checksum 0x21ad6478, Offset: 0xa73
// Size: 0x28f
function private function_20a49135462df95a( skill_data, bundle )
{
    level endon( #"game_ended" );
    self endon( #"cryo_cloud_removed" );
    
    while ( true )
    {
        wait 1;
        
        foreach ( enemy in skill_data.contagiousenemies )
        {
            if ( !isalive( enemy ) || !enemy status_effects::function_fa35fc2723e956eb( "slow", "cryo_cloud_slow" ) )
            {
                skill_data.contagiousenemies = arrayremove( skill_data.contagiousenemies, enemy );
            }
        }
        
        if ( skill_data.contagiousenemies.size == 0 )
        {
            continue;
        }
        
        foreach ( enemy in skill_data.contagiousenemies )
        {
            radius = bundle.var_e8abaee73d5a0b6e;
            enemies_in_range = getaiarrayinradius( enemy.origin, radius );
            
            foreach ( close_enemy in enemies_in_range )
            {
                if ( close_enemy == enemy )
                {
                    continue;
                }
                
                ai_tier = close_enemy ai_utility::get_power_tier();
                
                switch ( ai_tier )
                {
                    case 1:
                        if ( !utility::percent_chance( bundle.var_9c711684f83a727 ) )
                        {
                            continue;
                        }
                        
                        break;
                    case 2:
                        if ( !utility::percent_chance( bundle.var_950294db34ac2ad7 ) )
                        {
                            continue;
                        }
                        
                        break;
                    default:
                        continue;
                }
                
                close_enemy thread function_fa254d81097de275( self, 0, skill_data, bundle );
            }
        }
    }
}

// Namespace skill_cryo_cloud
// Params 4, eflags: 0x4
// Checksum 0x51b58f18, Offset: 0xd0a
// Size: 0x77
function private function_fa254d81097de275( attacker, is_contagious_enemy, skill_data, bundle )
{
    if ( cannot_freeze() )
    {
        return;
    }
    
    freeze( attacker, bundle );
    attacker play_sound( bundle.var_daf63dbe059e435b, 1 );
    
    if ( is_contagious_enemy )
    {
        skill_data.contagiousenemies = arraycombineunique( skill_data.contagiousenemies, [ self ] );
    }
}

// Namespace skill_cryo_cloud
// Params 0, eflags: 0x4
// Checksum 0xa96dc570, Offset: 0xd89
// Size: 0x3d
function private cannot_freeze()
{
    if ( self.type == "human" )
    {
        return self.var_7a6c678617d8831f;
    }
    
    return !effect_slow::function_64adf2cc9d3408ad() || status_effects::function_fa35fc2723e956eb( "slow", "cryo_cloud_slow" );
}

// Namespace skill_cryo_cloud
// Params 2, eflags: 0x4
// Checksum 0x1d76b319, Offset: 0xdce
// Size: 0xc9
function private freeze( attacker, bundle )
{
    slow_percent = bundle.var_ce44be0e930d1eae;
    slow_duration = bundle.var_4ebcaa2c7aab61f1;
    start_slow_fx();
    
    if ( self.type == "human" )
    {
        self.var_7a6c678617d8831f = 1;
        stun_data = { #aistunduration:slow_duration, #source:#"cryo_cloud" };
        attacker ob_stun::function_c4c4f539eb76482f( stun_data, self );
        thread function_13b647bdc22a36ee( slow_duration );
    }
    else
    {
        effect_slow::slow( "cryo_cloud_slow", slow_percent, slow_duration, attacker, &end_slow_fx, 0, "cold" );
    }
    
    thread function_9057e46af5e56cb2( attacker, bundle );
}

// Namespace skill_cryo_cloud
// Params 2, eflags: 0x4
// Checksum 0x916d8c3d, Offset: 0xe9f
// Size: 0x141
function private function_9057e46af5e56cb2( attacker, bundle )
{
    level endon( #"game_ended" );
    
    if ( !bundle.var_88f889d95cf8077b )
    {
        return;
    }
    
    if ( self.type == "zombie" )
    {
        damage = bundle.var_b10a2b8c8c91e244;
    }
    else if ( self.type == "human" )
    {
        damage = bundle.var_738df51bddad5bc0;
    }
    
    assert( damage, "<dev string:x447>" );
    
    if ( !damage )
    {
        return;
    }
    
    frequency = bundle.var_b4d39197799b5010;
    start_time = gettime();
    last_time = start_time;
    duration = bundle.var_ca7ed5586f7bc085;
    weapon = bundle.var_dbac0fe69791d34b;
    
    while ( last_time - start_time < duration )
    {
        if ( !isalive( self ) || !status_effects::function_fa35fc2723e956eb( "slow", "cryo_cloud_slow" ) )
        {
            return;
        }
        
        self dodamage( damage, self.origin, attacker, attacker, "MOD_ELEMENTAL_COLD", weapon, "torso_upper", undefined );
        last_time = gettime();
        wait frequency;
    }
}

// Namespace skill_cryo_cloud
// Params 1, eflags: 0x4
// Checksum 0xd26a9ac2, Offset: 0xfe8
// Size: 0x47
function private function_13b647bdc22a36ee( duration )
{
    level endon( #"game_ended" );
    notify_msg = utility::waittill_any_in_array_or_timeout( [ "death" ], duration );
    self.var_7a6c678617d8831f = undefined;
    end_slow_fx();
}

// Namespace skill_cryo_cloud
// Params 0, eflags: 0x4
// Checksum 0x9b3bb4a0, Offset: 0x1037
// Size: 0x29
function private start_slow_fx()
{
    if ( self isscriptable() && self getscriptablehaspart( "cryofreeze" ) )
    {
        utility::function_7c10ea82c1e305b8( "cryofreeze", "cryofreeze_on" );
    }
}

// Namespace skill_cryo_cloud
// Params 2, eflags: 0x44 variadic
// Checksum 0xdb93ee0a, Offset: 0x1068
// Size: 0x3c
function private end_slow_fx( ... )
{
    if ( self isscriptable() && self getscriptablehaspart( "cryofreeze" ) )
    {
        utility::function_7c10ea82c1e305b8( "cryofreeze", "cryofreeze_shatter" );
    }
}

// Namespace skill_cryo_cloud
// Params 2, eflags: 0x4
// Checksum 0x6713de94, Offset: 0x10ac
// Size: 0x35
function private play_sound( sfx, onlyplayer )
{
    if ( !sfx )
    {
        return;
    }
    
    if ( onlyplayer )
    {
        self playsoundtoplayer( sfx, self );
        return;
    }
    
    self playsound( sfx );
}

// Namespace skill_cryo_cloud
// Params 2, eflags: 0x4
// Checksum 0xcb412b0b, Offset: 0x10e9
// Size: 0x34
function private play_sound_loop( sfx, play )
{
    if ( !sfx )
    {
        return;
    }
    
    if ( play )
    {
        self playloopsound( sfx );
        return;
    }
    
    self stoploopsound( sfx );
}

/#

    // Namespace skill_cryo_cloud
    // Params 2, eflags: 0xc
    // Checksum 0xa59f7d1b, Offset: 0x1125
    // Size: 0x85, Type: dev
    function private function_14624944449f6a16( skill_data, bundle )
    {
        self notify( #"hash_bfaad46d6bcea358" );
        self endon( #"hash_bfaad46d6bcea358" );
        level endon( #"game_ended" );
        
        while ( true )
        {
            if ( !skill_data )
            {
                return;
            }
            
            if ( getdvarint( @"scr_cryo_cloud_force_spawn", 0 ) == 0 )
            {
                wait 0.1;
                continue;
            }
            
            thread cryofreeze_ice_cloud( self, gettime(), skill_data, bundle );
            setdvar( @"scr_cryo_cloud_force_spawn", 0 );
        }
    }

#/
