#using script_11083f13727030d8;
#using scripts\common\callbacks;

#namespace zm_ui;

// Namespace zm_ui
// Params 0
// Checksum 0x77e37a9b, Offset: 0xed
// Size: 0x18
function init_zm_ui()
{
    level callback::add( #"player_connect", &zm_ui_on_connect );
}

// Namespace zm_ui
// Params 1
// Checksum 0x7fffad33, Offset: 0x10d
// Size: 0x4a
function zm_ui_on_connect( params )
{
    callback::add( "currency_add", &function_f15ba904df264c50 );
    callback::add( "currency_sub", &function_f15ba904df264c50 );
    callback::add( "currency_set", &function_f15ba904df264c50 );
    setomnvar( "ui_hide_nameplates_for_zero_health", 0 );
}

// Namespace zm_ui
// Params 1
// Checksum 0xf6ae6784, Offset: 0x15f
// Size: 0x90
function function_f15ba904df264c50( sparams )
{
    if ( isdefined( sparams.currencytype ) )
    {
        switch ( sparams.currencytype )
        {
            case #"salvage":
                self setclientomnvar( "zm_salvage", int( self.currency[ #"salvage" ] ) );
                break;
            case #"rare_salvage":
                self setclientomnvar( "zm_rare_salvage", int( self.currency[ #"rare_salvage" ] ) );
                break;
        }
    }
}

// Namespace zm_ui
// Params 0
// Checksum 0x5f7d185f, Offset: 0x1f7
// Size: 0x92
function function_b814b25c8d99fd02()
{
    if ( level.var_a7b38b9723de06b8 )
    {
        return;
    }
    
    if ( !isdefined( self.revivecount ) )
    {
        self.revivecount = 0;
    }
    
    if ( !isdefined( self.doorbuycount ) )
    {
        self.doorbuycount = 0;
    }
    
    packedvalue = self.revivecount;
    
    if ( packedvalue > 1023 )
    {
        packedvalue = 1024;
    }
    
    if ( self.doorbuycount > 63 )
    {
        self.doorbuycount = 64;
    }
    
    packedvalue += self.doorbuycount << 10;
    stats::setextrascore3( packedvalue );
}

