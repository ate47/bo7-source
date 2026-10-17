#using script_2373da272a381e70;
#using script_5a1384dc05b4b87f;
#using scripts\asm\asm;
#using scripts\asm\gesture;

#namespace hunt_checkin;

// Namespace hunt_checkin
// Params 0
// Checksum 0x5ecc0a72, Offset: 0x110
// Size: 0x18
function main()
{
    utility::add_smartobject_type( "hunt_checkin", &getinfo, &canuse );
}

// Namespace hunt_checkin
// Params 1
// Checksum 0x597445b0, Offset: 0x130
// Size: 0xe, Type: bool
function canuse( object )
{
    return true;
}

// Namespace hunt_checkin
// Params 0
// Checksum 0x49136eee, Offset: 0x147
// Size: 0x5f
function getinfo()
{
    info = utility::createsmartobjectinfo();
    info.fnonuse = &onuse;
    info.var_8305aedf56bda069 = 1;
    info.radiussqrd = 3600;
    info.nextusetime = 0;
    info utility::addsmartobjectanim( "loop" );
    return info;
}

// Namespace hunt_checkin
// Params 1
// Checksum 0xb7854534, Offset: 0x1af
// Size: 0x16d
function onuse( object )
{
    pod = undefined;
    assert( isdefined( pod ) );
    job = pod group::function_3d7d78fa51b4c2e3( self );
    otherguy = job.guys[ 0 ];
    
    if ( self == otherguy )
    {
        otherguy = job.guys[ 1 ];
    }
    
    var_f1a81a1f1d44c63f = otherguy.var_30e8635fc82c36d7;
    
    if ( self == job.leader )
    {
        exit_wait = randomintrange( 1200, 3600 );
        self.var_1d328097c8f5909c = self.origin;
        self.stealth.script_skiplookaroundanim = 1;
        self.stealth.script_huntlookaroundduration = exit_wait;
        gesture::ai_request_gesture( "talk", undefined, 1000, "first_hunt_gesture" );
        self waittill( #"first_hunt_gesture" );
        
        if ( !isdefined( var_f1a81a1f1d44c63f ) )
        {
            gesture::ai_request_gesture( "talk", undefined, 1000, "hunt_gesture" );
        }
        else
        {
            self setlookat( var_f1a81a1f1d44c63f, 1 );
            gesture::ai_request_gesture( "military_point", var_f1a81a1f1d44c63f, 1000, "hunt_gesture" );
        }
        
        thread waitforgesture( "hunt_gesture" );
        return;
    }
    
    gesture::ai_request_gesture( "no", undefined, 1000, "hunt_gesture" );
    thread waitforgesture( "hunt_gesture" );
}

// Namespace hunt_checkin
// Params 1
// Checksum 0xe463bc7d, Offset: 0x324
// Size: 0x76
function waitforgesture( flag )
{
    self endon( #"death" );
    self endon( #"smartobject_logic_finished" );
    childthread waitforgesture_timeout( 10 );
    
    while ( true )
    {
        self waittill( flag, status );
        
        if ( status == "gesture_finish" || status == "gesture_cancel" )
        {
            break;
        }
    }
    
    asm::asm_fireevent( self.asmname, "smartobject_finished" );
}

// Namespace hunt_checkin
// Params 1
// Checksum 0x2e34cfd, Offset: 0x3a2
// Size: 0x24
function waitforgesture_timeout( t )
{
    wait t;
    asm::asm_fireevent( self.asmname, "smartobject_finished" );
}

