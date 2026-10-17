#using script_16ea1b94f0f381b3;
#using script_3774b0533d79d9a0;
#using scripts\asm\asm;
#using scripts\asm\asm_bb;
#using scripts\common\ai;
#using scripts\common\callbacks;
#using scripts\common\status_effects\status_effects;
#using scripts\common\utility;
#using scripts\common\values;

#namespace effect_slow;

// Namespace effect_slow
// Params 9
// Checksum 0x92fb2868, Offset: 0xd3
// Size: 0x172
function slow( var_40668aa4c0a87533, var_37363d52762f695e, n_durations, var_1e4624a03ea41715, endcallback, var_35e9f0e661545a34, element_type, payload, cooldowns )
{
    assert( isstring( var_40668aa4c0a87533 ), "<dev string:x24>" );
    assert( isnumber( var_37363d52762f695e ), "<dev string:x45>" );
    assert( isnumber( n_durations ), "<dev string:x64>" );
    
    if ( isai( self ) && !function_64adf2cc9d3408ad( var_35e9f0e661545a34 ) )
    {
        return 0;
    }
    
    if ( !status_effects::function_98e705c3c729bbbc( "slow" ) )
    {
        self.cachedplaybackrate = asm::asm_getmoveplaybackrate();
    }
    
    effect = status_effects::function_93edde8d0fe48bb6( "slow", n_durations, var_40668aa4c0a87533, &start_slow, &end_slow, element_type, cooldowns );
    effect.var_1e4624a03ea41715 = var_1e4624a03ea41715;
    effect.rate = var_37363d52762f695e;
    effect.end_callback = endcallback;
    effect.payload = payload;
    
    if ( isai( self ) && isplayer( var_1e4624a03ea41715 ) && element_type == "cold" )
    {
        if ( !isdefined( var_40668aa4c0a87533 ) || !status_effects::function_fa35fc2723e956eb( "slow", var_40668aa4c0a87533 ) )
        {
            var_1e4624a03ea41715 namespace_9d8e359c3b1041e5::doscoreeventsharedfunc( #"frozen" );
        }
    }
    
    return status_effects::start_effect( effect );
}

// Namespace effect_slow
// Params 1
// Checksum 0x2c9baac9, Offset: 0x24e
// Size: 0x71, Type: bool
function function_64adf2cc9d3408ad( var_35e9f0e661545a34 )
{
    return isai( self ) && ( var_35e9f0e661545a34 || isdefined( self.aisettings ) && self.aisettings.var_3dae55586fee0a61 ) && !val::get( "disallow_slow" ) && !asm_bb::bb_isanimscripted() && !ai::is_doing_traversal( self ) && !self.is_traversing;
}

// Namespace effect_slow
// Params 1, eflags: 0x4
// Checksum 0xc0e94e97, Offset: 0x2c8
// Size: 0x1c9
function private start_slow( effect )
{
    n_time = gettime();
    var_3d46d3ed2467e8d8 = undefined;
    var_77dc4b9513d669d7 = undefined;
    
    foreach ( effect in self.status_effects[ "slow" ] )
    {
        if ( !isdefined( var_77dc4b9513d669d7 ) || effect.rate < var_77dc4b9513d669d7.rate )
        {
            var_77dc4b9513d669d7 = effect;
        }
        
        if ( effect.end_time > 0 && ( !isdefined( var_3d46d3ed2467e8d8 ) || effect.end_time < var_3d46d3ed2467e8d8 ) )
        {
            var_3d46d3ed2467e8d8 = effect.end_time;
        }
    }
    
    if ( isai( self ) && zombie_emergence_spawning::is_emergence_spawning_enabled() )
    {
        self.var_214fa57be3687ca6 = 1;
        zombie_emergence_spawning::disable_emergence_spawning();
    }
    
    if ( isdefined( var_77dc4b9513d669d7 ) && n_time < var_3d46d3ed2467e8d8 )
    {
        if ( isai( self ) )
        {
            function_abcd722e23b31c8c( var_77dc4b9513d669d7.rate );
            callback::callback( "on_ai_slowed", { #rate:var_77dc4b9513d669d7.rate } );
            return;
        }
        
        if ( isplayer( self ) )
        {
            if ( !namespace_9d8e359c3b1041e5::function_698ebbcc057b168f( "genericEffectSlowMod" ) )
            {
                namespace_9d8e359c3b1041e5::function_3533667d928bc2cf( "genericEffectSlowMod", var_77dc4b9513d669d7.rate );
            }
            
            utility::callsharedfunc( #"weapons", #"hash_4ccf3b3fcf5ae366", "genericEffectSlowMod", var_77dc4b9513d669d7.rate );
            namespace_9d8e359c3b1041e5::function_f44fe9161043ae23();
        }
    }
}

// Namespace effect_slow
// Params 1, eflags: 0x4
// Checksum 0xa9f6d728, Offset: 0x499
// Size: 0x1ee
function private end_slow( effect )
{
    if ( !( isdefined( self ) && isdefined( self.status_effects ) && isdefined( effect ) ) )
    {
        return;
    }
    
    current_time = gettime();
    return_rate = self.cachedplaybackrate ?? 1;
    self.cachedplaybackrate = undefined;
    
    foreach ( active_effect in self.status_effects[ "slow" ] )
    {
        if ( effect.unique_id == active_effect.unique_id )
        {
            return;
        }
        
        if ( active_effect.rate < return_rate && active_effect.end_time > current_time )
        {
            return_rate = active_effect.rate;
        }
    }
    
    if ( isai( self ) )
    {
        function_abcd722e23b31c8c( return_rate );
        callback::callback( "on_ai_slowed_end", { #rate:return_rate } );
        
        if ( self.var_214fa57be3687ca6 )
        {
            self.var_214fa57be3687ca6 = undefined;
            zombie_emergence_spawning::enable_emergence_spawning();
        }
    }
    else if ( isplayer( self ) )
    {
        if ( namespace_9d8e359c3b1041e5::function_698ebbcc057b168f( "genericEffectSlowMod" ) )
        {
            namespace_9d8e359c3b1041e5::function_e1ac55197494863e( "genericEffectSlowMod" );
            
            if ( return_rate != 1 )
            {
                namespace_9d8e359c3b1041e5::function_3533667d928bc2cf( "genericEffectSlowMod", return_rate );
            }
        }
        
        utility::callsharedfunc( #"weapons", #"hash_4ccf3b3fcf5ae366", "genericEffectSlowMod", return_rate );
        namespace_9d8e359c3b1041e5::function_f44fe9161043ae23();
    }
    
    if ( isdefined( effect.end_callback ) )
    {
        self [[ effect.end_callback ]]( effect.payload );
    }
}

// Namespace effect_slow
// Params 1, eflags: 0x4
// Checksum 0x8995840d, Offset: 0x68f
// Size: 0x52
function private function_abcd722e23b31c8c( n_ratescale )
{
    if ( !isagent( self ) )
    {
        return;
    }
    
    if ( asm::function_27be172b46a89235() == n_ratescale )
    {
        return;
    }
    
    asm::function_d82cb83c9c260d49( n_ratescale );
    
    if ( !self.is_dying && gettime() > self.birthtime )
    {
        asm::function_24133a663bba593c();
    }
}

// Namespace effect_slow
// Params 1
// Checksum 0xdc41f2cc, Offset: 0x6e9
// Size: 0xe0
function stop_slow( var_40668aa4c0a87533 )
{
    assert( isstring( var_40668aa4c0a87533 ), "<dev string:x24>" );
    
    if ( !( isdefined( self ) && isdefined( self.status_effects ) ) )
    {
        return;
    }
    
    if ( !isarray( self.status_effects[ "slow" ] ) )
    {
        return;
    }
    
    foreach ( active_effect in self.status_effects[ "slow" ] )
    {
        if ( var_40668aa4c0a87533 == active_effect.unique_id )
        {
            active_effect.end_time = -1;
        }
    }
}

// Namespace effect_slow
// Params 0
// Checksum 0xfb58a1f3, Offset: 0x7d1
// Size: 0xb2
function function_81378d17df472373()
{
    if ( !( isdefined( self ) && isdefined( self.status_effects ) ) )
    {
        return;
    }
    
    if ( !isarray( self.status_effects[ "slow" ] ) )
    {
        return;
    }
    
    foreach ( active_effect in self.status_effects[ "slow" ] )
    {
        active_effect.end_time = -1;
    }
}

// Namespace effect_slow
// Params 2
// Checksum 0xe1b37718, Offset: 0x88b
// Size: 0x3a
function is_slowed( effect_id, include_cooldown )
{
    if ( effect_id )
    {
        return status_effects::function_fa35fc2723e956eb( "slow", effect_id, include_cooldown );
    }
    
    return status_effects::function_98e705c3c729bbbc( "slow", include_cooldown );
}

// Namespace effect_slow
// Params 1
// Checksum 0x6760bda1, Offset: 0x8cd
// Size: 0xbb, Type: bool
function has_slow( var_40668aa4c0a87533 )
{
    assert( isstring( var_40668aa4c0a87533 ), "<dev string:x24>" );
    
    if ( !status_effects::function_98e705c3c729bbbc( "slow" ) )
    {
        return false;
    }
    
    foreach ( active_effect in self.status_effects[ "slow" ] )
    {
        if ( var_40668aa4c0a87533 == active_effect.unique_id )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace effect_slow
// Params 2
// Checksum 0x3b144892, Offset: 0x991
// Size: 0xd6, Type: bool
function function_e91f0595ade60e84( var_1e4624a03ea41715, var_40668aa4c0a87533 )
{
    assert( isstring( var_40668aa4c0a87533 ), "<dev string:x24>" );
    
    if ( !status_effects::function_98e705c3c729bbbc( "slow" ) )
    {
        return false;
    }
    
    foreach ( active_effect in self.status_effects[ "slow" ] )
    {
        if ( var_40668aa4c0a87533 == active_effect.unique_id && var_1e4624a03ea41715 == active_effect.var_1e4624a03ea41715 )
        {
            return true;
        }
    }
    
    return false;
}

