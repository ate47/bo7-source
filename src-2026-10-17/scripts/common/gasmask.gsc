#using script_16ea1b94f0f381b3;
#using scripts\common\callbacks;
#using scripts\common\utility;

#namespace gasmask;

// Namespace gasmask
// Params 3
// Checksum 0x72923d96, Offset: 0x2fb
// Size: 0x23d
function init( gasmaskhealth, gasmasktype, gasmaskmaxhealth )
{
    gasmaskid = 2;
    
    if ( gasmasktype == "brloot_equip_gasmask_durable" )
    {
        gasmaskid = 4;
        self.usingscubagasmask = 1;
        
        if ( self isswimunderwater() )
        {
            utility::callsharedfunc( #"scubagasmask", #"updatescubagasmask", self, 1 );
        }
    }
    else if ( gasmasktype == "rex_loot_hazmat_suit" )
    {
        gasmaskid = 3;
        self.usinghazmat = 1;
    }
    else
    {
        if ( self.usingscubagasmask )
        {
            self.usingscubagasmask = undefined;
            utility::callsharedfunc( #"scubagasmask", #"updatescubagasmask", self, 0 );
        }
        
        if ( utility::callsharedfunc( #"game", #"iscommonitemenabled" ) && gasmasktype == "wz_consumable_gas_mask_durable" || gasmasktype == "brloot_equip_gasmask_durable" )
        {
            gasmaskid = 3;
        }
    }
    
    isbr = isbrgamemode();
    
    if ( !isdefined( level.gasmask_resist ) )
    {
        if ( isdefined( level.gametypebundle ) && isdefined( level.gametypebundle.gasmaskresistance ) )
        {
            level.gasmask_resist = level.gametypebundle.gasmaskresistance;
        }
        else if ( isbr )
        {
            level.gasmask_resist = getdvarfloat( @"scr_br_gasmask_resist", 0 );
        }
        else
        {
            level.gasmask_resist = 0.2;
        }
    }
    
    maxhealth = gasmaskmaxhealth ?? getmaxhealth( gasmasktype );
    self.gasmaskhealth = maxhealth;
    self.gasmaskmaxhealth = maxhealth;
    self.gasmasktype = gasmasktype ?? "brloot_equip_gasmask";
    
    if ( self.usingscubagasmask )
    {
        thread utility::callsharedfunc( #"scubagasmask", #"monitorscubagasmaskdamage" );
    }
    
    if ( isdefined( gasmaskhealth ) )
    {
        self.gasmaskhealth = gasmaskhealth;
    }
    
    if ( isbr )
    {
        level.gasmaskhealthperpip = self.gasmaskhealth / 6;
    }
    
    level.gasmaskmaxhealth = maxhealth;
    self setclientomnvar( "ui_head_equip_class", gasmaskid );
    self setclientomnvar( "ui_gasmask_damage", self.gasmaskhealth / maxhealth );
}

// Namespace gasmask
// Params 0
// Checksum 0xacc0945, Offset: 0x540
// Size: 0x1a5
function function_a6b8d9d080e2e59a()
{
    if ( !isdefined( level.headgeardata ) )
    {
        level waittill( #"headgear_init" );
    }
    
    level.var_83525e0328004d3f = 1;
    gasmaskdata = spawnstruct();
    gasmaskdata.hasheadgearfunc = &hasgasmask;
    gasmaskdata.var_e59404adc566edd0 = &isgasmaskequipped;
    gasmaskdata.var_abc222b77737dfda = &function_55a08fb1a7d0aac5;
    gasmaskdata.var_f8afa4b15f2dfd1a = &function_dc1842f4eec31f5c;
    gasmaskdata.var_cbdf8c6be6174cc = &function_2dbe13ebabc803b4;
    gasmaskdata.var_d8ed88d301c75991 = &getgasmaskhealth;
    gasmaskdata.var_7058909c0850f32f = &init;
    gasmaskdata.breakfunc = utility::getsharedfunc( #"gasmask", #"breakgasmask" );
    gasmaskdata.var_395e196a7eb5381e = utility::getsharedfunc( #"gasmask", #"hash_59aa8233cd359656" );
    gasmaskdata.var_4e4dc022e7622dde = utility::getsharedfunc( #"gasmask", #"hash_4750baa59df72a2a" );
    gasmaskdata.var_c615929c785b38db = &preequipgasmask;
    gasmaskdata.var_ef9b6239a74b7964 = utility::getsharedfunc( #"gasmask", #"equipgasmask" );
    gasmaskdata.preremovefunc = &preremovegasmask;
    gasmaskdata.onremovefunc = utility::getsharedfunc( #"gasmask", #"removegasmask" );
    utility::callsharedfunc( #"headgear", #"registerheadgear", "gas_mask", gasmaskdata );
}

// Namespace gasmask
// Params 0
// Checksum 0x7fe4ea09, Offset: 0x6ed
// Size: 0x81
function ai_init()
{
    self.has_gasmask = 1;
    self.gasmaskhealth = 180;
    mask_model = spawn( "script_model", ( 0, 0, 0 ) );
    mask_model setmodel( "hat_gasmask" );
    mask_model linkto( self, "j_head", ( 7, 0, 0 ), ( 0, 0, 0 ) );
    self.gasmask = mask_model;
    function_5f739a0a0a2956d3( mask_model );
}

// Namespace gasmask
// Params 1
// Checksum 0x7afd3142, Offset: 0x776
// Size: 0x2d
function function_5f739a0a0a2956d3( mask )
{
    self waittill( #"death" );
    
    if ( isdefined( mask ) )
    {
        mask unlink();
        mask hide();
    }
}

// Namespace gasmask
// Params 1
// Checksum 0x9ff19488, Offset: 0x7ab
// Size: 0xe6
function getmaxhealth( gasmaskscriptablename )
{
    maxhealth = undefined;
    isbr = isbrgamemode();
    
    if ( isdefined( gasmaskscriptablename ) )
    {
        if ( isbr )
        {
            loottablehealthoverride = level.br_pickups.counts[ gasmaskscriptablename ];
            
            if ( isdefined( loottablehealthoverride ) )
            {
                maxhealth = loottablehealthoverride;
            }
            else
            {
                switch ( gasmaskscriptablename )
                {
                    case #"hash_d01e387e6d238502":
                        maxhealth = 216;
                        break;
                    default:
                        break;
                }
            }
        }
        else
        {
            switch ( gasmaskscriptablename )
            {
                case #"hash_d01e387e6d238502":
                    maxhealth = 216;
                    break;
                default:
                    break;
            }
        }
    }
    
    if ( !isdefined( maxhealth ) )
    {
        isbr = isbrgamemode();
        
        if ( isbr )
        {
            maxhealth = getdvarint( @"hash_acad4ff93022ff44", 108 );
        }
        else
        {
            maxhealth = 180;
        }
    }
    
    return maxhealth;
}

// Namespace gasmask
// Params 1
// Checksum 0x19ff715f, Offset: 0x89a
// Size: 0x78
function getscriptablename( var_4d74ae33dcab9527 )
{
    gasmaskscriptablename = undefined;
    
    switch ( var_4d74ae33dcab9527 )
    {
        case #"hash_2d1a1b811aed6b26":
        case #"hash_4808e1f340e11163":
        case #"hash_dcf82d1f65a6b16e":
            gasmaskscriptablename = "brloot_equip_gasmask";
            break;
        case #"hash_d01e387e6d238502":
            gasmaskscriptablename = "brloot_equip_gasmask_durable";
            break;
        default:
            break;
    }
    
    return gasmaskscriptablename;
}

// Namespace gasmask
// Params 1
// Checksum 0x4f2156b0, Offset: 0x91b
// Size: 0x337
function processdamage( damage )
{
    if ( !isdefined( self.gasmaskhealth ) )
    {
        return;
    }
    
    isbr = isbrgamemode();
    isdmz = isdmzgamemode();
    var_e193bb4f858859d2 = self.gasmaskhealth / self.gasmaskmaxhealth;
    self.gasmaskhealth -= damage;
    self.gasmaskhealth = int( max( 0, self.gasmaskhealth ) );
    
    if ( isbr )
    {
        gasmaskhealthpercentage = ( self.gasmaskhealth + 1 ) / self.gasmaskmaxhealth;
    }
    else
    {
        gasmaskhealthpercentage = self.gasmaskhealth / self.gasmaskmaxhealth;
    }
    
    gasmaskhealthpercentage = clamp( gasmaskhealthpercentage, 0, 1 );
    self setclientomnvar( "ui_gasmask_damage", gasmaskhealthpercentage );
    
    if ( utility::callsharedfunc( #"gasmask", #"iscrackenabled" ) )
    {
        crackthresholdone = utility::callsharedfunc( #"gasmask", #"crackthresholdone" );
        crackthresholdtwo = utility::callsharedfunc( #"gasmask", #"crackthresholdtwo" );
        
        if ( self.gasmaskhealth <= self.gasmaskmaxhealth * crackthresholdone && self.gasmaskhealth + damage >= self.gasmaskmaxhealth * crackthresholdone )
        {
            setbrokenoverlaymaterial( "gasmask_overlay_delta2_crack_stage1" );
        }
        else if ( self.gasmaskhealth <= self.gasmaskmaxhealth * crackthresholdtwo && self.gasmaskhealth + damage >= self.gasmaskmaxhealth * crackthresholdtwo )
        {
            setbrokenoverlaymaterial( "gasmask_overlay_delta2_crack_stage2" );
        }
    }
    
    if ( self.gasmaskhealth <= 0 )
    {
        if ( isbr && utility::issharedfuncdefined( #"gasmask", #"breakgasmaskbr" ) )
        {
            self [[ utility::getsharedfunc( #"gasmask", #"breakgasmaskbr" ) ]]();
        }
        else if ( isdefined( level.gasmaskbreakfunc ) )
        {
            self [[ level.gasmaskbreakfunc ]]();
        }
        else
        {
            breakgasmask();
        }
        
        callback::callback( #"gasmask_broken", {} );
    }
    else if ( isbr || isdmz )
    {
        oldpips = floor( var_e193bb4f858859d2 * 6 + 0.5 );
        newpips = floor( gasmaskhealthpercentage * 6 + 0.5 );
        
        if ( oldpips > newpips )
        {
            namespace_9d8e359c3b1041e5::playsoundtoplayersharedfunc( "br_gas_mask_crack_plr", self );
        }
    }
    
    if ( !isdefined( self.gasdamagebuffer ) )
    {
        self.gasdamagebuffer = 0;
    }
    
    assert( isdefined( level.gasmask_resist ), "<dev string:x24>" );
    self.gasdamagebuffer += damage * level.gasmask_resist;
    damagetoplayer = floor( self.gasdamagebuffer );
    
    if ( damagetoplayer >= 1 )
    {
        self dodamage( damagetoplayer, self.origin, self, undefined, "MOD_TRIGGER_HURT" );
        self.gasdamagebuffer -= damagetoplayer;
    }
}

// Namespace gasmask
// Params 1
// Checksum 0xf4e3d86a, Offset: 0xc5a
// Size: 0x79
function aiprocessdamage( damage )
{
    self.gasmaskhealth -= damage;
    self.gasmaskhealth = max( 0, self.gasmaskhealth );
    
    if ( self.gasmaskhealth <= 0 )
    {
        if ( isdefined( self.gasmask ) )
        {
            self.gasmask unlink();
            self.gasmask hide();
            self.has_gasmask = 0;
        }
    }
}

// Namespace gasmask
// Params 2
// Checksum 0xec79e3ac, Offset: 0xcdb
// Size: 0xb3, Type: bool
function didgasmaskpipschange( oldhealth, newhealth )
{
    isbr = isbrgamemode();
    
    if ( !isbr )
    {
        return false;
    }
    
    if ( !isdefined( self.gasmaskmaxhealth ) )
    {
        self.gasmaskmaxhealth = getdvarint( @"hash_acad4ff93022ff44", 108 );
    }
    
    oldhealthpercentage = oldhealth / self.gasmaskmaxhealth;
    newhealthpercentage = newhealth / self.gasmaskmaxhealth;
    oldpips = floor( oldhealthpercentage * 6 + 0.5 );
    newpips = floor( newhealthpercentage * 6 + 0.5 );
    return oldpips != newpips;
}

// Namespace gasmask
// Params 0
// Checksum 0x71d82a9a, Offset: 0xd97
// Size: 0xdf
function equipgasmask()
{
    self endon( #"death_or_disconnect" );
    namespace_9d8e359c3b1041e5::playsoundtoplayersharedfunc( "br_gas_mask_on_plr", self );
    weaponnone = makeweapon( "none" );
    curweap = self getcurrentweapon();
    
    if ( !issameweapon( curweap, weaponnone ) )
    {
        utility::callsharedfunc( #"gasmask", #"playequipgesture", 1 );
    }
    
    self.gasmaskswapinprogress = 1;
    wait 0.338;
    self.gasmaskswapinprogress = 0;
    self.gasmaskequipped = 1;
    utility::callsharedfunc( #"gasmask", #"toggleloopingcoughaudiosupression", 1 );
    self attach( "hat_gasmask" );
    createoverlay();
    utility::callsharedfunc( #"gasmask", #"hash_cc0d1013d30337b6", 1 );
    self notify( #"gasmask_equipped" );
}

// Namespace gasmask
// Params 0
// Checksum 0x8e75370c, Offset: 0xe7e
// Size: 0xe9
function removegasmask()
{
    self endon( #"death_or_disconnect" );
    
    if ( !self.gasmaskequipped )
    {
        return;
    }
    
    namespace_9d8e359c3b1041e5::playsoundtoplayersharedfunc( "br_gas_mask_off_plr", self );
    weaponnone = makeweapon( "none" );
    curweap = self getcurrentweapon();
    
    if ( !issameweapon( curweap, weaponnone ) )
    {
        utility::callsharedfunc( #"gasmask", #"playequipgesture", 0 );
    }
    
    self.gasmaskswapinprogress = 1;
    wait 0.521;
    self.gasmaskswapinprogress = 0;
    self.gasmaskequipped = 0;
    utility::callsharedfunc( #"gasmask", #"toggleloopingcoughaudiosupression", 0 );
    self detach( "hat_gasmask" );
    destroyoverlay();
    utility::callsharedfunc( #"gasmask", #"hash_cc0d1013d30337b6", 0 );
    self notify( #"hash_c6f4cec6ea11211d" );
}

// Namespace gasmask
// Params 0
// Checksum 0xa9f088e1, Offset: 0xf6f
// Size: 0x84
function breakgasmask()
{
    if ( !self.gasmaskequipped )
    {
        return;
    }
    
    self.gasmaskequipped = 0;
    namespace_9d8e359c3b1041e5::playsoundtoplayersharedfunc( "br_gas_mask_break_plr", self );
    self detach( "hat_gasmask" );
    destroyoverlay();
    utility::callsharedfunc( #"gasmask", #"hash_cc0d1013d30337b6", 0 );
    namespace_9d8e359c3b1041e5::playsoundtoplayersharedfunc( "br_gas_mask_depleted_plr", self );
    self setclientomnvar( "ui_head_equip_class", 0 );
    self setclientomnvar( "ui_gasmask_damage", 0 );
    self notify( #"hash_c6f4cec6ea11211d" );
}

// Namespace gasmask
// Params 2
// Checksum 0xe0f4e807, Offset: 0xffb
// Size: 0x22c
function createoverlay( fadeintime, delaytime )
{
    self.gasmaskoverlay = newclienthudelem( self );
    self.gasmaskoverlay.x = 0;
    self.gasmaskoverlay.y = 0;
    self.gasmaskoverlay.alignx = "left";
    self.gasmaskoverlay.aligny = "top";
    self.gasmaskoverlay.horzalign = "fullscreen";
    self.gasmaskoverlay.vertalign = "fullscreen";
    self.gasmaskoverlay setshader( "gasmask_overlay_delta2", 640, 480 );
    self.gasmaskoverlay.sort = -10;
    self.gasmaskoverlay.archived = 1;
    
    if ( isbrgamemode() )
    {
        self.gasmaskoverlay.alpha = 0;
        
        if ( isdefined( fadeintime ) )
        {
            if ( isdefined( delaytime ) )
            {
                wait delaytime;
            }
            
            if ( isdefined( self.gasmaskoverlay ) )
            {
                self.gasmaskoverlay fadeovertime( fadeintime );
            }
        }
    }
    
    if ( utility::callsharedfunc( #"gasmask", #"iscrackenabled" ) )
    {
        crackthresholdone = utility::callsharedfunc( #"gasmask", #"crackthresholdone" );
        crackthresholdtwo = utility::callsharedfunc( #"gasmask", #"crackthresholdtwo" );
        
        if ( self.gasmaskhealth <= self.gasmaskmaxhealth * crackthresholdtwo )
        {
            setbrokenoverlaymaterial( "gasmask_overlay_delta2_crack_stage2" );
        }
        else if ( self.gasmaskhealth <= self.gasmaskmaxhealth * crackthresholdone )
        {
            setbrokenoverlaymaterial( "gasmask_overlay_delta2_crack_stage1" );
        }
    }
    
    if ( isdefined( self.gasmaskoverlay ) )
    {
        self.gasmaskoverlay.alpha = 1;
        self.gasmaskoverlay.lowresbackground = 1;
    }
}

// Namespace gasmask
// Params 1
// Checksum 0x595c9141, Offset: 0x122f
// Size: 0x51
function setbrokenoverlaymaterial( material )
{
    if ( isdefined( self.gasmaskoverlay ) )
    {
        if ( isdefined( material ) )
        {
            self.gasmaskoverlay setshader( material, 640, 480 );
            return;
        }
        
        self.gasmaskoverlay setshader( "gasmask_overlay_delta2_broken", 640, 480 );
    }
}

// Namespace gasmask
// Params 1
// Checksum 0xd159d4bf, Offset: 0x1288
// Size: 0x4e
function fadeoutoverlay( fadeouttime )
{
    self.gasmaskoverlay.alpha = 1;
    self.gasmaskoverlay fadeovertime( fadeouttime );
    self.gasmaskoverlay.alpha = 0;
}

// Namespace gasmask
// Params 2
// Checksum 0xcfe400f5, Offset: 0x12de
// Size: 0x89
function destroyoverlay( fadeouttime, delaytime )
{
    level endon( #"game_ended" );
    self endon( #"death_or_disconnect" );
    
    if ( !isdefined( self.gasmaskoverlay ) )
    {
        return;
    }
    
    if ( isdefined( fadeouttime ) )
    {
        if ( isdefined( delaytime ) )
        {
            wait delaytime;
        }
        
        if ( isdefined( self.gasmaskoverlay ) )
        {
            fadeoutoverlay( fadeouttime );
            wait fadeouttime;
        }
    }
    
    if ( isdefined( self.gasmaskoverlay ) )
    {
        self.gasmaskoverlay destroy();
        self.gasmaskoverlay = undefined;
    }
}

// Namespace gasmask
// Params 1
// Checksum 0xa087658e, Offset: 0x136f
// Size: 0x18, Type: bool
function hasgasmask( player )
{
    return isdefined( player.gasmaskhealth );
}

// Namespace gasmask
// Params 1
// Checksum 0x6a62cd4b, Offset: 0x1390
// Size: 0x18, Type: bool
function isgasmaskequipped( player )
{
    return istrue( player.gasmaskequipped );
}

// Namespace gasmask
// Params 1
// Checksum 0x8754b35b, Offset: 0x13b1
// Size: 0x19, Type: bool
function function_a062bf98847b605a( player )
{
    return player.gasmaskhealth > 0;
}

// Namespace gasmask
// Params 1
// Checksum 0xd12d6f2d, Offset: 0x13d3
// Size: 0x23
function function_2dbe13ebabc803b4( player )
{
    if ( hasgasmask( player ) )
    {
        return player.gasmasktype;
    }
}

// Namespace gasmask
// Params 1
// Checksum 0x1cba52, Offset: 0x13ff
// Size: 0x24
function getgasmaskhealth( player )
{
    if ( function_a062bf98847b605a( player ) )
    {
        return player.gasmaskhealth;
    }
    
    return 0;
}

// Namespace gasmask
// Params 2
// Checksum 0x62f89f8c, Offset: 0x142c
// Size: 0x4c, Type: bool
function function_dc1842f4eec31f5c( player, pickupent )
{
    if ( !isdefined( player.gasmaskhealth ) || self.gasmaskhealth == 0 )
    {
        return true;
    }
    
    return pickupent.count > self.gasmaskhealth;
}

// Namespace gasmask
// Params 0
// Checksum 0xa7c80d86, Offset: 0x1481
// Size: 0x20
function cleanupgasmask()
{
    self.gasmaskmaxhealth = undefined;
    self.gasmaskhealth = undefined;
    self.gasmaskrequests = undefined;
}

// Namespace gasmask
// Params 0
// Checksum 0x402d8eda, Offset: 0x14a9
// Size: 0x26
function function_6f9e12e52b89a696()
{
    self setclientomnvar( "ui_gas_mask", 0 );
    self setclientomnvar( "ui_head_equip_class", 0 );
    self setclientomnvar( "ui_gasmask_damage", 0 );
}

// Namespace gasmask
// Params 0
// Checksum 0x618e775, Offset: 0x14d7
// Size: 0xc, Type: bool
function function_55a08fb1a7d0aac5()
{
    return istrue( level.var_c7bf4af6240a235 );
}

// Namespace gasmask
// Params 2
// Checksum 0x615fe71e, Offset: 0x14ec
// Size: 0x3d
function function_ba4f9bbecefee262( amount, time )
{
    level endon( #"game_ended" );
    self endon( #"disconnect" );
    wait time;
    self setclientomnvar( "ui_gas_mask_opacity_override", amount );
}

// Namespace gasmask
// Params 0
// Checksum 0x7817e63f, Offset: 0x1531
// Size: 0x3c
function preequipgasmask()
{
    equipgesturelength = self getgestureanimlength( "iw9_vm_ges_gasmask_on" );
    overlayfadetime = equipgesturelength * 0.35;
    thread function_ba4f9bbecefee262( level.var_c623a0da9f4c58f4, overlayfadetime );
}

// Namespace gasmask
// Params 0
// Checksum 0x9df578e, Offset: 0x1575
// Size: 0x34
function preremovegasmask()
{
    fadeouttime = self getgestureanimlength( "iw9_vm_ges_gasmask_off" );
    overlayfadetime = fadeouttime * 0.35;
    thread function_ba4f9bbecefee262( 0, overlayfadetime );
}

// Namespace gasmask
// Params 1
// Checksum 0xed743d64, Offset: 0x15b1
// Size: 0x58
function function_e949a578c3db30d( player )
{
    delaygesture = 0;
    delaygesture |= player isreloading();
    delaygesture |= player isthrowinggrenade();
    delaygesture |= player isdiving();
    delaygesture |= player issprintsliding();
    delaygesture |= player playerads() > 0.5;
    return delaygesture;
}

