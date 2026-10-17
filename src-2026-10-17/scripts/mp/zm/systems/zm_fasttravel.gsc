#using script_1a6a1f7bdb57d7ff;
#using script_2bf5529af94c9a0;
#using script_2dc181cb271d2cb2;
#using script_376710f138a3aae7;
#using script_49e4a4c208f44b76;
#using script_4f9ce8d249a99f4a;
#using scripts\common\callbacks;
#using scripts\common\devgui;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\common\vehicle;
#using scripts\common\vehicle_occupancy;
#using scripts\mp\compass;
#using scripts\mp\currency;
#using scripts\mp\interaction;
#using scripts\mp\laststand;
#using scripts\mp\playerlogic;
#using scripts\mp\supers;
#using scripts\mp\zm\zm_player;

#namespace zm_fasttravel;

// Namespace zm_fasttravel
// Params 0
// Checksum 0x46e9e3ee, Offset: 0x7e4
// Size: 0x66
function pre_init()
{
    level._effect[ "vfx_portal" ] = loadfxasset( "vfx_t10_levels_zm_garnet_aether_squall_gateway_portal_air" );
    level._effect[ "vfx_player_screen_distortion" ] = loadfxasset( "vfx_jup_ob_gameplay_zm_screen_elec_shock_bot" );
    level._effect[ "wormhole_vfx" ] = loadfxasset( "vfx_t10_gameplay_zm_aether_tear_portal_tunnel_1p" );
    setdvarifuninitialized( @"hash_f6d3570dc7b0b026", 0 );
    
    /#
        init_fasttravel_debug();
    #/
}

// Namespace zm_fasttravel
// Params 0
// Checksum 0xeb7bb439, Offset: 0x852
// Size: 0x60
function post_init()
{
    var_75ef6540d6776b8a = utility::getstructarray( "fasttravel_trigger", "targetname" );
    
    if ( var_75ef6540d6776b8a.size == 0 )
    {
        return;
    }
    
    if ( !isdefined( level.var_de80e4d906c4001 ) )
    {
        level.var_de80e4d906c4001 = [];
    }
    
    level._fasttravel[ "override_player_can_use_fasttravel" ] = &can_use_fasttravel;
    utility::array_thread( var_75ef6540d6776b8a, &init_fasttravel_trigger );
}

// Namespace zm_fasttravel
// Params 0
// Checksum 0x971aafbb, Offset: 0x8ba
// Size: 0x6a6
function init_fasttravel_trigger()
{
    level endon( #"game_ended" );
    self.script_cost = int( self.script_cost ?? 500 );
    assert( isdefined( self.script_cost ), "<dev string:x24>" );
    self.power_on_flag = self.script_power;
    self.str_destination_loc = self.script_string;
    assert( isdefined( self.str_destination_loc ), "<dev string:x4a>" );
    self.str_start_loc = self.script_noteworthy;
    assert( isdefined( self.str_start_loc ), "<dev string:x77>" );
    self.var_7627c2f13d3345b4 = self.script_timeout;
    self.var_9cccc5f9f7f1786e = self.script_parameters;
    self.var_f0e4330fc19232d3 = self.script_flag_waitopen;
    self.activator_set_flag = self.script_flag_set;
    
    if ( self.script_oneway )
    {
        return;
    }
    
    waitframe();
    
    if ( !isdefined( self.angles ) )
    {
        self.angles = ( 0, 0, 0 );
    }
    
    if ( isdefined( self.script_label ) )
    {
        if ( self.script_label == "fasttravel_teleport" )
        {
            self.fasttravel_scr = spawnscriptable( "teleport_portal_zm_t10", self.origin + ( 0, 0, -50 ), self.angles );
        }
        else if ( self.script_label == "fasttravel_other" )
        {
            self.fasttravel_scr = spawnscriptable( "fasttravel_zm_t10", self.origin, self.angles );
        }
        else if ( self.script_label == "fasttravel_teleport_no_z_offset" )
        {
            self.fasttravel_scr = spawnscriptable( "teleport_portal_zm_t10_nofx", self.origin, self.angles );
        }
        else if ( self.script_label == "fasttravel_teleport_red" )
        {
            self.fasttravel_scr = spawnscriptable( "teleport_portal_zm_t10_red", self.origin, self.angles );
        }
        else if ( self.script_label == "fasttravel_teleport_red_topaz" )
        {
            self.fasttravel_scr = spawnscriptable( "teleport_portal_zm_t10_red_topaz", self.origin, self.angles + ( 90, 90, 0 ) );
        }
        else if ( self.script_label == "fasttravel_slide" )
        {
            self.fasttravel_scr = spawnscriptable( "t10_zm_fasttravel_slide_switch", self.origin, self.angles );
        }
        else if ( self.script_label == "aether_elevator" )
        {
            if ( isdefined( self.script_int ) )
            {
                spawn_pos = self.origin + ( 0, 0, self.script_int );
            }
            
            if ( !isdefined( spawn_pos ) )
            {
                spawn_pos = self.origin;
            }
            
            self.fasttravel_scr = spawnscriptable( "aether_elevator_portal", spawn_pos, self.angles );
            self.var_79d2167bbb401dc5 = &zm_fasttravel_aether_elevator::aether_elevator_use;
            self.fasttravel_title = &"shared_hintstrings/fasttravel_title_aether_elevator";
            self.button_callout = &"shared_hintstrings/fasttravel_button_callout_aether_elevator";
            self.fasttravel_icon = "ui_icon_zm_ping_all_other_fast_travel";
            self.var_2c4977ec6a51435e = 1;
        }
        else if ( self.script_label == "fasttravel_jtp" )
        {
            self.fasttravel_title = &"shared_hintstrings/fasttravel_teleporter_title";
            self.fasttravel_icon = "ui_icon_zm_ping_fast_travel_teleportation_and_portals";
            self.var_2c4977ec6a51435e = 1;
            self.fasttravel_scr = spawnscriptable( "teleport_portal_zm_t10_jade", self.origin, self.angles ?? ( 0, 0, 0 ) );
        }
    }
    
    if ( !level.var_d0d269eb33cf821d )
    {
        if ( !self.script_fxstop )
        {
            self.vfx = spawnscriptable( "teleport_portal_zm_t10", self.origin + ( 0, 0, -50 ), self.angles );
        }
    }
    
    if ( !isdefined( self.fasttravel_scr ) )
    {
        self.fasttravel_scr = spawnscriptable( "teleport_portal_zm_t10", self.origin + ( 0, 0, -50 ), self.angles );
    }
    
    if ( isdefined( self.fasttravel_scr ) )
    {
        self.fasttravel_scr setscriptablepartstate( "base", "idle" );
        utility::callsharedfunc( #"scriptable", #"setminimapfloor", self.fasttravel_scr, "icon" );
    }
    
    if ( isdefined( self.script_flag_wait ) )
    {
        if ( self.script_label == "aether_elevator" )
        {
            self.fasttravel_scr setscriptablepartstate( "base", "shut_down" );
        }
        
        utility::flag_wait( self.script_flag_wait );
        
        if ( self.script_label == "aether_elevator" )
        {
            self.fasttravel_scr setscriptablepartstate( "base", "idle" );
        }
    }
    
    interact_loc = self.origin;
    override_interact_loc = utility::getstruct( self.script_noteworthy, "targetname" );
    
    if ( isdefined( override_interact_loc ) && override_interact_loc.script_noteworthy == "interact_override" )
    {
        interact_loc = override_interact_loc.origin;
    }
    
    self.interact = interaction::register_interact( interact_loc, 96, &function_868501bd7c06243d );
    self.interact interaction::set_interact_hint_callback( &setup_fasttravel_hintstring );
    self.interact.s_fasttravel = self;
    self.interact.var_2efb9165f56da06d = 1;
    
    if ( self.fasttravel_title )
    {
        self.interact.fasttravel_title = self.fasttravel_title;
    }
    
    if ( self.fasttravel_icon )
    {
        self.interact.fasttravel_icon = self.fasttravel_icon;
    }
    
    if ( isdefined( level.var_296388b5b54fbeda ) )
    {
        self.interact.fasttravel_title = level.var_296388b5b54fbeda;
    }
    
    if ( isdefined( self.script_modelname ) )
    {
        self.mdl_switch = utility::spawn_model( self.script_modelname, self.origin, self.angles );
    }
    
    self notify( #"hash_47166466b62f3fc3" );
    wait 1;
    
    if ( self.interact isusable() )
    {
        self.interact sethintonobstruction( "show" );
    }
}

// Namespace zm_fasttravel
// Params 2
// Checksum 0xd2270376, Offset: 0xf68
// Size: 0xf38
function setup_fasttravel_hintstring( usable, player )
{
    fasttravel_title = usable.fasttravel_title ?? &"shared_hintstrings/fasttravel_title";
    fasttravel_icon = usable.fasttravel_icon ?? "ui_icon_zm_ping_fast_travel_teleportation_and_portals";
    
    if ( isdefined( usable.fasttravel_interact_hint_callback ) )
    {
        result = [[ usable.fasttravel_interact_hint_callback ]]( usable, player );
        
        if ( isdefined( result ) )
        {
            return result;
        }
    }
    
    if ( isdefined( player ) && ( player.interactions_disabled || player isemoteactive() || level.disable_fasttravel ) || player isparachuting() || player.fasttravel_disabled )
    {
        button_callout = usable.s_fasttravel.button_callout ?? &"shared_hintstrings/hint_buy";
        return { #interactable:0, #buttoncallout:button_callout, #icon_text:&"shared_hintstrings/cost_essence", #icon:fasttravel_icon, #description:&"shared_hintstrings/fasttravel_desc", #title:fasttravel_title, #string:&"", #type:"HINT_NOICON" };
    }
    
    if ( isdefined( usable.s_fasttravel.b_offline ) )
    {
        str_desc = &"shared_hintstrings/fasttravel_desc_free_destination";
        
        if ( isdefined( level.var_dbf4aebec6a6c1d6 ) )
        {
            str_desc = [[ level.var_dbf4aebec6a6c1d6 ]]( usable.s_fasttravel );
        }
        
        display_name = undefined;
        
        if ( isdefined( usable.s_fasttravel.var_9cccc5f9f7f1786e ) )
        {
            display_name = level.var_de80e4d906c4001[ usable.s_fasttravel.var_9cccc5f9f7f1786e ];
        }
        
        button_callout = usable.s_fasttravel.button_callout ?? &"shared_hintstrings/fasttravel_desc";
        return { #interactable:0, #aux_text:&"shared_hintstrings/fasttravel_desc_offline", #buttoncallout:button_callout, #icon:fasttravel_icon, #description:str_desc, #title:fasttravel_title, #params:[ display_name ], #string:&"shared_hintstrings/fasttravel_free_destination", #type:"HINT_BUTTON" };
    }
    
    if ( isdefined( usable.s_fasttravel.power_on_flag ) && !utility::flag( usable.s_fasttravel.power_on_flag ) )
    {
        if ( isdefined( usable.s_fasttravel.script_name ) )
        {
            if ( isdefined( usable.s_fasttravel.str_desc ) )
            {
                str_desc = usable.s_fasttravel.str_desc;
            }
        }
        else
        {
            str_desc = &"";
        }
        
        if ( usable.s_fasttravel.script_label === "fasttravel_teleport_red" )
        {
            return { #var_26bbd300351fde34:0, #title:&"", #string:&"", #type:"HINT_NOBUTTON" };
        }
        
        button_callout = usable.s_fasttravel.button_callout ?? &"shared_hintstrings/hint_buy";
        return { #interactable:0, #aux_text:&"shared_hintstrings/fasttravel_desc_need_power", #buttoncallout:button_callout, #icon_text_value:usable.s_fasttravel.script_cost, #icon_text:&"shared_hintstrings/cost_essence", #icon:"ui_icon_zm_ping_all_other_fast_travel", #description:str_desc, #title:fasttravel_title, #params:[ usable.s_fasttravel.script_cost ], #string:&"shared_hintstrings/fasttravel_need_power", #type:"HINT_BUTTON" };
    }
    
    if ( isdefined( usable.s_fasttravel.var_f0e4330fc19232d3 ) && !utility::flag( usable.s_fasttravel.var_f0e4330fc19232d3 ) )
    {
        return { #interactable:0, #icon:fasttravel_icon, #aux_text:&"shared_hintstrings/fasttravel_desc_need_activation", #description:usable.s_fasttravel.str_desc ?? &"", #title:fasttravel_title, #type:"HINT_BUTTON" };
    }
    
    if ( !usable.var_2efb9165f56da06d )
    {
        button_callout = usable.s_fasttravel.button_callout ?? &"shared_hintstrings/hint_buy";
        return { #interactable:0, #buttoncallout:button_callout, #icon_text:&"shared_hintstrings/cost_essence", #icon:fasttravel_icon, #description:&"hash_7eb7774b8fee285a", #title:fasttravel_title, #string:&"hash_5995d0d7f3fb4f04", #type:"HINT_NOBUTTON" };
    }
    
    if ( isarray( usable.var_b8b1708ca1ae7d42 ) )
    {
        foreach ( info in usable.var_b8b1708ca1ae7d42 )
        {
            if ( info.player == player )
            {
                find = info;
                break;
            }
        }
        
        if ( find )
        {
            if ( isdefined( usable.s_fasttravel.script_name ) )
            {
                if ( isdefined( usable.s_fasttravel.str_desc ) )
                {
                    str_desc = usable.s_fasttravel.str_desc;
                }
            }
            else
            {
                str_desc = &"";
            }
            
            fasttravel_icon_text = undefined;
            var_7b7340bd917b705c = undefined;
            
            if ( find.current_cooldown_time >= 0 )
            {
                fasttravel_icon_text = &"shared_hintstrings/fasttravel_cooldown_time";
                var_7b7340bd917b705c = find.current_cooldown_time;
            }
            
            if ( isdefined( level.var_296388b5b54fbeda ) )
            {
                button_callout = usable.s_fasttravel.button_callout ?? &"shared_hintstrings/hint_buy";
                return { #interactable:0, #aux_text:&"shared_hintstrings/gateway_desc_cooling_down", #buttoncallout:button_callout, #icon_text_value:var_7b7340bd917b705c, #icon_text:fasttravel_icon_text, #icon:fasttravel_icon, #description:str_desc, #title:fasttravel_title, #params:[ usable.s_fasttravel.script_cost ], #string:&"shared_hintstrings/gateway_desc_cooling_down", #type:"HINT_BUTTON" };
            }
            else
            {
                fasttravel_icon = usable.fasttravel_icon ?? "ui_icon_zm_ping_all_other_fast_travel";
                fasttravel_icon_text = &"shared_hintstrings/cost_essence";
                var_7b7340bd917b705c = usable.s_fasttravel.script_cost;
                
                if ( find.current_cooldown_time >= 0 )
                {
                    fasttravel_icon_text = &"shared_hintstrings/fasttravel_cooldown_time";
                    var_7b7340bd917b705c = find.current_cooldown_time;
                }
                
                button_callout = usable.s_fasttravel.button_callout ?? &"shared_hintstrings/hint_buy";
                return { #interactable:0, #aux_text:&"shared_hintstrings/fasttravel_desc_cooling_down", #buttoncallout:button_callout, #icon_text_value:var_7b7340bd917b705c, #icon_text:fasttravel_icon_text, #icon:fasttravel_icon, #description:str_desc, #title:fasttravel_title, #params:[ usable.s_fasttravel.script_cost ], #string:&"shared_hintstrings/fasttravel_desc_cooling_down", #type:"HINT_BUTTON" };
            }
        }
    }
    
    display_name = undefined;
    
    if ( isdefined( usable.s_fasttravel.var_9cccc5f9f7f1786e ) )
    {
        display_name = level.var_de80e4d906c4001[ usable.s_fasttravel.var_9cccc5f9f7f1786e ];
    }
    
    if ( usable.s_fasttravel.script_cost != 0 )
    {
        aux_text = &"";
        b_interactable = 1;
        
        if ( !player currency::can_afford( #"essence", usable.s_fasttravel.script_cost ) )
        {
            aux_text = &"shared_hintstrings/not_enough_essence";
            b_interactable = 0;
            
            if ( usable.s_fasttravel.var_1429532bd1d01303 && player currency::can_afford( #"essence", int( usable.s_fasttravel.script_cost / 2 ) ) )
            {
                aux_text = &"";
                b_interactable = 1;
            }
        }
        
        if ( isdefined( display_name ) )
        {
            button_callout = usable.s_fasttravel.button_callout ?? &"shared_hintstrings/hint_buy";
            return { #interactable:b_interactable, #aux_text:aux_text, #buttoncallout:button_callout, #icon_text_value:usable.s_fasttravel.script_cost, #icon_text:&"shared_hintstrings/cost_essence", #icon:fasttravel_icon, #description:&"shared_hintstrings/fasttravel_desc_destination", #title:fasttravel_title, #params:[ usable.s_fasttravel.script_cost, display_name ], #string:&"shared_hintstrings/fasttravel_destination", #type:"HINT_BUTTON" };
        }
        
        if ( usable.s_fasttravel.script_noteworthy == "fasttravel_oub_start" )
        {
            button_callout = usable.s_fasttravel.button_callout ?? &"shared_hintstrings/hint_buy";
            return { #interactable:b_interactable, #aux_text:aux_text, #buttoncallout:button_callout, #icon_text_value:usable.s_fasttravel.script_cost, #icon_text:&"shared_hintstrings/cost_essence", #icon:"ui_icon_zm_ping_all_other_fast_travel", #description:&"shared_hintstrings/fasttravel_desc_slide", #title:fasttravel_title, #params:[ usable.s_fasttravel.script_cost ], #string:&"shared_hintstrings/fasttravel_slide", #type:"HINT_BUTTON" };
        }
        
        if ( usable.s_fasttravel.script_noteworthy == "fasttravel_cannon_interact" )
        {
            fasttravel_icon = "ui_icon_zm_ping_all_other_fast_travel";
            str_desc = usable.s_fasttravel.desc_string ?? &"shared_hintstrings/fasttravel_desc_launch";
        }
        else if ( isdefined( usable.s_fasttravel.script_name ) )
        {
            if ( isdefined( usable.s_fasttravel.str_desc ) )
            {
                str_desc = usable.s_fasttravel.str_desc;
            }
        }
        else
        {
            str_desc = &"";
        }
        
        button_callout = usable.s_fasttravel.button_callout ?? &"shared_hintstrings/hint_buy";
        return { #interactable:b_interactable, #aux_text:aux_text, #buttoncallout:button_callout, #icon_text_value:usable.s_fasttravel.script_cost, #icon_text:&"shared_hintstrings/cost_essence", #icon:fasttravel_icon, #description:str_desc, #title:fasttravel_title, #params:[ usable.s_fasttravel.script_cost ], #string:&"shared_hintstrings/fasttravel", #type:"HINT_BUTTON" };
    }
    
    button_callout = usable.s_fasttravel.button_callout ?? &"shared_hintstrings/fasttravel_desc";
    
    if ( isdefined( display_name ) )
    {
        str_desc = &"shared_hintstrings/fasttravel_desc_free_destination";
        
        if ( isdefined( level.var_dbf4aebec6a6c1d6 ) )
        {
            str_desc = [[ level.var_dbf4aebec6a6c1d6 ]]( usable.s_fasttravel );
        }
        
        return { #interactable:1, #buttoncallout:button_callout, #icon:fasttravel_icon, #description:str_desc, #title:fasttravel_title, #params:[ display_name ], #string:&"shared_hintstrings/fasttravel_free_destination", #type:"HINT_BUTTON" };
    }
    
    if ( usable.s_fasttravel.script_noteworthy == "fasttravel_jumppad_interact" )
    {
        str_desc = &"shared_hintstrings/fasttravel_desc_jump_pad";
        
        if ( isdefined( level.var_dbf4aebec6a6c1d6 ) )
        {
            str_desc = [[ level.var_dbf4aebec6a6c1d6 ]]( usable.s_fasttravel );
        }
        
        return { #interactable:1, #buttoncallout:button_callout, #icon:"ui_icon_zm_ping_all_other_fast_travel", #description:str_desc, #title:fasttravel_title, #string:&"shared_hintstrings/fasttravel_jump_pad", #type:"HINT_BUTTON" };
    }
    
    return { #interactable:1, #buttoncallout:button_callout, #icon:fasttravel_icon, #description:&"shared_hintstrings/fasttravel_desc", #title:fasttravel_title, #string:&"shared_hintstrings/fasttravel_free", #type:"HINT_BUTTON" };
}

// Namespace zm_fasttravel
// Params 2
// Checksum 0x1d175d91, Offset: 0x1ea8
// Size: 0x12d, Type: bool
function can_use_fasttravel( player, interact )
{
    if ( player.var_d1c4c78b9fb7d153 || level.disable_fasttravel )
    {
        return false;
    }
    
    if ( isarray( interact.var_b8b1708ca1ae7d42 ) )
    {
        foreach ( info in interact.var_b8b1708ca1ae7d42 )
        {
            if ( info.player == player )
            {
                return false;
            }
        }
    }
    
    if ( isdefined( interact.var_5434f2cd988956b ) && arraycontains( interact.var_5434f2cd988956b, player ) )
    {
        return false;
    }
    
    if ( !interact.var_2efb9165f56da06d )
    {
        return false;
    }
    
    if ( player isemoteactive() )
    {
        return false;
    }
    
    if ( !player utility::callsharedfunc( #"bgb", #"hash_e47d9b7a1bc28040" ) )
    {
        return false;
    }
    
    return true;
}

// Namespace zm_fasttravel
// Params 1, eflags: 0x4
// Checksum 0xeaef68a0, Offset: 0x1fde
// Size: 0x2aa
function private function_868501bd7c06243d( player )
{
    level endon( #"game_ended" );
    
    if ( isdefined( self.s_fasttravel.b_offline ) )
    {
        return;
    }
    
    if ( isdefined( player ) && player.interactions_disabled || player isparachuting() )
    {
        return;
    }
    
    if ( isdefined( self.s_fasttravel.power_on_flag ) )
    {
        if ( !utility::flag( self.s_fasttravel.power_on_flag ) )
        {
            return;
        }
    }
    
    if ( isdefined( self.s_fasttravel.var_f0e4330fc19232d3 ) )
    {
        if ( !utility::flag( self.s_fasttravel.var_f0e4330fc19232d3 ) )
        {
            return;
        }
    }
    
    if ( isdefined( level._fasttravel[ "override_player_can_use_fasttravel" ] ) && ![[ level._fasttravel[ "override_player_can_use_fasttravel" ] ]]( player, self ) )
    {
        return;
    }
    
    if ( isdefined( player ) && isdefined( self.s_fasttravel.script_cost ) && self.s_fasttravel.script_cost != 0 )
    {
        if ( !player currency::attempt_purchase( #"essence", self.s_fasttravel.script_cost, 1, 0, #"fast_travel" ) )
        {
            /#
                iprintlnbold( "<dev string:xa7>" );
            #/
            
            return;
        }
    }
    
    player.var_d1c4c78b9fb7d153 = 1;
    
    if ( isdefined( self.s_fasttravel.activator_set_flag ) )
    {
        utility::flag_set( self.s_fasttravel.activator_set_flag );
    }
    
    str_destination_loc = self.s_fasttravel.var_57c31258748ae730;
    
    if ( !isdefined( str_destination_loc ) )
    {
        str_destination_loc = self.s_fasttravel.str_destination_loc;
    }
    
    s_destination = player get_destination_struct( str_destination_loc );
    self.s_fasttravel.player_activator = player;
    
    if ( isdefined( self.s_fasttravel.var_79d2167bbb401dc5 ) )
    {
        self thread [[ self.s_fasttravel.var_79d2167bbb401dc5 ]]( player, s_destination );
        return;
    }
    
    if ( isdefined( self.s_fasttravel.target2 ) )
    {
        thread function_fc12700673f8db0a();
        player thread fasttravel_cooldown_timer( self );
        level notify( self.s_fasttravel.script_noteworthy );
        level thread fasttravel_slide_path( player, s_destination );
        return;
    }
    
    if ( isent( self ) )
    {
        self playsoundevent( %"sndevent_teleportation_begin_3d", player );
    }
    
    level thread function_cbb08198e7c84adf( s_destination, player );
    player thread fasttravel_cooldown_timer( self );
}

// Namespace zm_fasttravel
// Params 0
// Checksum 0xba440b59, Offset: 0x2290
// Size: 0x37
function function_fc12700673f8db0a()
{
    level endon( #"game_ended" );
    self.var_2efb9165f56da06d = 0;
    wait self.s_fasttravel.var_7627c2f13d3345b4;
    self.var_2efb9165f56da06d = 1;
}

// Namespace zm_fasttravel
// Params 1
// Checksum 0xdc94d7d5, Offset: 0x22cf
// Size: 0x106
function get_destination_struct( str_destination )
{
    self endon( #"death" );
    var_75ef6540d6776b8a = utility::getstructarray( "fasttravel_trigger", "targetname" );
    
    foreach ( struct in var_75ef6540d6776b8a )
    {
        if ( struct.str_start_loc == str_destination )
        {
            return struct;
        }
    }
    
    s_destination = utility::getstruct( str_destination, "script_noteworthy" );
    
    if ( isdefined( s_destination ) )
    {
        var_d7345f637ef42e1 = utility::getstructarray( s_destination.target, "targetname" );
        n_index = self getentitynumber();
        
        if ( isdefined( var_d7345f637ef42e1[ n_index ] ) )
        {
            return s_destination;
        }
    }
}

// Namespace zm_fasttravel
// Params 1
// Checksum 0x7bd9201d, Offset: 0x23de
// Size: 0x26f
function fasttravel_cooldown_timer( portal )
{
    level endon( #"game_ended" );
    self endon( #"disconnect" );
    
    /#
        if ( getdvarint( @"hash_16b2d2ed36077e93", 0 ) )
        {
            return;
        }
    #/
    
    if ( isdefined( portal.s_fasttravel.var_7627c2f13d3345b4 ) )
    {
        var_590dfece3371b32a = { #current_cooldown_time:portal.s_fasttravel.var_7627c2f13d3345b4, #player:self };
        
        if ( !isdefined( portal.var_b8b1708ca1ae7d42 ) )
        {
            portal.var_b8b1708ca1ae7d42 = [];
        }
        
        portal.var_b8b1708ca1ae7d42[ portal.var_b8b1708ca1ae7d42.size ] = var_590dfece3371b32a;
        
        if ( portal.s_fasttravel.var_2c4977ec6a51435e )
        {
            find = undefined;
            
            foreach ( info in portal.var_b8b1708ca1ae7d42 )
            {
                if ( info.player == self )
                {
                    find = info;
                    break;
                }
            }
            
            time_remaining = find.current_cooldown_time;
            interval_sec = 1;
            
            while ( time_remaining > 0 )
            {
                find.current_cooldown_time = int( time_remaining );
                wait interval_sec;
                time_remaining -= interval_sec;
            }
        }
        else
        {
            wait portal.s_fasttravel.var_7627c2f13d3345b4;
        }
        
        if ( isdefined( self ) )
        {
            find = undefined;
            
            foreach ( info in portal.var_b8b1708ca1ae7d42 )
            {
                if ( info.player == self )
                {
                    find = info;
                    break;
                }
            }
            
            if ( find )
            {
                portal.var_b8b1708ca1ae7d42 = arrayremove( portal.var_b8b1708ca1ae7d42, find );
            }
        }
    }
}

// Namespace zm_fasttravel
// Params 6
// Checksum 0xfa9e852, Offset: 0x2655
// Size: 0x229
function function_cbb08198e7c84adf( s_destination, player, var_c3c20b69d17492d4, var_7e095e6dcc29d2af, n_fade_to_black, var_adea237f67b03c1d )
{
    level endon( #"game_ended" );
    player endon( #"disconnect" );
    
    if ( !isdefined( s_destination ) )
    {
        return;
    }
    
    s_destination.player_spawn_locations = utility::getstructarray( s_destination.target, "targetname" );
    assert( isarray( s_destination.player_spawn_locations ) && s_destination.player_spawn_locations.size >= 4, "<dev string:xba>" );
    
    if ( player isonascender() )
    {
        player dropoffascender();
    }
    
    if ( player isemoteactive() )
    {
        player stopemote();
    }
    
    waitframe();
    params = spawnstruct();
    params.player = player;
    params.s_destination = s_destination;
    callback::callback( "on_player_warp", params );
    player notify( #"fasttravel_start" );
    player set_player_vars( 1 );
    wait 0.2;
    player prestream_minimap( s_destination );
    player_index = 0;
    
    if ( s_destination.player_spawn_locations.size > 0 )
    {
        players = level.players;
        
        for ( i = 0; i < players.size ; i++ )
        {
            if ( isalive( players[ i ] ) )
            {
                spawnindex = i;
                
                if ( spawnindex >= s_destination.player_spawn_locations.size )
                {
                    spawnindex = s_destination.player_spawn_locations.size - 1;
                }
                
                players[ i ] setadditionalstreamposuntilcleared( s_destination.player_spawn_locations[ spawnindex ].origin, 1 );
            }
            
            if ( player == players[ i ] )
            {
                player_index = i;
            }
        }
    }
    
    if ( isalive( player ) )
    {
        player function_b4ebfa0e8a2819fc( undefined, undefined, undefined, "player_do_fasttravel", s_destination.player_spawn_locations[ player_index ], undefined, undefined, 1, 1, 1, undefined, 1, var_7e095e6dcc29d2af, n_fade_to_black, s_destination.targetname == "fasttravel_trigger", var_adea237f67b03c1d );
    }
}

// Namespace zm_fasttravel
// Params 1
// Checksum 0x2984867, Offset: 0x2886
// Size: 0x6c
function prestream_minimap( s_destination )
{
    if ( !isdefined( s_destination.var_601871979f3bd42 ) )
    {
        minimap_floor = compass::get_minimap_floor_at_location( s_destination.origin, 1 );
        
        if ( isdefined( minimap_floor ) )
        {
            s_destination.var_601871979f3bd42 = compass::function_63f039f18edc23e1( minimap_floor );
        }
    }
    
    compass::player_set_minimap_stream_hints( "zm_fasttravel", s_destination.var_601871979f3bd42 );
}

// Namespace zm_fasttravel
// Params 16
// Checksum 0x7b57c32, Offset: 0x28fa
// Size: 0x311
function function_b4ebfa0e8a2819fc( var_540dd627d48c6795, nd_path_start, var_cb789841c580cc57, str_notify, var_1f01174057453f91, var_517e0c9f606fd52f, var_caddf87ffbc2c3b4, var_98420eb1da9a06da, b_teleport_bots, var_cefb78e5aba0aa2d, var_25050c377765cf27, var_6261749628b3ece2, var_7e095e6dcc29d2af, n_fade_to_black, var_ef18bc26df951f8a = 0, var_adea237f67b03c1d )
{
    level endon( #"end_game" );
    self endon( #"disconnect" );
    
    if ( !isdefined( var_98420eb1da9a06da ) )
    {
        var_98420eb1da9a06da = 0;
    }
    
    if ( !isdefined( b_teleport_bots ) )
    {
        b_teleport_bots = 1;
    }
    
    if ( !isdefined( var_cefb78e5aba0aa2d ) )
    {
        var_cefb78e5aba0aa2d = 1;
    }
    
    if ( !isdefined( var_25050c377765cf27 ) )
    {
        var_25050c377765cf27 = 0;
    }
    
    if ( !isdefined( var_6261749628b3ece2 ) )
    {
        var_6261749628b3ece2 = 0;
    }
    
    if ( !isdefined( n_fade_to_black ) )
    {
        n_fade_to_black = 0.3;
    }
    
    self.var_d1c4c78b9fb7d153 = 1;
    stopfxontagforclients( level._effect[ "vfx_player_screen_distortion" ], self, "j_head", self );
    killfxontag( level._effect[ "vfx_player_screen_distortion" ], self, "j_head" );
    game_utility::fadetoblackforplayerkeepui( self, 1, n_fade_to_black );
    function_12b11b69ea8587b8( 1 );
    
    if ( isdefined( var_517e0c9f606fd52f ) )
    {
        var_caddf87ffbc2c3b4 = var_517e0c9f606fd52f.script_string;
        self.var_caddf87ffbc2c3b4 = var_caddf87ffbc2c3b4;
        var_7cfa6a30ee8ff7ba = var_517e0c9f606fd52f.var_d2e6bd92229b88eb;
    }
    
    if ( !var_98420eb1da9a06da )
    {
        while ( level.var_ab803d030f39c652[ var_caddf87ffbc2c3b4 ] == 1 )
        {
            waitframe();
        }
        
        level thread function_ceedc64a79eab33a( var_caddf87ffbc2c3b4 );
    }
    
    thread fasttravel_teleport_vortex( var_1f01174057453f91, var_6261749628b3ece2, var_7e095e6dcc29d2af, var_cefb78e5aba0aa2d, n_fade_to_black );
    
    if ( var_adea237f67b03c1d )
    {
        utility::waittill_notify_and_time( "fasttravel_over", var_adea237f67b03c1d );
    }
    else
    {
        self waittill( #"fasttravel_over" );
    }
    
    a_ai = getaiarrayinradius( self.origin, 256 );
    
    foreach ( zombie in a_ai )
    {
        if ( zombie.aicategory == "normal" )
        {
            zombie zombie_knockdown::knockdown_ai( self.origin );
        }
    }
    
    level thread game_utility::fadetoblackforplayerkeepui( self, 0, n_fade_to_black );
    function_12b11b69ea8587b8( 0 );
    set_player_vars( 0 );
    utility::ent_flag_set( "fasttravel_done" );
    
    if ( isdefined( str_notify ) )
    {
        level notify( str_notify );
    }
    
    self.var_caddf87ffbc2c3b4 = undefined;
    self notify( #"fasttravel_finished", var_517e0c9f606fd52f );
    params = spawnstruct();
    params.var_ef18bc26df951f8a = var_ef18bc26df951f8a;
    callback::callback( "fasttravel_finished", params );
    utility::ent_flag_clear( "fasttravel_done" );
    self clearadditionalstreampos();
    compass::player_set_minimap_stream_hints( "zm_fasttravel", 0 );
    callback::callback( "update_mtx_scriptable" );
}

// Namespace zm_fasttravel
// Params 1
// Checksum 0x71e373ca, Offset: 0x2c13
// Size: 0xda
function set_player_vars( b_disable )
{
    if ( b_disable )
    {
        val::set( "fasttravel", "fire", 0 );
        val::set( "fasttravel", "offhand_weapons", 0 );
        val::set( "fasttravel", "allow_movement", 0 );
        val::set( "fasttravel", "ignoreme", 1 );
        val::set( "fasttravel", "freezecontrols", 1 );
        val::set( "fasttravel", "show_hud", 0 );
        val::set( "fasttravel", "killstreaks", 0 );
        val::set( "fasttravel", "ignore_playable_area_check", 1 );
        val::set( "fasttravel", "damage", 0 );
        
        if ( utility::ent_flag( "field_upgrade_in_use" ) )
        {
            supers_mp::superusefinished();
        }
        
        return;
    }
    
    val::reset_all( "fasttravel" );
}

// Namespace zm_fasttravel
// Params 2, eflags: 0x4
// Checksum 0x7c2738e9, Offset: 0x2cf5
// Size: 0x257
function private function_446161f9f459cdc( n_fade_to_black, var_18527eb9fb068ef7 = 0 )
{
    level endon( #"game_ended" );
    self endon( #"disconnect" );
    self.zm_fasttravel_players_watching = player::get_players_watching( 1 );
    thread function_8256429a0a737647();
    
    foreach ( player in self.zm_fasttravel_players_watching )
    {
        if ( isdefined( player ) )
        {
            if ( n_fade_to_black > 0 )
            {
                game_utility::fadetoblackforplayerkeepui( player, 1, n_fade_to_black );
            }
        }
    }
    
    foreach ( player in self.zm_fasttravel_players_watching )
    {
        player function_b420b53b27694f7e( 1, var_18527eb9fb068ef7, !( n_fade_to_black === 0 ) );
    }
    
    self waittill( #"fasttravel_over" );
    
    foreach ( player in self.zm_fasttravel_players_watching )
    {
        player function_3583c74a3e6c1365( 1 );
    }
    
    if ( n_fade_to_black > 0 )
    {
        foreach ( player in self.zm_fasttravel_players_watching )
        {
            if ( isdefined( player ) )
            {
                level thread game_utility::fadetoblackforplayerkeepui( player, 0, n_fade_to_black );
            }
        }
    }
    
    self.zm_fasttravel_players_watching = undefined;
}

// Namespace zm_fasttravel
// Params 0, eflags: 0x4
// Checksum 0x19b3e12d, Offset: 0x2f54
// Size: 0x13c
function private function_8256429a0a737647()
{
    level endon( #"end_game" );
    self endon( #"disconnect" );
    self endon( #"fasttravel_over" );
    
    foreach ( player in level.players )
    {
        if ( player == self )
        {
            continue;
        }
        
        if ( arraycontains( self.zm_fasttravel_players_watching, player ) )
        {
            continue;
        }
        
        if ( !isdefined( other_players ) )
        {
            other_players = [];
        }
        
        other_players[ other_players.size ] = player;
    }
    
    foreach ( other_player in other_players )
    {
        childthread monitor_spectating_player( other_player );
    }
}

// Namespace zm_fasttravel
// Params 1, eflags: 0x4
// Checksum 0x8cb03eb1, Offset: 0x3098
// Size: 0x78
function private monitor_spectating_player( other_player )
{
    while ( true )
    {
        other_player waittill( #"spectating_cycle" );
        waittillframeend();
        
        if ( !isdefined( other_player ) )
        {
            continue;
        }
        
        spectated_player = other_player getspectatingplayer();
        
        if ( spectated_player == self )
        {
            if ( isarray( self.zm_fasttravel_players_watching ) )
            {
                self.zm_fasttravel_players_watching[ self.zm_fasttravel_players_watching.size ] = other_player;
                other_player function_b420b53b27694f7e( 1 );
            }
        }
    }
}

// Namespace zm_fasttravel
// Params 1
// Checksum 0xf03ecfd2, Offset: 0x3118
// Size: 0x39
function function_ceedc64a79eab33a( var_caddf87ffbc2c3b4 )
{
    level endon( #"end_game" );
    level.var_ab803d030f39c652[ var_caddf87ffbc2c3b4 ] = 1;
    wait 0.1;
    level.var_ab803d030f39c652[ var_caddf87ffbc2c3b4 ] = undefined;
}

// Namespace zm_fasttravel
// Params 6
// Checksum 0x88f0e03a, Offset: 0x3159
// Size: 0x1a1
function fasttravel_teleport_vortex( var_1f01174057453f91, var_6261749628b3ece2, var_7e095e6dcc29d2af, var_cefb78e5aba0aa2d, n_fade_to_black = 0.3, var_18527eb9fb068ef7 = 0 )
{
    level endon( #"end_game" );
    self endon( #"disconnect" );
    thread function_446161f9f459cdc( n_fade_to_black, var_18527eb9fb068ef7 );
    
    if ( !isdefined( var_6261749628b3ece2 ) )
    {
        var_6261749628b3ece2 = 0;
    }
    
    if ( !isdefined( var_7e095e6dcc29d2af ) )
    {
        var_7e095e6dcc29d2af = 1;
    }
    
    a_start_origin = self.origin;
    var_ce3a9be1e12996df = utility::getstructarray( "teleport_room", "targetname" );
    var_6081543fe6b042eb = get_player_index( self );
    s_teleport_room = var_ce3a9be1e12996df[ var_6081543fe6b042eb ];
    vortex_teleport_player( a_start_origin, s_teleport_room );
    
    if ( !player::isinlaststand( self ) && isalive( self ) )
    {
        self setstance( "stand", 1 );
        
        if ( var_cefb78e5aba0aa2d && getdvarint( @"hash_f6d3570dc7b0b026", 0 ) )
        {
            wait 1;
        }
    }
    
    if ( var_7e095e6dcc29d2af )
    {
        function_60628df0e15b562b( undefined, var_18527eb9fb068ef7, !( n_fade_to_black === 0 ) );
    }
    else
    {
        wait 0.5;
    }
    
    if ( !isplayer( self ) )
    {
        return;
    }
    
    if ( isdefined( self.e_teleport_origin ) )
    {
        self.e_teleport_origin delete();
        self.e_teleport_origin = undefined;
    }
    
    if ( isdefined( var_1f01174057453f91 ) )
    {
        if ( isarray( var_1f01174057453f91 ) )
        {
            s_dest_loc = function_8447a68108cb9cba( var_1f01174057453f91 );
        }
        else
        {
            s_dest_loc = var_1f01174057453f91;
        }
        
        teleport_player_to_dest( s_dest_loc );
    }
    
    self notify( #"fasttravel_over", "vortex" );
}

// Namespace zm_fasttravel
// Params 3
// Checksum 0x172ac36d, Offset: 0x3302
// Size: 0x77
function function_60628df0e15b562b( s_vortex, var_18527eb9fb068ef7 = 0, should_fade_to_black )
{
    self endon( #"disconnect" );
    self playrumblelooponentity( "damage_heavy" );
    vortex_fx_proxy = function_b420b53b27694f7e( 0, var_18527eb9fb068ef7, should_fade_to_black );
    wait 5;
    function_3583c74a3e6c1365( 0, vortex_fx_proxy );
    self stoprumble( "damage_heavy" );
    val::reset_all( "fasttravel" );
}

// Namespace zm_fasttravel
// Params 3, eflags: 0x4
// Checksum 0x30704c59, Offset: 0x3381
// Size: 0x139
function private function_b420b53b27694f7e( is_spectating, var_18527eb9fb068ef7 = 0, should_fade_to_black = 1 )
{
    if ( !isdefined( self ) )
    {
        return;
    }
    
    if ( getdvarint( @"hash_f6d3570dc7b0b026", 0 ) )
    {
        if ( is_spectating )
        {
            self forceplayerviewwhenspectating();
            
            if ( should_fade_to_black )
            {
                game_utility::fadetoblackforplayerkeepui( self, 0, 0.1 );
            }
        }
        else
        {
            forward_angles = anglestoforward( self getplayerangles() );
            vortex_fx_proxy = utility::spawn_model( "tag_origin", self geteye(), vectortoangles( forward_angles ) );
            vortex_fx_proxy thread function_a7a1fb0bc94096b9( self );
            waitframe();
            playfxontagforclients( level._effect[ "wormhole_vfx" ], vortex_fx_proxy, "tag_origin", self );
            self playsoundevent( %"sndevent_teleportation_player_2d" );
            
            if ( should_fade_to_black )
            {
                game_utility::fadetoblackforplayerkeepui( self, 0, 0.1 );
            }
            
            return vortex_fx_proxy;
        }
        
        return;
    }
    
    self setclientomnvar( "ui_zm_bink_overlay_state", 1 );
    
    if ( isdefined( level.var_7e6171d8827ba694 ) && !var_18527eb9fb068ef7 )
    {
        self playcinematicforplayerlooping( level.var_7e6171d8827ba694 );
    }
    else
    {
        self playcinematicforplayerlooping( "zm_t10_teleport_vortex" );
    }
    
    self playsoundevent( %"sndevent_teleportation_player_2d" );
}

// Namespace zm_fasttravel
// Params 2, eflags: 0x4
// Checksum 0x9d46138d, Offset: 0x34c2
// Size: 0x96
function private function_3583c74a3e6c1365( is_spectating, vortex_fx_proxy )
{
    if ( !isdefined( self ) )
    {
        return;
    }
    
    if ( getdvarint( @"hash_f6d3570dc7b0b026", 0 ) )
    {
        if ( is_spectating )
        {
            game_utility::fadetoblackforplayerkeepui( self, 1, 0.1 );
            self disableforceplayerviewwhenspectating();
        }
        else
        {
            game_utility::fadetoblackforplayerkeepui( self, 1, 0.1 );
            
            if ( isdefined( vortex_fx_proxy ) )
            {
                killfxontag( level._effect[ "wormhole_vfx" ], vortex_fx_proxy, "tag_origin" );
                vortex_fx_proxy delete();
            }
        }
        
        return;
    }
    
    self stopcinematicforplayer();
    self setclientomnvar( "ui_zm_bink_overlay_state", 0 );
}

// Namespace zm_fasttravel
// Params 1
// Checksum 0x2a392e63, Offset: 0x3560
// Size: 0x3c
function function_a7a1fb0bc94096b9( player )
{
    level endon( #"game_ended" );
    self endon( #"death" );
    
    while ( true )
    {
        self.origin = player geteye();
        waitframe();
    }
}

// Namespace zm_fasttravel
// Params 2
// Checksum 0xc688ce4d, Offset: 0x35a4
// Size: 0xc5
function vortex_teleport_player( a_start_origin, s_teleport_room )
{
    if ( !zm_player::is_player_valid( self, 0, 1 ) )
    {
        return;
    }
    
    if ( isdefined( self ) )
    {
        val::set( "vortex_teleport_player_ignores", "ignore_afk", 1 );
        self dontinterpolate();
        self setorigin( s_teleport_room.origin );
        
        if ( !isdefined( s_teleport_room.angles ) )
        {
            s_teleport_room.angles = ( 0, 0, 0 );
        }
        
        self setplayerangles( s_teleport_room.angles );
        childthread vortex_link_player( s_teleport_room );
        self notify( #"afk_tracking_resume" );
        utility::delaythreadendon( level.framedurationseconds, "disconnect", &val::reset_all, "vortex_teleport_player_ignores" );
        wait 0.1;
    }
}

// Namespace zm_fasttravel
// Params 1
// Checksum 0x6078bb89, Offset: 0x3671
// Size: 0x71
function vortex_link_player( s_teleport_room )
{
    waitframe();
    self.e_teleport_origin = spawn( "script_origin", s_teleport_room.origin );
    self.e_teleport_origin.angles = s_teleport_room.angles;
    self.e_teleport_origin.targetname = "vortex_link_player";
    self playerlinkto( self.e_teleport_origin );
}

// Namespace zm_fasttravel
// Params 2
// Checksum 0x447d0abd, Offset: 0x36ea
// Size: 0x23e
function fasttravel_slide_path( player, s_destination )
{
    player endon( #"death" );
    player.e_linkto = utility::spawn_model( "tag_origin", player.origin + ( 0, 0, -16 ), player.angles );
    player playerlinkto( player.e_linkto, undefined, 0, 45, 45, 45, 15 );
    player.s_dest = player function_2723774980bb17c4( s_destination );
    player set_player_fasttravel( 1 );
    s_start = utility::getstruct( "slide_start", "targetname" );
    player.e_linkto moveto( s_start.origin, 0.5 );
    player.e_linkto waittill( #"movedone" );
    s_next = utility::getstruct( s_start.target, "targetname" );
    
    while ( true )
    {
        if ( s_next.script_noteworthy == "slow" )
        {
            n_speed = 300;
        }
        else
        {
            n_speed = 400;
        }
        
        n_dist = distance( player.e_linkto.origin, s_next.origin );
        n_time = n_dist / n_speed;
        player.e_linkto moveto( s_next.origin, n_time );
        player.e_linkto rotateto( s_next.angles, n_time );
        
        if ( n_time > 0.1 )
        {
            wait n_time - 0.05;
        }
        else
        {
            wait n_time;
        }
        
        if ( s_next.script_noteworthy == "stand" )
        {
            player val::reset_all( "fasttravel" );
            player setstance( "stand" );
        }
        
        if ( isdefined( s_next.target ) )
        {
            s_next = utility::getstruct( s_next.target, "targetname" );
            continue;
        }
        
        break;
    }
    
    level notify( #"fasttravel_reached" );
    player set_player_fasttravel( 0 );
}

// Namespace zm_fasttravel
// Params 1
// Checksum 0x3cde1e6c, Offset: 0x3930
// Size: 0x1be
function set_player_fasttravel( b_state )
{
    self endon( #"death" );
    
    if ( b_state )
    {
        function_93375cbf6cc2384e( self, 1 );
        utility::ent_flag_set( "player_on_rail" );
        function_12b11b69ea8587b8( 1 );
        val::set( "zm_fasttravel_tp", "allow_toggle_third_person", 0 );
        pbgpostfxbundlestart( self, "cer_zm_speed_blur" );
        self setscriptablepartstate( "fasttravel", "camera_on" );
        return;
    }
    
    self playrumbleonentity( "damage_heavy" );
    n_dist = distance( self.e_linkto.origin, self.s_dest.origin );
    n_time = n_dist / 500;
    self.e_linkto moveto( self.s_dest.origin, n_time );
    self.e_linkto rotateto( self.s_dest.angles, n_time );
    self.e_linkto waittill( #"movedone" );
    self.e_linkto delete();
    utility::ent_flag_clear( "player_on_rail" );
    wait 0.1;
    self setstance( "stand", 1 );
    self playrumbleonentity( "damage_heavy" );
    self earthquakeforplayer( 0.4, 1, self.origin, 64 );
    function_93375cbf6cc2384e( self, 0 );
    pbgpostfxbundleend( self, "cer_zm_speed_blur" );
    self setscriptablepartstate( "fasttravel", "camera_out" );
    wait 0.5;
    self setscriptablepartstate( "fasttravel", "camera_off" );
    function_12b11b69ea8587b8( 0 );
    val::reset( "zm_fasttravel_tp", "allow_toggle_third_person" );
}

// Namespace zm_fasttravel
// Params 1
// Checksum 0x5373ef1d, Offset: 0x3af6
// Size: 0xaf
function function_12b11b69ea8587b8( toggle )
{
    if ( toggle )
    {
        if ( isdvardefined( @"killswitch_third_person_transitions" ) )
        {
            self.var_cd3d60349b92ea3a = getdvarint( @"killswitch_third_person_transitions" );
            setdvar( @"killswitch_third_person_transitions", 0 );
        }
        
        if ( self getcamerathirdperson() )
        {
            self.is_third_person = 1;
            self setcamerathirdperson( 0 );
        }
        
        return;
    }
    
    if ( isdefined( self.var_cd3d60349b92ea3a ) )
    {
        setdvar( @"killswitch_third_person_transitions", self.var_cd3d60349b92ea3a );
        self.var_cd3d60349b92ea3a = undefined;
    }
    
    if ( self.is_third_person )
    {
        self.is_third_person = undefined;
        self setcamerathirdperson( 1 );
    }
}

// Namespace zm_fasttravel
// Params 2
// Checksum 0x61d91e87, Offset: 0x3bad
// Size: 0xec
function function_93375cbf6cc2384e( veh_fasttravel, b_disable )
{
    if ( b_disable )
    {
        val::set( "fasttravel", "crouch", 0 );
        val::set( "fasttravel", "stand", 0 );
        self setstance( "prone" );
        val::set( "fasttravel", "damage", 0 );
        val::set( "fasttravel", "killstreaks", 0 );
        val::set( "fasttravel", "allow_movement", 0 );
        val::set( "fasttravel", "offhand_weapons", 0 );
        val::set( "fasttravel", "show_hud", 0 );
        val::set( "fasttravel", "ignoreme", 1 );
        
        if ( player::isinlaststand( self ) || self.ismutantinjection )
        {
            val::set( "fasttravel", "fire", 0 );
        }
        
        return;
    }
    
    self.var_d1c4c78b9fb7d153 = 0;
}

// Namespace zm_fasttravel
// Params 1
// Checksum 0x57f24c1c, Offset: 0x3ca1
// Size: 0x5e
function function_2723774980bb17c4( s_destination )
{
    a_s_targets = utility::getstructarray( s_destination.target, "targetname" );
    self.n_index = self getentitynumber();
    
    if ( isdefined( a_s_targets[ self.n_index ] ) )
    {
        return a_s_targets[ self.n_index ];
    }
    
    return a_s_targets[ 0 ];
}

// Namespace zm_fasttravel
// Params 0
// Checksum 0xa745bd0b, Offset: 0x3d07
// Size: 0x86
function function_c560ad0dc6d30911()
{
    self endon( #"death" );
    v_forward = vectornormalize( anglestoforward( self.s_dest.angles ) ) * 40;
    self pushplayervector( v_forward );
    self earthquakeforplayer( 0.2, 0.5, self.origin, 64 );
    self playrumbleonentity( "damage_heavy" );
    wait 1;
    self pushplayervector( ( 0, 0, 0 ) );
    self.s_dest = undefined;
}

// Namespace zm_fasttravel
// Params 1
// Checksum 0x38954ca9, Offset: 0x3d95
// Size: 0xd8
function function_8447a68108cb9cba( var_38b7e368cb50f9ba )
{
    n_index = get_player_index( self );
    a_e_players = level.players;
    
    if ( function_9cb40b4b8e64abde( var_38b7e368cb50f9ba[ n_index ], a_e_players ) )
    {
        return var_38b7e368cb50f9ba[ n_index ];
    }
    
    foreach ( s_dest_loc in var_38b7e368cb50f9ba )
    {
        if ( s_dest_loc == var_38b7e368cb50f9ba[ n_index ] )
        {
            continue;
        }
        
        if ( function_9cb40b4b8e64abde( s_dest_loc, a_e_players ) )
        {
            return s_dest_loc;
        }
    }
    
    /#
        iprintln( "<dev string:xe9>" );
    #/
    
    return var_38b7e368cb50f9ba[ n_index ];
}

// Namespace zm_fasttravel
// Params 1
// Checksum 0xe11525a6, Offset: 0x3e76
// Size: 0x43
function get_player_index( e_player )
{
    for ( i = 0; i < level.players.size ; i++ )
    {
        if ( e_player == level.players[ i ] )
        {
            return i;
        }
    }
}

// Namespace zm_fasttravel
// Params 2
// Checksum 0xb7c27e30, Offset: 0x3ec1
// Size: 0x116
function function_9cb40b4b8e64abde( s_dest_loc, a_e_players )
{
    n_safe_distance_squared = 1024;
    b_safe = 1;
    assert( isdefined( s_dest_loc ), "<dev string:x11a>" );
    
    foreach ( e_player in a_e_players )
    {
        if ( e_player.var_d1c4c78b9fb7d153 )
        {
            continue;
        }
        
        if ( abs( s_dest_loc.origin[ 2 ] - e_player.origin[ 2 ] ) > 60 )
        {
            continue;
        }
        
        if ( distance2dsquared( s_dest_loc.origin, e_player.origin ) > n_safe_distance_squared )
        {
            continue;
        }
        
        b_safe = 0;
        break;
    }
    
    return b_safe;
}

// Namespace zm_fasttravel
// Params 2
// Checksum 0x9ba6994e, Offset: 0x3fe0
// Size: 0x11a
function teleport_player_to_dest( s_dest_loc, b_set_angles = 1 )
{
    if ( !( self.spectating || self isspectatinganyone() || self.team == "spectator" || self.sessionstate == "spectator" ) )
    {
        val::set( "teleport_player_to_dest_ignores", "ignore_afk", 1 );
        self dontinterpolate();
        self setorigin( s_dest_loc.origin );
        self setvelocity( ( 0, 0, 0 ) );
        self notify( #"afk_tracking_resume" );
        utility::delaythreadendon( level.framedurationseconds, "disconnect", &val::reset_all, "teleport_player_to_dest_ignores" );
    }
    
    /#
        if ( b_set_angles && !isdefined( s_dest_loc.angles ) )
        {
        }
    #/
    
    if ( b_set_angles && isdefined( s_dest_loc.angles ) )
    {
        self setplayerangles( s_dest_loc.angles );
    }
    
    self playsoundevent( %"sndevent_teleportation_end_3d" );
    self.var_d1c4c78b9fb7d153 = 0;
}

// Namespace zm_fasttravel
// Params 0
// Checksum 0x94b7eb99, Offset: 0x4102
// Size: 0x4a4
function function_8649f9a98d2d9ce3()
{
    level endon( #"game_ended" );
    
    foreach ( player in level.players )
    {
        if ( player.bgivensentry )
        {
            player val::group_reset( "sentry" );
            player val::set( "sentry", "interactions", 1 );
            player notify( #"equip_deploy_cancel" );
        }
    }
    
    foreach ( player in level.players )
    {
        if ( isweapon( "t10_laser_large_ir_mp" ) && player hasweapon( "t10_laser_large_ir_mp" ) )
        {
            player takeweapon( "t10_laser_large_ir_mp" );
            oldweaponobj = player inventory::getlastweapon();
            
            if ( oldweaponobj == level.var_f8ac15ada97a702a )
            {
                oldweaponobj = player inventory::getfirstprimaryweapon();
            }
            
            success = player inventory_utility::domonitoredweaponswitch( oldweaponobj, 1 );
        }
    }
    
    while ( true )
    {
        var_e05ba689016d78fb = 0;
        
        foreach ( player in level.players )
        {
            if ( player.isdeploying )
            {
                var_e05ba689016d78fb = 1;
                break;
            }
        }
        
        if ( var_e05ba689016d78fb )
        {
            wait 0.5;
            continue;
        }
        
        break;
    }
    
    while ( true )
    {
        var_7710a12fe7d5e0f1 = 0;
        
        foreach ( player in level.players )
        {
            if ( player.var_8ff71ee2591d99a9 )
            {
                var_7710a12fe7d5e0f1 = 1;
                break;
            }
        }
        
        if ( var_7710a12fe7d5e0f1 )
        {
            wait 0.5;
            continue;
        }
        
        break;
    }
    
    if ( isarray( level.rcxds ) )
    {
        foreach ( rcxd in level.rcxds )
        {
            var_32dbca3143d9c4a5 = level.sharedfuncs[ #"killstreak_rcxd" ][ #"explode" ];
            
            if ( isdefined( var_32dbca3143d9c4a5 ) )
            {
                rcxd [[ var_32dbca3143d9c4a5 ]]();
            }
        }
    }
    
    level notify( #"hellstorm_missile_early_quit" );
    
    if ( isdefined( level.chopper_gunner ) )
    {
        level.chopper_gunner notify( #"hash_fb44cd088f1f78d7" );
        level.chopper_gunner waittill( #"player_exit_vehicle" );
    }
    
    foreach ( player in level.players )
    {
        if ( player vehicle::is_in_vehicle() )
        {
            vehicle = player vehicle::get_vehicle();
            vehicle_occupancy::exit( vehicle, vehicle_occupancy::get_occupant_seat( vehicle, player ), player );
        }
        
        if ( !isalive( player ) || player.sessionstate == "spectator" )
        {
            player.var_14955bc056bab547 = 1;
            player thread playerlogic::spawnclient();
        }
        
        if ( player::isinlaststand( player ) )
        {
            player thread laststand::auto_revive( player, "last_stand_revived" );
        }
    }
    
    wait 1;
}

/#

    // Namespace zm_fasttravel
    // Params 0
    // Checksum 0xb4b68947, Offset: 0x45ae
    // Size: 0x44, Type: dev
    function init_fasttravel_debug()
    {
        devgui::function_9082edeb5db93280( "<dev string:x14c>" );
        devgui::add_devgui_func( "<dev string:x15b>", "<dev string:x16f>", &function_b41a6c21c3e120d1 );
        devgui::add_devgui_func( "<dev string:x183>", "<dev string:x183>", &debug_teleport_fx );
        devgui::function_77df7fe7dd273e10();
    }

    // Namespace zm_fasttravel
    // Params 0
    // Checksum 0x7cbd627e, Offset: 0x45fa
    // Size: 0x48, Type: dev
    function function_b41a6c21c3e120d1()
    {
        game_utility::fadetoblackforplayerkeepui( level.players[ 0 ], 1, 0.3 );
        level.players[ 0 ] function_60628df0e15b562b();
        game_utility::fadetoblackforplayerkeepui( level.players[ 0 ], 0, 0.3 );
    }

    // Namespace zm_fasttravel
    // Params 0
    // Checksum 0x2cb9bb87, Offset: 0x464a
    // Size: 0xc0, Type: dev
    function debug_teleport_fx()
    {
        var_b78fc84ceb590f1d = utility::getstruct( "<dev string:x195>", "<dev string:x19e>" );
        forward_angles = anglestoforward( level.players[ 0 ] getplayerangles() );
        vortex_fx_proxy = utility::spawn_model( "<dev string:x1a9>", level.players[ 0 ] geteye(), vectortoangles( forward_angles ) );
        waitframe();
        level.players[ 0 ] cameralinkto( vortex_fx_proxy, "<dev string:x1a9>" );
        playfxontagforclients( level._effect[ "<dev string:x1b4>" ], vortex_fx_proxy, "<dev string:x1a9>", level.players[ 0 ] );
        wait 5;
        level.players[ 0 ] cameraunlink();
        vortex_fx_proxy delete();
    }

#/
