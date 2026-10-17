#using scripts\mp\flags;

#namespace minefields;

// Namespace minefields
// Params 0
// Checksum 0x275d5ff6, Offset: 0xc9
// Size: 0x65
function minefields()
{
    minefields = getentarray( "minefield", #targetname );
    
    if ( minefields.size > 0 )
    {
        level._effect[ "mine_explosion" ] = loadfxasset( "vfx_core_explo_weap_gre_dirt_cg" );
    }
    
    for ( i = 0; i < minefields.size ; i++ )
    {
        minefields[ i ] thread minefield_think();
    }
}

// Namespace minefields
// Params 0
// Checksum 0xb41d3f20, Offset: 0x136
// Size: 0x42
function minefield_think()
{
    flags::gameflagwait( "prematch_done" );
    
    while ( true )
    {
        self waittill( #"trigger", other );
        
        if ( isplayer( other ) )
        {
            other thread minefield_kill( self );
        }
    }
}

// Namespace minefields
// Params 1
// Checksum 0x52054ba4, Offset: 0x180
// Size: 0x91
function minefield_kill( trigger )
{
    if ( isdefined( self.minefield ) )
    {
        return;
    }
    
    self.minefield = 1;
    wait 0.5;
    wait randomfloat( 0.5 );
    
    if ( isdefined( self ) && self istouching( trigger ) )
    {
        origin = self getorigin();
        range = 300;
        maxdamage = 2000;
        mindamage = 50;
        radiusdamage( origin, range, maxdamage, mindamage );
    }
    
    self.minefield = undefined;
}

