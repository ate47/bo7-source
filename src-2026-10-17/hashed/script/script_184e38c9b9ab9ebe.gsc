#using script_2db0f4bfa718d997;
#using scripts\common\utility;
#using scripts\mp\loot\common_item_ammo;

#namespace powerup_full_ammo_br;

// Namespace powerup_full_ammo_br
// Params 0, eflags: 0x1
// Checksum 0x7c89acff, Offset: 0x76
// Size: 0x2d
function autoexec main()
{
    if ( getdvarint( @"scr_br_powerups_enabled", 0 ) && !getdvarint( @"scr_disable_powerup_full_ammo", 0 ) )
    {
        init();
    }
}

// Namespace powerup_full_ammo_br
// Params 0
// Checksum 0x14972152, Offset: 0xab
// Size: 0x5c
function init()
{
    utility::registersharedfunc( #"powerup_full_ammo", #"should_drop", &should_drop );
    utility::registersharedfunc( #"powerup_full_ammo", #"modify_drop_chance", &modify_drop_chance );
    utility::registersharedfunc( #"powerup_full_ammo", #"give_ammo", &give_ammo );
}

// Namespace powerup_full_ammo_br
// Params 0
// Checksum 0x3f6f6d27, Offset: 0x10f
// Size: 0x4, Type: bool
function should_drop()
{
    return true;
}

// Namespace powerup_full_ammo_br
// Params 2
// Checksum 0xd6193fe6, Offset: 0x11c
// Size: 0x16b
function modify_drop_chance( chance, context )
{
    player = context.player;
    weapons = player getweaponslistprimaries();
    
    if ( weapons.size <= 0 )
    {
        return 0;
    }
    
    sum = 0;
    count = 0;
    
    foreach ( weap in weapons )
    {
        ammotype = br_weapons::br_ammo_type_for_weapon( weap );
        
        if ( !isdefined( ammotype ) )
        {
            continue;
        }
        
        maxstock = player item_ammo::function_9aecfd8b12f7ed0e( weap, ammotype );
        
        if ( isdefined( maxstock ) )
        {
            ammopct = utility::get_int_or_0( player.br_ammo[ ammotype ] ) / maxstock;
            sum += ammopct;
            count++;
        }
    }
    
    if ( count == 0 )
    {
        return 0;
    }
    
    var_fdbaea5443e355f7 = sum / count;
    
    if ( var_fdbaea5443e355f7 >= 1 )
    {
        return ( chance * 0.25 );
    }
    
    if ( var_fdbaea5443e355f7 > 0.3 )
    {
        return chance;
    }
    
    return chance * 2;
}

// Namespace powerup_full_ammo_br
// Params 0
// Checksum 0x638bb08e, Offset: 0x28f
// Size: 0xd
function give_ammo()
{
    item_ammo::function_a530c73bf2e2b013( 0, 0, 1 );
}

