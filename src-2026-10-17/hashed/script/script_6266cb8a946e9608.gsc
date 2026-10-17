#using script_31e159e3b40e909e;
#using scripts\common\system;
#using scripts\common\utility;

#namespace namespace_f029a4bca692bfe6;

// Namespace namespace_f029a4bca692bfe6
// Params 0, eflags: 0x5
// Checksum 0x6ad18452, Offset: 0xfa
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"hash_e23b80dee05e03dd", undefined, &function_774d617cb72b519d, undefined );
}

// Namespace namespace_f029a4bca692bfe6
// Params 0
// Checksum 0xb65bed0f, Offset: 0x11b
// Size: 0x23
function function_774d617cb72b519d()
{
    level._effect[ "shatterblast_explosion_effect_100" ] = loadfxasset( "vfx_t10_gameplay_zm_weapons_perk_shatterblast_lvl0_explo_100_units" );
    level thread function_c7e0d8d98dd4a562();
}

// Namespace namespace_f029a4bca692bfe6
// Params 0
// Checksum 0x8c6c8c36, Offset: 0x146
// Size: 0x1c
function function_c7e0d8d98dd4a562()
{
    zm_relic_challenges::register_relic_challenge_functions( #"hash_67758aea8bbb45fb", &function_d8e7e3271bcc6fb0, &function_be3c804543f31e87 );
}

// Namespace namespace_f029a4bca692bfe6
// Params 0
// Checksum 0xa25c15c1, Offset: 0x16a
// Size: 0x8b
function function_d8e7e3271bcc6fb0()
{
    foreach ( player in level.players )
    {
        player thread reload_watcher();
    }
    
    wait 1;
    
    /#
        iprintlnbold( "<dev string:x24>" );
    #/
}

// Namespace namespace_f029a4bca692bfe6
// Params 0
// Checksum 0x1bc6b400, Offset: 0x1fd
// Size: 0x1e
function function_be3c804543f31e87()
{
    level notify( #"hash_3387be3e21045a31" );
    wait 1;
    
    /#
        iprintlnbold( "<dev string:x53>" );
    #/
}

// Namespace namespace_f029a4bca692bfe6
// Params 0
// Checksum 0x8dd3139, Offset: 0x223
// Size: 0x1e2
function reload_watcher()
{
    level endon( #"game_ended" );
    self endon( #"disconnect" );
    level endon( #"hash_3387be3e21045a31" );
    
    while ( true )
    {
        self waittill( #"reload_start" );
        a_zombies = getaiarrayinradius( self.origin, 75 );
        players = getplayersinradius( self.origin, 75 );
        playfx( utility::getfx( "shatterblast_explosion_effect_100" ), self.origin );
        
        foreach ( zombie in a_zombies )
        {
            if ( !zombie.magic_bullet_shield && !zombie.damageshield )
            {
                zombie dodamage( zombie.maxhealth * 0.3, zombie.origin, self, self, "MOD_EXPLOSIVE", undefined, "none", undefined, 1073807360 );
            }
        }
        
        foreach ( player in players )
        {
            player dodamage( player.maxhealth * 0.85, player.origin, self, self, "MOD_EXPLOSIVE", undefined, "none", undefined, 1073807360 );
        }
        
        waitframe();
    }
}

