#using script_194f8050b4a6d3a1;
#using scripts\common\system;
#using scripts\common\utility;

#namespace namespace_6984e56172349a4d;

// Namespace namespace_6984e56172349a4d
// Params 0, eflags: 0x5
// Checksum 0x57a111db, Offset: 0x76
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"hash_d71e8f979d280088", undefined, &function_db0ade89b0b07998, undefined );
}

// Namespace namespace_6984e56172349a4d
// Params 0, eflags: 0x4
// Checksum 0x101ef09a, Offset: 0x97
// Size: 0x20
function private function_db0ade89b0b07998()
{
    utility::registersharedfunc( #"hash_bfef14c27a599b88", #"hash_5d319eff2d9589f", &function_466eb736ece0e34a );
}

// Namespace namespace_6984e56172349a4d
// Params 1
// Checksum 0x393f0c3, Offset: 0xbf
// Size: 0x56
function function_466eb736ece0e34a( player )
{
    var_13ea0140aca9171e = teams::function_bf897b798fb184b7( player );
    
    if ( var_13ea0140aca9171e )
    {
        squad = teams::getsquadmates( player.team, player.sessionsquadid, 0 );
        return squad;
    }
    
    return [ player ];
}

