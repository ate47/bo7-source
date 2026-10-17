#using scripts\mp\br\laststand;
#using scripts\mp\gamelogic;
#using scripts\mp\loot;

#namespace gamelogic_br;

// Namespace gamelogic_br
// Params 0
// Checksum 0xace30630, Offset: 0x87
// Size: 0x22
function callback_startgametype()
{
    gamelogic_mp::callback_startgametype();
    
    if ( !game[ "isLaunchChunk" ] )
    {
        thread loot_mp::init();
    }
    
    laststand_br::init();
}

