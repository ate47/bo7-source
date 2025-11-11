#using scripts\anim\utility_common;

#namespace weaponlist;

// Namespace weaponlist
// Params 0
// Checksum 0xa9374d3f, Offset: 0xb9
// Size: 0x33, Type: bool
function usingautomaticweapon()
{
    return weaponisauto( self.weapon ) || weaponisbeam( self.weapon ) || weaponburstcount( self.weapon ) > 0;
}

// Namespace weaponlist
// Params 0
// Checksum 0x166366b4, Offset: 0xf5
// Size: 0x23, Type: bool
function usingsemiautoweapon()
{
    return weaponissemiauto( self.weapon ) || weaponburstcount( self.weapon ) == 1;
}

// Namespace weaponlist
// Params 0
// Checksum 0xd993d20f, Offset: 0x121
// Size: 0x28
function autoshootanimrate()
{
    if ( usingautomaticweapon() )
    {
        return ( 0.1 / weaponfiretime( self.weapon ) );
    }
    
    return 0.5;
}

// Namespace weaponlist
// Params 0
// Checksum 0xbf1fcdca, Offset: 0x151
// Size: 0x40
function burstshootanimrate()
{
    if ( usingautomaticweapon() )
    {
        return ( 0.1 / weaponfiretime( self.weapon ) );
    }
    
    if ( utility_common::ispistol( self.weapon ) )
    {
        return 1;
    }
    
    return 0.2;
}

// Namespace weaponlist
// Params 0
// Checksum 0x48e62e9c, Offset: 0x199
// Size: 0x7
function waitaftershot()
{
    return 0.25;
}

// Namespace weaponlist
// Params 1
// Checksum 0x26d73230, Offset: 0x1a9
// Size: 0x59
function shootanimtime( semiautofire )
{
    if ( !usingautomaticweapon() || semiautofire == 1 )
    {
        rand = 0.5 + randomfloat( 1 );
        return ( weaponfiretime( self.weapon ) * rand );
    }
    
    return weaponfiretime( self.weapon );
}

// Namespace weaponlist
// Params 0
// Checksum 0xa0de4aa0, Offset: 0x20a
// Size: 0x6d
function refillclip()
{
    assert( isdefined( self.weapon ), "<dev string:x24>" + self.model );
    
    if ( isnullweapon( self.weapon ) )
    {
        self.bulletsinclip = 0;
        return 0;
    }
    
    self.bulletsinclip = weaponclipsize( self.weapon );
    assert( self.bulletsinclip > 0, "<dev string:x47>" );
}

// Namespace weaponlist
// Params 5
// Checksum 0xbe531308, Offset: 0x27f
// Size: 0xc9
function add_weapon( name, type, time, clipsize, anims )
{
    assert( isdefined( name ) );
    assert( isdefined( type ) );
    
    if ( !isdefined( time ) )
    {
        time = 3;
    }
    
    if ( !isdefined( clipsize ) )
    {
        time = 1;
    }
    
    if ( !isdefined( anims ) )
    {
        anims = "rifle";
    }
    
    name = tolower( name );
    anim.aiweapon[ name ][ "type" ] = type;
    anim.aiweapon[ name ][ "time" ] = time;
    anim.aiweapon[ name ][ "clipsize" ] = clipsize;
    anim.aiweapon[ name ][ "anims" ] = anims;
}

// Namespace weaponlist
// Params 1
// Checksum 0x168cbc11, Offset: 0x350
// Size: 0x28
function addturret( turret )
{
    anim.aiweapon[ tolower( turret ) ][ "type" ] = "turret";
}

