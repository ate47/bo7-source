#using script_380194b81c38cd1a;
#using scripts\common\callbacks;
#using scripts\common\utility;
#using scripts\common\values;

#namespace zombie_viper_audio;

// Namespace zombie_viper_audio
// Params 0
// Checksum 0x321caad4, Offset: 0x16a
// Size: 0x89
function init_global()
{
    if ( utility::flag( "viper_audio" ) )
    {
        return;
    }
    
    utility::flag_set( "viper_audio" );
    zombie_vox::register_vox_state( "vox_taunt", "vox_taunt", "dx_zm_aiuk_adbt_klub_aikcmbchtad", 2, 5600 );
    zombie_vox::register_vox_state( "vox_downs_player", "vox_downs_player", "dx_zm_aiuk_adbt_klub_aikdnplad", 3, 5300 );
    callback::get_template( self.animsetname ) callback::add( "killed_body_cloned", &play_death_vo );
    
    if ( !isdefined( level.var_76ee2d6ca72d307c ) )
    {
        level.var_76ee2d6ca72d307c = [];
    }
}

// Namespace zombie_viper_audio
// Params 0
// Checksum 0x3e0c37dd, Offset: 0x1fb
// Size: 0x43
function init()
{
    if ( self.zombieaisettings.var_d3de1a9faac42deb.enablevo )
    {
        self.var_651f886e839b954e = &function_b39fce6a03245e09;
        zombie_vox::register_play_vox_fn( &function_8dbbaafd4479600f );
        thread play_zombie_ambient_repeating();
    }
}

// Namespace zombie_viper_audio
// Params 6, eflags: 0x4
// Checksum 0x8e8b91ad, Offset: 0x246
// Size: 0xca
function private function_8dbbaafd4479600f( event, zombie, scriptable_state, alias, priority, vox_length )
{
    if ( !zombie val::get( "allow_vo" ) )
    {
        return;
    }
    
    switch ( event )
    {
        case #"hash_8f4226cc8eb98081":
            zombie zombie_vox::function_bb5be6a2c88bc5f4( utility::function_4b74c15943231980( 3 ), 1 );
            break;
        case #"hash_9eb589cf515a9ddc":
            zombie zombie_vox::function_bb5be6a2c88bc5f4( utility::function_4b74c15943231980( 3 ), 1 );
            zombie zombie_vox::function_bb5be6a2c88bc5f4( utility::function_4b74c15943231980( 3 ), 2 );
            break;
        default:
            break;
    }
    
    level thread zombie_vox::play_vox( zombie, scriptable_state, alias, priority, vox_length );
}

// Namespace zombie_viper_audio
// Params 1, eflags: 0x4
// Checksum 0xeac188c0, Offset: 0x318
// Size: 0x4d
function private play_death_vo( params )
{
    if ( isdefined( self ) )
    {
        if ( self isscriptable() )
        {
            utility::function_7c10ea82c1e305b8( "sound_vo", "off" );
        }
        
        str_channel = zombie_vox::function_60b4e7f5dcc09735();
        
        if ( function_9ab89894f4bcc56c( str_channel ) )
        {
            self stopsoundchannel( str_channel );
        }
    }
}

// Namespace zombie_viper_audio
// Params 1, eflags: 0x4
// Checksum 0x8ac4039f, Offset: 0x36d
// Size: 0x13
function private function_b39fce6a03245e09( player )
{
    thread function_15ee0d5ebcf2c0c6();
}

// Namespace zombie_viper_audio
// Params 1, eflags: 0x4
// Checksum 0xf6d0f773, Offset: 0x388
// Size: 0x75
function private function_15ee0d5ebcf2c0c6( player )
{
    self endon( #"death" );
    wait 4;
    
    if ( self isscriptable() )
    {
        utility::function_7c10ea82c1e305b8( "sound_vo", "off" );
    }
    
    str_channel = zombie_vox::function_60b4e7f5dcc09735();
    
    if ( function_9ab89894f4bcc56c( str_channel ) )
    {
        self stopsoundchannel( str_channel );
    }
    
    waitframe();
    level function_8dbbaafd4479600f( "vox_downs_player", self, "vox_downs_player", "dx_zm_aiuk_adbt_klub_aikdnplad", 3, 5300 );
}

// Namespace zombie_viper_audio
// Params 0
// Checksum 0xed7f4934, Offset: 0x405
// Size: 0x1da
function play_zombie_ambient_repeating()
{
    self endon( #"death" );
    utility::flag_wait( "scriptables_ready" );
    wait 1;
    var_a50f94f03edff6b3 = 0;
    
    while ( true )
    {
        b_played_vo = 0;
        
        if ( val::get( "play_ambient_vo" ) && val::get( "allow_vo" ) && !utility::ent_flag( "playing_vo" ) && !self._blackboard.zombieunreachableisattacking && !self getaiblackboarddynamic( "in_rocket_punch" ) && ( !isdefined( level.zombie_ambient_count ) || level.zombie_ambient_count < 3 ) )
        {
            params = get_ambient_params();
            curr_time = gettime();
            
            if ( params.var_dc8cb35f39318c8e > 0 && isdefined( params.var_a2ca231ce4d6b000 ) && ( utility::percent_chance( params.var_dc8cb35f39318c8e ) || var_a50f94f03edff6b3 >= 30 ) && ( !isdefined( level.var_76ee2d6ca72d307c[ params.var_a2ca231ce4d6b000 ] ) || curr_time - level.var_76ee2d6ca72d307c[ params.var_a2ca231ce4d6b000 ] > 5000 ) )
            {
                b_played_vo = 1;
                var_a50f94f03edff6b3 = 0;
                
                if ( !isdefined( level.zombie_ambient_count ) )
                {
                    level.zombie_ambient_count = 0;
                }
                
                level.zombie_ambient_count++;
                level.var_76ee2d6ca72d307c[ params.var_a2ca231ce4d6b000 ] = curr_time;
                zombie_vox::function_5ac4bed4a907abf5( params.var_a2ca231ce4d6b000 );
                waitframe();
                utility::ent_flag_waitopen_any( "playing_vo" );
                level.zombie_ambient_count--;
                
                if ( level.zombie_ambient_count < 0 )
                {
                    level.zombie_ambient_count = 0;
                }
            }
            else
            {
                var_a50f94f03edff6b3++;
            }
        }
        
        wait b_played_vo ? 10 : 1;
    }
}

// Namespace zombie_viper_audio
// Params 0, eflags: 0x4
// Checksum 0xb223cc3e, Offset: 0x5e7
// Size: 0x59
function private get_ambient_params()
{
    params = spawnstruct();
    
    if ( isdefined( self.enemy ) )
    {
        var_419305557a246c4c = [ "vox_taunt" ];
        params.var_a2ca231ce4d6b000 = var_419305557a246c4c[ randomintrange( 0, var_419305557a246c4c.size ) ];
        params.var_dc8cb35f39318c8e = 10;
    }
    
    return params;
}

