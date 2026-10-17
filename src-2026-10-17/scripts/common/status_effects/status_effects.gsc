#using scripts\common\callbacks;
#using scripts\common\utility;

#namespace status_effects;

// Namespace status_effects
// Params 0
// Checksum 0x298941bb, Offset: 0x76
// Size: 0x49
function init_status_effects()
{
    /#
        level thread debug_status_effects();
    #/
    
    utility::registersharedfunc( #"status_effects", #"hash_5a9731327b5c2a13", &function_dfbbd41120ea8eca );
    utility::registersharedfunc( #"status_effects", #"hash_91e247f23b28ce36", &function_7ce691f9a36ea8a1 );
}

// Namespace status_effects
// Params 1
// Checksum 0x73da238d, Offset: 0xc7
// Size: 0x3f
function function_dfbbd41120ea8eca( element_type )
{
    if ( !isdefined( level.var_78d4983161fad819 ) )
    {
        level.var_78d4983161fad819 = [];
    }
    
    level.var_78d4983161fad819 = arraycombineunique( level.var_78d4983161fad819, [ element_type ] );
}

// Namespace status_effects
// Params 1
// Checksum 0x646ad652, Offset: 0x10e
// Size: 0x3a
function function_7ce691f9a36ea8a1( element_type )
{
    if ( !isdefined( level.var_78d4983161fad819 ) )
    {
        level.var_78d4983161fad819 = [];
    }
    
    level.var_78d4983161fad819 = arrayremove( level.var_78d4983161fad819, element_type );
}

// Namespace status_effects
// Params 2
// Checksum 0x92165fdd, Offset: 0x150
// Size: 0x6a, Type: bool
function function_98e705c3c729bbbc( effect_type, include_cooldown = 0 )
{
    if ( isdefined( self.status_effects[ effect_type ] ) && self.status_effects[ effect_type ].size > 0 )
    {
        return true;
    }
    
    if ( include_cooldown )
    {
        return ( isdefined( self.effects_on_cooldown[ effect_type ] ) && self.effects_on_cooldown[ effect_type ].size > 0 );
    }
    
    return false;
}

// Namespace status_effects
// Params 2
// Checksum 0xaf6c0a0c, Offset: 0x1c3
// Size: 0xad, Type: bool
function function_e947cf9a9f176b2e( effect_type, element_type )
{
    if ( isdefined( self.status_effects[ effect_type ] ) )
    {
        foreach ( status in self.status_effects[ effect_type ] )
        {
            if ( status.element_type === element_type )
            {
                return true;
            }
        }
    }
    
    return false;
}

// Namespace status_effects
// Params 3
// Checksum 0x44fcea9e, Offset: 0x279
// Size: 0x15a, Type: bool
function function_fa35fc2723e956eb( effect_type, effect_id, include_cooldown = 0 )
{
    assert( isstring( effect_id ), "<dev string:x24>" );
    
    if ( !function_98e705c3c729bbbc( effect_type, include_cooldown ) )
    {
        return false;
    }
    
    foreach ( active_effect in self.status_effects[ effect_type ] )
    {
        if ( effect_id === active_effect.unique_id )
        {
            return true;
        }
    }
    
    if ( include_cooldown )
    {
        foreach ( cooldown_effect in self.effects_on_cooldown[ effect_type ] )
        {
            if ( effect_id === cooldown_effect.unique_id )
            {
                return true;
            }
        }
    }
    
    return false;
}

// Namespace status_effects
// Params 3
// Checksum 0x6c78ccf5, Offset: 0x3dc
// Size: 0xfb
function function_a541569a5cf7126b( effect_type, effect_id, duration )
{
    assert( isstring( effect_id ), "<dev string:x24>" );
    
    if ( !function_98e705c3c729bbbc( effect_type ) )
    {
        return;
    }
    
    foreach ( active_effect in self.status_effects[ effect_type ] )
    {
        if ( effect_id === active_effect.unique_id )
        {
            time_left = active_effect.end_time - gettime();
            active_effect.end_time = gettime() + max( time_left, utility::function_4b74c15943231980( duration ) );
        }
    }
}

// Namespace status_effects
// Params 7
// Checksum 0x488e, Offset: 0x4df
// Size: 0xe5
function function_93edde8d0fe48bb6( effect_type, durations, unique_id, start_func, end_func, element_type, cooldowns )
{
    base_effect = spawnstruct();
    base_effect.effect_type = effect_type;
    base_effect.unique_id = unique_id;
    base_effect.durations = durations;
    base_effect.start_func = start_func;
    base_effect.end_func = end_func;
    base_effect.end_time = gettime() + utility::function_4b74c15943231980( base_effect.durations );
    base_effect.var_efcde2142240af7 = 0;
    base_effect.element_type = element_type;
    base_effect.cooldowns = cooldowns;
    return base_effect;
}

// Namespace status_effects
// Params 1
// Checksum 0xf87acb20, Offset: 0x5cd
// Size: 0x2fe, Type: bool
function start_effect( effect )
{
    assert( isalive( self ), "<dev string:x41>" );
    
    if ( !isdefined( self.status_effects ) )
    {
        self.status_effects = [];
    }
    
    if ( !isdefined( self.status_effects[ effect.effect_type ] ) )
    {
        self.status_effects[ effect.effect_type ] = [];
    }
    
    if ( self.effects_on_cooldown[ effect.effect_type ] && self.effects_on_cooldown[ effect.effect_type ].size > 0 )
    {
        if ( effect.unique_id )
        {
            foreach ( cooldown_effect in self.effects_on_cooldown[ effect.effect_type ] )
            {
                if ( cooldown_effect.unique_id == effect.unique_id )
                {
                    return false;
                }
            }
        }
        else
        {
            return false;
        }
    }
    
    foreach ( active_effect in self.status_effects[ effect.effect_type ] )
    {
        if ( active_effect.cooldowns > 0 )
        {
            if ( !effect.unique_id || active_effect.unique_id == effect.unique_id )
            {
                return false;
            }
        }
    }
    
    if ( isdefined( effect.unique_id ) )
    {
        foreach ( active_effect in self.status_effects[ effect.effect_type ] )
        {
            if ( effect.unique_id == active_effect.unique_id )
            {
                active_effect.var_efcde2142240af7 = 1;
            }
        }
    }
    
    self.status_effects[ effect.effect_type ][ self.status_effects[ effect.effect_type ].size ] = effect;
    
    if ( isdefined( effect.start_func ) )
    {
        self [[ effect.start_func ]]( effect );
    }
    
    if ( isdefined( self ) )
    {
        thread effects_monitor();
    }
    
    return true;
}

// Namespace status_effects
// Params 0, eflags: 0xc
// Checksum 0xe690bfd4, Offset: 0x8d4
// Size: 0x4d4
function private effects_monitor()
{
    self notify( #"hash_69b8b2d378fc730d" );
    self endon( #"hash_69b8b2d378fc730d" );
    self endon( #"disconnect" );
    
    if ( !isdefined( self ) || !isdefined( self.status_effects ) )
    {
        println( "<dev string:x91>" );
        return;
    }
    
    if ( !isdefined( self.effects_on_cooldown ) )
    {
        self.effects_on_cooldown = [];
    }
    
    if ( isplayer( self ) )
    {
        if ( !callback::exists( #"player_death", &function_d4ab436c2953fc33 ) )
        {
            callback::add( #"player_death", &function_d4ab436c2953fc33 );
        }
    }
    else if ( isai( self ) )
    {
        if ( !callback::exists( #"on_ai_killed", &function_d4ab436c2953fc33 ) )
        {
            callback::add( #"on_ai_killed", &function_d4ab436c2953fc33 );
        }
    }
    
    num_effects = self.status_effects.size;
    
    while ( isdefined( self ) && num_effects > 0 && ( isalive( self ) || self.inlaststand ) )
    {
        now = gettime();
        expired_effects = [];
        
        foreach ( effect_type, effects in self.effects_on_cooldown )
        {
            active_cooldowns = [];
            
            foreach ( effect in effects )
            {
                if ( now < effect.cooldown_end_time )
                {
                    active_cooldowns[ active_cooldowns.size ] = effect;
                }
            }
            
            self.effects_on_cooldown[ effect_type ] = active_cooldowns;
        }
        
        if ( isdefined( self.status_effects ) )
        {
            foreach ( effect_type, effects in self.status_effects )
            {
                active_effects = [];
                
                foreach ( effect in effects )
                {
                    if ( effect.var_efcde2142240af7 )
                    {
                        expired_effects[ expired_effects.size ] = effect;
                        continue;
                    }
                    
                    if ( level.var_78d4983161fad819 && arraycontains( level.var_78d4983161fad819, effect.element_type ) )
                    {
                        active_effects[ active_effects.size ] = effect;
                        continue;
                    }
                    
                    if ( effect.durations < -1 )
                    {
                        active_effects[ active_effects.size ] = effect;
                        continue;
                    }
                    
                    if ( now < effect.end_time )
                    {
                        active_effects[ active_effects.size ] = effect;
                        continue;
                    }
                    
                    if ( effect.cooldowns > 0 )
                    {
                        effect.cooldown_end_time = now + utility::function_4b74c15943231980( effect.cooldowns );
                        
                        if ( !isdefined( self.effects_on_cooldown[ effect_type ] ) )
                        {
                            self.effects_on_cooldown[ effect_type ] = [];
                        }
                        
                        self.effects_on_cooldown[ effect_type ][ self.effects_on_cooldown[ effect_type ].size ] = effect;
                    }
                    
                    expired_effects[ expired_effects.size ] = effect;
                }
                
                self.status_effects[ effect_type ] = active_effects;
            }
        }
        
        foreach ( effect in expired_effects )
        {
            end_effect( effect );
        }
        
        if ( isdefined( self.status_effects ) && isdefined( self.status_effects.size ) )
        {
            num_effects = self.status_effects.size;
        }
        else
        {
            num_effects = 0;
        }
        
        waitframe();
    }
    
    if ( !isdefined( self ) )
    {
        return;
    }
    
    if ( isplayer( self ) )
    {
        callback::remove( #"player_death", &function_d4ab436c2953fc33 );
        return;
    }
    
    if ( isai( self ) )
    {
        callback::remove( #"on_ai_killed", &function_d4ab436c2953fc33 );
    }
}

// Namespace status_effects
// Params 1, eflags: 0x4
// Checksum 0xe55a854c, Offset: 0xdb0
// Size: 0x2c
function private end_effect( effect )
{
    if ( isdefined( effect.end_func ) )
    {
        self [[ effect.end_func ]]( effect );
    }
}

// Namespace status_effects
// Params 1, eflags: 0x4
// Checksum 0xcb2314ec, Offset: 0xde4
// Size: 0x13
function private function_d4ab436c2953fc33( params )
{
    function_4306f85454d862ba();
}

// Namespace status_effects
// Params 0
// Checksum 0x8b083808, Offset: 0xdff
// Size: 0xfe
function function_4306f85454d862ba()
{
    if ( !self.status_effects )
    {
        return;
    }
    
    foreach ( key, effects in self.status_effects )
    {
        self.status_effects[ key ] = [];
        
        foreach ( effect in effects )
        {
            thread end_effect( effect );
        }
    }
}

/#

    // Namespace status_effects
    // Params 0, eflags: 0x4
    // Checksum 0xcc30487c, Offset: 0xf05
    // Size: 0x3c4, Type: dev
    function private debug_status_effects()
    {
        level endon( #"game_ended" );
        
        while ( true )
        {
            entity_num = getdvarint( @"hash_f429fe6098c1896a", -1 );
            entity = getentbynum( entity_num );
            
            if ( isdefined( entity ) )
            {
                now = gettime();
                print_x = 400;
                print_y = 300;
                printtoscreen2d( print_x, print_y, "<dev string:xbf>" );
                
                if ( isdefined( entity.status_effects ) )
                {
                    foreach ( effect_type, effects in entity.status_effects )
                    {
                        if ( effects.size == 0 )
                        {
                            continue;
                        }
                        
                        unique_ids = [];
                        remainingms = 0;
                        
                        foreach ( effect in effects )
                        {
                            effect_remainingms = effect.end_time - now;
                            
                            if ( effect_remainingms > remainingms )
                            {
                                remainingms = effect_remainingms;
                            }
                            
                            if ( isdefined( effect.unique_id ) )
                            {
                                unique_ids = arraycombineunique( unique_ids, [ effect.unique_id ] );
                            }
                        }
                        
                        print_y += 20;
                        var_4110413779d8ceb1 = effect_type + "<dev string:xce>" + effects.size + "<dev string:xd1>" + utility::function_6f5d2e1f1ff70482( remainingms ) + "<dev string:xd4>";
                        printtoscreen2d( print_x, print_y, var_4110413779d8ceb1 );
                        
                        foreach ( id in unique_ids )
                        {
                            print_y += 20;
                            printtoscreen2d( print_x + 10, print_y, id );
                        }
                    }
                }
                
                print_y += 20;
                printtoscreen2d( print_x, print_y, "<dev string:xd6>" );
                
                if ( isdefined( entity.effects_on_cooldown ) )
                {
                    foreach ( effect_type, effects in entity.effects_on_cooldown )
                    {
                        if ( effects.size == 0 )
                        {
                            continue;
                        }
                        
                        remainingms = 0;
                        
                        foreach ( effect in effects )
                        {
                            effect_remainingms = effect.cooldown_end_time - now;
                            
                            if ( effect_remainingms > remainingms )
                            {
                                remainingms = effect_remainingms;
                            }
                        }
                        
                        print_y += 20;
                        var_4110413779d8ceb1 = effect_type + "<dev string:xce>" + effects.size + "<dev string:xd1>" + utility::function_6f5d2e1f1ff70482( remainingms ) + "<dev string:xd4>";
                        printtoscreen2d( print_x, print_y, var_4110413779d8ceb1 );
                    }
                }
            }
            
            waitframe();
        }
    }

#/
