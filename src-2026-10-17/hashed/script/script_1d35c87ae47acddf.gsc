#using scripts\common\callbacks;
#using scripts\common\values;

#namespace specialty_faster_field_upgrade;

// Namespace specialty_faster_field_upgrade
// Params 0, eflags: 0x1
// Checksum 0xf43ba9b5, Offset: 0xb7
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerperk );
}

// Namespace specialty_faster_field_upgrade
// Params 1
// Checksum 0x8542cf2e, Offset: 0xd7
// Size: 0x3a
function registerperk( params )
{
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_faster_field_upgrade", &setspecialty, &unsetspecialty, [] );
    }
}

// Namespace specialty_faster_field_upgrade
// Params 0
// Checksum 0xdb63018a, Offset: 0x119
// Size: 0x3c
function setspecialty()
{
    var_285aef9e90d5b24b = self.var_9842326056fd7207.var_7f51fbc2a4951e75 ?? 1;
    val::set( "specialty_faster_field_upgrade", "field_upgrade_recharge_mult", var_285aef9e90d5b24b );
}

// Namespace specialty_faster_field_upgrade
// Params 0
// Checksum 0x7109c99b, Offset: 0x15d
// Size: 0x13
function unsetspecialty()
{
    val::reset( "specialty_faster_field_upgrade", "field_upgrade_recharge_mult" );
}

