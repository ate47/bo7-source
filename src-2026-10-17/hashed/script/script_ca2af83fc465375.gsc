#using scripts\asm\asm;

#namespace namespace_69de094c38cf2d84;

// Namespace namespace_69de094c38cf2d84
// Params 0
// Checksum 0xa36cf2d4, Offset: 0xbf
// Size: 0x1a
function function_609bb007d270ea2b()
{
    asm::function_7256f5ba459c840b( self.vehicle_attack_state ?? "vehicle_attack_in" );
}

// Namespace namespace_69de094c38cf2d84
// Params 0
// Checksum 0xa87007e3, Offset: 0xe1
// Size: 0xa5
function function_4a67513563b1f915()
{
    var_2018c76b25f154cc = self.vehicle_attack_leap_intro_state ?? "vehicle_attack_leap_intro";
    
    if ( isdefined( self.asmname ) )
    {
        var_52ea5c225b7a292e = asm::asm_getanim( self.asmname, var_2018c76b25f154cc, "tag_ai_linkto_right" );
        
        if ( isdefined( var_52ea5c225b7a292e ) && var_52ea5c225b7a292e != -1 )
        {
            var_a1751522235d0f1f = asm::asm_getxanim( var_2018c76b25f154cc, var_52ea5c225b7a292e );
            
            if ( isanimation( var_a1751522235d0f1f ) )
            {
                animlength = getanimlength( var_a1751522235d0f1f );
            }
        }
    }
    
    return ( animlength ?? 0.6 ) / self._blackboard.var_53d396aac913b6e9;
}

