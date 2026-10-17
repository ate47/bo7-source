#using scripts\common\callbacks;

#namespace stat_limits;

// Namespace stat_limits
// Params 0
// Checksum 0xd6aed284, Offset: 0xa4
// Size: 0xbf
function init()
{
    level.StatLimits = [];
    disabled = getdvarint( @"hash_52a5dffcb887f372", 0 ) != 0;
    level.StatLimits[ #"hash_354a8bd48a879532" ] = disabled ? 0 : getmatchrulesdata( "statLimits", "rankXP" );
    level.StatLimits[ #"limitkills" ] = disabled ? 0 : getmatchrulesdata( "statLimits", "kills" );
    level.StatLimits[ #"limitheadshots" ] = disabled ? 0 : getmatchrulesdata( "statLimits", "headshots" );
    level callback::add( #"player_connect", &onplayerconnect );
}

// Namespace stat_limits
// Params 1
// Checksum 0x40e5047e, Offset: 0x16b
// Size: 0x8d
function onplayerconnect( params )
{
    if ( !isdefined( self.pers[ #"hash_354a8bd48a879532" ] ) )
    {
        self.pers[ #"hash_354a8bd48a879532" ] = 0;
    }
    
    if ( !isdefined( self.pers[ #"limitkills" ] ) )
    {
        self.pers[ #"limitkills" ] = 0;
    }
    
    if ( !isdefined( self.pers[ #"limitheadshots" ] ) )
    {
        self.pers[ #"limitheadshots" ] = 0;
    }
}

// Namespace stat_limits
// Params 2
// Checksum 0xc8da5e37, Offset: 0x200
// Size: 0x50
function limitvalue( stat, value )
{
    assert( isdefined( level.StatLimits[ stat ] ) );
    
    if ( level.StatLimits[ stat ] == 0 )
    {
        return value;
    }
    
    return min( value, level.StatLimits[ stat ] );
}

// Namespace stat_limits
// Params 1
// Checksum 0xf064471a, Offset: 0x259
// Size: 0x5b, Type: bool
function function_608486f90656f2f7( stat )
{
    assert( isdefined( level.StatLimits[ stat ] ) );
    
    if ( level.StatLimits[ stat ] == 0 )
    {
        return false;
    }
    
    value = self.pers[ stat ];
    return level.StatLimits[ stat ] < value;
}

