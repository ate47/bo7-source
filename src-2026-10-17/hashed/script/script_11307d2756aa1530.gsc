#using script_2ad7dff7e51218da;
#using script_5b21ba28a2525703;
#using script_6995a3eb7d571a9f;
#using scripts\common\callbacks;
#using scripts\mp\hud_message;

#namespace juggernaut_mp;

// Namespace juggernaut_mp
// Params 0
// Checksum 0x2453c379, Offset: 0x84
// Size: 0x51
function init()
{
    if ( !isdefined( level.killstreaksetups[ "juggernaut" ] ) )
    {
        killstreaks::registerkillstreak( "juggernaut", &juggernaut::tryusejuggernautfromstruct );
        callback::add( #"player_spawned", &jugg_registeronplayerspawncallback );
        callback::add( #"hash_dff7cb7b68f75deb", &function_83b7c3c81cbe9a3c );
    }
}

// Namespace juggernaut_mp
// Params 1
// Checksum 0x238a5b59, Offset: 0xdd
// Size: 0xc
function jugg_registeronplayerspawncallback( function )
{
    
}

// Namespace juggernaut_mp
// Params 1, eflags: 0x4
// Checksum 0x4fa5b44b, Offset: 0xf1
// Size: 0x76, Type: bool
function private function_83b7c3c81cbe9a3c( params )
{
    game_object = params.game_object;
    player = params.player;
    
    if ( !player.isjuggernaut || gameobjects_common::get_type_hash( game_object ) != #"gameobject_type_carry_object" )
    {
        return true;
    }
    
    player hud_message::showerrormessage( %"killstreaks/jugg_cannot_be_picked_up", undefined, 5 );
    return false;
}

