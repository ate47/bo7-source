#using scripts\common\weapon;
#using scripts\cp_mp\equipment;
#using scripts\engine\utility;
#using scripts\mp\utility\perk;
#using scripts\mp\utility\player;

#namespace frag_grenade;

// Namespace frag_grenade
// Params 0, eflags: 0x1
// Checksum 0xcbd8c5ac, Offset: 0x130
// Size: 0xa
function autoexec main()
{
    level function_21b275046166016a();
}

// Namespace frag_grenade
// Params 0, eflags: 0x4
// Checksum 0x323e1889, Offset: 0x142
// Size: 0x3a
function private function_21b275046166016a()
{
    utility::flag_wait( "equipment_initialized" );
    equipment::registercallback( "equip_frag", "onGive", &function_4d78a19fbe5b0383 );
    equipment::registercallback( "equip_frag", "onTake", &frag_grenade_on_take );
}

// Namespace frag_grenade
// Params 4
// Checksum 0x6ed5a444, Offset: 0x184
// Size: 0xf7
function function_4d78a19fbe5b0383( equipmentref, equipmentslot, variantid, attachments )
{
    bundle = equipment::getequipmenttableinfo( equipmentref ).bundle;
    
    if ( !bundle.var_e36b84555e7df1d3 )
    {
        return;
    }
    
    foreach ( attachment in attachments )
    {
        if ( getxhashasset( attachment ) == bundle.var_e36b84555e7df1d3 )
        {
            self.var_2e4d194d7a5f9d61 = bundle.var_41b002e948524c2f ?? 1.2;
            thread function_8ce7d26f6d9cd28c();
            break;
        }
    }
}

// Namespace frag_grenade
// Params 2
// Checksum 0x46c84fea, Offset: 0x283
// Size: 0x27
function frag_grenade_on_take( equipmentref, slot )
{
    self notify( "frag_grenade_on_take" );
    self.var_2e4d194d7a5f9d61 = undefined;
}

// Namespace frag_grenade
// Params 0, eflags: 0xc
// Checksum 0x476ef4ad, Offset: 0x2b2
// Size: 0x111
function private function_8ce7d26f6d9cd28c()
{
    self notify( "8b0a012a49405adc" );
    self endon( "8b0a012a49405adc" );
    self endon( "frag_grenade_on_take" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    bundle = equipment::getequipmenttableinfo( "equip_frag" ).bundle;
    
    while ( true )
    {
        if ( player::isreallyalive( self ) )
        {
            currentweapon = weapon::getgrenadeinpullback();
            
            if ( issubstr( currentweapon.basename, "frag_grenade" ) && currentweapon hasattachmenthash( bundle.var_e36b84555e7df1d3 ) && !isdefined( self.perks[ "specialty_grenade_expert" ] ) )
            {
                perk::giveperk( "specialty_grenade_expert" );
                
                if ( self.var_2e4d194d7a5f9d61 )
                {
                    self setgrenadethrowscale( self.var_2e4d194d7a5f9d61 );
                }
            }
            else if ( !issubstr( currentweapon.basename, "frag_grenade" ) && isdefined( self.perks[ "specialty_grenade_expert" ] ) )
            {
                perk::removeperk( "specialty_grenade_expert" );
            }
        }
        
        waitframe();
    }
}

