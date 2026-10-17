#using script_6995a3eb7d571a9f;
#using scripts\common\system;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\mp\zm\ztron\ztron_camera;
#using scripts\mp\zm\ztron\ztron_item;
#using scripts\mp\zm\ztron\ztron_player_utility;
#using scripts\mp\zm\ztron\ztron_score;
#using scripts\mp\zm\ztron\ztron_sound;
#using scripts\mp\zm\ztron\ztron_weapon;

#namespace namespace_eacf3b44b2942985;

// Namespace namespace_eacf3b44b2942985
// Params 0, eflags: 0x5
// Checksum 0xe4b3a76a, Offset: 0x1d5
// Size: 0x21
function private autoexec __init__system__()
{
    system::register( #"hash_d6c2b4380429f28", #"ztron_item", undefined, &init );
}

// Namespace namespace_eacf3b44b2942985
// Params 0
// Checksum 0xc79536f9, Offset: 0x1fe
// Size: 0x57
function init()
{
    ztron_item::function_5844a9c240f7dc8d( #"remote_robot", #"use", &function_41912221b1a55d23 );
    ztron_item::function_5844a9c240f7dc8d( #"remote_robot", #"canautouse", &can_auto_use );
    ztron_sound::function_4ac735395b173fe( "ztron_pickup_remote_robot_OS", "evt_ztron_pickup_sentry_consumed" );
    level thread postinit();
}

// Namespace namespace_eacf3b44b2942985
// Params 0
// Checksum 0x5d8b69b4, Offset: 0x25d
// Size: 0x22
function postinit()
{
    waitframe();
    level utility::registersharedfunc( #"juggernaut", #"hash_218fc0adf5bd9638", &function_1bda120643e3c1e1 );
}

// Namespace namespace_eacf3b44b2942985
// Params 1, eflags: 0x4
// Checksum 0x30a76d8, Offset: 0x287
// Size: 0x6a, Type: bool
function private can_auto_use( params )
{
    return isplayer( self ) && !self.ztron.usingremoterobot && !self.ismutantinjection && !self.ztron.usingmutant && !self getcamerathirdperson() && !level utility::flag( "ztron_cutscene" );
}

// Namespace namespace_eacf3b44b2942985
// Params 1
// Checksum 0x4befb951, Offset: 0x2fa
// Size: 0x376
function function_41912221b1a55d23( params )
{
    player = params.player;
    player endon( #"disconnect" );
    player.ztron.usingremoterobot = 1;
    player.var_e6e285922d86ab7f = 1;
    player.var_b8a3eb3d2a1c3998 = 1;
    player.var_adc43141e2117c18 = 1;
    player.ignoreskydiving = 1;
    player.var_7193c22a10fb5738 = 1;
    player.var_bcf0a081c3d4a305 = 1;
    player.var_32b5f6d602b8ffc8 = 1;
    player.var_f59b131f877a229e = 1;
    ztron_sound::ztron_playsound( "ztron_pickup_remote_robot_OS", player.origin );
    player ztron_player_utility::playerinvulnerability( 1 );
    player val::set( "ztron_remote_robot", "weapon_switch", 1 );
    player val::set( "ztron_remote_robot", "melee", 1 );
    player.ztron.var_ccae92f84b4e34b2 = 1;
    player.ztron.var_5e0a7c3a863694bf = params.bundle;
    
    if ( isdefined( player.ztron.currentweapon ) )
    {
        player takeweapon( player.ztron.currentweapon );
    }
    
    player killstreaks::awardkillstreak( "remote_robot", "other", undefined, undefined, undefined, 1 );
    streak_item = player killstreaks::getkillstreakinslot( 1 );
    prevcamera = self.ztron.cameramode;
    player ztron_camera::function_e6efe0f15a6ec3f4( prevcamera );
    success = player killstreaks::triggerkillstreak( streak_item, 1 );
    
    if ( !success )
    {
        player val::reset_all( "ztron_remote_robot" );
        player.ztron.usingremoterobot = undefined;
        player resetweapon();
    }
    else
    {
        if ( !ztron_item::function_4b0636e7b2fc461f() )
        {
            player.var_5b2350918da14d25 = 1;
            player thread function_a4c520f07f0bc43c();
        }
        
        player notify( #"hash_463ac41b7bf90869" );
        player.ztron.var_74a3707334cfe144 = 1;
        player ztron_camera::changecamera( 4 );
        player ztron_score::function_4ea454cb6435a318();
        player.ztron.blockboost = 1;
        player.ztron.var_557a2e6d2ffa015c = 1;
        player.ztron.var_8a46e28ad02229a8 = 1;
        player val::set( "topdowncamera", "prone", 0 );
        player val::set( "topdowncamera", "crouch", 0 );
        
        if ( !isdefined( player.ztron.var_be849c9149bbfc7a ) )
        {
            player.ztron.var_be849c9149bbfc7a = "ztron_player_trail_" + player.ztron.color;
            playfxontag( utility::getfx( player.ztron.var_be849c9149bbfc7a ), player, "tag_origin" );
        }
        
        player thread function_c04c6d2f8db542cf();
        player thread function_393f81255d676000();
    }
    
    player killstreaks::removekillstreak( 1 );
    player ztron_player_utility::playerinvulnerability( 0, 1 );
    return success;
}

// Namespace namespace_eacf3b44b2942985
// Params 1
// Checksum 0x13a02643, Offset: 0x679
// Size: 0x60
function function_1bda120643e3c1e1( time )
{
    if ( isdefined( self.ztron.var_5e0a7c3a863694bf ) )
    {
        itemdata = ztron_item::function_998f2b10462afbf4( self.ztron.var_5e0a7c3a863694bf );
        return int( ztron_player_utility::function_10777122eee28fa8( itemdata.duration ) );
    }
    
    return time;
}

// Namespace namespace_eacf3b44b2942985
// Params 1, eflags: 0xc
// Checksum 0xb67fa1a8, Offset: 0x6e2
// Size: 0x54
function private function_a4c520f07f0bc43c( time )
{
    self notify( #"hash_342e6356f7f8811a" );
    self endon( #"hash_342e6356f7f8811a" );
    self endon( #"disconnect" );
    self endon( #"remote_robot_ended" );
    
    while ( !ztron_item::function_4b0636e7b2fc461f() )
    {
        waitframe();
    }
    
    self.var_5b2350918da14d25 = undefined;
}

// Namespace namespace_eacf3b44b2942985
// Params 0, eflags: 0xc
// Checksum 0x6df59ca4, Offset: 0x73e
// Size: 0x19b
function private function_c04c6d2f8db542cf()
{
    self notify( #"hash_a4078113973fd696" );
    self endon( #"hash_a4078113973fd696" );
    self endon( #"disconnect" );
    self waittill( #"remote_robot_ended" );
    val::reset_all( "ztron_remote_robot" );
    self.ztron.var_74a3707334cfe144 = 0;
    self.ztron.blockboost = 0;
    self.ztron.var_557a2e6d2ffa015c = 0;
    self.ztron.var_8a46e28ad02229a8 = undefined;
    self.ztron.usingremoterobot = undefined;
    
    if ( isdefined( self.ztron.var_be849c9149bbfc7a ) )
    {
        stopfxontag( utility::getfx( self.ztron.var_be849c9149bbfc7a ), self, "tag_origin" );
        self.ztron.var_be849c9149bbfc7a = undefined;
    }
    
    if ( isdefined( level.ztron.var_8a9067aa4cd65369 ) && level.ztron.var_8a9067aa4cd65369.freecam == 0 )
    {
        ztron_camera::changecamera( 5 );
    }
    else if ( self.ztron.cameramode != 5 )
    {
        ztron_camera::function_9d2ce447580a6290();
        ztron_player_utility::freezeplayercontrols( 0 );
        thread ztron_camera::function_3f5f4767374bb6c7();
    }
    
    ztron_score::function_4ea454cb6435a318();
    utility::function_7c10ea82c1e305b8( "ztron_player_trail_fx", self.ztron.color );
    thread ztron_player_utility::turnplayershieldon();
    resetweapon();
}

// Namespace namespace_eacf3b44b2942985
// Params 0, eflags: 0xc
// Checksum 0x158af92e, Offset: 0x8e1
// Size: 0x5f
function private function_393f81255d676000()
{
    self notify( #"hash_784579105d241594" );
    self endon( #"hash_784579105d241594" );
    self endon( #"disconnect" );
    self endon( #"remote_robot_ended" );
    utility::waittill_any_ents( level, "ztron_exit_taken", level, "ztron_teleporter_taken", self, "cutscene_played", self, "ztron_player_dump_vehicle" );
    self notify( #"hash_a0fa485c49c43c68", 1 );
}

// Namespace namespace_eacf3b44b2942985
// Params 0, eflags: 0x4
// Checksum 0x5c71b25e, Offset: 0x948
// Size: 0x1e
function private resetweapon()
{
    ztron_weapon::function_85196995466c1a41();
    self.ztron.var_ccae92f84b4e34b2 = 0;
}

