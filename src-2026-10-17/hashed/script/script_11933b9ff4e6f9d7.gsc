#using scripts\common\utility;
#using scripts\mp\equipment;
#using scripts\mp\weapons;

#namespace thermal_phone;

// Namespace thermal_phone
// Params 0, eflags: 0x1
// Checksum 0x4cd6d05b, Offset: 0xdf
// Size: 0x4b
function autoexec function_d6decc0e8c3bdd82()
{
    utility::flag_wait( "equipment_initialized" );
    weapons::registerusedcallback( "thermal_phone", &function_98141220117b3505 );
    equipment_mp::registercallback( "equip_thermal_phone", "onGive", &function_7bac2648cb29b9e8 );
    equipment_mp::registercallback( "equip_thermal_phone", "onTake", &function_5062ba7ecb06cba );
}

// Namespace thermal_phone
// Params 4
// Checksum 0xaee44a0d, Offset: 0x132
// Size: 0x2e
function function_7bac2648cb29b9e8( equipmentref, equipmentslot, variantid, attachments )
{
    thread function_78ffc4ae39dad71f();
}

// Namespace thermal_phone
// Params 0
// Checksum 0x931857e9, Offset: 0x168
// Size: 0x70
function function_78ffc4ae39dad71f()
{
    self endon( #"death_or_disconnect" );
    self endon( #"thermal_phone_taken" );
    
    while ( true )
    {
        self waittill( #"grenade_pullback", objweapon );
        
        if ( isdefined( objweapon ) && objweapon.basename == "thermal_phone_mp" )
        {
            if ( isdefined( level.var_4688b1285d55928d ) )
            {
                [[ level.var_4688b1285d55928d ]]( self );
            }
        }
    }
}

// Namespace thermal_phone
// Params 2
// Checksum 0xcdc62301, Offset: 0x1e0
// Size: 0x21
function function_5062ba7ecb06cba( equipmentref, equipmentslot )
{
    self notify( #"thermal_phone_taken" );
}

// Namespace thermal_phone
// Params 1
// Checksum 0xdad5d567, Offset: 0x209
// Size: 0x3f
function function_98141220117b3505( grenade )
{
    if ( isdefined( grenade ) )
    {
        grenade delete();
    }
    
    if ( isdefined( level.var_740c96c54309c349 ) )
    {
        [[ level.var_740c96c54309c349 ]]( self );
    }
    
    self notify( #"thermal_phone_finished" );
}

