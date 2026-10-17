#using script_4b6117e9579324ad;
#using scripts\common\callbacks;
#using scripts\common\system;

#namespace mp_monkey_bomb;

// Namespace mp_monkey_bomb
// Params 0, eflags: 0x5
// Checksum 0xdca409ae, Offset: 0x8b
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"monkey_bomb", undefined, undefined, &init );
}

// Namespace mp_monkey_bomb
// Params 0
// Checksum 0x860642c1, Offset: 0xac
// Size: 0x38
function init()
{
    if ( !level.var_cc3b9b1c8c9f3a68 )
    {
        return;
    }
    
    monkey_bomb::monkey_bomb_init();
    level callback::add( #"grenade_fire", &ongrenadeused );
    level.var_54d8aed57d6404ed = 1;
}

// Namespace mp_monkey_bomb
// Params 1
// Checksum 0xcfa10bf7, Offset: 0xec
// Size: 0x3c
function ongrenadeused( params )
{
    if ( params.grenade.equipmentref == "equip_monkey_bomb" )
    {
        thread monkey_bomb::monkey_bomb_used( params.grenade );
    }
}

