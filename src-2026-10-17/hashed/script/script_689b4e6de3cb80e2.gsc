#using script_e92a9717969a5cd;

#namespace namespace_4306fdf641484f1f;

// Namespace namespace_4306fdf641484f1f
// Params 0
// Checksum 0x5779eda5, Offset: 0xa1
// Size: 0x28, Type: bool
function is_looping()
{
    if ( !europa_asm::is_playing() )
    {
        return false;
    }
    
    currentstate = europa_asm::get_current_asm_state();
    return currentstate == "loop";
}

// Namespace namespace_4306fdf641484f1f
// Params 0
// Checksum 0x6b58791, Offset: 0xd2
// Size: 0xe
function exit_loop()
{
    europa_asm::fire_event( "exit_loop" );
}

// Namespace namespace_4306fdf641484f1f
// Params 1
// Checksum 0x7e705b80, Offset: 0xe8
// Size: 0x29
function play( cap_path )
{
    if ( europa_asm::is_playing() )
    {
        europa_asm::exit_cap();
    }
    
    return europa_asm::play_cap( "europa_simple_loop", cap_path );
}

