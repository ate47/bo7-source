#namespace lui_elems;

// Namespace lui_elems
// Params 2
// Checksum 0x2c46a15a, Offset: 0x76
// Size: 0x11a
function register_lui_elem( luielemname, assethash )
{
    if ( !isdefined( level.luielemregistrations ) )
    {
        level.luielemregistrations = [];
    }
    
    if ( !isdefined( level.var_9eb7757d37cec205 ) )
    {
        level.var_9eb7757d37cec205 = [];
    }
    
    regid = 0;
    
    if ( level.var_9eb7757d37cec205[ assethash ] && level.var_9eb7757d37cec205[ assethash ].size > 0 )
    {
        regid = level.var_9eb7757d37cec205[ assethash ][ 0 ];
        level.var_9eb7757d37cec205[ assethash ][ 0 ] = undefined;
        
        if ( isint( 0 ) )
        {
            function_cdc669dbc8ea2101( level.var_9eb7757d37cec205[ assethash ] );
        }
    }
    else
    {
        if ( !isdefined( level.luielemregistrations[ assethash ] ) )
        {
            level.luielemregistrations[ assethash ] = 0;
        }
        
        regid = level.luielemregistrations[ assethash ];
        level.luielemregistrations[ assethash ]++;
    }
    
    luielem = { #var_1e3e00c2e1be874d:0, #regid:regid, #assethash:assethash, #menuname:luielemname };
    return luielem;
}

// Namespace lui_elems
// Params 2
// Checksum 0x75c392ee, Offset: 0x199
// Size: 0x57
function function_4a07e613bedbe7f( player, flags = 0 )
{
    luielem = self;
    luielem.var_1e3e00c2e1be874d = 1;
    player openluielem( luielem.menuname, luielem.regid, flags );
}

// Namespace lui_elems
// Params 1
// Checksum 0xaf39ff0b, Offset: 0x1f8
// Size: 0x43
function function_2557a1e4a129a093( player )
{
    luielem = self;
    luielem.var_1e3e00c2e1be874d = 0;
    player closeluielem( luielem.menuname, luielem.regid );
}

// Namespace lui_elems
// Params 1
// Checksum 0xb6f23954, Offset: 0x243
// Size: 0x35
function function_174a11670f95f430( player )
{
    luielem = self;
    return player isluielemopenforplayer( luielem.menuname, luielem.regid );
}

// Namespace lui_elems
// Params 3
// Checksum 0x437ad78a, Offset: 0x281
// Size: 0x4b
function function_dccebe4829a93560( player, data, value )
{
    luielem = self;
    player setluielemdata( luielem.menuname, luielem.regid, data, value );
}

// Namespace lui_elems
// Params 2
// Checksum 0x719516cc, Offset: 0x2d4
// Size: 0x105
function function_62219114d4882731( player, forceclose = 0 )
{
    luielem = self;
    
    if ( luielem.var_1e3e00c2e1be874d || forceclose )
    {
        function_2557a1e4a129a093( player );
    }
    
    if ( isdefined( luielem.assethash ) && isdefined( luielem.regid ) )
    {
        if ( !isdefined( level.var_9eb7757d37cec205 ) )
        {
            level.var_9eb7757d37cec205 = [];
        }
        
        if ( !isdefined( level.var_9eb7757d37cec205[ luielem.assethash ] ) )
        {
            level.var_9eb7757d37cec205[ luielem.assethash ] = [];
        }
        
        level.var_9eb7757d37cec205[ luielem.assethash ][ level.var_9eb7757d37cec205[ luielem.assethash ].size ] = luielem.regid;
    }
    
    luielem.var_1e3e00c2e1be874d = 0;
    luielem.regid = undefined;
    luielem.assethash = undefined;
}

