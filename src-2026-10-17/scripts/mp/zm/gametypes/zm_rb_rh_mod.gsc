#using script_25a8fa2ac8997425;
#using scripts\common\system;
#using scripts\common\utility;
#using scripts\mp\currency;

#namespace zm_rb_rh_mod;

// Namespace zm_rb_rh_mod
// Params 0, eflags: 0x5
// Checksum 0x6806a62c, Offset: 0xfb
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"zm_rb_rh_mod", undefined, &preinit, undefined );
}

// Namespace zm_rb_rh_mod
// Params 0
// Checksum 0x2fc10369, Offset: 0x11c
// Size: 0x49
function preinit()
{
    utility::registersharedfunc( #"zm_rb_rh_mod", #"main", &main );
    utility::flag_set( "zm_rb_rh_mod_initialized" );
    level._effect[ #"gun_disappear" ] = loadfxasset( "vfx_t10_gameplay_zm_magic_box_bunny_rarity_white_disappear" );
}

// Namespace zm_rb_rh_mod
// Params 0
// Checksum 0x8e9f47a0, Offset: 0x16d
// Size: 0x20
function main()
{
    utility::registersharedfunc( #"perk_machine", #"hash_e863dfdfdb696446", &function_98693801f9b82fe3 );
}

// Namespace zm_rb_rh_mod
// Params 4
// Checksum 0x16b84e15, Offset: 0x195
// Size: 0x172
function function_98693801f9b82fe3( usable, perk_root, perk_cost, hint_data )
{
    level.var_ea5fb2ecb092a34e = 1;
    perk_cost = zombie_perks::function_77331fd62580dd0a();
    level.var_ea5fb2ecb092a34e = 0;
    
    if ( currency::can_afford( currency::get_perk_machine_currency( usable.script_notify ), perk_cost ) )
    {
        hint_data.aux_text = undefined;
        hint_data.interactable = 1;
        hint_data.icon_text = &"shared_hintstrings/cost_essence";
    }
    else
    {
        hint_data.aux_text = &"shared_hintstrings/not_enough_essence";
        hint_data.icon_text = &"shared_hintstrings/cost_essence_not_enough";
        hint_data.interactable = 0;
    }
    
    override_data = { #interactable:hint_data.interactable, #aux_text:hint_data.aux_text, #icon_text_value:perk_cost, #icon_text:hint_data.icon_text, #buttoncallout:hint_data.buttoncallout, #icon:"jup_ui_map_icon_mr_peeks", #description:&"ZM_SAT_RH/RH_PC_DESC", #title:&"ZM_SAT_RH/RH_WF_TITLE", #type:"HINT_BUTTON" };
    return override_data;
}

