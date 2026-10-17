#using script_6dfd03280678b65d;
#using scripts\asm\asm;
#using scripts\asm\shared\utility;

#namespace namespace_2607576961b0ac9d;

// Namespace namespace_2607576961b0ac9d
// Params 4
// Checksum 0x3185953c, Offset: 0xdd
// Size: 0x34, Type: bool
function function_34db69b2632f401a( asmname, statename, tostatename, params )
{
    if ( zombie_base_dismemberment::is_crawling() )
    {
        return false;
    }
    
    return true;
}

// Namespace namespace_2607576961b0ac9d
// Params 4
// Checksum 0x5724c0f0, Offset: 0x11a
// Size: 0x103
function choosestandingdeathanim( asmname, statename, params, bmoving )
{
    if ( !isdefined( self.damageyaw ) )
    {
        self.damageyaw = 0;
    }
    
    alias = "left";
    
    if ( self.damageyaw > 135 || self.damageyaw <= -135 )
    {
        alias = "forward";
    }
    else if ( self.damageyaw > 45 && self.damageyaw <= 135 )
    {
        alias = "right";
    }
    else if ( self.damageyaw > -45 && self.damageyaw <= 45 )
    {
        alias = "backward";
    }
    
    damage_taken_type = getdamagetaken();
    
    if ( damage_taken_type != "light" )
    {
        alias += "_" + damage_taken_type;
    }
    
    deathanim = asm::asm_lookupanimfromalias( statename, alias );
    return deathanim;
}

// Namespace namespace_2607576961b0ac9d
// Params 3
// Checksum 0x2b643027, Offset: 0x226
// Size: 0x3e
function playdeathanim( asmname, statename, params )
{
    self animmode( "gravity" );
    self animmode( "angle deltas" );
    utility::playanim( asmname, statename );
}

// Namespace namespace_2607576961b0ac9d
// Params 3
// Checksum 0xbceb745b, Offset: 0x26c
// Size: 0x2a
function choosemovingdeathanim( asmname, statename, params )
{
    return choosestandingdeathanim( asmname, statename, params, 1 );
}

// Namespace namespace_2607576961b0ac9d
// Params 0
// Checksum 0xf7446d62, Offset: 0x29f
// Size: 0x5e
function getdamagetaken()
{
    damagetakentype = "light";
    
    if ( isexplosivedamagemod( self.damagemod ) )
    {
        damagetakentype = "explosive";
    }
    else
    {
        ratio = self.damagetaken / self.maxhealth;
        
        if ( ratio > 0.7 )
        {
            damagetakentype = "heavy";
        }
    }
    
    return damagetakentype;
}

