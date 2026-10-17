#using script_3c8ea7f78632414c;
#using script_762e73cd6088bff;
#using scripts\common\utility;

#namespace archassault;

// Namespace archassault
// Params 0
// Checksum 0x53fea600, Offset: 0xcc
// Size: 0x9
function applyarchetype()
{
    equipextras();
}

// Namespace archassault
// Params 0
// Checksum 0xe03e6b08, Offset: 0xdd
// Size: 0x2
function equipextras()
{
    
}

// Namespace archassault
// Params 0
// Checksum 0x7ca69ff0, Offset: 0xe7
// Size: 0x2
function removearchetype()
{
    
}

// Namespace archassault
// Params 0
// Checksum 0xfa3cd864, Offset: 0xf1
// Size: 0xe5
function auraquickswap_run()
{
    self endon( #"death_or_disconnect" );
    self endon( #"removearchetype" );
    self setclientomnvar( "ui_aura_quickswap", 0 );
    
    while ( true )
    {
        self waittill( #"got_a_kill" );
        auraplayers = utility::playersincylinder( self.origin, 384 );
        
        foreach ( player in auraplayers )
        {
            if ( player.team != self.team )
            {
                continue;
            }
            
            player thread auraquickswap_bestowaura( self );
        }
    }
}

// Namespace archassault
// Params 1
// Checksum 0xb1a3d5e8, Offset: 0x1de
// Size: 0xa6
function auraquickswap_bestowaura( player )
{
    self endon( #"death_or_disconnect" );
    self endon( #"giveloadout_start" );
    level endon( #"game_ended" );
    
    if ( self != player )
    {
        player thread points::doscoreevent( #"buff_teammate" );
    }
    
    self setclientomnvar( "ui_aura_quickswap", 1 );
    perk::giveperk( "specialty_fastreload" );
    self playlocalsound( "mp_overcharge_on" );
    thread cleanupafterplayerdeath();
    wait 5;
    self playlocalsound( "mp_overcharge_off" );
    self notify( #"removeauraquickswap" );
    perk::removeperk( "specialty_fastreload" );
    self setclientomnvar( "ui_aura_quickswap", 0 );
}

// Namespace archassault
// Params 0
// Checksum 0x9d88251f, Offset: 0x28c
// Size: 0x33
function cleanupafterplayerdeath()
{
    self endon( #"disconnect" );
    level endon( #"game_ended" );
    self waittill( #"death" );
    self setclientomnvar( "ui_aura_quickswap", 0 );
}

