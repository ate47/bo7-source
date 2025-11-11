NAME scripts\common\vehicle_occupancy.gsc
VERSION 0
CHECKSUM 0x13b9ebb3
######################################################
####################  DEV STRINGS  ###################
######################################################
# vehicle_occupancy::enable_engine@14
STRING "<dev string:x1010>" 0xd81b
# vehicle_occupancy::monitor_debug@200
STRING "<dev string:x1066>" 0xdc8f
# vehicle_occupancy::monitor_debug@283
STRING "<dev string:x106e>" 0xdd12
# vehicle_occupancy::function_5a2af62439f0d42c@37 vehicle_occupancy::function_daa8eeffc9a97683@37 vehicle_occupancy::function_fab637e91697ac1@63 vehicle_occupancy::function_94553a295e176da5@6a vehicle_occupancy::function_94553a295e176da5@7c vehicle_occupancy::function_94553a295e176da5@fb
STRING "<dev string:x1077>" 0xdf94 0xdfe4 0xe060 0xe125 0xe137 0xe1b6
# vehicle_occupancy::function_934da7e52c45e47c@351
STRING "<dev string:x1085>" 0xe535
# vehicle_occupancy::function_934da7e52c45e47c@365 vehicle_occupancy::function_e52de0cdff6aa50a@94 vehicle_occupancy::function_614f3895e4c2ecf8@4b
STRING "<dev string:x10a2>" 0xe549 0xe5fd 0xe780
# vehicle_occupancy::function_e52de0cdff6aa50a@c9
STRING "<dev string:x10c1>" 0xe632
# vehicle_occupancy::function_a3fa19aa45807445@90 vehicle_occupancy::function_a3fa19aa45807445@b1 vehicle_occupancy::function_dd1b574a9998bd15@d2
STRING "<dev string:x10db>" 0xe6f7 0xe718 0xe89d
# vehicle_occupancy::function_614f3895e4c2ecf8@75
STRING "<dev string:x10f8>" 0xe7aa
# vehicle_occupancy::function_e234097059878761@211 vehicle_occupancy::function_bba0fb218dac8c73@b00
STRING "<dev string:x161>" 0x185f 0x8abe
# vehicle_occupancy::function_e234097059878761@223 vehicle_occupancy::function_e234097059878761@244 vehicle_occupancy::function_bba0fb218dac8c73@b12 vehicle_occupancy::function_bba0fb218dac8c73@b33 vehicle_occupancy::character_cast@1d6 vehicle_occupancy::character_cast@1f8
STRING "<dev string:x173>" 0x1871 0x1892 0x8ad0 0x8af1 0x97f4 0x9816
# vehicle_occupancy::function_604f6aa3a5ef5250@2d vehicle_occupancy::function_6e6afd819ebbe705@31 vehicle_occupancy::function_8ed9bcd8e9ea74f5@24 vehicle_occupancy::function_b6077e40739ebc4b@24 vehicle_occupancy::get_reserving@24 vehicle_occupancy::function_338f50d73ebf6fe4@43
STRING "<dev string:x17f>" 0x18f9 0x1971 0x19bb 0x1a29 0x1a9e 0x1b23
# vehicle_occupancy::enter@9e
STRING "<dev string:x1ee>" 0x1da0
# vehicle_occupancy::enter@b4 vehicle_occupancy::exit@6d
STRING "<dev string:x240>" 0x1db6 0x245a
# vehicle_occupancy::function_8a8e1601e7e6610@2c
STRING "<dev string:x24>" 0x12ee
# vehicle_occupancy::enter@c5
STRING "<dev string:x261>" 0x1dc7
# vehicle_occupancy::enter@e2
STRING "<dev string:x2a0>" 0x1de4
# vehicle_occupancy::enter@10a
STRING "<dev string:x303>" 0x1e0c
# vehicle_occupancy::exit@57
STRING "<dev string:x351>" 0x2444
# vehicle_occupancy::exit@7e
STRING "<dev string:x3a2>" 0x246b
# vehicle_occupancy::exit@9b
STRING "<dev string:x3e0>" 0x2488
# vehicle_occupancy::exit@c9
STRING "<dev string:x442>" 0x24b6
# vehicle_occupancy::exit@179
STRING "<dev string:x48f>" 0x2566
# vehicle_occupancy::function_863cca296c26ac67@3b
STRING "<dev string:x4c6>" 0x2eb1
# vehicle_occupancy::function_863cca296c26ac67@56
STRING "<dev string:x50e>" 0x2ecc
# vehicle_occupancy::function_863cca296c26ac67@74
STRING "<dev string:x556>" 0x2eea
# vehicle_occupancy::function_863cca296c26ac67@8f
STRING "<dev string:x59e>" 0x2f05
# vehicle_occupancy::function_eeedcbb30e985d5c@19
STRING "<dev string:x5e6>" 0x2f7b
# vehicle_occupancy::init@10
STRING "<dev string:x643>" 0x33e3
# vehicle_occupancy::init@27
STRING "<dev string:x67d>" 0x33fa
# vehicle_occupancy::enter_start@12b
STRING "<dev string:x6b5>" 0x36c5
# vehicle_occupancy::exit_start@fc
STRING "<dev string:x706>" 0x37d9
# vehicle_occupancy::function_8a8e1601e7e6610@52
STRING "<dev string:x74>" 0x1314
# vehicle_occupancy::enter_end@43b
STRING "<dev string:x756>" 0x3f37
# vehicle_occupancy::exit_end@28c
STRING "<dev string:x791>" 0x41db
# vehicle_occupancy::reenter@c7
STRING "<dev string:x7cb>" 0x42ba
# vehicle_occupancy::get_level_data@6
STRING "<dev string:x805>" 0x42d8
# vehicle_occupancy::get_level_data@1d
STRING "<dev string:x85a>" 0x42ef
# vehicle_occupancy::error_message@7e
STRING "<dev string:x8b9>" 0x65c9
# vehicle_occupancy::function_92ebe8fd4c9a3c7e@5f vehicle_occupancy::allow_movement@8f
STRING "<dev string:x8fc>" 0x73db 0x76d1
# vehicle_occupancy::function_bba0fb218dac8c73@18a
STRING "<dev string:x964>" 0x8148
# vehicle_occupancy::function_bba0fb218dac8c73@193
STRING "<dev string:x97e>" 0x8151
# vehicle_occupancy::function_bba0fb218dac8c73@19d
STRING "<dev string:x998>" 0x815b
# vehicle_occupancy::function_bba0fb218dac8c73@1c7
STRING "<dev string:x9b2>" 0x8185
# vehicle_occupancy::function_bba0fb218dac8c73@1d0
STRING "<dev string:x9c9>" 0x818e
# vehicle_occupancy::function_bba0fb218dac8c73@231
STRING "<dev string:x9db>" 0x81ef
# vehicle_occupancy::function_bba0fb218dac8c73@239 vehicle_occupancy::function_bba0fb218dac8c73@26f
STRING "<dev string:x9f1>" 0x81f7 0x822d
# vehicle_occupancy::function_bba0fb218dac8c73@267
STRING "<dev string:xa15>" 0x8225
# vehicle_occupancy::function_a0688628a927f50d@1bb
STRING "<dev string:xa2e>" 0x8f9d
# vehicle_occupancy::function_d115ed3f24729c7@d9
STRING "<dev string:xa5d>" 0x925a
# vehicle_occupancy::function_d115ed3f24729c7@1b0
STRING "<dev string:xa88>" 0x9331
# vehicle_occupancy::function_d115ed3f24729c7@1e2
STRING "<dev string:xab8>" 0x9363
# vehicle_occupancy::function_d115ed3f24729c7@1f2
STRING "<dev string:xae3>" 0x9373
# vehicle_occupancy::function_d115ed3f24729c7@2c8
STRING "<dev string:xb06>" 0x9449
# vehicle_occupancy::function_d115ed3f24729c7@309
STRING "<dev string:xb37>" 0x948a
# vehicle_occupancy::function_d115ed3f24729c7@34d
STRING "<dev string:xb64>" 0x94ce
# vehicle_occupancy::function_5bd5cec128647eac@13c vehicle_occupancy::function_5bd5cec128647eac@28f vehicle_occupancy::function_5bd5cec128647eac@2cb vehicle_occupancy::function_5bd5cec128647eac@38e vehicle_occupancy::function_5bd5cec128647eac@3cd
STRING "<dev string:xbaa>" 0x99d0 0x9b23 0x9b5f 0x9c22 0x9c61
# vehicle_occupancy::function_5bd5cec128647eac@137
STRING "<dev string:xbb3>" 0x99cb
# vehicle_occupancy::function_5bd5cec128647eac@15b vehicle_occupancy::function_5bd5cec128647eac@30a vehicle_occupancy::function_5bd5cec128647eac@349 vehicle_occupancy::function_5bd5cec128647eac@40f vehicle_occupancy::function_5bd5cec128647eac@451
STRING "<dev string:xc0a>" 0x99ef 0x9b9e 0x9bdd 0x9ca3 0x9ce5
# vehicle_occupancy::function_5bd5cec128647eac@156
STRING "<dev string:xc12>" 0x99ea
# vehicle_occupancy::function_5bd5cec128647eac@17a vehicle_occupancy::function_5bd5cec128647eac@27b vehicle_occupancy::function_5bd5cec128647eac@2f6 vehicle_occupancy::function_5bd5cec128647eac@37a vehicle_occupancy::function_5bd5cec128647eac@3fb
STRING "<dev string:xc68>" 0x9a0e 0x9b0f 0x9b8a 0x9c0e 0x9c8f
# vehicle_occupancy::function_5bd5cec128647eac@175
STRING "<dev string:xc70>" 0x9a09
# vehicle_occupancy::function_5bd5cec128647eac@199 vehicle_occupancy::function_5bd5cec128647eac@2ba vehicle_occupancy::function_5bd5cec128647eac@338 vehicle_occupancy::function_5bd5cec128647eac@3bc vehicle_occupancy::function_5bd5cec128647eac@440
STRING "<dev string:xcc6>" 0x9a2d 0x9b4e 0x9bcc 0x9c50 0x9cd4
# vehicle_occupancy::function_5bd5cec128647eac@194
STRING "<dev string:xccf>" 0x9a28
# vehicle_occupancy::function_495d488c998ad412@c1
STRING "<dev string:xcf>" 0x14ce
# vehicle_occupancy::function_5bd5cec128647eac@1b8 vehicle_occupancy::function_5bd5cec128647eac@26a vehicle_occupancy::function_5bd5cec128647eac@2a9 vehicle_occupancy::function_5bd5cec128647eac@2e5 vehicle_occupancy::function_5bd5cec128647eac@327
STRING "<dev string:xd26>" 0x9a4c 0x9afe 0x9b3d 0x9b79 0x9bbb
# vehicle_occupancy::function_5bd5cec128647eac@1b3
STRING "<dev string:xd2d>" 0x9a47
# vehicle_occupancy::function_5bd5cec128647eac@1d7 vehicle_occupancy::function_5bd5cec128647eac@366 vehicle_occupancy::function_5bd5cec128647eac@3a8 vehicle_occupancy::function_5bd5cec128647eac@3e7 vehicle_occupancy::function_5bd5cec128647eac@42c
STRING "<dev string:xd82>" 0x9a6b 0x9bfa 0x9c3c 0x9c7b 0x9cc0
# vehicle_occupancy::function_5bd5cec128647eac@1d2
STRING "<dev string:xd8c>" 0x9a66
# vehicle_occupancy::function_5bd5cec128647eac@583 vehicle_occupancy::function_5bd5cec128647eac@68c vehicle_occupancy::function_67fabdb37c99a2d4@a5 vehicle_occupancy::function_67fabdb37c99a2d4@146
STRING "<dev string:xde4>" 0x9e17 0x9f20 0xde8b 0xdf2c
# vehicle_occupancy::function_5bd5cec128647eac@5a3 vehicle_occupancy::function_5bd5cec128647eac@6b5 vehicle_occupancy::function_67fabdb37c99a2d4@94 vehicle_occupancy::function_67fabdb37c99a2d4@135
STRING "<dev string:xdf4>" 0x9e37 0x9f49 0xde7a 0xdf1b
# vehicle_occupancy::function_5bd5cec128647eac@5c3 vehicle_occupancy::function_5bd5cec128647eac@6de vehicle_occupancy::function_67fabdb37c99a2d4@83 vehicle_occupancy::function_67fabdb37c99a2d4@124
STRING "<dev string:xe05>" 0x9e57 0x9f72 0xde69 0xdf0a
# vehicle_occupancy::function_5bd5cec128647eac@5e3 vehicle_occupancy::function_5bd5cec128647eac@707 vehicle_occupancy::function_67fabdb37c99a2d4@72 vehicle_occupancy::function_67fabdb37c99a2d4@113
STRING "<dev string:xe14>" 0x9e77 0x9f9b 0xde58 0xdef9
# vehicle_occupancy::function_5bd5cec128647eac@603 vehicle_occupancy::function_5bd5cec128647eac@730 vehicle_occupancy::function_67fabdb37c99a2d4@61 vehicle_occupancy::function_67fabdb37c99a2d4@102
STRING "<dev string:xe24>" 0x9e97 0x9fc4 0xde47 0xdee8
# vehicle_occupancy::function_5bd5cec128647eac@623 vehicle_occupancy::function_5bd5cec128647eac@759 vehicle_occupancy::function_67fabdb37c99a2d4@50 vehicle_occupancy::function_67fabdb37c99a2d4@f1
STRING "<dev string:xe37>" 0x9eb7 0x9fed 0xde36 0xded7
# vehicle_occupancy::function_5bd5cec128647eac@643 vehicle_occupancy::function_5bd5cec128647eac@782 vehicle_occupancy::function_67fabdb37c99a2d4@3f vehicle_occupancy::function_67fabdb37c99a2d4@e0
STRING "<dev string:xe4b>" 0x9ed7 0xa016 0xde25 0xdec6
# vehicle_occupancy::function_5bd5cec128647eac@663 vehicle_occupancy::function_5bd5cec128647eac@7ab vehicle_occupancy::function_67fabdb37c99a2d4@2e vehicle_occupancy::function_67fabdb37c99a2d4@cf
STRING "<dev string:xe5d>" 0x9ef7 0xa03f 0xde14 0xdeb5
# vehicle_occupancy::function_f9ba3136976d8b0f@19 vehicle_occupancy::function_f9ba3136976d8b0f@20
STRING "<dev string:xe70>" 0xaeff 0xaf06
# vehicle_occupancy::function_f9ba3136976d8b0f@2e
STRING "<dev string:xe8b>" 0xaf14
# vehicle_occupancy::function_e58c1c5409a9713c@71
STRING "<dev string:xe8f>" 0xafbb
# vehicle_occupancy::allow_sentient@15
STRING "<dev string:xece>" 0xc744
# vehicle_occupancy::function_7730eb57fd31aeea@2b
STRING "<dev string:xf36>" 0xc978
# vehicle_occupancy::function_42362fb16a07025e@34
STRING "<dev string:xf6>" 0x15c2
# vehicle_occupancy::function_6d9760c4971403c2@49
STRING "<dev string:xf84>" 0xcc50
# vehicle_occupancy::function_7b5a0eb785dba6d2@33
STRING "<dev string:xfee>" 0xcd23
