#using scripts\common\callbacks;
#using scripts\common\ui;
#using scripts\common\utility;

#namespace zm_third_person;

// Namespace zm_third_person
// Params 0, eflags: 0x1
// Checksum 0x601a8cbf, Offset: 0x14a
// Size: 0x5e
function autoexec init()
{
    if ( getdvarint( @"zm_third_person", 1 ) == 0 )
    {
        return;
    }
    
    level ui::lui_registercallback( "toggle_camera_view", &function_d566a147fead1cc4 );
    callback::add( #"player_spawned", &function_8f0941e4910c2d09 );
    level.var_c57ff57d8b66d391 = 1;
    callback::add( #"player_connect", &on_connect );
}

// Namespace zm_third_person
// Params 1, eflags: 0x4
// Checksum 0x8e21565, Offset: 0x1b0
// Size: 0x13
function private on_connect( params )
{
    thread watch_third_person();
}

// Namespace zm_third_person
// Params 0, eflags: 0x4
// Checksum 0x233bb262, Offset: 0x1cb
// Size: 0x49
function private watch_third_person()
{
    thread function_8f0941e4910c2d09();
    
    if ( !isbot( self ) )
    {
        self notifyonplayercommand( "zm_down_press", "+actionslot 2" );
        self notifyonplayercommand( "zm_down_release", "-actionslot 2" );
        self notifyonplayercommand( "zm_down_toggle", "third_person_toggle" );
    }
    
    thread function_947ad0e23995cada();
}

// Namespace zm_third_person
// Params 0, eflags: 0x4
// Checksum 0x47823d, Offset: 0x21c
// Size: 0x11a
function private function_947ad0e23995cada()
{
    self endon( #"disconnect" );
    pressedtime = 0;
    hold_button_time = 500;
    var_2e7980c6e49ab862 = hold_button_time / 1000;
    var_d3081cc8b026a873 = 1000;
    value = undefined;
    
    while ( true )
    {
        if ( pressedtime == 0 )
        {
            value = utility::waittill_any_return( "zm_down_press", "zm_down_release", "zm_down_toggle" );
        }
        else
        {
            value = utility::waittill_any_timeout( var_2e7980c6e49ab862, "zm_down_release" );
        }
        
        if ( !isalive( self ) || !isdefined( value ) )
        {
            continue;
        }
        
        if ( isdefined( self.var_6eec07112ad043b8 ) && gettime() < self.var_6eec07112ad043b8 + var_d3081cc8b026a873 )
        {
            pressedtime = 0;
            continue;
        }
        
        shouldtoggle = 0;
        
        if ( value == "zm_down_release" )
        {
            pressedtime = 0;
        }
        else if ( value == "timeout" || value == "zm_down_toggle" )
        {
            shouldtoggle = 1;
            pressedtime = 0;
        }
        else if ( pressedtime == 0 )
        {
            pressedtime = gettime();
        }
        
        if ( shouldtoggle )
        {
            toggle_third_person();
        }
    }
}

// Namespace zm_third_person
// Params 1, eflags: 0x4
// Checksum 0xeb9c8ced, Offset: 0x33e
// Size: 0xb2
function private toggle_third_person( override )
{
    if ( !isplayer( self ) )
    {
        assertmsg( "<dev string:x24>" );
        return;
    }
    
    if ( isdefined( self.var_7efe9d6a267112b9 ) )
    {
        return;
    }
    
    if ( isalive( self ) && !self isvehicleactive() && !self.disable_third_person_toggle && !self isemoteactive() )
    {
        isthirdperson = self getcamerathirdperson();
        
        if ( isdefined( override ) )
        {
            isthirdperson = !override;
        }
        
        self setcamerathirdperson( !isthirdperson );
        self setclientomnvar( "ui_toggle_third_person", !isthirdperson );
        self notify( #"toggle_third_person" );
        self setplayerdata( "common", "mpProgression", "thirdPerson", !isthirdperson );
    }
}

// Namespace zm_third_person
// Params 1, eflags: 0x4
// Checksum 0x89e282a, Offset: 0x3f8
// Size: 0x4d
function private function_8f0941e4910c2d09( params )
{
    var_2f074dacf1c6f38f = self getplayerdata( "common", "mpProgression", "thirdPerson" );
    
    if ( !isdefined( var_2f074dacf1c6f38f ) )
    {
        return;
    }
    
    if ( var_2f074dacf1c6f38f )
    {
        toggle_third_person( 1 );
        return;
    }
    
    toggle_third_person( 0 );
}

// Namespace zm_third_person
// Params 1, eflags: 0x4
// Checksum 0x86b09e01, Offset: 0x44d
// Size: 0x13
function private function_d566a147fead1cc4( entnum )
{
    toggle_third_person();
}

