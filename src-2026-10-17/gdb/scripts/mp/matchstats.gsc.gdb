NAME scripts\mp\matchstats.gsc
VERSION 0
CHECKSUM 0x64229b01
######################################################
####################  DEV STRINGS  ###################
######################################################
# matchstats::addtogamemodestat@3f matchstats::getgamemodestat@36
STRING "<dev string:x112>" 0x9be 0xa1f
# matchstats::loadgamemodestatmap@72
STRING "<dev string:x24>" 0x1af
# matchstats::setmatchstat@5a matchstats::addtomatchstat@5a
STRING "<dev string:x6e>" 0x62f 0x725
# matchstats::setgamemodestat@3f
STRING "<dev string:xb7>" 0x954
# matchstats::setgamemodestat@47 matchstats::addtogamemodestat@47 matchstats::getgamemodestat@3e
STRING "<dev string:xd6>" 0x95c 0x9c6 0xa27
######################################################
####################  DEV BLOCKS  ####################
######################################################
# matchstats::loadgamemodestatmap@6d
DEVBLOCK 0x1aa
# matchstats::writeplayerinfo@4e
DEVBLOCK 0x401
# matchstats::setmatchstat@55
DEVBLOCK 0x62a
# matchstats::addtomatchstat@55
DEVBLOCK 0x720
# matchstats::setgamemodestat@3a
DEVBLOCK 0x94f
# matchstats::addtogamemodestat@3a
DEVBLOCK 0x9b9
# matchstats::getgamemodestat@31
DEVBLOCK 0xa1a
