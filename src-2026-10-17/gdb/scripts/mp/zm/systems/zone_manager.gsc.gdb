NAME scripts\mp\zm\systems\zone_manager.gsc
VERSION 0
CHECKSUM 0x8000f05b
######################################################
####################  DEV STRINGS  ###################
######################################################
# zone_manager::make_zone_adjacent@8d
STRING "<dev string:x104>" 0x770
# zone_manager::set_zone_enabled@76
STRING "<dev string:x121>" 0x869
# zone_manager::is_zone_enabled@3d
STRING "<dev string:x152>" 0x9f9
# zone_manager::set_zone_active@4e
STRING "<dev string:x187>" 0xb42
# zone_manager::manage_zones@5a
STRING "<dev string:x1b8>" 0x1f6a
# zone_manager::function_f029e29824b3298e@f2
STRING "<dev string:x222>" 0x2109
# zone_manager::zone_init@50
STRING "<dev string:x24>" 0x42f
# zone_manager::function_55449e31c0dd4d10@c9
STRING "<dev string:x296>" 0x2dd1
# zone_manager::get_volumes@e1 zone_manager::get_nodes@fd
STRING "<dev string:x2bd>" 0x3067 0x3190
# zone_manager::get_volumes@ea
STRING "<dev string:x2c4>" 0x3070
# zone_manager::get_nodes@106
STRING "<dev string:x2d7>" 0x3199
# zone_manager::init_zones@144
STRING "<dev string:x2e8>" 0x364c
# zone_manager::init_zones@4e1
STRING "<dev string:x327>" 0x39e9
# zone_manager::init_zones@4f2
STRING "<dev string:x334>" 0x39fa
# zone_manager::function_75849c81b2418f9b@ad zone_manager::function_75849c81b2418f9b@e5
STRING "<dev string:x349>" 0x3b49 0x3b81
# zone_manager::function_75849c81b2418f9b@be
STRING "<dev string:x34f>" 0x3b5a
# zone_manager::function_75849c81b2418f9b@f6
STRING "<dev string:x35e>" 0x3b92
# zone_manager::setup_zone_manager_devgui@50
STRING "<dev string:x371>" 0x4095
# zone_manager::setup_zone_manager_devgui@67
STRING "<dev string:x37a>" 0x40ac
# zone_manager::setup_zone_manager_devgui@62
STRING "<dev string:x38b>" 0x40a7
# zone_manager::setup_zone_manager_devgui@80
STRING "<dev string:x3a4>" 0x40c5
# zone_manager::setup_zone_manager_devgui@7b
STRING "<dev string:x3d3>" 0x40c0
# zone_manager::setup_zone_manager_devgui@99
STRING "<dev string:x3f0>" 0x40de
# zone_manager::setup_zone_manager_devgui@94
STRING "<dev string:x41f>" 0x40d9
# zone_manager::setup_zone_manager_devgui@b0
STRING "<dev string:x43c>" 0x40f5
# zone_manager::setup_zone_manager_devgui@ab
STRING "<dev string:x44e>" 0x40f0
# zone_manager::setup_zone_manager_devgui@c6
STRING "<dev string:x46f>" 0x410b
# zone_manager::setup_zone_manager_devgui@c1
STRING "<dev string:x488>" 0x4106
# zone_manager::setup_zone_manager_devgui@de
STRING "<dev string:x4ae>" 0x4123
# zone_manager::setup_zone_manager_devgui@d9
STRING "<dev string:x4c4>" 0x411e
# zone_manager::setup_zone_manager_devgui@f4
STRING "<dev string:x4e7>" 0x4139
# zone_manager::setup_zone_manager_devgui@ef
STRING "<dev string:x501>" 0x4134
# zone_manager::setup_zone_manager_devgui@10c
STRING "<dev string:x517>" 0x4151
# zone_manager::setup_zone_manager_devgui@107
STRING "<dev string:x54b>" 0x414c
# zone_manager::setup_zone_manager_devgui@1a5
STRING "<dev string:x56e>" 0x41ea
# zone_manager::setup_zone_manager_devgui@1ad
STRING "<dev string:x598>" 0x41f2
# zone_manager::setup_zone_manager_devgui@194
STRING "<dev string:x59a>" 0x41d9
# zone_manager::setup_zone_manager_devgui@19c
STRING "<dev string:x5bb>" 0x41e1
# zone_manager::setup_zone_manager_devgui@1df
STRING "<dev string:x5bd>" 0x4224
# zone_manager::setup_zone_manager_devgui@1da
STRING "<dev string:x5ee>" 0x421f
# zone_manager::function_9df1eba8cf1fe789@38
STRING "<dev string:x61e>" 0x4276
# zone_manager::function_9df1eba8cf1fe789@44
STRING "<dev string:x63a>" 0x4282
# zone_manager::function_9df1eba8cf1fe789@58 zone_manager::function_9df1eba8cf1fe789@6c zone_manager::function_9df1eba8cf1fe789@80 zone_manager::function_a3ec39664f473fc7@6e
STRING "<dev string:x68f>" 0x4296 0x42aa 0x42be 0x59f8
# zone_manager::debug_print@28
STRING "<dev string:x690>" 0x436f
# zone_manager::function_d23f3189569f0676@25 zone_manager::function_d23f3189569f0676@33 zone_manager::function_d23f3189569f0676@4c
STRING "<dev string:x69f>" 0x43bd 0x43cb 0x43e4
# zone_manager::function_8cef9a807b55b436@48 zone_manager::function_8cef9a807b55b436@56 zone_manager::function_8cef9a807b55b436@8d
STRING "<dev string:x6b3>" 0x445c 0x446a 0x44a1
# zone_manager::function_238f98a075dcb245@d0
STRING "<dev string:x6c8>" 0x4965
# zone_manager::function_238f98a075dcb245@e0 zone_manager::function_238f98a075dcb245@10a zone_manager::function_238f98a075dcb245@134 zone_manager::function_238f98a075dcb245@15e
STRING "<dev string:x6ca>" 0x4975 0x499f 0x49c9 0x49f3
# zone_manager::function_238f98a075dcb245@ff
STRING "<dev string:x6ce>" 0x4994
# zone_manager::function_238f98a075dcb245@122
STRING "<dev string:x6db>" 0x49b7
# zone_manager::function_238f98a075dcb245@12a
STRING "<dev string:x6e3>" 0x49bf
# zone_manager::function_238f98a075dcb245@14c
STRING "<dev string:x6eb>" 0x49e1
# zone_manager::function_238f98a075dcb245@154
STRING "<dev string:x6f2>" 0x49e9
# zone_manager::function_238f98a075dcb245@1fa zone_manager::function_238f98a075dcb245@20a
STRING "<dev string:x6f9>" 0x4a8f 0x4a9f
# zone_manager::function_963ab40c015db702@48 zone_manager::function_963ab40c015db702@70
STRING "<dev string:x6fb>" 0x4d48 0x4d70
# zone_manager::function_963ab40c015db702@59 zone_manager::function_963ab40c015db702@81
STRING "<dev string:x6ff>" 0x4d59 0x4d81
# zone_manager::function_3857178b032fdea2@286
STRING "<dev string:x703>" 0x5245
# zone_manager::function_3857178b032fdea2@28e
STRING "<dev string:x70a>" 0x524d
# zone_manager::function_e8a0dbf6e63ad93d@16c
STRING "<dev string:x715>" 0x5668
# zone_manager::function_e8a0dbf6e63ad93d@176
STRING "<dev string:x721>" 0x5672
# zone_manager::function_e8a0dbf6e63ad93d@180
STRING "<dev string:x730>" 0x567c
# zone_manager::function_e8a0dbf6e63ad93d@18a
STRING "<dev string:x73d>" 0x5686
# zone_manager::function_e8a0dbf6e63ad93d@194
STRING "<dev string:x74d>" 0x5690
# zone_manager::function_a3ec39664f473fc7@7a
STRING "<dev string:x75b>" 0x5a04
# zone_manager::zone_init@b2
STRING "<dev string:x76>" 0x491
# zone_manager::function_a3ec39664f473fc7@9b
STRING "<dev string:x772>" 0x5a25
# zone_manager::function_a3ec39664f473fc7@a3
STRING "<dev string:x794>" 0x5a2d
# zone_manager::zone_init@d0
STRING "<dev string:xcd>" 0x4af
# zone_manager::make_zone_adjacent@7c
STRING "<dev string:xda>" 0x75f
# zone_manager::make_zone_adjacent@84
STRING "<dev string:xfc>" 0x767
######################################################
####################  DEV BLOCKS  ####################
######################################################
# zone_manager::init_zone_manager@1
DEVBLOCK 0x229
# zone_manager::init_zone_manager@181
DEVBLOCK 0x3a9
# zone_manager::zone_init@4b
DEVBLOCK 0x42a
# zone_manager::zone_init@59
DEVBLOCK 0x438
# zone_manager::zone_init@ad
DEVBLOCK 0x48c
# zone_manager::zone_init@cb
DEVBLOCK 0x4aa
# zone_manager::zone_setup_finished@1
DEVBLOCK 0x5f5
# zone_manager::add_adjacent_zone@2f
DEVBLOCK 0x680
# zone_manager::add_adjacent_zone@41
DEVBLOCK 0x692
# zone_manager::add_adjacent_zone@4c
DEVBLOCK 0x69d
# zone_manager::make_zone_adjacent@40
DEVBLOCK 0x723
# zone_manager::make_zone_adjacent@77
DEVBLOCK 0x75a
# zone_manager::set_zone_enabled@4e
DEVBLOCK 0x841
# zone_manager::set_zone_enabled@71
DEVBLOCK 0x864
# zone_manager::is_zone_enabled@15
DEVBLOCK 0x9d1
# zone_manager::is_zone_enabled@38
DEVBLOCK 0x9f4
# zone_manager::function_f9e008bb6267b256@3d
DEVBLOCK 0xa59
# zone_manager::set_zone_active@26
DEVBLOCK 0xb1a
# zone_manager::set_zone_active@49
DEVBLOCK 0xb3d
# zone_manager::get_zone_struct@b
DEVBLOCK 0xc3d
# zone_manager::function_2bcd755aabfd3cad@b
DEVBLOCK 0xc82
# zone_manager::get_inited_zones@1
DEVBLOCK 0xcb4
# zone_manager::get_all_zones@1
DEVBLOCK 0xce4
# zone_manager::get_active_zones@33
DEVBLOCK 0xd52
# zone_manager::get_enabled_zones@33
DEVBLOCK 0xe17
# zone_manager::get_current_zone@1e
DEVBLOCK 0xec7
# zone_manager::get_zone_occupants@15
DEVBLOCK 0x10e3
# zone_manager::function_d4fdae6556d1e5be@3d
DEVBLOCK 0x1155
# zone_manager::function_f6f925c185a652c@4d
DEVBLOCK 0x1237
# zone_manager::function_9dd25e9fb0ecd45b@5d
DEVBLOCK 0x134a
# zone_manager::is_water_zone@15
DEVBLOCK 0x1917
# zone_manager::is_touching_zone@56
DEVBLOCK 0x19b1
# zone_manager::function_984e2bf699c3c42a@26
DEVBLOCK 0x1aee
# zone_manager::location_in_zone@14
DEVBLOCK 0x1bab
# zone_manager::function_90e5c3e2272b0130@b
DEVBLOCK 0x1c4e
# zone_manager::manage_zones@43
DEVBLOCK 0x1f53
# zone_manager::manage_zones@55
DEVBLOCK 0x1f65
# zone_manager::function_f029e29824b3298e@db
DEVBLOCK 0x20f2
# zone_manager::function_f029e29824b3298e@ed
DEVBLOCK 0x2104
# zone_manager::function_f029e29824b3298e@2f1
DEVBLOCK 0x2308
# zone_manager::function_fc479cad41a1ae1d@1
DEVBLOCK 0x23bd
# zone_manager::function_5ca75cfd3878d096@53
DEVBLOCK 0x2b76
# zone_manager::function_5ca75cfd3878d096@61
DEVBLOCK 0x2b84
# zone_manager::function_55449e31c0dd4d10@b9
DEVBLOCK 0x2dc1
# zone_manager::function_55449e31c0dd4d10@c4
DEVBLOCK 0x2dcc
# zone_manager::get_volumes@dc
DEVBLOCK 0x3062
# zone_manager::get_nodes@f8
DEVBLOCK 0x318b
# zone_manager::init_zones@140
DEVBLOCK 0x3648
# zone_manager::init_zones@4dc
DEVBLOCK 0x39e4
# zone_manager::function_75849c81b2418f9b@a8
DEVBLOCK 0x3b44
# zone_manager::function_75849c81b2418f9b@e0
DEVBLOCK 0x3b7c
# zone_manager::setup_zone_manager_devgui@4b
DEVBLOCK 0x4090
# zone_manager::function_9df1eba8cf1fe789@b
DEVBLOCK 0x4249
# zone_manager::set_zone_debug@b
DEVBLOCK 0x42f4
# zone_manager::debug_print@b
DEVBLOCK 0x4352
# zone_manager::function_42e351f25a351212@1
DEVBLOCK 0x4384
# zone_manager::function_d23f3189569f0676@1
DEVBLOCK 0x4399
# zone_manager::function_cd83b3ac8991126@1
DEVBLOCK 0x4400
# zone_manager::function_8cef9a807b55b436@2b
DEVBLOCK 0x443f
# zone_manager::draw_zone@55
DEVBLOCK 0x45d4
# zone_manager::function_edffff097aa86c4f@43
DEVBLOCK 0x4799
# zone_manager::function_238f98a075dcb245@a6
DEVBLOCK 0x493b
# zone_manager::function_3f8393adab09cec0@b
DEVBLOCK 0x4b76
# zone_manager::function_84e80ee42a44e129@b
DEVBLOCK 0x4bdb
# zone_manager::function_bee823039db01f8@2b
DEVBLOCK 0x4c60
# zone_manager::function_963ab40c015db702@35
DEVBLOCK 0x4d35
# zone_manager::function_2e168859641622fd@3f
DEVBLOCK 0x4e0d
# zone_manager::function_980bb54c6cc055ae@55
DEVBLOCK 0x4f10
# zone_manager::function_3857178b032fdea2@eb
DEVBLOCK 0x50aa
# zone_manager::test_respawn_point@3d
DEVBLOCK 0x53da
# zone_manager::function_81cb4e008f57ba33@3d
DEVBLOCK 0x5486
# zone_manager::function_e8a0dbf6e63ad93d@163
DEVBLOCK 0x565f
# zone_manager::function_a3ec39664f473fc7@53
DEVBLOCK 0x59dd
# zone_manager::function_a3ec39664f473fc7@96
DEVBLOCK 0x5a20
