#using script_25a8fa2ac8997425;
#using scripts\common\powerups;
#using scripts\mp\common\powerups\powerups;

#namespace free_perk;

// Namespace free_perk
// Params 0, eflags: 0x1
// Checksum 0xf8206d8e, Offset: 0x83
// Size: 0x9
function autoexec main()
{
    init_free_perk();
}

// Namespace free_perk
// Params 0
// Checksum 0x81626b05, Offset: 0x94
// Size: 0x18
function init_free_perk()
{
    powerups::register_powerup( "free_perk", &grab_free_perk, &func_should_drop_with_regular_powerups );
}

// Namespace free_perk
// Params 2
// Checksum 0x62246dbf, Offset: 0xb4
// Size: 0xad
function grab_free_perk( str_powerup, ent_powerup )
{
    a_players = powerups::get_powerup_players( str_powerup );
    
    foreach ( player in a_players )
    {
        if ( !player isspectatinganyone() )
        {
            player give_player_perk();
            player thread powerups_cpmp::function_52318afc13635e7c( str_powerup );
        }
    }
}

// Namespace free_perk
// Params 0
// Checksum 0xe84c8057, Offset: 0x169
// Size: 0x17
function give_player_perk()
{
    perk_str = zombie_perks::function_ab9b4123275d6153();
    
    /#
    #/
}

// Namespace free_perk
// Params 0
// Checksum 0x5370dcf6, Offset: 0x188
// Size: 0xec, Type: bool
function func_should_drop_with_regular_powerups()
{
    valid_player = 0;
    
    if ( !isdefined( level.var_caafd14b9b13924 ) )
    {
        level.var_caafd14b9b13924 = 0;
    }
    
    if ( level.var_caafd14b9b13924 < 3 + level.players.size )
    {
        return false;
    }
    
    foreach ( player in level.players )
    {
        if ( player.perks_active.size < 6 )
        {
            valid_player = 1;
        }
    }
    
    if ( valid_player )
    {
        rand_chance = 0.25 > randomfloat( 1 );
        
        if ( rand_chance )
        {
            return true;
        }
    }
    
    return false;
}

