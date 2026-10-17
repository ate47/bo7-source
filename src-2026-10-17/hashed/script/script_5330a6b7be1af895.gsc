#using scripts\asm\asm;

#namespace namespace_4b36059e132389a0;

// Namespace namespace_4b36059e132389a0
// Params 0
// Checksum 0xbbe15e4e, Offset: 0x8f
// Size: 0x89, Type: bool
function get_necrotic_beam_anim_length()
{
    var_51bd92a96b2f2068 = 10;
    
    if ( isdefined( self.asmname ) )
    {
        var_8eee94d91eab4f36 = asm::asm_getanim( self.asmname, "necrotic_beam", "beam" );
        
        if ( isdefined( var_8eee94d91eab4f36 ) && var_8eee94d91eab4f36 != -1 )
        {
            var_f57a421e6cace9f7 = asm::asm_getxanim( "necrotic_beam", var_8eee94d91eab4f36 );
            
            if ( isanimation( var_f57a421e6cace9f7 ) )
            {
                animlength = getanimlength( var_f57a421e6cace9f7 );
            }
        }
    }
    
    return animlength ?? var_51bd92a96b2f2068;
}

