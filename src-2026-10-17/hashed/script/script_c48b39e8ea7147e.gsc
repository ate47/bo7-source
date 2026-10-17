#using scripts\common\callbacks;

#namespace specialty_fastoffhand;

// Namespace specialty_fastoffhand
// Params 0, eflags: 0x1
// Checksum 0xc611c826, Offset: 0xa8
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_fastoffhand
// Params 1
// Checksum 0x369a105f, Offset: 0xc8
// Size: 0x44
function registerspecialty( params )
{
    if ( isdefined( params.var_a2358848c4408242 ) )
    {
        level [[ params.var_a2358848c4408242 ]]( "specialty_fastoffhand" );
    }
    
    level.var_ff0d4d8bcaeda64a[ "specialty_fastoffhand" ] = &function_5f3646eb13ddcac4;
}

// Namespace specialty_fastoffhand
// Params 0
// Checksum 0x10f24bc2, Offset: 0x114
// Size: 0x36
function function_5f3646eb13ddcac4()
{
    var_a37a2577bcf9e24d = level.var_918d3444c8676d26[ "specialty_combat_flow" ];
    
    if ( isdefined( self.perks[ "specialty_fastoffhand" ][ var_a37a2577bcf9e24d ] ) )
    {
        return var_a37a2577bcf9e24d;
    }
}

