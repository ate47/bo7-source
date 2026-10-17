#using script_40b59d0e3258fa0e;
#using script_60cc31ea91d0ad55;
#using scripts\asm\asm;
#using scripts\asm\shared\variant_asm;
#using scripts\common\callbacks;

#namespace namespace_6d185782b9282850;

// Namespace namespace_6d185782b9282850
// Params 0
// Checksum 0xe648e7d3, Offset: 0xee
// Size: 0xc1
function register_move_variant()
{
    variant_asm::register_anim_variant( "move", &function_83979130715e100f, &function_bf404fd24aab4c49 );
    variant_asm::function_6ffb0fbe59bdcb82( "move", function_39ca1a41b0038b36( "wander" ), 1 );
    variant_asm::function_6ffb0fbe59bdcb82( "move", function_39ca1a41b0038b36( "walk" ), 1 );
    variant_asm::function_6ffb0fbe59bdcb82( "move", function_39ca1a41b0038b36( "run_slow" ), 1 );
    variant_asm::function_6ffb0fbe59bdcb82( "move", function_39ca1a41b0038b36( "run" ), 2 );
    variant_asm::function_6ffb0fbe59bdcb82( "move", function_39ca1a41b0038b36( "sprint" ), 2 );
    variant_asm::function_6ffb0fbe59bdcb82( "move", function_39ca1a41b0038b36( "super_sprint" ), 2 );
    variant_asm::function_6ffb0fbe59bdcb82( "move", function_39ca1a41b0038b36( undefined ) );
}

// Namespace namespace_6d185782b9282850
// Params 0
// Checksum 0xe5843a97, Offset: 0x1b7
// Size: 0x21
function init_zombie_hellhound_move()
{
    callback::add( "on_move_speed_changed", &function_826d4d7d3ddd05a3 );
    namespace_56081b33e0a40eac::init_move();
    thread zombie_wander::wander_listener();
}

// Namespace namespace_6d185782b9282850
// Params 1, eflags: 0x4
// Checksum 0x88c61009, Offset: 0x1e0
// Size: 0x5d
function private function_826d4d7d3ddd05a3( params )
{
    anim_alias = variant_asm::function_1e9b4a2fe400d128( "move" );
    
    /#
        record3dtext( "<dev string:x24>" + anim_alias, self.origin + ( 0, 0, 48 ), ( 1, 0, 0 ), "<dev string:x39>", self );
    #/
}

// Namespace namespace_6d185782b9282850
// Params 1, eflags: 0x4
// Checksum 0x9e8dc721, Offset: 0x245
// Size: 0x2c
function private function_39ca1a41b0038b36( move_type )
{
    struct = spawnstruct();
    struct.move_type = move_type;
    return struct;
}

// Namespace namespace_6d185782b9282850
// Params 1, eflags: 0x4
// Checksum 0xb4553a01, Offset: 0x27a
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

// Namespace namespace_6d185782b9282850
// Params 1, eflags: 0x4
// Checksum 0xa63b1c05, Offset: 0x2e4
// Size: 0x45
function private function_bf404fd24aab4c49( alias )
{
    self function_695b8e1b655c2796( "move", alias );
    
    if ( asm::asm_currentstatehasflag( self.asmname, "move" ) )
    {
        asm::asm_fireevent_internal( self.asmname, "loop_reroll_anim" );
    }
}

// Namespace namespace_6d185782b9282850
// Params 1, eflags: 0x4
// Checksum 0xd4eca266, Offset: 0x331
// Size: 0xbe
function private function_edee40b7360afb8a( end_note )
{
    level endon( #"game_ended" );
    self endon( #"death" );
    
    if ( isdefined( end_note ) )
    {
        self endon( end_note );
    }
    
    if ( self.var_43d79e31059e0e5b )
    {
        return;
    }
    
    self function_fa32376aaa88a7a2( self.origin, 500 );
    last_pos = self.origin;
    
    while ( true )
    {
        if ( self.var_43d79e31059e0e5b )
        {
            return;
        }
        
        if ( !isdefined( self.enemy ) )
        {
            if ( distancesquared( last_pos, self.origin ) >= 90000 )
            {
                self function_fa32376aaa88a7a2( self.origin, 500 );
                last_pos = self.origin;
            }
        }
        
        wait 5;
    }
}

