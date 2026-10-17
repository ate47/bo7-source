#using scripts\common\callbacks;
#using scripts\mp\equipment;

#namespace specialty_extra_lethal;

// Namespace specialty_extra_lethal
// Params 0, eflags: 0x1
// Checksum 0x1b60b475, Offset: 0xbd
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_extra_lethal
// Params 1
// Checksum 0x2c94d3ea, Offset: 0xdd
// Size: 0x43
function registerspecialty( params )
{
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_extra_lethal", &function_997a78ae40f108cb, &function_716d794586ab2746, [ "specialty_extra_deadly" ] );
    }
}

// Namespace specialty_extra_lethal
// Params 0
// Checksum 0x20beac57, Offset: 0x128
// Size: 0xc
function function_716d794586ab2746()
{
    self.var_e2083398840cb40c = undefined;
}

// Namespace specialty_extra_lethal
// Params 0
// Checksum 0xd2be6377, Offset: 0x13c
// Size: 0x7c
function function_997a78ae40f108cb()
{
    ref = equipment_mp::getcurrentequipment( "primary" );
    
    if ( !isdefined( ref ) || ref == "none" )
    {
        return;
    }
    
    allowlist = self.var_9842326056fd7207.var_b5c047a5c112af64;
    
    if ( isdefined( allowlist ) && arraycontains( allowlist, ref ) )
    {
        self.var_e2083398840cb40c = self.var_9842326056fd7207.var_81c4fd1f362c9abc ?? 1;
    }
}

