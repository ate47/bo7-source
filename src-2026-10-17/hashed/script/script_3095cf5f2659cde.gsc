#using script_aa3bac81ad4fc8e;
#using scripts\common\system;
#using scripts\common\utility;
#using scripts\mp\laststand;

#namespace namespace_d9325bef6644379d;

// Namespace namespace_d9325bef6644379d
// Params 0, eflags: 0x5
// Checksum 0xc23f6508, Offset: 0x96
// Size: 0x1d
function private autoexec __init__system__()
{
    system::register( #"phoenix_up_zm", "phoenix_up", &pre_main, undefined );
}

// Namespace namespace_d9325bef6644379d
// Params 0, eflags: 0x4
// Checksum 0xf9877ab7, Offset: 0xbb
// Size: 0x1c
function private pre_main()
{
    utility::registersharedfunc( "phoenix_up", #"activation", &activation );
}

// Namespace namespace_d9325bef6644379d
// Params 0
// Checksum 0xb8a5279d, Offset: 0xdf
// Size: 0x10d
function activation()
{
    players = level.players;
    
    foreach ( player in players )
    {
        if ( self.team != player.team )
        {
            continue;
        }
        
        can_revive = 0;
        
        if ( isdefined( level.var_6965477c3d0b042a ) && self [[ level.var_6965477c3d0b042a ]]( player, 1, 1 ) )
        {
            can_revive = 1;
        }
        else if ( player.inlaststand )
        {
            can_revive = 1;
        }
        
        if ( can_revive )
        {
            player thread bgb::bgb_revive_watcher();
            player playlocalsound( #"hash_3a4755d3fdba9362" );
            player laststand::auto_revive( self, "last_stand_bgb" );
        }
    }
}

