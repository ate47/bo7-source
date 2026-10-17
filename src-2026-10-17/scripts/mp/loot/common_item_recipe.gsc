#using scripts\common\system;
#using scripts\mp\loot\common_item;

#namespace common_item_recipe;

// Namespace common_item_recipe
// Params 0, eflags: 0x5
// Checksum 0x5405241b, Offset: 0x80
// Size: 0x21
function private autoexec __init__system__()
{
    system::register( #"item_recipe", #"common_item", &init_item_recipe, undefined );
}

// Namespace common_item_recipe
// Params 0
// Checksum 0x454406f6, Offset: 0xa9
// Size: 0x67
function init_item_recipe()
{
    if ( !common_item::items_isenabled() )
    {
        return;
    }
    
    common_item::function_4b30c091d3b04a25( "recipe" );
    common_item::function_84174b793b5fe9a7( "recipe", #"use", &use_recipe );
    common_item::function_84174b793b5fe9a7( "recipe", #"canautouse", &function_edf300bc9ca85484 );
    common_item::function_84174b793b5fe9a7( "recipe", #"canuse", &function_edf300bc9ca85484 );
}

// Namespace common_item_recipe
// Params 4
// Checksum 0x187528a0, Offset: 0x118
// Size: 0x28, Type: bool
function function_edf300bc9ca85484( itembundle, item, auto_use, var_51e0c31d31f04b31 )
{
    return false;
}

// Namespace common_item_recipe
// Params 4
// Checksum 0x552bb10b, Offset: 0x149
// Size: 0x28, Type: bool
function use_recipe( itembundle, item, autouse, var_981c264073bf1154 )
{
    return false;
}

