#using scripts\common\callbacks;
#using scripts\common\system;
#using scripts\common\utility;
#using scripts\mp\battlechatter_mp;

#namespace zombie_scoreevent_vo;

// Namespace zombie_scoreevent_vo
// Params 0, eflags: 0x5
// Checksum 0x8a380b8e, Offset: 0x76
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"zombie_scoreevent_vo", undefined, &init_zombie_scoreevent_vo, undefined );
}

// Namespace zombie_scoreevent_vo
// Params 0
// Checksum 0xed1c2c5a, Offset: 0x97
// Size: 0x36
function init_zombie_scoreevent_vo()
{
    level callback::add( #"on_ai_killed", &on_ai_killed );
    utility::registersharedfunc( #"sound", #"play_scoreevent_vo", &play_scoreevent_vo );
}

// Namespace zombie_scoreevent_vo
// Params 1, eflags: 0x4
// Checksum 0xf42608fd, Offset: 0xd5
// Size: 0x14b
function private on_ai_killed( params )
{
    if ( !isplayer( params.eattacker ) )
    {
        return;
    }
    
    squadid = params.eattacker.sessionsquadid ?? 0;
    str_subclass = self.subclass;
    var_902111f313d946b2 = self.var_e29cf96ffe5ad58e ?? 0.7;
    
    if ( !( isdefined( str_subclass ) && isdefined( self.firstkillbattlechatter ) ) )
    {
        return;
    }
    
    if ( !isdefined( level.var_660ad9b7bb75126 ) )
    {
        level.var_660ad9b7bb75126 = [];
    }
    
    if ( !isdefined( level.var_660ad9b7bb75126[ squadid ] ) )
    {
        level.var_660ad9b7bb75126[ squadid ] = [];
    }
    
    if ( isdefined( level.var_f47ecf60e4790ad6 ) && ![[ level.var_f47ecf60e4790ad6 ]]( params.eattacker, self.firstkillbattlechatter ) )
    {
        return;
    }
    
    if ( isdefined( level.var_660ad9b7bb75126[ squadid ][ str_subclass ] ) )
    {
        return;
    }
    
    level.var_660ad9b7bb75126[ squadid ][ str_subclass ] = 1;
    b_success = battlechatter_mp::trysaylocalsound( params.eattacker, self.firstkillbattlechatter, var_902111f313d946b2 );
    
    if ( !b_success )
    {
        level.var_660ad9b7bb75126[ squadid ][ str_subclass ] = undefined;
    }
}

// Namespace zombie_scoreevent_vo
// Params 2, eflags: 0x4
// Checksum 0x615d0e3d, Offset: 0x228
// Size: 0x25
function private play_scoreevent_vo( player, battlechatterasset )
{
    level thread battlechatter_mp::trysaylocalsound( player, battlechatterasset, 0.7 );
}

