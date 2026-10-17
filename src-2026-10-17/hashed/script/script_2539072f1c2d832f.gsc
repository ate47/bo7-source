#using scripts\common\callbacks;

#namespace specialty_silentkill;

// Namespace specialty_silentkill
// Params 0, eflags: 0x1
// Checksum 0x2bd34a8c, Offset: 0x8e
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_silentkill
// Params 1
// Checksum 0x1000646, Offset: 0xae
// Size: 0x62
function registerspecialty( params )
{
    bundle = level.perkbundles[ "specialty_silentkill" ];
    
    if ( !isdefined( bundle ) )
    {
        return;
    }
    
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_silentkill", &setsilentkill, &unsetsilentkill, [], &initsilentkill );
    }
}

// Namespace specialty_silentkill
// Params 0
// Checksum 0xc7438102, Offset: 0x118
// Size: 0x2
function initsilentkill()
{
    
}

// Namespace specialty_silentkill
// Params 0
// Checksum 0xcd26450b, Offset: 0x122
// Size: 0x2
function setsilentkill()
{
    
}

// Namespace specialty_silentkill
// Params 0
// Checksum 0x671cbee0, Offset: 0x12c
// Size: 0x2
function unsetsilentkill()
{
    
}

