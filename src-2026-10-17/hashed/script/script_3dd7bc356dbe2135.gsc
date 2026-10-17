#using script_1d517e4b72132535;
#using script_260830c4068c44eb;
#using script_4cd4ef577b89a116;
#using script_cb233a7d6343014;

#namespace init;

// Namespace init
// Params 0
// Checksum 0x7197b334, Offset: 0x76
// Size: 0x9
function main()
{
    stealth_manager::main();
}

// Namespace init
// Params 3
// Checksum 0x98d9d58d, Offset: 0x87
// Size: 0x103
function set_stealth_mode( enabled, musichidden, musicspotted )
{
    if ( enabled )
    {
        if ( isdefined( musichidden ) && isdefined( musicspotted ) )
        {
            level thread utility::stealth_music( musichidden, musicspotted );
        }
        
        level thread threat_sight::threat_sight_set_enabled( 1 );
        
        foreach ( player in level.players )
        {
            player thread player::main();
        }
    }
    else
    {
        level thread utility::stealth_music_stop();
        level thread threat_sight::threat_sight_set_enabled( 0 );
    }
    
    if ( isdefined( level.stealth.fnsetstealthmode ) )
    {
        level thread [[ level.stealth.fnsetstealthmode ]]( enabled, musichidden, musicspotted );
    }
}

