#namespace dismember;

// Namespace dismember
// Params 1
// Checksum 0x62c2ad9e, Offset: 0xfe
// Size: 0x93
function initscriptablepart( part )
{
    if ( !isdefined( self._blackboard.scriptableparts ) )
    {
        self._blackboard.scriptableparts = [];
    }
    
    if ( !isdefined( self._blackboard.scriptableparts[ part ] ) )
    {
        self._blackboard.scriptableparts[ part ] = spawnstruct();
        self._blackboard.scriptableparts[ part ].state = "normal";
    }
}

// Namespace dismember
// Params 2
// Checksum 0xba086159, Offset: 0x199
// Size: 0x105
function set_scriptablepartinfo( part, state )
{
    if ( self._blackboard.scriptableparts[ part ].state == "dismember" )
    {
        return;
    }
    
    if ( self._blackboard.scriptableparts[ part ].state != "normal" && state != "dismember" )
    {
        self._blackboard.scriptableparts[ part ].state += "_both";
    }
    else
    {
        self._blackboard.scriptableparts[ part ].state = state;
    }
    
    self._blackboard.scriptableparts[ part ].time = gettime();
}

// Namespace dismember
// Params 3
// Checksum 0x3f365411, Offset: 0x2a6
// Size: 0xcc
function set_scriptablepartstate( part, state, waittime )
{
    self endon( #"entitydeleted" );
    set_scriptablepartinfo( part, state );
    
    if ( isdefined( waittime ) )
    {
        wait waittime;
    }
    
    if ( isdefined( self.scriptablecleanup ) )
    {
        return 1;
    }
    
    partstate = self._blackboard.scriptableparts[ part ].state;
    
    if ( isdefined( anim.dismemberheavyfx[ self.unittype ] ) )
    {
        if ( part != "head" && partstate != "dismember" )
        {
            if ( usedismemberfxlite( self.unittype ) )
            {
                partstate += "_lite";
            }
        }
    }
    
    self setscriptablepartstate( part, partstate );
}

// Namespace dismember
// Params 1
// Checksum 0x254d49fd, Offset: 0x37a
// Size: 0xb2
function setdismemberstatefx( part )
{
    fx_part = part + "_dism_fx";
    state = get_scriptablepartinfo( part );
    
    if ( state == "normal" )
    {
        state = "undamaged";
    }
    else if ( issubstr( state, "_both" ) )
    {
        state = "dmg_both";
    }
    
    if ( !isdefined( level.in_vr ) && isdefined( anim.dismemberheavyfx[ self.unittype ] ) )
    {
        if ( part != "head" )
        {
            if ( usedismemberfxlite( self.unittype ) )
            {
                state += "_lite";
            }
        }
    }
    
    self setscriptablepartstate( fx_part, state );
}

// Namespace dismember
// Params 1
// Checksum 0xf9c31bba, Offset: 0x434
// Size: 0x9f, Type: bool
function usedismemberfxlite( type )
{
    newarray = [];
    
    for ( i = 0; i < anim.dismemberheavyfx[ type ].size ; i++ )
    {
        if ( gettime() - anim.dismemberheavyfx[ type ][ i ] > 1000 )
        {
            continue;
        }
        
        newarray[ newarray.size ] = anim.dismemberheavyfx[ type ][ i ];
    }
    
    if ( newarray.size < 0 )
    {
        newarray[ newarray.size ] = gettime();
        anim.dismemberheavyfx[ type ] = newarray;
        return false;
    }
    
    anim.dismemberheavyfx[ type ] = newarray;
    return true;
}

// Namespace dismember
// Params 1
// Checksum 0x70bbcf74, Offset: 0x4dc
// Size: 0x6b
function get_scriptablepartinfo( part )
{
    if ( !isdefined( self._blackboard.scriptableparts ) )
    {
        return "normal";
    }
    
    if ( !isdefined( self._blackboard.scriptableparts[ part ] ) )
    {
        return "normal";
    }
    
    return self._blackboard.scriptableparts[ part ].state;
}

// Namespace dismember
// Params 0
// Checksum 0x72d25bcf, Offset: 0x550
// Size: 0x2f, Type: bool
function anylegdismembered()
{
    if ( get_scriptablepartinfo( "left_leg" ) == "dismember" || get_scriptablepartinfo( "right_leg" ) == "dismember" )
    {
        return true;
    }
    
    return false;
}

// Namespace dismember
// Params 0
// Checksum 0x24a03017, Offset: 0x588
// Size: 0x2f, Type: bool
function bothlegsdismembered()
{
    if ( get_scriptablepartinfo( "left_leg" ) == "dismember" && get_scriptablepartinfo( "right_leg" ) == "dismember" )
    {
        return true;
    }
    
    return false;
}

// Namespace dismember
// Params 0
// Checksum 0xe66b6377, Offset: 0x5c0
// Size: 0x2f, Type: bool
function anyarmdismembered()
{
    if ( get_scriptablepartinfo( "left_arm" ) == "dismember" || get_scriptablepartinfo( "right_arm" ) == "dismember" )
    {
        return true;
    }
    
    return false;
}

// Namespace dismember
// Params 0
// Checksum 0xbeb826f7, Offset: 0x5f8
// Size: 0x1a, Type: bool
function rightarmdismembered()
{
    if ( get_scriptablepartinfo( "right_arm" ) == "dismember" )
    {
        return true;
    }
    
    return false;
}

// Namespace dismember
// Params 0
// Checksum 0xdc5c1014, Offset: 0x61b
// Size: 0x1a, Type: bool
function leftarmdismembered()
{
    if ( get_scriptablepartinfo( "left_arm" ) == "dismember" )
    {
        return true;
    }
    
    return false;
}

// Namespace dismember
// Params 0
// Checksum 0xe18eb291, Offset: 0x63e
// Size: 0x2f, Type: bool
function botharmsdismembered()
{
    if ( get_scriptablepartinfo( "left_arm" ) == "dismember" && get_scriptablepartinfo( "right_arm" ) == "dismember" )
    {
        return true;
    }
    
    return false;
}

