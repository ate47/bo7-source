#namespace hud_util;

// Namespace hud_util
// Params 3
// Checksum 0x10103df4, Offset: 0xa6
// Size: 0xd7
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
    return overlay;
}

// Namespace hud_util
// Params 3
// Checksum 0x117c1c66, Offset: 0x186
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
// Params 2
// Checksum 0xc3577a48, Offset: 0x245
// Size: 0x6a
function fade_in( time, shader )
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
    
    if ( time > 0 )
    {
        overlay fadeovertime( time );
    }
    
    overlay.alpha = 0;
    
    if ( time > 0 )
    {
        wait time;
    }
}

// Namespace hud_util
// Params 1
// Checksum 0xe18fcaeb, Offset: 0x2b7
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
// Params 2
// Checksum 0x257f332c, Offset: 0x2e2
// Size: 0x5e
function fade_out( time, shader )
{
    if ( !isdefined( time ) )
    {
        time = 0.3;
    }
    
    overlay = get_optional_overlay( shader );
    
    if ( time > 0 )
    {
        overlay fadeovertime( time );
    }
    
    overlay.alpha = 1;
    
    if ( time > 0 )
    {
        wait time;
    }
}

// Namespace hud_util
// Params 1
// Checksum 0x5b17ec41, Offset: 0x348
// Size: 0xbc
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

