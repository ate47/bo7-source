#using script_762e73cd6088bff;
#using script_aa3bac81ad4fc8e;
#using scripts\common\system;
#using scripts\common\values;

#namespace zm_bgb_arsenal_accelerator;

// Namespace zm_bgb_arsenal_accelerator
// Params 0, eflags: 0x5
// Checksum 0x8676bd12, Offset: 0xd6
// Size: 0x1d
function private autoexec __init__system__()
{
    system::register( "arsenal_accelerator", #"bgb", &__init__, undefined );
}

// Namespace zm_bgb_arsenal_accelerator
// Params 0
// Checksum 0x4c7e0897, Offset: 0xfb
// Size: 0x25
function __init__()
{
    bgb::register( "arsenal_accelerator", "time", 300, &enable, &disable, &validation );
}

// Namespace zm_bgb_arsenal_accelerator
// Params 0
// Checksum 0x813987bc, Offset: 0x128
// Size: 0x6c
function enable()
{
    perk::giveperk( "specialty_faster_field_upgrade" );
    
    if ( !isdefined( self.perktunables ) )
    {
        self.perktunables = spawnstruct();
    }
    
    if ( !isdefined( self.perktunables.perk_faster_field_upgrade_rate ) )
    {
        self.perktunables.perk_faster_field_upgrade_rate = 1.5;
    }
    
    val::set( "specialty_faster_field_upgrade", "field_upgrade_recharge_mult", 1.5 );
}

// Namespace zm_bgb_arsenal_accelerator
// Params 0
// Checksum 0x8df7a738, Offset: 0x19c
// Size: 0x32
function disable()
{
    if ( isdefined( self.perks[ "specialty_faster_field_upgrade" ] ) )
    {
        perk::removeperk( "specialty_faster_field_upgrade" );
    }
    
    val::reset( "specialty_faster_field_upgrade", "field_upgrade_recharge_mult" );
}

// Namespace zm_bgb_arsenal_accelerator
// Params 0
// Checksum 0xef3efecf, Offset: 0x1d6
// Size: 0x4, Type: bool
function validation()
{
    return true;
}

