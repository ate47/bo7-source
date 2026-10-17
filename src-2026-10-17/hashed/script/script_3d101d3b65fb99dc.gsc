#using scripts\common\callbacks;

#namespace specialty_fire_resistance;

// Namespace specialty_fire_resistance
// Params 0, eflags: 0x1
// Checksum 0x12eeca, Offset: 0x93
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_fire_resistance
// Params 1
// Checksum 0x53a8a5e5, Offset: 0xb3
// Size: 0x3b
function registerspecialty( params )
{
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_fire_resistance", &setspecialty, &unsetspecialty, [], undefined );
    }
}

// Namespace specialty_fire_resistance
// Params 0
// Checksum 0x6e108046, Offset: 0xf6
// Size: 0x31
function setspecialty()
{
    if ( isdefined( self.var_25bf9cab220c6b00 ) )
    {
        return;
    }
    
    self.var_25bf9cab220c6b00 = self.var_9842326056fd7207.var_f7a12ed204e7125a ?? 50;
}

// Namespace specialty_fire_resistance
// Params 0
// Checksum 0x6a75d473, Offset: 0x12f
// Size: 0xc
function unsetspecialty()
{
    self.var_25bf9cab220c6b00 = undefined;
}

