#using scripts\common\callbacks;
#using scripts\cp_mp\challenges;

#namespace slayer;

// Namespace slayer
// Params 0, eflags: 0x1
// Checksum 0x30ba5c77, Offset: 0x150
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &function_3610ed5e20015d0d );
}

// Namespace slayer
// Params 1
// Checksum 0xcbaf8b9, Offset: 0x170
// Size: 0xb3
function function_3610ed5e20015d0d( params )
{
    bundle = level.perkbundles[ "specialty_slayer" ];
    
    if ( !isdefined( bundle ) )
    {
        return;
    }
    
    if ( !function_c28ff33f9f675615() )
    {
        function_79901b4637c83c86( #"hash_c3a607f53cc111e5" );
        return;
    }
    
    if ( isdefined( params.var_a2358848c4408242 ) )
    {
        level [[ params.var_a2358848c4408242 ]]( "specialty_slayer", &function_70db77a030244410, &function_8c52af1e3de6309 );
    }
    
    if ( isdefined( params.var_5109b530c69d18a1 ) )
    {
        level [[ params.var_5109b530c69d18a1 ]]( "specialty_slayer", &slayer_onkill );
    }
    
    callback::add( #"hash_6a8a551945faab9", &function_930290e469b15dee );
}

// Namespace slayer
// Params 0
// Checksum 0x1efd1921, Offset: 0x22b
// Size: 0xc
function function_70db77a030244410()
{
    self.var_63490a14ef1618a3 = 0;
}

// Namespace slayer
// Params 0
// Checksum 0x439af450, Offset: 0x23f
// Size: 0x12
function function_8c52af1e3de6309()
{
    function_fb60303c4964c516( 0 );
    slayer_resetfov( 0 );
}

// Namespace slayer
// Params 1
// Checksum 0x902b3561, Offset: 0x259
// Size: 0x12e
function slayer_onkill( params )
{
    smeansofdeath = params.smeansofdeath ?? "";
    
    if ( smeansofdeath == "MOD_MELEE" )
    {
        return;
    }
    
    if ( smeansofdeath == "MOD_MELEE_TAKEDOWN" )
    {
        return;
    }
    
    if ( smeansofdeath == "MOD_EXECUTION" )
    {
        return;
    }
    
    self notify( "slayeronkill_buff" );
    function_6e31d9bc7fd20582();
    function_e2513a6ee2a0c07a();
    var_2c124e2ccc1e8842 = level.sharedfuncs[ #"perk" ][ #"hash_5c931797494661ab" ];
    
    if ( isdefined( var_2c124e2ccc1e8842 ) )
    {
        bundle = level.perkbundles[ "specialty_slayer" ];
        
        foreach ( var_6769521a9cab5947 in bundle.var_ee1c92198ad66b2f )
        {
            self [[ var_2c124e2ccc1e8842 ]]( bundle, var_6769521a9cab5947.var_fbd59bd982c1fe7c );
        }
    }
}

// Namespace slayer
// Params 1, eflags: 0xc
// Checksum 0x277ca74d, Offset: 0x38f
// Size: 0x58
function private function_4fcca85696da9c8c( buffduration )
{
    self notify( "b0e6d50877247bcd" );
    self endon( "b0e6d50877247bcd" );
    self endon( "disconnect" );
    
    if ( !isdefined( self.var_f05d2dfb2652889f ) )
    {
        self.var_f05d2dfb2652889f = 0;
    }
    
    self.var_f05d2dfb2652889f++;
    challenges::function_8118ace38657d9b1();
    wait buffduration;
    self.var_f05d2dfb2652889f = undefined;
}

// Namespace slayer
// Params 0
// Checksum 0xe2ae4f44, Offset: 0x3ef
// Size: 0xb0
function function_6e31d9bc7fd20582()
{
    bundle = level.perkbundles[ "specialty_slayer" ];
    buffduration = bundle.var_3e9a5e1e49abdd29 ?? 0;
    thread function_4fcca85696da9c8c( buffduration );
    
    if ( !isdefined( self.cranked ) )
    {
        self.var_63490a14ef1618a3 = 1;
        thread function_fb60303c4964c516( buffduration );
        var_f427dd18ac2fe135 = level.sharedfuncs[ #"playerhealth" ][ #"hash_edc16c12ca11400" ];
        
        if ( isdefined( var_f427dd18ac2fe135 ) )
        {
            self [[ var_f427dd18ac2fe135 ]]( #"hash_d00fd8ba30a6f44e", bundle.var_8dd8d1fb73e2f4e4 ?? 0.5 );
        }
    }
}

// Namespace slayer
// Params 1
// Checksum 0x3f817b0e, Offset: 0x4a7
// Size: 0x6c
function function_fb60303c4964c516( delaytime )
{
    if ( delaytime )
    {
        self endon( "slayeronkill_buff" );
        self endon( "death_or_disconnect" );
        wait delaytime;
    }
    
    self.var_63490a14ef1618a3 = 0;
    var_1c2fdadc1c73aca8 = level.sharedfuncs[ #"playerhealth" ][ #"hash_325a50f0cddc1ff" ];
    
    if ( isdefined( var_1c2fdadc1c73aca8 ) )
    {
        self [[ var_1c2fdadc1c73aca8 ]]( #"hash_d00fd8ba30a6f44e" );
    }
}

// Namespace slayer
// Params 0
// Checksum 0x734fc16b, Offset: 0x51b
// Size: 0x54
function function_e2513a6ee2a0c07a()
{
    bundle = level.perkbundles[ "specialty_slayer" ];
    buffduration = bundle.var_3e9a5e1e49abdd29 ?? 0;
    self setclientomnvar( "ui_slayerBuff", 1 );
    self function_a508a08653df6bcc( 1 );
    thread slayer_resetfov( buffduration );
}

// Namespace slayer
// Params 1
// Checksum 0x46df9fdb, Offset: 0x577
// Size: 0x4d
function slayer_resetfov( delaytime )
{
    if ( delaytime )
    {
        self endon( "slayeronkill_buff" );
        self endon( "death_or_disconnect" );
        wait delaytime;
    }
    
    self setclientomnvar( "ui_slayerBuff", 0 );
    self function_a508a08653df6bcc( 0 );
    self lerpfovbypreset( "slayer_zoom_out" );
    self playlocalsound( "mpl_slayer_end" );
}

// Namespace slayer
// Params 1
// Checksum 0x72885742, Offset: 0x5cc
// Size: 0x67
function function_930290e469b15dee( params )
{
    if ( self.var_63490a14ef1618a3 )
    {
        bundle = level.perkbundles[ "specialty_slayer" ];
        var_4646a7e478dea931 = bundle.var_c7220e6a9cc42223 ?? 1;
        params.var_2b32a8de075bfd54 *= var_4646a7e478dea931;
    }
}

