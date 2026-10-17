#using script_16ea1b94f0f381b3;
#using script_1a6a1f7bdb57d7ff;
#using script_3774b0533d79d9a0;
#using script_380194b81c38cd1a;
#using script_3d40ac27f779e9e9;
#using script_4eb10b8076cd40c;
#using script_6c2f6a14fa53759e;
#using script_7e916efe0ee8c563;
#using scripts\asm\shared\death;
#using scripts\common\ai;
#using scripts\common\callbacks;
#using scripts\common\math;
#using scripts\common\metabone;
#using scripts\common\status_effects\effect_stun;
#using scripts\common\utility;
#using scripts\common\values;

#namespace zombie_init;

// Namespace zombie_init
// Params 0, eflags: 0x5
// Checksum 0x6204cef5, Offset: 0x273
// Size: 0x61
function private autoexec main()
{
    callback::get_template( "zombie" ) callback::add( "shockStick_agentApplyHaywire", &function_229848bbd9b73c94 );
    callback::get_template( "zombie" ) callback::add( "shockStick_agentClearHaywire", &function_692c81ff2b8b1811 );
    callback::get_template( "zombie" ) callback::add( "on_ai_set_max_health", &function_450bc5504cd552d8 );
    
    /#
        level thread function_25330b6e68e3027b();
    #/
}

// Namespace zombie_init
// Params 1
// Checksum 0x94ab9dee, Offset: 0x2dc
// Size: 0x1553
function zombie_init_ai( settings_asset_name )
{
    assert( isdefined( settings_asset_name ) );
    self.on_zombie_agent_killed_common = &on_ai_killed;
    
    if ( !isdefined( level.zombieaisettings_cache[ settings_asset_name ] ) )
    {
        if ( !isdefined( level.zombieaisettings_cache ) )
        {
            level.zombieaisettings_cache = [];
        }
        
        level.zombieaisettings_cache[ settings_asset_name ] = getscriptbundle( hashcat( %"zombieaisettings:", settings_asset_name ) );
    }
    
    settings = level.zombieaisettings_cache[ settings_asset_name ];
    self.zombieaisettings = settings;
    self.var_ebd26f6520cc1e89 = 1;
    self.enablespreading = settings.enablespreading;
    self.var_5ef407fd795e3461 = settings.var_5ef407fd795e3461;
    
    if ( settings.var_f872bb453be232df > 0 )
    {
        self._blackboard.var_961905cc89d9fc45 = settings.var_f872bb453be232df;
    }
    
    if ( settings.enablebite )
    {
        zombie_bite::register_bite_settings( undefined, settings.biterange );
        self.enablebite = 1;
    }
    
    if ( settings.enablemelee )
    {
        zombie_melee::register_melee_settings( settings.meleedamage, settings.meleerange, settings.var_bf81fa5e188a756, settings.var_a54c2d5f629fb40d, settings.var_6903f85bf1b045a7, settings.var_dc4b2e8ca907e0f6, settings.var_b0695e823fc2e9ee, settings.meleeknockbackstrength, settings.var_f157a24bead18830, settings.var_53eae2c766d72ce6, settings.var_81106e222ed04018, settings.var_f1b175e01cb11e49 );
        self.enablemelee = 1;
        self._blackboard.var_c659e0f8ca1fa517 = settings.var_4a24094543ea17ab;
        self._blackboard.var_1bd0bf55c51aed3d = int( settings.var_dbbd1437b0f45bd3 );
        self._blackboard.var_4f59295d1d34e1a9 = cos( settings.var_60956e642f945e4f );
    }
    
    self.var_bd1805e45701eeb1 = settings.var_bd1805e45701eeb1;
    
    if ( settings.var_61f7cb9d1effbf0a )
    {
        self._blackboard.var_99f794dc99944d15 = settings.var_379353db86387521;
        
        if ( settings.projectilespeedoverride > 0 )
        {
            self.var_ec263f0a689ef1dd = settings.projectilespeedoverride;
        }
        
        self._blackboard.var_8f2dbb63d0d0a2bd = settings.var_8f2dbb63d0d0a2bd;
        self._blackboard.var_d075c035f7081d2a = settings.var_d075c035f7081d2a;
        self._blackboard.var_6ac7c01b47866bee = settings.var_76fb5cbc92f9174e;
        self._blackboard.var_10892a66df41040a = settings.var_10892a66df41040a;
        self.var_720018aa0a425283 = settings.var_720018aa0a425283;
        
        if ( self.var_720018aa0a425283 )
        {
            self.var_2179456a894d66e = settings.var_bc351ea127cd3d77;
            self._blackboard.var_1d29076b12111692 = utility::function_4b74c15943231980( settings.var_a2e15e2e1406cfa5 );
        }
    }
    
    if ( settings.var_3033988beec156b7 )
    {
        if ( settings.var_2ae6e34e12a35565 == "Speed" )
        {
            assert( settings.var_ed8e43492e9992f3 > 0 && settings.var_93c0b68a5d2543c5 > 0 );
            settings.var_701ef68070b4aaa3 = 0;
            settings.var_da4bba45ef78c861 = 0;
        }
        else if ( settings.var_2ae6e34e12a35565 == "Height" )
        {
            assert( settings.var_ed8e43492e9992f3 == 0 && settings.var_93c0b68a5d2543c5 == 0 );
            settings.var_ed8e43492e9992f3 = 0;
            settings.var_93c0b68a5d2543c5 = 0;
        }
        else if ( settings.var_2ae6e34e12a35565 == "SpeedAndHeightAlterGravity" )
        {
            assert( settings.var_ed8e43492e9992f3 > 0 && settings.var_93c0b68a5d2543c5 > 0 && settings.var_701ef68070b4aaa3 > 0 && settings.var_da4bba45ef78c861 > 0 );
        }
        
        self._blackboard.leapattackdamage = settings.leapattackdamage;
        self._blackboard.var_ed8e43492e9992f3 = settings.var_ed8e43492e9992f3;
        self._blackboard.var_93c0b68a5d2543c5 = settings.var_93c0b68a5d2543c5;
        self._blackboard.var_30b86dcbf5d66834 = settings.var_30b86dcbf5d66834;
        self._blackboard.var_61e56d196f8dacad = settings.var_61e56d196f8dacad;
        self._blackboard.var_576df40752e47aac = 0;
        self._blackboard.var_7a0ed1d8a025653 = settings.var_7a0ed1d8a025653;
        self._blackboard.var_6dc50e9edbfedf79 = settings.var_6dc50e9edbfedf79;
        self._blackboard.var_66b991a512bb4989 = istrue( settings.var_9c9a4d952ff1d5d );
        self._blackboard.var_bbbfce717705a641 = istrue( settings.var_e88d9c695374c59d );
        self._blackboard.var_996b99e8285e32c7 = settings.var_996b99e8285e32c7;
        self._blackboard.var_701ef68070b4aaa3 = settings.var_701ef68070b4aaa3;
        self._blackboard.var_da4bba45ef78c861 = settings.var_da4bba45ef78c861;
        self._blackboard.var_e9515c4b8c07cdff = settings.var_e9515c4b8c07cdff;
        self._blackboard.var_f1f95501251c9a40 = settings.var_7c108c43b7d49488;
        self._blackboard.var_a0f1869cc8d0818d = settings.var_a0f1869cc8d0818d;
        self._blackboard.var_c746052ca3aa80ac = settings.var_c746052ca3aa80ac;
        self._blackboard.var_92baae4fd4db6256 = settings.var_931f5c54b140e54;
        self._blackboard.var_4be3c060d9dece9f = settings.var_b4b6444d9d69e998;
        self._blackboard.var_7e1476697f92ad91 = settings.var_7490c53949f35478;
        self._blackboard.var_393779b27ca420c9 = settings.var_3f2696f937cbc88f;
        self._blackboard.var_f24cd9170c1b8375 = settings.var_9aa7f25d7bcd3eb7;
        self._blackboard.var_231d907d8e7edaeb = settings.var_231d907d8e7edaeb;
        self._blackboard.var_dbda6601c27c5e4c = settings.var_8e5979fe238d5f39;
        self._blackboard.var_a0ac2be830791eca = settings.var_6f3e47c0ea9c1fdc;
        self._blackboard.leapnoclip = settings.leapnoclip;
        self._blackboard.var_5c5411874fdf8196 = settings.var_5c5411874fdf8196;
        self._blackboard.var_e83c7b27629eb305 = settings.var_e83c7b27629eb305;
        self._blackboard.var_ccde537d03078e02 = ( 0, 0, 0 );
        self._blackboard.var_4753718265e552e0 = 0;
        self.var_3dbe6d460bc26c63 = settings.var_3dbe6d460bc26c63;
        self.var_247a4fb59046e586 = settings.var_247a4fb59046e586;
        self.var_1920d78ea78d0db2 = settings.var_1920d78ea78d0db2;
        self.var_7e762b2e75eb4a4c = settings.var_7e762b2e75eb4a4c;
    }
    
    self.turnanimsenabled = istrue( settings.turnanimsenabled );
    
    if ( self.turnanimsenabled )
    {
        self.var_6c4d911c54477656 = settings.var_6c4d911c54477656 ?? 0;
        self.var_c245801ce039379a = settings.var_c245801ce039379a ?? 0;
    }
    
    if ( settings.canreposition )
    {
        self._blackboard.var_6e066bf92b9fa20e = settings.var_e4395873f1e6efd0 ?? 0;
        self._blackboard.var_49193795b6f4d226 = settings.var_658a7e1b88b5a8b4 ?? 0;
        self._blackboard.var_25dcb9eba7bd1203 = settings.var_2c42789c899304d5 ?? 0;
        self._blackboard.var_fb4f4511d5135cfb = settings.var_28d7dbffc1f4fd31 ?? 0;
        self._blackboard.var_e4f5f3f1dc23cfa3 = settings.var_30144f2b83e5a58d ?? 0;
        self._blackboard.var_71dfab05ae64f00b = settings.var_690e53dd8a8706b5 ?? 0;
        self._blackboard.var_d646cd95106839a9 = settings.var_4e4cea34cfe5aee3 ?? 0;
        self._blackboard.var_acebbc45a8bc0a85 = settings.var_e9b0da344cb689db ?? 0;
        
        if ( settings.var_aec51177986aab37 )
        {
            self function_786bb6aa1b76c7ee( settings.var_aec51177986aab37, settings.repositioninterval ?? 0 );
        }
        
        if ( settings.var_c2b06165cfd41274 )
        {
            self function_786bb6aa1b76c7ee( settings.var_c2b06165cfd41274, settings.var_e652d3f4a62d8b5e ?? 0 );
        }
    }
    
    namespace_9d8e359c3b1041e5::function_6977eb27282ef178();
    self.fnisinstealthidle = &function_4145ba81712abf54;
    self.fnisinstealthinvestigate = &function_4145ba81712abf54;
    self.fnisinstealthhunt = &function_4145ba81712abf54;
    self.fnisinstealthcombat = &function_4145ba81712abf54;
    self.lookfordoorsalongpath = 1;
    self.pathenemyfightdist = 0;
    self.var_b35099cc0a791f1b = 0;
    
    if ( utility::issharedfuncdefined( #"game", #"roundnumberdifficulty" ) )
    {
        self._blackboard.difficultyround = namespace_9d8e359c3b1041e5::function_57de0ca2e80536a1( self.origin );
    }
    else
    {
        self._blackboard.difficultyround = 1;
    }
    
    self function_68622c52af1af216( 4000 );
    self.var_43c7f6cb12eee2ee = settings.var_43c7f6cb12eee2ee;
    self.basehealth = self.health;
    self.maxhealth = self.health;
    
    if ( isdefined( settings.healthscriptbundle ) )
    {
        newmaxhealth = namespace_9d8e359c3b1041e5::function_bb9b98eb7368a15a( settings.healthscriptbundle, zombie_utils::get_zombie_round_difficulty() );
        
        if ( newmaxhealth > 0 )
        {
            self.maxhealth = newmaxhealth;
            self.var_a03f571fe06a52b8 = namespace_9d8e359c3b1041e5::function_bb9b98eb7368a15a( settings.healthscriptbundle, zombie_utils::get_zombie_round_difficulty(), 1 ) / newmaxhealth;
        }
    }
    
    self.health = self.maxhealth;
    
    if ( isdefined( settings.damagescriptbundle ) && !level.var_9209eecc9aff21ad )
    {
        namespace_9d8e359c3b1041e5::function_b2ccfa9f49ce6938( zombie_utils::get_zombie_round_difficulty() );
    }
    
    if ( settings.var_e1709a8e0b14d29b )
    {
        if ( isdefined( settings.vehicleattackscalingscriptbundle ) && !level.var_9c7fce064a6bec19 )
        {
            namespace_9d8e359c3b1041e5::function_e4935f0a53f85b86( zombie_utils::get_zombie_round_difficulty() );
        }
        else
        {
            self._blackboard.var_53d396aac913b6e9 = getdvarfloat( @"vehicle_attack_leap_intro_playback_rate", settings.var_53d396aac913b6e9 );
            self._blackboard.var_996dd37c98c814bd = getdvarfloat( @"hash_ff8f074e50a3790e", settings.var_996dd37c98c814bd );
            self._blackboard.var_61735da3a2cbdc4b = getdvarfloat( @"hash_72e92df9cf5e7e10", settings.var_61735da3a2cbdc4b );
            self._blackboard.var_6a353391014208b2 = math::degrees_to_radians( getdvarfloat( @"hash_509d0272ce77ef8a", settings.var_e9191c57b47e894c ) );
            self._blackboard.var_a6c4c8d6043787b3 = math::degrees_to_radians( getdvarfloat( @"hash_744f864d7ef5f01", settings.var_21679fd5a203d387 ) );
        }
        
        self._blackboard.var_ddc98d1d3dc36e37 = settings.var_ddc98d1d3dc36e37;
        self._blackboard.var_de6a7ac0a4e8b51 = getdvarfloat( @"hash_f7600acc3528765c", settings.var_de6a7ac0a4e8b51 );
        self._blackboard.var_41c8f95489d624b = getdvarfloat( @"hash_566c34a8e0cd8a6a", settings.var_41c8f95489d624b );
        self._blackboard.var_5b5362fa2e2e1495 = getdvarfloat( @"vehicle_attack_min_dist", settings.var_5b5362fa2e2e1495 );
        self._blackboard.vehicleattacklatchsecondsbetweenattacks = getdvarfloat( @"hash_c1a949d2beb78c80", randomfloatrange( settings.var_2ec3290675aa7aae, settings.var_2ea01b067584142c ) );
        self._blackboard.vehicleattacklatchattackallowed = 1;
        self._blackboard.var_ad6bf8160e8d182e = 0;
        self._blackboard.var_d25fb6ff6554b02b = getdvarfloat( @"vehicle_attack_cooldown_ms", utility::function_4b74c15943231980( settings.var_d25fb6ff6554b02b ) );
        self._blackboard.var_7f754e4991eed5ef = getdvarfloat( @"vehicle_attack_max_height", settings.var_7f754e4991eed5ef );
        self._blackboard.var_3db5f96de51726e8 = getdvarfloat( @"hash_770398ac93a0eae1", settings.var_3db5f96de51726e8 );
        self._blackboard.var_76e8c2b39b9fe7be = getdvarfloat( @"hash_6dd6f1cfbdaf6517", settings.var_76e8c2b39b9fe7be );
        self._blackboard.var_c088bb2350822548 = getdvarfloat( @"hash_6ee00cf7b5adf6d3", settings.var_c088bb2350822548 );
        self.var_a070a560568c9817 = settings.var_a070a560568c9817;
        self.var_5913e2bda603322d = settings.var_5913e2bda603322d;
        self._blackboard.var_314c202840bf0a37 = settings.var_be247e8111d86d1e;
        self._blackboard.var_925f694874597406 = getdvarfloat( @"hash_6d93d24681dec91d", settings.var_9f08073006e2a2d0 );
        self._blackboard.var_c33c0bb548a56434 = getdvarfloat( @"hash_11eb5dafb9789879", utility::function_4b74c15943231980( settings.var_17f21409b0640754 ) );
        self._blackboard.var_76443ec5bac310ac = settings.var_340de96e999f8202;
    }
    
    if ( settings.var_d7922471e61ba16 || settings.var_8d07b1181350233d )
    {
        if ( settings.var_af537b5239d052a2 > 0 )
        {
            self.var_abc8197d352873af = settings.var_af537b5239d052a2 * 1000;
            self.var_c85fec368aa94f80 = self.var_abc8197d352873af + gettime();
        }
        
        zombie_emergence_spawning::register_emergence_spawning_settings( settings );
    }
    
    self.var_7a9f097fcaf798f6 = settings.var_7a9f097fcaf798f6;
    
    if ( settings.var_17eff292316640a2 )
    {
        self allowvehiclepredictiveragdoll( 0 );
    }
    
    self.var_1c6903eff348c65f = 1;
    self.var_57700436ec65d38c = [];
    self.var_d4b7ed447e2bf50c = [];
    self.aicategory = settings.aicategory;
    assert( self.type == "<dev string:x24>" );
    self.var_facda4eb36c515c8 = settings.var_facda4eb36c515c8;
    self setcanusecover( 0, "entity" );
    self._blackboard.zombiewanderorigin = self.origin;
    self._blackboard.var_8d34ab856208146f = settings.maxwanderradius ?? 0;
    self._blackboard.var_8d11b98561e1eb81 = settings.minwanderradius ?? 0;
    self._blackboard.zombieusewanderscripted = istrue( settings.usewanderscripted );
    self._blackboard.var_6a8c50efac75caa1 = settings.tetherrange ?? 0;
    self._blackboard.var_dd1cb4e12c4c12d2 = 200;
    
    if ( isdefined( level.gamemodebundle ) )
    {
        self._blackboard.var_dd1cb4e12c4c12d2 = level.gamemodebundle.var_dd1cb4e12c4c12d2;
        
        if ( level.gamemodebundle.var_dd1cb4e12c4c12d2 > 0 )
        {
            self._blackboard.zombieusewanderscripted = 0;
        }
        
        if ( !level.gamemodebundle.var_d38a479c90695e4d )
        {
            self._blackboard.var_6a8c50efac75caa1 = 0;
        }
    }
    
    if ( self._blackboard.var_6a8c50efac75caa1 > 0 )
    {
        thread function_22d11acc58653152();
    }
    
    self.var_9dd11279d5e371c7 = settings.var_ee14f8e645a86f09;
    var_ed786c18f965c96d = level.gamemodebundle && level.gamemodebundle.var_8e4fd6700a542802;
    var_ed786c18f965c96d = getdvarint( @"hash_4a5a62034cece324", var_ed786c18f965c96d );
    
    if ( var_ed786c18f965c96d && settings.elementalweakness.size > 0 )
    {
        foreach ( weakness in settings.elementalweakness )
        {
            self.elementalweakness[ weakness.elementtype ] = 1;
        }
    }
    
    if ( isdefined( self.zombieaisettings.var_394d3c5e6fa40c50 ) )
    {
        self.zombieaisettings.var_d3de1a9faac42deb = getscriptbundle( self.zombieaisettings.var_394d3c5e6fa40c50 );
    }
    
    self.paincooldown = 1000;
    self.fnshouldplaypainanim = &function_9436f0886f568df9;
    
    if ( isdefined( self ) && !isdefined( self.spawn_time ) )
    {
        self.spawn_time = gettime();
    }
    
    if ( isdefined( self.zombieaisettings.metabones ) )
    {
        metabone::init_metabones( self.zombieaisettings.metabones );
    }
    
    zombie_vox::init_zombie_vox();
    self function_5c50b48c0c81d566( "all", 0 );
    stealth::initstealthfunctions();
    self.var_dd312aa6ebf45c2d = 1;
    self.var_d45be168925dc3a1 = 0;
    self.var_b91fb41740e1735a = 1;
    self.var_99ade545630d0106 = 1;
    self.var_b2b26721c0c930e8 = 1;
    val::set( "zombie_init", "allow_unreachable_attack", 1 );
    
    if ( !self.zombieaisettings.var_886916b113f31dc3 )
    {
        val::set( "zombie_init", "collide_with_ai_allies", 0 );
    }
    
    if ( !self.zombieaisettings.var_bfacea6b80d40655 )
    {
        self.collide_with_ai_allies_smaller = 0;
    }
    
    thread update_pushable();
    self.collide_with_ai = 1;
    self.nododgemove = 1;
    
    if ( self.zombieaisettings.var_62eba4a4ee3d78d6 > 0 )
    {
        self function_b44d633992d92d84( self.zombieaisettings.var_62eba4a4ee3d78d6 );
    }
    
    if ( !self.zombieaisettings.allowstrafe )
    {
        self setstrafeblocked( 1, "entity" );
    }
    
    if ( self.zombieaisettings.var_f68215cdf66e22f7 )
    {
        self.var_19238dbcc969affa = 1;
        
        if ( self.zombieaisettings.var_59ddc173aaf10479 )
        {
            self.var_5927d2279779cec0 = 1;
        }
    }
    
    self._blackboard.var_b3841f6a79101406 = 1;
    self._blackboard.var_be983914fda0ad86 = 256;
    thread function_a78b67d05dd787d9();
    self.var_2f7b28254901f8d6 = 1;
    self.var_f654ebe2aeab29f7 = 1;
    self.killondamage = 0;
    
    /#
        thread setup_test_settings();
    #/
}

// Namespace zombie_init
// Params 1
// Checksum 0xb824d0a4, Offset: 0x1837
// Size: 0x10f
function zombie_init_ai_asm( var_fd93314a0fb374d7 )
{
    assert( isdefined( self.asm ) );
    assert( isdefined( self.zombieaisettings ) );
    settings = self.zombieaisettings;
    self.animname = self.animsetname;
    function_cfcb72655ea3568a( settings, var_fd93314a0fb374d7 );
    
    if ( settings.enablemelee )
    {
        foreach ( pair in settings.speedthreshold_list )
        {
            if ( !isdefined( pair.movetype ) )
            {
                continue;
            }
            
            zombie_melee::function_2cc3729a3cdeadbf( pair.movetype, pair.var_87a3fdda3fb038ad );
        }
    }
}

// Namespace zombie_init
// Params 0, eflags: 0x4
// Checksum 0x5c3f8b26, Offset: 0x194e
// Size: 0xb9
function private function_a78b67d05dd787d9()
{
    self endon( #"death" );
    utility::ent_flag_wait_or_timeout( "zombie_asm_init_finished", 1 );
    assert( utility::ent_flag( "<dev string:x2b>" ), "<dev string:x44>" );
    assert( isdefined( self.subclass ), "<dev string:x8b>" + ( self.agent_type ?? "<dev string:xbc>" ) );
    
    if ( isdefined( self.subclass ) )
    {
        callback::callback( "on_" + self.subclass + "_spawned" );
    }
    
    callback::callback( "on_zombie_ai_spawned" );
    thread initscriptable();
    
    if ( self.zombieaisettings.var_cf239a32f7448dd1 )
    {
        thread zombie_knockdown::function_a0c03faf3694150c();
    }
}

// Namespace zombie_init
// Params 0
// Checksum 0xe1b89890, Offset: 0x1a0f
// Size: 0xdf
function initscriptable()
{
    self endon( #"death" );
    utility::flag_wait( "scriptables_ready" );
    utility::waittill_any_timeout( level.framedurationseconds, "post_spawn" );
    
    if ( utility::callsharedfunc( #"ai", #"hash_e2521119339c3814" ) )
    {
    }
    else if ( self isscriptable() && self.aisettings.var_b6294232e54aa4d7 && !self.suppress_minimap_icon )
    {
        self setscriptablepartstate( "icon", "active", 0 );
        namespace_9d8e359c3b1041e5::function_b739495605e4ba8a( 1 );
    }
    
    if ( isdefined( self.saved_metabones ) )
    {
        waitframe();
        params = spawnstruct();
        params.saved_metabones = self.saved_metabones;
        callback::callback( "on_zombie_init_restore_metabones", params );
        self.saved_metabones = undefined;
    }
}

// Namespace zombie_init
// Params 2, eflags: 0x4
// Checksum 0x329bdf7c, Offset: 0x1af6
// Size: 0x5d
function private function_cfcb72655ea3568a( settings, var_fd93314a0fb374d7 )
{
    archetype = self.animsetname;
    flag_name = archetype + "_init_asm";
    
    if ( utility::flag( flag_name ) )
    {
        return;
    }
    
    utility::flag_set( flag_name );
    
    if ( isdefined( var_fd93314a0fb374d7 ) )
    {
        self [[ var_fd93314a0fb374d7 ]]();
    }
}

// Namespace zombie_init
// Params 10, eflags: 0x4
// Checksum 0xbe2cfca2, Offset: 0x1b5b
// Size: 0x180
function private on_ai_killed( einflictor, eattacker, idamage, smeansofdeath, objweapon, vdir, shitloc, timeoffset, deathanimduration, dropweapons )
{
    params_struct = spawnstruct();
    params_struct.einflictor = einflictor;
    params_struct.eattacker = eattacker;
    params_struct.idamage = idamage;
    params_struct.smeansofdeath = smeansofdeath;
    params_struct.objweapon = objweapon;
    params_struct.vdir = vdir;
    params_struct.shitloc = shitloc;
    params_struct.timeoffset = timeoffset;
    params_struct.deathanimduration = deathanimduration;
    params_struct.dropweapons = dropweapons;
    params_struct.origin = self.origin;
    params_struct.b_in_spawn_closet = self.b_in_spawn_closet;
    callback::callback( "on_zombie_ai_killed", params_struct );
    
    if ( self._blackboard.zombieindespawn )
    {
        if ( self.magic_bullet_shield )
        {
            ai::stop_magic_bullet_shield();
        }
        
        self.var_a13bed1ac47e1b2c = 1;
    }
    
    namespace_9d8e359c3b1041e5::onhumanoidagentkilledcommon_sharedfunc( einflictor, eattacker, idamage, smeansofdeath, objweapon, vdir, shitloc, timeoffset, deathanimduration, 0 );
    death::deathcleanup();
}

// Namespace zombie_init
// Params 0, eflags: 0x4
// Checksum 0x6119ccf1, Offset: 0x1ce3
// Size: 0x3, Type: bool
function private function_4145ba81712abf54()
{
    return false;
}

// Namespace zombie_init
// Params 0, eflags: 0x4
// Checksum 0x907b9169, Offset: 0x1cef
// Size: 0x1d, Type: bool
function private function_9436f0886f568df9()
{
    if ( !self.allowpain )
    {
        return false;
    }
    
    if ( self shouldignorepain() )
    {
        return false;
    }
    
    return true;
}

// Namespace zombie_init
// Params 0, eflags: 0x4
// Checksum 0xfc242e31, Offset: 0x1d15
// Size: 0x28b
function private update_pushable()
{
    self endon( #"death" );
    self.doavoidanceblocking = 0;
    wait 1;
    b_stuck = 0;
    var_9b373b4651453bcb = undefined;
    var_64c180773b7be550 = undefined;
    
    while ( true )
    {
        path_points = self getpath( 1, 2, 1, 1 );
        b_has_traversal = path_points.size >= 1 && ( path_points[ 0 ].flags & 2 ) != 0;
        var_7a9914924cac4cc = path_points.size >= 2 && ( path_points[ 1 ].flags & 2 ) != 0;
        b_disable_pushable = 0;
        b_disable_collide = 0;
        
        if ( b_has_traversal )
        {
            traversal_point = path_points[ 0 ].pos;
            var_3b0c43d20d92804e = self pathdisttogoal( 1 );
            var_2f854d35af40e8b6 = isdefined( var_9b373b4651453bcb ) && distancesquared( var_9b373b4651453bcb, traversal_point ) < 1;
            var_b7cd1a495b6cf715 = b_stuck;
            b_stuck = 0;
            
            if ( var_2f854d35af40e8b6 && var_64c180773b7be550 - var_3b0c43d20d92804e < 4 )
            {
                b_stuck = 1;
                
                if ( var_3b0c43d20d92804e < self.radius )
                {
                    b_disable_collide = 1;
                }
            }
            
            b_disable_pushable = b_stuck && var_b7cd1a495b6cf715;
            var_9b373b4651453bcb = traversal_point;
            var_64c180773b7be550 = var_3b0c43d20d92804e;
        }
        else
        {
            b_stuck = 0;
            var_9b373b4651453bcb = undefined;
            var_64c180773b7be550 = undefined;
        }
        
        var_801c0c71f5b1a49a = val::get_specific_id( "script_pushable_by_ai", "stuck_monitor" ) ?? 1;
        
        if ( var_801c0c71f5b1a49a && b_disable_pushable )
        {
            val::set( "stuck_monitor", "script_pushable_by_ai", 0 );
        }
        else if ( !var_801c0c71f5b1a49a && !b_disable_pushable )
        {
            val::reset( "stuck_monitor", "script_pushable_by_ai" );
        }
        
        var_99616d7f9b5cedb8 = val::get_specific_id( "collide_with_ai_allies", "stuck_monitor" ) ?? 1;
        
        if ( var_99616d7f9b5cedb8 && b_disable_collide )
        {
            val::set( "stuck_monitor", "collide_with_ai_allies", 0 );
        }
        else if ( !var_99616d7f9b5cedb8 && !b_disable_collide )
        {
            val::reset( "stuck_monitor", "collide_with_ai_allies" );
        }
        
        /#
            var_801c0c71f5b1a49a = val::get_specific_id( "<dev string:xc4>", "<dev string:xda>" ) ?? 1;
            var_99616d7f9b5cedb8 = val::get_specific_id( "<dev string:xe8>", "<dev string:xda>" ) ?? 1;
            assert( var_801c0c71f5b1a49a == !b_disable_pushable && !var_801c0c71f5b1a49a == b_disable_pushable );
            assert( var_99616d7f9b5cedb8 == !b_disable_collide && !var_99616d7f9b5cedb8 == b_disable_collide );
        #/
        
        wait b_has_traversal || var_7a9914924cac4cc ? 0.2 : 1;
    }
}

// Namespace zombie_init
// Params 1, eflags: 0x4
// Checksum 0xfbefec66, Offset: 0x1fa8
// Size: 0x98
function private function_229848bbd9b73c94( params )
{
    self endon( #"death" );
    
    if ( params.firstshock || params.newshockstick )
    {
        stun_delay = randomfloat( 0.4 );
        wait stun_delay;
        self.shockstick_inflictor = params.haywiredata.inflictor;
        effect_stun::stun( "shockstick", 5, params.haywiredata.attacker, undefined, undefined, "electrical" );
    }
}

// Namespace zombie_init
// Params 1, eflags: 0x4
// Checksum 0x5982ed7c, Offset: 0x2048
// Size: 0x22
function private function_692c81ff2b8b1811( params )
{
    effect_stun::stop_stun( "shockstick" );
    self.shockstick_inflictor = undefined;
}

// Namespace zombie_init
// Params 1, eflags: 0x4
// Checksum 0x3d2f0ac7, Offset: 0x2072
// Size: 0x44
function private function_450bc5504cd552d8( params )
{
    to_new_health = params.new_maxhealth / params.old_maxhealth;
    self.var_9dd11279d5e371c7 *= to_new_health;
}

// Namespace zombie_init
// Params 0, eflags: 0x4
// Checksum 0xc4aa62b8, Offset: 0x20be
// Size: 0x97
function private function_22d11acc58653152()
{
    self endon( #"death" );
    
    while ( true )
    {
        self waittill( #"tether_start" );
        tether_move_speed = self.zombieaisettings.speedthreshold_list[ self.zombieaisettings.speedthreshold_list.size - 1 ].movetype;
        zombie_utils::function_a8ce00e0448cb6f0( tether_move_speed, "tether", 5 );
        thread tether_heal();
        self waittill( #"tether_end" );
        zombie_utils::function_a8ce00e0448cb6f0( undefined, "tether", 5 );
    }
}

// Namespace zombie_init
// Params 0, eflags: 0x4
// Checksum 0xe7b20ee8, Offset: 0x215d
// Size: 0xb3
function private tether_heal()
{
    self endon( #"death" );
    self endon( #"tether_end" );
    var_d8c4f585cbd1a884 = min( self.maxhealth, self.health + self.maxhealth * 0.25 );
    tether_heal_rate = 0.07;
    
    while ( true )
    {
        if ( self.tether_heal_disable )
        {
            return;
        }
        
        var_a32dca02fb15d0eb = int( clamp( self.maxhealth * tether_heal_rate, 0, var_d8c4f585cbd1a884 - self.health ) );
        self.health += var_a32dca02fb15d0eb;
        wait 1;
    }
}

/#

    // Namespace zombie_init
    // Params 0, eflags: 0x4
    // Checksum 0xf6428269, Offset: 0x2218
    // Size: 0xa7, Type: dev
    function private setup_test_settings()
    {
        setdvarifuninitialized( @"zombie_wander_enabled", 1 );
        setdvarifuninitialized( @"zombie_pain_enabled", 1 );
        
        if ( getdvarint( @"zombie_wander_enabled", 1 ) <= 0 )
        {
            self._blackboard.var_8d34ab856208146f = 0;
            self._blackboard.zombiewanderorigin = self.origin;
            self._blackboard.var_dd1cb4e12c4c12d2 = -1;
        }
        
        if ( getdvarint( @"zombie_pain_enabled", 1 ) <= 0 )
        {
            val::set( "<dev string:xff>", "<dev string:x111>", 0 );
        }
    }

    // Namespace zombie_init
    // Params 0, eflags: 0x4
    // Checksum 0x90b1085b, Offset: 0x22c7
    // Size: 0x94, Type: dev
    function private function_25330b6e68e3027b()
    {
        foreach ( type in getaitypenames() )
        {
            if ( issubstr( type, "<dev string:x116>" ) )
            {
                assertmsg( "<dev string:x122>" + type + "<dev string:x18e>" );
            }
        }
    }

#/
