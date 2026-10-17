#using script_40b59d0e3258fa0e;
#using script_60cc31ea91d0ad55;
#using scripts\asm\asm;
#using scripts\asm\shared\variant_asm;
#using scripts\common\callbacks;

#namespace namespace_f8183ce4e15db3da;

// Namespace namespace_f8183ce4e15db3da
// Params 0
// Checksum 0xdf721236, Offset: 0xc8
// Size: 0x5d
function function_b1c1009e68f9b112()
{
    variant_asm::register_anim_variant( "move", &function_83979130715e100f, &function_bf404fd24aab4c49 );
    variant_asm::function_6ffb0fbe59bdcb82( "move", function_39ca1a41b0038b36( "walk" ) );
    variant_asm::function_6ffb0fbe59bdcb82( "move", function_39ca1a41b0038b36( "run" ) );
    variant_asm::function_6ffb0fbe59bdcb82( "move", function_39ca1a41b0038b36( "sprint" ) );
}

// Namespace namespace_f8183ce4e15db3da
// Params 0
// Checksum 0x1f338e73, Offset: 0x12d
// Size: 0x21
function init_zombie_vermin_move()
{
    callback::add( "on_move_speed_changed", &on_move_speed_changed );
    namespace_56081b33e0a40eac::init_move();
    thread zombie_wander::wander_listener();
}

// Namespace namespace_f8183ce4e15db3da
// Params 1
// Checksum 0x92e14535, Offset: 0x156
// Size: 0x61
function on_move_speed_changed( params )
{
    self.var_8276841ec402381f = variant_asm::function_1e9b4a2fe400d128( "move" );
    
    /#
        record3dtext( "<dev string:x24>" + self.var_8276841ec402381f, self.origin + ( 0, 0, 48 ), ( 1, 0, 0 ), "<dev string:x39>", self );
    #/
}

// Namespace namespace_f8183ce4e15db3da
// Params 1, eflags: 0x4
// Checksum 0xd24dd9a0, Offset: 0x1bf
// Size: 0x2c
function private function_39ca1a41b0038b36( move_type )
{
    struct = spawnstruct();
    struct.move_type = move_type;
    return struct;
}

// Namespace namespace_f8183ce4e15db3da
// Params 1, eflags: 0x4
// Checksum 0xec20a18b, Offset: 0x1f4
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

// Namespace namespace_f8183ce4e15db3da
// Params 1, eflags: 0x4
// Checksum 0xeafb0284, Offset: 0x25e
// Size: 0x45
function private function_bf404fd24aab4c49( alias )
{
    self function_695b8e1b655c2796( "move", alias );
    
    if ( asm::asm_currentstatehasflag( self.asmname, "move" ) )
    {
        asm::asm_fireevent_internal( self.asmname, "loop_reroll_anim" );
    }
}

