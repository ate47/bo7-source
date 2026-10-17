#using script_353e34c229ca1589;
#using script_44280f644740bac;
#using scripts\common\active_env\portals;
#using scripts\common\gameplay_sound_fx;
#using scripts\common\scriptable;
#using scripts\common\utility;
#using scripts\mp\damagefeedback;
#using scripts\mp\gametypes\frune_checkpoints;

#namespace frune_shootable_target;

// Namespace frune_shootable_target
// Params 0
// Checksum 0xeb2c69df, Offset: 0x245
// Size: 0x883
function init()
{
    utility::flag_wait( "scriptables_ready" );
    modeinfo = game[ #"frune_tuning" ];
    
    if ( !isdefined( modeinfo.frune_bundle ) )
    {
        modeinfo.frune_bundle = game_utility_mp::function_4b7180ed8c2e9742( "gametypebundle_frune" );
    }
    
    modeinfo.var_21a2ecc610b6e93d = getdvarint( @"hash_c75e94275bbec9cc", modeinfo.frune_bundle.var_7e80ccd7e3e521af ?? 5 );
    
    if ( !isdefined( modeinfo.var_ceab04bdf86e1fbc ) )
    {
        modeinfo.var_ceab04bdf86e1fbc = {};
    }
    
    if ( !isdefined( modeinfo.var_ceab04bdf86e1fbc.var_ff8a76bf4f768eee ) )
    {
        modeinfo.var_ceab04bdf86e1fbc.var_ff8a76bf4f768eee = [ 8:#"hash_c3a7fdb95fe6d76c", 7:#"hash_c3a804b95fe6e351", 6:#"hash_c3a803b95fe6e19e", 5:#"shootable_countdown_duration_seconds_5", #"hash_c3a801b95fe6de38", 3:#"hash_c3a808b95fe6ea1d", 2:#"hash_c3a807b95fe6e86a" ];
    }
    
    if ( !isdefined( modeinfo.var_ceab04bdf86e1fbc.var_d9fa10a4746200c2 ) )
    {
        modeinfo.var_ceab04bdf86e1fbc.var_d9fa10a4746200c2 = [ 38:#"switchable_on_38", 37:#"switchable_on_37", 36:#"switchable_on_36", 35:#"switchable_on_35", 34:#"switchable_on_34", 33:#"switchable_on_33", 32:#"switchable_on_32", 31:#"switchable_on_31", 30:#"switchable_on_30", 29:#"switchable_on_29", 28:#"switchable_on_28", 27:#"switchable_on_27", 26:#"switchable_on_26", 25:#"switchable_on_25", 24:#"switchable_on_24", 23:#"switchable_on_23", 22:#"switchable_on_22", 21:#"switchable_on_21", 20:#"switchable_on_20", #"switchable_on_19", 18:#"switchable_on_18", 17:#"switchable_on_17", 16:#"switchable_on_16", 15:#"switchable_on_15", 14:#"switchable_on_14", 13:#"switchable_on_13", 12:#"switchable_on_12", 11:#"switchable_on_11", 10:#"switchable_on_10", 9:#"switchable_on_09", 8:#"switchable_on_08", 7:#"switchable_on_07", 6:#"switchable_on_06", 5:#"switchable_on_05", 4:#"switchable_on_04", 3:#"switchable_on_03", 2:#"switchable_on_02", 1:#"switchable_on_01" ];
    }
    
    if ( !isdefined( modeinfo.var_ceab04bdf86e1fbc.var_46680bfc4fc20a85 ) )
    {
        modeinfo.var_ceab04bdf86e1fbc.var_46680bfc4fc20a85 = [ 38:#"switchable_off_38", 37:#"switchable_off_37", 36:#"switchable_off_36", 35:#"switchable_off_35", 34:#"switchable_off_34", 33:#"switchable_off_33", 32:#"switchable_off_32", 31:#"switchable_off_31", 30:#"switchable_off_30", 29:#"switchable_off_29", 28:#"switchable_off_28", 27:#"switchable_off_27", 26:#"switchable_off_26", 25:#"switchable_off_25", 24:#"switchable_off_24", 23:#"switchable_off_23", 22:#"switchable_off_22", 21:#"switchable_off_21", 20:#"switchable_off_20", #"switchable_off_19", 18:#"switchable_off_18", 17:#"switchable_off_17", 16:#"switchable_off_16", 15:#"switchable_off_15", 14:#"switchable_off_14", 13:#"switchable_off_13", 12:#"switchable_off_12", 11:#"switchable_off_11", 10:#"switchable_off_10", 9:#"switchable_off_09", 8:#"switchable_off_08", 7:#"switchable_off_07", 6:#"switchable_off_06", 5:#"switchable_off_05", 4:#"switchable_off_04", 3:#"switchable_off_03", 2:#"switchable_off_02", 1:#"switchable_off_01" ];
    }
    
    framems = getframeduration();
    var_ed2633763641f2ff = int( 5000 / framems );
    
    if ( !isdefined( modeinfo.var_ceab04bdf86e1fbc.var_3ea570ed347afd4c ) )
    {
        modeinfo.var_ceab04bdf86e1fbc.var_3ea570ed347afd4c = { #var_9e0c6372dbdc5aaa:utility::function_6f5d2e1f1ff70482( int( var_ed2633763641f2ff * 0.1 ) * framems ), #shortpause:utility::function_6f5d2e1f1ff70482( int( var_ed2633763641f2ff * 0.12 ) * framems ), #medpause:utility::function_6f5d2e1f1ff70482( int( var_ed2633763641f2ff * 0.16 ) * framems ), #longpause:utility::function_6f5d2e1f1ff70482( int( var_ed2633763641f2ff * 0.2 ) * framems ) };
    }
    
    function_3b762fbb6fcf17d5();
    
    if ( getdvarint( @"hash_860dbe5e68c21210", 1 ) )
    {
        function_63ca4d21d4429d06();
    }
    
    /#
        helptext = "<dev string:x24>";
        var_32dbca3143d9c4a5 = level.sharedfuncs[ #"fre" ][ #"registercommand" ];
        
        if ( isdefined( var_32dbca3143d9c4a5 ) )
        {
            level [[ var_32dbca3143d9c4a5 ]]( "<dev string:x53>", "<dev string:x6c>", &function_a62924e6174e41b2, helptext, "<dev string:x70>", undefined );
        }
        
        helptext = "<dev string:x24>";
        var_32dbca3143d9c4a5 = level.sharedfuncs[ #"fre" ][ #"registercommand" ];
        
        if ( isdefined( var_32dbca3143d9c4a5 ) )
        {
            level [[ var_32dbca3143d9c4a5 ]]( "<dev string:x7b>", "<dev string:x6c>", &function_cb08ebe5746ea9cf, helptext, "<dev string:x70>", undefined );
        }
        
        helptext = "<dev string:x95>";
        var_32dbca3143d9c4a5 = level.sharedfuncs[ #"fre" ][ #"registercommand" ];
        
        if ( isdefined( var_32dbca3143d9c4a5 ) )
        {
            level [[ var_32dbca3143d9c4a5 ]]( "<dev string:xc3>", "<dev string:x6c>", &function_3a8a0dc23d62d364, helptext, "<dev string:x70>", undefined );
        }
        
        helptext = "<dev string:xdf>";
        var_32dbca3143d9c4a5 = level.sharedfuncs[ #"fre" ][ #"registercommand" ];
        
        if ( isdefined( var_32dbca3143d9c4a5 ) )
        {
            level [[ var_32dbca3143d9c4a5 ]]( "<dev string:x10f>", "<dev string:x6c>", &function_ab4b66e887c5fd07, helptext, "<dev string:x70>", undefined );
        }
        
        helptext = "<dev string:x12d>";
        var_32dbca3143d9c4a5 = level.sharedfuncs[ #"fre" ][ #"registercommand" ];
        
        if ( isdefined( var_32dbca3143d9c4a5 ) )
        {
            level [[ var_32dbca3143d9c4a5 ]]( "<dev string:x153>", "<dev string:x6c>", &function_6d4831ac497ffca5, helptext, "<dev string:x70>", undefined );
        }
        
        helptext = "<dev string:x169>";
        var_32dbca3143d9c4a5 = level.sharedfuncs[ #"fre" ][ #"registercommand" ];
        
        if ( isdefined( var_32dbca3143d9c4a5 ) )
        {
            level [[ var_32dbca3143d9c4a5 ]]( "<dev string:x1a1>", "<dev string:x6c>", &function_2b777fb3d23eb424, helptext, "<dev string:x70>", [ "<dev string:x1bb>", "<dev string:x1c8>" ] );
        }
        
        helptext = "<dev string:x1d3>";
        var_32dbca3143d9c4a5 = level.sharedfuncs[ #"fre" ][ #"registercommand" ];
        
        if ( isdefined( var_32dbca3143d9c4a5 ) )
        {
            level [[ var_32dbca3143d9c4a5 ]]( "<dev string:x20b>", "<dev string:x6c>", &function_2b777fb3d23eb424, helptext, "<dev string:x70>", [ "<dev string:x1bb>", "<dev string:x225>" ] );
        }
        
        helptext = "<dev string:x230>";
        var_32dbca3143d9c4a5 = level.sharedfuncs[ #"fre" ][ #"registercommand" ];
        
        if ( isdefined( var_32dbca3143d9c4a5 ) )
        {
            level [[ var_32dbca3143d9c4a5 ]]( "<dev string:x269>", "<dev string:x6c>", &function_2b777fb3d23eb424, helptext, "<dev string:x70>", [ "<dev string:x1bb>", "<dev string:x284>" ] );
        }
    #/
}

// Namespace frune_shootable_target
// Params 0, eflags: 0x4
// Checksum 0xcb598655, Offset: 0xad0
// Size: 0x45b
function private function_3b762fbb6fcf17d5()
{
    modeinfo = game[ #"frune_tuning" ];
    modeinfo.var_ceab04bdf86e1fbc.var_ede031eed94ec85d = utility::array_combine_multiple( [ getscriptablearray( "scriptable_mp_sat_free_run_evo_dynamic_platform_128_01", #classname ), getscriptablearray( "scriptable_mp_sat_free_run_evo_dynamic_platform_128_01_walljump", #classname ), getscriptablearray( "scriptable_mp_sat_free_run_evo_dynamic_platform_256x128_01", #classname ), getscriptablearray( "scriptable_mp_sat_free_run_evo_dynamic_platform_walljump_64_01", #classname ), getscriptablearray( "scriptable_mp_sat_free_run_evo_dynamic_portal", #classname ) ] );
    
    foreach ( var_e71993bad4d6941a in modeinfo.var_ceab04bdf86e1fbc.var_ede031eed94ec85d )
    {
        if ( var_e71993bad4d6941a.script_linkname )
        {
            splitname = strtok( var_e71993bad4d6941a.script_linkname, "_" );
            
            if ( splitname.size == 3 )
            {
                var_e71993bad4d6941a.script_parameters = splitname[ 1 ] + "_" + splitname[ 2 ];
            }
        }
        
        if ( var_e71993bad4d6941a.script_linkto )
        {
            splitname = strtok( var_e71993bad4d6941a.script_linkto, "_" );
            
            if ( splitname.size > 0 )
            {
                var_e71993bad4d6941a.portalnumber = int( splitname[ splitname.size - 1 ] );
            }
        }
        
        var_e71993bad4d6941a.var_45f78fafefe8c95 = var_e71993bad4d6941a.script_parameters != #"switchable_off";
        var_e71993bad4d6941a.pulsepart = var_e71993bad4d6941a.var_45f78fafefe8c95 ? #"activation_hides_me" : #"activation_shows_me";
        
        if ( var_e71993bad4d6941a.classname == "scriptable_mp_sat_free_run_evo_dynamic_portal" )
        {
            var_e71993bad4d6941a.var_56211def389f795a = 1;
            var_e71993bad4d6941a.activatefunc = var_e71993bad4d6941a.var_45f78fafefe8c95 ? &function_511126ab12bb08c : &function_340c16dfe49340f;
            var_e71993bad4d6941a.deactivatefunc = var_e71993bad4d6941a.var_45f78fafefe8c95 ? &function_340c16dfe49340f : &function_511126ab12bb08c;
            var_e71993bad4d6941a.portalparts = getentarray( var_e71993bad4d6941a.targetname, #targetname );
            portalindex = var_e71993bad4d6941a.portalnumber ?? 1;
            visiblestate = modeinfo.var_ceab04bdf86e1fbc.var_d9fa10a4746200c2[ portalindex ];
            hiddenstate = modeinfo.var_ceab04bdf86e1fbc.var_46680bfc4fc20a85[ portalindex ];
            var_e71993bad4d6941a.deactivestate = var_e71993bad4d6941a.var_45f78fafefe8c95 ? visiblestate : hiddenstate;
            var_e71993bad4d6941a.activestate = var_e71993bad4d6941a.var_45f78fafefe8c95 ? hiddenstate : visiblestate;
            
            foreach ( part in var_e71993bad4d6941a.portalparts )
            {
                portals::function_c2784dc7bd1c4dba( part, #"frune_portal", #"on" );
            }
        }
        else
        {
            var_e71993bad4d6941a.var_56211def389f795a = 0;
            var_e71993bad4d6941a.deactivestate = var_e71993bad4d6941a.var_45f78fafefe8c95 ? #"switchable_on" : #"switchable_off";
            var_e71993bad4d6941a.activestate = var_e71993bad4d6941a.var_45f78fafefe8c95 ? #"switchable_off" : #"switchable_on";
        }
        
        var_e71993bad4d6941a.unresolved_collision_func = &function_354789391e742e23;
        function_957a6918b4d92340( var_e71993bad4d6941a );
    }
    
    level scriptable::scriptable_addnotifycallback( "target_damaged", &target_damaged );
}

// Namespace frune_shootable_target
// Params 4, eflags: 0x4
// Checksum 0xd522fa04, Offset: 0xf33
// Size: 0x32
function private target_damaged( shootabletarget, str_note, n_param, var_533710b0b76c405a )
{
    shootabletarget thread function_3db52fbe0253a958( shootabletarget, var_533710b0b76c405a );
}

// Namespace frune_shootable_target
// Params 2, eflags: 0xc
// Checksum 0x7bdf8dcb, Offset: 0xf6d
// Size: 0x343
function private function_3db52fbe0253a958( shootabletarget, playershooter )
{
    self notify( #"hash_ff090bc820f29938" );
    self endon( #"hash_ff090bc820f29938" );
    
    if ( !shootabletarget.target )
    {
        assertmsg( "<dev string:x290>" );
        return;
    }
    
    playershooter gameplay_sound_fx::playlocalsoundfx( #"target_hit" );
    gameplay_sound_fx::function_760dbc73d1362ab9( #"hash_73e81466a6042cb0", playershooter, shootabletarget.entity );
    playershooter damagefeedback::updatehitmarker( "standard", 0, 0, 1, undefined, 0, 0, undefined, 1 );
    
    if ( !isdefined( shootabletarget.var_ede031eed94ec85d ) )
    {
        shootabletarget.var_ede031eed94ec85d = getscriptablearray( shootabletarget.target, "targetname" );
    }
    
    foreach ( var_e71993bad4d6941a in shootabletarget.var_ede031eed94ec85d )
    {
        function_1e5e0f1459e05657( var_e71993bad4d6941a );
    }
    
    currenttimems = gettime();
    shootabletarget.var_24d8fe86ffbaa866 = currenttimems;
    modeinfo = game[ #"frune_tuning" ];
    var_7ad0491d8fa29199 = modeinfo.var_21a2ecc610b6e93d;
    activedurationms = utility::function_4b74c15943231980( var_7ad0491d8fa29199 );
    endtimems = shootabletarget.var_24d8fe86ffbaa866 + activedurationms;
    countdownpartname = function_92e9a93997b4c80( var_7ad0491d8fa29199 );
    
    if ( shootabletarget.var_7cc29191b416e8cf )
    {
        shootabletarget setscriptablepartstate( countdownpartname, #"active_countdown_disabled" );
        waitframe();
        shootabletarget.var_7cc29191b416e8cf = 0;
    }
    
    shootabletarget utility::function_32b24db3127bff40( countdownpartname, #"active_countdown_start" );
    
    while ( shootabletarget && currenttimems < endtimems )
    {
        remainingms = endtimems - currenttimems;
        
        if ( remainingms <= 5000 && !shootabletarget.var_7cc29191b416e8cf )
        {
            shootabletarget.var_7cc29191b416e8cf = 1;
            
            foreach ( var_e71993bad4d6941a in shootabletarget.var_ede031eed94ec85d )
            {
                var_e71993bad4d6941a thread function_94eac324ef8bd1c7( var_e71993bad4d6941a );
            }
        }
        
        waitframe();
        currenttimems = gettime();
    }
    
    if ( !shootabletarget )
    {
        return;
    }
    
    shootabletarget setscriptablepartstate( countdownpartname, #"active_countdown_disabled" );
    
    foreach ( var_e71993bad4d6941a in shootabletarget.var_ede031eed94ec85d )
    {
        function_957a6918b4d92340( var_e71993bad4d6941a );
    }
}

// Namespace frune_shootable_target
// Params 0, eflags: 0x4
// Checksum 0x3ff4a5f1, Offset: 0x12b8
// Size: 0x7b
function private function_340c16dfe49340f()
{
    foreach ( part in self.portalparts )
    {
        portals::portal_enable( part );
    }
}

// Namespace frune_shootable_target
// Params 0, eflags: 0x4
// Checksum 0x762811fe, Offset: 0x133b
// Size: 0x7b
function private function_511126ab12bb08c()
{
    foreach ( part in self.portalparts )
    {
        portals::portal_disable( part );
    }
}

// Namespace frune_shootable_target
// Params 1, eflags: 0x4
// Checksum 0x57c5f6d3, Offset: 0x13be
// Size: 0x29
function private function_c06e22ac1971702d( var_e71993bad4d6941a )
{
    var_e71993bad4d6941a utility::function_32b24db3127bff40( var_e71993bad4d6941a.pulsepart, #"pulse_lowest" );
}

// Namespace frune_shootable_target
// Params 1, eflags: 0x4
// Checksum 0x2937ad95, Offset: 0x13ef
// Size: 0x29
function private function_bce7367e3b7c6a9b( var_e71993bad4d6941a )
{
    var_e71993bad4d6941a utility::function_32b24db3127bff40( var_e71993bad4d6941a.pulsepart, #"pulse_low" );
}

// Namespace frune_shootable_target
// Params 1, eflags: 0x4
// Checksum 0x2e7cb92d, Offset: 0x1420
// Size: 0x29
function private function_3195456db42423a4( var_e71993bad4d6941a )
{
    var_e71993bad4d6941a utility::function_32b24db3127bff40( var_e71993bad4d6941a.pulsepart, #"pulse_medium" );
}

// Namespace frune_shootable_target
// Params 1, eflags: 0x4
// Checksum 0x1bbd019, Offset: 0x1451
// Size: 0x29
function private function_32149843fc27e8d7( var_e71993bad4d6941a )
{
    var_e71993bad4d6941a utility::function_32b24db3127bff40( var_e71993bad4d6941a.pulsepart, #"pulse_high" );
}

// Namespace frune_shootable_target
// Params 1, eflags: 0x4
// Checksum 0xfecb64ab, Offset: 0x1482
// Size: 0x29
function private function_e9b94dd72f4422f6( var_e71993bad4d6941a )
{
    var_e71993bad4d6941a utility::function_32b24db3127bff40( var_e71993bad4d6941a.pulsepart, #"base" );
}

// Namespace frune_shootable_target
// Params 1, eflags: 0xc
// Checksum 0x17095c15, Offset: 0x14b3
// Size: 0xeb
function private function_94eac324ef8bd1c7( var_e71993bad4d6941a )
{
    self notify( #"hash_7b1506d7be4b81a1" );
    self endon( #"hash_7b1506d7be4b81a1" );
    modeinfo = game[ #"frune_tuning" ];
    pauses = modeinfo.var_ceab04bdf86e1fbc.var_3ea570ed347afd4c;
    function_c06e22ac1971702d( var_e71993bad4d6941a );
    wait pauses.longpause;
    function_c06e22ac1971702d( var_e71993bad4d6941a );
    wait pauses.longpause;
    function_bce7367e3b7c6a9b( var_e71993bad4d6941a );
    wait pauses.medpause;
    function_bce7367e3b7c6a9b( var_e71993bad4d6941a );
    wait pauses.medpause;
    function_3195456db42423a4( var_e71993bad4d6941a );
    wait pauses.shortpause;
    function_32149843fc27e8d7( var_e71993bad4d6941a );
    wait pauses.var_9e0c6372dbdc5aaa;
    gameplay_sound_fx::function_760dbc73d1362ab9( #"hash_db459da4a605d07f", undefined, var_e71993bad4d6941a );
}

// Namespace frune_shootable_target
// Params 2, eflags: 0x4
// Checksum 0xa98fdb88, Offset: 0x15a6
// Size: 0x34
function private function_354789391e742e23( player, penetration )
{
    if ( !isplayer( player ) || !isalive( player ) )
    {
        return;
    }
    
    frune_checkpoints::function_aae76b5997fc6288( player );
}

// Namespace frune_shootable_target
// Params 1, eflags: 0x4
// Checksum 0x265789d3, Offset: 0x15e2
// Size: 0x71
function private function_957a6918b4d92340( var_e71993bad4d6941a )
{
    var_e71993bad4d6941a.activated = 0;
    var_e71993bad4d6941a utility::function_32b24db3127bff40( #"base", var_e71993bad4d6941a.deactivestate );
    var_e71993bad4d6941a utility::function_32b24db3127bff40( var_e71993bad4d6941a.pulsepart, #"base" );
    
    if ( var_e71993bad4d6941a.deactivatefunc )
    {
        var_e71993bad4d6941a [[ var_e71993bad4d6941a.deactivatefunc ]]();
    }
}

// Namespace frune_shootable_target
// Params 1, eflags: 0x4
// Checksum 0x603e8d6e, Offset: 0x165b
// Size: 0x72
function private function_1e5e0f1459e05657( var_e71993bad4d6941a )
{
    var_e71993bad4d6941a.activated = 1;
    var_e71993bad4d6941a utility::function_32b24db3127bff40( #"base", var_e71993bad4d6941a.activestate );
    var_e71993bad4d6941a utility::function_32b24db3127bff40( var_e71993bad4d6941a.pulsepart, #"base" );
    
    if ( var_e71993bad4d6941a.activatefunc )
    {
        var_e71993bad4d6941a [[ var_e71993bad4d6941a.activatefunc ]]();
    }
}

// Namespace frune_shootable_target
// Params 1, eflags: 0x4
// Checksum 0x14f8b1bc, Offset: 0x16d5
// Size: 0x3b
function private function_92e9a93997b4c80( durationseconds )
{
    modeinfo = game[ #"frune_tuning" ];
    return modeinfo.var_ceab04bdf86e1fbc.var_ff8a76bf4f768eee[ durationseconds ];
}

// Namespace frune_shootable_target
// Params 0, eflags: 0x4
// Checksum 0x44f2ad09, Offset: 0x1719
// Size: 0x118
function private function_63ca4d21d4429d06()
{
    grappletargets = getentarray( "grapple_target", #script_noteworthy );
    
    foreach ( grapple in grappletargets )
    {
        grapple enableaimassist();
    }
    
    shootabletargets = getscriptablearray( "scriptable_mp_sat_freerun_shootable_target_01", #classname );
    
    foreach ( shootable in shootabletargets )
    {
        shootable enableaimassist();
    }
}

/#

    // Namespace frune_shootable_target
    // Params 1, eflags: 0x4
    // Checksum 0xe111d5cf, Offset: 0x1839
    // Size: 0xe5, Type: dev
    function private function_f335b9e816cb6f9b( var_e71993bad4d6941a )
    {
        iprintlnbold( "<dev string:x2dd>" );
        function_c06e22ac1971702d( var_e71993bad4d6941a );
        wait 1.2;
        function_c06e22ac1971702d( var_e71993bad4d6941a );
        wait 1.2;
        function_c06e22ac1971702d( var_e71993bad4d6941a );
        wait 2;
        iprintlnbold( "<dev string:x2e4>" );
        function_bce7367e3b7c6a9b( var_e71993bad4d6941a );
        wait 1.2;
        function_bce7367e3b7c6a9b( var_e71993bad4d6941a );
        wait 1.2;
        function_bce7367e3b7c6a9b( var_e71993bad4d6941a );
        wait 2;
        iprintlnbold( "<dev string:x2e8>" );
        function_3195456db42423a4( var_e71993bad4d6941a );
        wait 1;
        function_3195456db42423a4( var_e71993bad4d6941a );
        wait 1;
        function_3195456db42423a4( var_e71993bad4d6941a );
        wait 2;
        iprintlnbold( "<dev string:x2ef>" );
        function_32149843fc27e8d7( var_e71993bad4d6941a );
        wait 1;
        function_32149843fc27e8d7( var_e71993bad4d6941a );
        wait 1;
        function_32149843fc27e8d7( var_e71993bad4d6941a );
    }

    // Namespace frune_shootable_target
    // Params 2, eflags: 0x4
    // Checksum 0x36246358, Offset: 0x1926
    // Size: 0xa8, Type: dev
    function private function_a62924e6174e41b2( host, args )
    {
        foreach ( var_e71993bad4d6941a in game[ #"frune_tuning" ].var_ceab04bdf86e1fbc.var_ede031eed94ec85d )
        {
            var_e71993bad4d6941a thread function_f335b9e816cb6f9b( var_e71993bad4d6941a );
        }
    }

    // Namespace frune_shootable_target
    // Params 2, eflags: 0x4
    // Checksum 0x6a37fb3c, Offset: 0x19d6
    // Size: 0xa8, Type: dev
    function private function_cb08ebe5746ea9cf( host, args )
    {
        foreach ( var_e71993bad4d6941a in game[ #"frune_tuning" ].var_ceab04bdf86e1fbc.var_ede031eed94ec85d )
        {
            var_e71993bad4d6941a thread function_94eac324ef8bd1c7( var_e71993bad4d6941a );
        }
    }

    // Namespace frune_shootable_target
    // Params 2, eflags: 0x4
    // Checksum 0x7a33517c, Offset: 0x1a86
    // Size: 0xa7, Type: dev
    function private function_3a8a0dc23d62d364( host, args )
    {
        foreach ( var_e71993bad4d6941a in game[ #"frune_tuning" ].var_ceab04bdf86e1fbc.var_ede031eed94ec85d )
        {
            function_1e5e0f1459e05657( var_e71993bad4d6941a );
        }
    }

    // Namespace frune_shootable_target
    // Params 2, eflags: 0x4
    // Checksum 0x7c3623a4, Offset: 0x1b35
    // Size: 0xa7, Type: dev
    function private function_ab4b66e887c5fd07( host, args )
    {
        foreach ( var_e71993bad4d6941a in game[ #"frune_tuning" ].var_ceab04bdf86e1fbc.var_ede031eed94ec85d )
        {
            function_957a6918b4d92340( var_e71993bad4d6941a );
        }
    }

    // Namespace frune_shootable_target
    // Params 2, eflags: 0x4
    // Checksum 0xc0397981, Offset: 0x1be4
    // Size: 0xbd, Type: dev
    function private function_2b777fb3d23eb424( host, args )
    {
        foreach ( var_e71993bad4d6941a in game[ #"frune_tuning" ].var_ceab04bdf86e1fbc.var_ede031eed94ec85d )
        {
            if ( var_e71993bad4d6941a.var_56211def389f795a == 1 )
            {
                var_e71993bad4d6941a setscriptablepartstate( args[ 0 ], args[ 1 ] );
            }
        }
    }

    // Namespace frune_shootable_target
    // Params 2, eflags: 0x4
    // Checksum 0x9fa67d3e, Offset: 0x1ca9
    // Size: 0x5a, Type: dev
    function private function_6d4831ac497ffca5( host, args )
    {
        var_8005b965951cc17 = namespace_ec33f26de741e14e::function_7fb3afaa98ee9eeb( "<dev string:x6c>" );
        var_8005b965951cc17.var_8fcf2b52f9758be6 = !var_8005b965951cc17.var_8fcf2b52f9758be6;
        level thread function_aaa3de1f1252b9c5( var_8005b965951cc17.var_8fcf2b52f9758be6 );
    }

    // Namespace frune_shootable_target
    // Params 1, eflags: 0xc
    // Checksum 0x14014cfb, Offset: 0x1d0b
    // Size: 0x11f, Type: dev
    function private function_aaa3de1f1252b9c5( enabled )
    {
        self notify( #"hash_4dfe4400d5e1c071" );
        self endon( #"hash_4dfe4400d5e1c071" );
        
        if ( !enabled )
        {
            return;
        }
        
        modeinfo = game[ #"frune_tuning" ];
        
        while ( true )
        {
            player = level.players[ 0 ];
            
            if ( !player )
            {
                waitframe();
                continue;
            }
            
            foreach ( var_e71993bad4d6941a in modeinfo.var_ceab04bdf86e1fbc.var_ede031eed94ec85d )
            {
                distancesq = distancesquared( player.origin, var_e71993bad4d6941a.origin );
                
                if ( distancesq < 5000000 )
                {
                    function_4ef14bce51cb46a0( var_e71993bad4d6941a );
                }
            }
            
            waitframe();
        }
    }

    // Namespace frune_shootable_target
    // Params 1, eflags: 0x4
    // Checksum 0xbd1086fd, Offset: 0x1e32
    // Size: 0x24c, Type: dev
    function private function_4ef14bce51cb46a0( var_e71993bad4d6941a )
    {
        origin = var_e71993bad4d6941a.origin;
        
        if ( !isdefined( var_e71993bad4d6941a.var_839601c38f7d03c3 ) )
        {
            var_e71993bad4d6941a.var_839601c38f7d03c3 = "<dev string:x2f4>" + var_e71993bad4d6941a.targetname;
        }
        
        if ( !isdefined( var_e71993bad4d6941a.var_3ac74be058460aeb ) )
        {
            var_e71993bad4d6941a.var_3ac74be058460aeb = "<dev string:x301>" + ( var_e71993bad4d6941a.var_56211def389f795a == 1 ? "<dev string:x308>" : "<dev string:x30f>" ) + ( var_e71993bad4d6941a.var_45f78fafefe8c95 ? "<dev string:x318>" : "<dev string:x32b>" );
        }
        
        activatedtext = "<dev string:x33e>" + ( var_e71993bad4d6941a.activated ? "<dev string:x34a>" : "<dev string:x34f>" );
        
        foreach ( part in var_e71993bad4d6941a.portalparts )
        {
            debugcolor = var_e71993bad4d6941a.activated ? ( 0.5, 0.5, 1 ) : ( 1, 0, 0 );
            drawtrigger( part, debugcolor, 1 );
        }
        
        print3d( origin, var_e71993bad4d6941a.var_839601c38f7d03c3, ( 1, 1, 1 ), 1, 1, 1, 1 );
        print3d( origin + ( 0, 0, -20 ), var_e71993bad4d6941a.var_3ac74be058460aeb, ( 1, 1, 1 ), 1, 1, 1, 1 );
        print3d( origin + ( 0, 0, -40 ), activatedtext, ( 1, 1, 1 ), 1, 1, 1, 1 );
        box( origin, 0, ( 0, 0, 1 ), 0, 1 );
        drawtrigger( var_e71993bad4d6941a, ( 0, 0, 1 ), 1 );
    }

#/
