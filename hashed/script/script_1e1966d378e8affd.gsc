#using scripts\common\values;

#namespace namespace_6d0ae726d7ea8843;

// Namespace namespace_6d0ae726d7ea8843
// Params 0, eflags: 0x1
// Checksum 0x68c246bb, Offset: 0x149
// Size: 0xb0
function autoexec main()
{
    val::register( "entity_mark_equipment", 0, 0, "$self", &function_1d92c3289232b46b, "$value" );
    val::register( "entity_mark_killstreak", 0, 0, "$self", &function_4ac7a4956431e6e3, "$value" );
    val::register( "entity_mark_air_killstreak", 0, 0, "$self", &function_cfb53d8647d9e89e, "$value" );
    val::register( "entity_mark_origin_equipment", 0, 0, "$self", &function_fb98a69fd3b338a4, "$value" );
    val::register( "entity_mark_origin_killstreak", 0, 0, "$self", &function_d1e440244547b9a6, "$value" );
    val::register( "entity_mark_origin_air_killstreak", 0, 0, "$self", &function_a75da8698fd6154f, "$value" );
}

// Namespace namespace_6d0ae726d7ea8843
// Params 1, eflags: 0x4
// Checksum 0x514655f7, Offset: 0x201
// Size: 0x2b
function private function_1d92c3289232b46b( radius = 0 )
{
    function_fc885458927cc4a4( #"equipment", radius, "entity_mark_equipment" );
}

// Namespace namespace_6d0ae726d7ea8843
// Params 1, eflags: 0x4
// Checksum 0xfb0ddd20, Offset: 0x234
// Size: 0x2b
function private function_4ac7a4956431e6e3( radius = 0 )
{
    function_fc885458927cc4a4( #"killstreak", radius, "entity_mark_killstreak" );
}

// Namespace namespace_6d0ae726d7ea8843
// Params 1, eflags: 0x4
// Checksum 0xf0393122, Offset: 0x267
// Size: 0x2b
function private function_cfb53d8647d9e89e( radius = 0 )
{
    function_fc885458927cc4a4( #"air_killstreak", radius, "entity_mark_air_killstreak" );
}

// Namespace namespace_6d0ae726d7ea8843
// Params 3, eflags: 0x4
// Checksum 0xeff4c861, Offset: 0x29a
// Size: 0xd8
function private function_fc885458927cc4a4( var_534bcf5c6ee629b4, var_7b905686f322be07, var_2feb90d4ad1f2211 )
{
    assert( isplayer( self ) );
    
    if ( !isdefined( var_534bcf5c6ee629b4 ) )
    {
        return;
    }
    
    var_63a8a19b6494117f = self.values[ var_2feb90d4ad1f2211 ];
    
    foreach ( value in var_63a8a19b6494117f )
    {
        if ( value > var_7b905686f322be07 )
        {
            var_7b905686f322be07 = value;
        }
    }
    
    if ( var_7b905686f322be07 <= 0 )
    {
        self disableentitymarks( var_534bcf5c6ee629b4 );
        return;
    }
    
    self enableentitymarks( var_534bcf5c6ee629b4, var_7b905686f322be07 );
}

// Namespace namespace_6d0ae726d7ea8843
// Params 1, eflags: 0x4
// Checksum 0x8bb6b3c6, Offset: 0x37a
// Size: 0x2b
function private function_fb98a69fd3b338a4( status = 0 )
{
    function_fe09f8f20a29f513( #"equipment", status, "entity_mark_origin_equipment" );
}

// Namespace namespace_6d0ae726d7ea8843
// Params 1, eflags: 0x4
// Checksum 0x9b67a0a2, Offset: 0x3ad
// Size: 0x2b
function private function_d1e440244547b9a6( status = 0 )
{
    function_fe09f8f20a29f513( #"killstreak", status, "entity_mark_origin_killstreak" );
}

// Namespace namespace_6d0ae726d7ea8843
// Params 1, eflags: 0x4
// Checksum 0x8cdd6d66, Offset: 0x3e0
// Size: 0x2b
function private function_a75da8698fd6154f( status = 0 )
{
    function_fe09f8f20a29f513( #"air_killstreak", status, "entity_mark_origin_air_killstreak" );
}

// Namespace namespace_6d0ae726d7ea8843
// Params 3, eflags: 0x4
// Checksum 0x1016c2b9, Offset: 0x413
// Size: 0xfd
function private function_fe09f8f20a29f513( var_534bcf5c6ee629b4, var_1c139edaf43ca40d, var_2feb90d4ad1f2211 )
{
    assert( isplayer( self ) );
    
    if ( !isdefined( var_534bcf5c6ee629b4 ) )
    {
        return;
    }
    
    if ( !var_1c139edaf43ca40d )
    {
        var_63a8a19b6494117f = self.values[ var_2feb90d4ad1f2211 ];
        
        foreach ( value in var_63a8a19b6494117f )
        {
            if ( value )
            {
                var_1c139edaf43ca40d = 1;
                break;
            }
        }
    }
    
    origin = ( 0, 0, 0 );
    
    if ( var_1c139edaf43ca40d )
    {
        origin = self.origin;
    }
    
    self function_37097bbe1bca8f6c( var_534bcf5c6ee629b4, var_1c139edaf43ca40d );
    self function_3a4525281cf413a2( var_534bcf5c6ee629b4, origin );
}

