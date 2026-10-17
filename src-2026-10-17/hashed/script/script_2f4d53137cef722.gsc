#using scripts\common\system;
#using scripts\common\utility;
#using scripts\mp\loot\common_item;
#using scripts\mp\zm\ztron\ztron_enemy;
#using scripts\mp\zm\ztron\ztron_item;
#using scripts\mp\zm\ztron\ztron_sound;
#using scripts\mp\zm\ztron\ztron_utility;

#namespace namespace_88f2add1d48c436f;

// Namespace namespace_88f2add1d48c436f
// Params 0, eflags: 0x5
// Checksum 0x1cafad63, Offset: 0x1e8
// Size: 0x21
function private autoexec __init__system__()
{
    system::register( #"hash_545448d41287bf68", #"ztron_item", undefined, &init );
}

// Namespace namespace_88f2add1d48c436f
// Params 0
// Checksum 0x630baa83, Offset: 0x211
// Size: 0x64
function init()
{
    ztron_item::function_5844a9c240f7dc8d( #"present", #"use", &usepresent );
    utility::add_fx( "ztron_present_fireworks", "vfx_sat_zm_racing_shooting_fireworks_ztron" );
    ztron_sound::function_4ac735395b173fe( "present_explo_spider_OS", "evt_ztron_pickup_giftbox_explode" );
    ztron_sound::function_4ac735395b173fe( "present_explo_good_OS", "evt_ztron_pickup_giftbox_fireworks" );
    ztron_sound::function_4ac735395b173fe( "present_open_OS", "evt_ztron_pickup_giftbox_activated" );
}

#using_animtree( "script_model" );

// Namespace namespace_88f2add1d48c436f
// Params 1, eflags: 0x4
// Checksum 0x6c88dfc9, Offset: 0x27d
// Size: 0xec
function private usepresent( params )
{
    item = params.scriptable;
    player = params.player;
    model = "sat_zm_ztron_props_christmas_gift_01";
    animlength = getanimlength( %sat_fxanim_zm_ztron_props_treasure_chest_mid );
    currentangles = item.angles ?? ( 0, 0, 0 );
    present = utility::spawn_model( model, item.origin, currentangles );
    
    if ( isdefined( present ) )
    {
        present notsolid();
        ztron_sound::ztron_playsound( "present_open_OS", undefined, present );
        present scriptmodelplayanim( "sat_fxanim_zm_ztron_props_treasure_chest_mid" );
        wait animlength;
        present thread ztron_util::function_2dcb2513692d8ffa();
        present thread spawnpresent( present.origin, player );
    }
}

// Namespace namespace_88f2add1d48c436f
// Params 2, eflags: 0x4
// Checksum 0x6007ea50, Offset: 0x371
// Size: 0x128
function private spawnpresent( origin, player )
{
    spawnorigin = ztron_util::function_3fe38741460a4a49( origin ) + ( 0, 0, 10 );
    roll = randomint( 100 );
    
    if ( isdefined( player ) && player.ztron.var_2588c7465d7536b2 & 67108864 )
    {
        roll = 100;
    }
    
    if ( roll < 60 )
    {
        enemydef = ztron_enemy::function_96eea0d09d5640d1( "vermin" );
        ztron_enemy::function_77e1bf43b991b4a( enemydef, 1, spawnorigin, 32, undefined, player, undefined, level.ztron.active_arena, undefined, -1, 1, 1 );
        ztron_sound::ztron_playsound( "present_explo_spider_OS", origin );
        return;
    }
    
    playfx( utility::getfx( "ztron_present_fireworks" ), spawnorigin );
    ztron_sound::ztron_playsound( "present_explo_good_OS", origin );
    spawnoptions = ztron_item::function_41854e96b8bf4a06( spawnorigin );
    var_88547c4c73c3ec02 = common_item::items_selectfromlist( %"hash_36ec19d99e4268df", 1 )[ 0 ];
    ztron_item::requestspawnitem( var_88547c4c73c3ec02, spawnorigin, 32, spawnoptions );
}

