#using script_1c42ccce845bc50;
#using scripts\common\callbacks;

#namespace specialty_underwater_breath_time_scaler;

// Namespace specialty_underwater_breath_time_scaler
// Params 0, eflags: 0x1
// Checksum 0x677ef73, Offset: 0xa1
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_underwater_breath_time_scaler
// Params 1
// Checksum 0x55cda46d, Offset: 0xc1
// Size: 0x38
function registerspecialty( params )
{
    if ( params.var_bf34439fc0ca3cec )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_underwater_breath_time_scaler", &setspecialty, &unsetspecialty );
    }
}

// Namespace specialty_underwater_breath_time_scaler
// Params 0
// Checksum 0xd478b976, Offset: 0x101
// Size: 0x2c
function setspecialty()
{
    self.var_87ca408e836d56cf = &getbreathtime;
    self.var_92e86eaabeacf9ac = self.var_9842326056fd7207.var_92e86eaabeacf9ac;
}

// Namespace specialty_underwater_breath_time_scaler
// Params 0
// Checksum 0xc0556d7c, Offset: 0x135
// Size: 0x16
function unsetspecialty()
{
    self.var_87ca408e836d56cf = undefined;
    self.var_92e86eaabeacf9ac = undefined;
}

// Namespace specialty_underwater_breath_time_scaler
// Params 0
// Checksum 0xe6345eaa, Offset: 0x153
// Size: 0x20
function getbreathtime()
{
    var_a496e9668c173020 = swim_cp_mp::getbreathtime();
    return var_a496e9668c173020 * self.var_92e86eaabeacf9ac;
}

