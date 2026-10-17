#using script_4312f2cd6172b2a7;
#using script_6995a3eb7d571a9f;
#using scripts\common\utility;

#namespace cluster_spike_mp;

// Namespace cluster_spike_mp
// Params 0
// Checksum 0x6b3120, Offset: 0x87
// Size: 0x31
function init()
{
    killstreaks::registerkillstreak( "cluster_spike", &cluster_spike::function_86ac47cc74fcc4cf );
    utility::registersharedfunc( #"cluster_spike", #"attachxrays", &cluster_spike_attachxrays );
}

// Namespace cluster_spike_mp
// Params 1
// Checksum 0xbfc65688, Offset: 0xc0
// Size: 0x22
function cluster_spike_attachxrays( clusterspike )
{
    clusterspike setentityhudoutlinedata( 3, clusterspike.team );
    return clusterspike;
}

