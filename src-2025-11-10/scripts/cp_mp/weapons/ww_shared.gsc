#using scripts\common\scene;
#using scripts\common\system;
#using scripts\common\utility;
#using scripts\engine\hud_management;
#using scripts\engine\utility;

#namespace ww_shared;

// Namespace ww_shared
// Params 0, eflags: 0x5
// Checksum 0xb520ca29, Offset: 0x22a
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"ww_shared", undefined, undefined, &post_main );
}

// Namespace ww_shared
// Params 2
// Checksum 0xb889b039, Offset: 0x24b
// Size: 0x101
function function_e2af6ee2a618e084( var_49e9c89075a4ea32, message_duration = 9.5 )
{
    self notify( "409eea8352f2375d" );
    self endon( "409eea8352f2375d" );
    level endon( "game_ended" );
    self endon( "disconnect" );
    assert( isnumber( message_duration ), "<dev string:x24>" );
    message_duration = max( message_duration, 2 );
    
    if ( !hud_management::function_3a5ea1e8f80924f5( "ww_tutorial_message_zm" ) )
    {
        hud_management::function_6c64f5190d26c96( "ww_tutorial_message_zm", "scripted_widget_ww_tutorial_message_zm" );
    }
    
    hud_management::function_332d1650d80633c4( "ww_tutorial_message_zm", 0, 0, 0, 0 );
    hud_management::function_195e74a403805f( "ww_tutorial_message_zm", "locstring_index", getlocstringindex( var_49e9c89075a4ea32 ) ?? 0 );
    hud_management::function_d04a6b5e3d6f9bb8( "ww_tutorial_message_zm", "Show" );
    wait message_duration - 0.5;
    
    if ( self )
    {
        hud_management::function_d04a6b5e3d6f9bb8( "ww_tutorial_message_zm", "Hide" );
    }
    else
    {
        return;
    }
    
    wait 0.6;
    
    if ( self && hud_management::function_3a5ea1e8f80924f5( "ww_tutorial_message_zm" ) )
    {
        hud_management::scripted_widget_destroy( "ww_tutorial_message_zm" );
    }
}

// Namespace ww_shared
// Params 3
// Checksum 0x1ae82e5b, Offset: 0x354
// Size: 0xbb
function function_50a43e11790d1a15( weapon_name, var_845c4e66931a5ce3, var_88a6e05244d65d08 )
{
    assert( isplayer( self ), "<dev string:x5a>" );
    assert( isstring( weapon_name ), "<dev string:x91>" );
    assert( isstring( var_88a6e05244d65d08 ), "<dev string:xb1>" );
    level endon( "game_ended" );
    self endon( "death_or_disconnect" );
    utility::function_7c10ea82c1e305b8( var_845c4e66931a5ce3, var_88a6e05244d65d08 );
    self notify( "stop_monitor_ww_ambient_fx_" + weapon_name + "_state" );
    waitframe();
    
    if ( self )
    {
        data = function_3f47706f13684728( weapon_name );
        data.var_845c4e66931a5ce3 = undefined;
        data.var_bc3ad5120bbdf8ea = undefined;
        data.var_88a6e05244d65d08 = undefined;
    }
}

// Namespace ww_shared
// Params 5
// Checksum 0xb683a732, Offset: 0x417
// Size: 0x1b1
function function_3472b693f638483a( weapon_name, var_845c4e66931a5ce3, var_bc3ad5120bbdf8ea, var_88a6e05244d65d08, var_a2a098d2015a5434 )
{
    self notify( "dc0acf9b52525fc6" );
    self endon( "dc0acf9b52525fc6" );
    assert( isplayer( self ), "<dev string:x5a>" );
    assert( isstring( weapon_name ), "<dev string:x91>" );
    assert( isstring( var_845c4e66931a5ce3 ), "<dev string:xdc>" );
    assert( isstring( var_bc3ad5120bbdf8ea ), "<dev string:x105>" );
    assert( isstring( var_88a6e05244d65d08 ), "<dev string:xb1>" );
    level endon( "game_ended" );
    self endon( "death_or_disconnect" );
    self endon( "stop_monitor_ww_ambient_fx_" + weapon_name + "_state" );
    childthread function_68ec63128ba030ec( weapon_name );
    childthread function_13a498dce15e6900( weapon_name );
    childthread function_1f96acfd76120b74( weapon_name );
    duration = var_a2a098d2015a5434 ?? 0.2;
    wait duration;
    data = function_3f47706f13684728( weapon_name );
    data.var_845c4e66931a5ce3 = var_845c4e66931a5ce3;
    data.var_bc3ad5120bbdf8ea = var_bc3ad5120bbdf8ea;
    data.var_88a6e05244d65d08 = var_88a6e05244d65d08;
    
    while ( true )
    {
        if ( !data.var_be7bbd1853a4d915 && !data.var_947f7fe80a0c5906 && !data.var_b23175bbeb5a05f0 )
        {
            if ( !level.var_50a43e11790d1a15 )
            {
                utility::function_32b24db3127bff40( data.var_845c4e66931a5ce3, data.var_bc3ad5120bbdf8ea );
            }
            else
            {
                utility::function_32b24db3127bff40( data.var_845c4e66931a5ce3, data.var_88a6e05244d65d08 );
            }
        }
        
        waitframe();
    }
}

// Namespace ww_shared
// Params 0, eflags: 0x4
// Checksum 0x86caaba8, Offset: 0x5d0
// Size: 0x1a
function private post_main()
{
    scene::function_85b13b837056bc8b( &function_a129aa9337577eb8 );
    scene::function_53de0775d8452750( &function_b0f647e09ffd1a1d );
}

// Namespace ww_shared
// Params 0, eflags: 0x4
// Checksum 0x7b4f8f03, Offset: 0x5f2
// Size: 0xd
function private function_a129aa9337577eb8()
{
    level.var_50a43e11790d1a15 = 1;
}

// Namespace ww_shared
// Params 0, eflags: 0x4
// Checksum 0x43adba32, Offset: 0x607
// Size: 0xc
function private function_b0f647e09ffd1a1d()
{
    level.var_50a43e11790d1a15 = 0;
}

// Namespace ww_shared
// Params 1, eflags: 0xc
// Checksum 0x5c4b3bb4, Offset: 0x61b
// Size: 0x121
function private function_68ec63128ba030ec( weapon_name )
{
    self notify( "84e3cc1b3c5eb559" );
    self endon( "84e3cc1b3c5eb559" );
    data = function_3f47706f13684728( weapon_name );
    data.var_be7bbd1853a4d915 = 0;
    
    while ( true )
    {
        self waittill( "weapon_switch_started" );
        waitframe();
        
        if ( data.var_845c4e66931a5ce3 && data.var_88a6e05244d65d08 )
        {
            utility::function_32b24db3127bff40( data.var_845c4e66931a5ce3, data.var_88a6e05244d65d08 );
        }
        
        data.var_be7bbd1853a4d915 = 1;
        
        while ( true )
        {
            result = utility::function_a5c752b3c63769b7( "weapon_raise_code", "weapon_switch_canceled", "offhand_end", "melee_fired" );
            
            if ( result[ "message" ] == "weapon_raise_code" || result[ "message" ] == "melee_fired" )
            {
                weapon = result[ 0 ];
                
                if ( isweapon( weapon ) && weapon.basename == weapon_name )
                {
                    break;
                }
                
                continue;
            }
            
            break;
        }
        
        data.var_be7bbd1853a4d915 = 0;
    }
}

// Namespace ww_shared
// Params 1, eflags: 0xc
// Checksum 0x672f15eb, Offset: 0x744
// Size: 0xc6
function private function_13a498dce15e6900( weapon_name )
{
    self notify( "c63b687dd761fc75" );
    self endon( "c63b687dd761fc75" );
    data = function_3f47706f13684728( weapon_name );
    data.var_947f7fe80a0c5906 = 0;
    
    while ( true )
    {
        self waittill( "weapon_raise_code", weapon );
        
        if ( weapon.basename != weapon_name )
        {
            continue;
        }
        
        data.var_947f7fe80a0c5906 = 1;
        
        if ( data.var_845c4e66931a5ce3 && data.var_88a6e05244d65d08 )
        {
            utility::function_32b24db3127bff40( data.var_845c4e66931a5ce3, data.var_88a6e05244d65d08 );
        }
        
        wait 0.1;
        data.var_947f7fe80a0c5906 = 0;
    }
}

// Namespace ww_shared
// Params 1, eflags: 0xc
// Checksum 0x514f9148, Offset: 0x812
// Size: 0xaf
function private function_1f96acfd76120b74( weapon_name )
{
    self notify( "9d07c0a888df5862" );
    self endon( "9d07c0a888df5862" );
    data = function_3f47706f13684728( weapon_name );
    data.var_b23175bbeb5a05f0 = 0;
    
    while ( true )
    {
        self waittill( "weapon_inspect" );
        
        while ( self function_985124b0e1e74f2e() )
        {
            waitframe();
        }
        
        data.var_b23175bbeb5a05f0 = 1;
        
        if ( data.var_845c4e66931a5ce3 && data.var_88a6e05244d65d08 )
        {
            utility::function_32b24db3127bff40( data.var_845c4e66931a5ce3, data.var_88a6e05244d65d08 );
        }
        
        waitframe();
        data.var_b23175bbeb5a05f0 = 0;
    }
}

// Namespace ww_shared
// Params 1
// Checksum 0xee4ba07f, Offset: 0x8c9
// Size: 0x5c
function function_3f47706f13684728( weapon_name )
{
    if ( !isarray( self.var_d127b811ed188fe5 ) )
    {
        self.var_d127b811ed188fe5 = [];
    }
    
    if ( isstring( weapon_name ) )
    {
        if ( !isdefined( self.var_d127b811ed188fe5[ weapon_name ] ) )
        {
            self.var_d127b811ed188fe5[ weapon_name ] = {};
        }
        
        return self.var_d127b811ed188fe5[ weapon_name ];
    }
}

