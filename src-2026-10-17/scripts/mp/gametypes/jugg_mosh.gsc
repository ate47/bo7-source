#using script_2ad7dff7e51218da;
#using script_a195974d0e328b0;
#using scripts\common\callbacks;

#namespace jugg_mosh;

// Namespace jugg_mosh
// Params 0
// Checksum 0x26399d63, Offset: 0x90
// Size: 0x23
function init()
{
    connect_event_aggregator::registeronconnectcallback( &onplayerconnect );
    callback::add( #"player_spawned", &onplayerspawned );
}

// Namespace jugg_mosh
// Params 0
// Checksum 0xf0e793d9, Offset: 0xbb
// Size: 0x18
function onplayerconnect()
{
    player = self;
    player thread function_37487fea3df2b612();
}

// Namespace jugg_mosh
// Params 0
// Checksum 0x13666fe9, Offset: 0xdb
// Size: 0x33
function function_37487fea3df2b612()
{
    player = self;
    player endon( #"death_or_disconnect" );
    
    while ( true )
    {
        player iprintlnbold( "juggermosh - remove me" );
        wait 2;
    }
}

// Namespace jugg_mosh
// Params 1
// Checksum 0x15df3305, Offset: 0x116
// Size: 0x37
function onplayerspawned( params )
{
    /#
        if ( getdvarint( @"hash_672437747e65ed17", 0 ) )
        {
            return;
        }
    #/
    
    player = self;
    player thread juggernaut::activatejugg();
}

