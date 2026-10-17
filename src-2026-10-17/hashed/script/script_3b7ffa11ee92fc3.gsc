#using script_25faf487ae3aa165;
#using script_40b59d0e3258fa0e;
#using script_60cc31ea91d0ad55;
#using script_6c2f6a14fa53759e;
#using scripts\asm\asm;
#using scripts\asm\shared\variant_asm;
#using scripts\common\callbacks;
#using scripts\common\math;
#using scripts\common\utility;

#namespace namespace_727d0e47a23f487a;

// Namespace namespace_727d0e47a23f487a
// Params 0
// Checksum 0x4cabdf54, Offset: 0x14d
// Size: 0x5d
function register_move_variant()
{
    variant_asm::register_anim_variant( "move", &function_83979130715e100f, &function_bf404fd24aab4c49 );
    variant_asm::function_6ffb0fbe59bdcb82( "move", function_39ca1a41b0038b36( "walk" ) );
    variant_asm::function_6ffb0fbe59bdcb82( "move", function_39ca1a41b0038b36( "run" ) );
    variant_asm::function_6ffb0fbe59bdcb82( "move", function_39ca1a41b0038b36( "sprint" ) );
}

// Namespace namespace_727d0e47a23f487a
// Params 0
// Checksum 0x42eaa301, Offset: 0x1b2
// Size: 0x62
function function_fabff9bb707db7b5()
{
    callback::get_template( self.animsetname ) callback::add( "on_move_speed_changed", &function_826d4d7d3ddd05a3 );
    callback::get_template( self.animsetname ) callback::add( "head_destroyed", &function_2d319dfafe769e14 );
    callback::get_template( self.animsetname ) callback::add( "zombie_melee", &function_2cbf83bf33a6a1e7 );
}

// Namespace namespace_727d0e47a23f487a
// Params 0
// Checksum 0xc6b6c94, Offset: 0x21c
// Size: 0x59
function init_zombie_abom_move()
{
    namespace_56081b33e0a40eac::init_move();
    self.var_8ff2ecec3f1493ac = 100;
    self.turnrate = 0.1;
    self.var_a91bd029284b1261 = getdvarint( @"hash_d6e3599499e45349", 1 );
    thread zombie_wander::wander_listener( &function_17a00f3f23901a6a, &function_ef517176561ce30a );
    thread function_928a49af2ee2a2de();
    thread function_9f2037084bed2892();
}

// Namespace namespace_727d0e47a23f487a
// Params 1, eflags: 0x4
// Checksum 0xa1071c97, Offset: 0x27d
// Size: 0x2a
function private function_826d4d7d3ddd05a3( params )
{
    anim_alias = variant_asm::function_1e9b4a2fe400d128( "move" );
    set_default_turn_rate();
}

// Namespace namespace_727d0e47a23f487a
// Params 0, eflags: 0x4
// Checksum 0x96d5d0f9, Offset: 0x2af
// Size: 0x3d
function private set_default_turn_rate()
{
    if ( self._blackboard.movetype == "sprint" )
    {
        self.turnrate = 0.2;
        return;
    }
    
    self.turnrate = 0.1;
}

// Namespace namespace_727d0e47a23f487a
// Params 1, eflags: 0x4
// Checksum 0x8ee5ae50, Offset: 0x2f4
// Size: 0x2c
function private function_39ca1a41b0038b36( move_type )
{
    struct = spawnstruct();
    struct.move_type = move_type;
    return struct;
}

// Namespace namespace_727d0e47a23f487a
// Params 1, eflags: 0x4
// Checksum 0xaf425a2b, Offset: 0x329
// Size: 0x61
function private function_83979130715e100f( struct )
{
    alias = "";
    
    if ( isdefined( struct.move_type ) )
    {
        alias += struct.move_type;
        
        if ( self._blackboard.movetype != struct.move_type )
        {
            return;
        }
    }
    
    return alias;
}

// Namespace namespace_727d0e47a23f487a
// Params 1, eflags: 0x4
// Checksum 0xb6537574, Offset: 0x393
// Size: 0x45
function private function_bf404fd24aab4c49( alias )
{
    self function_695b8e1b655c2796( "move", alias );
    
    if ( asm::asm_currentstatehasflag( self.asmname, "move" ) )
    {
        asm::asm_fireevent_internal( self.asmname, "loop_reroll_anim" );
    }
}

// Namespace namespace_727d0e47a23f487a
// Params 1, eflags: 0x4
// Checksum 0x5e2fe8a0, Offset: 0x3e0
// Size: 0x5c
function private function_2d319dfafe769e14( params )
{
    if ( params.heads_remaining.size == 1 && self.zombieaisettings.var_d3de1a9faac42deb.var_a2d07a703149a776 )
    {
        zombie_utils::function_a8ce00e0448cb6f0( "sprint", "abom_rage_mode", 30 );
        return;
    }
    
    thread function_b99ffd5e3f6151b2();
}

// Namespace namespace_727d0e47a23f487a
// Params 0, eflags: 0x4
// Checksum 0xb7f742b5, Offset: 0x444
// Size: 0x9
function private function_17a00f3f23901a6a()
{
    thread zombie_abom_audio::play_zombie_ambient_repeating();
}

// Namespace namespace_727d0e47a23f487a
// Params 0, eflags: 0x4
// Checksum 0xcbf09dc3, Offset: 0x455
// Size: 0xe
function private function_ef517176561ce30a()
{
    self notify( #"hash_4ad5af914cce06a3" );
}

// Namespace namespace_727d0e47a23f487a
// Params 0, eflags: 0x4
// Checksum 0x15d651a8, Offset: 0x46b
// Size: 0x116
function private function_b99ffd5e3f6151b2()
{
    self endon( #"death" );
    self notify( #"hash_4265e58739fb2763" );
    self endon( #"hash_4265e58739fb2763" );
    zombie_utils::function_a8ce00e0448cb6f0( "sprint", "abom_rage_mode", 30 );
    round_number = zombie_utils::get_zombie_round_difficulty();
    additional_rage_time = clamp( math::remap( round_number, 20, 50, 0, 20 ), 0, 20 );
    rage_time = 10 + additional_rage_time;
    end_rage_time = gettime() + rage_time * 1000;
    var_c50a2378fcf10d62 = function_945140eda5eaff40();
    var_bbfa7cf60bf3423b = 0;
    
    while ( gettime() < end_rage_time && var_bbfa7cf60bf3423b < var_c50a2378fcf10d62 )
    {
        var_d438c97c271ab234 = ( end_rage_time - gettime() ) / 1000;
        
        if ( var_d438c97c271ab234 <= 0 )
        {
            break;
        }
        
        wait_result = utility::waittill_any_timeout( rage_time, "melee_hit_ent" );
        
        if ( wait_result == "melee_hit_ent" )
        {
            var_bbfa7cf60bf3423b += 1;
        }
    }
    
    zombie_utils::function_a8ce00e0448cb6f0( undefined, "abom_rage_mode", 30 );
}

// Namespace namespace_727d0e47a23f487a
// Params 0, eflags: 0x4
// Checksum 0x28908ef2, Offset: 0x589
// Size: 0x106
function private function_945140eda5eaff40()
{
    target_range = 1000;
    var_96560dd8d0522b = 4;
    target_query = physics_querypoint( self.origin, target_range, physics_createcontents( [ "physicscontents_characterproxy" ] ), [ self ], "physicsquery_all" );
    target_list = [];
    
    foreach ( target in target_query )
    {
        target_ent = target[ "entity" ];
        
        if ( isalive( target_ent ) && target_ent.team != self.team )
        {
            target_list[ target_list.size ] = target_ent;
        }
    }
    
    return clamp( target_list.size, 1, var_96560dd8d0522b );
}

// Namespace namespace_727d0e47a23f487a
// Params 1, eflags: 0x4
// Checksum 0xa8966ee2, Offset: 0x698
// Size: 0x27
function private function_2cbf83bf33a6a1e7( params )
{
    if ( isdefined( params.meleehitent ) )
    {
        self notify( #"melee_hit_ent" );
    }
}

// Namespace namespace_727d0e47a23f487a
// Params 0, eflags: 0x4
// Checksum 0x19979bd4, Offset: 0x6c7
// Size: 0x78
function private function_928a49af2ee2a2de()
{
    self endon( #"death" );
    var_46651c85d2b7c78 = self.zombieaisettings.var_d3de1a9faac42deb.var_274204e1cf603397;
    
    if ( !isdefined( var_46651c85d2b7c78 ) || var_46651c85d2b7c78 <= 0 )
    {
        return;
    }
    
    while ( true )
    {
        msg = utility::waittill_notify_or_timeout_return( "melee_hit_ent", var_46651c85d2b7c78 );
        
        if ( msg != "melee_hit_ent" )
        {
            function_b99ffd5e3f6151b2();
        }
    }
}

// Namespace namespace_727d0e47a23f487a
// Params 0, eflags: 0x4
// Checksum 0x22466269, Offset: 0x747
// Size: 0x110
function private function_9f2037084bed2892()
{
    self endon( #"death" );
    
    while ( true )
    {
        path_points = self getpath( 1, 2, 1, 1 );
        b_has_traversal = path_points.size >= 1 && ( path_points[ 0 ].flags & 2 ) != 0;
        var_7a9914924cac4cc = path_points.size >= 2 && ( path_points[ 1 ].flags & 2 ) != 0;
        
        if ( b_has_traversal )
        {
            if ( self.turnrate < 0.3 )
            {
                self.var_a91bd029284b1261 = 0;
                self.turnrate = 0.3;
            }
        }
        else
        {
            if ( self.turnrate >= 0.3 )
            {
                set_default_turn_rate();
            }
            
            var_806934c028481775 = getdvarint( @"hash_d6e3599499e45349", 1 );
            
            if ( self.var_a91bd029284b1261 != var_806934c028481775 )
            {
                self.var_a91bd029284b1261 = var_806934c028481775;
            }
        }
        
        wait b_has_traversal || var_7a9914924cac4cc ? 0.2 : 1;
    }
}

