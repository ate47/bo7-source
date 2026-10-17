#using scripts\asm\asm;
#using scripts\common\callbacks;

#namespace namespace_7b1c2d73686554c8;

// Namespace namespace_7b1c2d73686554c8
// Params 0
// Checksum 0x28eb02e7, Offset: 0x91
// Size: 0x2c
function function_7a6a165095e8e0e7()
{
    callback::add( #"hash_ac987ecfe2199639", &on_start_grab );
    callback::add( #"hash_1422ba4cf377766c", &on_start_pull );
}

// Namespace namespace_7b1c2d73686554c8
// Params 1, eflags: 0x4
// Checksum 0xe08f6adc, Offset: 0xc5
// Size: 0x1f
function private on_start_grab( params )
{
    update_state_animations();
    asm::asm_setstate( "grab_chunk" );
}

// Namespace namespace_7b1c2d73686554c8
// Params 1, eflags: 0x4
// Checksum 0x59549110, Offset: 0xec
// Size: 0x21
function private on_start_pull( params )
{
    asm::asm_fireevent( self.asmname, "exit_loop" );
}

// Namespace namespace_7b1c2d73686554c8
// Params 0
// Checksum 0x87c3eafc, Offset: 0x115
// Size: 0x5a
function update_state_animations()
{
    self._blackboard.var_71e4226249c26ebf = self.barricade_data.attack_spot;
    self._blackboard.var_b05be297c2f48b10 = self.barricade_data.chunk.index;
}

