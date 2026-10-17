#using script_40b59d0e3258fa0e;
#using script_60cc31ea91d0ad55;
#using scripts\asm\asm;
#using scripts\asm\shared\variant_asm;
#using scripts\common\callbacks;

#namespace namespace_5aa19eac128c0939;

// Namespace namespace_5aa19eac128c0939
// Params 0
// Checksum 0x3fc261b0, Offset: 0xc8
// Size: 0x76
function register_move_variant()
{
    variant_asm::register_anim_variant( "move", &function_83979130715e100f, &function_bf404fd24aab4c49 );
    variant_asm::function_6ffb0fbe59bdcb82( "move", function_39ca1a41b0038b36( "walk" ), 1 );
    variant_asm::function_6ffb0fbe59bdcb82( "move", function_39ca1a41b0038b36( "run" ), 1 );
    variant_asm::function_6ffb0fbe59bdcb82( "move", function_39ca1a41b0038b36( "sprint" ), 1 );
    variant_asm::function_6ffb0fbe59bdcb82( "move", function_39ca1a41b0038b36( undefined ) );
}

// Namespace namespace_5aa19eac128c0939
// Params 0
// Checksum 0x72a530ca, Offset: 0x146
// Size: 0x21
function init_zombie_mangler_move()
{
    callback::add( "on_move_speed_changed", &function_826d4d7d3ddd05a3 );
    namespace_56081b33e0a40eac::init_move();
    thread zombie_wander::wander_listener();
}

// Namespace namespace_5aa19eac128c0939
// Params 1, eflags: 0x4
// Checksum 0x223f19fe, Offset: 0x16f
// Size: 0x5d
function private function_826d4d7d3ddd05a3( params )
{
    anim_alias = variant_asm::function_1e9b4a2fe400d128( "move" );
    
    /#
        record3dtext( "<dev string:x24>" + anim_alias, self.origin + ( 0, 0, 48 ), ( 1, 0, 0 ), "<dev string:x39>", self );
    #/
}

// Namespace namespace_5aa19eac128c0939
// Params 1, eflags: 0x4
// Checksum 0x3474ced6, Offset: 0x1d4
// Size: 0x2c
function private function_39ca1a41b0038b36( move_type )
{
    struct = spawnstruct();
    struct.move_type = move_type;
    return struct;
}

// Namespace namespace_5aa19eac128c0939
// Params 1, eflags: 0x4
// Checksum 0x60381205, Offset: 0x209
// Size: 0x90
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
    
    assert( alias != "<dev string:x40>", "<dev string:x41>" + self._blackboard.movetype + "<dev string:x65>" );
    return alias;
}

// Namespace namespace_5aa19eac128c0939
// Params 1, eflags: 0x4
// Checksum 0xcc215f2, Offset: 0x2a2
// Size: 0x45
function private function_bf404fd24aab4c49( alias )
{
    self function_695b8e1b655c2796( "move", alias );
    
    if ( asm::asm_currentstatehasflag( self.asmname, "move" ) )
    {
        asm::asm_fireevent_internal( self.asmname, "loop_reroll_anim" );
    }
}

