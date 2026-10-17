#using script_194f8050b4a6d3a1;
#using script_3c8ea7f78632414c;
#using script_596b87215f1ff115;
#using script_7b1e082b2533e255;
#using scripts\common\callbacks;
#using scripts\common\utility;
#using scripts\common\weapon;
#using scripts\mp\hud_message;

#namespace nemesis;

// Namespace nemesis
// Params 0, eflags: 0x1
// Checksum 0x56389e37, Offset: 0xfd
// Size: 0xef
function autoexec init()
{
    callback::add( #"player_connect", &onplayerconnect );
    callback::add( #"player_disconnect", &onplayerdisconnect );
    callback::add( #"hash_244314ef9125e636", &function_a34aef984160a893 );
    callback::add( #"player_spawned", &onplayerspawned );
    callback::add( #"game_ended", &on_game_ended );
    level.var_d0178ed48c6b73db = level.gametypebundle.var_d0178ed48c6b73db ?? 5;
    level.var_ac8a8e3512865d66 = level.gametypebundle.var_ac8a8e3512865d66 ?? 3;
    level.var_50f05a36ae584 = level.gametypebundle.var_50f05a36ae584 ?? 1;
    level.var_617f4904a95d0856 = level.gametypebundle.var_617f4904a95d0856 ?? 1;
}

// Namespace nemesis
// Params 1
// Checksum 0x7c136fb8, Offset: 0x1f4
// Size: 0x21
function onplayerconnect( params )
{
    self.pers[ #"nemesisdata" ] = [];
}

// Namespace nemesis
// Params 1
// Checksum 0x60feb303, Offset: 0x21d
// Size: 0x113
function onplayerdisconnect( params )
{
    if ( !isdefined( self.team ) )
    {
        return;
    }
    
    playerid = self getentitynumber();
    enemyteam = team_utility::getotherteam( self.team );
    
    if ( !enemyteam )
    {
        return;
    }
    
    enemyplayers = teams::getteamdata( enemyteam, "players" );
    
    foreach ( enemyplayer in enemyplayers )
    {
        enemyplayer.pers[ #"nemesisdata" ][ playerid ] = undefined;
        
        if ( enemyplayer.pers[ #"nemesisdata" ][ #"currentnemesis" ] == playerid )
        {
            enemyplayer function_d6e5bbe100d36c10( -1, self );
        }
    }
}

// Namespace nemesis
// Params 1
// Checksum 0xeec4a7d, Offset: 0x338
// Size: 0x4aa
function function_a34aef984160a893( deathdata )
{
    attacker = deathdata.attacker;
    attackerid = attacker.entnum ?? utility::get_entity_number( attacker );
    victim = deathdata.victim;
    victimid = victim.entnum ?? utility::get_entity_number( victim );
    
    if ( !isplayer( attacker ) || !isplayer( victim ) || !player_utility::playersareenemies( attacker, victim ) )
    {
        return;
    }
    
    if ( weapon::iskillstreakweapon( deathdata.objweapon ) && !weapon::function_1344ad15d2d7bd21( deathdata.objweapon ) )
    {
        return;
    }
    
    var_3472883db354dee3 = attacker.pers[ #"nemesisdata" ][ victimid ];
    
    if ( !var_3472883db354dee3 )
    {
        var_3472883db354dee3 = { #killed_by_count:0, #kill_count:0, #points:0 };
        attacker.pers[ #"nemesisdata" ][ victimid ] = var_3472883db354dee3;
    }
    
    var_3472883db354dee3.points += level.var_50f05a36ae584;
    var_3472883db354dee3.kill_count += 1;
    var_8a1f042fa1e3866e = victim.pers[ #"nemesisdata" ][ attackerid ];
    
    if ( !var_8a1f042fa1e3866e )
    {
        var_8a1f042fa1e3866e = { #killed_by_count:0, #kill_count:0, #points:0 };
        victim.pers[ #"nemesisdata" ][ attackerid ] = var_8a1f042fa1e3866e;
    }
    
    var_8a1f042fa1e3866e.points += level.var_617f4904a95d0856;
    var_8a1f042fa1e3866e.killed_by_count += 1;
    
    if ( victim.pers[ #"nemesisdata" ][ #"currentnemesis" ] == attackerid )
    {
        victim.pers[ #"nemesisdata" ][ #"nemesiskillstreak" ] = 0;
        victim updatecount( var_8a1f042fa1e3866e );
        victim playsoundtoplayer( #"hash_a7006138e078823", victim );
    }
    
    if ( attacker.pers[ #"nemesisdata" ][ #"currentnemesis" ] == victimid )
    {
        attacker updatecount( var_3472883db354dee3 );
        
        if ( !isdefined( attacker.pers[ #"nemesisdata" ][ #"nemesiskillstreak" ] ) )
        {
            attacker.pers[ #"nemesisdata" ][ #"nemesiskillstreak" ] = 0;
        }
        
        attacker.pers[ #"nemesisdata" ][ #"nemesiskillstreak" ]++;
        
        if ( !isdefined( attacker.pers[ #"nemesisdata" ][ #"hash_b680df57910c5c98" ] ) )
        {
            attacker.pers[ #"nemesisdata" ][ #"hash_b680df57910c5c98" ] = [];
        }
        
        if ( !isdefined( attacker.pers[ #"nemesisdata" ][ #"hash_b680df57910c5c98" ][ victimid ] ) )
        {
            attacker.pers[ #"nemesisdata" ][ #"hash_b680df57910c5c98" ][ victimid ] = 0;
        }
        
        attacker.pers[ #"nemesisdata" ][ #"hash_b680df57910c5c98" ][ victimid ]++;
        
        if ( attacker.pers[ #"nemesisdata" ][ #"hash_b680df57910c5c98" ][ victimid ] == 3 )
        {
            attacker thread points::doscoreevent( #"nemesis_3_streak" );
        }
        
        if ( deathdata.meansofdeath == "MOD_EXECUTION" )
        {
            attacker thread points::doscoreevent( #"nemesis_finishing_move" );
        }
        
        attacker playsoundtoplayer( #"hash_f6b1ce19d3b341e1", attacker );
        attacker thread points::doscoreevent( #"nemesis_kill" );
        attacker.var_850991e8213a0549 = 1;
        level callback::callback( #"hash_6c71d319dc089c27", { #attacker:attacker, #event:#"on_nemesis_kill" } );
        return;
    }
    
    if ( attacker function_e0045794a9429403( victim ) )
    {
        attacker function_d6e5bbe100d36c10( victimid, victim );
        attacker updatecount( var_3472883db354dee3 );
    }
    
    if ( victim function_e0045794a9429403( attacker ) )
    {
        victim function_d6e5bbe100d36c10( attackerid, attacker );
        victim updatecount( var_8a1f042fa1e3866e );
    }
}

// Namespace nemesis
// Params 1, eflags: 0x4
// Checksum 0x90b8c8c6, Offset: 0x7ea
// Size: 0x29
function private onplayerspawned( params )
{
    self.pers[ #"nemesisdata" ][ #"hash_b680df57910c5c98" ] = undefined;
}

// Namespace nemesis
// Params 1
// Checksum 0x4221c022, Offset: 0x81b
// Size: 0x16f, Type: bool
function function_e0045794a9429403( player )
{
    nemesispoints = self.pers[ #"nemesisdata" ][ player.entnum ].points;
    
    if ( nemesispoints < level.var_d0178ed48c6b73db )
    {
        return false;
    }
    
    if ( self.pers[ #"nemesisdata" ][ #"currentnemesis" ] == player.entnum )
    {
        return false;
    }
    
    enemyplayers = teams::getteamdata( player.team, "players" );
    
    foreach ( enemyplayer in enemyplayers )
    {
        if ( enemyplayer == player )
        {
            continue;
        }
        
        var_ab6fc874259ab2af = self.pers[ #"nemesisdata" ][ enemyplayer.entnum ?? utility::get_entity_number( enemyplayer ) ].points;
        
        if ( !isdefined( var_ab6fc874259ab2af ) )
        {
            continue;
        }
        
        if ( var_ab6fc874259ab2af + level.var_ac8a8e3512865d66 >= nemesispoints )
        {
            return false;
        }
    }
    
    return true;
}

// Namespace nemesis
// Params 1
// Checksum 0x421fb6da, Offset: 0x993
// Size: 0x1ea
function on_game_ended( params )
{
    progressiongroup = level.progressiongroup;
    
    foreach ( player in level.players )
    {
        if ( !player hasplayerdata() )
        {
            continue;
        }
        
        currentnemesis = player.pers[ #"nemesisdata" ][ #"currentnemesis" ];
        var_468463913a76f19 = player.pers[ #"nemesisdata" ][ currentnemesis ];
        
        if ( currentnemesis != -1 && var_468463913a76f19 )
        {
            nemesisplayer = getentbynum( currentnemesis );
            
            if ( isdefined( nemesisplayer.clientid ) )
            {
                player setplayerdata( progressiongroup, #"aardata", #"nemesisdata", #"hasnemesis", 1 );
                player setplayerdata( progressiongroup, #"aardata", #"nemesisdata", #"clientid", nemesisplayer.clientid );
                player setplayerdata( progressiongroup, #"aardata", #"nemesisdata", #"killedbycount", var_468463913a76f19.killed_by_count );
                player setplayerdata( progressiongroup, #"aardata", #"nemesisdata", #"killedcount", var_468463913a76f19.kill_count );
                continue;
            }
        }
        
        player setplayerdata( progressiongroup, #"aardata", #"nemesisdata", #"hasnemesis", 0 );
    }
}

// Namespace nemesis
// Params 2, eflags: 0x4
// Checksum 0xad045fdf, Offset: 0xb85
// Size: 0x73
function private function_d6e5bbe100d36c10( var_aa8d888696132f3a, nemesisplayer )
{
    self setclientomnvar( "ui_nemesis_player_id", var_aa8d888696132f3a );
    
    if ( var_aa8d888696132f3a != -1 )
    {
        self.pers[ #"nemesisdata" ][ #"currentnemesis" ] = var_aa8d888696132f3a;
        thread function_f58ac9d95a8bfae3( nemesisplayer );
        return;
    }
    
    self.pers[ #"nemesisdata" ][ #"currentnemesis" ] = undefined;
}

// Namespace nemesis
// Params 1, eflags: 0x4
// Checksum 0x56828056, Offset: 0xc00
// Size: 0x40
function private updatecount( nemesisdata )
{
    self setclientomnvar( "ui_nemesis_killed_by_count", nemesisdata.killed_by_count ?? 0 );
    self setclientomnvar( "ui_nemesis_killed_count", nemesisdata.kill_count ?? 0 );
}

// Namespace nemesis
// Params 1, eflags: 0x4
// Checksum 0x5e52e064, Offset: 0xc48
// Size: 0x49
function private function_f58ac9d95a8bfae3( nemesisplayer )
{
    self endon( #"disconnect" );
    
    while ( !isalive( self ) )
    {
        wait 0.1;
    }
    
    thread hud_message::showsplash( "callout_splash_nemesis", undefined, nemesisplayer );
    self playsoundtoplayer( #"hash_3bc374e18690f6c8", self );
}

