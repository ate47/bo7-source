#using script_2aa77b5f4dfc2051;
#using script_4d5934d09ed188d8;
#using script_5925e714a9b193a8;
#using script_b548cb1b912a827;

#namespace br_publicevent_flybuy;

// Namespace br_publicevent_flybuy
// Params 0, eflags: 0x1
// Checksum 0x724cad44, Offset: 0xf5
// Size: 0x17
function autoexec main()
{
    br_publicevents::function_54d95495df246a2b( %"flybuy", &init );
}

// Namespace br_publicevent_flybuy
// Params 1
// Checksum 0x40abb8a5, Offset: 0x114
// Size: 0x3f
function init( eventinfo )
{
    eventinfo.activatefunc = &activatefunc;
    eventinfo.waitfunc = &waitfunc;
    eventinfo.postinitfunc = &postinitfunc;
}

// Namespace br_publicevent_flybuy
// Params 0
// Checksum 0x60a5702c, Offset: 0x15b
// Size: 0x28
function postinitfunc()
{
    game[ "dialog" ][ "flybuy_intro" ] = "flyb_wzan_pest";
    game[ "dialog" ][ "flybuy_desc" ] = "pblc_wzan_bsnv";
}

// Namespace br_publicevent_flybuy
// Params 0
// Checksum 0x7768261f, Offset: 0x18b
// Size: 0x1a
function waitfunc()
{
    level endon( #"game_ended" );
    level endon( #"cancel_public_event" );
}

// Namespace br_publicevent_flybuy
// Params 0
// Checksum 0x8901141f, Offset: 0x1ad
// Size: 0x4d
function activatefunc()
{
    level endon( #"game_ended" );
    br_publicevents::showsplashtoall( "br_pe_flybuy_start", "splash_list_br_pe_flybuy" );
    br_public::brleaderdialog( "flybuy_intro", 1, undefined, undefined, 1 );
    function_b617bf4ccefcc34f();
    br_public::brleaderdialog( "flybuy_desc", 1, undefined, undefined, 2.5 );
}

// Namespace br_publicevent_flybuy
// Params 0
// Checksum 0x92826ce9, Offset: 0x202
// Size: 0x120
function function_b617bf4ccefcc34f()
{
    level endon( #"game_ended" );
    
    if ( level.circleclosing )
    {
        circleindex = level.br_circle.circleindex + 1;
    }
    else
    {
        circleindex = level.br_circle.circleindex;
    }
    
    circlecenter = level.br_level.br_circlecenters[ circleindex ];
    radius = level.br_level.br_circleradii[ circleindex ];
    count = getdvarint( @"scr_spawn_flybuy_buystations_count", 6 );
    step = 360 / count;
    yaw = 0;
    
    for ( i = 0; i < count ; i++ )
    {
        randompoint = br_circle::getrandompointinboundscircle( circlecenter, radius, 0.25, 0.75, 1, 1, 1, undefined, yaw, yaw + step );
        yaw += step;
        br_deployable_kiosk::deployablekioskspawn( undefined, randompoint, 1 );
    }
}

