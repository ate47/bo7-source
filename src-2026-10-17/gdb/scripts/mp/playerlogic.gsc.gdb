NAME scripts\mp\playerlogic.gsc
VERSION 0
CHECKSUM 0x7ea3c414
######################################################
####################  DEV STRINGS  ###################
######################################################
# playerlogic::spawnplayer@372
STRING "<dev string:x10b>" 0x5cf5
# playerlogic::spawnplayer@67d playerlogic::callback_playerconnect@752 playerlogic::callback_playerconnect@77c
STRING "<dev string:x134>" 0x6000 0xc91e 0xc948
# playerlogic::spawnplayer@71b
STRING "<dev string:x139>" 0x609e
# playerlogic::spawnplayer@725
STRING "<dev string:x13c>" 0x60a8
# playerlogic::spawnplayer@735
STRING "<dev string:x13f>" 0x60b8
# playerlogic::spawnplayer@b53 playerlogic::callback_playerdisconnect@264 playerlogic::updateplayersegmentdata@109 playerlogic::updateplayersegmentdata@203 playerlogic::updateplayersegmentdata@36c playerlogic::function_19b427d151411760@c6 playerlogic::function_19b427d151411760@1b6 playerlogic::function_19b427d151411760@352 playerlogic::function_19b427d151411760@424 playerlogic::function_19b427d151411760@502 playerlogic::function_17ad02ee25a30eed@188 playerlogic::function_17ad02ee25a30eed@25d
STRING "<dev string:x198>" 0x64d6 0xa9df 0xb9c3 0xbabd 0xbc26 0xe174 0xe264 0xe400 0xe4d2 0xe5b0 0xe7cb 0xe8a0
# playerlogic::spawnplayer@eec
STRING "<dev string:x1be>" 0x686f
# playerlogic::spawnspectatormapcam@2ae
STRING "<dev string:x1ec>" 0x8b15
# playerlogic::spawnspectatormapcam@3b8
STRING "<dev string:x206>" 0x8c1f
# playerlogic::getspectatepoint@159 playerlogic::spawnintermission@193 playerlogic::function_70f5e0a0db89d386@109
STRING "<dev string:x213>" 0x9d72 0xa360 0xc002
# playerlogic::getspectatepoint@538
STRING "<dev string:x240>" 0xa151
# playerlogic::spawnclient@1c3
STRING "<dev string:x24>" 0x2bed
# playerlogic::callback_playerdisconnect@533 playerlogic::callback_playerdisconnect@5ed
STRING "<dev string:x25f>" 0xacae 0xad68
# playerlogic::callback_playerdisconnect@5fc
STRING "<dev string:x267>" 0xad77
# playerlogic::callback_playerdisconnect@60c
STRING "<dev string:x26b>" 0xad87
# playerlogic::callback_playerdisconnect@65c
STRING "<dev string:x26f>" 0xadd7
# playerlogic::endemptygamewatcher@38
STRING "<dev string:x296>" 0xafbe
# playerlogic::endemptygamewatcher@65
STRING "<dev string:x2ce>" 0xafeb
# playerlogic::connect_validateplayerteam@97
STRING "<dev string:x308>" 0xb490
# playerlogic::function_9d76ec8c8a33a47c@2b
STRING "<dev string:x333>" 0xbca7
# playerlogic::function_9d76ec8c8a33a47c@49
STRING "<dev string:x339>" 0xbcc5
# playerlogic::function_9d76ec8c8a33a47c@44
STRING "<dev string:x346>" 0xbcc0
# playerlogic::function_70f5e0a0db89d386@e3
STRING "<dev string:x35c>" 0xbfdc
# playerlogic::function_70f5e0a0db89d386@f6
STRING "<dev string:x38a>" 0xbfef
# playerlogic::callback_playerconnect@4be
STRING "<dev string:x3b3>" 0xc68a
# playerlogic::callback_playerconnect@4cd
STRING "<dev string:x3bf>" 0xc699
# playerlogic::callback_playerconnect@4d3
STRING "<dev string:x3dc>" 0xc69f
# playerlogic::callback_playerconnect@68a
STRING "<dev string:x3e5>" 0xc856
# playerlogic::callback_playerconnect@699
STRING "<dev string:x3f9>" 0xc865
# playerlogic::callback_playerconnect@6b2
STRING "<dev string:x40f>" 0xc87e
# playerlogic::callback_playerconnect@6c7
STRING "<dev string:x426>" 0xc893
# playerlogic::callback_playerconnect@6dc
STRING "<dev string:x438>" 0xc8a8
# playerlogic::callback_playerconnect@b1c
STRING "<dev string:x44b>" 0xcce8
# playerlogic::callback_playerconnect@b17 playerlogic::callback_playerconnect@b2c
STRING "<dev string:x451>" 0xcce3 0xccf8
# playerlogic::callback_playerconnect@b43 playerlogic::callback_playerconnect@106e
STRING "<dev string:x452>" 0xcd0f 0xd23a
# playerlogic::callback_playerconnect@b55
STRING "<dev string:x45c>" 0xcd21
# playerlogic::callback_playerconnect@b68 playerlogic::addtoteamcount@2f playerlogic::addtoteamcount@50 playerlogic::removefromteamcount@25 playerlogic::removefromteamcount@46
STRING "<dev string:x466>" 0xcd34 0x10215 0x10236 0x10296 0x102b7
# playerlogic::callback_playerconnect@b78
STRING "<dev string:x46b>" 0xcd44
# playerlogic::callback_playerconnect@1033
STRING "<dev string:x470>" 0xd1ff
# playerlogic::callback_playermigrated@10
STRING "<dev string:x47e>" 0xd6a7
# playerlogic::callback_playermigrated@1f
STRING "<dev string:x486>" 0xd6b6
# playerlogic::callback_playermigrated@9c
STRING "<dev string:x4a3>" 0xd733
# playerlogic::callback_playerconnectrejoin@6
STRING "<dev string:x4d0>" 0xd801
# playerlogic::callback_playerconnectrejoin@15 playerlogic::callback_playerconnectrejoin@21 playerlogic::function_eb57164fee20f297@2e playerlogic::function_eb57164fee20f297@3a playerlogic::function_eb57164fee20f297@4a
STRING "<dev string:x4ff>" 0xd810 0xd81c 0xd873 0xd87f 0xd88f
# playerlogic::callback_playerconnectrejoin@31 playerlogic::function_eb57164fee20f297@53
STRING "<dev string:x501>" 0xd82c 0xd898
# playerlogic::function_eb57164fee20f297@1f
STRING "<dev string:x503>" 0xd864
# playerlogic::function_1ce1d94092b605f4@51
STRING "<dev string:x538>" 0x10e28
# playerlogic::spawnclient@1d2
STRING "<dev string:x55>" 0x2bfc
# playerlogic::function_1ce1d94092b605f4@79
STRING "<dev string:x55f>" 0x10e50
# playerlogic::function_1ce1d94092b605f4@a1
STRING "<dev string:x58c>" 0x10e78
# playerlogic::function_1ce1d94092b605f4@c9
STRING "<dev string:x5b8>" 0x10ea0
# playerlogic::waitandspawnclient@de
STRING "<dev string:x5e>" 0x31fc
# playerlogic::getspawnpoint@3e0
STRING "<dev string:x80>" 0x4f65
# playerlogic::getspawnpoint@4a1
STRING "<dev string:xb9>" 0x5026
# playerlogic::getspawnpoint@4a9
STRING "<dev string:xc8>" 0x502e
# playerlogic::getspawnpoint@4b2
STRING "<dev string:xcd>" 0x5037
# playerlogic::getspawnpoint@53e
STRING "<dev string:xd2>" 0x50c3
######################################################
####################  DEV BLOCKS  ####################
######################################################
# playerlogic::init@5e
DEVBLOCK 0x2258
# playerlogic::spawnclient@e4
DEVBLOCK 0x2b0e
# playerlogic::spawnclient@e7
DEVBLOCK 0x2b11
# playerlogic::spawnclient@f9
DEVBLOCK 0x2b23
# playerlogic::spawnclient@1be
DEVBLOCK 0x2be8
# playerlogic::waitandspawnclient@d9
DEVBLOCK 0x31f7
# playerlogic::waitandspawnclient@a46
DEVBLOCK 0x3b64
# playerlogic::getspawnpoint@3db
DEVBLOCK 0x4f60
# playerlogic::getspawnpoint@3eb
DEVBLOCK 0x4f70
# playerlogic::getspawnpoint@3ff
DEVBLOCK 0x4f84
# playerlogic::getspawnpoint@49c
DEVBLOCK 0x5021
# playerlogic::getspawnpoint@539
DEVBLOCK 0x50be
# playerlogic::getspawnpoint@549
DEVBLOCK 0x50ce
# playerlogic::getspawnpoint@55d
DEVBLOCK 0x50e2
# playerlogic::getspawnpoint@867
DEVBLOCK 0x53ec
# playerlogic::getspawnpoint@87b
DEVBLOCK 0x5400
# playerlogic::getspawnpoint@a6a
DEVBLOCK 0x55ef
# playerlogic::spawnplayer@30c
DEVBLOCK 0x5c8f
# playerlogic::spawnplayer@36d
DEVBLOCK 0x5cf0
# playerlogic::spawnplayer@613
DEVBLOCK 0x5f96
# playerlogic::spawnplayer@635
DEVBLOCK 0x5fb8
# playerlogic::spawnplayer@716
DEVBLOCK 0x6099
# playerlogic::spawnplayer@b4e
DEVBLOCK 0x64d1
# playerlogic::spawnplayer@ee7
DEVBLOCK 0x686a
# playerlogic::spawnplayer@11bd
DEVBLOCK 0x6b40
# playerlogic::spawnplayer@159f
DEVBLOCK 0x6f22
# playerlogic::spawnspectatormapcam@2a9
DEVBLOCK 0x8b10
# playerlogic::spawnspectatormapcam@3b3
DEVBLOCK 0x8c1a
# playerlogic::getspectatepoint@154
DEVBLOCK 0x9d6d
# playerlogic::getspectatepoint@533
DEVBLOCK 0xa14c
# playerlogic::spawnintermission@18e
DEVBLOCK 0xa35b
# playerlogic::callback_playerdisconnect@25f
DEVBLOCK 0xa9da
# playerlogic::callback_playerdisconnect@52e
DEVBLOCK 0xaca9
# playerlogic::callback_playerdisconnect@5e8
DEVBLOCK 0xad63
# playerlogic::callback_playerdisconnect@657
DEVBLOCK 0xadd2
# playerlogic::endemptygamewatcher@33
DEVBLOCK 0xafb9
# playerlogic::endemptygamewatcher@60
DEVBLOCK 0xafe6
# playerlogic::removeplayerondisconnect@6d
DEVBLOCK 0xb10c
# playerlogic::removeplayerondisconnect@ad
DEVBLOCK 0xb14c
# playerlogic::connect_validateplayerteam@92
DEVBLOCK 0xb48b
# playerlogic::updateplayersegmentdata@104
DEVBLOCK 0xb9be
# playerlogic::updateplayersegmentdata@1fe
DEVBLOCK 0xbab8
# playerlogic::updateplayersegmentdata@367
DEVBLOCK 0xbc21
# playerlogic::function_9d76ec8c8a33a47c@1b
DEVBLOCK 0xbc97
# playerlogic::function_70f5e0a0db89d386@de
DEVBLOCK 0xbfd7
# playerlogic::function_70f5e0a0db89d386@f1
DEVBLOCK 0xbfea
# playerlogic::function_70f5e0a0db89d386@104
DEVBLOCK 0xbffd
# playerlogic::callback_playerconnect@31b
DEVBLOCK 0xc4e7
# playerlogic::callback_playerconnect@4b3
DEVBLOCK 0xc67f
# playerlogic::callback_playerconnect@685
DEVBLOCK 0xc851
# playerlogic::callback_playerconnect@6ee
DEVBLOCK 0xc8ba
# playerlogic::callback_playerconnect@97f
DEVBLOCK 0xcb4b
# playerlogic::callback_playerconnect@9b8
DEVBLOCK 0xcb84
# playerlogic::callback_playerconnect@b03
DEVBLOCK 0xcccf
# playerlogic::callback_playerconnect@101b
DEVBLOCK 0xd1e7
# playerlogic::callback_playermigrated@b
DEVBLOCK 0xd6a2
# playerlogic::callback_playermigrated@97
DEVBLOCK 0xd72e
# playerlogic::callback_playerconnectrejoin@1
DEVBLOCK 0xd7fc
# playerlogic::function_eb57164fee20f297@1a
DEVBLOCK 0xd85f
# playerlogic::function_19b427d151411760@c1
DEVBLOCK 0xe16f
# playerlogic::function_19b427d151411760@1b1
DEVBLOCK 0xe25f
# playerlogic::function_19b427d151411760@34d
DEVBLOCK 0xe3fb
# playerlogic::function_19b427d151411760@41f
DEVBLOCK 0xe4cd
# playerlogic::function_19b427d151411760@4fd
DEVBLOCK 0xe5ab
# playerlogic::function_17ad02ee25a30eed@183
DEVBLOCK 0xe7c6
# playerlogic::function_17ad02ee25a30eed@258
DEVBLOCK 0xe89b
# playerlogic::addtoteamcount@b
DEVBLOCK 0x101f1
# playerlogic::addtoteamcount@18
DEVBLOCK 0x101fe
# playerlogic::addtoteamcount@2a
DEVBLOCK 0x10210
# playerlogic::addtoteamcount@42
DEVBLOCK 0x10228
# playerlogic::removefromteamcount@1
DEVBLOCK 0x10272
# playerlogic::removefromteamcount@e
DEVBLOCK 0x1027f
# playerlogic::removefromteamcount@20
DEVBLOCK 0x10291
# playerlogic::removefromteamcount@38
DEVBLOCK 0x102a9
# playerlogic::addtoalivecount@56
DEVBLOCK 0x1033a
# playerlogic::removefromalivecount@37
DEVBLOCK 0x1048c
# playerlogic::addtolivescount@1
DEVBLOCK 0x1066e
# playerlogic::removefromlivescount@1
DEVBLOCK 0x106a9
# playerlogic::removeallfromlivescount@1
DEVBLOCK 0x106f5
# playerlogic::trydisableminimap@53
DEVBLOCK 0x10baf
# playerlogic::function_1ce1d94092b605f4@4c
DEVBLOCK 0x10e23
# playerlogic::function_1ce1d94092b605f4@74
DEVBLOCK 0x10e4b
# playerlogic::function_1ce1d94092b605f4@9c
DEVBLOCK 0x10e73
# playerlogic::function_1ce1d94092b605f4@c4
DEVBLOCK 0x10e9b
# playerlogic::function_85ec963075a77a92@66
DEVBLOCK 0x10f30
# playerlogic::debugcommands@1
DEVBLOCK 0x11514
