#using script_60e83c26eb0cc317;
#using scripts\common\callbacks;
#using scripts\common\vehicle_compass;

#namespace vehicle_compass_mp;

// Namespace vehicle_compass_mp
// Params 0
// Checksum 0xf7ba3889, Offset: 0x76
// Size: 0x23
function vehicle_compass_mp_init()
{
    callback::add( #"player_spawned", &vehicle_compass::player_spawned_callback );
    join_team_aggregator::registeronplayerjointeamnospectatorcallback( &vehicle_compass::player_joined_team_callback );
}

