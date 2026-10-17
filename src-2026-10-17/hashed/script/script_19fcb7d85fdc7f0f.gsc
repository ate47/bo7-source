#using scripts\common\utility;

#namespace zombie_deathworm_audio;

// Namespace zombie_deathworm_audio
// Params 0
// Checksum 0x491ba7c0, Offset: 0x2af
// Size: 0x198
function function_2f6d38d0a0c29f62()
{
    if ( utility::flag( "deathworm_audio" ) )
    {
        return;
    }
    
    utility::flag_set( "deathworm_audio" );
    function_d7d2a215fff6d088( "vox_ai_deathworm_headbanger_bite", "vox_ai_deathworm_headbanger_bite", 5 );
    function_d7d2a215fff6d088( "vox_ai_deathworm_pain", "vox_ai_deathworm_pain", 4.6, 1 );
    function_d7d2a215fff6d088( "vox_ai_deathworm_beam", "vox_ai_deathworm_beam", 6 );
    function_d7d2a215fff6d088( "vox_ai_deathworm_beam_outro", "vox_ai_deathworm_beam_outro", 3.5 );
    function_d7d2a215fff6d088( "vox_ai_deathworm_death", "vox_ai_deathworm_death", 5, 1 );
    function_d7d2a215fff6d088( "vox_ai_deathworm_tunnel", "vox_ai_deathworm_tunnel", 3.6 );
    function_d7d2a215fff6d088( "vox_ai_deathworm_spittle", "vox_ai_deathworm_spittle", 5.8 );
    function_d7d2a215fff6d088( "vox_ai_deathworm_spawner", "vox_ai_deathworm_spawner", 7.6 );
    function_d7d2a215fff6d088( "vox_ai_deathworm_idle", "vox_ai_deathworm_idle", 4.5 );
    function_d7d2a215fff6d088( "vox_ai_deathworm_idle_pre", "vox_ai_deathworm_idle_pre", 2 );
    function_d7d2a215fff6d088( "vox_ai_deathworm_roar_short", "vox_ai_deathworm_roar_short", 3.4 );
    function_d7d2a215fff6d088( "vox_ai_deathworm_headbanger_roar", "vox_ai_deathworm_headbanger_roar", 3.4 );
    function_d7d2a215fff6d088( "vox_ai_deathworm_bite", "vox_ai_deathworm_bite", 9.7 );
    function_d7d2a215fff6d088( "vox_ai_deathworm_bite_fast", "vox_ai_deathworm_bite_fast", 5 );
    function_d7d2a215fff6d088( "vox_ai_deathworm_emerge", "vox_ai_deathworm_emerge", 5.1 );
    function_d7d2a215fff6d088( "vox_ai_deathworm_bite_short", "vox_ai_deathworm_bite_short", 3 );
    function_d7d2a215fff6d088( "vox_ai_deathworm_bite_long", "vox_ai_deathworm_bite_long", 4 );
    function_d7d2a215fff6d088( "vox_ai_deathworm_shark_bite", "vox_ai_deathworm_shark_bite", 4.6 );
}

// Namespace zombie_deathworm_audio
// Params 0
// Checksum 0x354bafee, Offset: 0x44f
// Size: 0x1a
function init_zombie_deathworm_audio()
{
    self.var_b2ad1e9d78432fca = &function_8ce3b5eec35735a9;
    self.var_f0f9dddeb59fc7c9 = [];
}

// Namespace zombie_deathworm_audio
// Params 1, eflags: 0x4
// Checksum 0x6845eddf, Offset: 0x471
// Size: 0x8c
function private function_8ce3b5eec35735a9( event )
{
    if ( !isdefined( self ) )
    {
        return;
    }
    
    if ( !isdefined( level.var_3f81e25c84a064a8 ) )
    {
        return;
    }
    
    var_ef1f0d3ceff86400 = level.var_3f81e25c84a064a8[ event ];
    
    if ( !isdefined( var_ef1f0d3ceff86400 ) )
    {
        return;
    }
    
    scriptable_part = var_ef1f0d3ceff86400.scriptable_part;
    playbacktime = var_ef1f0d3ceff86400.playbacktime;
    var_4e3f1dc11e6ad959 = var_ef1f0d3ceff86400.var_4e3f1dc11e6ad959;
    thread function_ad4f92129141f574( scriptable_part, playbacktime, var_4e3f1dc11e6ad959 );
}

// Namespace zombie_deathworm_audio
// Params 3
// Checksum 0x1dc3611b, Offset: 0x505
// Size: 0x1ef
function function_ad4f92129141f574( scriptable_part, playbacktime, var_4e3f1dc11e6ad959 )
{
    self endon( #"death" );
    
    if ( self isscriptable() )
    {
        if ( self getscriptablepartstate( "base" ) == "off" )
        {
            return;
        }
        
        if ( var_4e3f1dc11e6ad959 )
        {
            if ( self getscriptablehaspart( scriptable_part ) )
            {
                self setscriptablepartstate( scriptable_part, "on" );
                self.var_f0f9dddeb59fc7c9[ self.var_f0f9dddeb59fc7c9.size ] = scriptable_part;
                thread function_27ebc59ea302022e( playbacktime, scriptable_part );
            }
            
            foreach ( vox in self.var_f0f9dddeb59fc7c9 )
            {
                if ( vox != scriptable_part )
                {
                    self notify( "stop" + vox );
                    function_c8df53128f4f380e( vox );
                    waitframe();
                }
            }
            
            return;
        }
        else if ( self.var_f0f9dddeb59fc7c9.size > 1 )
        {
            foreach ( vox in self.var_f0f9dddeb59fc7c9 )
            {
                if ( vox == scriptable_part )
                {
                    self notify( "stop" + scriptable_part );
                    function_c8df53128f4f380e( scriptable_part );
                    waitframe();
                }
            }
        }
        
        if ( self getscriptablehaspart( scriptable_part ) && self getscriptablepartstate( scriptable_part ) != "on" )
        {
            utility::function_32b24db3127bff40( scriptable_part, "on" );
            self.var_f0f9dddeb59fc7c9[ self.var_f0f9dddeb59fc7c9.size ] = scriptable_part;
            thread function_27ebc59ea302022e( playbacktime, scriptable_part );
        }
    }
}

// Namespace zombie_deathworm_audio
// Params 2
// Checksum 0xf11c3089, Offset: 0x6fc
// Size: 0x44
function function_27ebc59ea302022e( playbacktime, scriptable_part )
{
    self endon( #"death" );
    self endon( #"interruptvo" );
    self endon( "stop" + scriptable_part );
    wait playbacktime;
    function_c8df53128f4f380e( scriptable_part );
}

// Namespace zombie_deathworm_audio
// Params 1
// Checksum 0xaa97c2ac, Offset: 0x748
// Size: 0x55
function function_c8df53128f4f380e( scriptable_part )
{
    if ( self isscriptable() )
    {
        if ( self getscriptablehaspart( scriptable_part ) && self getscriptablepartstate( scriptable_part ) != "off" )
        {
            utility::function_32b24db3127bff40( scriptable_part, "off" );
            self.var_f0f9dddeb59fc7c9 = arrayremove( self.var_f0f9dddeb59fc7c9, scriptable_part );
        }
    }
}

// Namespace zombie_deathworm_audio
// Params 4
// Checksum 0x8712fa47, Offset: 0x7a5
// Size: 0x89
function function_d7d2a215fff6d088( event, scriptable_part, playbacktime, var_4e3f1dc11e6ad959 )
{
    if ( !isdefined( level.var_3f81e25c84a064a8 ) )
    {
        level.var_3f81e25c84a064a8 = [];
    }
    
    state = spawnstruct();
    state.scriptable_part = scriptable_part;
    state.playbacktime = playbacktime;
    state.var_4e3f1dc11e6ad959 = var_4e3f1dc11e6ad959 ?? 0;
    level.var_3f81e25c84a064a8[ event ] = state;
}

