#using script_2aa77b5f4dfc2051;
#using script_4d5934d09ed188d8;
#using script_5b1a7d2a95d1348b;

#namespace br_publicevent_juggernaut;

// Namespace br_publicevent_juggernaut
// Params 0, eflags: 0x1
// Checksum 0xd134f28b, Offset: 0xdf
// Size: 0x17
function autoexec main()
{
    br_publicevents::function_54d95495df246a2b( %"juggernaut", &init );
}

// Namespace br_publicevent_juggernaut
// Params 1
// Checksum 0x6df52c9, Offset: 0xfe
// Size: 0x3f
function init( eventinfo )
{
    eventinfo.activatefunc = &activatefunc;
    eventinfo.waitfunc = &waitfunc;
    eventinfo.postinitfunc = &postinitfunc;
}

// Namespace br_publicevent_juggernaut
// Params 0
// Checksum 0x127ea969, Offset: 0x145
// Size: 0x42
function postinitfunc()
{
    game[ "dialog" ][ "public_events_juggernaut_start" ] = "public_events_juggernaut_start";
    dropondeath = getdvarint( @"hash_584aebd3a63695f9", 0 );
    br_jugg_common::init_br_jugg_setting( "drop_on_death", dropondeath, "public_event" );
}

// Namespace br_publicevent_juggernaut
// Params 0
// Checksum 0xe416a195, Offset: 0x18f
// Size: 0x2f
function waitfunc()
{
    level endon( #"game_ended" );
    level endon( #"cancel_public_event" );
    eventstarttime = calculateeventstarttime();
    wait eventstarttime;
}

// Namespace br_publicevent_juggernaut
// Params 0
// Checksum 0xf6c72d2d, Offset: 0x1c6
// Size: 0x5f
function activatefunc()
{
    var_419250dda2338c55 = br_jugg_common::getnumdrops();
    level.juggdroplocations = arrayrandomize( level.juggdroplocations );
    droplocations = br_jugg_common::showdroplocations( var_419250dda2338c55, 0 );
    br_public::brleaderdialog( "public_events_juggernaut_start" );
    level br_jugg_common::startdeliveries( droplocations, "public_event" );
    waitforallcrates();
}

// Namespace br_publicevent_juggernaut
// Params 0
// Checksum 0xbd3af24b, Offset: 0x22d
// Size: 0xac
function waitforallcrates()
{
    while ( true )
    {
        wait 1;
        cratefound = 0;
        
        foreach ( crate in level.c130successfulairdrops )
        {
            if ( crate.cratetype == "battle_royale_juggernaut" )
            {
                cratefound = 1;
                break;
            }
        }
        
        if ( !cratefound )
        {
            break;
        }
    }
}

// Namespace br_publicevent_juggernaut
// Params 0
// Checksum 0xda0f9f45, Offset: 0x2e1
// Size: 0x51
function calculateeventstarttime()
{
    minstarttime = getdvarfloat( @"hash_68fdb38445cbed05", 795 );
    maxstarttime = getdvarfloat( @"hash_6920bd8445f24abb", 1110 );
    
    if ( maxstarttime > minstarttime )
    {
        return randomfloatrange( minstarttime, maxstarttime );
    }
    
    return minstarttime;
}

