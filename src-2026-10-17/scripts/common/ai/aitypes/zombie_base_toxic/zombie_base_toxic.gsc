#using script_16ea1b94f0f381b3;
#using script_6c2f6a14fa53759e;
#using script_7b1e082b2533e255;
#using script_d6d19e875fd7d86;
#using scripts\common\callbacks;
#using scripts\common\utility;
#using scripts\common\values;

#namespace zombie_base_toxic;

// Namespace zombie_base_toxic
// Params 2
// Checksum 0x337f4de7, Offset: 0x14d
// Size: 0x53
function precache( classname, aitypescriptbundle )
{
    if ( utility::flag( "init_zombie_base_toxic" ) )
    {
        return;
    }
    
    utility::flag_set( "init_zombie_base_toxic" );
    callback::add( "on_" + aitypescriptbundle.subclass + "_spawned", &function_c96663b844d1bd03 );
}

// Namespace zombie_base_toxic
// Params 1, eflags: 0x4
// Checksum 0xb85fd0cb, Offset: 0x1a8
// Size: 0x3a
function private function_c96663b844d1bd03( params )
{
    callback::add( "on_zombie_ai_killed", &function_a601ed3e064ed992 );
    self.forceannihilate = 1;
    val::set( "zombie_base_toxic", "allow_dismember", 0 );
}

// Namespace zombie_base_toxic
// Params 1, eflags: 0x4
// Checksum 0x384f58f5, Offset: 0x1ea
// Size: 0x356
function private function_a601ed3e064ed992( params )
{
    if ( val::get( "disable_elemental_effect" ) )
    {
        self.forceannihilate = undefined;
        return;
    }
    
    death_origin = self.origin;
    
    if ( self.var_9cf9051d40e9cd4e )
    {
        if ( self.owner )
        {
            settings_override = self.zombieaisettings;
        }
    }
    
    duration = 1;
    
    if ( isdefined( self.toxic_gas_duration ) )
    {
        duration = self.toxic_gas_duration;
    }
    else if ( !isdefined( self.toxic_gas_notify ) )
    {
        duration = 4;
    }
    
    should_spawn_toxic_gas = 1;
    
    if ( isdefined( self.var_7a679e69584d580c ) )
    {
        should_spawn_toxic_gas = [[ self.var_7a679e69584d580c ]]( death_origin, 64, self.owner );
    }
    
    if ( self._blackboard.var_431d45d5a00efc3d && self._blackboard.vortexmode == "blackhole" )
    {
        should_spawn_toxic_gas = 0;
    }
    
    if ( should_spawn_toxic_gas )
    {
        thread zombie_toxic_gas::spawn_toxic_gas( self.owner ?? self, death_origin, ( 0, 0, 0 ), "from_zombie_base_toxic", duration, 64, 64, self.toxic_gas_notify, undefined, undefined, settings_override );
    }
    
    players = function_d63fe6a4c08ba6f5( death_origin, self.zombieaisettings.explosionradius, 200 );
    
    foreach ( player in players )
    {
        if ( !player_utility::playersareenemies( self, player ) )
        {
            continue;
        }
        
        player namespace_9d8e359c3b1041e5::shellshocksharedfunc( self.zombieaisettings.explosionshock, #"damage", 0.35 );
        player dodamage( self.zombieaisettings.explosiondamage * ( self.var_fe048a2106d8ef00[ #"explosionattack" ] ?? 1 ), death_origin, self, self, "MOD_EXPLOSIVE", undefined, "head" );
    }
    
    enemies = self function_f017e352a29a57a1( death_origin, self.zombieaisettings.explosionradius );
    ai_damage = namespace_9d8e359c3b1041e5::function_870440d8340968c0( "zombie_base", namespace_9d8e359c3b1041e5::function_57de0ca2e80536a1( death_origin ) );
    
    foreach ( enemy in enemies )
    {
        if ( isai( enemy ) && !enemy zombie_utils::is_brainrotted() && !enemy.teamshifted )
        {
            damage_multiplier = enemy.var_789cb6b6be71394b ?? 1;
            enemy dodamage( ai_damage * damage_multiplier, death_origin, self, self, "MOD_EXPLOSIVE", undefined, "head", undefined, 1073741824 );
        }
    }
}

