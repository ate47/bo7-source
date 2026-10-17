#using script_28320ecc98c34e49;
#using script_2db0f4bfa718d997;
#using script_49e4a4c208f44b76;
#using script_4a3480d2e0833b9b;
#using script_4f9ce8d249a99f4a;
#using script_5925e714a9b193a8;
#using script_629fd7d4479d556d;
#using script_734dce84c468439b;
#using script_7acec0c0a67ad677;
#using scripts\common\utility;
#using scripts\common\weapon;
#using scripts\mp\ammorestock;
#using scripts\mp\damagefeedback;
#using scripts\mp\dmz\modified_values;
#using scripts\mp\equipment;
#using scripts\mp\flags;
#using scripts\mp\hud_message;
#using scripts\mp\loot\common_item;
#using scripts\mp\loot\common_item_ammo;
#using scripts\mp\weapons;

#namespace ammorestock_br;

// Namespace ammorestock_br
// Params 6
// Checksum 0x6e1dd648, Offset: 0xfa
// Size: 0x180
function ammorestock_used( instance, part, state, player, bautouse, usestring )
{
    assert( part == "<dev string:x24>" );
    assert( isbrgamemode() || isdmzgamemode() );
    
    if ( getdvarint( @"hash_e67cc751b30803f0", 1 ) == 1 )
    {
        instance.bundle = level.superglobals.staticsuperdata[ "super_ammo_drop" ].bundle;
        result = function_77af101874575b10( player, instance );
    }
    else
    {
        result = ammorestock_playeruse_br( player, instance );
    }
    
    if ( result == 1 )
    {
        brgametype = game_utility::getgametype();
        
        if ( flags::gameflag( "prematch_done" ) && brgametype != "plunder" && brgametype != "risk" )
        {
            thread ammorestock::ammorestock_disableusefortime( instance, player, 0.1 );
            thread ammorestock::function_2c7ced6e527ed331( player, instance, getdvarint( @"ammorestockcooldown", 60 ) );
        }
        else
        {
            thread ammorestock::ammorestock_disableusefortime( instance, player, 0.1 );
            thread ammorestock::function_2c7ced6e527ed331( player, instance, getdvarint( @"ammorestockcooldown", 20 ) );
        }
        
        return;
    }
    
    if ( result == 0 )
    {
        thread ammorestock::ammorestock_disableusefortime( instance, player, 0.1 );
        return;
    }
    
    thread ammorestock::ammorestock_disableusefortime( instance, player, 0.1 );
}

// Namespace ammorestock_br
// Params 2
// Checksum 0x14aca571, Offset: 0x282
// Size: 0x2f9
function function_77af101874575b10( player, instance )
{
    guid = player player::getuniqueid();
    
    if ( !isdefined( level.var_c95a4556478f1db8[ guid ] ) )
    {
        level.var_c95a4556478f1db8[ guid ] = [];
    }
    
    if ( instance.var_6781e08eb60ecad5 )
    {
        player hud_message::showerrormessage( %"hash_c0a57d023241a0c" );
        player playlocalsound( "fly_pickup_deny" );
        return 3;
    }
    
    if ( player.ammo_cache_disabled )
    {
        player hud_message::showerrormessage( %"mp/cannot_use_generic" );
        player playlocalsound( "fly_pickup_deny" );
        return 4;
    }
    
    if ( isdefined( level.var_c95a4556478f1db8[ guid ][ instance.index ] ) )
    {
        player hud_message::showerrormessage( %"hash_34bae2bc2335a31a", int( ( level.var_c95a4556478f1db8[ guid ][ instance.index ] - gettime() ) / 1000 ) );
        player playlocalsound( "fly_pickup_deny" );
        return 2;
    }
    
    var_4c48fad50fa1fc28 = [];
    startorigin = instance.origin + ( 0, 0, 30 );
    direction_to_player = vectornormalize( player.origin - startorigin );
    spawndistance = 90;
    endorigin = startorigin + direction_to_player * spawndistance;
    spawnoptions = common_item::function_f5dfaa3bbdf99a33( endorigin, startorigin );
    spawnoptions.var_9161cf0784b6951d = 0;
    spawnoptions.var_7a5f61b06b9371b5 = 1;
    spawnoptions.var_2321e933cbdf46d8 = 30;
    spawnoptions.var_34444f0dda11f0d5 = 18;
    spawnoptions.var_fc803688fa7c976c = 0;
    spawnoptions.var_10a99b46418cef2 = [];
    spawnoptions.spawningentity = instance;
    spawnoptions.ignoreents = [ instance ];
    spawnoptions.var_fd76732c1cbd4b05 = 1;
    var_4c48fad50fa1fc28 = instance br::function_eda453b0a2202cbd( player, spawnoptions, var_4c48fad50fa1fc28 );
    var_4c48fad50fa1fc28 = instance br::function_4568d30da6d65aee( player, spawnoptions, var_4c48fad50fa1fc28 );
    
    if ( instance.bundle.var_c41f9e7b40296bcc && level.armorbundlename && instance.bundle.var_96d7e6390e9aa98e > 0 )
    {
        itembundle = common_item::function_90c3e0c1fd55d6b6( level.armorbundlename );
        var_604f0c18c62fb804 = max( 0, int( player modified_values::function_14d05d73e63e1f9e( 11, instance.bundle.var_96d7e6390e9aa98e ) ) );
        armoritem = common_item::function_77600f92048df72d( itembundle, var_604f0c18c62fb804 );
        player common_item::function_41751a7f86839f01( armoritem, undefined, 1, undefined, undefined, spawnoptions );
    }
    
    player damagefeedback::hudicontype( "br_ammo" );
    level thread showstocklootfeed_br( player, var_4c48fad50fa1fc28 );
    
    if ( !isdmzgamemode() )
    {
        player playlocalsound( "fly_pickup_ammo_gen" );
    }
    
    return 1;
}

// Namespace ammorestock_br
// Params 2
// Checksum 0xec1b6055, Offset: 0x584
// Size: 0x76e
function ammorestock_playeruse_br( player, instance )
{
    guid = player player::getuniqueid();
    
    if ( !isdefined( level.var_c95a4556478f1db8[ guid ] ) )
    {
        level.var_c95a4556478f1db8[ guid ] = [];
    }
    
    if ( instance.var_6781e08eb60ecad5 )
    {
        player hud_message::showerrormessage( %"hash_c0a57d023241a0c" );
        player playlocalsound( "fly_pickup_deny" );
        return 3;
    }
    
    if ( isdefined( level.var_c95a4556478f1db8[ guid ][ instance.index ] ) )
    {
        player hud_message::showerrormessage( %"hash_34bae2bc2335a31a", int( ( level.var_c95a4556478f1db8[ guid ][ instance.index ] - gettime() ) / 1000 ) );
        player playlocalsound( "fly_pickup_deny" );
        return 2;
    }
    
    allweaps = player getweaponslistprimaries();
    var_f3f1ae1911b3c3c6 = [];
    
    foreach ( item in allweaps )
    {
        if ( !weapon::ismeleeonly( item ) && !weapon::issuperweapon( item ) && !weapon::iskillstreakweapon( item ) && !weapon::isgamemodeweapon( item ) )
        {
            var_f3f1ae1911b3c3c6[ var_f3f1ae1911b3c3c6.size ] = item;
        }
    }
    
    if ( player killstreak::isjuggernaut() )
    {
        if ( !isdefined( allweaps ) || allweaps.size == 0 )
        {
            minigun = player getcurrentweapon();
            var_83a8675f9e45e80d = player getcurrentweaponclipammo();
            var_6021453cd8e527b4 = weaponclipsize( minigun );
            
            if ( var_83a8675f9e45e80d < var_6021453cd8e527b4 )
            {
                player setweaponammoclip( minigun, var_6021453cd8e527b4 );
                player damagefeedback::hudicontype( "br_ammo" );
                player playlocalsound( "fly_pickup_ammo_gen" );
                return 1;
            }
        }
    }
    
    var_9ef2cd94e9696703 = 1;
    
    foreach ( weaponobj in var_f3f1ae1911b3c3c6 )
    {
        if ( weapon::isaxeweapon( weaponobj ) )
        {
            if ( player getweaponammoclip( weaponobj ) < weaponclipsize( weaponobj ) )
            {
                var_9ef2cd94e9696703 = 0;
                break;
            }
        }
        
        if ( utility::callsharedfunc( #"game", #"iscommonitemenabled" ) )
        {
            if ( player item_ammo::function_9aecfd8b12f7ed0e( weaponobj ) > player getweaponammostock( weaponobj ) )
            {
                var_9ef2cd94e9696703 = 0;
                break;
            }
            
            continue;
        }
        
        currenttype = br_weapons::br_ammo_type_for_weapon( weaponobj );
        
        if ( isdefined( currenttype ) )
        {
            if ( level.var_9a6a4b42eba220f6[ currenttype ] > player getweaponammostock( weaponobj ) )
            {
                var_9ef2cd94e9696703 = 0;
                break;
            }
        }
    }
    
    primaryequipment = player equipment_mp::getcurrentequipment( "primary" );
    secondaryequipment = player equipment_mp::getcurrentequipment( "secondary" );
    var_64475d2b78c272c3 = function_5713d46873b29625( [ primaryequipment, secondaryequipment ] );
    var_762b07a736c2f8d6 = 1;
    
    foreach ( equipment in var_64475d2b78c272c3 )
    {
        var_c8eb89f9e85900d2 = player equipment_mp::getequipmentammo( equipment );
        maxequipmentammo = player equipment_mp::getequipmentmaxammo( equipment );
        
        if ( var_c8eb89f9e85900d2 < maxequipmentammo )
        {
            var_762b07a736c2f8d6 = 0;
            break;
        }
    }
    
    if ( var_9ef2cd94e9696703 && var_762b07a736c2f8d6 )
    {
        player hud_message::showerrormessage( %"mp_ingame_only/ammo_restock_stock_full" );
        player playlocalsound( "fly_pickup_deny" );
        return 0;
    }
    
    var_4c48fad50fa1fc28 = [];
    
    foreach ( weap in var_f3f1ae1911b3c3c6 )
    {
        if ( !weapons::isdroppableweapon( player, weap ) )
        {
            continue;
        }
        
        currenttype = br_weapons::br_ammo_type_for_weapon( weap );
        currentstock = player getweaponammostock( weap );
        
        if ( utility::callsharedfunc( #"game", #"iscommonitemenabled" ) )
        {
            if ( player item_ammo::function_9aecfd8b12f7ed0e( weap ) <= currentstock )
            {
                continue;
            }
        }
        else if ( isdefined( currenttype ) )
        {
            if ( level.var_9a6a4b42eba220f6[ currenttype ] <= currentstock )
            {
                continue;
            }
        }
        
        if ( weapon::isaxeweapon( weap ) || weap.isalternate && function_b7037bc0cf5c7a82( weap ) )
        {
            clipammo = weaponclipsize( weap );
            newammo = int( clipammo );
            player setweaponammoclip( weap, newammo );
            continue;
        }
        else if ( weapon::isminigunweapon( weap ) )
        {
            player setweaponammoclip( weap, weap.clipsize );
            continue;
        }
        else if ( !isdefined( currenttype ) )
        {
            continue;
        }
        
        if ( !isdefined( var_4c48fad50fa1fc28[ currenttype ] ) )
        {
            ammogiven = minint( level.var_9a6a4b42eba220f6[ currenttype ] - currentstock, weaponclipsize( weap ) * 2 );
            fakepickup = spawnstruct();
            fakepickup.count = ammogiven;
            fakepickup.scriptablename = currenttype;
            fakepickup.stackable = fakepickup.count;
            var_4c48fad50fa1fc28[ fakepickup.scriptablename ] = fakepickup;
        }
        
        player item_ammo::function_46e5ccf39665fcf4( weap, 0, 0, 0, undefined, 2 );
    }
    
    foreach ( equipment in var_64475d2b78c272c3 )
    {
        maxequipmentammo = player equipment_mp::getequipmentmaxammo( equipment );
        
        if ( isdefined( level.br_pickups.br_equipnametoscriptable[ equipment ] ) && !isdefined( var_4c48fad50fa1fc28[ level.br_pickups.br_equipnametoscriptable[ equipment ] ] ) )
        {
            currentammo = player equipment_mp::getequipmentammo( equipment );
            ammogiven = maxequipmentammo - currentammo;
            fakepickup = spawnstruct();
            fakepickup.count = ammogiven;
            fakepickup.scriptablename = level.br_pickups.br_equipnametoscriptable[ equipment ];
            fakepickup.stackable = fakepickup.count;
            var_4c48fad50fa1fc28[ fakepickup.scriptablename ] = fakepickup;
        }
        
        player equipment_mp::incrementequipmentammo( equipment, maxequipmentammo );
    }
    
    player damagefeedback::hudicontype( "br_ammo" );
    level thread showstocklootfeed_br( player, var_4c48fad50fa1fc28 );
    player playlocalsound( "fly_pickup_ammo_gen" );
    return 1;
}

// Namespace ammorestock_br
// Params 2
// Checksum 0x57c09773, Offset: 0xcfa
// Size: 0x137
function showstocklootfeed_br( player, var_4c48fad50fa1fc28 )
{
    level endon( #"game_ended" );
    player endon( #"death_or_disconnect" );
    count = 0;
    
    foreach ( item in var_4c48fad50fa1fc28 )
    {
        count++;
        waittime = 0.1;
        
        if ( count % 3 == 0 )
        {
            waittime = 1.5;
        }
        
        if ( !isdefined( item.count ) || item.count <= 0 )
        {
            continue;
        }
        
        if ( !isdefined( item.scriptablename ) )
        {
            continue;
        }
        
        if ( utility::issharedfuncdefined( #"loot", #"updatelootsplash" ) )
        {
            player utility::callsharedfunc( #"loot", #"updatelootsplash", item );
        }
        
        wait waittime;
    }
}

// Namespace ammorestock_br
// Params 0
// Checksum 0x513c6d94, Offset: 0xe39
// Size: 0x15
function function_842c4fb51e4f480f()
{
    br_circle::registercirclecallbacks( 22, &function_6c0d8bb6a95e4288, &function_6c0d8bb6a95e4288 );
}

// Namespace ammorestock_br
// Params 3
// Checksum 0xe5a8e8f1, Offset: 0xe56
// Size: 0x1b9
function function_6c0d8bb6a95e4288( dangercircleorigin, dangercircleradius, thresholdradius )
{
    foreach ( loc in level.ammorestocklocs )
    {
        isingas = exclusion_zones::function_1efc19de6199fff6( loc.origin, 0, 0 ) == -1 && !br_circle_util::ispointindangercircle( loc.origin, level.var_ea96217a33eb6457 );
        
        if ( isingas != loc.isingas )
        {
            if ( !isstring( loc.target ) )
            {
                if ( !isdefined( loc.target ) )
                {
                    loc.var_6781e08eb60ecad5 = isingas;
                }
                else
                {
                    loc.target.var_6781e08eb60ecad5 = isingas;
                }
            }
            else
            {
                foreach ( var_6cfb3a61bc52125 in loc.scriptables )
                {
                    var_6cfb3a61bc52125.var_6781e08eb60ecad5 = isingas;
                }
            }
            
            loc.isingas = isingas;
        }
    }
}

