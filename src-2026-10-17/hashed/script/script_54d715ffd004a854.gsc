#using script_7c5632db7555b4f5;
#using scripts\common\callbacks;
#using scripts\common\utility;
#using scripts\mp\zm\systems\zm_round_logic;
#using scripts\mp\zm\systems\zone_manager;

#namespace zm_music;

// Namespace zm_music
// Params 0
// Checksum 0xa4e901fa, Offset: 0x120
// Size: 0xa6
function init_zm_music()
{
    level musicbank_utility::init_musicbanks();
    level callback::add( #"player_connect", &on_player_connect );
    level callback::add( #"player_spawned", &on_player_spawn );
    level callback::add( #"player_death", &on_player_death );
    level callback::add( "on_round_ai_spawn_started", &round_start_music );
    level callback::add( "on_round_end", &round_end_music );
    level callback::add( "special_round_start", &special_round_start_music );
    level callback::add( "on_exfil_start", &exfil_start_music );
    level callback::add( "on_player_hotjoin_spectate", &on_player_hotjoin_spectate );
}

// Namespace zm_music
// Params 1
// Checksum 0x4783c7cd, Offset: 0x1ce
// Size: 0x7a
function on_player_connect( sparams )
{
    self endon( #"death_or_disconnect" );
    var_1ee4c3bce9c6db21 = level.gamemodebundle.var_1ee4c3bce9c6db21;
    
    if ( level.gametypebundle.var_319a3b8afacdacd5 )
    {
        var_1ee4c3bce9c6db21 = level.gametypebundle.var_1ee4c3bce9c6db21;
    }
    
    if ( !var_1ee4c3bce9c6db21 )
    {
        self setplayermusicstate( "" );
    }
    
    musicbank_utility::function_c5abc550e9f75f30();
}

// Namespace zm_music
// Params 1
// Checksum 0x3ac34337, Offset: 0x250
// Size: 0x4a
function on_player_hotjoin_spectate( params )
{
    spectated_player = self getspectatingplayer();
    
    if ( isdefined( spectated_player ) )
    {
        var_4c4ca48f357d8cf = musicbank_utility::function_9f1344352533f3a7( spectated_player );
        
        if ( isdefined( var_4c4ca48f357d8cf ) )
        {
            musicbank_utility::function_5aca66c390aa347d( [ self ], var_4c4ca48f357d8cf );
        }
    }
}

// Namespace zm_music
// Params 1
// Checksum 0xcb450516, Offset: 0x2a2
// Size: 0xc
function on_player_spawn( sparams )
{
    
}

// Namespace zm_music
// Params 1
// Checksum 0xbc0c1fdf, Offset: 0x2b6
// Size: 0xc
function on_player_death( sparams )
{
    
}

// Namespace zm_music
// Params 1
// Checksum 0x89325f3f, Offset: 0x2ca
// Size: 0xa5
function round_start_music( params )
{
    if ( utility::flag( "exfil_start" ) )
    {
        return;
    }
    
    roundnumber = zm_round_logic::get_rb_round_number();
    
    if ( !function_687c48d83d1ae5a4() )
    {
        if ( roundnumber <= 1 )
        {
            if ( !level.var_c5b8515caacb624b )
            {
                musicbank_utility::function_5aca66c390aa347d( level.players, #"round_start_first" );
            }
            
            return;
        }
        
        if ( roundnumber > 10 )
        {
            musicbank_utility::function_5aca66c390aa347d( level.players, #"round_start_short" );
            return;
        }
        
        musicbank_utility::function_5aca66c390aa347d( level.players, #"round_start" );
    }
}

// Namespace zm_music
// Params 1
// Checksum 0xdb861548, Offset: 0x377
// Size: 0x75
function special_round_start_music( params )
{
    if ( utility::flag( "exfil_start" ) )
    {
        return;
    }
    
    if ( params.isspecialround )
    {
        musicbank_utility::function_5aca66c390aa347d( level.players, #"specialround_loop" );
        function_398bc9ee922d91fd( "sndSpecialRound", 1 );
        level.var_6c65aec37d0dcb9d = 1;
        return;
    }
    
    musicbank_utility::function_5aca66c390aa347d( level.players, #"round_start" );
}

// Namespace zm_music
// Params 1
// Checksum 0x7dc1548, Offset: 0x3f4
// Size: 0xd6
function round_end_music( params )
{
    if ( utility::flag( "exfil_start" ) )
    {
        return;
    }
    
    roundnumber = zm_round_logic::get_rb_round_number();
    
    if ( function_687c48d83d1ae5a4() )
    {
        musicbank_utility::function_4f253fd35ec68cbc( level.players, #"specialround_loop" );
        function_398bc9ee922d91fd( "sndSpecialRound", 0 );
        level.var_6c65aec37d0dcb9d = 0;
        return;
    }
    
    if ( level.zm_mode_modifiers.var_12d1573e5e613c31 )
    {
        musicbank_utility::function_5aca66c390aa347d( level.players, #"hash_638ae84b7500610c" );
        return;
    }
    
    if ( roundnumber > 10 )
    {
        musicbank_utility::function_5aca66c390aa347d( level.players, #"round_end_short" );
        return;
    }
    
    musicbank_utility::function_5aca66c390aa347d( level.players, #"round_end" );
}

// Namespace zm_music
// Params 0
// Checksum 0x8f3fd5f5, Offset: 0x4d2
// Size: 0x71
function function_687c48d83d1ae5a4()
{
    var_5fbc1a069a428bad = 0;
    roundnumber = zm_round_logic::get_rb_round_number();
    
    if ( level.var_a009ab14ee0d3223.isspecialround )
    {
        specialroundstruct = level.var_a009ab14ee0d3223.specialroundspawns[ roundnumber ];
        
        if ( isdefined( specialroundstruct ) )
        {
            var_5fbc1a069a428bad = 1;
        }
    }
    
    if ( level.var_6c65aec37d0dcb9d )
    {
        var_5fbc1a069a428bad = 1;
    }
    
    return var_5fbc1a069a428bad;
}

// Namespace zm_music
// Params 1
// Checksum 0x40fc64df, Offset: 0x54c
// Size: 0x25
function exfil_start_music( params )
{
    musicbank_utility::function_5aca66c390aa347d( level.players, #"exfil" );
}

// Namespace zm_music
// Params 3
// Checksum 0x6366dcf9, Offset: 0x579
// Size: 0x170
function function_c2dc5fbb02fcae3a( var_729ff37e18b65c50, var_3795322f46f40941, music_event )
{
    if ( !isdefined( var_729ff37e18b65c50 ) || !isdefined( var_3795322f46f40941 ) || !isdefined( music_event ) )
    {
        return;
    }
    
    if ( !isdefined( level.musiczones ) )
    {
        level.musiczones = [];
    }
    
    if ( isdefined( level.musiczones[ var_729ff37e18b65c50 ] ) )
    {
        return;
    }
    
    level.musiczones[ var_729ff37e18b65c50 ] = spawnstruct();
    level.musiczones[ var_729ff37e18b65c50 ].var_3795322f46f40941 = var_3795322f46f40941;
    level.musiczones[ var_729ff37e18b65c50 ].music_event = music_event;
    
    foreach ( player in level.players )
    {
        player_zone_struct = player zone_manager::get_current_zone();
        
        if ( player_zone_struct.zone_name && arraycontains( var_3795322f46f40941, player_zone_struct.zone_name ) )
        {
            level musicbank_utility::function_5aca66c390aa347d( player, music_event );
        }
    }
    
    if ( level.musiczones.size <= 1 )
    {
        level callback::add( "zone_changed", &function_8a55ac9e27337f7f );
    }
}

// Namespace zm_music
// Params 1
// Checksum 0xa8323fd5, Offset: 0x6f1
// Size: 0x14e
function function_e9fd14ede793ef0d( var_729ff37e18b65c50 )
{
    if ( !isdefined( level.musiczones ) )
    {
        level.musiczones = [];
    }
    
    if ( isdefined( level.musiczones[ var_729ff37e18b65c50 ] ) )
    {
        foreach ( player in level.players )
        {
            player_zone_struct = player zone_manager::get_current_zone();
            
            if ( player_zone_struct.zone_name && arraycontains( level.musiczones[ var_729ff37e18b65c50 ].var_3795322f46f40941, player_zone_struct.zone_name ) )
            {
                level musicbank_utility::function_4f253fd35ec68cbc( player, level.musiczones[ var_729ff37e18b65c50 ].music_event );
            }
        }
        
        level.musiczones = function_a5c1175d3ea3c25a( level.musiczones, level.musiczones[ var_729ff37e18b65c50 ] );
        
        if ( level.musiczones.size <= 0 )
        {
            level callback::remove( "zone_changed", &function_8a55ac9e27337f7f );
        }
    }
}

// Namespace zm_music
// Params 1
// Checksum 0x9dbd636d, Offset: 0x847
// Size: 0x17c
function function_8a55ac9e27337f7f( params )
{
    var_d56981529221d44 = params.zone_struct.script_zone_name;
    var_e74a9e7fb261982 = params.previous_zone_struct.script_zone_name;
    music_played = 0;
    
    foreach ( musiczone in level.musiczones )
    {
        if ( arraycontains( musiczone.var_3795322f46f40941, var_d56981529221d44 ) )
        {
            level musicbank_utility::function_5aca66c390aa347d( self, musiczone.music_event );
            music_played = 1;
            break;
        }
        
        if ( music_played )
        {
            break;
        }
    }
    
    if ( !music_played )
    {
        foreach ( musiczone in level.musiczones )
        {
            level musicbank_utility::function_4f253fd35ec68cbc( self, musiczone.music_event );
        }
    }
}

// Namespace zm_music
// Params 2
// Checksum 0x930d9a3e, Offset: 0x9cb
// Size: 0xc5
function function_446e6e39d7feeb7c( zone_array, musicbank_event )
{
    foreach ( player in level.players )
    {
        player_zone_struct = player zone_manager::get_current_zone();
        
        if ( player_zone_struct.zone_name && arraycontains( zone_array, player_zone_struct.zone_name ) )
        {
            level musicbank_utility::function_5aca66c390aa347d( player, musicbank_event );
        }
    }
}

// Namespace zm_music
// Params 3
// Checksum 0x712557f6, Offset: 0xa98
// Size: 0xc0
function function_e2da5400b2dd2d1c( var_729ff37e18b65c50, var_3795322f46f40941, music_event )
{
    if ( !isdefined( level.var_1f5d69097b6211f6 ) )
    {
        level.var_1f5d69097b6211f6 = [];
    }
    
    if ( isdefined( level.var_1f5d69097b6211f6[ var_729ff37e18b65c50 ] ) )
    {
        return;
    }
    
    level.var_1f5d69097b6211f6[ var_729ff37e18b65c50 ] = spawnstruct();
    level.var_1f5d69097b6211f6[ var_729ff37e18b65c50 ].var_3795322f46f40941 = var_3795322f46f40941;
    level.var_1f5d69097b6211f6[ var_729ff37e18b65c50 ].music_event = music_event;
    level.var_1f5d69097b6211f6[ var_729ff37e18b65c50 ].players_heard = [];
    
    if ( level.var_1f5d69097b6211f6.size <= 1 )
    {
        level callback::add( "zone_changed", &function_c45cba0e9c225e0d );
    }
}

// Namespace zm_music
// Params 1
// Checksum 0xf5df7a83, Offset: 0xb60
// Size: 0x163
function function_c45cba0e9c225e0d( params )
{
    var_d56981529221d44 = params.zone_struct.script_zone_name;
    var_e74a9e7fb261982 = params.previous_zone_struct.script_zone_name;
    
    foreach ( musiczone in level.var_1f5d69097b6211f6 )
    {
        if ( arraycontains( musiczone.var_3795322f46f40941, var_d56981529221d44 ) )
        {
            if ( !arraycontains( musiczone.players_heard, self ) )
            {
                level musicbank_utility::function_5aca66c390aa347d( self, musiczone.music_event );
                musiczone.players_heard[ musiczone.players_heard.size ] = self;
                
                if ( musiczone.players_heard.size == level.players.size )
                {
                    level.var_1f5d69097b6211f6 = function_a5c1175d3ea3c25a( level.var_1f5d69097b6211f6, musiczone );
                    
                    if ( level.var_1f5d69097b6211f6.size <= 0 )
                    {
                        level callback::remove( "zone_changed", &function_c45cba0e9c225e0d );
                    }
                }
            }
        }
    }
}

