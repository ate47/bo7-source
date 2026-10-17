#using scripts\common\utility;

#namespace br_car_alarm;

// Namespace br_car_alarm
// Params 0
// Checksum 0xd8a4f82d, Offset: 0xb2
// Size: 0x1c
function init()
{
    if ( !getdvarint( @"hash_8bfdc77e20414f2a", 0 ) )
    {
        return;
    }
    
    thread initalarms();
}

// Namespace br_car_alarm
// Params 0
// Checksum 0xf833a86b, Offset: 0xd6
// Size: 0xba
function initalarms()
{
    utility::flag_wait( "scriptables_ready" );
    caralarms = getentitylessscriptablearray( "scriptablecaralarm", #script_noteworthy );
    
    if ( caralarms.size <= 0 )
    {
        return;
    }
    
    level waittill( #"prematch_fade_done" );
    
    foreach ( alarm in caralarms )
    {
        alarm setscriptablepartstate( "base", "alive" );
    }
}

