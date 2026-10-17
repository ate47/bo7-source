#using script_734dce84c468439b;
#using scripts\mp\equipment;
#using scripts\mp\gametypes\escort_horde_abilities;

#namespace namespace_af34561ae58dc984;

// Namespace namespace_af34561ae58dc984
// Params 0
// Checksum 0xb05b4bd3, Offset: 0xe9
// Size: 0x51
function function_2c1cc592752509c9()
{
    escort_horde_abilities::addpowerbutton( level.mutationgametype.zombie, "gas", "+smoke", &function_18d8012feb7d3ed0, 0, &function_3b6933a9f5769171, &function_a8c714564dd2b1cc, &function_3b6933a9f5769171, &"hash_10c38a160e3187ce", undefined, 15, "gasGrenadeStatus", "gasGrenadeProgress" );
}

// Namespace namespace_af34561ae58dc984
// Params 2
// Checksum 0x7be5889, Offset: 0x142
// Size: 0x34
function function_3b6933a9f5769171( powerstruct, powerref )
{
    equipment_mp::giveequipment( "equip_gas_grenade", "secondary" );
    equipment_mp::setequipmentslotammo( "secondary", 1 );
}

// Namespace namespace_af34561ae58dc984
// Params 2
// Checksum 0xd83bdcf8, Offset: 0x17e
// Size: 0xbc
function function_18d8012feb7d3ed0( powerstruct, powerref )
{
    level endon( #"game_ended" );
    self endon( #"offhand_end" );
    self endon( #"zombie_unset" );
    self endon( #"death_or_disconnect" );
    self waittill( #"grenade_fire", grenade, objweapon, tickpercent, originalowner );
    
    if ( !weapon::grenadethrown( grenade ) )
    {
        return;
    }
    
    self playsound( "zxp_grenade_vo_npc", self, self );
    thread escort_horde_abilities::function_307e8b021dbec2b9( powerstruct, powerref );
    wait 0.25;
    function_a8c714564dd2b1cc( powerstruct, powerref );
    self notify( #"gas_grenade_finished" );
}

// Namespace namespace_af34561ae58dc984
// Params 2
// Checksum 0x5dbabd8b, Offset: 0x242
// Size: 0x21
function function_a8c714564dd2b1cc( powerstruct, powerref )
{
    equipment_mp::takeequipment( "secondary" );
}

