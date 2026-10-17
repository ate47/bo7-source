#using scripts\common\callbacks;
#using scripts\common\heartbeat;

#namespace heartbeat_cp_mp;

// Namespace heartbeat_cp_mp
// Params 0
// Checksum 0x2c5a953b, Offset: 0x76
// Size: 0x23
function main()
{
    heartbeat::initcommonheartbeat( &playsoundfunc );
    callback::add( #"player_spawned", &function_c28a3bdcde55eed9 );
}

// Namespace heartbeat_cp_mp
// Params 1
// Checksum 0x20ca91f8, Offset: 0xa1
// Size: 0x13
function function_c28a3bdcde55eed9( params )
{
    thread heartbeat::function_a9498ed6ab4895f0();
}

// Namespace heartbeat_cp_mp
// Params 1
// Checksum 0x8375358e, Offset: 0xbc
// Size: 0x22
function playsoundfunc( firstpersonalias )
{
    self playlocalsound( firstpersonalias, undefined, 1 );
    self.heartbeatalias = firstpersonalias;
}

