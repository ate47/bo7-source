#using script_40b59d0e3258fa0e;
#using script_60cc31ea91d0ad55;
#using script_6c2f6a14fa53759e;
#using scripts\asm\asm;
#using scripts\asm\shared\variant_asm;
#using scripts\common\callbacks;

#namespace namespace_14bc21a938ce7ab8;

// Namespace namespace_14bc21a938ce7ab8
// Params 0
// Checksum 0xcd88710, Offset: 0xda
// Size: 0x29
function function_59a7855b0081fa78()
{
    callback::get_template( self.animsetname ) callback::add( "on_move_speed_changed", &on_move_speed_changed );
    function_92324f04c88491bc();
}

// Namespace namespace_14bc21a938ce7ab8
// Params 0
// Checksum 0x459f93f7, Offset: 0x10b
// Size: 0x10
function init_zombie_amalgam_move()
{
    namespace_56081b33e0a40eac::init_move();
    thread zombie_wander::wander_listener();
}

// Namespace namespace_14bc21a938ce7ab8
// Params 0
// Checksum 0x1864dde7, Offset: 0x123
// Size: 0x9
function function_a5316e87722b6ac4()
{
    thread function_8d70515506fdb6e0();
}

// Namespace namespace_14bc21a938ce7ab8
// Params 0, eflags: 0x4
// Checksum 0x91dbb94a, Offset: 0x134
// Size: 0x50
function private function_8d70515506fdb6e0()
{
    self endon( #"death" );
    waitframe();
    
    if ( !isdefined( self.extra_leg_count ) || self.extra_leg_count < 2 )
    {
        zombie_utils::function_a8ce00e0448cb6f0( "run", "legs_destroyed", 15 );
        return;
    }
    
    zombie_utils::function_a8ce00e0448cb6f0( undefined, "legs_destroyed" );
}

// Namespace namespace_14bc21a938ce7ab8
// Params 0, eflags: 0x4
// Checksum 0x8a43f751, Offset: 0x18c
// Size: 0x63
function private function_92324f04c88491bc()
{
    variant_asm::register_anim_variant( "move", &function_83979130715e100f, &function_bf404fd24aab4c49 );
    variant_asm::function_6ffb0fbe59bdcb82( "move", function_39ca1a41b0038b36( "walk" ), 1 );
    variant_asm::function_6ffb0fbe59bdcb82( "move", function_39ca1a41b0038b36( "run" ), 1 );
    variant_asm::function_6ffb0fbe59bdcb82( "move", function_39ca1a41b0038b36( "sprint" ), 1 );
}

// Namespace namespace_14bc21a938ce7ab8
// Params 1, eflags: 0x4
// Checksum 0xe58599c9, Offset: 0x1f7
// Size: 0x5d
function private on_move_speed_changed( params )
{
    move_anim_alias = variant_asm::function_1e9b4a2fe400d128( "move" );
    
    /#
        record3dtext( "<dev string:x24>" + move_anim_alias, self.origin + ( 0, 0, 48 ), ( 1, 0, 0 ), "<dev string:x39>", self );
    #/
}

// Namespace namespace_14bc21a938ce7ab8
// Params 1, eflags: 0x4
// Checksum 0xa5290558, Offset: 0x25c
// Size: 0x2c
function private function_39ca1a41b0038b36( move_type )
{
    struct = spawnstruct();
    struct.move_type = move_type;
    return struct;
}

// Namespace namespace_14bc21a938ce7ab8
// Params 1, eflags: 0x4
// Checksum 0xf165d98b, Offset: 0x291
// Size: 0x90
function private function_83979130715e100f( struct )
{
    alias = "";
    
    if ( isdefined( struct.move_type ) )
    {
        if ( self._blackboard.movetype != struct.move_type )
        {
            return;
        }
        
        alias += struct.move_type;
    }
    
    assert( alias != "<dev string:x40>", "<dev string:x41>" + self._blackboard.movetype + "<dev string:x65>" );
    return alias;
}

// Namespace namespace_14bc21a938ce7ab8
// Params 1, eflags: 0x4
// Checksum 0x9d9fde7c, Offset: 0x32a
// Size: 0x45
function private function_bf404fd24aab4c49( alias )
{
    self function_695b8e1b655c2796( "move", alias );
    
    if ( asm::asm_currentstatehasflag( self.asmname, "move" ) )
    {
        asm::asm_fireevent_internal( self.asmname, "loop_reroll_anim" );
    }
}

