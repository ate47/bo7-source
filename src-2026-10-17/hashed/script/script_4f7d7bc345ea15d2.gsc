#using scripts\common\callbacks;

#namespace namespace_c1b8689546c46bf1;

// Namespace namespace_c1b8689546c46bf1
// Params 0
// Checksum 0x83bafdc7, Offset: 0xc1
// Size: 0x42
function function_6dd40c049ad344c0()
{
    callback::get_template( self.animsetname ) callback::add( "on_is_moving_melee_changed", &function_e0d499c13803af86 );
    callback::get_template( self.animsetname ) callback::add( "on_move_speed_changed", &melee_on_move_speed_changed );
}

// Namespace namespace_c1b8689546c46bf1
// Params 0
// Checksum 0x8d0e01d9, Offset: 0x10b
// Size: 0x9
function init_zombie_galileo_melee()
{
    function_1a57e936d77691d2();
}

// Namespace namespace_c1b8689546c46bf1
// Params 1, eflags: 0x4
// Checksum 0x84ccfab0, Offset: 0x11c
// Size: 0x13
function private function_e0d499c13803af86( params )
{
    function_1a57e936d77691d2();
}

// Namespace namespace_c1b8689546c46bf1
// Params 1, eflags: 0x4
// Checksum 0xdffb2d5b, Offset: 0x137
// Size: 0x13
function private melee_on_move_speed_changed( params )
{
    function_1a57e936d77691d2();
}

// Namespace namespace_c1b8689546c46bf1
// Params 0, eflags: 0x4
// Checksum 0x5ddbf29, Offset: 0x152
// Size: 0xb2
function private function_1a57e936d77691d2()
{
    animset = self.animsetname;
    
    if ( !( isdefined( level.variant_type_max[ self.animsetname ] ) && isdefined( level.variant_type_max[ self.animsetname ] ) ) )
    {
        animset = self findoverridearchetype( "default" );
    }
    
    featurearray = [];
    alias = self function_805ca5e408d630c0( animset, "melee", featurearray, 0 );
    assert( isdefined( alias ), "<dev string:x24>" + self._blackboard.movetype );
    
    if ( isdefined( alias ) )
    {
        self function_695b8e1b655c2796( "melee", alias );
    }
    
    return alias;
}

