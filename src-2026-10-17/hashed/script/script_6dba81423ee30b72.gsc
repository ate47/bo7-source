#using script_35efc59124dbb5db;
#using scripts\common\callbacks;
#using scripts\common\utility;
#using scripts\mp\destructibles\destructibles;
#using scripts\mp\destructibles\destructibles_actions;
#using scripts\mp\loot\common_item;
#using scripts\mp\zm\systems\zm_quest;
#using scripts\mp\zm\systems\zm_vo;

#namespace retrieve_the_barrel;

// Namespace retrieve_the_barrel
// Params 0
// Checksum 0x9b7af189, Offset: 0x1ae
// Size: 0x55
function init()
{
    level callback::add( #"player_connect", &on_player_connect );
    data = { #selected_cyst:undefined };
    level.mantis_ww_quest.step_2 = data;
    utility::flag_set( #"hash_acbe8f1dccca6cf6" );
}

// Namespace retrieve_the_barrel
// Params 1, eflags: 0x4
// Checksum 0x9ea6f8db, Offset: 0x20b
// Size: 0x1d
function private on_player_connect( params )
{
    callback::add( "quest_item_used", &function_f9b91f79e464401b );
}

// Namespace retrieve_the_barrel
// Params 2
// Checksum 0x52bf56e, Offset: 0x230
// Size: 0x44
function execute( skipped, save_restored )
{
    utility::flag_wait( #"hash_acbe8f1dccca6cf6" );
    
    if ( skipped || save_restored )
    {
        return;
    }
    
    setup_cyst();
    utility::flag_wait( "ww_part_barrel_picked_up" );
}

// Namespace retrieve_the_barrel
// Params 2
// Checksum 0x7c7c026d, Offset: 0x27c
// Size: 0x33
function cleanup( skipped, save_restored )
{
    zm_quest::function_b57dfe9625966b0b( #"mantis_ww_quest", 0, #"sat_zm_quest_mantis_wwq_barrel", 1, 1 );
}

// Namespace retrieve_the_barrel
// Params 0, eflags: 0x4
// Checksum 0x1a575584, Offset: 0x2b7
// Size: 0x167
function private setup_cyst()
{
    destructible::waittill_ready( "sat_destructible_souleater_cyst_01" );
    random_seed = utility::callsharedfunc( #"zombie", #"get_persistent_random_seed" ) ?? randomint( 10 );
    cysts = destructible::function_c28a5f35d1a84d43( "sat_destructible_souleater_cyst_01" );
    cysts = arraysort( cysts, undefined, &namespace_a7211835085600d5::function_47c84fef8317b8f1 );
    cysts = utility::function_40662075b6c8798c( cysts, random_seed );
    
    foreach ( cyst in cysts )
    {
        if ( !cyst destructible::is_hidden() )
        {
            cyst destructible::remove_action( "destructible_destruction", destructible_actions::get_action( #"spawn_loot" ) );
            cyst destructible::add_action( "destructible_destruction", { #execute:&function_f20d47192d6eabe6 } );
            cyst setscriptablepartstate( "style", "wwq" );
            waitframe();
            cyst destructible::spawn();
            cyst spawn_hint();
            level.mantis_ww_quest.step_2.selected_cyst = cyst;
            utility::flag_set( "ww_part_barrel_setup" );
            return;
        }
    }
}

// Namespace retrieve_the_barrel
// Params 1, eflags: 0x4
// Checksum 0x2ac0f2dc, Offset: 0x426
// Size: 0x1a6
function private function_f20d47192d6eabe6( params )
{
    vector_right = anglestoright( self.angles ) * ( 0, 100, 0 )[ 0 ];
    vector_forward = anglestoforward( self.angles ) * ( 0, 100, 0 )[ 1 ];
    vector_up = anglestoup( self.angles ) * ( 0, 100, 0 )[ 2 ];
    spawn_vector = vector_right + vector_forward + vector_up;
    spawn_target_position = utility::drop_to_ground( self.origin + spawn_vector, 1 );
    spawn_target_position = getclosestpointonnavmesh( spawn_target_position );
    spawn_options = common_item::function_b94327aa4c1b718b( spawn_target_position, self );
    spawn_options.var_fd47e835523b473f = 1;
    spawn_options.critical = 1;
    item_bundle = getscriptbundle( %"hash_7dd2b6e20379520f" );
    level.mantis_ww_quest.step_2.ww_part = level common_item::function_61c2c0251e742ffd( item_bundle, 1, spawn_options );
    destructible::remove_action( "destructible_destruction", { #execute:&function_f20d47192d6eabe6 } );
    destructible::add_action( "destructible_destruction", destructible_actions::get_action( #"spawn_loot" ) );
    despawn_hint();
    wait 1;
    self setscriptablepartstate( "style", "default" );
    level.mantis_ww_quest.step_2.selected_cyst = undefined;
    level notify( #"hash_641341387705d5c7" );
}

// Namespace retrieve_the_barrel
// Params 1, eflags: 0x4
// Checksum 0x56605c21, Offset: 0x5d4
// Size: 0x85
function private function_f9b91f79e464401b( params )
{
    if ( params.scriptable != level.mantis_ww_quest.step_2.ww_part )
    {
        return;
    }
    
    zm_quest::show_splash_item_picked_up( #"mantis_ww_quest", #"sat_zm_quest_mantis_wwq_barrel", 1, self );
    utility::flag_set( "ww_part_barrel_picked_up" );
    params.player thread zm_vo::function_8c1a12974bd11f01( #"hash_d079ad55a1a5d1f4", #"bc_flavor_player_positive" );
}

// Namespace retrieve_the_barrel
// Params 0, eflags: 0x4
// Checksum 0xcdbfa289, Offset: 0x661
// Size: 0xa9
function private spawn_hint()
{
    if ( !isdefined( level.mantis_ww_quest.step_2.hint ) )
    {
        hint_location = self.origin + anglestoforward( self.angles ) * 20;
        var_8bef195d99a98568 = spawnscriptable( "sat_zm_mantis_ww_part_barrel", hint_location );
        var_8bef195d99a98568 setscriptablepartstate( var_8bef195d99a98568.type, "hint" );
        thread namespace_a7211835085600d5::function_d5a2c6e5a0e2040e( var_8bef195d99a98568, "mantis_item_hint_light_barrel", "mantis_item_hint_medium_barrel" );
        level.mantis_ww_quest.step_2.hint = var_8bef195d99a98568;
    }
}

// Namespace retrieve_the_barrel
// Params 0, eflags: 0x4
// Checksum 0x545e8d4b, Offset: 0x712
// Size: 0x62
function private despawn_hint()
{
    if ( isdefined( level.mantis_ww_quest.step_2.hint ) )
    {
        level.mantis_ww_quest.step_2.hint freescriptable();
        level.mantis_ww_quest.step_2.hint = undefined;
    }
}

// Namespace retrieve_the_barrel
// Params 0
// Checksum 0xc8af43e7, Offset: 0x77c
// Size: 0x1c5, Type: bool
function function_bcdd8958faa3f63b()
{
    if ( zm_quest::is_quest_step_complete( #"mantis_ww_quest", #"hash_fb9fc3d20170d9ad" ) )
    {
        return false;
    }
    
    self endon( #"hash_2c4eefaf7e2b24b6" );
    utility::flag_wait( "ww_part_barrel_setup" );
    quest_data = level.mantis_ww_quest.step_2;
    
    if ( isdefined( quest_data.selected_cyst ) )
    {
        thread zm_quest::update_guidance( undefined, #"hash_4670d9548e1da722", #"hash_14f861cf21a773b6", 1 );
        namespace_a7211835085600d5::add_objective_mark( #"hash_4670d9548e1da722", quest_data.selected_cyst.origin, "wwq_mark_loot_cyst", 30, 1, { #timetravel_step:{ #future:#"hash_13c1630bcde247b6", #past:#"hash_5d0e2eca82d48d3d" }, #current_step:#"hash_14f861cf21a773b6" } );
        level waittill( #"hash_641341387705d5c7" );
    }
    
    namespace_a7211835085600d5::clear_objective_marks( #"hash_4670d9548e1da722" );
    
    if ( !utility::flag( "ww_part_barrel_picked_up" ) )
    {
        thread zm_quest::update_guidance( undefined, #"hash_4670d9548e1da722", #"hash_14f860cf21a77203", 1 );
        namespace_a7211835085600d5::add_objective_mark( #"hash_4670d9548e1da722", quest_data.ww_part.origin, "wwq_mark_barrel", 15, 1, { #timetravel_step:{ #future:#"hash_13c1630bcde247b6", #past:#"hash_5d0e2eca82d48d3d" }, #current_step:#"hash_14f860cf21a77203" } );
        utility::flag_wait( "ww_part_barrel_picked_up" );
    }
    
    namespace_a7211835085600d5::clear_objective_marks( #"hash_4670d9548e1da722" );
    return true;
}

