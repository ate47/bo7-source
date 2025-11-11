#using scripts\engine\utility;

#namespace namespace_9d8e359c3b1041e5;

// Namespace namespace_9d8e359c3b1041e5
// Params 4
// Checksum 0x129f73aa, Offset: 0x84
// Size: 0x45
function scriptmodelplayanimdeltamotionsharedfunc( animname, notifystring, animstarttimeseconds, blendtype )
{
    return utility::callsharedfunc( #"anim", #"scriptmodelplayanimdeltamotion", animname, notifystring, animstarttimeseconds, blendtype );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0x9d88f31, Offset: 0xd2
// Size: 0x45
function activateperksharedfunc( perkname )
{
    if ( utility::issharedfuncdefined( #"perk", #"activatePerk" ) )
    {
        self [[ utility::getsharedfunc( #"perk", #"activatePerk" ) ]]( perkname );
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 2
// Checksum 0x8d4696e9, Offset: 0x11f
// Size: 0x4f
function function_8c80a74ff70fa1c( fieldupgrade1, fieldupgrade2 )
{
    if ( utility::issharedfuncdefined( #"perk", #"perkpackage_giveoverridefieldupgrades" ) )
    {
        self [[ utility::getsharedfunc( #"perk", #"perkpackage_giveoverridefieldupgrades" ) ]]( fieldupgrade1, fieldupgrade2 );
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 2
// Checksum 0x1f85f82e, Offset: 0x176
// Size: 0x4f
function giveperksharedfunc( perkname, parentperkname )
{
    if ( utility::issharedfuncdefined( #"perk", #"giveperk" ) )
    {
        self [[ utility::getsharedfunc( #"perk", #"giveperk" ) ]]( perkname, parentperkname );
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0x92f0e5c3, Offset: 0x1cd
// Size: 0x45
function removeperksharedfunc( perkname )
{
    if ( utility::issharedfuncdefined( #"perk", #"removeperk" ) )
    {
        self [[ utility::getsharedfunc( #"perk", #"removeperk" ) ]]( perkname );
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 5
// Checksum 0x6d741e72, Offset: 0x21a
// Size: 0x6e
function showsplashsharedfunc( ref, optionalnumber, playerforplayercard, altdisplayindex, var_4dd30bf63f0b5e8b )
{
    if ( utility::issharedfuncdefined( #"hud", #"showsplash" ) )
    {
        self [[ utility::getsharedfunc( #"hud", #"showsplash" ) ]]( ref, optionalnumber, playerforplayercard, altdisplayindex, var_4dd30bf63f0b5e8b );
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 2
// Checksum 0x41ae4b00, Offset: 0x290
// Size: 0x4f
function showerrormessagesharedfunc( funcname, param )
{
    if ( utility::issharedfuncdefined( #"hud", #"showerrormessage" ) )
    {
        self [[ utility::getsharedfunc( #"hud", #"showerrormessage" ) ]]( funcname, param );
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0x9cfacb0b, Offset: 0x2e7
// Size: 0x49
function isfeaturedisabledsharedfunc( featurename )
{
    if ( utility::issharedfuncdefined( #"game", #"isfeaturedisabled" ) )
    {
        return [[ utility::getsharedfunc( #"game", #"isfeaturedisabled" ) ]]( featurename );
    }
    
    return 0;
}

// Namespace namespace_9d8e359c3b1041e5
// Params 0
// Checksum 0xa9f31463, Offset: 0x338
// Size: 0x39
function checkforactiveobjicon()
{
    if ( utility::issharedfuncdefined( #"game", #"checkforactiveobjicon" ) )
    {
        self [[ utility::getsharedfunc( #"game", #"checkforactiveobjicon" ) ]]();
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 0
// Checksum 0x6a80100, Offset: 0x379
// Size: 0x39
function deletequestobjicon()
{
    if ( utility::issharedfuncdefined( #"game", #"deletequestobjicon" ) )
    {
        self [[ utility::getsharedfunc( #"game", #"deletequestobjicon" ) ]]();
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 2
// Checksum 0x10d7b4df, Offset: 0x3ba
// Size: 0x4e
function function_39104c6ed6c82786( fromorigin, fromangles )
{
    if ( utility::issharedfuncdefined( #"game", #"hash_da85e1cf6234f5f2" ) )
    {
        return [[ utility::getsharedfunc( #"game", #"hash_da85e1cf6234f5f2" ) ]]( fromorigin, fromangles );
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 2
// Checksum 0xcce424bb, Offset: 0x410
// Size: 0x4e
function function_74cee6223b7fcd43( fromorigin, fromangles )
{
    if ( utility::issharedfuncdefined( #"game", #"initSpawnOptions_SpawnFromPosition" ) )
    {
        return [[ utility::getsharedfunc( #"game", #"initSpawnOptions_SpawnFromPosition" ) ]]( fromorigin, fromangles );
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0xfe267385, Offset: 0x466
// Size: 0x44
function function_8c188a125aad1a67( spawningentity )
{
    if ( utility::issharedfuncdefined( #"game", #"initSpawnOptions_SpawnFromEntity" ) )
    {
        return [[ utility::getsharedfunc( #"game", #"initSpawnOptions_SpawnFromEntity" ) ]]( spawningentity );
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 3
// Checksum 0x3ebbc0c5, Offset: 0x4b2
// Size: 0x58
function spawnpickupfromlistsharedfunc( var_f1bc45484a606cd5, count, spawnoptions )
{
    if ( utility::issharedfuncdefined( #"game", #"spawnPickupFromList" ) )
    {
        [[ utility::getsharedfunc( #"game", #"spawnPickupFromList" ) ]]( var_f1bc45484a606cd5, count, spawnoptions );
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0x1d8a5745, Offset: 0x512
// Size: 0x45
function getscriptablefromlootidsharedfunc( lootid )
{
    if ( utility::issharedfuncdefined( #"game", #"getScriptableFromLootID" ) )
    {
        return [[ utility::getsharedfunc( #"game", #"getScriptableFromLootID" ) ]]( lootid );
    }
    
    return undefined;
}

// Namespace namespace_9d8e359c3b1041e5
// Params 5
// Checksum 0x762e891a, Offset: 0x560
// Size: 0x65
function spawnnewitemfromscriptablesharedfunc( scriptablename, itemorigin, itemangles, overridecount, critical )
{
    spawnoptions = function_39104c6ed6c82786( itemorigin, itemangles );
    
    if ( isdefined( spawnoptions ) )
    {
        spawnoptions.critical = critical;
        return spawnitemfromscriptablesharedfunc( scriptablename, overridecount, spawnoptions );
    }
    
    return undefined;
}

// Namespace namespace_9d8e359c3b1041e5
// Params 3
// Checksum 0x73031850, Offset: 0x5ce
// Size: 0x58
function spawnitemfromscriptablesharedfunc( scriptablename, count, spawnoptions )
{
    if ( utility::issharedfuncdefined( #"game", #"spawnItemFromScriptable" ) )
    {
        return [[ utility::getsharedfunc( #"game", #"spawnItemFromScriptable" ) ]]( scriptablename, count, spawnoptions );
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 2
// Checksum 0x9d4b244, Offset: 0x62e
// Size: 0x50
function function_a7918caa4f9819eb( scriptablename, iscustomweapon )
{
    if ( utility::issharedfuncdefined( #"game", #"hash_9a424766e665a6f7" ) )
    {
        return [[ utility::getsharedfunc( #"game", #"hash_9a424766e665a6f7" ) ]]( scriptablename, iscustomweapon );
    }
    
    return 1;
}

// Namespace namespace_9d8e359c3b1041e5
// Params 8
// Checksum 0xd27cef84, Offset: 0x687
// Size: 0x8c
function getitemdroporiginandanglessharedfunc( index, baseorigin, baseangles, ignoreent, var_8e48a889d5a11dee, optionaloverridedist, var_18608bd8660b3a19, var_11f401c17a8141c5 )
{
    if ( utility::issharedfuncdefined( #"game", #"getitemdroporiginandangles" ) )
    {
        [[ utility::getsharedfunc( #"game", #"getitemdroporiginandangles" ) ]]( index, baseorigin, baseangles, ignoreent, var_8e48a889d5a11dee, optionaloverridedist, var_18608bd8660b3a19, var_11f401c17a8141c5 );
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 6
// Checksum 0xf5cf642a, Offset: 0x71b
// Size: 0x77
function function_9200b427e12f62e0( player, scriptablename, var_90916fc4b2724efd, countoverride, fromkiosk, droppurchased )
{
    if ( utility::issharedfuncdefined( #"game", #"br_forcegivecustompickupitem" ) )
    {
        return [[ utility::getsharedfunc( #"game", #"br_forcegivecustompickupitem" ) ]]( player, scriptablename, var_90916fc4b2724efd, countoverride, fromkiosk, droppurchased );
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 4
// Checksum 0xa1a99d0, Offset: 0x79a
// Size: 0x63
function function_4f126db64b09db48( player, plunderspent, purchasetype, itemname )
{
    if ( utility::issharedfuncdefined( #"game", #"branalytics_kiosk_purchaseitem" ) )
    {
        return [[ utility::getsharedfunc( #"game", #"branalytics_kiosk_purchaseitem" ) ]]( player, plunderspent, purchasetype, itemname );
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0xc016912, Offset: 0x805
// Size: 0x44
function iskiosksharedfunc( scriptablename )
{
    if ( utility::issharedfuncdefined( #"game", #"isKiosk" ) )
    {
        return [[ utility::getsharedfunc( #"game", #"isKiosk" ) ]]( scriptablename );
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0xe5f21e4c, Offset: 0x851
// Size: 0x44
function cantakepickupsharedfunc( pickupent )
{
    if ( utility::issharedfuncdefined( #"game", #"cantakepickup" ) )
    {
        return [[ utility::getsharedfunc( #"game", #"cantakepickup" ) ]]( pickupent );
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 3
// Checksum 0x8aade1e2, Offset: 0x89d
// Size: 0x58
function function_23586111765e3900( player, menuevent, menueventparam )
{
    if ( utility::issharedfuncdefined( #"game", #"branalytics_kiosk_menu_event" ) )
    {
        [[ utility::getsharedfunc( #"game", #"branalytics_kiosk_menu_event" ) ]]( player, menuevent, menueventparam );
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 3
// Checksum 0xe81bbd18, Offset: 0x8fd
// Size: 0x59
function createquestobjiconsharedfunc( iconref, state, var_e9c32dc17ce1bb57 )
{
    if ( utility::issharedfuncdefined( #"game", #"createquestobjicon" ) )
    {
        self [[ utility::getsharedfunc( #"game", #"createquestobjicon" ) ]]( iconref, state, var_e9c32dc17ce1bb57 );
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0x5a3b5a74, Offset: 0x95e
// Size: 0x45
function showquestobjicontoplayersharedfunc( player )
{
    if ( utility::issharedfuncdefined( #"game", #"showquestobjicontoplayer" ) )
    {
        self [[ utility::getsharedfunc( #"game", #"showquestobjicontoplayer" ) ]]( player );
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0x1e5c89b4, Offset: 0x9ab
// Size: 0x45
function ispubliceventoftypeactivesharedfunc( eventtype )
{
    if ( utility::issharedfuncdefined( #"game", #"ispubliceventoftypeactive" ) )
    {
        return [[ utility::getsharedfunc( #"game", #"ispubliceventoftypeactive" ) ]]( eventtype );
    }
    
    return 0;
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0xb9e79930, Offset: 0x9f9
// Size: 0x45
function hidequestobjiconfromplayersharedfunc( player )
{
    if ( utility::issharedfuncdefined( #"game", #"hidequestobjiconfromplayer" ) )
    {
        self [[ utility::getsharedfunc( #"game", #"hidequestobjiconfromplayer" ) ]]( player );
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 0
// Checksum 0x738a06cc, Offset: 0xa46
// Size: 0x39
function isbrpracticemodesharedfunc()
{
    if ( utility::issharedfuncdefined( #"game", #"isBrPracticeMode" ) )
    {
        return [[ utility::getsharedfunc( #"game", #"isBrPracticeMode" ) ]]();
    }
    
    return 0;
}

// Namespace namespace_9d8e359c3b1041e5
// Params 0
// Checksum 0xa920eb50, Offset: 0xa88
// Size: 0x39
function respawntokendisabledsharedfunc()
{
    if ( utility::issharedfuncdefined( #"game", #"respawntokendisabled" ) )
    {
        return [[ utility::getsharedfunc( #"game", #"respawntokendisabled" ) ]]();
    }
    
    return 0;
}

// Namespace namespace_9d8e359c3b1041e5
// Params 0
// Checksum 0xda3acad1, Offset: 0xaca
// Size: 0x3a
function hasselfrevivetokensharedfunc()
{
    if ( utility::issharedfuncdefined( #"game", #"hasselfrevivetoken" ) )
    {
        return self [[ utility::getsharedfunc( #"game", #"hasselfrevivetoken" ) ]]();
    }
    
    return 0;
}

// Namespace namespace_9d8e359c3b1041e5
// Params 5
// Checksum 0xf65bdcaf, Offset: 0xb0d
// Size: 0x6e
function forcegivekillstreaksharedfunc( killstreakref, dropcurrent, fromkiosk, droppurchased, var_6432f32bb6fece8b )
{
    if ( utility::issharedfuncdefined( #"game", #"forcegivekillstreak" ) )
    {
        return self [[ utility::getsharedfunc( #"game", #"forcegivekillstreak" ) ]]( killstreakref, dropcurrent, fromkiosk, droppurchased, var_6432f32bb6fece8b );
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0x5d25dd49, Offset: 0xb84
// Size: 0x45
function traceselectedmaplocationsharedfunc( location )
{
    if ( utility::issharedfuncdefined( #"game", #"traceselectedmaplocation" ) )
    {
        return [[ utility::getsharedfunc( #"game", #"traceselectedmaplocation" ) ]]( location );
    }
    
    return undefined;
}

// Namespace namespace_9d8e359c3b1041e5
// Params 2
// Checksum 0x993a163, Offset: 0xbd2
// Size: 0x4e
function getdefaultweaponammosharedfunc( weapon, maxammo )
{
    if ( utility::issharedfuncdefined( #"game", #"getDefaultWeaponAmmo" ) )
    {
        return [[ utility::getsharedfunc( #"game", #"getDefaultWeaponAmmo" ) ]]( weapon, maxammo );
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 0
// Checksum 0x4cfb014f, Offset: 0xc29
// Size: 0x39
function isbackpackinventoryenabledsharedfunc()
{
    if ( utility::issharedfuncdefined( #"inventory", #"isbackpackinventoryenabled" ) )
    {
        return [[ utility::getsharedfunc( #"inventory", #"isbackpackinventoryenabled" ) ]]();
    }
    
    return 0;
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0x6ac7690d, Offset: 0xc6b
// Size: 0x45
function calculatepurchasexpsharedfunc( plunderspent )
{
    if ( utility::issharedfuncdefined( #"game", #"calculatepurchasexp" ) )
    {
        return [[ utility::getsharedfunc( #"game", #"calculatepurchasexp" ) ]]( plunderspent );
    }
    
    return undefined;
}

// Namespace namespace_9d8e359c3b1041e5
// Params 0
// Checksum 0xa1bd728d, Offset: 0xcb9
// Size: 0x39
function isanytutorialorbotpracticematchsharedfunc()
{
    if ( utility::issharedfuncdefined( #"game", #"isanytutorialorbotpracticematch" ) )
    {
        return [[ utility::getsharedfunc( #"game", #"isanytutorialorbotpracticematch" ) ]]();
    }
    
    return 0;
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0xf9e1a2e4, Offset: 0xcfb
// Size: 0x45
function registeronluieventcallbacksharedfunc( callback )
{
    if ( utility::issharedfuncdefined( #"game", #"registeronluieventcallback" ) )
    {
        level [[ utility::getsharedfunc( #"game", #"registeronluieventcallback" ) ]]( callback );
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0x412accb7, Offset: 0xd48
// Size: 0x45
function isloadoutindexdefaultsharedfunc( index )
{
    if ( utility::issharedfuncdefined( #"game", #"isloadoutindexdefault" ) )
    {
        return [[ utility::getsharedfunc( #"game", #"isloadoutindexdefault" ) ]]( index );
    }
    
    return 0;
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0x3630553, Offset: 0xd96
// Size: 0x45
function getclasschoicesharedfunc( menuindex )
{
    if ( utility::issharedfuncdefined( #"game", #"getclasschoice" ) )
    {
        return [[ utility::getsharedfunc( #"game", #"getclasschoice" ) ]]( menuindex );
    }
    
    return undefined;
}

// Namespace namespace_9d8e359c3b1041e5
// Params 2
// Checksum 0x77e2c3f1, Offset: 0xde4
// Size: 0x4f
function function_79809b1a6a389161( spawn_origin, flaretype )
{
    if ( utility::issharedfuncdefined( #"game", #"utilflare_shootflare" ) )
    {
        level thread [[ utility::getsharedfunc( #"game", #"utilflare_shootflare" ) ]]( spawn_origin, flaretype );
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 3
// Checksum 0x990a56cb, Offset: 0xe3b
// Size: 0x59
function isvalidpointinboundssharedfunc( point, checkbadcircleareas, var_566819e204437d34 )
{
    if ( utility::issharedfuncdefined( #"game", #"isvalidpointinbounds" ) )
    {
        return [[ utility::getsharedfunc( #"game", #"isvalidpointinbounds" ) ]]( point, checkbadcircleareas, var_566819e204437d34 );
    }
    
    return 0;
}

// Namespace namespace_9d8e359c3b1041e5
// Params 4
// Checksum 0x37231dc0, Offset: 0xe9d
// Size: 0x63
function initcirclepoststarttocircleindexsharedfunc( origin, startcircledelay, startcircleindex, startcircleclosetime )
{
    if ( utility::issharedfuncdefined( #"game", #"initcirclepoststarttocircleindex" ) )
    {
        [[ utility::getsharedfunc( #"game", #"initcirclepoststarttocircleindex" ) ]]( origin, startcircledelay, startcircleindex, startcircleclosetime );
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0x42dc6c34, Offset: 0xf08
// Size: 0x45
function isfeatureenabledsharedfunc( featurename )
{
    if ( utility::issharedfuncdefined( #"game", #"isfeatureenabled" ) )
    {
        return [[ utility::getsharedfunc( #"game", #"isfeatureenabled" ) ]]( featurename );
    }
    
    return 0;
}

// Namespace namespace_9d8e359c3b1041e5
// Params 0
// Checksum 0xa3b813c0, Offset: 0xf56
// Size: 0x38
function function_35c0fe936b06d97b()
{
    if ( utility::issharedfuncdefined( #"game", #"spectate_init" ) )
    {
        [[ utility::getsharedfunc( #"game", #"spectate_init" ) ]]();
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0xce06aef4, Offset: 0xf96
// Size: 0x61
function function_57de0ca2e80536a1( v_origin )
{
    if ( utility::issharedfuncdefined( #"game", #"roundNumberDifficulty" ) )
    {
        return [[ utility::getsharedfunc( #"game", #"roundNumberDifficulty" ) ]]( v_origin );
    }
    
    assertmsg( "<dev string:x24>" + level.gametype + "<dev string:x47>" );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 2
// Checksum 0xcc659a7f, Offset: 0xfff
// Size: 0x4f
function getteamdatasharedfunc( team, property )
{
    if ( utility::issharedfuncdefined( #"game", #"getteamdata" ) )
    {
        return [[ utility::getsharedfunc( #"game", #"getteamdata" ) ]]( team, property );
    }
    
    return [];
}

// Namespace namespace_9d8e359c3b1041e5
// Params 3
// Checksum 0x2e550680, Offset: 0x1057
// Size: 0x3a
function registerscoreinfosharedfunc( type, category, value )
{
    return utility::callsharedfunc( #"game", #"registerscoreinfo", type, category, value );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 6
// Checksum 0xfad220f6, Offset: 0x109a
// Size: 0x59
function trysaylocalsoundsharedfunc( player, soundtype, delay, targetent, location, var_eeb6a639148e00e7 )
{
    return utility::callsharedfunc( #"game", #"trysaylocalsound", player, soundtype, delay, targetent, location, var_eeb6a639148e00e7 );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0x9d08800f, Offset: 0x10fc
// Size: 0x43
function addrecentattackersharedfunc( attacker )
{
    var_32dbca3143d9c4a5 = level.sharedfuncs[ #"game" ][ #"addrecentattacker" ];
    
    if ( isdefined( var_32dbca3143d9c4a5 ) )
    {
        self [[ var_32dbca3143d9c4a5 ]]( attacker );
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0x559dfaab, Offset: 0x1147
// Size: 0x26
function handlemovingplatformssharedfunc( data )
{
    return utility::callsharedfunc( #"game", #"handlemovingplatforms", data );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 0
// Checksum 0x507163bb, Offset: 0x1176
// Size: 0x1b, Type: bool
function isteamreviveenabledsharedfunc()
{
    return istrue( utility::callsharedfunc( #"game", #"isteamreviveenabled" ) );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0x19c19f43, Offset: 0x119a
// Size: 0x44
function handlemovingplatformtouchsharedfunc( data )
{
    if ( utility::issharedfuncdefined( #"game", #"handleMovingPlatformTouch" ) )
    {
        [[ utility::getsharedfunc( #"game", #"handleMovingPlatformTouch" ) ]]( data );
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 7
// Checksum 0x558608e, Offset: 0x11e6
// Size: 0x64
function function_972dfed07d51ba3( markerwidgetname, showto, tomark, groupowner, friendlymarker, markonspawn, var_52abf1a1f858871c )
{
    return utility::callsharedfunc( #"game", #"targetmarkergroup_on", markerwidgetname, showto, tomark, groupowner, friendlymarker, markonspawn, var_52abf1a1f858871c );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0xf15bb68b, Offset: 0x1253
// Size: 0x26
function function_94896e6cc9006981( targetmarkergroupid )
{
    return utility::callsharedfunc( #"game", #"targetmarkergroup_off", targetmarkergroupid );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 6
// Checksum 0x612f0350, Offset: 0x1282
// Size: 0x59
function registersentientsharedfunc( threatbiasgroup, var_7abeff39c291fc41, islethal, var_29232a9774002e87, var_3b8ee7e3e8397398, var_d1d5db309b77a8bb )
{
    return utility::callsharedfunc( #"game", #"registersentient", threatbiasgroup, var_7abeff39c291fc41, islethal, var_29232a9774002e87, var_3b8ee7e3e8397398, var_d1d5db309b77a8bb );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 2
// Checksum 0x377697fc, Offset: 0x12e4
// Size: 0x30
function unregistersentientsharedfunc( poolid, keyid )
{
    return utility::callsharedfunc( #"game", #"unregistersentient", poolid, keyid );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 2
// Checksum 0xa19106c9, Offset: 0x131d
// Size: 0x30
function registerentforoobsharedfunc( ent, ref )
{
    return utility::callsharedfunc( #"game", #"registerentforoob", ent, ref );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 2
// Checksum 0x8b6643ae, Offset: 0x1356
// Size: 0x30
function clearoobsharedfunc( ent, fromdeath )
{
    return utility::callsharedfunc( #"game", #"clearoob", ent, fromdeath );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0x955e5179, Offset: 0x138f
// Size: 0x26
function addspawnviewersharedfunc( entity )
{
    return utility::callsharedfunc( #"game", #"addspawnviewer", entity );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0x9bdd3927, Offset: 0x13be
// Size: 0x26
function removespawnviewersharedfunc( entity )
{
    return utility::callsharedfunc( #"game", #"removespawnviewer", entity );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0xf67e6ac2, Offset: 0x13ed
// Size: 0x27
function forcenetfieldhighlod_sharedfunc( set )
{
    utility::callsharedfunc( #"game", #"forcenetfieldhighlod", set );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 2
// Checksum 0x8b9e1d1d, Offset: 0x141c
// Size: 0x31, Type: bool
function ispointinoutofboundssharedfunc( pointtocheck, teamtocheck )
{
    return istrue( utility::callsharedfunc( #"game", #"ispointinoutofbounds", pointtocheck, teamtocheck ) );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 0
// Checksum 0xf6dbd156, Offset: 0x1456
// Size: 0x1b, Type: bool
function shouldmodesetsquadssharedfunc()
{
    return istrue( utility::callsharedfunc( #"game", #"shouldmodesetsquads" ) );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 0
// Checksum 0x82136842, Offset: 0x147a
// Size: 0x1b, Type: bool
function ismagellanmodesharedfunc()
{
    return istrue( utility::callsharedfunc( #"game", #"IsMagellanMode" ) );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 4
// Checksum 0x1d6dae1f, Offset: 0x149e
// Size: 0x64
function function_287accac73ec9c41( attacker, objweapon, inflictor, meansofdeath )
{
    if ( utility::issharedfuncdefined( #"game", #"non_player_add_ignore_damage_signature" ) )
    {
        return [[ utility::getsharedfunc( #"game", #"non_player_add_ignore_damage_signature" ) ]]( attacker, objweapon, inflictor, meansofdeath );
    }
    
    return undefined;
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0x3665f581, Offset: 0x150b
// Size: 0x44
function function_cc18ed453e5ccdbc( id )
{
    if ( utility::issharedfuncdefined( #"game", #"non_player_remove_ignore_damage_signature" ) )
    {
        [[ utility::getsharedfunc( #"game", #"non_player_remove_ignore_damage_signature" ) ]]( id );
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0x32c10afc, Offset: 0x1557
// Size: 0x26
function function_4e560ec0be671ce3( duration )
{
    return utility::callsharedfunc( #"hostmigration", #"waitLongDurationWithPause", duration );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 2
// Checksum 0x7614f952, Offset: 0x1586
// Size: 0x30
function waittill_notify_or_timeout_hostmigration_pause( msg, duration )
{
    return utility::callsharedfunc( #"hostmigration", #"waittillNotifyOrTimeoutPause", msg, duration );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 5
// Checksum 0xf78159b8, Offset: 0x15bf
// Size: 0x4f
function magicbulletsharedfunc( objweapon, start, end, owner, event_ent )
{
    return utility::callsharedfunc( #"weapons", #"magicbullet", objweapon, start, end, owner, event_ent );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 7
// Checksum 0x5fab41fd, Offset: 0x1617
// Size: 0x83
function launchgrenadesharedfunc( weaponname, origin, velocity, var_f4f3f0356fef8102, notthrown, var_93e691e8536b5f6d, tickpercentoverride )
{
    if ( utility::issharedfuncdefined( #"weapons", #"_launchgrenade" ) )
    {
        return [[ utility::getsharedfunc( #"weapons", #"_launchgrenade" ) ]]( weaponname, origin, velocity, var_f4f3f0356fef8102, notthrown, var_93e691e8536b5f6d, tickpercentoverride );
    }
    
    return undefined;
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0x80329d20, Offset: 0x16a3
// Size: 0x26
function setmissileminimapvisiblesharedfunc( set )
{
    return utility::callsharedfunc( #"weapons", #"setmissileminimapvisible", set );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0xe59558f3, Offset: 0x16d2
// Size: 0x26
function function_bc3d11edade5004( set )
{
    return utility::callsharedfunc( #"weapons", #"hash_a02d1dbbb057f8b0", set );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0x9a7641b0, Offset: 0x1701
// Size: 0x26
function function_2774ff2792a00056( set )
{
    return utility::callsharedfunc( #"weapons", #"hash_b36b4b3fd3a15594", set );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0x366d2aa0, Offset: 0x1730
// Size: 0x26
function function_fe287412c2a2bb55( anchor )
{
    return utility::callsharedfunc( #"weapons", #"hash_3db33cbf4379d27d", anchor );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0x4470a7b4, Offset: 0x175f
// Size: 0x26
function setmissileimpactminimapiconsharedfunc( iconname )
{
    return utility::callsharedfunc( #"weapons", #"setMissileImpactMinimapIcon", iconname );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 0
// Checksum 0xb4255f68, Offset: 0x178e
// Size: 0x1a
function saveweaponstatessharedfunc()
{
    return utility::callsharedfunc( #"weapons", #"saveweaponstates" );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0xe341d7b, Offset: 0x17b1
// Size: 0x26
function switchtoweaponsharedfunc( weapon )
{
    return utility::callsharedfunc( #"weapons", #"switchtoweapon", weapon );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0x9810749e, Offset: 0x17e0
// Size: 0x26
function switchtoweaponimmediatesharedfunc( weapon )
{
    return utility::callsharedfunc( #"weapons", #"switchtoweaponimmediate", weapon );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0xa2bb26e4, Offset: 0x180f
// Size: 0x26
function takeweaponsharedfunc( weapon )
{
    return utility::callsharedfunc( #"weapons", #"takeweapon", weapon );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 2
// Checksum 0xc4f8c5a3, Offset: 0x183e
// Size: 0x4e
function monitordisownedgrenadesharedfunc( player, grenade )
{
    if ( utility::issharedfuncdefined( #"weapons", #"monitordisownedgrenade" ) )
    {
        [[ utility::getsharedfunc( #"weapons", #"monitordisownedgrenade" ) ]]( player, grenade );
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 3
// Checksum 0x5c5c43c1, Offset: 0x1894
// Size: 0x58
function monitordisownedequipmentsharedfunc( player, equipment, var_6637462580611fe3 )
{
    if ( utility::issharedfuncdefined( #"weapons", #"monitordisownedequipment" ) )
    {
        [[ utility::getsharedfunc( #"weapons", #"monitordisownedequipment" ) ]]( player, equipment, var_6637462580611fe3 );
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0x52aca1fb, Offset: 0x18f4
// Size: 0x44
function minedamagemonitorsharedfunc( hitsmax )
{
    if ( utility::issharedfuncdefined( #"weapons", #"minedamagemonitor" ) )
    {
        [[ utility::getsharedfunc( #"weapons", #"minedamagemonitor" ) ]]( hitsmax );
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 4
// Checksum 0xdbfe868c, Offset: 0x1940
// Size: 0x63
function onequipmentplantedsharedfunc( newequipment, equipmentref, deletefunc, isagentowned )
{
    if ( utility::issharedfuncdefined( #"weapons", #"onequipmentplanted" ) )
    {
        [[ utility::getsharedfunc( #"weapons", #"onequipmentplanted" ) ]]( newequipment, equipmentref, deletefunc, isagentowned );
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0x2ea43bfb, Offset: 0x19ab
// Size: 0x44
function outlineequipmentforownersharedfunc( equipment )
{
    if ( utility::issharedfuncdefined( #"weapons", #"outlineequipmentforowner" ) )
    {
        [[ utility::getsharedfunc( #"weapons", #"outlineequipmentforowner" ) ]]( equipment );
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 0
// Checksum 0x7c288d33, Offset: 0x19f7
// Size: 0x38
function makeexplosiveunusuabletagsharedfunc()
{
    if ( utility::issharedfuncdefined( #"weapons", #"makeexplosiveunusuabletag" ) )
    {
        [[ utility::getsharedfunc( #"weapons", #"makeexplosiveunusuabletag" ) ]]();
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 3
// Checksum 0xcd525ac0, Offset: 0x1a37
// Size: 0x58
function explosivetriggersharedfunc( target, graceperiod, notifystr )
{
    if ( utility::issharedfuncdefined( #"weapons", #"explosivetrigger" ) )
    {
        [[ utility::getsharedfunc( #"weapons", #"explosivetrigger" ) ]]( target, graceperiod, notifystr );
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0x38232a27, Offset: 0x1a97
// Size: 0x44
function removeequipsharedfunc( equip )
{
    if ( utility::issharedfuncdefined( #"weapons", #"removeequip" ) )
    {
        [[ utility::getsharedfunc( #"weapons", #"removeequip" ) ]]( equip );
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 2
// Checksum 0x59fe7cb8, Offset: 0x1ae3
// Size: 0x4e
function addlockedonsharedfunc( entity, attacker )
{
    if ( utility::issharedfuncdefined( #"weapons", #"addlockedon" ) )
    {
        [[ utility::getsharedfunc( #"weapons", #"addlockedon" ) ]]( entity, attacker );
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 2
// Checksum 0xc75fa336, Offset: 0x1b39
// Size: 0x4e
function removelockedonsharedfunc( entity, attacker )
{
    if ( utility::issharedfuncdefined( #"weapons", #"removelockedon" ) )
    {
        [[ utility::getsharedfunc( #"weapons", #"removelockedon" ) ]]( entity, attacker );
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 0
// Checksum 0xc565f255, Offset: 0x1b8f
// Size: 0x38
function ismissilelauncherlockonallowedsharedfunc()
{
    if ( utility::issharedfuncdefined( #"weapons", #"isMissileLauncherLockOnAllowed" ) )
    {
        return [[ utility::getsharedfunc( #"weapons", #"isMissileLauncherLockOnAllowed" ) ]]();
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0xacdacf56, Offset: 0x1bcf
// Size: 0x44
function lockonlaunchergettargetarraysharedfunc( addcharacters )
{
    if ( utility::issharedfuncdefined( #"weapons", #"lockOnLauncherGetTargetArray" ) )
    {
        return [[ utility::getsharedfunc( #"weapons", #"lockOnLauncherGetTargetArray" ) ]]( addcharacters );
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 3
// Checksum 0x8d3bd66b, Offset: 0x1c1b
// Size: 0x58
function remoteinteractsetupsharedfunc( var_bc3be370eac48043, allowdefuse, allowhack )
{
    if ( utility::issharedfuncdefined( #"equipment", #"remoteinteractsetup" ) )
    {
        [[ utility::getsharedfunc( #"equipment", #"remoteinteractsetup" ) ]]( var_bc3be370eac48043, allowdefuse, allowhack );
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 0
// Checksum 0x708ce4c7, Offset: 0x1c7b
// Size: 0x39
function getmineignorelistsharedfunc()
{
    if ( utility::issharedfuncdefined( #"equipment", #"getMineIgnoreList" ) )
    {
        return [[ utility::getsharedfunc( #"equipment", #"getMineIgnoreList" ) ]]();
    }
    
    return undefined;
}

// Namespace namespace_9d8e359c3b1041e5
// Params 0
// Checksum 0x2fda1579, Offset: 0x1cbd
// Size: 0x38
function watchflightcollisionsharedfunc()
{
    if ( utility::issharedfuncdefined( #"equipment", #"watchFlightCollision" ) )
    {
        [[ utility::getsharedfunc( #"equipment", #"watchFlightCollision" ) ]]();
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 12
// Checksum 0x8a552e76, Offset: 0x1cfd
// Size: 0xb6
function setheadiconfactionimagesharedfunc( showtoallfactions, offset, drawthroughgeo, maxdrawdist, naturaldist, delaytime, var_c6bd58f878e4420a, ownerinvisible, overrideorigin, showonminimap, image, iconsizes )
{
    if ( utility::issharedfuncdefined( #"hud", #"setHeadIconFactionImage" ) )
    {
        return [[ utility::getsharedfunc( #"hud", #"setHeadIconFactionImage" ) ]]( showtoallfactions, offset, drawthroughgeo, maxdrawdist, naturaldist, delaytime, var_c6bd58f878e4420a, ownerinvisible, overrideorigin, showonminimap, image, iconsizes );
    }
    
    return undefined;
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0xecad955e, Offset: 0x1dbc
// Size: 0x44
function setheadicondeleteiconsharedfunc( icon )
{
    if ( utility::issharedfuncdefined( #"hud", #"setHeadIconDeleteIcon" ) )
    {
        [[ utility::getsharedfunc( #"hud", #"setHeadIconDeleteIcon" ) ]]( icon );
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0x5f3e96a4, Offset: 0x1e08
// Size: 0x42
function function_b739495605e4ba8a( b_hide )
{
    if ( utility::issharedfuncdefined( #"hud", #"hash_6f07e8aa7e74982" ) )
    {
        utility::callsharedfunc( #"hud", #"hash_6f07e8aa7e74982", b_hide );
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 11
// Checksum 0x271d5695, Offset: 0x1e52
// Size: 0x8d
function function_5fd1256ae6f663cd( position, duration, scalemax, scalemid, scalemin, radiusmax, radiusmid, radiusmin, ignoreclients, playrumble, var_ca144b5ca4279c98 )
{
    return utility::callsharedfunc( #"shellshock", #"artillery_earthquake", position, duration, scalemax, scalemid, scalemin, radiusmax, radiusmid, radiusmin, ignoreclients, playrumble, var_ca144b5ca4279c98 );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 4
// Checksum 0xf89d1242, Offset: 0x1ee8
// Size: 0x64
function givesuperpointssharedfunc( points, scoreevent, bypassdisable, pointsmultiplier )
{
    if ( utility::issharedfuncdefined( #"supers", #"givesuperpoints" ) )
    {
        self [[ utility::getsharedfunc( #"supers", #"givesuperpoints" ) ]]( points, scoreevent, bypassdisable, pointsmultiplier );
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 0
// Checksum 0x13b4aae0, Offset: 0x1f54
// Size: 0x39
function getsuperpointsneededsharedfunc()
{
    if ( utility::issharedfuncdefined( #"supers", #"getsuperpointsneeded" ) )
    {
        self [[ utility::getsharedfunc( #"supers", #"getsuperpointsneeded" ) ]]();
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 4
// Checksum 0x27bc531b, Offset: 0x1f95
// Size: 0x64
function givesupersharedfunc( superref, savesuperpoints, immediate, blueprintindex )
{
    if ( utility::issharedfuncdefined( #"supers", #"givesuper" ) )
    {
        self [[ utility::getsharedfunc( #"supers", #"givesuper" ) ]]( superref, savesuperpoints, immediate, blueprintindex );
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0x9d59d3c4, Offset: 0x2001
// Size: 0x45
function getsuperbundlefromoffhandweaponnamesharedfunc( weaponname )
{
    if ( utility::issharedfuncdefined( #"supers", #"getSuperBundleFromOffhandWeaponName" ) )
    {
        return [[ utility::getsharedfunc( #"supers", #"getSuperBundleFromOffhandWeaponName" ) ]]( weaponname );
    }
    
    return undefined;
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0x231ef246, Offset: 0x204f
// Size: 0x45
function getsuperweaponsharedfunc( superref )
{
    if ( utility::issharedfuncdefined( #"supers", #"getSuperWeapon" ) )
    {
        return [[ utility::getsharedfunc( #"supers", #"getSuperWeapon" ) ]]( superref );
    }
    
    return undefined;
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0x60f2dc5e, Offset: 0x209d
// Size: 0x46
function haskillstreaksharedfunc( killstreakref )
{
    if ( utility::issharedfuncdefined( #"player", #"haskillstreak" ) )
    {
        return self [[ utility::getsharedfunc( #"player", #"haskillstreak" ) ]]( killstreakref );
    }
    
    return 0;
}

// Namespace namespace_9d8e359c3b1041e5
// Params 0
// Checksum 0xbe7ebf0f, Offset: 0x20ec
// Size: 0x3a
function issuperinusesharedfunc()
{
    if ( utility::issharedfuncdefined( #"player", #"issuperinuse" ) )
    {
        return self [[ utility::getsharedfunc( #"player", #"issuperinuse" ) ]]();
    }
    
    return 0;
}

// Namespace namespace_9d8e359c3b1041e5
// Params 0
// Checksum 0x97875b04, Offset: 0x212f
// Size: 0x39
function getcurrentsuperrefsharedfunc()
{
    if ( utility::issharedfuncdefined( #"player", #"getcurrentsuperref" ) )
    {
        return self [[ utility::getsharedfunc( #"player", #"getcurrentsuperref" ) ]]();
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 5
// Checksum 0xb82637e5, Offset: 0x2170
// Size: 0x6e
function forcegivesupersharedfunc( targetsupername, dropcurrent, fromkiosk, droppurchased, var_6432f32bb6fece8b )
{
    if ( utility::issharedfuncdefined( #"player", #"forcegivesuper" ) )
    {
        self [[ utility::getsharedfunc( #"player", #"forcegivesuper" ) ]]( targetsupername, dropcurrent, fromkiosk, droppurchased, var_6432f32bb6fece8b );
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 0
// Checksum 0x701090d4, Offset: 0x21e6
// Size: 0x39
function function_403389469efa28fe()
{
    if ( utility::issharedfuncdefined( #"player", #"br_ammo_player_max_out" ) )
    {
        self [[ utility::getsharedfunc( #"player", #"br_ammo_player_max_out" ) ]]();
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0x84f2f04e, Offset: 0x2227
// Size: 0x45
function addrespawntokensharedfunc( skipsplash )
{
    if ( utility::issharedfuncdefined( #"player", #"addrespawntoken" ) )
    {
        self [[ utility::getsharedfunc( #"player", #"addrespawntoken" ) ]]( skipsplash );
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0xab7caca7, Offset: 0x2274
// Size: 0x45
function addselfrevivetokensharedfunc( skipsplash )
{
    if ( utility::issharedfuncdefined( #"player", #"addselfrevivetoken" ) )
    {
        self [[ utility::getsharedfunc( #"player", #"addselfrevivetoken" ) ]]( skipsplash );
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 8
// Checksum 0x514da487, Offset: 0x22c1
// Size: 0x6e
function updatehitmarker_sharedfunc( markertype, killingblow, headshot, nonplayer, icontype, targetentnum, armorPlateCount, var_795e8a31194a39ac )
{
    return utility::callsharedfunc( #"hitmarker", #"updatehitmarker_sharedfunc", markertype, killingblow, headshot, nonplayer, icontype, targetentnum, armorPlateCount, var_795e8a31194a39ac );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0xb52b5508, Offset: 0x2338
// Size: 0x26
function updateDamageFeedback_SharedFunc( icontype )
{
    return utility::callsharedfunc( #"hitmarker", #"updateDamageFeedback_SharedFunc", icontype );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 0
// Checksum 0xf3bde82a, Offset: 0x2367
// Size: 0x3e
function isjuggernautsharedfunc()
{
    if ( utility::issharedfuncdefined( #"player", #"isjuggernaut" ) )
    {
        return self [[ utility::getsharedfunc( #"player", #"isjuggernaut" ) ]]();
    }
    
    return 0;
}

// Namespace namespace_9d8e359c3b1041e5
// Params 4
// Checksum 0x35536aee, Offset: 0x23ad
// Size: 0x65
function additemtobackpacksharedfunc( lootid, pickup, dontdropleftover, param4 )
{
    if ( utility::issharedfuncdefined( #"player", #"addItemToBackpack" ) )
    {
        return self [[ utility::getsharedfunc( #"player", #"addItemToBackpack" ) ]]( lootid, pickup, dontdropleftover, param4 );
    }
    
    return 0;
}

// Namespace namespace_9d8e359c3b1041e5
// Params 0
// Checksum 0x527d2cdb, Offset: 0x241b
// Size: 0x39
function getavailabledmzbackpackindexsharedfunc()
{
    if ( utility::issharedfuncdefined( #"player", #"getAvailableDMZBackpackIndex" ) )
    {
        return [[ utility::getsharedfunc( #"player", #"getAvailableDMZBackpackIndex" ) ]]();
    }
    
    return undefined;
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0x9906fca2, Offset: 0x245d
// Size: 0x45
function didextractwithweaponcasesharedfunc( player )
{
    if ( utility::issharedfuncdefined( #"dmz", #"didExtractWithWeaponCase" ) )
    {
        return [[ utility::getsharedfunc( #"dmz", #"didExtractWithWeaponCase" ) ]]( player );
    }
    
    return 0;
}

// Namespace namespace_9d8e359c3b1041e5
// Params 10
// Checksum 0xa0adaae4, Offset: 0x24ab
// Size: 0xa2
function doscoreeventsharedfunc( event, objweapon, pointsoverride, xpoverride, victim, var_ae2a12845c1ef7c1, dontwait, cankillchain, streakinfo, var_dd3dc966adfb966 )
{
    if ( utility::issharedfuncdefined( #"player", #"doScoreEvent" ) )
    {
        return [[ utility::getsharedfunc( #"player", #"doScoreEvent" ) ]]( event, objweapon, pointsoverride, xpoverride, victim, var_ae2a12845c1ef7c1, dontwait, cankillchain, streakinfo, var_dd3dc966adfb966 );
    }
    
    return undefined;
}

// Namespace namespace_9d8e359c3b1041e5
// Params 2
// Checksum 0x95e30972, Offset: 0x2556
// Size: 0x50
function preloadandqueueclasssharedfunc( class, highpriorityload )
{
    if ( utility::issharedfuncdefined( #"player", #"preloadandqueueclass" ) )
    {
        return self [[ utility::getsharedfunc( #"player", #"preloadandqueueclass" ) ]]( class, highpriorityload );
    }
    
    return undefined;
}

// Namespace namespace_9d8e359c3b1041e5
// Params 0
// Checksum 0x99755fd, Offset: 0x25af
// Size: 0x3a
function savefavoriteloadoutsharedfunc()
{
    if ( utility::issharedfuncdefined( #"player", #"saveFavoriteLoadout" ) )
    {
        return self [[ utility::getsharedfunc( #"player", #"saveFavoriteLoadout" ) ]]();
    }
    
    return undefined;
}

// Namespace namespace_9d8e359c3b1041e5
// Params 2
// Checksum 0xececfea6, Offset: 0x25f2
// Size: 0x4e
function function_48bf334fb9c93812( player, dropcurrent )
{
    if ( utility::issharedfuncdefined( #"player", #"br_giveselectedclass" ) )
    {
        [[ utility::getsharedfunc( #"player", #"br_giveselectedclass" ) ]]( player, dropcurrent );
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 0
// Checksum 0x769e5a58, Offset: 0x2648
// Size: 0x3a
function iseligibleforteamrevivesharedfunc()
{
    if ( utility::issharedfuncdefined( #"player", #"iseligibleforteamrevive" ) )
    {
        return self [[ utility::getsharedfunc( #"player", #"iseligibleforteamrevive" ) ]]();
    }
    
    return 0;
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0xef77d9c9, Offset: 0x268b
// Size: 0x45
function isrespawningfromtokensharedfunc( player )
{
    if ( utility::issharedfuncdefined( #"player", #"isrespawningfromtoken" ) )
    {
        return [[ utility::getsharedfunc( #"player", #"isrespawningfromtoken" ) ]]( player );
    }
    
    return 0;
}

// Namespace namespace_9d8e359c3b1041e5
// Params 4
// Checksum 0x68e1cb96, Offset: 0x26d9
// Size: 0x69
function playergulagautowinsharedfunc( sponsor, tokenused, var_350c06308cd3d7e3, var_ec22479f7c93f2e0 )
{
    if ( utility::issharedfuncdefined( #"gulag", #"playergulagautowin" ) )
    {
        self [[ utility::getsharedfunc( #"gulag", #"playergulagautowin" ) ]]( "", sponsor, tokenused, var_350c06308cd3d7e3, var_ec22479f7c93f2e0 );
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0xf28a00b5, Offset: 0x274a
// Size: 0x46
function playerprestreamrespawnoriginsharedfunc( spawnpoint )
{
    if ( utility::issharedfuncdefined( #"player", #"playerprestreamrespawnorigin" ) )
    {
        return self [[ utility::getsharedfunc( #"player", #"playerprestreamrespawnorigin" ) ]]( spawnpoint );
    }
    
    return undefined;
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0x8bb5bef8, Offset: 0x2799
// Size: 0x45
function gulagfadetoblacksharedfunc( fadespectators )
{
    if ( utility::issharedfuncdefined( #"gulag", #"gulagfadetoblack" ) )
    {
        self [[ utility::getsharedfunc( #"gulag", #"gulagfadetoblack" ) ]]( fadespectators );
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 0
// Checksum 0x7227fa36, Offset: 0x27e6
// Size: 0x39
function gulagstreamexitsharedfunc()
{
    if ( utility::issharedfuncdefined( #"gulag", #"gulagstreamexit" ) )
    {
        self [[ utility::getsharedfunc( #"gulag", #"gulagstreamexit" ) ]]();
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 2
// Checksum 0x855255c4, Offset: 0x2827
// Size: 0x4f
function playerteleportgulagsharedfunc( origin, angles )
{
    if ( utility::issharedfuncdefined( #"gulag", #"playerteleportgulag" ) )
    {
        self [[ utility::getsharedfunc( #"gulag", #"playerteleportgulag" ) ]]( origin, angles );
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0x68a35ac1, Offset: 0x287e
// Size: 0x45
function playercleanupentondisconnectsharedfunc( ent )
{
    if ( utility::issharedfuncdefined( #"player", #"playercleanupentondisconnect" ) )
    {
        self [[ utility::getsharedfunc( #"player", #"playercleanupentondisconnect" ) ]]( ent );
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 0
// Checksum 0x9a008e99, Offset: 0x28cb
// Size: 0x39
function playerwaittillstreamhintcompletesharedfunc()
{
    if ( utility::issharedfuncdefined( #"player", #"playerwaittillstreamhintcomplete" ) )
    {
        self [[ utility::getsharedfunc( #"player", #"playerwaittillstreamhintcomplete" ) ]]();
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 0
// Checksum 0x2fbf9ceb, Offset: 0x290c
// Size: 0x39
function playerclearstreamhintoriginsharedfunc()
{
    if ( utility::issharedfuncdefined( #"player", #"playerclearstreamhintorigin" ) )
    {
        self [[ utility::getsharedfunc( #"player", #"playerclearstreamhintorigin" ) ]]();
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 0
// Checksum 0x26e4ce3a, Offset: 0x294d
// Size: 0x39
function resetplayermovespeedscalesharedfunc()
{
    if ( utility::issharedfuncdefined( #"player", #"resetplayermovespeedscale" ) )
    {
        self [[ utility::getsharedfunc( #"player", #"resetplayermovespeedscale" ) ]]();
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 0
// Checksum 0x97fdc722, Offset: 0x298e
// Size: 0x39
function gulagfadefromblacksharedfunc()
{
    if ( utility::issharedfuncdefined( #"gulag", #"gulagfadefromblack" ) )
    {
        self [[ utility::getsharedfunc( #"gulag", #"gulagfadefromblack" ) ]]();
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 0
// Checksum 0x138e53ff, Offset: 0x29cf
// Size: 0x3d, Type: bool
function isplayeringulagsharedfunc()
{
    var_32dbca3143d9c4a5 = level.sharedfuncs[ #"gulag" ][ #"isplayeringulag" ];
    
    if ( var_32dbca3143d9c4a5 && self [[ var_32dbca3143d9c4a5 ]]() )
    {
        return true;
    }
    
    return false;
}

// Namespace namespace_9d8e359c3b1041e5
// Params 0
// Checksum 0xf4b833be, Offset: 0x2a15
// Size: 0x3a
function isplayerinorgoingtogulagsharedfunc()
{
    if ( utility::issharedfuncdefined( #"gulag", #"isplayerinorgoingtogulag" ) )
    {
        return self [[ utility::getsharedfunc( #"gulag", #"isplayerinorgoingtogulag" ) ]]();
    }
    
    return 0;
}

// Namespace namespace_9d8e359c3b1041e5
// Params 0
// Checksum 0x12839b4a, Offset: 0x2a58
// Size: 0x3a
function isplayerwaitingresurgencerespawnsharedfunc()
{
    if ( utility::issharedfuncdefined( #"player", #"isPlayerWaitingResurgenceRespawn" ) )
    {
        return self [[ utility::getsharedfunc( #"player", #"isPlayerWaitingResurgenceRespawn" ) ]]();
    }
    
    return 0;
}

// Namespace namespace_9d8e359c3b1041e5
// Params 2
// Checksum 0x2d559511, Offset: 0x2a9b
// Size: 0x4f
function playerplunderkioskpurchasesharedfunc( amount, data )
{
    if ( utility::issharedfuncdefined( #"player", #"playerplunderkioskpurchase" ) )
    {
        self [[ utility::getsharedfunc( #"player", #"playerplunderkioskpurchase" ) ]]( amount, data );
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 3
// Checksum 0x8eac759f, Offset: 0x2af2
// Size: 0x56
function setscriptmoverkillcamsharedfunc( killstring, offsetup, offsetback )
{
    if ( utility::issharedfuncdefined( #"player", #"setscriptmoverkillcam" ) )
    {
        utility::callsharedfunc( #"player", #"setscriptmoverkillcam", killstring, offsetup, offsetback );
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 3
// Checksum 0x14fc388f, Offset: 0x2b50
// Size: 0x3a
function fadetoblackforplayersharedfunc( player, fadetoblack, fadetime )
{
    return utility::callsharedfunc( #"player", #"fadetoblackforplayer", player, fadetoblack, fadetime );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 5
// Checksum 0xafef979a, Offset: 0x2b93
// Size: 0x4f
function shellshocksharedfunc( name, category, duration, animationresponse, interruptdelayms )
{
    return utility::callsharedfunc( #"player", #"shellshock", name, category, duration, animationresponse, interruptdelayms );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0x9c227c55, Offset: 0x2beb
// Size: 0x26
function stopshellshocksharedfunc( fromdeath )
{
    return utility::callsharedfunc( #"player", #"stopshellshock", fromdeath );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 0
// Checksum 0x15712efe, Offset: 0x2c1a
// Size: 0x1a
function function_6a6b037c28349000()
{
    return utility::callsharedfunc( #"player", #"setdof_cruisefirst" );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 3
// Checksum 0xa3cddf1, Offset: 0x2c3d
// Size: 0x3a
function freezecontrolssharedfunc( frozen, force, debug )
{
    return utility::callsharedfunc( #"player", #"freezecontrols", frozen, force, debug );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0xbbd59379, Offset: 0x2c80
// Size: 0x26
function getplayersuperfactionsharedfunc( player )
{
    return utility::callsharedfunc( #"player", #"getSuperFaction", player );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 0
// Checksum 0xfbe5061d, Offset: 0x2caf
// Size: 0x1a
function isalivesharedfunc()
{
    return utility::callsharedfunc( #"player", #"playerisalive" );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 4
// Checksum 0x36f3e944, Offset: 0x2cd2
// Size: 0x45
function getplayersinradiussharedfunc( origin, radius, desiredteam, excludeent )
{
    return utility::callsharedfunc( #"player", #"getplayersinradius", origin, radius, desiredteam, excludeent );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 2
// Checksum 0x7d72383c, Offset: 0x2d20
// Size: 0x30
function freezelookcontrolssharedfunc( frozen, force )
{
    return utility::callsharedfunc( #"player", #"freezelookcontrols", frozen, force );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0x591595ca, Offset: 0x2d59
// Size: 0x26
function enableplayerusesharedfunc( player )
{
    return utility::callsharedfunc( #"player", #"enableplayeruse", player );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0x623866a1, Offset: 0x2d88
// Size: 0x26
function disableplayerusesharedfunc( player )
{
    return utility::callsharedfunc( #"player", #"disableplayeruse", player );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0x93423cb, Offset: 0x2db7
// Size: 0x44
function setusingremotesharedfunc( remotename )
{
    if ( utility::issharedfuncdefined( #"player", #"setusingremote" ) )
    {
        [[ utility::getsharedfunc( #"player", #"setusingremote" ) ]]( remotename );
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0xdd0f36b2, Offset: 0x2e03
// Size: 0x44
function clearusingremotesharedfunc( bypassweaponswitch )
{
    if ( utility::issharedfuncdefined( #"player", #"clearusingremote" ) )
    {
        [[ utility::getsharedfunc( #"player", #"clearusingremote" ) ]]( bypassweaponswitch );
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 2
// Checksum 0xfc277974, Offset: 0x2e4f
// Size: 0x4e
function function_402861b2a628adf5( player, reason )
{
    if ( utility::issharedfuncdefined( #"dlog", #"branalytics_inventory_snapshot" ) )
    {
        [[ utility::getsharedfunc( #"dlog", #"branalytics_inventory_snapshot" ) ]]( player, reason );
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 3
// Checksum 0x4fd2c27a, Offset: 0x2ea5
// Size: 0x58
function function_2cf1eb77b5cce767( player, plunderspent, loadoutdata )
{
    if ( utility::issharedfuncdefined( #"dlog", #"branalytics_kiosk_purchaseloadout" ) )
    {
        [[ utility::getsharedfunc( #"dlog", #"branalytics_kiosk_purchaseloadout" ) ]]( player, plunderspent, loadoutdata );
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 3
// Checksum 0x470bde36, Offset: 0x2f05
// Size: 0x5a
function function_c53f3b7ee34ac027( confirmstring, cancelstring, endstring )
{
    if ( utility::issharedfuncdefined( #"killstreak", #"waittill_confirm_or_cancel" ) )
    {
        return self [[ utility::getsharedfunc( #"killstreak", #"waittill_confirm_or_cancel" ) ]]( confirmstring, cancelstring, endstring );
    }
    
    return undefined;
}

// Namespace namespace_9d8e359c3b1041e5
// Params 4
// Checksum 0xe0d8a156, Offset: 0x2f68
// Size: 0x45
function function_3c8eea397ed4fb54( bundle, killstreak, enableping, var_13ecbe20ea1c02d7 )
{
    return utility::callsharedfunc( #"killstreak", #"killstreak_registerMinimapInfo", bundle, killstreak, enableping, var_13ecbe20ea1c02d7 );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 10
// Checksum 0xeae65b95, Offset: 0x2fb6
// Size: 0x83
function function_14bc8bf38829a04d( streakname, killstreakvehicle, scorepopup, vodestroyed, destroyedsplash, var_c96bcef6709d6df1, var_d188942a41771ea1, premoddamagecallback, postmoddamagecallback, deathcallback )
{
    return utility::callsharedfunc( #"killstreak", #"killstreak_setupVehicleDamageFunctionality", streakname, killstreakvehicle, scorepopup, vodestroyed, destroyedsplash, var_c96bcef6709d6df1, var_d188942a41771ea1, premoddamagecallback, postmoddamagecallback, deathcallback );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 11
// Checksum 0xef986c42, Offset: 0x3042
// Size: 0x8d
function getmodifiedantikillstreakdamagesharedfunc( attacker, objweapon, meansofdeath, amount, maxhealth, divisorlrg, divisormed, divisorlow, divisormelee, divisortick, explodeoverride )
{
    return utility::callsharedfunc( #"killstreak", #"getmodifiedantikillstreakdamage", attacker, objweapon, meansofdeath, amount, maxhealth, divisorlrg, divisormed, divisorlow, divisormelee, divisortick, explodeoverride );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0x1af41611, Offset: 0x30d8
// Size: 0x26
function function_e1bccf11b2e6fa21( currenthealth )
{
    return utility::callsharedfunc( #"killstreak", #"killstreak_updateDamageState", currenthealth );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 2
// Checksum 0x1263df79, Offset: 0x3107
// Size: 0x30
function function_99585ce0ed7d5df7( streakinfo, location )
{
    return utility::callsharedfunc( #"killstreak", #"hash_183e3c892b7ef047", streakinfo, location );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 8
// Checksum 0xabbaeb6a, Offset: 0x3140
// Size: 0x6e
function function_9679b0a0e660244b( streakinfo, weaponobj, firednotify, weapongivencallback, weaponswitchendedcallback, weaponfiredcallback, weaponcleanupcallback, weapontakencallback )
{
    return utility::callsharedfunc( #"killstreak", #"streakdeploy_doweaponfireddeploy", streakinfo, weaponobj, firednotify, weapongivencallback, weaponswitchendedcallback, weaponfiredcallback, weaponcleanupcallback, weapontakencallback );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 0
// Checksum 0x53198e0b, Offset: 0x31b7
// Size: 0x37
function playerkillstreakgetownerlookatignoreentssharedfunc()
{
    if ( utility::issharedfuncdefined( #"killstreak", #"playerkillstreakgetownerlookatignoreents" ) )
    {
        return utility::callsharedfunc( #"killstreak", #"playerkillstreakgetownerlookatignoreents" );
    }
    
    return undefined;
}

// Namespace namespace_9d8e359c3b1041e5
// Params 6
// Checksum 0xb02464e7, Offset: 0x31f7
// Size: 0x59
function function_97660a74a9989a8a( owner, ownerteam, range, streakname, location, overrideheight )
{
    return utility::callsharedfunc( #"killstreak", #"killstreak_dangernotifyplayersinrange", owner, ownerteam, range, streakname, location, overrideheight );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 5
// Checksum 0xdad5d243, Offset: 0x3259
// Size: 0x4f
function registerkillstreaksharedfunc( streakname, triggeredfunc, availablefunc, directusefunc, cleanupfunc )
{
    return utility::callsharedfunc( #"killstreak", #"registerkillstreak", streakname, triggeredfunc, availablefunc, directusefunc, cleanupfunc );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 4
// Checksum 0xcf196dc3, Offset: 0x32b1
// Size: 0x45
function registerkillstreakdamagedealingweaponsharedfunc( streakname, var_bf295ddc16ebf8a0, damagesize, isplayerweapon )
{
    return utility::callsharedfunc( #"killstreak", #"registerKillstreakDamageDealingWeapon", streakname, var_bf295ddc16ebf8a0, damagesize, isplayerweapon );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 9
// Checksum 0x2b4da754, Offset: 0x32ff
// Size: 0x78
function registerkillstreakstowableweaponsharedfunc( streakname, weaponname, getweaponnamecallback, genericblueprintweaponkey, var_1a104ca5d22453a3, var_6e414cc6090725b6, var_140b97aca7f94974, weaponswitchendedcallback, var_20404e66691c7ed8 )
{
    return utility::callsharedfunc( #"killstreak", #"registerKillstreakStowableWeapon", streakname, weaponname, getweaponnamecallback, genericblueprintweaponkey, var_1a104ca5d22453a3, var_6e414cc6090725b6, var_140b97aca7f94974, weaponswitchendedcallback, var_20404e66691c7ed8 );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 3
// Checksum 0x333219ef, Offset: 0x3380
// Size: 0x3a
function registervisibilityomnvarforkillstreaksharedfunc( streakname, omnvarid, omnvarvalue )
{
    return utility::callsharedfunc( #"killstreak", #"registervisibilityomnvarforkillstreak", streakname, omnvarid, omnvarvalue );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 2
// Checksum 0x866c146b, Offset: 0x33c3
// Size: 0x30
function createstreakinfosharedfunc( streakname, owner )
{
    return utility::callsharedfunc( #"killstreak", #"createstreakinfo", streakname, owner );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 11
// Checksum 0x8ffa7065, Offset: 0x33fc
// Size: 0x8d
function function_b20b54e5f7666265( streakinfo, weapongivencallback, weaponswitchendedcallback, weaponcleanupcallback, weapontakencallback, var_199122e4d3f907ba, var_572ea452a1bc65ed, var_35a34784f1c6d395, var_9e428c3b74527aba, var_75defa1f64eb375a, var_37ae78e0de4a6e53 )
{
    return utility::callsharedfunc( #"killstreak", #"streakdeploy_doweapontabletdeploy", streakinfo, weapongivencallback, weaponswitchendedcallback, weaponcleanupcallback, weapontakencallback, var_199122e4d3f907ba, var_572ea452a1bc65ed, var_35a34784f1c6d395, var_9e428c3b74527aba, var_75defa1f64eb375a, var_37ae78e0de4a6e53 );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 0
// Checksum 0x455ad0e2, Offset: 0x3492
// Size: 0x1a
function getkillstreakairstrikeheightentsharedfunc()
{
    return utility::callsharedfunc( #"killstreak", #"getkillstreakairstrikeheightent" );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 6
// Checksum 0xd75408d5, Offset: 0x34b5
// Size: 0x59
function playkillstreaktacomdialogsharedfunc( streakinfo, legacydialog, dialog, bypasscooldown, delaytime, charactersuffix )
{
    return utility::callsharedfunc( #"killstreak", #"playKillstreakTacomDialog", streakinfo, legacydialog, dialog, bypasscooldown, delaytime, charactersuffix );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 2
// Checksum 0x116b021, Offset: 0x3517
// Size: 0x30
function function_8511f2e8c683aba7( equipmentref, dialog )
{
    return utility::callsharedfunc( #"killstreak", #"hash_34bea0ae9eceb6a6", equipmentref, dialog );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 3
// Checksum 0x8023a298, Offset: 0x3550
// Size: 0x3a
function playkillstreakteamleaderdialogsharedfunc( streakinfo, legacydialog, dialog )
{
    return utility::callsharedfunc( #"killstreak", #"playKillstreakTeamLeaderDialog", streakinfo, legacydialog, dialog );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0x9aec5bfa, Offset: 0x3593
// Size: 0x46
function forceusekillstreaksharedfunc( killstreakref )
{
    if ( utility::issharedfuncdefined( #"killstreak", #"forceusekillstreak" ) )
    {
        return self [[ utility::getsharedfunc( #"killstreak", #"forceusekillstreak" ) ]]( killstreakref );
    }
    
    return undefined;
}

// Namespace namespace_9d8e359c3b1041e5
// Params 3
// Checksum 0xc55c7f30, Offset: 0x35e2
// Size: 0x59
function showkillstreaksplashsharedfunc( splashref, streakval, fromcarepackage )
{
    if ( utility::issharedfuncdefined( #"airdrop", #"showkillstreaksplash" ) )
    {
        self thread [[ utility::getsharedfunc( #"airdrop", #"showkillstreaksplash" ) ]]( splashref, streakval, fromcarepackage );
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 7
// Checksum 0xea2a3109, Offset: 0x3643
// Size: 0x83
function awardkillstreaksharedfunc( streakname, source, overridelifeid, var_469a3c9c3145a68, overrideowner, var_f9c6f25b7483dfe6, blueprintindex )
{
    if ( utility::issharedfuncdefined( #"killstreak", #"awardkillstreak" ) )
    {
        self [[ utility::getsharedfunc( #"killstreak", #"awardkillstreak" ) ]]( streakname, source, overridelifeid, var_469a3c9c3145a68, overrideowner, var_f9c6f25b7483dfe6, blueprintindex );
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 2
// Checksum 0x859f1c13, Offset: 0x36ce
// Size: 0x30
function setvisibiilityomnvarforkillstreaksharedfunc( streakname, omnvarstate )
{
    return utility::callsharedfunc( #"killstreak", #"setVisibiilityOmnvarForKillstreak", streakname, omnvarstate );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0x191a313f, Offset: 0x3707
// Size: 0x26
function restorekillstreakplayeranglessharedfunc( player )
{
    return utility::callsharedfunc( #"killstreak", #"restorekillstreakplayerangles", player );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0xda091e04, Offset: 0x3736
// Size: 0x26
function recordkillstreakendstatssharedfunc( streakinfo )
{
    return utility::callsharedfunc( #"killstreak", #"recordkillstreakendstats", streakinfo );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0xe7842500, Offset: 0x3765
// Size: 0x26
function function_8bccb4b00f5a875( visionsetname )
{
    return utility::callsharedfunc( #"killstreak", #"killstreak_setMainVision", visionsetname );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0x69cbec7, Offset: 0x3794
// Size: 0x26
function function_3a44bd2b6f6088c( visionsetinfo )
{
    return utility::callsharedfunc( #"killstreak", #"killstreak_setSubVision", visionsetinfo );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 8
// Checksum 0xe6ba3120, Offset: 0x37c3
// Size: 0x6e
function function_ffa2c87979e812d5( streakinfo, weaponobj, keepweapon, weapongivencallback, weaponswitchendedcallback, weaponcleanupcallback, weapontakencallback, var_3a21d446a2f14d2c )
{
    return utility::callsharedfunc( #"killstreak", #"streakdeploy_doweaponswitchdeploy", streakinfo, weaponobj, keepweapon, weapongivencallback, weaponswitchendedcallback, weaponcleanupcallback, weapontakencallback, var_3a21d446a2f14d2c );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 3
// Checksum 0xd429ac15, Offset: 0x383a
// Size: 0x3a
function function_72d3b996e6ae4b55( deployweapon, immediateswitch, optionaltimedelay )
{
    return utility::callsharedfunc( #"killstreak", #"killstreak_switchBackLastWeapon", deployweapon, immediateswitch, optionaltimedelay );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0xfb3c7353, Offset: 0x387d
// Size: 0x26
function getridofkillstreakdeployweaponsharedfunc( weaponobj )
{
    return utility::callsharedfunc( #"killstreak", #"getridofkillstreakdeployweapon", weaponobj );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 3
// Checksum 0x7c023c5e, Offset: 0x38ac
// Size: 0x3a
function function_6a038785b2255be( user, disabletime, enableendons )
{
    return utility::callsharedfunc( #"killstreak", #"manualturret_disablefire", user, disabletime, enableendons );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0x420d5998, Offset: 0x38ef
// Size: 0x26
function function_527ddb9a226d10d1( clearaction )
{
    return utility::callsharedfunc( #"killstreak", #"manualturret_clearplacementinstructions", clearaction );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 2
// Checksum 0x8a24c7c6, Offset: 0x391e
// Size: 0x4f
function registerkillstreakweaponfiresharedfunc( streakinfo, weaponname )
{
    if ( utility::issharedfuncdefined( #"killstreak", #"registerKillstreakWeaponFire" ) )
    {
        self [[ utility::getsharedfunc( #"killstreak", #"registerKillstreakWeaponFire" ) ]]( streakinfo, weaponname );
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0x68ad6f49, Offset: 0x3975
// Size: 0x26
function function_19145ff013934a47( streakname )
{
    return utility::callsharedfunc( #"killstreak", #"hash_ae9fad232ee97408", streakname );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 3
// Checksum 0xdd4eb3fe, Offset: 0x39a4
// Size: 0x3a
function function_c6365cc879905dc2( data, changed, fromdeath )
{
    return utility::callsharedfunc( #"vehicle", #"vehicle_damage_clearvisuals", data, changed, fromdeath );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 2
// Checksum 0x53abefcf, Offset: 0x39e7
// Size: 0x4f
function vehicleminesgetleveldataforminesharedfunc( equipref, create )
{
    if ( utility::issharedfuncdefined( #"vehicle", #"vehicleMinesGetLevelDataForMine" ) )
    {
        return [[ utility::getsharedfunc( #"vehicle", #"vehicleMinesGetLevelDataForMine" ) ]]( equipref, create );
    }
    
    return undefined;
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0x6dad5cac, Offset: 0x3a3f
// Size: 0x26
function vehiclefindsafeexitpossharedfunc( guy )
{
    return utility::callsharedfunc( #"vehicle", #"vehicleFindSafeExitPos", guy );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 2
// Checksum 0x613bd20b, Offset: 0x3a6e
// Size: 0x4e
function registerspawnsharedfunc( entcount, deletefunc )
{
    if ( utility::issharedfuncdefined( #"entity", #"registerspawn" ) )
    {
        [[ utility::getsharedfunc( #"entity", #"registerspawn" ) ]]( entcount, deletefunc );
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 0
// Checksum 0x3ac398c0, Offset: 0x3ac4
// Size: 0x38
function deregisterspawnsharedfunc()
{
    if ( utility::issharedfuncdefined( #"entity", #"deregisterspawn" ) )
    {
        [[ utility::getsharedfunc( #"entity", #"deregisterspawn" ) ]]();
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0x72ca67cd, Offset: 0x3b04
// Size: 0x44
function removespawninfluencersharedfunc( handle )
{
    if ( utility::issharedfuncdefined( #"spawn", #"removeSpawnInfluencer" ) )
    {
        [[ utility::getsharedfunc( #"spawn", #"removeSpawnInfluencer" ) ]]( handle );
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 5
// Checksum 0x2ea7000, Offset: 0x3b50
// Size: 0x6e
function addspawninfluencersharedfunc( influencerkey, pos, friendlyteam, playerowner, linkedent )
{
    if ( utility::issharedfuncdefined( #"spawn", #"addSpawnInfluencer" ) )
    {
        return [[ utility::getsharedfunc( #"spawn", #"addSpawnInfluencer" ) ]]( influencerkey, pos, friendlyteam, playerowner, linkedent );
    }
    
    return undefined;
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0x5d1e790a, Offset: 0x3bc7
// Size: 0x26
function function_4c27e16d83fce53a( position )
{
    return utility::callsharedfunc( #"event", #"predatormissileimpact", position );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0xf5d3bd3a, Offset: 0x3bf6
// Size: 0x26
function function_1b4f3463636d75b5( position )
{
    return utility::callsharedfunc( #"event", #"largevehicleexplosion", position );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0x3a9e44ab, Offset: 0x3c25
// Size: 0x26
function function_3f6bebe1af42b0a8( damagedata )
{
    return utility::callsharedfunc( #"event", #"vehiclekilled", damagedata );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0x208c2c33, Offset: 0x3c54
// Size: 0x26
function function_ed5039695a18b289( missile )
{
    return utility::callsharedfunc( #"event", #"missilefired", missile );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 4
// Checksum 0x8ab171b9, Offset: 0x3c83
// Size: 0x45
function function_9b4fb0a03905926d( entity, applycallback, startcallback, clearcallback )
{
    return utility::callsharedfunc( #"emp", #"hash_a865e3770eb96298", entity, applycallback, startcallback, clearcallback );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0x97800953, Offset: 0x3cd1
// Size: 0x26
function function_7c5eb0e985e1d8c4( entity )
{
    return utility::callsharedfunc( #"emp", #"emp_debuff_deregister", entity );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0xdb118de, Offset: 0x3d00
// Size: 0x26
function function_d73d29dcf609e9c5( fromdeath )
{
    return utility::callsharedfunc( #"emp", #"clear_emp", fromdeath );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0x99c90dd8, Offset: 0x3d2f
// Size: 0x26
function function_d6980fc2a06afacd( status )
{
    return utility::callsharedfunc( #"emp", #"allow_emp", status );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 0
// Checksum 0xb0a8c47b, Offset: 0x3d5e
// Size: 0x1a
function function_d2b2cb6a7fea26de()
{
    return utility::callsharedfunc( #"emp", #"emp_debuff_get_emp_count" );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 0
// Checksum 0x79642fdc, Offset: 0x3d81
// Size: 0x1b, Type: bool
function function_8f8af5e1bb73f5de()
{
    return istrue( utility::callsharedfunc( #"emp", #"is_empd" ) );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 2
// Checksum 0xa6e6993, Offset: 0x3da5
// Size: 0x30
function function_40f642f8be5a19a1( scramblelevel, isjammer )
{
    return utility::callsharedfunc( #"emp", #"play_scramble", scramblelevel, isjammer );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 2
// Checksum 0x9e547570, Offset: 0x3dde
// Size: 0x30
function function_46eb704c6fe72343( scramblelevel, isjammer )
{
    return utility::callsharedfunc( #"emp", #"stop_scramble", scramblelevel, isjammer );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 2
// Checksum 0x62cd48f7, Offset: 0x3e17
// Size: 0x30
function function_62b4af8718fa499b( optionalorigin, optionalradius )
{
    return utility::callsharedfunc( #"emp", #"emp_debuff_get_emp_ents", optionalorigin, optionalradius );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 3
// Checksum 0x5853a22f, Offset: 0x3e50
// Size: 0x3a
function playsoundtoplayersharedfunc( aliasname, player, srcentity )
{
    return utility::callsharedfunc( #"sound", #"playsoundtoplayer", aliasname, player, srcentity );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 5
// Checksum 0xff1712c6, Offset: 0x3e93
// Size: 0x4f
function spawnfxforclientsharedfunc( fxid, position, player, forward, up )
{
    return utility::callsharedfunc( #"fx", #"spawnfxforclient", fxid, position, player, forward, up );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 0
// Checksum 0xd0636a69, Offset: 0x3eeb
// Size: 0x1b
function setfxkilldefondeletesharedfunc()
{
    utility::callsharedfunc( #"fx", #"setfxkilldefondelete" );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 3
// Checksum 0x3a61c351, Offset: 0x3f0e
// Size: 0x3a
function function_bb9b98eb7368a15a( scriptbundle_name, current_round, var_97ec033c18291ffa )
{
    return utility::callsharedfunc( #"zombie", #"health_scaling_get_starting_health", scriptbundle_name, current_round, var_97ec033c18291ffa );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 3
// Checksum 0xd59e4e69, Offset: 0x3f51
// Size: 0x3a
function function_870440d8340968c0( subclass, current_round, var_97ec033c18291ffa )
{
    return utility::callsharedfunc( #"zombie", #"health_scaling_get_subclass_health", subclass, current_round, var_97ec033c18291ffa );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0xf72831e5, Offset: 0x3f94
// Size: 0x26
function function_b2ccfa9f49ce6938( current_round )
{
    return utility::callsharedfunc( #"zombie", #"hash_e27e55920dabe660", current_round );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0xd7fba238, Offset: 0x3fc3
// Size: 0x26
function function_e4935f0a53f85b86( current_round )
{
    return utility::callsharedfunc( #"zombie", #"hash_97c7552f5ba94f2c", current_round );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0xfe45e182, Offset: 0x3ff2
// Size: 0x26
function function_ba64ecf971fcc9ba( current_round )
{
    return utility::callsharedfunc( #"zombie", #"hash_c726695b2536f1a", current_round );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 0
// Checksum 0x36e0a2da, Offset: 0x4021
// Size: 0x1a
function function_6977eb27282ef178()
{
    return utility::callsharedfunc( #"zombie", #"ammo_mod_cooldown_init" );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0xa6f10262, Offset: 0x4044
// Size: 0x27, Type: bool
function function_f3b72bf1c0b8c737( w_current )
{
    return istrue( utility::callsharedfunc( #"zombie", #"has_ammo_mod", w_current ) );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0x99538863, Offset: 0x4074
// Size: 0x26
function function_30cd19b8533d27d2( w_current )
{
    return utility::callsharedfunc( #"zombie", #"get_ammo_mod_name", w_current );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0xa4ffdad3, Offset: 0x40a3
// Size: 0x26
function getplayerweaponraritysharedfunc( weapon )
{
    return utility::callsharedfunc( #"zombie", #"GetPlayerWeaponRarity", weapon );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0xb589b0e0, Offset: 0x40d2
// Size: 0x26
function function_1d4087075103b248( weapon )
{
    return utility::callsharedfunc( #"zombie", #"get_pap_level", weapon );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0xd9513fce, Offset: 0x4101
// Size: 0x26
function function_d14f9550ec3c9c39( dmg_struct )
{
    return utility::callsharedfunc( #"zombie", #"scaleUnderbarrelDamageByRound", dmg_struct );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 0
// Checksum 0x983f7f4b, Offset: 0x4130
// Size: 0x1a
function function_fd2dd8546ecc345e()
{
    return utility::callsharedfunc( #"zombie", #"hash_5140dd0eed11854c" );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 10
// Checksum 0x6b4be93e, Offset: 0x4153
// Size: 0x83
function onHumanoidAgentKilledCommon_SharedFunc( einflictor, eattacker, idamage, smeansofdeath, objweapon, vdir, shitloc, timeoffset, deathanimduration, dropweapons )
{
    return utility::callsharedfunc( #"ai", #"onHumanoidAgentKilledCommon_SharedFunc", einflictor, eattacker, idamage, smeansofdeath, objweapon, vdir, shitloc, timeoffset, deathanimduration, dropweapons );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 6
// Checksum 0x5fa0e475, Offset: 0x41df
// Size: 0x59
function spawnnewaitype_sharedfunc( aitype, position, angles, team, characterlistname, gender )
{
    return utility::callsharedfunc( #"ai", #"spawnnewaitype_sharedfunc", aitype, position, angles, team, characterlistname, gender );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 6
// Checksum 0x769aea4c, Offset: 0x4241
// Size: 0x59
function animscripted_sharedfunc( anime, anim_string, org, animangles, anim_flag, dont_clear )
{
    return utility::callsharedfunc( #"ai", #"Animscripted_SharedFunc", anime, anim_string, org, animangles, anim_flag, dont_clear );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0x5637a250, Offset: 0x42a3
// Size: 0x26
function get_aitype_by_subclass_sharedfunc( subclass )
{
    return utility::callsharedfunc( #"ai", #"get_aitype_by_subclass_sharedfunc", subclass );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 0
// Checksum 0x3fce2386, Offset: 0x42d2
// Size: 0x1a
function get_aitype_default_spawn_team_SharedFunc()
{
    return utility::callsharedfunc( #"ai", #"get_aitype_default_spawn_team_SharedFunc" );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 11
// Checksum 0x745a1500, Offset: 0x42f5
// Size: 0x8d
function displaydamagenumber_sharedfunc( eattacker, etargethit, shitloc, smeansofdeath, sweapon, idamage, vpoint, isimmnue, selement, biscritical, var_4f9d5587bf9a2b1e )
{
    return utility::callsharedfunc( #"ai", #"displaydamagenumber_sharedfunc", eattacker, etargethit, shitloc, smeansofdeath, sweapon, idamage, vpoint, isimmnue, selement, biscritical, var_4f9d5587bf9a2b1e );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0xe0f3e42f, Offset: 0x438b
// Size: 0x26
function giveaiweapon_sharedfunc( weapname )
{
    return utility::callsharedfunc( #"ai", #"giveAIWeapon", weapname );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 0
// Checksum 0xcae7b471, Offset: 0x43ba
// Size: 0x1a
function getfreeaicount_sharedfunc()
{
    return utility::callsharedfunc( #"ai", #"getfreeaicount" );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 2
// Checksum 0x6ae9c07d, Offset: 0x43dd
// Size: 0x4f
function showpoweruphudsharedfunc( powerupname, lifetime )
{
    if ( utility::issharedfuncdefined( #"powerups", #"showPowerupHud" ) )
    {
        self [[ utility::getsharedfunc( #"powerups", #"showPowerupHud" ) ]]( powerupname, lifetime );
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 0
// Checksum 0x63326566, Offset: 0x4434
// Size: 0x39
function dopowerupscoreeventsharedfunc()
{
    if ( utility::issharedfuncdefined( #"powerups", #"doPowerupScoreEvent" ) )
    {
        self [[ utility::getsharedfunc( #"powerups", #"doPowerupScoreEvent" ) ]]();
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 3
// Checksum 0x3a6ac77a, Offset: 0x4475
// Size: 0x59
function droppowerupsharedfunc( powerupname, spawnpos, lifetimeOverride )
{
    if ( utility::issharedfuncdefined( #"powerups", #"dropPowerup" ) )
    {
        return self [[ utility::getsharedfunc( #"powerups", #"dropPowerup" ) ]]( powerupname, spawnpos, lifetimeOverride );
    }
}

// Namespace namespace_9d8e359c3b1041e5
// Params 0
// Checksum 0xd1938758, Offset: 0x44d6
// Size: 0x1a
function function_9cce6b480d1d501a()
{
    return utility::callsharedfunc( #"points", #"get_points" );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0x25c4ebc4, Offset: 0x44f9
// Size: 0x26
function function_95e6efa0e69ace16( points )
{
    return utility::callsharedfunc( #"points", #"set_points", points );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0x709d0590, Offset: 0x4528
// Size: 0x26
function function_c46160a261771d5d( points )
{
    return utility::callsharedfunc( #"points", #"add_points", points );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 1
// Checksum 0x11b7fea3, Offset: 0x4557
// Size: 0x26
function function_6ea1ac037efdef01( points )
{
    return utility::callsharedfunc( #"points", #"take_points", points );
}

// Namespace namespace_9d8e359c3b1041e5
// Params 2
// Checksum 0xedd4ec3a, Offset: 0x4586
// Size: 0x30
function function_95538e4344ab0bfb( dvar_value, func )
{
    return utility::callsharedfunc( #"dev", #"register_dev_console_callback", dvar_value, func );
}

