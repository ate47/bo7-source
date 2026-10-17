#using script_49ad4836e54c2e6b;
#using script_49e4a4c208f44b76;

#namespace action_park;

// Namespace action_park
// Params 0
// Checksum 0xfb1cae51, Offset: 0xa1
// Size: 0x56
function initialize()
{
    game_type = game_utility::getgametype();
    
    switch ( game_type )
    {
        case #"hash_5ff8e011d5b9d1c8":
            level.var_e4b03a4f3e97879c = &function_509cb2a3b9b8407d;
            break;
        default:
            break;
    }
    
    setomnvar( "ui_action_park", 1 );
}

// Namespace action_park
// Params 0, eflags: 0x4
// Checksum 0xcd0f4676, Offset: 0xff
// Size: 0x21, Type: bool
function private function_509cb2a3b9b8407d()
{
    if ( !( game[ "roundsPlayed" ] > 0 ) )
    {
        dialog::leaderdialogonplayer( #"boost_actionpark" );
    }
    
    return true;
}

