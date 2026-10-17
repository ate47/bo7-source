#using scripts\asm\asm;

#namespace zombie_melee_asm;

// Namespace zombie_melee_asm
// Params 1
// Checksum 0x26d7a5c1, Offset: 0x90
// Size: 0x25
function register_melee_state( state_name )
{
    assert( isstring( state_name ) );
    self.melee_state = state_name;
}

// Namespace zombie_melee_asm
// Params 2
// Checksum 0x4ab7596e, Offset: 0xbd
// Size: 0x2b
function function_d5c5dea62200a953( var_f5892c3814093795, var_3b9e4a3352ba8b8b )
{
    self.var_f5892c3814093795 = var_f5892c3814093795;
    self.var_3b9e4a3352ba8b8b = var_3b9e4a3352ba8b8b;
}

// Namespace zombie_melee_asm
// Params 0
// Checksum 0xa377ecd, Offset: 0xf0
// Size: 0x87
function request_melee_asm_state()
{
    if ( isdefined( self.var_f5892c3814093795 ) )
    {
        var_63980231c864f4c2 = [[ self.var_f5892c3814093795 ]]();
        
        if ( var_63980231c864f4c2 )
        {
            assert( isdefined( self.var_3b9e4a3352ba8b8b ) );
            [[ self.var_3b9e4a3352ba8b8b ]]();
            return;
        }
    }
    
    if ( self.zombieaisettings.var_8485529ab74d2d37 )
    {
        asm::function_7256f5ba459c840b( "explode_in" );
        return;
    }
    
    asm::function_7256f5ba459c840b( self.melee_state ?? "melee_in" );
}

