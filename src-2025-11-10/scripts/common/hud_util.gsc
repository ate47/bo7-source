#namespace hud_util;

// Namespace hud_util
// Params 3
// Checksum 0xb455ca7c, Offset: 0xa7
// Size: 0xf3
function create_client_overlay( shader_name, start_alpha, player )
{
    if ( isdefined( player ) )
    {
        overlay = newclienthudelem( player );
    }
    else
    {
        overlay = newhudelem();
    }
    
    overlay.x = 0;
    overlay.y = 0;
    overlay setshader( shader_name, 640, 480 );
    overlay.alignx = "left";
    overlay.aligny = "top";
    overlay.sort = 1;
    overlay.horzalign = "fullscreen";
    overlay.vertalign = "fullscreen";
    overlay.alpha = start_alpha;
    overlay.foreground = 1;
    
    if ( player.var_ef54b223f43655d )
    {
        overlay.scramblerdisabled = 1;
    }
    
    return overlay;
}

// Namespace hud_util
// Params 3
// Checksum 0xef47087b, Offset: 0x1a3
// Size: 0xb7
function function_a7b5c7ac6074b623( var_3a02922385795f0d, shader_name, tint_color )
{
    assert( isplayer( self ), "<dev string:x24>" );
    
    if ( !isdefined( self.overlay ) )
    {
        self.overlay = [];
    }
    
    if ( !isdefined( self.overlay[ var_3a02922385795f0d ] ) )
    {
        self.overlay[ var_3a02922385795f0d ] = create_client_overlay( shader_name, 0, self );
        self.overlay[ var_3a02922385795f0d ].sort = 0;
        self.overlay[ var_3a02922385795f0d ].foreground = 1;
    }
    
    self.overlay[ var_3a02922385795f0d ].color = tint_color;
}

// Namespace hud_util
// Params 3
// Checksum 0xbbeaa9ca, Offset: 0x262
// Size: 0x83
function fade_in( time, shader, targetalpha = 0 )
{
    if ( level.missionfailed )
    {
        return;
    }
    
    if ( !isdefined( time ) )
    {
        time = 0.3;
    }
    
    overlay = get_optional_overlay( shader );
    
    if ( !overlay )
    {
        return;
    }
    
    if ( time > 0 )
    {
        overlay fadeovertime( time );
    }
    
    overlay.alpha = targetalpha;
    
    if ( time > 0 )
    {
        wait time;
    }
}

// Namespace hud_util
// Params 1
// Checksum 0x460ef7ea, Offset: 0x2ed
// Size: 0x22
function get_optional_overlay( shader )
{
    if ( !isdefined( shader ) )
    {
        shader = "black";
    }
    
    return get_overlay( shader );
}

// Namespace hud_util
// Params 3
// Checksum 0xd9e7cfc4, Offset: 0x318
// Size: 0x77
function fade_out( time, shader, targetalpha = 1 )
{
    if ( !isdefined( time ) )
    {
        time = 0.3;
    }
    
    overlay = get_optional_overlay( shader );
    
    if ( !overlay )
    {
        return;
    }
    
    if ( time > 0 )
    {
        overlay fadeovertime( time );
    }
    
    overlay.alpha = targetalpha;
    
    if ( time > 0 )
    {
        wait time;
    }
}

// Namespace hud_util
// Params 1
// Checksum 0x94431b17, Offset: 0x397
// Size: 0xc3
function get_overlay( shader )
{
    if ( isplayer( self ) )
    {
        guy = self;
    }
    else
    {
        guy = level.player;
    }
    
    if ( !guy )
    {
        return;
    }
    
    if ( !isdefined( guy.overlay ) )
    {
        guy.overlay = [];
    }
    
    if ( !isdefined( guy.overlay[ shader ] ) )
    {
        guy.overlay[ shader ] = create_client_overlay( shader, 0, guy );
    }
    
    guy.overlay[ shader ].sort = 0;
    guy.overlay[ shader ].foreground = 1;
    return guy.overlay[ shader ];
}

// Namespace hud_util
// Params 1
// Checksum 0x22770f55, Offset: 0x463
// Size: 0x49
function function_be7e0db0a4ea532( var_14fae8b1961228b5 )
{
    if ( isplayer( self ) )
    {
        guy = self;
    }
    else
    {
        guy = level.player;
    }
    
    if ( !guy )
    {
        return;
    }
    
    guy.var_ef54b223f43655d = var_14fae8b1961228b5 ?? 1;
}

