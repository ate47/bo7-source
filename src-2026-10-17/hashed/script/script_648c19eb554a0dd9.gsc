#using scripts\common\utility;
#using scripts\mp\flags;

#namespace br_movement_detector;

// Namespace br_movement_detector
// Params 0
// Checksum 0x1cfcb9b3, Offset: 0xd7
// Size: 0x1d
function init()
{
    if ( !getdvarint( @"hash_e98eca6eda18788a", 1 ) )
    {
        return;
    }
    
    thread movementinit();
}

// Namespace br_movement_detector
// Params 0
// Checksum 0x132b8c6b, Offset: 0xfc
// Size: 0xde
function movementinit()
{
    level endon( #"game_ended" );
    flags::function_2f3408423ccc9b2e( "prematch_fade_done" );
    wait 1;
    triggers = getnoentvolumearray( "movementalarm", #script_noteworthy );
    
    foreach ( trigger in triggers )
    {
        trigger.detectors = getentitylessscriptablearray( trigger.target, #targetname );
        
        if ( isdefined( trigger.detectors ) )
        {
            trigger thread function_aec53d4c3cc29518();
        }
    }
}

// Namespace br_movement_detector
// Params 0
// Checksum 0x53d8ca46, Offset: 0x1e2
// Size: 0x4c
function function_aec53d4c3cc29518()
{
    level endon( #"game_ended" );
    
    while ( true )
    {
        self waittill( #"trigger", player );
        
        if ( !isdefined( player.perks[ "specialty_coldblooded" ] ) )
        {
            startalarm();
        }
    }
}

// Namespace br_movement_detector
// Params 0
// Checksum 0x69508c3e, Offset: 0x236
// Size: 0x151
function startalarm()
{
    level endon( #"game_ended" );
    
    if ( !isdefined( self.detectors ) )
    {
        return;
    }
    
    alarmduration = getdvarint( @"hash_5c27f1538b104979", 20 );
    
    foreach ( element in self.detectors )
    {
        element setscriptablepartstate( "onoff", "on", 1 );
    }
    
    wait alarmduration;
    
    while ( utility::waittill_notify_or_timeout_return( "trigger", 1 ) == "trigger" )
    {
        wait alarmduration;
    }
    
    foreach ( element in self.detectors )
    {
        element setscriptablepartstate( "onoff", "off", 1 );
    }
}

