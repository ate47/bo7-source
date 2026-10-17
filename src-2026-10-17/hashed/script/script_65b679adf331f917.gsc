#using script_60cc31ea91d0ad55;
#using scripts\asm\asm;
#using scripts\asm\shared\variant_asm;
#using scripts\common\callbacks;

#namespace namespace_86e54fbc3f05670c;

// Namespace namespace_86e54fbc3f05670c
// Params 0
// Checksum 0x3028de83, Offset: 0xd8
// Size: 0x74
function register_move_variant()
{
    variant_asm::register_anim_variant( "move", &function_83979130715e100f, &function_bf404fd24aab4c49 );
    variant_asm::function_6ffb0fbe59bdcb82( "move", function_39ca1a41b0038b36( "walk" ) );
    variant_asm::function_6ffb0fbe59bdcb82( "move", function_39ca1a41b0038b36( "run" ) );
    variant_asm::function_6ffb0fbe59bdcb82( "move", function_39ca1a41b0038b36( "sprint" ) );
    variant_asm::function_6ffb0fbe59bdcb82( "move", function_39ca1a41b0038b36( "super_sprint" ) );
}

// Namespace namespace_86e54fbc3f05670c
// Params 0
// Checksum 0xb83f9441, Offset: 0x154
// Size: 0x22
function function_8036d421ebeee5c7()
{
    callback::get_template( self.animsetname ) callback::add( "on_move_speed_changed", &function_826d4d7d3ddd05a3 );
}

// Namespace namespace_86e54fbc3f05670c
// Params 0
// Checksum 0x290480ab, Offset: 0x17e
// Size: 0x9
function init_zombie_callisto_move()
{
    namespace_56081b33e0a40eac::init_move();
}

// Namespace namespace_86e54fbc3f05670c
// Params 1, eflags: 0x4
// Checksum 0xc1bff261, Offset: 0x18f
// Size: 0x23
function private function_826d4d7d3ddd05a3( params )
{
    anim_alias = variant_asm::function_1e9b4a2fe400d128( "move" );
}

// Namespace namespace_86e54fbc3f05670c
// Params 1, eflags: 0x4
// Checksum 0xe22d08, Offset: 0x1ba
// Size: 0x2c
function private function_39ca1a41b0038b36( move_type )
{
    struct = spawnstruct();
    struct.move_type = move_type;
    return struct;
}

// Namespace namespace_86e54fbc3f05670c
// Params 1, eflags: 0x4
// Checksum 0x3278755d, Offset: 0x1ef
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

// Namespace namespace_86e54fbc3f05670c
// Params 1, eflags: 0x4
// Checksum 0x3854f62c, Offset: 0x259
// Size: 0x45
function private function_bf404fd24aab4c49( alias )
{
    self function_695b8e1b655c2796( "move", alias );
    
    if ( asm::asm_currentstatehasflag( self.asmname, "move" ) )
    {
        asm::asm_fireevent_internal( self.asmname, "loop_reroll_anim" );
    }
}

