#using script_4d5934d09ed188d8;
#using script_794f12bad37aa7e7;
#using scripts\common\utility;

#namespace br_publicevent_deerhunt;

// Namespace br_publicevent_deerhunt
// Params 0, eflags: 0x1
// Checksum 0xfedd78a4, Offset: 0xf1
// Size: 0x17
function autoexec main()
{
    br_publicevents::function_54d95495df246a2b( %"deerhunt", &init );
}

// Namespace br_publicevent_deerhunt
// Params 1
// Checksum 0x7946498a, Offset: 0x110
// Size: 0x76
function init( event_info )
{
    if ( !getdvarint( @"hash_c533a4ead2de511f", 0 ) || !getdvarint( @"hash_85b3a0aeeded84f3", 0 ) )
    {
        return;
    }
    
    event_info.waitfunc = &event_wait;
    event_info.activatefunc = &event_activate;
    event_info.postinitfunc = &event_post_init;
    event_info.deactivatefunc = &event_deactivate;
}

// Namespace br_publicevent_deerhunt
// Params 0
// Checksum 0x1ca8702, Offset: 0x18e
// Size: 0xac
function event_post_init()
{
    foreach ( vo in arraycombine( [ "puea", "pue2" ], [ "pex1", "pex2" ] ) )
    {
        game[ "dialog" ][ "deerhunt_" + vo ] = vo + "_zosa_coma";
    }
}

// Namespace br_publicevent_deerhunt
// Params 0
// Checksum 0x71bf8ca0, Offset: 0x242
// Size: 0x2
function event_wait()
{
    
}

// Namespace br_publicevent_deerhunt
// Params 0
// Checksum 0x7c7b090, Offset: 0x24c
// Size: 0xcc
function event_activate()
{
    br_publicevents::showsplashtoall( "br_pe_deerhunt_start", "splash_list_br_pe_deerhunt" );
    var_dae02c70c384a593 = "deerhunt_" + utility::array_random( [ "puea", "pue2" ] );
    br_codmas_vo::function_408703e87d31b651( var_dae02c70c384a593, undefined, undefined, undefined, 1.5 );
    br_codmas_vo::function_408703e87d31b651( "deerhunt_" + utility::array_random( [ "pex1", "pex2" ] ), undefined, undefined, undefined, 2 + br_codmas_vo::function_e6129eefe5880321( var_dae02c70c384a593 ) );
    
    if ( utility::issharedfuncdefined( #"hash_b52c0799e455d12e", #"hash_3e545630041357b6" ) )
    {
        self [[ utility::getsharedfunc( #"hash_b52c0799e455d12e", #"hash_3e545630041357b6" ) ]]( getdvarint( @"hash_be080ad3f3856c5b", 3 ) );
    }
}

// Namespace br_publicevent_deerhunt
// Params 0
// Checksum 0x9acd8ab6, Offset: 0x320
// Size: 0xe
function event_deactivate()
{
    level notify( #"event_deactivated" );
}

