#using script_16ea1b94f0f381b3;
#using scripts\common\callbacks;
#using scripts\common\devgui;
#using scripts\common\ui;
#using scripts\engine\utility;

#namespace stackablehitmarker;

// Namespace stackablehitmarker
// Params 0, eflags: 0x1
// Checksum 0x56399dff, Offset: 0x18e
// Size: 0xd4
function autoexec init()
{
    utility::registersharedfunc( #"hud", #"initstackablehitmarker", &initstackablehitmarker );
    utility::registersharedfunc( #"hud", #"hash_82fe4f75d53751e1", &function_58319ead445cea90 );
    utility::registersharedfunc( #"hud", #"hash_43bff838e7c0cf81", &function_4b0d6c761edcad8 );
    utility::registersharedfunc( #"hud", #"hash_84d4f784de00c6af", &function_bdc354bab03394ce );
    utility::registersharedfunc( #"hud", #"hash_eb86447382b1de03", &function_cd971c7b846f69e8 );
    utility::registersharedfunc( #"hud", #"hash_c8c81e6b434c4313", &function_ea26d70758b3a166 );
    utility::registersharedfunc( #"hud", #"hash_785d65fc31ffd85", &function_6156498227616d88 );
}

// Namespace stackablehitmarker
// Params 3
// Checksum 0xde9269a, Offset: 0x26a
// Size: 0xd8
function function_58319ead445cea90( omnvarname, flag, var_1f79005287503a96 )
{
    switch ( omnvarname ?? "" )
    {
        case #"hash_e242f25739127d9f":
            var_a804030c1c40f173 = "damage_feedback_weapon_notify";
            break;
        case #"hash_3e06e6c0a0e00af9":
            var_a804030c1c40f173 = "damage_feedback_notify";
            break;
        case #"hash_1cb96e49c1e03381":
            var_a804030c1c40f173 = "damage_feedback_entity_notify";
            break;
    }
    
    now = gettime();
    
    if ( var_1f79005287503a96 || self.var_37b8c52eeea01de5[ var_a804030c1c40f173 ] != now || getdvarint( @"hash_605c8c06483a99ac", 1 ) != 1 )
    {
        self setclientomnvar( omnvarname, flag );
        self setclientomnvar( var_a804030c1c40f173, now );
        self.var_37b8c52eeea01de5[ var_a804030c1c40f173 ] = now;
    }
}

// Namespace stackablehitmarker
// Params 0
// Checksum 0x2f79740b, Offset: 0x34a
// Size: 0x2a
function initstackablehitmarker()
{
    /#
        level thread function_500b3154293fc161();
    #/
    
    function_44d79c5d14c93b48();
    level callback::add( #"player_connect", &function_5a7f52267fb53d52 );
}

// Namespace stackablehitmarker
// Params 3
// Checksum 0x1db5c28c, Offset: 0x37c
// Size: 0x10a
function function_bdc354bab03394ce( hitmarkersoundtype, var_795e8a31194a39ac, killingblow )
{
    if ( isdefined( var_795e8a31194a39ac.victimentity ) )
    {
        victim = var_795e8a31194a39ac.victimentity;
        
        if ( function_773423a0f51dc31e( victim ) )
        {
            if ( isdefined( victim.var_1f5c3835df679814 ) )
            {
                alias = victim.var_1f5c3835df679814;
            }
            else if ( isdefined( victim.var_2a0bcfaae7400f6f ) && !killingblow )
            {
                alias = victim.var_2a0bcfaae7400f6f;
            }
            else if ( isdefined( victim.var_959d9bf0d800e404 ) && killingblow )
            {
                alias = victim.var_959d9bf0d800e404;
            }
        }
        
        if ( !isdefined( alias ) )
        {
            alias = function_6156498227616d88( hitmarkersoundtype );
        }
        
        if ( isdefined( alias ) )
        {
            result = namespace_9d8e359c3b1041e5::playsoundtoplayersharedfunc( alias, self, victim );
            
            if ( isinfrontend() && !result )
            {
                playsoundatpos( victim.origin, alias );
            }
        }
    }
}

// Namespace stackablehitmarker
// Params 1, eflags: 0x4
// Checksum 0x5cbffe7f, Offset: 0x48e
// Size: 0x17
function private function_773423a0f51dc31e( victim )
{
    return victim.var_aab5beb67c1704ec;
}

// Namespace stackablehitmarker
// Params 1
// Checksum 0x90b95eab, Offset: 0x4ae
// Size: 0x3f
function function_6156498227616d88( hitmarkersoundtype )
{
    if ( !isdefined( level.var_f8f3ff001f9b39ca ) )
    {
        function_44d79c5d14c93b48();
    }
    
    return level.var_f8f3ff001f9b39ca[ ( self.var_928fdcf0c3bebba3 ?? 1 ) - 1 ][ hitmarkersoundtype ];
}

// Namespace stackablehitmarker
// Params 6
// Checksum 0x6f105892, Offset: 0x4f6
// Size: 0xa6
function function_4b0d6c761edcad8( killingblow, isfriendlyhit, headshot, isenemydown, isarmorhit, isarmorbreak )
{
    if ( isfriendlyhit )
    {
        if ( killingblow )
        {
            return 5;
        }
        else
        {
            return 4;
        }
    }
    else if ( headshot )
    {
        if ( killingblow )
        {
            return 8;
        }
        else if ( isarmorhit )
        {
            return 10;
        }
        else if ( isarmorbreak )
        {
            return 11;
        }
        else
        {
            return 7;
        }
    }
    else if ( isenemydown )
    {
        return 9;
    }
    else if ( killingblow )
    {
        return 3;
    }
    else if ( isarmorhit )
    {
        return 10;
    }
    else if ( isarmorbreak )
    {
        return 11;
    }
    
    return 2;
}

// Namespace stackablehitmarker
// Params 2
// Checksum 0x9798b287, Offset: 0x5a5
// Size: 0x3f
function function_cd971c7b846f69e8( killingblow, stackablehitmarkerdata )
{
    if ( isdefined( stackablehitmarkerdata.soundtypeoverride ) )
    {
        return function_665ce5417676c728( stackablehitmarkerdata.soundtypeoverride );
    }
    
    if ( killingblow )
    {
        return 1;
    }
    
    return 0;
}

// Namespace stackablehitmarker
// Params 1
// Checksum 0xb8d004f5, Offset: 0x5ed
// Size: 0x16
function function_ea26d70758b3a166( killingblow )
{
    if ( killingblow )
    {
        return 17;
    }
    
    return 16;
}

// Namespace stackablehitmarker
// Params 1, eflags: 0x4
// Checksum 0x6f1311b3, Offset: 0x60c
// Size: 0x60
function private function_665ce5417676c728( var_3406319376dc2514 )
{
    switch ( var_3406319376dc2514 )
    {
        case 1:
            return 12;
        case 2:
            return 13;
        case 3:
            return 14;
        case 4:
            return 15;
        default:
            return undefined;
    }
}

// Namespace stackablehitmarker
// Params 0, eflags: 0x4
// Checksum 0x69602a1c, Offset: 0x674
// Size: 0x6a
function private function_44d79c5d14c93b48()
{
    level.var_f8f3ff001f9b39ca = [];
    configlist = getscriptbundle( level.gamemodebundle.var_acb3274dd686326 );
    level.var_f8f3ff001f9b39ca[ 0 ] = function_af9ea8a4fe22dd81( configlist.defaultset );
    level.var_f8f3ff001f9b39ca[ 1 ] = function_af9ea8a4fe22dd81( configlist.classicset );
}

// Namespace stackablehitmarker
// Params 1, eflags: 0x4
// Checksum 0x6e012878, Offset: 0x6e6
// Size: 0x69
function private function_5a7f52267fb53d52( params )
{
    level endon( "game_ended" );
    self endon( "death_or_disconnect" );
    
    if ( isdefined( self ) )
    {
        if ( isbot( self ) )
        {
            var_928fdcf0c3bebba3 = randomintrange( 1, 3 );
        }
        else
        {
            var_928fdcf0c3bebba3 = utility::requestgamerprofile( "sndHitmarkerPreset" );
            ui::lui_registercallback( "hitmarker_sound_preset_update", &hitmarker_sound_preset_update );
        }
        
        self.var_928fdcf0c3bebba3 = var_928fdcf0c3bebba3;
    }
}

// Namespace stackablehitmarker
// Params 1, eflags: 0x4
// Checksum 0x5a705068, Offset: 0x757
// Size: 0x17
function private hitmarker_sound_preset_update( val )
{
    self.var_928fdcf0c3bebba3 = val;
}

// Namespace stackablehitmarker
// Params 1, eflags: 0x4
// Checksum 0xb4bfe6f8, Offset: 0x776
// Size: 0x13a
function private function_af9ea8a4fe22dd81( configbundlename )
{
    configbundle = getscriptbundle( configbundlename );
    config = [];
    config[ 0 ] = configbundle.equiphit;
    config[ 1 ] = configbundle.equipkill;
    config[ 12 ] = configbundle.equipmentburn;
    config[ 13 ] = configbundle.equipmentgas;
    config[ 14 ] = configbundle.equipmentelectric;
    config[ 15 ] = configbundle.equipmentblunt;
    config[ 2 ] = configbundle.var_14b4e5782406eb3b;
    config[ 3 ] = configbundle.var_86e5942268956a2e;
    config[ 4 ] = configbundle.friendlyhit;
    config[ 5 ] = configbundle.friendlykill;
    config[ 7 ] = configbundle.headshotregular;
    config[ 8 ] = configbundle.headshotkill;
    config[ 9 ] = configbundle.enemydowned;
    config[ 10 ] = configbundle.armorhit;
    config[ 11 ] = configbundle.armordestroy;
    config[ 16 ] = configbundle.var_b669562b251d2b33;
    config[ 17 ] = configbundle.var_edc1b76ab0f250ac;
    return config;
}

/#

    // Namespace stackablehitmarker
    // Params 0
    // Checksum 0xffac9ea2, Offset: 0x8b9
    // Size: 0x33c, Type: dev
    function function_500b3154293fc161()
    {
        if ( level.gamemodebundle.var_ff5875c91bf48d60 )
        {
            devgui::function_9082edeb5db93280( "<dev string:x24>" );
            devgui::function_581b7f2e243b8ae4( "<dev string:x3d>", "<dev string:x5b>" );
            devgui::function_581b7f2e243b8ae4( "<dev string:x7a>", "<dev string:x98>" );
            devgui::function_581b7f2e243b8ae4( "<dev string:xb6>", "<dev string:xda>" );
            devgui::function_581b7f2e243b8ae4( "<dev string:xfd>", "<dev string:x11c>" );
            devgui::function_581b7f2e243b8ae4( "<dev string:x13b>", "<dev string:x159>" );
            devgui::function_581b7f2e243b8ae4( "<dev string:x177>", "<dev string:x19a>" );
            devgui::function_502a7d5e4d9dfa5b( "<dev string:x1bd>", "<dev string:x1d0>", &function_5b411e590a03f868 );
            devgui::function_502a7d5e4d9dfa5b( "<dev string:x1f2>", "<dev string:x206>", &function_b2b8038e3dd76b87 );
            devgui::function_502a7d5e4d9dfa5b( "<dev string:x229>", "<dev string:x245>", &function_bfe4bcc4e64ee077 );
            devgui::function_502a7d5e4d9dfa5b( "<dev string:x26f>", "<dev string:x28c>", &function_4fe985ea5d63364a );
            devgui::function_502a7d5e4d9dfa5b( "<dev string:x2b7>", "<dev string:x2d3>", &function_f7c06326d39830d9 );
            devgui::function_502a7d5e4d9dfa5b( "<dev string:x2fd>", "<dev string:x31a>", &function_142ce1a8c6eb7974 );
            devgui::function_502a7d5e4d9dfa5b( "<dev string:x345>", "<dev string:x36a>", &function_ed096b768fd8c535 );
            devgui::function_502a7d5e4d9dfa5b( "<dev string:x398>", "<dev string:x3be>", &function_f2688d0272c12980 );
            devgui::function_502a7d5e4d9dfa5b( "<dev string:x3ed>", "<dev string:x406>", &function_3e27a77f375049ff );
            devgui::function_502a7d5e4d9dfa5b( "<dev string:x42d>", "<dev string:x448>", &function_5945399f04853b55 );
            devgui::function_502a7d5e4d9dfa5b( "<dev string:x471>", "<dev string:x48b>", &function_c88f2526206f9e45 );
            devgui::function_502a7d5e4d9dfa5b( "<dev string:x4b3>", "<dev string:x4c5>", &function_6d0a3adbbc7be108 );
            devgui::function_502a7d5e4d9dfa5b( "<dev string:x4e6>", "<dev string:x4f9>", &function_4c5016fcc0619fa7 );
            devgui::function_502a7d5e4d9dfa5b( "<dev string:x51b>", "<dev string:x536>", &function_b328138b77d07579 );
            devgui::function_502a7d5e4d9dfa5b( "<dev string:x55f>", "<dev string:x57b>", &function_717a2efdeea9d894 );
            devgui::function_502a7d5e4d9dfa5b( "<dev string:x5a5>", "<dev string:x5bc>", &function_7ecc5ccb4dc7f292 );
            devgui::function_502a7d5e4d9dfa5b( "<dev string:x5e2>", "<dev string:x5fd>", &function_145f6f48b36d02ed );
            devgui::function_502a7d5e4d9dfa5b( "<dev string:x627>", "<dev string:x64d>", &function_23de81655e8da825 );
            devgui::function_502a7d5e4d9dfa5b( "<dev string:x687>", "<dev string:x6a4>", &function_f8f713aecfc22d5c );
            devgui::function_502a7d5e4d9dfa5b( "<dev string:x6d5>", "<dev string:x6f7>", &function_9285f95b96669b14 );
            devgui::function_502a7d5e4d9dfa5b( "<dev string:x72d>", "<dev string:x749>", &function_377dd24de7f87340 );
            devgui::function_502a7d5e4d9dfa5b( "<dev string:x779>", "<dev string:x796>", &function_303bb46c6128dffe );
            devgui::function_502a7d5e4d9dfa5b( "<dev string:x7c7>", "<dev string:x7e4>", &function_42884c79675224e0 );
            devgui::function_502a7d5e4d9dfa5b( "<dev string:x816>", "<dev string:x837>", &function_e5fa03c8651f32d7 );
            devgui::function_77df7fe7dd273e10();
            devgui::function_9082edeb5db93280( "<dev string:x86c>" );
            listbundle = getscriptbundle( level.gamemodebundle.hitmarkericonlist );
            list = listbundle.hitmarkericonlist;
            
            for ( i = 0; i < list.size ; i++ )
            {
                typename = list[ i ].typename;
                devgui::function_cd4e263c1f3018ae( "<dev string:x889>" + typename, "<dev string:x892>" + typename, &function_5c75837c70153bd7 );
            }
            
            devgui::function_77df7fe7dd273e10();
        }
    }

    // Namespace stackablehitmarker
    // Params 0
    // Checksum 0xa5578379, Offset: 0xbfd
    // Size: 0x97, Type: dev
    function function_5b411e590a03f868()
    {
        markerflag = 0;
        markerflag |= 1;
        
        foreach ( player in level.players )
        {
            player function_58319ead445cea90( "<dev string:x8b5>", markerflag );
        }
    }

    // Namespace stackablehitmarker
    // Params 0
    // Checksum 0x94b06f70, Offset: 0xc9c
    // Size: 0xa0, Type: dev
    function function_b2b8038e3dd76b87()
    {
        markerflag = 0;
        markerflag |= 1;
        markerflag |= 2;
        
        foreach ( player in level.players )
        {
            player function_58319ead445cea90( "<dev string:x8b5>", markerflag, 1 );
        }
    }

    // Namespace stackablehitmarker
    // Params 0
    // Checksum 0x31e5fe81, Offset: 0xd44
    // Size: 0x9e, Type: dev
    function function_bfe4bcc4e64ee077()
    {
        markerflag = 0;
        markerflag |= 1;
        markerflag |= 8;
        
        foreach ( player in level.players )
        {
            player function_58319ead445cea90( "<dev string:x8b5>", markerflag );
        }
    }

    // Namespace stackablehitmarker
    // Params 0
    // Checksum 0x926b3fcf, Offset: 0xdea
    // Size: 0xa7, Type: dev
    function function_4fe985ea5d63364a()
    {
        markerflag = 0;
        markerflag |= 1;
        markerflag |= 8;
        markerflag |= 2;
        
        foreach ( player in level.players )
        {
            player function_58319ead445cea90( "<dev string:x8b5>", markerflag, 1 );
        }
    }

    // Namespace stackablehitmarker
    // Params 0
    // Checksum 0xdd20a72, Offset: 0xe99
    // Size: 0x9e, Type: dev
    function function_f7c06326d39830d9()
    {
        markerflag = 0;
        markerflag |= 1;
        markerflag |= 4;
        
        foreach ( player in level.players )
        {
            player function_58319ead445cea90( "<dev string:x8b5>", markerflag );
        }
    }

    // Namespace stackablehitmarker
    // Params 0
    // Checksum 0x6a8f21b3, Offset: 0xf3f
    // Size: 0xa7, Type: dev
    function function_142ce1a8c6eb7974()
    {
        markerflag = 0;
        markerflag |= 1;
        markerflag |= 4;
        markerflag |= 2;
        
        foreach ( player in level.players )
        {
            player function_58319ead445cea90( "<dev string:x8b5>", markerflag, 1 );
        }
    }

    // Namespace stackablehitmarker
    // Params 0
    // Checksum 0x19393a4e, Offset: 0xfee
    // Size: 0xa5, Type: dev
    function function_ed096b768fd8c535()
    {
        markerflag = 0;
        markerflag |= 1;
        markerflag |= 4;
        markerflag |= 8;
        
        foreach ( player in level.players )
        {
            player function_58319ead445cea90( "<dev string:x8b5>", markerflag );
        }
    }

    // Namespace stackablehitmarker
    // Params 0
    // Checksum 0x15efb11, Offset: 0x109b
    // Size: 0xae, Type: dev
    function function_f2688d0272c12980()
    {
        markerflag = 0;
        markerflag |= 1;
        markerflag |= 4;
        markerflag |= 8;
        markerflag |= 2;
        
        foreach ( player in level.players )
        {
            player function_58319ead445cea90( "<dev string:x8b5>", markerflag, 1 );
        }
    }

    // Namespace stackablehitmarker
    // Params 0
    // Checksum 0x3e780398, Offset: 0x1151
    // Size: 0x9e, Type: dev
    function function_3e27a77f375049ff()
    {
        markerflag = 0;
        markerflag |= 1;
        markerflag |= 16;
        
        foreach ( player in level.players )
        {
            player function_58319ead445cea90( "<dev string:x8b5>", markerflag );
        }
    }

    // Namespace stackablehitmarker
    // Params 0
    // Checksum 0x5199f498, Offset: 0x11f7
    // Size: 0x9e, Type: dev
    function function_5945399f04853b55()
    {
        markerflag = 0;
        markerflag |= 1;
        markerflag |= 32;
        
        foreach ( player in level.players )
        {
            player function_58319ead445cea90( "<dev string:x8b5>", markerflag );
        }
    }

    // Namespace stackablehitmarker
    // Params 0
    // Checksum 0xac6c1f93, Offset: 0x129d
    // Size: 0x9e, Type: dev
    function function_c88f2526206f9e45()
    {
        markerflag = 0;
        markerflag |= 1;
        markerflag |= 64;
        
        foreach ( player in level.players )
        {
            player function_58319ead445cea90( "<dev string:x8b5>", markerflag );
        }
    }

    // Namespace stackablehitmarker
    // Params 0
    // Checksum 0x5eb51c9f, Offset: 0x1343
    // Size: 0x97, Type: dev
    function function_6d0a3adbbc7be108()
    {
        markerflag = 0;
        markerflag |= 1;
        
        foreach ( player in level.players )
        {
            player function_58319ead445cea90( "<dev string:x8cf>", markerflag );
        }
    }

    // Namespace stackablehitmarker
    // Params 0
    // Checksum 0xf2a00714, Offset: 0x13e2
    // Size: 0xa0, Type: dev
    function function_4c5016fcc0619fa7()
    {
        markerflag = 0;
        markerflag |= 1;
        markerflag |= 2;
        
        foreach ( player in level.players )
        {
            player function_58319ead445cea90( "<dev string:x8cf>", markerflag, 1 );
        }
    }

    // Namespace stackablehitmarker
    // Params 0
    // Checksum 0x8eede23c, Offset: 0x148a
    // Size: 0x9e, Type: dev
    function function_b328138b77d07579()
    {
        markerflag = 0;
        markerflag |= 1;
        markerflag |= 4;
        
        foreach ( player in level.players )
        {
            player function_58319ead445cea90( "<dev string:x8cf>", markerflag );
        }
    }

    // Namespace stackablehitmarker
    // Params 0
    // Checksum 0xeeb26fa7, Offset: 0x1530
    // Size: 0xa7, Type: dev
    function function_717a2efdeea9d894()
    {
        markerflag = 0;
        markerflag |= 1;
        markerflag |= 4;
        markerflag |= 2;
        
        foreach ( player in level.players )
        {
            player function_58319ead445cea90( "<dev string:x8cf>", markerflag, 1 );
        }
    }

    // Namespace stackablehitmarker
    // Params 0
    // Checksum 0xef7e3b94, Offset: 0x15df
    // Size: 0x97, Type: dev
    function function_7ecc5ccb4dc7f292()
    {
        markerflag = 0;
        markerflag |= 1;
        
        foreach ( player in level.players )
        {
            player function_58319ead445cea90( "<dev string:x8e8>", markerflag );
        }
    }

    // Namespace stackablehitmarker
    // Params 0
    // Checksum 0xef67af21, Offset: 0x167e
    // Size: 0xa0, Type: dev
    function function_145f6f48b36d02ed()
    {
        markerflag = 0;
        markerflag |= 1;
        markerflag |= 2;
        
        foreach ( player in level.players )
        {
            player function_58319ead445cea90( "<dev string:x8e8>", markerflag, 1 );
        }
    }

    // Namespace stackablehitmarker
    // Params 0
    // Checksum 0xb5818ab8, Offset: 0x1726
    // Size: 0x13, Type: dev
    function function_23de81655e8da825()
    {
        function_145f6f48b36d02ed();
        function_4c5016fcc0619fa7();
    }

    // Namespace stackablehitmarker
    // Params 0
    // Checksum 0x78f901e8, Offset: 0x1741
    // Size: 0x13, Type: dev
    function function_f8f713aecfc22d5c()
    {
        function_5b411e590a03f868();
        function_4c5016fcc0619fa7();
    }

    // Namespace stackablehitmarker
    // Params 0
    // Checksum 0x43aab3b0, Offset: 0x175c
    // Size: 0x13, Type: dev
    function function_9285f95b96669b14()
    {
        function_b2b8038e3dd76b87();
        function_7ecc5ccb4dc7f292();
    }

    // Namespace stackablehitmarker
    // Params 0
    // Checksum 0x4c6a7502, Offset: 0x1777
    // Size: 0x13, Type: dev
    function function_377dd24de7f87340()
    {
        function_6d0a3adbbc7be108();
        function_3e27a77f375049ff();
    }

    // Namespace stackablehitmarker
    // Params 0
    // Checksum 0x29877a23, Offset: 0x1792
    // Size: 0x13, Type: dev
    function function_303bb46c6128dffe()
    {
        function_6d0a3adbbc7be108();
        function_b2b8038e3dd76b87();
    }

    // Namespace stackablehitmarker
    // Params 0
    // Checksum 0x8d745183, Offset: 0x17ad
    // Size: 0x13, Type: dev
    function function_42884c79675224e0()
    {
        function_6d0a3adbbc7be108();
        function_b2b8038e3dd76b87();
    }

    // Namespace stackablehitmarker
    // Params 0
    // Checksum 0xdfd37b7c, Offset: 0x17c8
    // Size: 0x13, Type: dev
    function function_e5fa03c8651f32d7()
    {
        function_6d0a3adbbc7be108();
        function_7ecc5ccb4dc7f292();
    }

    // Namespace stackablehitmarker
    // Params 1
    // Checksum 0xbd5411b, Offset: 0x17e3
    // Size: 0x9e, Type: dev
    function function_5c75837c70153bd7( param )
    {
        foreach ( player in level.players )
        {
            player setclientomnvar( "<dev string:x906>", param[ 0 ] );
            player setclientomnvar( "<dev string:x91e>", gettime() );
        }
    }

#/
