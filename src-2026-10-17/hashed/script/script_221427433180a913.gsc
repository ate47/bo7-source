#using scripts\asm\asm;

#namespace namespace_b41e632cbe1b5a96;

// Namespace namespace_b41e632cbe1b5a96
// Params 3
// Checksum 0xd27ea7f6, Offset: 0xac
// Size: 0xda
function function_68aa07e5adc990f1( asmname, statename, params )
{
    switch ( self.var_d07937101f7ccc9f )
    {
        case 2:
            alias = "two_tornadoes";
            break;
        case 3:
            alias = "three_tornadoes";
            break;
        case 4:
            alias = "four_tornadoes";
            break;
        default:
            assert( 0, "<dev string:x24>" + self.var_d07937101f7ccc9f );
            break;
    }
    
    assert( asm::asm_hasalias( statename, alias ), "<dev string:x50>" + statename + "<dev string:x5b>" + alias );
    tornadoanim = asm::asm_chooseanim( asmname, statename, alias );
    return tornadoanim;
}

