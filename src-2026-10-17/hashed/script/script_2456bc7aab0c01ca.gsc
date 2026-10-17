#using script_35efc59124dbb5db;
#using scripts\common\callbacks;
#using scripts\common\utility;
#using scripts\mp\battlechatter_mp;
#using scripts\mp\zm\systems\zm_quest;

#namespace namespace_50685f569b0b612f;

// Namespace namespace_50685f569b0b612f
// Params 0
// Checksum 0x2c2d34a8, Offset: 0x13e
// Size: 0x6e
function init()
{
    level callback::add( #"player_connect", &on_player_connect );
    data = { #ww_part:undefined, #ww_spawn_node:utility::getstruct( "ww_quest_step_4_spawn_node_sealant", "script_noteworthy" ) };
    level.mantis_ww_quest.step_4 = data;
    utility::flag_set( #"hash_20d381cbe3fbbfa6" );
}

// Namespace namespace_50685f569b0b612f
// Params 1, eflags: 0x4
// Checksum 0x264138b, Offset: 0x1b4
// Size: 0x1d
function private on_player_connect( params )
{
    callback::add( "quest_item_used", &function_f9b91f79e464401b );
}

// Namespace namespace_50685f569b0b612f
// Params 2
// Checksum 0xa4bc5915, Offset: 0x1d9
// Size: 0x44
function execute( skipped, save_restored )
{
    utility::flag_wait( #"hash_20d381cbe3fbbfa6" );
    
    if ( skipped || save_restored )
    {
        return;
    }
    
    function_591a2574e03cc020();
    utility::flag_wait( "ww_part_sealant_picked_up" );
}

// Namespace namespace_50685f569b0b612f
// Params 2
// Checksum 0x3b6d7343, Offset: 0x225
// Size: 0x33
function cleanup( skipped, save_restored )
{
    zm_quest::function_b57dfe9625966b0b( #"mantis_ww_quest", 0, #"sat_zm_quest_mantis_wwq_sealant", 1, 1 );
}

// Namespace namespace_50685f569b0b612f
// Params 0, eflags: 0x4
// Checksum 0x3050d268, Offset: 0x260
// Size: 0xa2
function private function_591a2574e03cc020()
{
    quest_data = level.mantis_ww_quest.step_4;
    spawn_node = quest_data.ww_spawn_node;
    
    if ( !isdefined( spawn_node ) )
    {
        return;
    }
    
    quest_data.ww_part = zm_quest::spawn_quest_item( spawn_node.origin, spawn_node.angles, getscriptbundle( %"hash_6fbf66ac1435cd77" ) );
    utility::flag_set( "ww_part_sealant_setup" );
    
    if ( zm_quest::function_b0a5181ebe7bb905() )
    {
        quest_data.ww_part setscriptablepartstate( "sat_zm_mantis_ww_part_sealant", "usable_hint" );
    }
}

// Namespace namespace_50685f569b0b612f
// Params 1, eflags: 0x4
// Checksum 0xbc8c890a, Offset: 0x30a
// Size: 0x7d
function private function_f9b91f79e464401b( params )
{
    if ( params.scriptable != level.mantis_ww_quest.step_4.ww_part )
    {
        return;
    }
    
    zm_quest::show_splash_item_picked_up( #"mantis_ww_quest", #"sat_zm_quest_mantis_wwq_sealant", 1, self );
    utility::flag_set( "ww_part_sealant_picked_up" );
    level thread battlechatter_mp::trysaylocalsound( params.player, #"hash_5212ed7ec42f115a" );
}

// Namespace namespace_50685f569b0b612f
// Params 0
// Checksum 0x8d102f8e, Offset: 0x38f
// Size: 0x10e, Type: bool
function function_bcdd8958faa3f63b()
{
    if ( zm_quest::is_quest_step_complete( #"mantis_ww_quest", #"hash_8f874c86ba6e603d" ) )
    {
        return false;
    }
    
    self endon( #"hash_2c4eefaf7e2b24b6" );
    utility::flag_wait( "ww_part_sealant_setup" );
    quest_data = level.mantis_ww_quest.step_4;
    
    if ( !utility::flag( "ww_part_sealant_picked_up" ) )
    {
        thread zm_quest::update_guidance( undefined, #"hash_4670d9548e1da722", #"hash_5246414867487154", 1 );
        namespace_a7211835085600d5::add_objective_mark( #"hash_4670d9548e1da722", quest_data.ww_part.origin, "wwq_mark_sealant", 10, 1, { #timetravel_step:{ #future:#"hash_13c1630bcde247b6", #past:#"hash_5d0e2eca82d48d3d" }, #current_step:#"hash_5246414867487154" } );
        utility::flag_wait( "ww_part_sealant_picked_up" );
    }
    
    namespace_a7211835085600d5::clear_objective_marks( #"hash_4670d9548e1da722" );
    return true;
}

