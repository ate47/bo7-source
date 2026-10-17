#using script_16ea1b94f0f381b3;
#using script_1a6a1f7bdb57d7ff;
#using script_6c2f6a14fa53759e;
#using script_d6d19e875fd7d86;
#using scripts\asm\asm;
#using scripts\common\callbacks;
#using scripts\common\utility;

#namespace zombie_methone;

// Namespace zombie_methone
// Params 2
// Checksum 0x9c95ddba, Offset: 0x1ff
// Size: 0x91
function precache( classname, aitypescriptbundle )
{
    if ( utility::flag( "init_" + aitypescriptbundle.subclass ) )
    {
        return;
    }
    
    utility::flag_set( "init_" + aitypescriptbundle.subclass );
    callback::add( "on_" + aitypescriptbundle.subclass + "_spawned", &on_zombie_methone_spawned );
    
    if ( !callback::exists( "on_zombie_ai_killed", &function_9f5dda3117821620 ) )
    {
        level callback::add( "on_zombie_ai_killed", &function_9f5dda3117821620 );
    }
}

// Namespace zombie_methone
// Params 1, eflags: 0x4
// Checksum 0xfcd18ff7, Offset: 0x298
// Size: 0xc5
function private function_9f5dda3117821620( params )
{
    if ( !isplayer( params.eattacker ) || params.einflictor.subclass != "zombie_methone" )
    {
        return;
    }
    
    player = params.eattacker;
    
    if ( utility::issharedfuncdefined( #"medal", #"track_rapid_kill", 0 ) )
    {
        player utility::callsharedfunc( #"medal", #"track_rapid_kill", "zombie_methone_kill" );
        
        if ( player.rapidkill_data[ "zombie_methone_kill" ].rapidkill_count == 5 )
        {
            player namespace_9d8e359c3b1041e5::doscoreeventsharedfunc( #"medal_supercriticalcanine" );
        }
    }
}

// Namespace zombie_methone
// Params 1, eflags: 0x4
// Checksum 0x533cade3, Offset: 0x365
// Size: 0x1a
function private on_zombie_methone_spawned( params )
{
    self.death_explode_func = &zombie_methone_death_explode;
}

// Namespace zombie_methone
// Params 1, eflags: 0x4
// Checksum 0x647fe7d0, Offset: 0x387
// Size: 0x449
function private zombie_methone_death_explode( params )
{
    body = params.body;
    
    if ( !isdefined( body ) )
    {
        return;
    }
    
    body endon( #"death" );
    body endon( #"corpse_deleted" );
    eattacker = params.eattacker;
    explode_time = 0.5;
    explode_vfx_time = 0.1;
    should_spawn_toxic_gas = 1;
    body utility::function_32b24db3127bff40( "base", "base_on" );
    
    if ( self.forceannihilate )
    {
        if ( self._blackboard.var_431d45d5a00efc3d && self._blackboard.vortexmode == "blackhole" )
        {
            should_spawn_toxic_gas = 0;
        }
        
        explode_time = level.framedurationseconds;
        body.forceannihilate = 1;
    }
    else
    {
        if ( isdefined( self.asmname ) )
        {
            statename = self asmgetcurrentstate( self.asmname );
            animid = asm::asm_getanim( self.asmname, statename );
            xanim = asm::asm_getxanim( statename, animid );
            
            if ( isdefined( xanim ) )
            {
                animlength = getanimlength( xanim );
                
                if ( animhasnotetrack( xanim, "zombie_dog_explode" ) )
                {
                    explodefrac = getnotetracktimes( xanim, "zombie_dog_explode" )[ 0 ];
                    explode_time = animlength * explodefrac;
                }
            }
        }
        
        explode_time = self.explode_time_override ?? explode_time;
    }
    
    body.zombieaisettings = self.zombieaisettings;
    body.var_e72fb3905a881007 = self.zombieaisettings.var_d3de1a9faac42deb.var_a9eba73b4db0aec2;
    body.var_f8c9d15c3944d9e6 = self.zombieaisettings.var_d3de1a9faac42deb.var_534e039a3993efd5;
    body.var_c0420d1e94a99058 = self.zombieaisettings.var_d3de1a9faac42deb.var_9a69d405c47f8b4d;
    body.duration = self.zombieaisettings.var_d3de1a9faac42deb.flameduration;
    body.round_number = zombie_utils::get_zombie_round_difficulty();
    body.subclass = self.subclass;
    body.var_7d1e526fec068901 = self.var_fe048a2106d8ef00[ #"explosionattack" ] ?? 1;
    body.toxic_gas_damage_multiplier = self.var_fe048a2106d8ef00[ #"hash_85b9f88a87622341" ] ?? 1;
    body.allowfriendlyfire = 1;
    body.var_a6599ef275f97079 = self.zombieaisettings.var_d3de1a9faac42deb.var_6e1759bb096ae708 ?? 1;
    body setcorpsecanremovetimer( body.duration + explode_time + explode_vfx_time );
    results = body utility::waittill_any_return_params_or_timeout( explode_time, "corpse_thrown_explode" );
    body utility::function_32b24db3127bff40( "death", "explode_on" );
    
    if ( body.forceannihilate )
    {
        body utility::function_32b24db3127bff40( "death_annihilate", "death_annihilate" );
        body callback::callback( "on_annihilated" );
    }
    
    if ( results[ "message" ] == "corpse_thrown_explode" && results[ 0 ] )
    {
        explode_origin = results[ 0 ];
    }
    else
    {
        explode_origin = body gettagorigin( "j_spine2", 1 ) ?? body.origin;
    }
    
    explode_origin = utility::groundpos( explode_origin );
    body thread apply_explosion_damage( explode_origin, eattacker );
    
    if ( should_spawn_toxic_gas )
    {
        toxic_gas = body zombie_toxic_gas::spawn_toxic_gas( body, explode_origin, ( 0, 0, 0 ), "from_zombie_methone", body.duration, 64, 64, undefined, 1, body );
        toxic_gas.damage_owner = eattacker;
        toxic_gas.var_9722f23c01877fa2 = body.var_a6599ef275f97079;
    }
    
    wait explode_vfx_time;
    body hide();
    wait body.duration;
    body delete();
}

// Namespace zombie_methone
// Params 2, eflags: 0x4
// Checksum 0x63005a41, Offset: 0x7d8
// Size: 0x25d
function private apply_explosion_damage( origin, owner )
{
    level endon( #"game_ended" );
    radius = self.zombieaisettings.explosionradius;
    potential_targets = getplayersandaiarrayinradius( origin, radius );
    damage_base = self.zombieaisettings.explosiondamage;
    var_dc30d84b7d6d2c93 = self.var_7d1e526fec068901;
    var_bf311a89c929edce = namespace_9d8e359c3b1041e5::function_870440d8340968c0( "zombie_base", self.round_number );
    
    foreach ( target in potential_targets )
    {
        if ( !isalive( target ) )
        {
            continue;
        }
        
        if ( isplayer( target ) )
        {
            if ( target.team == self.team )
            {
                continue;
            }
            
            target namespace_9d8e359c3b1041e5::shellshocksharedfunc( self.zombieaisettings.explosionshock, #"damage", 0.35 );
            var_65c55325765f1984 = int( damage_base * var_dc30d84b7d6d2c93 );
        }
        else
        {
            if ( target zombie_utils::is_brainrotted() )
            {
                continue;
            }
            
            if ( target.subclass == self.subclass )
            {
                continue;
            }
            
            if ( target.aicategory == "normal" && !issubstr( target.subclass, "zombie_base_armored" ) && !target zombie_knockdown::function_19d6107cb6bdff5c() )
            {
                target zombie_knockdown::knockdown_ai( origin );
            }
            
            if ( target.aicategory == "normal" )
            {
                var_3b7c760575ea3a46 = 0.3;
            }
            else if ( target.aicategory == "special" )
            {
                var_3b7c760575ea3a46 = 0.1;
            }
            else
            {
                var_3b7c760575ea3a46 = 0.05;
            }
            
            var_65c55325765f1984 = int( var_bf311a89c929edce * var_3b7c760575ea3a46 );
        }
        
        target dodamage( var_65c55325765f1984, origin, owner ?? self, self, "MOD_EXPLOSIVE", "<explicitweaponnone>", "torso_lower", undefined, 65536 );
    }
}

