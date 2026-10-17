#using script_380194b81c38cd1a;
#using scripts\common\callbacks;
#using scripts\common\utility;

#namespace zombie_diana_audio;

// Namespace zombie_diana_audio
// Params 0
// Checksum 0x76fc0152, Offset: 0x19e
// Size: 0xa0
function function_d18a8e4e982c57a4()
{
    if ( utility::flag( "diana_audio" ) )
    {
        return;
    }
    
    utility::flag_set( "diana_audio" );
    zombie_vox::register_vox_state( "ambient", "ambient", "vox_ai_diana_ambient", 1, 3500 );
    zombie_vox::register_vox_state( "arrival", "arrival", "vox_ai_diana_arrival", 3 );
    zombie_vox::register_vox_state( "depart", "depart", "vox_ai_diana_depart", 3 );
    zombie_vox::register_vox_state( "pain", "pain", "vox_ai_diana_pain", 3 );
    zombie_vox::register_vox_state( "projectile_attack", "projectile_attack", "vox_ai_diana_roar", 3 );
    level thread manage_ambient_cap();
}

// Namespace zombie_diana_audio
// Params 0
// Checksum 0x232b678, Offset: 0x246
// Size: 0x26
function init_zombie_diana_audio()
{
    thread play_zombie_ambient_repeating();
    zombie_vox::register_play_vox_fn( &function_8dbbaafd4479600f );
    callback::add( "killed_body_cloned", &play_death_vo );
}

// Namespace zombie_diana_audio
// Params 6, eflags: 0x4
// Checksum 0x75757bd, Offset: 0x274
// Size: 0x47
function private function_8dbbaafd4479600f( event, zombie, scriptable_state, alias, priority, vox_length )
{
    zombie_vox::play_vox( zombie, scriptable_state, alias, priority, vox_length );
}

// Namespace zombie_diana_audio
// Params 1, eflags: 0x4
// Checksum 0xb577ff1b, Offset: 0x2c3
// Size: 0x62
function private play_death_vo( params )
{
    assert( isdefined( params.body ) );
    
    if ( isdefined( self ) && self isscriptable() )
    {
        self setscriptablepartstate( "sound_vo", "off" );
    }
    
    level thread function_8dbbaafd4479600f( "death", params.body, "death", "vox_ai_diana_death", 4 );
}

// Namespace zombie_diana_audio
// Params 0
// Checksum 0x3e8a15b7, Offset: 0x32d
// Size: 0xfe
function play_zombie_ambient_repeating()
{
    ambient_cap = 3;
    self notify( #"hash_b4b9e5da26c7a7ca" );
    self endon( #"hash_b4b9e5da26c7a7ca" );
    self endon( #"hash_4ad5af914cce06a3" );
    self endon( #"death" );
    utility::flag_wait( "scriptables_ready" );
    waitframe();
    ambient_notify = undefined;
    
    while ( true )
    {
        params = get_ambient_params();
        ambient_notify = params.var_a2ca231ce4d6b000;
        n_waittime = params.var_d92936facdeb4848;
        
        if ( utility::percent_chance( params.var_dc8cb35f39318c8e ) )
        {
            ambient_notify = "ambient";
        }
        else
        {
            ambient_notify = undefined;
        }
        
        if ( isdefined( level.zombie_ambient_count ) )
        {
            level.zombie_ambient_count++;
            
            if ( level.zombie_ambient_count < ambient_cap )
            {
                played_vox = 1;
                zombie_vox::function_5ac4bed4a907abf5( ambient_notify );
                waitframe();
                utility::ent_flag_waitopen_any( "playing_vo" );
            }
        }
        
        wait n_waittime;
    }
}

// Namespace zombie_diana_audio
// Params 0, eflags: 0x4
// Checksum 0x3cf6c6f3, Offset: 0x433
// Size: 0x41
function private get_ambient_params()
{
    params = spawnstruct();
    params.var_a2ca231ce4d6b000 = "ambient";
    params.var_dc8cb35f39318c8e = 80;
    params.var_d92936facdeb4848 = 5;
    return params;
}

// Namespace zombie_diana_audio
// Params 0, eflags: 0x4
// Checksum 0x36832a74, Offset: 0x47d
// Size: 0x30
function private manage_ambient_cap()
{
    level endon( #"game_ended" );
    level.zombie_ambient_count = 0;
    
    while ( true )
    {
        level.zombie_ambient_count = 0;
        wait 0.1;
    }
}

// Namespace zombie_diana_audio
// Params 0, eflags: 0x4
// Checksum 0x45c6d2dc, Offset: 0x4b5
// Size: 0xe
function private function_db115bc2080982ff()
{
    self notify( #"hash_4ad5af914cce06a3" );
}

// Namespace zombie_diana_audio
// Params 0, eflags: 0x4
// Checksum 0x9ee7799b, Offset: 0x4cb
// Size: 0x9
function private function_10d5fe00818f9b80()
{
    thread play_zombie_ambient_repeating();
}

