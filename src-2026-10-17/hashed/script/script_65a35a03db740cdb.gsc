#using scripts\common\callbacks;

#namespace forwardintel;

// Namespace forwardintel
// Params 0, eflags: 0x1
// Checksum 0x3df2976a, Offset: 0xae
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerforwardintel );
}

// Namespace forwardintel
// Params 1
// Checksum 0x47f917e, Offset: 0xce
// Size: 0x66
function registerforwardintel( params )
{
    bundle = level.perkbundles[ "specialty_forwardintel" ];
    
    if ( !isdefined( bundle ) )
    {
        return;
    }
    
    if ( isdefined( params.var_a2358848c4408242 ) )
    {
        level [[ params.var_a2358848c4408242 ]]( "specialty_forwardintel", &setforwardintel, &unsetforwardintel, [ "specialty_expanded_minimap" ] );
    }
}

// Namespace forwardintel
// Params 0
// Checksum 0xb0a4863d, Offset: 0x13c
// Size: 0x10
function setforwardintel()
{
    thread function_7d44e2d35e28528e();
    thread function_7d3ee6be26520f69();
}

// Namespace forwardintel
// Params 0
// Checksum 0xf63780ab, Offset: 0x154
// Size: 0x18
function unsetforwardintel()
{
    self.radarshowenemydirection = 0;
    self notify( #"hash_ba52f19c75f7418f" );
}

// Namespace forwardintel
// Params 0
// Checksum 0x8e065d6a, Offset: 0x174
// Size: 0x13
function function_7d44e2d35e28528e()
{
    waitframe();
    
    if ( isdefined( self ) )
    {
        self.radarshowenemydirection = 1;
    }
}

// Namespace forwardintel
// Params 0
// Checksum 0xa60c24dc, Offset: 0x18f
// Size: 0x3e
function function_7d3ee6be26520f69()
{
    self endon( #"death_or_disconnect" );
    self endon( #"hash_ba52f19c75f7418f" );
    waitframe();
    
    while ( true )
    {
        if ( !self.radarshowenemydirection )
        {
            self.radarshowenemydirection = 1;
        }
        
        wait 1;
    }
}

