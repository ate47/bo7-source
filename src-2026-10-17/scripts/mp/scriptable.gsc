#using scripts\common\scriptable;
#using scripts\common\utility;
#using scripts\mp\flags;

#namespace scriptable;

// Namespace scriptable
// Params 0
// Checksum 0x739dbfde, Offset: 0x8b
// Size: 0xe
function scriptable_mpglobalcallback()
{
    scriptable_setinitcallback( &scriptable_mpcallback );
}

// Namespace scriptable
// Params 0
// Checksum 0x3cc03896, Offset: 0xa1
// Size: 0x35
function scriptable_mpcallback()
{
    flags::levelflagset( "scriptables_ready" );
    
    if ( !utility::flag_exist( "scriptables_ready" ) )
    {
        utility::flag_init( "scriptables_ready" );
    }
    
    utility::flag_set( "scriptables_ready" );
}

