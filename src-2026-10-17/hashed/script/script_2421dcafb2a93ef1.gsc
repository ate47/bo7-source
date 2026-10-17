#using script_380194b81c38cd1a;
#using scripts\asm\asm_bb;
#using scripts\common\callbacks;
#using scripts\common\utility;
#using scripts\common\values;

#namespace zombie_amalgam_audio;

// Namespace zombie_amalgam_audio
// Params 0
// Checksum 0x827d6853, Offset: 0x267
// Size: 0x138
function init_zombie_amalgam_audio_global()
{
    if ( utility::flag( "amalgam_audio" ) )
    {
        return;
    }
    
    utility::flag_set( "amalgam_audio" );
    zombie_vox::register_vox_state( "inhale", "inhale", "vox_ai_amalgam_inhale", 1, 1100 );
    zombie_vox::register_vox_state( "exhale", "exhale", "vox_ai_amalgam_exhale", 1, 1100 );
    zombie_vox::register_vox_state( "ambience", "ambience", "vox_ai_amalgam_ambience", 1, 2700 );
    zombie_vox::register_vox_state( "attack", "attack", "vox_ai_amalgam_attack", 2, 1800 );
    zombie_vox::register_vox_state( "bite", "bite", "vox_ai_amalgam_bite", 2, 1800 );
    zombie_vox::register_vox_state( "grapple_tell", "grapple_tell", "vox_ai_amalgam_grapple_tell", 2, 1700 );
    zombie_vox::register_vox_state( "roar", "roar", "vox_ai_amalgam_roar", 3, 3000 );
    zombie_vox::register_vox_state( "pain", "pain", "vox_ai_amalgam_pain", 3, 2700 );
    zombie_vox::register_vox_state( "death", "death", "vox_ai_amalgam_death", 3, 4000 );
    level thread manage_ambient_cap();
    callback::get_template( self.animsetname ) callback::add( "killed_body_cloned", &play_death_vo );
}

// Namespace zombie_amalgam_audio
// Params 0
// Checksum 0x8a24c938, Offset: 0x3a7
// Size: 0x15
function init_zombie_amalgam_audio()
{
    thread play_zombie_ambient_repeating();
    zombie_vox::register_play_vox_fn( &function_8dbbaafd4479600f );
}

// Namespace zombie_amalgam_audio
// Params 6, eflags: 0x4
// Checksum 0x7407371a, Offset: 0x3c4
// Size: 0xc7
function private function_8dbbaafd4479600f( event, zombie, scriptable_state, alias, priority, vox_length )
{
    if ( !zombie val::get( "allow_vo" ) )
    {
        return;
    }
    
    switch ( event )
    {
        case #"hash_17f51e5d6e2d2cce":
        case #"hash_2d1406e602f0875d":
        case #"hash_4d6a319017fe1a3d":
        case #"hash_8c30dc2ed76e5d2f":
        case #"hash_c6e9d384b1d615f5":
            zombie zombie_vox::function_bb5be6a2c88bc5f4( utility::function_4b74c15943231980( 2.5 ), 1 );
            break;
        default:
            break;
    }
    
    zombie_vox::play_vox( zombie, scriptable_state, alias, priority, vox_length );
}

// Namespace zombie_amalgam_audio
// Params 1, eflags: 0x4
// Checksum 0x6fb0a9dd, Offset: 0x493
// Size: 0x95
function private play_death_vo( params )
{
    assert( isdefined( params.body ) );
    
    if ( isdefined( self ) )
    {
        if ( self isscriptable() )
        {
            utility::function_7c10ea82c1e305b8( "sound_vo", "off" );
        }
        
        if ( !val::get( "allow_vo" ) )
        {
            return;
        }
        
        str_channel = zombie_vox::function_60b4e7f5dcc09735();
        
        if ( function_9ab89894f4bcc56c( str_channel ) )
        {
            self stopsoundchannel( str_channel );
        }
    }
    
    level thread function_8dbbaafd4479600f( "death", params.body, "death", "vox_ai_zombie_death", 4 );
}

// Namespace zombie_amalgam_audio
// Params 0
// Checksum 0x7c5b51e1, Offset: 0x530
// Size: 0x13e
function play_zombie_ambient_repeating()
{
    ambient_cap = 3;
    self endon( #"death" );
    utility::flag_wait( "scriptables_ready" );
    waitframe();
    played_vox = 0;
    var_a50f94f03edff6b3 = 0;
    var_4c32391f3ad61ce9 = 1;
    
    while ( true )
    {
        if ( !val::get( "play_ambient_vo" ) )
        {
            wait 1;
            continue;
        }
        
        params = get_ambient_params();
        
        if ( !var_4c32391f3ad61ce9 )
        {
            if ( utility::percent_chance( params.var_dc8cb35f39318c8e ) || var_a50f94f03edff6b3 >= 15 )
            {
                var_a50f94f03edff6b3 = 0;
                ambient_notify = params.var_a2ca231ce4d6b000;
            }
            else
            {
                var_a50f94f03edff6b3++;
                ambient_notify = params.var_b58be3780347f93f ? "exhale" : "exhale";
            }
            
            var_4c32391f3ad61ce9 = 1;
        }
        else
        {
            ambient_notify = params.var_b58be3780347f93f ? "inhale" : "inhale";
            var_4c32391f3ad61ce9 = 0;
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
        
        waitframe();
    }
}

// Namespace zombie_amalgam_audio
// Params 0, eflags: 0x4
// Checksum 0x5756b212, Offset: 0x676
// Size: 0xa6
function private get_ambient_params()
{
    params = spawnstruct();
    params.var_a2ca231ce4d6b000 = "ambience";
    params.var_b58be3780347f93f = 0;
    params.var_dc8cb35f39318c8e = 20;
    
    if ( isdefined( self.enemy ) )
    {
        if ( asm_bb::bb_movetyperequested( "run" ) || asm_bb::bb_movetyperequested( "sprint" ) || asm_bb::bb_movetyperequested( "super_sprint" ) )
        {
            params.var_b58be3780347f93f = 1;
            params.var_dc8cb35f39318c8e = 35;
        }
        else
        {
            params.var_dc8cb35f39318c8e = 45;
        }
    }
    
    return params;
}

// Namespace zombie_amalgam_audio
// Params 0, eflags: 0x4
// Checksum 0x2165be1, Offset: 0x725
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

