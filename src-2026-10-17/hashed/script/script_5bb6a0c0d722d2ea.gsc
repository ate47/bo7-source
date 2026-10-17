#using script_15ce43f40ea0fd2b;
#using scripts\common\scene;
#using scripts\common\utility;

#namespace ob_zombie_destruction;

// Namespace ob_zombie_destruction
// Params 4
// Checksum 0xc0e5c055, Offset: 0x9e
// Size: 0x1f7
function function_887430a227947d29( scriptable, attractor_team, destroy_time, var_5d734d0da2864457 )
{
    attractor_slots = scriptable utility::get_linked_structs();
    attractor = zombie_attractor_manager::add_attractor( scriptable, undefined, undefined, 1, undefined, undefined, 0, attractor_team );
    zombie_attractor_manager::set_attractor_slots( attractor, attractor_slots );
    
    foreach ( slot in attractor_slots )
    {
        level thread function_de8be5aba2bf9781( slot );
    }
    
    attractor.var_f5851b55e83fd222 = 0;
    
    while ( attractor.var_f5851b55e83fd222 < destroy_time )
    {
        wait 1;
        
        if ( !function_df2f91d99e311918( attractor ) )
        {
            attractor.var_f5851b55e83fd222 = 0;
            continue;
        }
        
        attractor.var_f5851b55e83fd222++;
    }
    
    if ( isdefined( var_5d734d0da2864457 ) )
    {
        [[ var_5d734d0da2864457 ]]( scriptable, attractor );
        return;
    }
    
    zombie_attractor_manager::remove_attractor( scriptable );
    scriptable setscriptablepartstate( "base", "dead" );
    
    foreach ( slot in attractor.attractor_slots )
    {
        if ( isdefined( slot.target ) )
        {
            scene_struct = utility::getstruct( slot.target, "targetname" );
            scene_struct thread scene::play( slot.assigned_ai, "shot_1" );
        }
    }
}

// Namespace ob_zombie_destruction
// Params 1, eflags: 0x4
// Checksum 0x270e8069, Offset: 0x29d
// Size: 0xa8, Type: bool
function private function_df2f91d99e311918( attractor )
{
    num_slots_filled = 0;
    
    foreach ( slot in attractor.attractor_slots )
    {
        num_slots_filled += slot.is_filled;
    }
    
    return num_slots_filled >= attractor.attractor_slots.size;
}

// Namespace ob_zombie_destruction
// Params 1, eflags: 0x4
// Checksum 0x7c2a1ee8, Offset: 0x34e
// Size: 0x6a
function private function_de8be5aba2bf9781( slot )
{
    slot.is_filled = 0;
    
    while ( isdefined( slot ) )
    {
        slot.is_filled = isdefined( slot.assigned_ai ) && distancesquared( slot.assigned_ai.origin, slot.origin ) < squared( 50 );
        waitframe();
    }
}

