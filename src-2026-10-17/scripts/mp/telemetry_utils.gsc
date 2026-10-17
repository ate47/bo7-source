#namespace telemetry_utils;

// Namespace telemetry_utils
// Params 0
// Checksum 0xcd2bfd01, Offset: 0x2c0
// Size: 0x44c
function get_death_modifiers()
{
    deathmodifiers = [];
    
    if ( isdefined( level.sharedfuncs[ #"killstreak" ][ #"teamhasuav" ] ) )
    {
        if ( [[ level.sharedfuncs[ #"killstreak" ][ #"teamhasuav" ] ]]( self.team ) )
        {
            deathmodifiers[ deathmodifiers.size ] = "UAV_ACTIVE";
        }
    }
    
    if ( isdefined( level.sharedfuncs[ #"killstreak" ][ #"enemyhascuav" ] ) )
    {
        if ( [[ level.sharedfuncs[ #"killstreak" ][ #"enemyhascuav" ] ]]( self.team ) )
        {
            deathmodifiers[ deathmodifiers.size ] = "CUAV_ACTIVE";
        }
    }
    
    if ( isdefined( level.sharedfuncs[ #"killstreak" ][ #"hash_8ed3fd8e9d6b6338" ] ) )
    {
        if ( self [[ level.sharedfuncs[ #"killstreak" ][ #"hash_8ed3fd8e9d6b6338" ] ]]() )
        {
            deathmodifiers[ deathmodifiers.size ] = "IS_MARKED";
        }
    }
    
    if ( isdefined( self.perks[ "specialty_quieter" ] ) )
    {
        deathmodifiers[ deathmodifiers.size ] = "DEADSILENCE_ACTIVE";
    }
    
    if ( isdefined( self.perks[ "specialty_bulletdamage" ] ) )
    {
        deathmodifiers[ deathmodifiers.size ] = "HAS_STOPPING_POWER";
    }
    
    curtime = gettime();
    baseweapon = undefined;
    
    if ( isdefined( self.lastweaponused ) )
    {
        currentweapon = self.lastweaponused;
        baseweapon = getweaponbasename( currentweapon );
    }
    
    if ( self.flashbanged )
    {
        deathmodifiers[ deathmodifiers.size ] = "IS_FLASHED";
    }
    
    if ( self.concussiongrenadefx )
    {
        deathmodifiers[ deathmodifiers.size ] = "IS_STUNNED";
    }
    
    if ( self.gastriggerstouching.size > 0 || isdefined( self.lastgastouchtime ) && self.lastgastouchtime + 5000 > curtime )
    {
        deathmodifiers[ deathmodifiers.size ] = "IN_GAS";
    }
    
    if ( isdefined( self.burninginfo ) || isdefined( self.lastburntime ) && self.lastburntime + 5000 > curtime )
    {
        deathmodifiers[ deathmodifiers.size ] = "IN_BURNING";
    }
    
    if ( isdefined( self.lastsnapshotgrenadetime ) && self.lastsnapshotgrenadetime + 5000 > curtime )
    {
        deathmodifiers[ deathmodifiers.size ] = "IS_SNAPSHOTTED";
    }
    
    if ( isdefined( self.var_9ae31e49bba9af9a ) && self.var_9ae31e49bba9af9a + 1000 > curtime )
    {
        deathmodifiers[ deathmodifiers.size ] = "IS_FALSEFLAGGED";
    }
    
    if ( isdefined( self.lastinsmoketime ) && self.lastinsmoketime + 5000 > curtime )
    {
        deathmodifiers[ deathmodifiers.size ] = "IN_SMOKE";
    }
    
    if ( self.empcount )
    {
        deathmodifiers[ deathmodifiers.size ] = "IS_EMPED";
    }
    
    if ( self.wphealthblock )
    {
        deathmodifiers[ deathmodifiers.size ] = "IN_WHITE_PHOSPHOROUS";
    }
    
    if ( self isnightvisionon() )
    {
        deathmodifiers[ deathmodifiers.size ] = "NVG_ENABLED";
    }
    
    modifiers = self.modifiers;
    
    if ( isdefined( modifiers ) )
    {
        if ( modifiers[ "headshot" ] )
        {
            deathmodifiers[ deathmodifiers.size ] = "HEADSHOT";
        }
        
        if ( modifiers[ "avenger" ] )
        {
            deathmodifiers[ deathmodifiers.size ] = "AVENGER";
        }
        
        if ( modifiers[ "defender" ] )
        {
            deathmodifiers[ deathmodifiers.size ] = "DEFENDER";
        }
        
        if ( modifiers[ "posthumous" ] )
        {
            deathmodifiers[ deathmodifiers.size ] = "POSTHUMOUS";
        }
        
        if ( modifiers[ "revenge" ] )
        {
            deathmodifiers[ deathmodifiers.size ] = "REVENGE";
        }
        
        if ( modifiers[ "buzzkill" ] )
        {
            deathmodifiers[ deathmodifiers.size ] = "BUZZKILL";
        }
        
        if ( modifiers[ "firstblood" ] )
        {
            deathmodifiers[ deathmodifiers.size ] = "FIRSTBLOOD";
        }
        
        if ( modifiers[ "comeback" ] )
        {
            deathmodifiers[ deathmodifiers.size ] = "COMEBACK";
        }
        
        if ( modifiers[ "longshot" ] )
        {
            deathmodifiers[ deathmodifiers.size ] = "LONGSHOT";
        }
        
        if ( modifiers[ "pointblank" ] )
        {
            deathmodifiers[ deathmodifiers.size ] = "POINTBLANK";
        }
        
        if ( modifiers[ "assistedsuicide" ] )
        {
            deathmodifiers[ deathmodifiers.size ] = "ASSISTED_SUICIDE";
        }
        
        if ( isdefined( baseweapon ) && isdefined( level.sharedfuncs[ #"killstreak" ][ #"iskillstreakweapon" ] ) && [[ level.sharedfuncs[ #"killstreak" ][ #"iskillstreakweapon" ] ]]( baseweapon ) )
        {
            deathmodifiers[ deathmodifiers.size ] = "KILLSTREAK";
        }
    }
    
    return deathmodifiers;
}

