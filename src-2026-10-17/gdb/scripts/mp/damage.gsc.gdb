NAME scripts\mp\damage.gsc
VERSION 0
CHECKSUM 0xf29cbf30
######################################################
####################  DEV STRINGS  ###################
######################################################
# damage::postplayerdamaged@fea
STRING "<dev string:x107>" 0x6b2e
# damage::cac_modified_damage@431
STRING "<dev string:x162>" 0x78d6
# damage::adjustbulletstokill@85
STRING "<dev string:x1a6>" 0x9392
# damage::modifyexplosivedamage@b2
STRING "<dev string:x202>" 0xae22
# damage::modifyexplosivedamage@bd
STRING "<dev string:x20e>" 0xae2d
# damage::modifyexplosivedamage@c9
STRING "<dev string:x221>" 0xae39
# damage::modifyexplosivedamage@d5
STRING "<dev string:x22c>" 0xae45
# damage::modifyexplosivedamage@e1
STRING "<dev string:x238>" 0xae51
# damage::modifyexplosivedamage@a8
STRING "<dev string:x246>" 0xae18
# damage::callback_playerdamage_internal@427
STRING "<dev string:x24>" 0x3b5e
# damage::modifyexplosivedamage@25f
STRING "<dev string:x27a>" 0xafcf
# damage::modifyexplosivedamage@3cf
STRING "<dev string:x2ac>" 0xb13f
# damage::modifyexplosivedamage@3ca
STRING "<dev string:x2c2>" 0xb13a
# damage::filterdamage@36f
STRING "<dev string:x2fa>" 0xcb68
# damage::filterdamage@3ae
STRING "<dev string:x30b>" 0xcba7
# damage::playerkilled_parameterfixup@25
STRING "<dev string:x31e>" 0xed9f
# damage::playerkilled_sharedlogic_early@3c6 damage::function_13044ae0f56c133b@a6
STRING "<dev string:x328>" 0x10307 0x224d0
# damage::playerkilled_handledeathtype@1a2
STRING "<dev string:x32e>" 0x11b3d
# damage::playerkilled_handledeathtype@1b3
STRING "<dev string:x344>" 0x11b4e
# damage::playerkilled_killcamsetup@464 damage::handleinlaststanddeath@d7
STRING "<dev string:x346>" 0x13783 0x1535e
# damage::playerkilled_killcamsetup@47c damage::handleinlaststanddeath@102
STRING "<dev string:x358>" 0x1379b 0x15389
# damage::playerkilled_killcamsetup@482 damage::handleinlaststanddeath@108
STRING "<dev string:x362>" 0x137a1 0x1538f
# damage::playerkilled_killcamsetup@488
STRING "<dev string:x365>" 0x137a7
# damage::handleinlaststanddeath@10e
STRING "<dev string:x3a9>" 0x15395
# damage::callback_playerdamage_internal@ff3
STRING "<dev string:x3a>" 0x472a
# damage::handlenormaldeath@26f9
STRING "<dev string:x3ea>" 0x188d1
# damage::handlenormaldeath@2713
STRING "<dev string:x3fa>" 0x188eb
# damage::function_e27976b1ab5b0348@27a
STRING "<dev string:x449>" 0x1988d
# damage::function_f81a84e2092d538a@11e
STRING "<dev string:x49e>" 0x1acc7
# damage::function_f81a84e2092d538a@1c4
STRING "<dev string:x4ca>" 0x1ad6d
# damage::function_f81a84e2092d538a@27c
STRING "<dev string:x4f1>" 0x1ae25
# damage::finishplayerdamagewrapper@4c4
STRING "<dev string:x51d>" 0x1d25f
# damage::finishplayerdamagewrapper@6cb damage::finishplayerdamagewrapper@733
STRING "<dev string:x561>" 0x1d466 0x1d4ce
# damage::finishplayerdamagewrapper@6d5 damage::finishplayerdamagewrapper@73d
STRING "<dev string:x564>" 0x1d470 0x1d4d8
# damage::finishplayerdamagewrapper@6e5
STRING "<dev string:x567>" 0x1d480
# damage::finishplayerdamagewrapper@6f5
STRING "<dev string:x59d>" 0x1d490
# damage::finishplayerdamagewrapper@6fe
STRING "<dev string:x5af>" 0x1d499
# damage::finishplayerdamagewrapper@74d
STRING "<dev string:x5b7>" 0x1d4e8
# damage::finishplayerdamagewrapper@75d
STRING "<dev string:x5ee>" 0x1d4f8
# damage::updatecombatrecordkillstats@9a
STRING "<dev string:x5f6>" 0x2053c
# damage::shouldrecorddamagestats@10
STRING "<dev string:x652>" 0x20bbf
# damage::register_scripted_damage_override_func@10
STRING "<dev string:x691>" 0x21f56
# damage::function_231589aee53ae064@10
STRING "<dev string:x6e9>" 0x21feb
# damage::function_231589aee53ae064@20
STRING "<dev string:x743>" 0x21ffb
# damage::function_ce51453a1aabf1be@27 damage::function_b042fa22e449387d@18
STRING "<dev string:x7b2>" 0x22076 0x221e7
# damage::function_ce51453a1aabf1be@44 damage::function_b042fa22e449387d@42
STRING "<dev string:x7bb>" 0x22093 0x22211
# damage::function_ce51453a1aabf1be@61 damage::function_b042fa22e449387d@6c
STRING "<dev string:x7c2>" 0x220b0 0x2223b
# damage::function_ce51453a1aabf1be@7e damage::function_b042fa22e449387d@96
STRING "<dev string:x7c9>" 0x220cd 0x22265
# damage::function_ce51453a1aabf1be@9b damage::function_b042fa22e449387d@c0
STRING "<dev string:x7d3>" 0x220ea 0x2228f
# damage::function_ce51453a1aabf1be@b8 damage::function_b042fa22e449387d@ea damage::function_b042fa22e449387d@10a
STRING "<dev string:x7e0>" 0x22107 0x222b9 0x222d9
# damage::function_ce51453a1aabf1be@d5 damage::function_b042fa22e449387d@13a damage::function_b042fa22e449387d@15a
STRING "<dev string:x7ea>" 0x22124 0x22309 0x22329
# damage::function_ce51453a1aabf1be@f2 damage::function_b042fa22e449387d@18a
STRING "<dev string:x7f8>" 0x22141 0x22359
# damage::function_ce51453a1aabf1be@10f damage::function_b042fa22e449387d@1b4
STRING "<dev string:x804>" 0x2215e 0x22383
# damage::function_ce51453a1aabf1be@12c damage::function_b042fa22e449387d@1de
STRING "<dev string:x80b>" 0x2217b 0x223ad
# damage::function_ce51453a1aabf1be@149 damage::function_b042fa22e449387d@208
STRING "<dev string:x818>" 0x22198 0x223d7
# damage::function_ce51453a1aabf1be@166 damage::function_b042fa22e449387d@232
STRING "<dev string:x82a>" 0x221b5 0x22401
# damage::function_b042fa22e449387d@13
STRING "<dev string:x836>" 0x221e2
# damage::preplayerdamaged@3f6
STRING "<dev string:x87>" 0x5b2f
# damage::function_b042fa22e449387d@3d
STRING "<dev string:x885>" 0x2220c
# damage::function_b042fa22e449387d@67
STRING "<dev string:x8d2>" 0x22236
# damage::function_b042fa22e449387d@91
STRING "<dev string:x91f>" 0x22260
# damage::function_b042fa22e449387d@bb
STRING "<dev string:x96f>" 0x2228a
# damage::function_b042fa22e449387d@e5
STRING "<dev string:x9c2>" 0x222b4
# damage::function_b042fa22e449387d@135
STRING "<dev string:xa12>" 0x22304
# damage::function_b042fa22e449387d@185
STRING "<dev string:xa66>" 0x22354
# damage::function_b042fa22e449387d@1af
STRING "<dev string:xab8>" 0x2237e
# damage::function_b042fa22e449387d@1d9
STRING "<dev string:xb05>" 0x223a8
# damage::function_b042fa22e449387d@203
STRING "<dev string:xb58>" 0x223d2
# damage::function_b042fa22e449387d@22d
STRING "<dev string:xbb0>" 0x223fc
# damage::function_13044ae0f56c133b@d7
STRING "<dev string:xc02>" 0x22501
# damage::function_13044ae0f56c133b@df
STRING "<dev string:xc11>" 0x22509
# damage::function_13044ae0f56c133b@e8
STRING "<dev string:xc20>" 0x22512
# damage::postplayerdamaged@606 damage::postplayerdamaged@b10 damage::postplayerdamaged@c02 damage::postplayerdamaged@dd9 damage::postplayerdamaged@eb9 damage::handlefriendlyfiredamage@380 damage::handlefriendlyfiredamage@7d0 damage::modifydamagegeneral@618 damage::modifydamagegeneral@734 damage::handleriotshieldhits@400 damage::handleriotshieldhits@628 damage::handledamagefeedback@fd0 damage::playerkilled_sharedlogic_early@47c damage::playerkilled_sharedlogic_early@d93 damage::handleteamchangedeath@df damage::handlesuicidedeath@bf damage::handlenormaldeath@5bd damage::handlenormaldeath@6d3 damage::handlenormaldeath@86a damage::handlenormaldeath@94d damage::handlenormaldeath@a30 damage::handlenormaldeath@b13 damage::handlenormaldeath@bf6 damage::handlenormaldeath@cd9 damage::handlenormaldeath@dbc damage::handlenormaldeath@f29 damage::handlenormaldeath@100c damage::handlenormaldeath@10ef damage::handlenormaldeath@11d2 damage::handlenormaldeath@12b5 damage::handlenormaldeath@1398 damage::handlenormaldeath@147b damage::handlenormaldeath@155e damage::handlenormaldeath@24fc damage::function_994ae661e8aa177@362 damage::function_994ae661e8aa177@55d damage::function_994ae661e8aa177@782 damage::function_5a59278130dcc12e@a8 damage::function_e75f1e487cc993ea@14a damage::function_e75f1e487cc993ea@22a damage::playerincrementscoreboardkills@b9 damage::function_230e2a69150a8eb4@f2 damage::function_230e2a69150a8eb4@1ff damage::function_230e2a69150a8eb4@379 damage::finishplayerdamagewrapper@324 damage::registerkill@bf
STRING "<dev string:xe1>" 0x614a 0x6654 0x6746 0x691d 0x69fd 0x9c22 0xa072 0xbd4e 0xbe6a 0xc4ac 0xc6d4 0xe44b 0x103bd 0x10cd4 0x14ab9 0x14e5a 0x16795 0x168ab 0x16a42 0x16b25 0x16c08 0x16ceb 0x16dce 0x16eb1 0x16f94 0x17101 0x171e4 0x172c7 0x173aa 0x1748d 0x17570 0x17653 0x17736 0x186d4 0x18fd4 0x191cf 0x193f4 0x195af 0x1a61e 0x1a6fe 0x1a831 0x1c7f3 0x1c900 0x1ca7a 0x1d0bf 0x1eb64
######################################################
####################  DEV BLOCKS  ####################
######################################################
# damage::callback_playerdamage_internal@3f4
DEVBLOCK 0x3b2b
# damage::callback_playerdamage_internal@fee
DEVBLOCK 0x4725
# damage::preplayerdamaged@3f1
DEVBLOCK 0x5b2a
# damage::postplayerdamaged@16f
DEVBLOCK 0x5cb3
# damage::postplayerdamaged@601
DEVBLOCK 0x6145
# damage::postplayerdamaged@670
DEVBLOCK 0x61b4
# damage::postplayerdamaged@b0b
DEVBLOCK 0x664f
# damage::postplayerdamaged@bfd
DEVBLOCK 0x6741
# damage::postplayerdamaged@dd4
DEVBLOCK 0x6918
# damage::postplayerdamaged@eb4
DEVBLOCK 0x69f8
# damage::postplayerdamaged@fdb
DEVBLOCK 0x6b1f
# damage::postplayerdamaged@fe5
DEVBLOCK 0x6b29
# damage::cac_modified_damage@17b
DEVBLOCK 0x7620
# damage::cac_modified_damage@193
DEVBLOCK 0x7638
# damage::cac_modified_damage@42c
DEVBLOCK 0x78d1
# damage::modify_juggernaut_damage@502
DEVBLOCK 0x84c4
# damage::adjustbulletstokill@80
DEVBLOCK 0x938d
# damage::handlefriendlyfiredamage@37b
DEVBLOCK 0x9c1d
# damage::handlefriendlyfiredamage@7cb
DEVBLOCK 0xa06d
# damage::modifyfalldamage@67
DEVBLOCK 0xa605
# damage::modifyexplosivedamage@a3
DEVBLOCK 0xae13
# damage::modifyexplosivedamage@25a
DEVBLOCK 0xafca
# damage::modifyexplosivedamage@3c5
DEVBLOCK 0xb135
# damage::modifydamagegeneral@613
DEVBLOCK 0xbd49
# damage::modifydamagegeneral@72f
DEVBLOCK 0xbe65
# damage::handleriotshieldhits@3fb
DEVBLOCK 0xc4a7
# damage::handleriotshieldhits@623
DEVBLOCK 0xc6cf
# damage::filterdamage@357
DEVBLOCK 0xcb50
# damage::handledamagefeedback@fcb
DEVBLOCK 0xe446
# damage::playerkilled_parameterfixup@b
DEVBLOCK 0xed85
# damage::playerkilled_parameterfixup@2f2
DEVBLOCK 0xf06c
# damage::playerkilled_precalc@2b0
DEVBLOCK 0xfe9b
# damage::playerkilled_sharedlogic_early@3b5
DEVBLOCK 0x102f6
# damage::playerkilled_sharedlogic_early@477
DEVBLOCK 0x103b8
# damage::playerkilled_sharedlogic_early@d8e
DEVBLOCK 0x10ccf
# damage::playerkilled_sharedlogic_early@14f4
DEVBLOCK 0x11435
# damage::playerkilled_handledeathtype@19d
DEVBLOCK 0x11b38
# damage::playerkilled_handledeathtype@229
DEVBLOCK 0x11bc4
# damage::playerkilled_sharedlogic_late@379
DEVBLOCK 0x11fb7
# damage::playerkilled_handlecorpse@239
DEVBLOCK 0x12708
# damage::function_204223caa7a0582f@b
DEVBLOCK 0x12b85
# damage::function_9283f67cf34d62ce@b
DEVBLOCK 0x12bc5
# damage::playerkilled_killcamsetup@42e
DEVBLOCK 0x1374d
# damage::playerkilled_killcamsetup@4fd
DEVBLOCK 0x1381c
# damage::playerkilled_killcamsetup@81d
DEVBLOCK 0x13b3c
# damage::playerkilled_deathscene@264
DEVBLOCK 0x13db5
# damage::playerkilled_killcam@748
DEVBLOCK 0x145aa
# damage::handleteamchangedeath@f
DEVBLOCK 0x149e9
# damage::handleteamchangedeath@da
DEVBLOCK 0x14ab4
# damage::handleworlddeath@bd
DEVBLOCK 0x14c90
# damage::handlesuicidedeath@ba
DEVBLOCK 0x14e55
# damage::handleinlaststanddeath@8d
DEVBLOCK 0x15314
# damage::handlenormaldeath@5b8
DEVBLOCK 0x16790
# damage::handlenormaldeath@6ce
DEVBLOCK 0x168a6
# damage::handlenormaldeath@865
DEVBLOCK 0x16a3d
# damage::handlenormaldeath@948
DEVBLOCK 0x16b20
# damage::handlenormaldeath@a2b
DEVBLOCK 0x16c03
# damage::handlenormaldeath@b0e
DEVBLOCK 0x16ce6
# damage::handlenormaldeath@bf1
DEVBLOCK 0x16dc9
# damage::handlenormaldeath@cd4
DEVBLOCK 0x16eac
# damage::handlenormaldeath@db7
DEVBLOCK 0x16f8f
# damage::handlenormaldeath@f24
DEVBLOCK 0x170fc
# damage::handlenormaldeath@1007
DEVBLOCK 0x171df
# damage::handlenormaldeath@10ea
DEVBLOCK 0x172c2
# damage::handlenormaldeath@11cd
DEVBLOCK 0x173a5
# damage::handlenormaldeath@12b0
DEVBLOCK 0x17488
# damage::handlenormaldeath@1393
DEVBLOCK 0x1756b
# damage::handlenormaldeath@1476
DEVBLOCK 0x1764e
# damage::handlenormaldeath@1559
DEVBLOCK 0x17731
# damage::handlenormaldeath@1f86
DEVBLOCK 0x1815e
# damage::handlenormaldeath@24f7
DEVBLOCK 0x186cf
# damage::handlenormaldeath@26ed
DEVBLOCK 0x188c5
# damage::handlenormaldeath@270e
DEVBLOCK 0x188e6
# damage::function_994ae661e8aa177@35d
DEVBLOCK 0x18fcf
# damage::function_994ae661e8aa177@558
DEVBLOCK 0x191ca
# damage::function_994ae661e8aa177@77d
DEVBLOCK 0x193ef
# damage::function_5a59278130dcc12e@a3
DEVBLOCK 0x195aa
# damage::function_e27976b1ab5b0348@275
DEVBLOCK 0x19888
# damage::function_e75f1e487cc993ea@145
DEVBLOCK 0x1a619
# damage::function_e75f1e487cc993ea@225
DEVBLOCK 0x1a6f9
# damage::playerincrementscoreboardkills@b4
DEVBLOCK 0x1a82c
# damage::function_f81a84e2092d538a@119
DEVBLOCK 0x1acc2
# damage::function_f81a84e2092d538a@1bf
DEVBLOCK 0x1ad68
# damage::function_f81a84e2092d538a@277
DEVBLOCK 0x1ae20
# damage::function_230e2a69150a8eb4@ed
DEVBLOCK 0x1c7ee
# damage::function_230e2a69150a8eb4@1fa
DEVBLOCK 0x1c8fb
# damage::function_230e2a69150a8eb4@374
DEVBLOCK 0x1ca75
# damage::finishplayerdamagewrapper@31f
DEVBLOCK 0x1d0ba
# damage::finishplayerdamagewrapper@4bf
DEVBLOCK 0x1d25a
# damage::finishplayerdamagewrapper@6c6
DEVBLOCK 0x1d461
# damage::finishplayerdamagewrapper@72e
DEVBLOCK 0x1d4c9
# damage::isforcedlaststand@6f
DEVBLOCK 0x1e449
# damage::registerkill@ba
DEVBLOCK 0x1eb5f
# damage::updatecombatrecordkillstats@95
DEVBLOCK 0x20537
# damage::shouldrecorddamagestats@b
DEVBLOCK 0x20bba
# damage::register_scripted_damage_override_func@b
DEVBLOCK 0x21f51
# damage::function_231589aee53ae064@b
DEVBLOCK 0x21fe6
# damage::function_231589aee53ae064@1b
DEVBLOCK 0x21ff6
# damage::function_ce51453a1aabf1be@b
DEVBLOCK 0x2205a
# damage::function_b042fa22e449387d@b
DEVBLOCK 0x221da
# damage::function_b042fa22e449387d@e
DEVBLOCK 0x221dd
# damage::function_b042fa22e449387d@38
DEVBLOCK 0x22207
# damage::function_b042fa22e449387d@62
DEVBLOCK 0x22231
# damage::function_b042fa22e449387d@8c
DEVBLOCK 0x2225b
# damage::function_b042fa22e449387d@b6
DEVBLOCK 0x22285
# damage::function_b042fa22e449387d@e0
DEVBLOCK 0x222af
# damage::function_b042fa22e449387d@130
DEVBLOCK 0x222ff
# damage::function_b042fa22e449387d@180
DEVBLOCK 0x2234f
# damage::function_b042fa22e449387d@1aa
DEVBLOCK 0x22379
# damage::function_b042fa22e449387d@1d4
DEVBLOCK 0x223a3
# damage::function_b042fa22e449387d@1fe
DEVBLOCK 0x223cd
# damage::function_b042fa22e449387d@228
DEVBLOCK 0x223f7
# damage::function_13044ae0f56c133b@30
DEVBLOCK 0x2245a
