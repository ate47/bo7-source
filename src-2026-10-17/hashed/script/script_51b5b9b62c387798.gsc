#using script_260830c4068c44eb;
#using script_7540b06028fffa17;
#using script_7980b6b79a1821a0;
#using script_cb233a7d6343014;
#using scripts\common\utility;

#namespace friendly;

// Namespace friendly
// Params 0
// Checksum 0xee9fdb0e, Offset: 0xd7
// Size: 0x41
function main()
{
    if ( !isdefined( level.stealth ) )
    {
        stealth_manager::main();
    }
    
    init_settings();
    self.stealth_groupname = self.script_stealthgroup;
    thread spotted_thread();
    
    /#
        thread debug::debug_friendly();
    #/
}

// Namespace friendly
// Params 0
// Checksum 0xec1ddf4b, Offset: 0x120
// Size: 0x7d
function init_settings()
{
    assert( !isdefined( self.stealth ), "<dev string:x24>" );
    self.stealth = spawnstruct();
    self.stealth.funcs = [];
    utility::ent_flag_init( "stealth_enabled" );
    utility::ent_flag_set( "stealth_enabled" );
    utility::ent_flag_init( "stealth_in_shadow" );
    utility::group_flag_init( "stealth_spotted" );
    utility::group_add();
    self.stealth_bsmstate = 0;
}

// Namespace friendly
// Params 0
// Checksum 0xc052578, Offset: 0x1a5
// Size: 0xa2
function spotted_thread()
{
    self endon( #"death" );
    self notify( #"spotted_thread" );
    self endon( #"spotted_thread" );
    
    while ( true )
    {
        utility::ent_flag_wait( "stealth_enabled" );
        utility::group_flag_waitopen( "stealth_spotted" );
        
        if ( !utility::ent_flag( "stealth_enabled" ) )
        {
            utility::ent_flag_wait( "stealth_enabled" );
        }
        
        thread state_hidden();
        utility::ent_flag_wait( "stealth_enabled" );
        utility::group_flag_wait( "stealth_spotted" );
        
        if ( !utility::ent_flag( "stealth_enabled" ) )
        {
            utility::ent_flag_wait( "stealth_enabled" );
        }
        
        thread state_spotted();
    }
}

// Namespace friendly
// Params 0
// Checksum 0xbecf7787, Offset: 0x24f
// Size: 0x7a
function state_hidden()
{
    thread utility::setbattlechatter( 0 );
    self.stealth.oldgrenadeammo = self.grenadeammo;
    self.grenadeammo = 0;
    self.forcesidearm = 0;
    self.dontevershoot = 1;
    self.dontattackme = 1;
    
    if ( isdefined( self.stealth.funcs[ "hidden" ] ) )
    {
        callbacks::stealth_call_thread( "hidden" );
    }
}

// Namespace friendly
// Params 0
// Checksum 0x3ea9111d, Offset: 0x2d1
// Size: 0x9e
function state_spotted()
{
    assert( !isplayer( self ) );
    thread utility::setbattlechatter( 1 );
    
    if ( isdefined( self.stealth.oldgrenadeammo ) )
    {
        self.grenadeammo = self.stealth.oldgrenadeammo;
    }
    else
    {
        self.grenadeammo = 3;
    }
    
    self.dontevershoot = 0;
    self.dontattackme = 0;
    self pushplayer( 0 );
    
    if ( isdefined( self.stealth.funcs[ "spotted" ] ) )
    {
        callbacks::stealth_call_thread( "spotted" );
    }
}

// Namespace friendly
// Params 0
// Checksum 0xbd23433f, Offset: 0x377
// Size: 0xe
function getup_from_prone()
{
    self endon( #"death" );
}

// Namespace friendly
// Params 0
// Checksum 0x3f6cc9ef, Offset: 0x38d
// Size: 0x5b
function visibility_thread()
{
    self endon( #"death" );
    self endon( #"long_death" );
    
    while ( true )
    {
        utility::ent_flag_wait( "stealth_enabled" );
        
        if ( !isdefined( self.stealth.ignore_visibility ) )
        {
            self.maxvisibledist = get_detect_range();
        }
        
        wait 0.05;
    }
}

// Namespace friendly
// Params 0
// Checksum 0x25791c59, Offset: 0x3f0
// Size: 0x88
function get_detect_range()
{
    stance = self.currentpose;
    
    if ( stance == "back" )
    {
        stance = "prone";
    }
    
    if ( utility::group_spotted_flag() )
    {
        detection = "spotted";
    }
    else
    {
        detection = "hidden";
    }
    
    range = getstealthdetectrange( detection, stance );
    
    if ( utility::ent_flag( "stealth_in_shadow" ) )
    {
        range = max( getstealthdetectrange( "hidden", "prone" ), range * 0.5 );
    }
    
    return range;
}

