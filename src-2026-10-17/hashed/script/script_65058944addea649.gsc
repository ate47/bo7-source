#using script_40b59d0e3258fa0e;
#using script_60cc31ea91d0ad55;
#using script_6c2f6a14fa53759e;
#using scripts\asm\asm;
#using scripts\common\callbacks;

#namespace namespace_d598cc4fc9febb8e;

// Namespace namespace_d598cc4fc9febb8e
// Params 0
// Checksum 0x4587a88e, Offset: 0xfc
// Size: 0x42
function function_c808d3dbda1b17ff()
{
    callback::get_template( self.animsetname ) callback::add( "on_move_speed_changed", &function_826d4d7d3ddd05a3 );
    callback::get_template( self.animsetname ) callback::add( "on_is_moving_melee_changed", &function_f66695cdf2c14061 );
}

// Namespace namespace_d598cc4fc9febb8e
// Params 0
// Checksum 0x7dfc384, Offset: 0x146
// Size: 0x17
function init_zombie_shade_move()
{
    namespace_56081b33e0a40eac::init_move();
    thread function_352c1e34e7c6f128();
    thread zombie_wander::wander_listener();
}

// Namespace namespace_d598cc4fc9febb8e
// Params 1, eflags: 0x4
// Checksum 0xda9f9fdc, Offset: 0x165
// Size: 0x5c
function private function_826d4d7d3ddd05a3( params )
{
    self.var_8276841ec402381f = function_565827781d82d7c1();
    
    /#
        record3dtext( "<dev string:x24>" + self.var_8276841ec402381f, self.origin + ( 0, 0, 48 ), ( 1, 0, 0 ), "<dev string:x39>", self );
    #/
}

// Namespace namespace_d598cc4fc9febb8e
// Params 1, eflags: 0x4
// Checksum 0x587494e6, Offset: 0x1c9
// Size: 0x13
function private function_f66695cdf2c14061( params )
{
    function_565827781d82d7c1();
}

// Namespace namespace_d598cc4fc9febb8e
// Params 0, eflags: 0x4
// Checksum 0xad0b9957, Offset: 0x1e4
// Size: 0xb2
function private function_565827781d82d7c1()
{
    animset = self.animsetname;
    
    if ( !( isdefined( level.variant_type_max[ self.animsetname ] ) && isdefined( level.variant_type_max[ self.animsetname ] ) ) )
    {
        animset = self findoverridearchetype( "default" );
    }
    
    featurearray = [];
    alias = self function_805ca5e408d630c0( animset, "move_loop", featurearray, 1 );
    self function_695b8e1b655c2796( "move", alias );
    
    if ( asm::asm_currentstatehasflag( self.asmname, "move" ) )
    {
        asm::asm_fireevent_internal( self.asmname, "loop_reroll_anim" );
    }
    
    return alias;
}

// Namespace namespace_d598cc4fc9febb8e
// Params 0, eflags: 0x4
// Checksum 0xe892810f, Offset: 0x29f
// Size: 0x50
function private function_352c1e34e7c6f128()
{
    self endon( #"death" );
    
    while ( true )
    {
        self waittill( #"sprint_to_target_vehicle_start" );
        zombie_utils::function_a8ce00e0448cb6f0( "sprint", "vehicle_chase", 29 );
        self waittill( #"sprint_to_target_vehicle_end" );
        zombie_utils::function_a8ce00e0448cb6f0( undefined, "vehicle_chase" );
    }
}

