#using script_cb233a7d6343014;
#using scripts\common\system;
#using scripts\common\utility;

#namespace threat_sight_audio;

// Namespace threat_sight_audio
// Params 0, eflags: 0x5
// Checksum 0x8afba982, Offset: 0xa7
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"threat_sight_audio", undefined, undefined, &post_main );
}

// Namespace threat_sight_audio
// Params 0, eflags: 0x4
// Checksum 0x2ff3aa89, Offset: 0xc8
// Size: 0x9
function private post_main()
{
    thread function_db6504fb6e043374();
}

// Namespace threat_sight_audio
// Params 0, eflags: 0x4
// Checksum 0x7b78a539, Offset: 0xd9
// Size: 0xd3
function private function_db6504fb6e043374()
{
    if ( !( isdefined( level.gamemodebundle ) && isdefined( level.gamemodebundle.stealthbundle ) ) )
    {
        return;
    }
    
    stealthbundle = getscriptbundle( level.gamemodebundle.stealthbundle );
    
    if ( !isdefined( stealthbundle ) )
    {
        return;
    }
    
    level.var_1a4b3b50ca681d7b = stealthbundle.var_c6d53ea21280fefe;
    level.var_568ec233752d286a = stealthbundle.spottedsfxname;
    utility::flag_wait( "stealth_enabled" );
    
    if ( isdefined( level.stealth ) )
    {
        level.stealth.fnthreatsightplayersightaudio = &threat_sight_player_sight_audio;
        level.stealth.fnthreatsightplayersightaudiocleanup = &threat_sight_player_sight_audio_cleanup;
        level utility::flag_set( "threat_sight_audio_enabled" );
    }
}

// Namespace threat_sight_audio
// Params 3, eflags: 0x4
// Checksum 0xbf5c057c, Offset: 0x1b4
// Size: 0x266
function private threat_sight_player_sight_audio( anycansee, maxthreat, willdebugprint )
{
    assert( isplayer( self ) );
    player = self;
    
    if ( !( isdefined( player.stealth ) && isdefined( level.var_1a4b3b50ca681d7b ) && isdefined( level.var_568ec233752d286a ) ) )
    {
        return;
    }
    
    if ( player stealth_manager::anyone_in_combat() )
    {
        if ( ( !isdefined( player.stealth.previousmaxthreat ) || player.stealth.previousmaxthreat < 1 ) && !isdefined( player.stealth.var_6ee2977c1102e273 ) )
        {
            player playsoundtoplayer( level.var_568ec233752d286a, player );
            player.stealth.var_6ee2977c1102e273 = 1;
        }
        
        maxthreat = 0;
    }
    else if ( ( !isdefined( player.stealth.previousmaxthreat ) || player.stealth.previousmaxthreat <= 0 ) && maxthreat > 0 && maxthreat < 1 )
    {
        if ( !isdefined( player.stealth.var_916ebf2fa37e8b46 ) )
        {
            player playsoundtoplayer( level.var_1a4b3b50ca681d7b, player );
            player.stealth.var_916ebf2fa37e8b46 = 1;
        }
    }
    else if ( player.stealth.previousmaxthreat > 0 && maxthreat <= 0 )
    {
        player.stealth.var_916ebf2fa37e8b46 = undefined;
        player.stealth.var_6ee2977c1102e273 = undefined;
    }
    else if ( ( !isdefined( player.stealth.previousmaxthreat ) || player.stealth.previousmaxthreat < 1 ) && maxthreat >= 1 )
    {
        if ( !isdefined( player.stealth.var_6ee2977c1102e273 ) )
        {
            player playsoundtoplayer( level.var_568ec233752d286a, player );
            player.stealth.var_6ee2977c1102e273 = 1;
        }
    }
    
    player.stealth.previousmaxthreat = maxthreat;
}

// Namespace threat_sight_audio
// Params 0, eflags: 0x4
// Checksum 0x4ba263e1, Offset: 0x422
// Size: 0x6a
function private threat_sight_player_sight_audio_cleanup()
{
    assert( isplayer( self ) );
    player = self;
    
    if ( isdefined( player.stealth ) )
    {
        player.stealth.var_916ebf2fa37e8b46 = undefined;
        player.stealth.var_6ee2977c1102e273 = undefined;
        player.stealth.previousmaxthreat = undefined;
    }
}

