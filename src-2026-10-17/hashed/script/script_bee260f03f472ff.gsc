#using script_2aa77b5f4dfc2051;
#using script_3c8ea7f78632414c;
#using script_400030cfadc03f31;
#using script_46881a911642c15b;
#using script_4d5934d09ed188d8;
#using script_5925e714a9b193a8;
#using script_695729716dc6f653;
#using script_82cbfe0aa31e91f;
#using scripts\common\script;
#using scripts\common\utility;
#using scripts\common\vehicle;
#using scripts\mp\hud_util;
#using scripts\mp\loot\common_item;
#using scripts\mp\objidpoolmanager;
#using scripts\mp\vehicles\damage;

#namespace namespace_a30dcdead1a3bf54;

// Namespace namespace_a30dcdead1a3bf54
// Params 0, eflags: 0x1
// Checksum 0x959848b4, Offset: 0x22d
// Size: 0x17
function autoexec main()
{
    br_publicevents::function_54d95495df246a2b( %"champion_chopper", &init );
}

// Namespace namespace_a30dcdead1a3bf54
// Params 1
// Checksum 0x88af47e6, Offset: 0x24c
// Size: 0x46
function init( eventinfo )
{
    eventinfo.activatefunc = &activatefunc;
    eventinfo.waitfunc = &waitfunc;
    eventinfo.postinitfunc = &postinitfunc;
    thread chopperinit();
}

// Namespace namespace_a30dcdead1a3bf54
// Params 0
// Checksum 0xd44fbab, Offset: 0x29a
// Size: 0xe2
function chopperinit()
{
    setdvar( hashcat( @"scr_", "chopper", "_disabled" ), 1 );
    setdvar( @"hash_fb9f16d91bcc8a8", 0 );
    setdvar( @"hash_85e8885fce5027e7", "veh_airdrop_escort_champion_phys" );
    setdvar( @"hash_fad92b3f5a4631f2", "veh9_mil_air_heli_hind_champion_weapons" );
    level.var_7b6fcaa8e75ec93e = &function_301dea8397df89e7;
    level.var_6006bb980952f429 = &function_1a82341d8134c141;
    
    if ( getdvarint( @"hash_58163c73f7fbab8c", 0 ) )
    {
        utility::registersharedfunc( #"br_lootchopper", #"championchopper_oncrateuse", &function_378206e8a0a84ec8 );
    }
    
    level dmz_bosses::initbosses();
    
    /#
        dmz_bosses::init_dev_gui( "<dev string:x24>" );
    #/
    
    boss = level.bosses[ "chopper" ];
    [[ boss.initfunc ]]( boss );
}

// Namespace namespace_a30dcdead1a3bf54
// Params 0
// Checksum 0xf0531b01, Offset: 0x384
// Size: 0x2
function postinitfunc()
{
    
}

// Namespace namespace_a30dcdead1a3bf54
// Params 0
// Checksum 0xef32c4e9, Offset: 0x38e
// Size: 0x2f
function waitfunc()
{
    level endon( #"game_ended" );
    level endon( #"cancel_public_event" );
    eventstarttime = calculateeventstarttime();
    wait eventstarttime;
}

// Namespace namespace_a30dcdead1a3bf54
// Params 0
// Checksum 0x71c6e67c, Offset: 0x3c5
// Size: 0x56
function activatefunc()
{
    level endon( #"game_ended" );
    hud_util::showsplashtoall( "br_champion_chopper_event_start" );
    br_public::brleaderdialog( "public_events_choppers_start" );
    setomnvar( "ui_minimap_pulse", 1 );
    numchoppers = getdvarint( @"hash_2b0e04a31a35cc57", 1 );
    spawnchoppers( numchoppers );
}

// Namespace namespace_a30dcdead1a3bf54
// Params 0
// Checksum 0xd1847529, Offset: 0x423
// Size: 0x4b
function calculateeventstarttime()
{
    minstarttime = getdvarfloat( @"hash_43560f4e801b8dda", 60 );
    maxstarttime = getdvarfloat( @"hash_4378f94e8041a530", 120 );
    
    if ( maxstarttime > minstarttime )
    {
        return randomfloatrange( minstarttime, maxstarttime );
    }
    
    return minstarttime;
}

// Namespace namespace_a30dcdead1a3bf54
// Params 1
// Checksum 0xa2dede1c, Offset: 0x476
// Size: 0x89
function spawnchoppers( numchoppers )
{
    safepois = function_d81b3eadda290694();
    
    if ( numchoppers > safepois.size )
    {
        assertmsg( "<dev string:x2c>" + numchoppers + "<dev string:x4c>" + safepois.size );
        numchoppers = safepois.size;
    }
    
    for ( i = 0; i < numchoppers ; i++ )
    {
        bossloc = spawnstruct();
        bossloc.origin = safepois[ i ];
        dmz_bosses::spawnboss( "chopper", bossloc );
    }
}

// Namespace namespace_a30dcdead1a3bf54
// Params 0
// Checksum 0xff8540bc, Offset: 0x507
// Size: 0x95
function function_d81b3eadda290694()
{
    safepois = [];
    
    foreach ( origin in level.poi_origins )
    {
        if ( br_circle::ispointincurrentsafecircle( origin ) )
        {
            safepois[ safepois.size ] = origin;
        }
    }
    
    return arrayrandomize( safepois );
}

// Namespace namespace_a30dcdead1a3bf54
// Params 1
// Checksum 0xcdbf85a0, Offset: 0x5a5
// Size: 0x8b
function function_301dea8397df89e7( chopperinstance )
{
    chopper = chopperinstance.chopper;
    damage::set_death_callback( chopper vehicle::get_ref(), &chopper_handledeathdamage );
    chopper.lootfunc = &chopperdroploot;
    chopper playloopsound( "br_heli_infil_hero_lp" );
    objidnum = chopperinstance.objidnum;
    objidpoolmanager::update_objective_icon( objidnum, "hud_icon_minimap_vehicle_heli_hind" );
    objidpoolmanager::update_objective_ownerteam( objidnum, chopper.team );
}

// Namespace namespace_a30dcdead1a3bf54
// Params 0
// Checksum 0x7af75e03, Offset: 0x638
// Size: 0x98
function chopperdroploot()
{
    if ( getdvarint( @"hash_58163c73f7fbab8c", 0 ) )
    {
        droplocation = br_lootchopper::lootchopper_finddroplocation( self.origin + ( 0, 0, 500 ) );
        
        if ( isdefined( droplocation ) )
        {
            plundercrate = airdrop::dropbrlootchoppercrateforpublicevent( self.origin, droplocation );
            plundercrate.usetimeoverride = 10;
        }
        else
        {
            assertmsg( "<dev string:x5c>" + self.origin );
        }
    }
    
    playsoundatpos( self.origin, "ks_support_chopper_explode" );
}

// Namespace namespace_a30dcdead1a3bf54
// Params 1
// Checksum 0xa5f07530, Offset: 0x6d8
// Size: 0xf4
function function_378206e8a0a84ec8( player )
{
    var_5f01d9b22205d080 = "mp/loot/br/champion_mgl/lootset_supply_drop_boss.csv";
    common_item::function_45c338c4003d5f13( self, 0 );
    pickupents = [];
    script::demoforcesre( "Removed br_lootcache code here. Create script cache key(s) to spawn items if needed." );
    
    foreach ( ent in pickupents )
    {
        ent.lootsource = "c130_box";
    }
    
    if ( !isdefined( player.lootcachesopened ) )
    {
        player.lootcachesopened = 1;
    }
    else
    {
        player.lootcachesopened++;
    }
    
    player thread points::doscoreevent( #"hash_6499ce3d42f1c7d2" );
}

// Namespace namespace_a30dcdead1a3bf54
// Params 1
// Checksum 0xabf867d2, Offset: 0x7d4
// Size: 0x79, Type: bool
function chopper_handledeathdamage( data )
{
    instance = self.bossinstance;
    
    if ( isdefined( instance ) )
    {
        instance notify( #"boss_death" );
        instance.killed = 1;
        instance.killer = data.attacker;
    }
    
    chopper_support::choppersupport_handledeathdamage( data );
    function_4310b0f912543a7f( data );
    self notify( #"death" );
    return true;
}

// Namespace namespace_a30dcdead1a3bf54
// Params 1
// Checksum 0xe6849dca, Offset: 0x856
// Size: 0x5e
function function_4310b0f912543a7f( data )
{
    team = data.attacker.team;
    chopper = self;
    
    if ( !isstring( team ) )
    {
        return;
    }
    
    data.attacker thread points::doscoreevent( #"hash_adb08e37172d8ef2" );
}

// Namespace namespace_a30dcdead1a3bf54
// Params 2
// Checksum 0xe6a5fe2c, Offset: 0x8bc
// Size: 0x63
function function_1a82341d8134c141( chopperinstance, player )
{
    bossname = chopperinstance.name;
    boss = level.bosses[ bossname ];
    
    if ( isdefined( boss.revealfunc ) )
    {
        chopperinstance [[ boss.revealfunc ]]( player, 0 );
    }
}

