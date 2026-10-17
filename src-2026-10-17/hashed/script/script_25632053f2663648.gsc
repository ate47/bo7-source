#using script_1c64a2d2dbfae714;
#using script_35efc59124dbb5db;
#using scripts\common\utility;
#using scripts\mp\zm\maps\zm_sat_mantis\zm_sat_mantis;
#using scripts\mp\zm\systems\time_travel;
#using scripts\mp\zm\systems\zm_quest;

#namespace namespace_4ce8ccb0ce5a23f6;

// Namespace namespace_4ce8ccb0ce5a23f6
// Params 0
// Checksum 0x50a8ad2f, Offset: 0xc7
// Size: 0x44
function init()
{
    data = { #current_timeline:time_travel::get_current_timeline() };
    level.mantis_pap_quest.var_3103c6b8d6bd7150 = data;
    utility::flag_set( #"hash_5781048c343b252d" );
}

// Namespace namespace_4ce8ccb0ce5a23f6
// Params 2
// Checksum 0x835c8aab, Offset: 0x113
// Size: 0x6b
function execute( skipped, save_restored )
{
    if ( skipped || save_restored || utility::flag( "open_sesame" ) )
    {
        return;
    }
    
    if ( time_travel::get_current_timeline().name != "past" )
    {
        if ( zm_quest::function_b0a5181ebe7bb905() )
        {
            function_fc6931fb1a544e26();
        }
        
        level utility::waittill_any( "timetravel_done", "open_sesame" );
    }
}

// Namespace namespace_4ce8ccb0ce5a23f6
// Params 2
// Checksum 0xf8ac8ac3, Offset: 0x186
// Size: 0x25
function cleanup( skipped, save_restored )
{
    namespace_a7211835085600d5::clear_objective_marks( #"mantis_pap_quest" );
}

// Namespace namespace_4ce8ccb0ce5a23f6
// Params 0
// Checksum 0x19ba2f1a, Offset: 0x1b3
// Size: 0xb1
function function_fc6931fb1a544e26()
{
    utility::flag_wait( #"hash_5781048c343b252d" );
    data = level.mantis_pap_quest.var_3103c6b8d6bd7150;
    
    if ( time_travel::get_current_timeline().name == "past" )
    {
        return;
    }
    
    level utility::flag_waitopen( "timetravel_ongoing" );
    closest_timewarp = namespace_24edb5d87524aa7f::get_closest_timewarp( data.current_timeline.origin );
    
    if ( !level zm_sat_mantis::function_80daf2f20b4e6e6d() && isdefined( closest_timewarp ) )
    {
        namespace_a7211835085600d5::add_objective_mark( #"mantis_pap_quest", closest_timewarp.origin, "papq_timewarp", 110 );
    }
}

