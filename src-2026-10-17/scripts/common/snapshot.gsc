#using scripts\common\utility;

#namespace snapshot;

// Namespace snapshot
// Params 0
// Checksum 0x50ce2797, Offset: 0xca
// Size: 0x98
function function_23f4614f16363579()
{
    self endon( #"disconnect" );
    
    if ( utility::isusingremote() )
    {
        return;
    }
    
    if ( isdefined( level.gamemodebundle.pbgpostfxbundle_marked ) )
    {
        pbgpostfxbundlestart( self, level.gamemodebundle.pbgpostfxbundle_marked );
        return;
    }
    
    visionset = "recon_drone_flash";
    
    if ( self.pers[ "useNVG" ] )
    {
        visionset = "recon_drone_flash_nvg";
    }
    
    self visionsetfadetoblackforplayer( visionset, 0.05 );
    wait 0.08;
    self visionsetfadetoblackforplayer( "", 1.2 );
}

// Namespace snapshot
// Params 0
// Checksum 0x5f56cb2f, Offset: 0x16a
// Size: 0x75
function function_c802f1ac50040a2c()
{
    if ( !isdefined( self.markedomnvar ) )
    {
        self.markedomnvar = 1;
        self setclientomnvar( "ui_rcd_target_notify", self.markedomnvar );
        thread function_41179923bd856516();
        return;
    }
    
    if ( self.markedomnvar == 1 )
    {
        self.markedomnvar = 2;
    }
    else
    {
        self.markedomnvar = 1;
    }
    
    self setclientomnvar( "ui_rcd_target_notify", self.markedomnvar );
}

// Namespace snapshot
// Params 0
// Checksum 0x3cbc1f01, Offset: 0x1e7
// Size: 0x6a
function function_41179923bd856516()
{
    self endon( #"disconnect" );
    self notify( #"hash_4f6c70212967e71e" );
    self endon( #"hash_4f6c70212967e71e" );
    
    if ( utility::issharedfuncdefined( #"helper_drone", #"get_mark_ui_duration" ) )
    {
        wait self [[ utility::getsharedfunc( #"helper_drone", #"get_mark_ui_duration" ) ]]();
    }
    else
    {
        wait 3;
    }
    
    thread function_9f8f232c138a6f15();
}

// Namespace snapshot
// Params 0
// Checksum 0x488cc0d1, Offset: 0x259
// Size: 0x24
function function_9f8f232c138a6f15()
{
    self notify( #"hash_4f6c70212967e71e" );
    self.markedomnvar = undefined;
    self setclientomnvar( "ui_rcd_target_notify", 0 );
}

