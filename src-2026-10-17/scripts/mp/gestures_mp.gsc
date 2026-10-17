#using script_76a9469bdb2c8bb1;
#using scripts\common\notetrack;
#using scripts\mp\gestures;

#namespace gestures_mp;

// Namespace gestures_mp
// Params 0
// Checksum 0xb1fbe118, Offset: 0x76
// Size: 0x15
function init_mp()
{
    lui_game_event_aggregator::registeronluieventcallback( &gestures::watchradialgestureactivation );
    notetrack::function_b25e047f92f346cb();
}

