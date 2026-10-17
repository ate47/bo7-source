#using script_353e34c229ca1589;

#namespace areas;

// Namespace areas
// Params 0
// Checksum 0x947fc8af, Offset: 0xb5
// Size: 0x177
function init()
{
    level.softlandingtriggers = getentarray( "trigger_multiple_softlanding", #classname );
    destructibles = getentarray( "destructible_vehicle", #targetname );
    
    foreach ( trigger in level.softlandingtriggers )
    {
        if ( trigger.script_type != "car" )
        {
            continue;
        }
        
        foreach ( destructible in destructibles )
        {
            if ( distance( trigger.origin, destructible.origin ) > 64 )
            {
                continue;
            }
            
            assert( !isdefined( trigger.destructible ) );
            trigger.destructible = destructible;
        }
    }
    
    thread onplayerconnect();
}

// Namespace areas
// Params 0
// Checksum 0xd9929121, Offset: 0x234
// Size: 0x3c
function onplayerconnect()
{
    if ( game_utility_mp::runleanthreadmode() )
    {
        return;
    }
    
    for ( ;; )
    {
        level waittill( #"connected", player );
        player.softlanding = undefined;
        player thread softlandingwaiter();
    }
}

// Namespace areas
// Params 1
// Checksum 0xa2c2ff51, Offset: 0x278
// Size: 0x17
function playerentersoftlanding( trigger )
{
    self.softlanding = trigger;
}

// Namespace areas
// Params 1
// Checksum 0x287ac447, Offset: 0x297
// Size: 0x16
function playerleavesoftlanding( trigger )
{
    self.softlanding = undefined;
}

// Namespace areas
// Params 0
// Checksum 0x2a409647, Offset: 0x2b5
// Size: 0x47
function softlandingwaiter()
{
    self endon( #"disconnect" );
    
    for ( ;; )
    {
        self waittill( #"soft_landing", trigger, damage );
        
        if ( !isdefined( trigger.destructible ) )
        {
        }
    }
}

