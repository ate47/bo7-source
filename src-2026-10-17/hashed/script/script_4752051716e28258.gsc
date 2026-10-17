#using script_1a6a1f7bdb57d7ff;
#using script_6dfd03280678b65d;
#using scripts\common\system;
#using scripts\common\utility;
#using scripts\mp\zm\ztron\ztron_item;
#using scripts\mp\zm\ztron\ztron_player_utility;
#using scripts\mp\zm\ztron\ztron_save;
#using scripts\mp\zm\ztron\ztron_sound;
#using scripts\mp\zm\ztron\ztron_utility;

#namespace namespace_a1597a4eb2463645;

// Namespace namespace_a1597a4eb2463645
// Params 0, eflags: 0x5
// Checksum 0x39e52dd3, Offset: 0x1bd
// Size: 0x21
function private autoexec __init__system__()
{
    system::register( #"hash_c87eef636c6bb618", #"ztron_item", undefined, &init );
}

// Namespace namespace_a1597a4eb2463645
// Params 0
// Checksum 0x9bdf68b3, Offset: 0x1e6
// Size: 0x44
function init()
{
    ztron_item::function_5844a9c240f7dc8d( #"sawblade", #"use", &usesawblade );
    ztron_sound::function_4ac735395b173fe( "sawblade_on_lp", "evt_ztron_pickup_sawblade_active_lp", 1 );
    ztron_sound::function_4ac735395b173fe( "sawblade_launch_OS", "evt_ztron_pickup_sawblade_lose_blade" );
}

// Namespace namespace_a1597a4eb2463645
// Params 2
// Checksum 0xbb2469b9, Offset: 0x232
// Size: 0x24
function function_cfa2b891bf9e311c( owner, duration )
{
    return int( owner ztron_player_utility::function_10777122eee28fa8( duration, 1 ) );
}

// Namespace namespace_a1597a4eb2463645
// Params 1
// Checksum 0xb044c11e, Offset: 0x25f
// Size: 0x52
function usesawblade( params )
{
    player = params.player;
    itemdata = ztron_item::function_998f2b10462afbf4( params.bundle );
    activatesawblade( player, itemdata.duration );
}

// Namespace namespace_a1597a4eb2463645
// Params 0
// Checksum 0x4040740b, Offset: 0x2b9
// Size: 0xf, Type: bool
function function_e9c72efb25768863()
{
    return self.lifetime ?? 0;
}

// Namespace namespace_a1597a4eb2463645
// Params 2
// Checksum 0xdf6c1038, Offset: 0x2d1
// Size: 0x3f
function function_1b8fb201ec59e85e( origin, angle )
{
    blade = utility::spawn_model( "sat_zm_ztron_props_sawblade", origin, angle );
    blade notsolid();
    blade enablelinkto();
    return blade;
}

// Namespace namespace_a1597a4eb2463645
// Params 4
// Checksum 0xed3cb1b6, Offset: 0x319
// Size: 0x344, Type: bool
function activatesawblade( player, duration, storebought = 0, var_4f41655560136ded = 0 )
{
    donenote = ztron_util::function_86d9bcab81b0ff0d( "sawblade_done" );
    radius = 70;
    
    if ( player.ztron.var_2588c7465d7536b2 & 32768 )
    {
        radius = int( radius * 2 );
    }
    
    blade_array = [];
    angle = ( 0, 180, 180 );
    blade = function_1b8fb201ec59e85e( player.origin + ( radius, 0, 32 ), angle );
    
    if ( isdefined( blade ) )
    {
        blade_array[ blade_array.size ] = blade;
    }
    
    if ( !var_4f41655560136ded )
    {
        duration = function_cfa2b891bf9e311c( player, duration );
    }
    
    blade.lifetime = duration;
    
    if ( storebought )
    {
        save = spawnstruct();
        save.ref = "ztron_store_sawblade_5min";
        save.entity = blade;
        save.var_c93abd0f18db7640 = &function_e9c72efb25768863;
        player thread ztron_save::function_70c11aca4f83fcda( save );
    }
    
    if ( player.ztron.var_2588c7465d7536b2 & 32768 )
    {
        angle = ( 180, 180, 0 );
        var_f442e53bfd8cb802 = function_1b8fb201ec59e85e( player.origin + ( radius * -1, 0, 32 ), angle );
        
        if ( isdefined( var_f442e53bfd8cb802 ) )
        {
            blade_array[ blade_array.size ] = var_f442e53bfd8cb802;
        }
    }
    
    foreach ( blade in blade_array )
    {
        trigger = spawn( "trigger_box", blade.origin, 0, ( 24, 10, 24 ), ( 24, 10, 24 ) );
        
        if ( isdefined( trigger ) )
        {
            trigger enablelinkto();
            trigger linkto( blade );
            blade.trigger = trigger;
            trigger thread function_bb93c96db27a64a2( player, donenote );
            
            /#
                blade thread function_48a9fe78bdd85c17( trigger, player, donenote );
            #/
            
            continue;
        }
        
        blade_array = arrayremove( blade_array, blade );
        blade delete();
    }
    
    if ( blade_array.size == 0 )
    {
        return false;
    }
    
    rotation_center = ztron_item::function_8b0c01e93664327d( player, "tag_origin", blade_array, 360 );
    rotation_center.blade_count = blade_array.size;
    
    foreach ( blade in blade_array )
    {
        player thread function_456dd2340d0acf25( blade, storebought, donenote, rotation_center );
    }
    
    player thread function_5f27aa19e6958bde( blade_array, duration, donenote );
    player thread sawbladevehiclewatcher( donenote, storebought );
    return true;
}

// Namespace namespace_a1597a4eb2463645
// Params 2, eflags: 0x4
// Checksum 0x35445e46, Offset: 0x666
// Size: 0x4c
function private sawbladevehiclewatcher( donenote, storebought = 0 )
{
    level endon( #"ztron_game_is_over" );
    self endon( donenote );
    self waittill( #"enter_vehicle" );
    
    if ( isdefined( self ) && !storebought )
    {
        self notify( donenote );
    }
}

// Namespace namespace_a1597a4eb2463645
// Params 2, eflags: 0x4
// Checksum 0x294295d9, Offset: 0x6ba
// Size: 0x17a
function private function_bb93c96db27a64a2( player, donenote )
{
    level endon( #"ztron_game_is_over" );
    player endon( donenote );
    player endon( #"disconnect" );
    self endon( #"death" );
    
    while ( isdefined( self ) )
    {
        self waittill( #"trigger", ent );
        
        if ( ent.var_280397aa85f15ab4 || ent.ztron.boss )
        {
            continue;
        }
        
        if ( isai( ent ) && ent.unittype == "zombie" )
        {
            time = gettime();
            
            if ( ent.var_4b2404973226fcf4 > time )
            {
                continue;
            }
            
            if ( !ent.nogib )
            {
                ent zombie_knockdown::knockdown_ai( self.origin );
                ent zombie_base_dismemberment::dismember_legs();
            }
            
            if ( randomint( 100 ) < 30 )
            {
                ent thread ztron_util::function_ea0a0be5c5468c48( randomfloatrange( 5, 10 ), player, "MOD_UNKNOWN" );
                ent dodamage( ent.maxhealth >> 1, ent.origin, player, self, "MOD_UNKNOWN" );
            }
            else
            {
                ent dodamage( ent.health, ent.origin, player, self, "MOD_UNKNOWN" );
            }
            
            ent.var_4b2404973226fcf4 = time + 1000;
        }
    }
}

// Namespace namespace_a1597a4eb2463645
// Params 3, eflags: 0x4
// Checksum 0xc59379b5, Offset: 0x83c
// Size: 0xd5
function private function_5f27aa19e6958bde( blade_array, time, donenote )
{
    self endon( donenote );
    self endon( #"disconnect" );
    
    while ( !ztron_item::function_4b0636e7b2fc461f() )
    {
        waitframe();
    }
    
    while ( time > 0 )
    {
        wait 1;
        time--;
        
        foreach ( blade in blade_array )
        {
            if ( blade.lifetime )
            {
                blade.lifetime--;
            }
        }
    }
    
    self notify( donenote );
}

// Namespace namespace_a1597a4eb2463645
// Params 4, eflags: 0x4
// Checksum 0x53762056, Offset: 0x919
// Size: 0x15e
function private function_456dd2340d0acf25( blade, storebought = 0, donenote, rotation_center )
{
    if ( storebought )
    {
        utility::waittill_any( donenote, "disconnect", "kill_shield", "death", "clear_active_item" );
    }
    else
    {
        utility::waittill_any( donenote, "kill_shield", "disconnect", "clone_shutdown", "death" );
    }
    
    self notify( donenote );
    ztron_sound::ztron_stopsound( blade );
    waitframe();
    
    if ( isdefined( blade.trigger ) )
    {
        blade.trigger delete();
    }
    
    if ( isdefined( blade ) )
    {
        ztron_item::function_21c3b4ab8aa7468d( [ blade ] );
        rotation_center.blade_count--;
        
        if ( rotation_center.blade_count <= 0 )
        {
            ztron_item::function_39d7023e3666b11e( rotation_center );
        }
        
        blade solid();
        vel = ( 0, 0, 20 );
        
        if ( isdefined( self ) )
        {
            targetpos = ( self.origin[ 0 ], self.origin[ 1 ], blade.origin[ 2 ] );
            vel = blade.origin - targetpos;
        }
        
        blade physicslaunchserver( blade.origin, vel * 10 );
        wait 5;
        blade delete();
    }
}

/#

    // Namespace namespace_a1597a4eb2463645
    // Params 3, eflags: 0x4
    // Checksum 0x3ce3515a, Offset: 0xa7f
    // Size: 0x7f, Type: dev
    function private function_48a9fe78bdd85c17( trigger, player, donenote )
    {
        level endon( #"ztron_game_is_over" );
        player endon( donenote );
        setdvarifuninitialized( @"scr_debug_draw_sawblade", 0 );
        
        while ( isdefined( trigger ) )
        {
            if ( getdvarint( @"scr_debug_draw_sawblade" ) )
            {
                drawtrigger( trigger, ( 0, 1, 0 ), 0, 0, 0, ( 0, 1, 0 ) );
            }
            
            waitframe();
        }
    }

#/
