#using scripts\asm\asm;

#namespace dodge;

// Namespace dodge
// Params 3
// Checksum 0x5ad1f8cd, Offset: 0x90
// Size: 0xbb
function function_b1033bd5cf44c91c( asmname, statename, params )
{
    self endon( statename + "_finished" );
    assert( self.var_69466b4d3880bb7b >= 0 );
    animid = asm::asm_getanim( asmname, statename );
    xanim = asm::asm_getxanim( statename, animid );
    self aisetanim( statename, animid );
    asm::asm_playfacialanim( asmname, statename, asm::asm_getxanim( statename, animid ) );
    endnote = asm::asm_donotetracks( asmname, statename, asm::asm_getnotehandler( asmname, statename ) );
    
    if ( endnote == "code_move" )
    {
        endnote = asm::asm_donotetracks( asmname, statename, asm::asm_getnotehandler( asmname, statename ) );
    }
}

