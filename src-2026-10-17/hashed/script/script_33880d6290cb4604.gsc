#using scripts\common\callbacks;

#namespace ob_ui;

// Namespace ob_ui
// Params 0
// Checksum 0x955560ca, Offset: 0xc7
// Size: 0x18
function init_ob_ui()
{
    level callback::add( #"player_connect", &ob_ui_on_connect );
}

// Namespace ob_ui
// Params 1
// Checksum 0x2bea8f9b, Offset: 0xe7
// Size: 0x3f
function ob_ui_on_connect( params )
{
    callback::add( "currency_add", &function_f15ba904df264c50 );
    callback::add( "currency_sub", &function_f15ba904df264c50 );
    callback::add( "currency_set", &function_f15ba904df264c50 );
}

// Namespace ob_ui
// Params 1
// Checksum 0xdcee5dc0, Offset: 0x12e
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

