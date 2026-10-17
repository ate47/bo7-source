#using scripts\common\utility;

#namespace powerup_full_armor_br;

// Namespace powerup_full_armor_br
// Params 0, eflags: 0x1
// Checksum 0x7d030a6c, Offset: 0x76
// Size: 0x2d
function autoexec main()
{
    if ( getdvarint( @"scr_br_powerups_enabled", 0 ) && !getdvarint( @"scr_disable_powerup_full_armor", 0 ) )
    {
        init();
    }
}

// Namespace powerup_full_armor_br
// Params 0
// Checksum 0xeaa3b685, Offset: 0xab
// Size: 0x3e
function init()
{
    utility::registersharedfunc( #"powerup_full_armor", #"should_drop", &should_drop );
    utility::registersharedfunc( #"powerup_full_armor", #"modify_drop_chance", &modify_drop_chance );
}

// Namespace powerup_full_armor_br
// Params 0
// Checksum 0xb2fdaede, Offset: 0xf1
// Size: 0x4, Type: bool
function should_drop()
{
    return true;
}

// Namespace powerup_full_armor_br
// Params 2
// Checksum 0x1df93966, Offset: 0xfe
// Size: 0x7b
function modify_drop_chance( chance, context )
{
    player = context.player;
    armorpct = player.armorhealth / player.maxarmorhealth;
    
    if ( armorpct >= 1 )
    {
        return ( chance * 0.25 );
    }
    
    if ( armorpct > 0.5 )
    {
        return chance;
    }
    
    return chance * 3;
}

