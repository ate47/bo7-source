#using script_151f9510acfc6ac9;
#using scripts\common\callbacks;
#using scripts\common\utility;

#namespace zombie_hermes_asm;

// Namespace zombie_hermes_asm
// Params 0, eflags: 0x4
// Checksum 0xbc77a275, Offset: 0xaa
// Size: 0x2
function private function_358c64f6ac74e0d3()
{
    
}

// Namespace zombie_hermes_asm
// Params 3
// Checksum 0x4f68e214, Offset: 0xb4
// Size: 0x6a
function function_b3311d566fd42efc( asmname, statename, params )
{
    if ( self.var_cc3703385f725b39 )
    {
        return;
    }
    
    self.var_cc3703385f725b39 = 1;
    zombie_init::zombie_init_ai_asm( &function_358c64f6ac74e0d3 );
    self animmode( "noclip" );
    callback::add( "on_ai_init", &on_ai_init );
    utility::ent_flag_set( "zombie_asm_init_finished" );
}

// Namespace zombie_hermes_asm
// Params 1, eflags: 0x4
// Checksum 0xf7ea0be3, Offset: 0x126
// Size: 0xc
function private on_ai_init( params )
{
    
}

