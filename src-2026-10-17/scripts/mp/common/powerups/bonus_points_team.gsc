#using scripts\common\powerups;
#using scripts\mp\common\powerups\powerups;

#namespace bonus_points_team;

// Namespace bonus_points_team
// Params 0, eflags: 0x1
// Checksum 0x9461e8fe, Offset: 0x8b
// Size: 0x9
function autoexec main()
{
    init_bonus_points();
}

// Namespace bonus_points_team
// Params 0
// Checksum 0x6e94a9d0, Offset: 0x9c
// Size: 0x13
function init_bonus_points()
{
    powerups::register_powerup( "bonus_points_team", &grab_bonus_points );
}

// Namespace bonus_points_team
// Params 2
// Checksum 0xb9efb3aa, Offset: 0xb7
// Size: 0xaf
function grab_bonus_points( str_powerup, ent_powerup )
{
    a_players = powerups::get_powerup_players( str_powerup );
    
    foreach ( player in a_players )
    {
        player give_points();
        player thread powerups_cpmp::function_52318afc13635e7c( str_powerup );
    }
    
    level notify( #"hash_80f62915bea5fe1" );
}

// Namespace bonus_points_team
// Params 0
// Checksum 0x7be40cd8, Offset: 0x16e
// Size: 0x38
function give_points()
{
    root = powerups::get_powerups_root();
    self [[ root.func_give_points ]]( #"powerup_bonus_points_team" );
    self notify( #"zmb_bonus_points_team" );
}

