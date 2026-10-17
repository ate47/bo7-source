#using script_40b59d0e3258fa0e;
#using script_60cc31ea91d0ad55;
#using scripts\asm\asm;
#using scripts\asm\shared\variant_asm;
#using scripts\common\callbacks;

#namespace namespace_4154dd0f3deedad4;

// Namespace namespace_4154dd0f3deedad4
// Params 0
// Checksum 0xfaaaafe, Offset: 0xdc
// Size: 0x5d
function function_cba7159554197958()
{
    variant_asm::register_anim_variant( "move", &function_83979130715e100f, &function_bf404fd24aab4c49 );
    variant_asm::function_6ffb0fbe59bdcb82( "move", function_39ca1a41b0038b36( "walk" ) );
    variant_asm::function_6ffb0fbe59bdcb82( "move", function_39ca1a41b0038b36( "run" ) );
    variant_asm::function_6ffb0fbe59bdcb82( "move", function_39ca1a41b0038b36( "sprint" ) );
}

// Namespace namespace_4154dd0f3deedad4
// Params 0
// Checksum 0xa8bf09b1, Offset: 0x141
// Size: 0x22
function function_d517b4a2bc50095b()
{
    callback::get_template( self.animsetname ) callback::add( "on_move_speed_changed", &on_move_speed_changed );
}

// Namespace namespace_4154dd0f3deedad4
// Params 0
// Checksum 0xf2ebc962, Offset: 0x16b
// Size: 0x10
function init_zombie_parasite_move()
{
    namespace_56081b33e0a40eac::init_move();
    thread zombie_wander::wander_listener();
}

// Namespace namespace_4154dd0f3deedad4
// Params 1
// Checksum 0x2944e558, Offset: 0x183
// Size: 0x83
function on_move_speed_changed( params )
{
    anim_alias = variant_asm::function_1e9b4a2fe400d128( "move" );
    move_speed = self aigetdesiredspeed();
    self function_786bb6aa1b76c7ee( "float_move_speed", move_speed * level.framedurationseconds );
    
    /#
        record3dtext( "<dev string:x24>" + anim_alias, self.origin + ( 0, 0, 48 ), ( 1, 0, 0 ), "<dev string:x39>", self );
    #/
}

// Namespace namespace_4154dd0f3deedad4
// Params 1, eflags: 0x4
// Checksum 0x277cf0e0, Offset: 0x20e
// Size: 0x2c
function private function_39ca1a41b0038b36( move_type )
{
    struct = spawnstruct();
    struct.move_type = move_type;
    return struct;
}

// Namespace namespace_4154dd0f3deedad4
// Params 1, eflags: 0x4
// Checksum 0x3093c885, Offset: 0x243
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

// Namespace namespace_4154dd0f3deedad4
// Params 1, eflags: 0x4
// Checksum 0x1fca2bc4, Offset: 0x2ad
// Size: 0x45
function private function_bf404fd24aab4c49( alias )
{
    self function_695b8e1b655c2796( "move", alias );
    
    if ( asm::asm_currentstatehasflag( self.asmname, "move" ) )
    {
        asm::asm_fireevent_internal( self.asmname, "loop_reroll_anim" );
    }
}

