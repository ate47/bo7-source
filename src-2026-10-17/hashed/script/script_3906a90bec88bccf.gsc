#using script_4d5934d09ed188d8;

#namespace br_publicevent_bombardment;

// Namespace br_publicevent_bombardment
// Params 0, eflags: 0x1
// Checksum 0xb1845bd5, Offset: 0x76
// Size: 0x17
function autoexec main()
{
    br_publicevents::function_54d95495df246a2b( %"bombardment", &init );
}

// Namespace br_publicevent_bombardment
// Params 1
// Checksum 0x8e8ea20d, Offset: 0x95
// Size: 0x2e
function init( eventinfo )
{
    eventinfo.waitfunc = &waitfunc;
    eventinfo.activatefunc = &activatefunc;
}

// Namespace br_publicevent_bombardment
// Params 0
// Checksum 0x1e87f9df, Offset: 0xcb
// Size: 0x3, Type: bool
function validatefunc()
{
    return false;
}

// Namespace br_publicevent_bombardment
// Params 0
// Checksum 0xd2f3d749, Offset: 0xd7
// Size: 0xe
function waitfunc()
{
    level endon( #"cancel_public_event" );
}

// Namespace br_publicevent_bombardment
// Params 0
// Checksum 0x348cb351, Offset: 0xed
// Size: 0x2
function activatefunc()
{
    
}

