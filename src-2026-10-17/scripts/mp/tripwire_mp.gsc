#using script_3c8ea7f78632414c;
#using scripts\mp\poi;

#namespace tripwire_mp;

// Namespace tripwire_mp
// Params 1
// Checksum 0x7cc0a2f5, Offset: 0x76
// Size: 0x29
function ontripwirecreate( tripwire )
{
    tripwire.script_poi = poi::poi_findpoioriginisin( tripwire.origin );
}

// Namespace tripwire_mp
// Params 2
// Checksum 0xe7caa942, Offset: 0xa7
// Size: 0x27
function ontripwiredefused( player, tripwire )
{
    player thread points::doscoreevent( #"dmz_trap_defused" );
}

