#using scripts\asm\asm;

#namespace namespace_e37d5618fa22d025;

// Namespace namespace_e37d5618fa22d025
// Params 3
// Checksum 0x4e036512, Offset: 0x76
// Size: 0x84
function playdeathanim_melee_ragdolldelayed( asmname, statename, params )
{
    var_39474a4f2b767d61 = isagent( self );
    
    if ( !var_39474a4f2b767d61 )
    {
        if ( isdefined( self.meleestatename ) )
        {
            time = params;
            
            if ( !isdefined( time ) )
            {
                time = 10;
            }
            
            asm::asm_donotetrackswithtimeout( asmname, self.meleestatename, time );
        }
    }
    
    if ( !isdefined( self ) )
    {
        return;
    }
    
    if ( !var_39474a4f2b767d61 )
    {
        self startragdoll();
        wait 0.1;
    }
}

