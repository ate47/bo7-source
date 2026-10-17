#using scripts\mp\destructibles\destructibles;

#namespace respawn;

// Namespace respawn
// Params 1
// Checksum 0x53366490, Offset: 0x76
// Size: 0x22
function execute( params )
{
    level waittill( params.eventnotify );
    destructible::spawn();
}

