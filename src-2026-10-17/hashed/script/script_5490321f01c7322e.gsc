#using scripts\asm\asm;

#namespace zombie_bite_asm;

// Namespace zombie_bite_asm
// Params 1
// Checksum 0x8c351e9, Offset: 0x81
// Size: 0x25
function register_bite_state( state_name )
{
    assert( isstring( state_name ) );
    self.bite_state = state_name;
}

// Namespace zombie_bite_asm
// Params 0
// Checksum 0x653a0611, Offset: 0xae
// Size: 0x32
function request_bite_asm_state()
{
    if ( self.bite_state_requested )
    {
        return;
    }
    
    self.bite_state_requested = 1;
    asm::function_7256f5ba459c840b( self.bite_state ?? "bite_in" );
}

