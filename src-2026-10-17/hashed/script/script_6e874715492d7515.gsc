#using scripts\common\callbacks;

#namespace br_gametypes;

// Namespace br_gametypes
// Params 0
// Checksum 0x9ac08a51, Offset: 0x88
// Size: 0x90
function init()
{
    level.brgametype = spawnstruct();
    level.brgametype.funcs = [];
    level.brgametype.disabledfeatures = [];
    level.brgametype.enabledfeatures = [];
    level.brgametype.data = [];
    function_13315e0ebd35a643();
    
    if ( isdefined( level.var_dd10333ade220938 ) )
    {
        [[ level.var_dd10333ade220938 ]]();
    }
    
    level callback::callback( "brGametypeInit" );
}

// Namespace br_gametypes
// Params 0
// Checksum 0x1ffabd67, Offset: 0x120
// Size: 0x59
function function_13315e0ebd35a643()
{
    level.br_circle_disabled = level.gametypebundle.disablecircles;
    
    if ( getdvarint( @"scr_br_circle_disable", 0 ) == 1 )
    {
        level.br_circle_disabled = 1;
    }
    
    if ( level.br_circle_disabled )
    {
        disablefeature( #"circle" );
    }
}

// Namespace br_gametypes
// Params 1
// Checksum 0x99f221f0, Offset: 0x181
// Size: 0x34
function disablefeature( featurename )
{
    assert( !isstring( featurename ) );
    level.brgametype.disabledfeatures[ featurename ] = 1;
}

// Namespace br_gametypes
// Params 1
// Checksum 0x314bb286, Offset: 0x1bd
// Size: 0x40, Type: bool
function isfeaturedisabled( featurename )
{
    assert( !isstring( featurename ) );
    return !isdefined( level.brgametype ) || level.brgametype.disabledfeatures[ featurename ];
}

// Namespace br_gametypes
// Params 1
// Checksum 0x98e4270f, Offset: 0x206
// Size: 0x34
function enablefeature( featurename )
{
    assert( !isstring( featurename ) );
    level.brgametype.enabledfeatures[ featurename ] = 1;
}

// Namespace br_gametypes
// Params 1
// Checksum 0x72209f0a, Offset: 0x242
// Size: 0x32, Type: bool
function isfeatureenabled( featurename )
{
    assert( !isstring( featurename ) );
    return istrue( level.brgametype.enabledfeatures[ featurename ] );
}

