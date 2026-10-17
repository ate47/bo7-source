#using scripts\common\callbacks;
#using scripts\common\utility;
#using scripts\mp\currency;

#namespace powerup_double_points_br;

// Namespace powerup_double_points_br
// Params 0, eflags: 0x1
// Checksum 0xa5ab5158, Offset: 0xab
// Size: 0x2d
function autoexec main()
{
    if ( getdvarint( @"scr_br_powerups_enabled", 0 ) && !getdvarint( @"scr_disable_powerup_double_points", 0 ) )
    {
        init();
    }
}

// Namespace powerup_double_points_br
// Params 0
// Checksum 0xa9f2b851, Offset: 0xe0
// Size: 0x50
function init()
{
    if ( getdvarint( @"hash_f7312ea7e2b40e54", 1 ) )
    {
        utility::registersharedfunc( #"powerup_double_points", #"apply_effect", &apply_effect );
        utility::registersharedfunc( #"powerup_double_points", #"remove_effect", &remove_effect );
    }
}

// Namespace powerup_double_points_br
// Params 0
// Checksum 0x9f48e363, Offset: 0x138
// Size: 0x27
function apply_effect()
{
    if ( !callback::exists( "currency_add", &double_currency_pickup ) )
    {
        callback::add( "currency_add", &double_currency_pickup );
    }
}

// Namespace powerup_double_points_br
// Params 0
// Checksum 0xaec708c, Offset: 0x167
// Size: 0x13
function remove_effect()
{
    callback::remove( "currency_add", &double_currency_pickup );
}

// Namespace powerup_double_points_br
// Params 1
// Checksum 0xff8e6c51, Offset: 0x182
// Size: 0xd3
function double_currency_pickup( params )
{
    if ( params.spawningteam )
    {
        return;
    }
    
    currency::function_9f4bd7c92079e530( params.amount, params.currencytype );
    var_4c48fad50fa1fc28 = [];
    fake_pickup = spawnstruct();
    fake_pickup.count = params.amount;
    fake_pickup.ref = params.ref ?? "wz_consumable_plunder_legendary_1";
    var_4c48fad50fa1fc28[ var_4c48fad50fa1fc28.size ] = fake_pickup;
    
    if ( utility::issharedfuncdefined( #"game", #"showstocklootfeed" ) && var_4c48fad50fa1fc28.size > 0 )
    {
        level thread [[ utility::getsharedfunc( #"game", #"showstocklootfeed" ) ]]( self, var_4c48fad50fa1fc28 );
    }
}

