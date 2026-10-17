#using scripts\common\callbacks;
#using scripts\mp\armor;

#namespace specialty_plate_time_mod;

// Namespace specialty_plate_time_mod
// Params 0, eflags: 0x1
// Checksum 0x1cad0aae, Offset: 0x92
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_plate_time_mod
// Params 1
// Checksum 0x4f1741b0, Offset: 0xb2
// Size: 0x38
function registerspecialty( params )
{
    if ( params.var_bf34439fc0ca3cec )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_plate_time_mod", &setspecialty, &unsetspecialty );
    }
}

// Namespace specialty_plate_time_mod
// Params 0
// Checksum 0xe287cabe, Offset: 0xf2
// Size: 0xee
function setspecialty()
{
    bundle = self.var_9842326056fd7207;
    timemod = bundle.var_469fd9bbe24843bd;
    
    if ( !isdefined( timemod ) )
    {
        return;
    }
    
    var_6a4205176d058a89 = armor::function_2e65f2dc03880e80();
    var_6a4205176d058a89.var_ec446a384416b7d5 *= timemod;
    var_6a4205176d058a89.var_64946b5e94b2b140 *= timemod;
    var_6a4205176d058a89.var_c775bc9662041279 *= timemod;
    var_6a4205176d058a89.var_123322b62e9e145c *= timemod;
    var_6a4205176d058a89.var_f2e3f7eb442cc197 *= timemod;
    var_6a4205176d058a89.var_7e97fa2c45400bde *= timemod;
    armor::function_d5a70920ade0262e( "specialty_plate_time_mod", var_6a4205176d058a89 );
}

// Namespace specialty_plate_time_mod
// Params 0
// Checksum 0xf8cc55fb, Offset: 0x1e8
// Size: 0xe
function unsetspecialty()
{
    armor::function_521cde7757e75f0b( "specialty_plate_time_mod" );
}

