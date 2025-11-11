#using scripts\common\callbacks;
#using scripts\engine\utility;

#namespace specialty_nearest_enemy_footsteps;

// Namespace specialty_nearest_enemy_footsteps
// Params 0, eflags: 0x1
// Checksum 0x56a4c57a, Offset: 0x16c
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_nearest_enemy_footsteps
// Params 1
// Checksum 0x6422ce95, Offset: 0x18c
// Size: 0x4a
function registerspecialty( params )
{
    if ( function_64872fcef35cb56c( #"specialty_nearest_enemy_footsteps" ) )
    {
        return;
    }
    
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_nearest_enemy_footsteps", &function_a771433689b3cac3, &function_a1b14ca79d57d8cc );
    }
}

// Namespace specialty_nearest_enemy_footsteps
// Params 0, eflags: 0x4
// Checksum 0xce177a23, Offset: 0x1de
// Size: 0xba
function private function_a771433689b3cac3()
{
    if ( !isdefined( self.var_fd9d7f7f762f857b ) )
    {
        self.var_fd9d7f7f762f857b = {};
    }
    
    info = self.var_fd9d7f7f762f857b;
    
    if ( !isdefined( info.questcircle ) )
    {
        info.questcircle = function_298342fb8e8a8459( "EnemyRecentFootsteps", self.origin[ 0 ], self.origin[ 1 ], 500, self );
    }
    
    if ( !isdefined( info.questcircle ) )
    {
        assertmsg( "<dev string:x24>" );
        return;
    }
    
    info.var_7b0518dea64e7beb = 0;
    info.questcircle hide();
    info.owner = self;
    thread function_dd154b5c5d751519();
}

// Namespace specialty_nearest_enemy_footsteps
// Params 0, eflags: 0x4
// Checksum 0xa23d9c3f, Offset: 0x2a0
// Size: 0x11
function private function_a1b14ca79d57d8cc()
{
    self notify( "smc23xyzw90zsd" );
    thread function_c2b409cee0634e();
}

// Namespace specialty_nearest_enemy_footsteps
// Params 0, eflags: 0xc
// Checksum 0x7f649993, Offset: 0x2b9
// Size: 0x7e
function private function_c2b409cee0634e()
{
    self notify( "2db8384373bdaa66" );
    self endon( "2db8384373bdaa66" );
    level endon( "game_ended" );
    self endon( "death_or_disconnect" );
    wait 0.1;
    
    if ( !isdefined( self.perks[ "specialty_nearest_enemy_footsteps" ] ) )
    {
        info = self.var_fd9d7f7f762f857b;
        
        if ( info )
        {
            if ( info.questcircle )
            {
                info.questcircle delete();
            }
            
            self.var_fd9d7f7f762f857b = undefined;
        }
    }
}

// Namespace specialty_nearest_enemy_footsteps
// Params 0, eflags: 0xc
// Checksum 0xf801ad60, Offset: 0x33f
// Size: 0xc9
function private function_dd154b5c5d751519()
{
    self notify( "27ba7a7137ade7a9" );
    self endon( "27ba7a7137ade7a9" );
    level endon( "game_ended" );
    self endon( "death_or_disconnect", "smc23xyzw90zsd" );
    wait 0.2;
    info = self.var_fd9d7f7f762f857b;
    
    while ( true )
    {
        if ( info.var_7b0518dea64e7beb )
        {
            wait 0.25;
            continue;
        }
        
        if ( info.var_89931584b6108720 > gettime() )
        {
            wait ( info.var_89931584b6108720 - gettime() ) * 0.001;
        }
        
        info.var_89931584b6108720 = undefined;
        var_502478fc55b51963 = function_6f8541638c6b8ad( info );
        
        if ( isdefined( var_502478fc55b51963 ) )
        {
            wait var_502478fc55b51963 + ( level.framedurationseconds ?? 0.016 );
        }
        
        wait 0.25;
    }
}

// Namespace specialty_nearest_enemy_footsteps
// Params 2, eflags: 0xc
// Checksum 0xf4e8e0dd, Offset: 0x410
// Size: 0x117
function private showquestcircletoplayer( var_94c5d19b4be712c9, var_502478fc55b51963 )
{
    self notify( "b5f1b9aa41e704a7" );
    self endon( "b5f1b9aa41e704a7" );
    level endon( "game_ended" );
    self endon( "death_or_disconnect" );
    var_94c5d19b4be712c9 endon( "death_or_disconnect" );
    var_8ff12f0ed9a70c5d = var_94c5d19b4be712c9.origin;
    wait var_502478fc55b51963;
    info = self.var_fd9d7f7f762f857b;
    info.questcircle.origin = var_8ff12f0ed9a70c5d;
    
    if ( !isdefined( info.questcircle ) )
    {
        assertmsg( "<dev string:x47>" );
        return;
    }
    
    info.questcircle showtoplayer( self );
    info.var_7b0518dea64e7beb = 1;
    var_94c5d19b4be712c9 [[ level.sharedfuncs[ #"perceptive" ][ #"hash_2e6a34ebabf3ebdd" ] ]]( self );
    info.var_3b21240f12107230 = 1;
    thread watchdeath( info, var_94c5d19b4be712c9 );
    var_94c5d19b4be712c9 thread watchdeath( info, var_94c5d19b4be712c9 );
    wait 10;
    level function_7a47c58a59adf29c( info, var_94c5d19b4be712c9 );
}

// Namespace specialty_nearest_enemy_footsteps
// Params 2, eflags: 0xc
// Checksum 0x96359969, Offset: 0x52f
// Size: 0x44
function private watchdeath( var_fd9d7f7f762f857b, var_94c5d19b4be712c9 )
{
    self notify( "d5a38d592793b4dc" );
    self endon( "d5a38d592793b4dc" );
    level endon( "game_ended" );
    utility::waittill_any( "death_or_disconnect" );
    level function_7a47c58a59adf29c( var_fd9d7f7f762f857b, var_94c5d19b4be712c9 );
}

// Namespace specialty_nearest_enemy_footsteps
// Params 2, eflags: 0xc
// Checksum 0xa06731a9, Offset: 0x57b
// Size: 0xdc
function private function_7a47c58a59adf29c( info, var_94c5d19b4be712c9 )
{
    self notify( "7df5844459786b51" );
    self endon( "7df5844459786b51" );
    profilestart();
    
    if ( !isdefined( info ) || !info.var_7b0518dea64e7beb )
    {
        profilestop();
        return;
    }
    
    info.var_7b0518dea64e7beb = 0;
    
    if ( var_94c5d19b4be712c9 && info.var_3b21240f12107230 )
    {
        info.var_3b21240f12107230 = undefined;
        var_94c5d19b4be712c9 [[ level.sharedfuncs[ #"perceptive" ][ #"decrementcount" ] ]]( info.owner );
    }
    
    if ( !isdefined( info.questcircle ) )
    {
        assertmsg( "<dev string:x47>" );
        profilestop();
        return;
    }
    
    info.questcircle hide();
    info.var_89931584b6108720 = gettime() + 1000;
    profilestop();
}

// Namespace specialty_nearest_enemy_footsteps
// Params 1, eflags: 0x4
// Checksum 0x318ce9b7, Offset: 0x65f
// Size: 0x171
function private function_6f8541638c6b8ad( info )
{
    candidates = function_51b8ce76eb43aed5( self.origin, 500, 140, 1, 0, undefined, self.team );
    var_94c5d19b4be712c9 = undefined;
    var_872d2a0fdc9ee079 = undefined;
    
    if ( candidates.size > 0 )
    {
        foreach ( candidate in candidates )
        {
            if ( !isplayer( candidate ) )
            {
                continue;
            }
            
            if ( !candidate issprinting() )
            {
                continue;
            }
            
            if ( isdefined( candidate.perks[ "specialty_ghost" ] ) )
            {
                continue;
            }
            
            if ( !isdefined( var_94c5d19b4be712c9 ) )
            {
                var_94c5d19b4be712c9 = candidate;
                var_872d2a0fdc9ee079 = distance2dsquared( self.origin, candidate.origin );
                continue;
            }
            
            var_71088ec5f7931827 = distance2dsquared( self.origin, candidate.origin );
            
            if ( var_71088ec5f7931827 < var_872d2a0fdc9ee079 )
            {
                var_94c5d19b4be712c9 = candidate;
                var_872d2a0fdc9ee079 = var_71088ec5f7931827;
            }
        }
        
        if ( isdefined( var_94c5d19b4be712c9 ) )
        {
            var_502478fc55b51963 = randomfloatrange( 0.001, 0.5 );
            thread showquestcircletoplayer( var_94c5d19b4be712c9, var_502478fc55b51963 );
        }
    }
    
    return var_502478fc55b51963;
}

