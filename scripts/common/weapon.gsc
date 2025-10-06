#using scripts\common\callbacks;
#using scripts\common\system;
#using scripts\common\utility;
#using scripts\engine\utility;

#namespace weapon;

// Namespace weapon
// Params 0, eflags: 0x5
// Checksum 0x113ba7da, Offset: 0xb84
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"common_weapons", undefined, &weapons_init, undefined );
}

// Namespace weapon
// Params 0
// Checksum 0xcd736d67, Offset: 0xba5
// Size: 0x254
function weapons_init()
{
    function_8eff8abb44086548();
    level.maxattachments = [];
    maxattachments = level.gamemodebundle.maxattachments;
    maxattachmentsprimary = { #gunfighter:level.gamemodebundle.maxattachments.gunfighterprimary, #standard:isdefined( maxattachments ) ? maxattachments.defaultprimary : 8 };
    level.maxattachments[ level.maxattachments.size ] = maxattachmentsprimary;
    maxattachmentssecondary = { #gunfighter:level.gamemodebundle.maxattachments.gunfightersecondary, #standard:isdefined( maxattachments ) ? maxattachments.defaultsecondary : 5 };
    level.maxattachments[ level.maxattachments.size ] = maxattachmentssecondary;
    maxattachmentstertiary = { #gunfighter:level.gamemodebundle.gunfightertertiary, #standard:isdefined( maxattachments ) ? maxattachments.defaulttertiary : 5 };
    level.maxattachments[ level.maxattachments.size ] = maxattachmentstertiary;
    level.var_e0dc368290d94a40 = [];
    
    if ( isdefined( level.gamemodebundle.var_74c8e9104c137cd4 ) )
    {
        foreach ( attachment in level.gamemodebundle.var_74c8e9104c137cd4 )
        {
            level.var_e0dc368290d94a40[ level.var_e0dc368290d94a40.size ] = attachment.attachment;
        }
    }
    else
    {
        level.var_e0dc368290d94a40 = [ "laserir_box", "laserir_cyl", "laserir_pstl" ];
    }
    
    level callback::add( #"hash_500e33f5505ca842", &function_3c1487d3e0c3cf41 );
}

/#

    // Namespace weapon
    // Params 9
    // Checksum 0x23804110, Offset: 0xe01
    // Size: 0x7e, Type: dev
    function validateweapon( rootname, attachments, camo, reticle, variantid, attachmentids, cosmeticattachment, stickers, hasnvg )
    {
        if ( !iskillstreakplayerweapon( rootname ) )
        {
            rootname = getweaponrootname( rootname );
        }
        
        if ( !validateweaponassetnamemap( rootname ) )
        {
            return 0;
        }
        
        return 1;
    }

#/

// Namespace weapon
// Params 1
// Checksum 0x6492001e, Offset: 0xe87
// Size: 0x96
function function_a972ae5c8fb5933( weaponinfo )
{
    return buildweapon( weaponinfo.weaponref, weaponinfo.attachmentrefs, weaponinfo.weaponcamo, weaponinfo.weaponreticle, weaponinfo.weaponvariant, weaponinfo.attachmentids, weaponinfo.var_503736b08ffc8805, weaponinfo.weaponstickers, weaponinfo.hasnvg, weaponinfo.attachmenttuning, weaponinfo.iscustom, weaponinfo.var_daad5d0a48a7283e );
}

// Namespace weapon
// Params 12
// Checksum 0x39eb993b, Offset: 0xf26
// Size: 0x23e
function buildweapon( rootname, attachments, camo = "camo_none", reticle, variantid, attachmentids, cosmeticattachment, stickers, hasnvg, attachmenttuning, iscustom, var_daad5d0a48a7283e )
{
    if ( "none" == rootname )
    {
        return level.weaponnone;
    }
    
    if ( isdefined( attachments ) )
    {
        assert( isarray( attachments ), "<dev string:x24>" );
    }
    else
    {
        attachments = [];
    }
    
    if ( isstring( reticle ) )
    {
        if ( reticle == "none" )
        {
            reticle = %"";
        }
        else
        {
            if ( !isstartstr( reticle, "reticledata:" ) )
            {
                reticle = "reticledata:" + reticle;
            }
            
            reticle = getxhashasset( reticle );
        }
    }
    
    if ( isdefined( variantid ) && ( isstring( variantid ) && variantid == "-1" || isint( variantid ) && variantid <= 0 ) )
    {
        variantid = undefined;
    }
    
    weaponassetname = weaponassetnamemap( rootname );
    weaponobj = buildweaponinternal( weaponassetname, attachments, camo, reticle, variantid, attachmentids, cosmeticattachment, stickers, iscustom, var_daad5d0a48a7283e );
    
    /#
        if ( isdefined( weaponobj.camo ) )
        {
            assert( function_2b94fc4d332569a5( weaponobj ), "<dev string:x56>" + weaponobj.camo + "<dev string:x7f>" + weaponobj.basename );
        }
    #/
    
    if ( !isdefined( weaponobj ) )
    {
        return;
    }
    
    if ( hasnvg )
    {
        if ( weaponsupportslaserir( weaponobj ) && function_ad2262e5ff0331a3( weaponobj ) )
        {
            nvgattachment = getweaponnvgattachment( weaponobj );
            
            if ( nvgattachment != "invalid" && ( isdefined( weaponobj.attachments ) && !arraycontains( weaponobj.attachments, nvgattachment ) || !isdefined( weaponobj.attachments ) ) )
            {
                weaponobj = weaponobj withattachment( nvgattachment );
            }
        }
    }
    
    if ( isdefined( level.var_cfde89929188f64e ) && isdefined( weaponobj ) )
    {
        weaponobj = self [[ level.var_cfde89929188f64e ]]( weaponobj );
    }
    
    return weaponobj;
}

// Namespace weapon
// Params 3
// Checksum 0x84c3db44, Offset: 0x116d
// Size: 0x109
function function_bfc8095d723355fa( weaponassetname, blueprint, camo )
{
    if ( !weaponexists( weaponassetname ) )
    {
        if ( isdefined( level.weaponmapdata[ weaponassetname ] ) )
        {
            weaponassetname = level.weaponmapdata[ weaponassetname ].assetname;
        }
        else
        {
            return undefined;
        }
    }
    
    variantid = 0;
    
    if ( isxhashasset( blueprint ) )
    {
        blueprints = getweaponblueprintnames( weaponassetname );
        
        foreach ( variant, id in blueprints )
        {
            if ( blueprint == variant )
            {
                variantid = id;
                break;
            }
        }
    }
    else
    {
        variantid = blueprint ?? 0;
    }
    
    return buildweapon( weaponassetname, undefined, camo, undefined, variantid );
}

// Namespace weapon
// Params 0
// Checksum 0x98b549ef, Offset: 0x127f
// Size: 0x7
function function_15140c189cc65e1e()
{
    return &buildweapon;
}

// Namespace weapon
// Params 1
// Checksum 0x1c2f43fe, Offset: 0x128f
// Size: 0x17
function isattachmentironsdefault( attachment )
{
    return issubstr( attachment, "ironsdefault_" );
}

// Namespace weapon
// Params 1
// Checksum 0x641b11b8, Offset: 0x12af
// Size: 0x41
function attachmentmap_tocategory( attachmentname )
{
    assert( isdefined( level.var_cd6bd69e56b4e5b4 ), "<dev string:x95>" );
    
    if ( isdefined( level.var_cd6bd69e56b4e5b4[ attachmentname ] ) )
    {
        return level.var_cd6bd69e56b4e5b4[ attachmentname ];
    }
    
    return undefined;
}

// Namespace weapon
// Params 1
// Checksum 0xa7061e0, Offset: 0x12f9
// Size: 0x106
function attachmentmap_toextra( attachmentname )
{
    assert( isdefined( level.var_2e4b961b65909f5a ), "<dev string:xe6>" );
    
    if ( isdefined( level.var_2e4b961b65909f5a[ attachmentname ] ) )
    {
        extraattachments = [];
        extraattachmentlist = level.var_2e4b961b65909f5a[ attachmentname ];
        
        foreach ( entry in extraattachmentlist )
        {
            if ( !isdefined( entry.attachmentextra ) || entry.attachmentextra == "" )
            {
                continue;
            }
            
            extraattachments[ entry.attachmentextra ] = entry.attachmentextra;
        }
        
        return extraattachments;
    }
    
    return undefined;
}

// Namespace weapon
// Params 0, eflags: 0x4
// Checksum 0xd7c26b4a, Offset: 0x1407
// Size: 0x4ac
function private buildattachmentmaps()
{
    assert( !isdefined( level.var_2e4b961b65909f5a ), "<dev string:x134>" );
    assert( !isdefined( level.weaponattachments ), "<dev string:x17c>" );
    assert( !isdefined( level.weaponattachmentsmap ), "<dev string:x1c9>" );
    assert( isdefined( level.weaponmapdata ), "<dev string:x21a>" );
    
    if ( game[ #"levelcache" ].weaponattachments )
    {
        level.var_2e4b961b65909f5a = game[ #"levelcache" ].var_2e4b961b65909f5a;
        level.weaponattachments = game[ #"levelcache" ].weaponattachments;
        level.var_cd6bd69e56b4e5b4 = game[ #"levelcache" ].var_cd6bd69e56b4e5b4;
        return;
    }
    
    level.var_2e4b961b65909f5a = [];
    level.weaponattachments = [];
    level.var_cd6bd69e56b4e5b4 = [];
    function_ea865062f19beca0();
    slotarray = [];
    
    foreach ( slot in level.attachmentslotarray )
    {
        slotarray[ slotarray.size ] = slot;
    }
    
    var_e5042059ee422f62 = [ #"lootid", #"category", #"hideinui", #"hash_febd8701371cdffe" ];
    
    foreach ( weaponnamekey in level.weaponmapdata )
    {
        if ( isdefined( weaponnamekey.assetname ) && isdefined( weaponnamekey.group ) )
        {
            foreach ( slot in slotarray )
            {
                var_bba76b2d884ae9dc = function_2e5ecdd8ac47f308( weaponnamekey.assetname, slot, 1 );
                
                if ( isdefined( var_bba76b2d884ae9dc ) )
                {
                    foreach ( attachment in var_bba76b2d884ae9dc )
                    {
                        attachmentdataname = function_333a08591af6b59( weaponnamekey.assetname, attachment );
                        
                        if ( isdefined( attachmentdataname ) )
                        {
                            bundle = getscriptbundlefieldvalues( attachmentdataname, var_e5042059ee422f62 );
                            
                            if ( isdefined( bundle.lootid ) )
                            {
                                if ( isdefined( level.weaponattachments[ attachment ] ) )
                                {
                                    continue;
                                }
                                
                                if ( ( bundle.var_7253350d567fa007.size ?? 0 ) > 0 )
                                {
                                    if ( !isdefined( level.var_2e4b961b65909f5a[ attachment ] ) )
                                    {
                                        level.var_2e4b961b65909f5a[ attachment ] = bundle.var_7253350d567fa007;
                                    }
                                }
                                
                                if ( bundle.var_d5397d32802d520f )
                                {
                                    level.weaponattachments[ attachment ] = 0;
                                    continue;
                                }
                                
                                category = bundle.category;
                                
                                if ( isdefined( category ) && bundle.category != "NONE" )
                                {
                                    level.weaponattachments[ attachment ] = bundle.lootid;
                                    level.var_cd6bd69e56b4e5b4[ attachment ] = category;
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    if ( !isdefined( game[ #"levelcache" ] ) )
    {
        game[ #"levelcache" ] = {};
    }
    
    game[ #"levelcache" ].var_2e4b961b65909f5a = level.var_2e4b961b65909f5a;
    game[ #"levelcache" ].weaponattachments = level.weaponattachments;
    game[ #"levelcache" ].var_cd6bd69e56b4e5b4 = level.var_cd6bd69e56b4e5b4;
}

// Namespace weapon
// Params 0
// Checksum 0x200a184, Offset: 0x18bb
// Size: 0x14c
function function_f0809b09de2ec21b()
{
    assert( isdefined( level.weaponmapdata ), "<dev string:x25c>" );
    blueprintsarray = [];
    
    foreach ( weapon in level.weaponmapdata )
    {
        blueprints = getweaponblueprintnames( weapon.assetname );
        
        if ( blueprints.size > 0 )
        {
            blueprintsarray[ weapon.assetname ] = [];
            
            foreach ( id in blueprints )
            {
                blueprintsarray[ weapon.assetname ][ blueprintsarray[ weapon.assetname ].size ] = id;
            }
        }
    }
    
    return blueprintsarray;
}

// Namespace weapon
// Params 1
// Checksum 0x5a85136e, Offset: 0x1a10
// Size: 0x216
function weaponattachremoveextraattachments( attachments )
{
    assert( isdefined( level.var_2e4b961b65909f5a ), "<dev string:x2a9>" );
    extraattachmentlist = [];
    
    foreach ( attachment in attachments )
    {
        var_f14127ae795ac414 = attachmentmap_toextra( attachment );
        
        if ( isdefined( var_f14127ae795ac414 ) )
        {
            extraattachmentlist[ extraattachmentlist.size ] = var_f14127ae795ac414;
        }
    }
    
    attachmentsfiltered = [];
    
    foreach ( attachment in attachments )
    {
        isextraattachment = 0;
        
        foreach ( extraattachments in extraattachmentlist )
        {
            foreach ( extraattach in extraattachments )
            {
                if ( attachment == extraattach )
                {
                    isextraattachment = 1;
                    break;
                }
            }
        }
        
        if ( !isextraattachment )
        {
            attachmentsfiltered[ attachmentsfiltered.size ] = attachment;
        }
    }
    
    return attachmentsfiltered;
}

// Namespace weapon
// Params 1
// Checksum 0x484594a4, Offset: 0x1c2f
// Size: 0x17
function isakimbo( weapon )
{
    return getweaponhasperk( weapon, "specialty_akimbo" );
}

// Namespace weapon
// Params 2
// Checksum 0xedfc83a8, Offset: 0x1c4f
// Size: 0x74
function getattachmentlootid( weaponname, attachref )
{
    if ( !isdefined( level.weaponattachments[ attachref ] ) )
    {
        lootinfo = utility::callsharedfunc( #"loot", #"getLootItemInfoFromRef", attachref );
        level.weaponattachments[ attachref ] = lootinfo.itemid ?? 0;
    }
    
    return level.weaponattachments[ attachref ];
}

// Namespace weapon
// Params 0
// Checksum 0x724b13e3, Offset: 0x1ccc
// Size: 0xc7
function buildweaponrootlist()
{
    rootweapons = [];
    
    foreach ( weapon, data in level.weaponmapdata )
    {
        if ( isdefined( data.group ) )
        {
            if ( !issubstr( data.group, "weapon_" ) )
            {
                continue;
            }
            
            if ( data.group == "weapon_other" )
            {
                continue;
            }
            
            rootweapons[ rootweapons.size ] = weapon;
        }
    }
    
    return rootweapons;
}

/#

    // Namespace weapon
    // Params 1
    // Checksum 0x9a981c00, Offset: 0x1d9c
    // Size: 0x35, Type: dev
    function validateweaponassetnamemap( weaponroot )
    {
        if ( iskillstreakweapon( weaponroot ) )
        {
            return 1;
        }
        
        return isdefined( level.weaponmapdata[ weaponroot ].assetname );
    }

#/

// Namespace weapon
// Params 1
// Checksum 0xa4ef1e3f, Offset: 0x1dd9
// Size: 0x63
function weaponassetnamemap( weaponroot )
{
    if ( weaponexists( weaponroot ) )
    {
        return weaponroot;
    }
    
    if ( iskillstreakweapon( weaponroot ) )
    {
        return weaponroot;
    }
    
    var_7237854e3be197ca = level.weaponmapdata[ weaponroot ].assetname;
    
    if ( isdefined( var_7237854e3be197ca ) )
    {
        return var_7237854e3be197ca;
    }
    
    assertmsg( "<dev string:x300>" + weaponroot );
    return weaponroot;
}

// Namespace weapon
// Params 1
// Checksum 0xc9dd0236, Offset: 0x1e45
// Size: 0x4f
function weapongroupmap( weaponroot )
{
    var_7237854e3be197ca = level.weaponmapdata[ weaponroot ].group;
    
    if ( isdefined( var_7237854e3be197ca ) )
    {
        return var_7237854e3be197ca;
    }
    
    assert( isdefined( level.weaponmapdata ), "<dev string:x341>" );
    return undefined;
}

// Namespace weapon
// Params 1
// Checksum 0x6587593f, Offset: 0x1e9d
// Size: 0x30, Type: bool
function function_56e69ba2c15e84a1( weaponroot )
{
    assert( isdefined( level.weaponmapdata ), "<dev string:x384>" );
    return isdefined( level.weaponmapdata[ weaponroot ] );
}

// Namespace weapon
// Params 0, eflags: 0x4
// Checksum 0x76f6dccc, Offset: 0x1ed6
// Size: 0x5d0
function private buildweaponmap()
{
    assert( !isdefined( level.weaponmapdata ), "<dev string:x3c8>" );
    
    if ( game[ #"levelcache" ].weaponmapdata )
    {
        level.weaponmapdata = game[ #"levelcache" ].weaponmapdata;
        level.weapongroupdata = game[ #"levelcache" ].weapongroupdata;
        level.weaponlistbundle = game[ #"levelcache" ].weaponlistbundle;
        return;
    }
    
    level.weaponmapdata = [];
    level.weapongroupdata = [];
    weaponsscriptbundle = function_16ff7d597f441100();
    
    if ( isdefined( weaponsscriptbundle ) )
    {
        bundlevalues = [ #"ref", #"group", #"displayorder", #"asset", #"assetrefsp", #"name", #"perk", #"speedscale", #"hash_1469d2b702a6d5f8", #"lootid", #"botpersonality", #"isactivearmory", #"isknife", #"issharpmelee" ];
        
        foreach ( weaponname in weaponsscriptbundle )
        {
            weaponscriptbundle = function_659a3e10e8d1c91c( weaponname, bundlevalues );
            weapon = weaponscriptbundle.ref;
            weapon_asset = undefined;
            
            if ( weaponexists( weaponscriptbundle.asset ) )
            {
                weapon_asset = weaponscriptbundle.asset;
            }
            else if ( weaponexists( weaponscriptbundle.var_f77da0a397c1f8dc ) )
            {
                weapon_asset = weaponscriptbundle.var_f77da0a397c1f8dc;
            }
            
            if ( isdefined( weapon_asset ) )
            {
                level.weaponmapdata[ weapon ] = spawnstruct();
                group = weaponscriptbundle.group;
                
                if ( group )
                {
                    level.weaponmapdata[ weapon ].group = group;
                    uidisplayorder = weaponscriptbundle.displayorder ?? 0;
                    
                    if ( uidisplayorder > -1 )
                    {
                        if ( !isdefined( level.weapongroupdata[ group ] ) )
                        {
                            level.weapongroupdata[ group ] = [];
                        }
                        
                        level.weapongroupdata[ group ][ level.weapongroupdata[ group ].size ] = weapon;
                    }
                    else
                    {
                        level.weaponmapdata[ weapon ].uihidden = 1;
                    }
                }
                
                assetname = weapon_asset;
                
                if ( assetname )
                {
                    level.weaponmapdata[ weapon ].assetname = assetname;
                }
                
                locname = weaponscriptbundle.name;
                
                if ( isdefined( locname ) && locname != &"" )
                {
                    level.weaponmapdata[ weapon ].locname = locname;
                }
                
                perk = weaponscriptbundle.perk;
                
                if ( perk )
                {
                    level.weaponmapdata[ weapon ].perk = perk;
                }
                
                level.weaponmapdata[ weapon ].weaponlootid = weaponscriptbundle.lootid;
                movespeed = weaponscriptbundle.speedscale;
                
                if ( isdefined( movespeed ) )
                {
                    level.weaponmapdata[ weapon ].speed = movespeed;
                    assert( movespeed > 0 && movespeed <= 1, "<dev string:x3fd>" + weapon );
                }
                
                var_d1f25dd2efe2402f = weaponscriptbundle.var_d1f25dd2efe2402f;
                
                if ( isdefined( var_d1f25dd2efe2402f ) )
                {
                    level.weaponmapdata[ weapon ].var_d1f25dd2efe2402f = var_d1f25dd2efe2402f;
                }
                
                botpersonalities = weaponscriptbundle.botpersonality;
                
                if ( isdefined( botpersonalities ) )
                {
                    level.weaponmapdata[ weapon ].botpersonalities = strtok( botpersonalities, "|" );
                }
                
                activearmoryenabled = weaponscriptbundle.isactivearmory;
                
                if ( isdefined( activearmoryenabled ) )
                {
                    level.weaponmapdata[ weapon ].activearmoryenabled = activearmoryenabled;
                }
                
                if ( isequipmentaddon( weapon ) )
                {
                    level.weaponmapdata[ weapon ].isequipmentaddon = 1;
                }
                
                isknife = weaponscriptbundle.isknife;
                
                if ( isdefined( isknife ) )
                {
                    level.weaponmapdata[ weapon ].isknife = 1;
                }
                
                var_77f83d3835410d2e = weaponscriptbundle.var_77f83d3835410d2e;
                
                if ( isdefined( isknife ) )
                {
                    level.weaponmapdata[ weapon ].var_77f83d3835410d2e = 1;
                }
            }
        }
    }
    
    if ( !isdefined( game[ #"levelcache" ] ) )
    {
        game[ #"levelcache" ] = {};
    }
    
    game[ #"levelcache" ].weaponmapdata = level.weaponmapdata;
    game[ #"levelcache" ].weapongroupdata = level.weapongroupdata;
    game[ #"levelcache" ].weaponlistbundle = level.weaponlistbundle;
}

// Namespace weapon
// Params 0, eflags: 0x4
// Checksum 0xca6f07cc, Offset: 0x24ae
// Size: 0x31a
function private function_47c21f91a5f180b8()
{
    assert( !isdefined( level.weaponmappedcamos ), "<dev string:x436>" );
    
    if ( game[ #"levelcache" ].weaponmappedcamos )
    {
        level.weaponmappedcamos = game[ #"levelcache" ].weaponmappedcamos;
        return;
    }
    
    level.weaponmappedcamos = [];
    camolistbundle = undefined;
    camofields = [ #"ref", #"weaponref", #"lootid", #"weaponclass" ];
    
    if ( isdefined( level.gamemodebundle.weaponcamolist ) )
    {
        camolistbundle = getscriptbundle( level.gamemodebundle.weaponcamolist );
    }
    
    if ( !( isdefined( camolistbundle ) && isdefined( camolistbundle.camo_list ) ) )
    {
        return;
    }
    
    foreach ( camoname in camolistbundle.camo_list )
    {
        if ( !isdefined( camoname.camodata ) )
        {
            continue;
        }
        
        camobundle = getscriptbundlefieldvalues( camoname.camodata, camofields );
        
        /#
            function_ce79080c3dd2d8ba( camobundle.ref, camoname.camodata );
        #/
        
        mappings = [ camobundle.weaponref, camobundle.weaponclass ];
        pathway = undefined;
        
        foreach ( param in mappings )
        {
            if ( tolower( param ) != "none" )
            {
                if ( isdefined( pathway ) )
                {
                    assertmsg( "<dev string:x475>" );
                    println( getxhashsourcename( camoname.camodata ) + "<dev string:x4ac>" );
                    break;
                }
                
                pathway = param;
            }
        }
        
        if ( isdefined( pathway ) )
        {
            if ( !isdefined( level.weaponmappedcamos[ pathway ] ) )
            {
                level.weaponmappedcamos[ pathway ] = [];
            }
            
            level.weaponmappedcamos[ pathway ][ camobundle.ref ] = camobundle.lootid;
        }
    }
    
    /#
        function_1f7dda67483b1149();
    #/
    
    if ( !isdefined( game[ #"levelcache" ] ) )
    {
        game[ #"levelcache" ] = {};
    }
    
    game[ #"levelcache" ].weaponmappedcamos = level.weaponmappedcamos;
}

/#

    // Namespace weapon
    // Params 2
    // Checksum 0xe5070710, Offset: 0x27d0
    // Size: 0x6b, Type: dev
    function function_ce79080c3dd2d8ba( camoreference, bundlename )
    {
        if ( !isdefined( level.var_63473892ef2a718e ) )
        {
            level.var_63473892ef2a718e = [];
        }
        
        if ( !isdefined( level.var_63473892ef2a718e[ camoreference ] ) )
        {
            level.var_63473892ef2a718e[ camoreference ] = [];
        }
        
        level.var_63473892ef2a718e[ camoreference ][ level.var_63473892ef2a718e[ camoreference ].size ] = bundlename;
    }

    // Namespace weapon
    // Params 0
    // Checksum 0xa63e110f, Offset: 0x2843
    // Size: 0xb9, Type: dev
    function function_1f7dda67483b1149()
    {
        if ( !isdefined( level.var_63473892ef2a718e ) )
        {
            println( "<dev string:x4ee>" );
            return;
        }
        
        foreach ( camoname, camo in level.var_63473892ef2a718e )
        {
            if ( camo.size == 1 )
            {
                level.var_63473892ef2a718e[ camoname ] = undefined;
            }
        }
        
        level.var_63473892ef2a718e = function_f943bef551ff028c( level.var_63473892ef2a718e );
    }

#/

// Namespace weapon
// Params 1
// Checksum 0x3f4ecace, Offset: 0x2904
// Size: 0x145
function function_2b94fc4d332569a5( objweapon )
{
    if ( !isweapon( objweapon ) )
    {
        assertmsg( "<dev string:x524>" );
        return undefined;
    }
    else if ( !isdefined( objweapon.camo ) )
    {
        return undefined;
    }
    
    rootname = getweaponrootstring( objweapon );
    weaponclass = level.weaponmapdata[ rootname ].group ?? undefined;
    mappings = [ rootname, weaponclass ];
    lootid = function_9fda321f45a32fa3( mappings, objweapon.camo );
    
    if ( !isdefined( lootid ) )
    {
        /#
            if ( isdefined( level.var_63473892ef2a718e[ objweapon.camo ] ) )
            {
                assertmsg( "<dev string:x551>" + objweapon.camo + "<dev string:x55f>" + level.var_63473892ef2a718e[ objweapon.camo ].size + "<dev string:x571>" );
            }
        #/
        
        itemstruct = utility::callsharedfunc( #"loot", #"getLootItemInfoFromRef", objweapon.camo );
        
        if ( isdefined( itemstruct ) )
        {
            lootid = itemstruct.itemid;
        }
    }
    
    return lootid;
}

// Namespace weapon
// Params 2
// Checksum 0xfe5e5fe5, Offset: 0x2a52
// Size: 0xa0
function function_9fda321f45a32fa3( mappings, camo )
{
    foreach ( param in mappings )
    {
        var_7237854e3be197ca = level.weaponmappedcamos[ param ][ camo ];
        
        if ( isdefined( var_7237854e3be197ca ) )
        {
            return var_7237854e3be197ca;
        }
    }
    
    return undefined;
}

// Namespace weapon
// Params 2
// Checksum 0x4f436442, Offset: 0x2afb
// Size: 0x89
function getweaponattachmentdefaultattachments( weaponassetname, attachments )
{
    if ( isdefined( attachments ) )
    {
        sortedattachments = utility::alphabetize( attachments );
        
        for ( attachmentindex = 0; attachmentindex < sortedattachments.size ; attachmentindex++ )
        {
            attachment = sortedattachments[ attachmentindex ];
            
            if ( attachment != "none" && ( attachmentindex == 0 || attachment != sortedattachments[ attachmentindex - 1 ] ) )
            {
                weaponassetname = weaponassetname + "+" + attachment;
            }
        }
    }
    
    return getweapondefaultattachments( weaponassetname );
}

// Namespace weapon
// Params 2
// Checksum 0xb6e5a91c, Offset: 0x2b8d
// Size: 0xd2
function getbaseweaponattachdefaulttoidmap( weapon, attachments )
{
    assetname = getweaponassetname( weapon );
    
    if ( !isdefined( assetname ) )
    {
        assetname = weapon;
    }
    
    defaultattachments = getweaponattachmentdefaultattachments( assetname, attachments );
    
    if ( isdefined( defaultattachments ) && defaultattachments.size > 0 )
    {
        defaulttoidmap = [];
        
        foreach ( defaultattachment in defaultattachments )
        {
            defaulttoidmap[ defaultattachment ] = 0;
        }
        
        return defaulttoidmap;
    }
    
    return undefined;
}

// Namespace weapon
// Params 1
// Checksum 0x2184e52a, Offset: 0x2c68
// Size: 0xda
function parseattachdefaulttoidmap( attachmentdefaults )
{
    if ( attachmentdefaults != "" )
    {
        defaultkvps = strtok( attachmentdefaults, " " );
        defaulttoidmap = [];
        
        foreach ( kvp in defaultkvps )
        {
            pair = strtok( kvp, "|" );
            
            if ( pair.size == 2 )
            {
                defaulttoidmap[ pair[ 0 ] ] = int( pair[ 1 ] );
                continue;
            }
            
            defaulttoidmap[ pair[ 0 ] ] = 0;
        }
        
        return defaulttoidmap;
    }
    
    return undefined;
}

// Namespace weapon
// Params 1
// Checksum 0x2fe33e3b, Offset: 0x2d4b
// Size: 0x22
function getweaponassetname( rootname )
{
    return level.weaponmapdata[ rootname ].assetname;
}

// Namespace weapon
// Params 1
// Checksum 0xa65cd281, Offset: 0x2d76
// Size: 0x48
function getweaponname( weapon )
{
    if ( !isdefined( weapon ) )
    {
        assertmsg( "<dev string:x5e2>" );
        return "none";
    }
    
    if ( isweapon( weapon ) )
    {
        return weapon.basename;
    }
    
    return getweaponassetname( weapon ) ?? weapon;
}

// Namespace weapon
// Params 1
// Checksum 0x18385dba, Offset: 0x2dc7
// Size: 0x18, Type: bool
function isfistweaponobject( weaponobj )
{
    return weaponobj === level.defaultfist;
}

// Namespace weapon
// Params 1
// Checksum 0xb66db5e7, Offset: 0x2de8
// Size: 0x28, Type: bool
function isfistweapon( weapon )
{
    weaponobj = utility::function_64003742d8f5c781( weapon );
    return isfistweaponobject( weaponobj );
}

// Namespace weapon
// Params 1
// Checksum 0xe473d268, Offset: 0x2e19
// Size: 0x28, Type: bool
function isunderwaterweaponobject( weaponobj )
{
    return weaponobj === level.defaultswimweapon || weaponobj === level.var_f51157de397416bd;
}

// Namespace weapon
// Params 1
// Checksum 0x7b60da49, Offset: 0x2e4a
// Size: 0x28, Type: bool
function isunderwaterweapon( weapon )
{
    weaponobj = utility::function_64003742d8f5c781( weapon );
    return isunderwaterweaponobject( weaponobj );
}

// Namespace weapon
// Params 1
// Checksum 0x4f77b7fd, Offset: 0x2e7b
// Size: 0x18, Type: bool
function isclimbweaponobject( weaponobj )
{
    return weaponobj === level.var_f8ac15ada97a702a;
}

// Namespace weapon
// Params 1
// Checksum 0xb0af850f, Offset: 0x2e9c
// Size: 0x28, Type: bool
function isclimbweapon( weapon )
{
    weaponobj = utility::function_64003742d8f5c781( weapon );
    return isclimbweaponobject( weaponobj );
}

// Namespace weapon
// Params 1
// Checksum 0xd6d56999, Offset: 0x2ecd
// Size: 0x47
function function_170e300815e9c1a2( weaponobj )
{
    cachedvalue = level.weaponrootcache[ weaponobj.basename ];
    
    if ( isdefined( cachedvalue ) )
    {
        return cachedvalue;
    }
    
    return function_bed9d35e3ab4a80c( weaponobj.basename );
}

// Namespace weapon
// Params 1
// Checksum 0xe7006a71, Offset: 0x2f1d
// Size: 0x76
function getweaponrootname( weapon )
{
    if ( isweapon( weapon ) )
    {
        return function_170e300815e9c1a2( weapon );
    }
    else if ( isstring( weapon ) )
    {
        cachedvalue = level.weaponrootcache[ weapon ];
        
        if ( isdefined( cachedvalue ) )
        {
            return cachedvalue;
        }
        
        return function_bed9d35e3ab4a80c( weapon );
    }
    else if ( !isdefined( weapon ) )
    {
        return "none";
    }
    
    assertmsg( "<dev string:x61f>" );
    return "none";
}

// Namespace weapon
// Params 1, eflags: 0x4
// Checksum 0x467eae7e, Offset: 0x2f9c
// Size: 0x4a6
function private function_bed9d35e3ab4a80c( weaponname )
{
    if ( !isstring( weaponname ) )
    {
        return "none";
    }
    
    if ( !isdefined( level.weaponrootcache ) )
    {
        level.weaponrootcache = [];
    }
    
    if ( getdvarint( @"hash_4d6608977410d9b7", 0 ) == 1 )
    {
        rootname = undefined;
        
        if ( isdefined( level.weaponmapdata[ weaponname ] ) )
        {
            return weaponname;
        }
        else
        {
            foreach ( rootname, data in level.weaponmapdata )
            {
                if ( weaponname === level.weaponmapdata[ rootname ].assetname )
                {
                    level.weaponrootcache[ weaponname ] = rootname;
                    return rootname;
                }
            }
        }
    }
    
    if ( weaponname == "iw9_lm_dblmg_jup_sp_v1" || weaponname == "iw9_lm_dblmg_jup_mp" || weaponname == "iw9_lm_dblmg_jup" )
    {
        return "iw9_lm_dblmg_jup";
    }
    
    if ( weaponname == "jup_p33_me_tac_knife03_v6501" )
    {
        return "iw9_me_knife";
    }
    
    originalname = weaponname;
    tokens = strtok( weaponname, "_" );
    toksize = tokens.size;
    
    if ( toksize == 0 )
    {
        return "none";
    }
    
    index = 0;
    
    if ( tokens[ 0 ] == "alt" )
    {
        index++;
    }
    
    if ( tokens[ index ] == "iw8" || tokens[ index ] == "iw9" || tokens[ index ] == "t10" || tokens[ index ] == "jup" || tokens[ index ] == "sat" || tokens[ index ] == "rex" || tokens[ index ] == "zul" )
    {
        var_aedd151289ff3a0d = 0;
        classtokens = [ "ar", "sm", "lm", "sh", "sn", "dm", "pi", "la", "me", "br", "sl", "ks", "pw", "ww" ];
        
        if ( tokens[ index ] == "jup" && toksize >= 4 && arraycontains( classtokens, tokens[ index + 2 ] ) )
        {
            weaponname = function_5d044133536d0766( "_", tokens, index, 4 );
            var_aedd151289ff3a0d = isdefined( level.weaponmapdata[ weaponname ] );
            
            if ( !var_aedd151289ff3a0d )
            {
                var_75f736509be71099 = 0;
                tmptokens = [];
                
                if ( tokens[ index + 1 ] == "iw9" )
                {
                    var_75f736509be71099 = index + 1;
                }
                else
                {
                    var_75f736509be71099 = index + 2;
                    tmptokens[ tmptokens.size ] = "iw9";
                }
                
                for ( i = var_75f736509be71099; i < tokens.size ; i++ )
                {
                    tmptokens[ tmptokens.size ] = tokens[ i ];
                }
                
                tokens = tmptokens;
                toksize = tokens.size;
            }
        }
        
        if ( !var_aedd151289ff3a0d )
        {
            if ( isdefined( tokens[ index + 1 ] ) && arraycontains( classtokens, tokens[ index + 1 ] ) )
            {
                var_2c5926d25fc093da = tokens.size >= index + 2 && tokens[ index + 2 ] == "zombie";
                
                if ( tokens.size >= index + 4 && tokens[ index ] == "t10" && tokens[ index + 3 ] != "mp" || var_2c5926d25fc093da )
                {
                    weaponname = tokens[ index ] + "_" + tokens[ index + 1 ] + "_" + tokens[ index + 2 ] + "_" + tokens[ index + 3 ];
                }
                else if ( tokens.size >= index + 4 && tokens[ index ] == "zul" && tokens[ index + 1 ] == "pw" )
                {
                    weaponname = tokens[ index ] + "_" + tokens[ index + 1 ] + "_" + tokens[ index + 2 ] + "_" + tokens[ index + 3 ];
                }
                else
                {
                    weaponname = tokens[ index ] + "_" + tokens[ index + 1 ] + "_" + tokens[ index + 2 ];
                }
            }
            else
            {
                weaponname = tokens[ index ] + "_" + tokens[ index + 1 ];
            }
        }
    }
    
    if ( level.weaponrootcache.size > 400 )
    {
        level.weaponrootcache = [];
    }
    
    level.weaponrootcache[ originalname ] = weaponname;
    return weaponname;
}

// Namespace weapon
// Params 1
// Checksum 0x24fa2c31, Offset: 0x344b
// Size: 0x170
function getweaponclasstoken( weapon )
{
    weaponobj = utility::function_64003742d8f5c781( weapon );
    rootname = getweaponrootname( weaponobj );
    weapongroup = weapongroupmap( rootname );
    potentialtoken = "ar";
    
    switch ( weapongroup )
    {
        case #"hash_8af0086b038622b5":
        case #"hash_dd616da0b395a0b0":
            potentialtoken = "ar";
            break;
        case #"hash_bef5ec0b3e197ae":
            potentialtoken = "lm";
            break;
        case #"hash_c095d67337b1f5a1":
            potentialtoken = "ar";
            break;
        case #"hash_47368bc0d2ef1565":
            potentialtoken = "dm";
            break;
        case #"hash_34340d457a63e7f1":
            potentialtoken = "ar";
            break;
        case #"hash_ab10f9c080fe4faf":
            potentialtoken = "sm";
            break;
        case #"hash_16cf6289ab06bd30":
            potentialtoken = "sh";
            break;
        case #"hash_9d18adab1b65a661":
            potentialtoken = "la";
            break;
        case #"hash_86b11ac21f992552":
        case #"hash_a1f27f97be15d620":
            potentialtoken = "me";
            break;
        case #"hash_2535634d8bb5c955":
        default:
            assertmsg( "<dev string:x667>" + weaponobj.basenamehash );
            return undefined;
    }
    
    return potentialtoken;
}

// Namespace weapon
// Params 2
// Checksum 0x9079a827, Offset: 0x35c4
// Size: 0xfb
function function_2374da6f1b4fad4e( weaponname, variantid )
{
    if ( !isdefined( weaponname ) || weaponname == "none" || !isdefined( variantid ) || variantid == 0 )
    {
        return [];
    }
    
    ignorelist = [];
    var_3c796252addcd009 = function_7d4df70b836c0973( weaponname, variantid );
    var_b19fd3e8f03cc95c = %"hash_6064c8c15b75fb65";
    
    foreach ( attachment, override in var_3c796252addcd009 )
    {
        category = attachmentmap_tocategory( attachment );
        
        if ( isdefined( category ) && category != var_b19fd3e8f03cc95c )
        {
            ignorelist[ ignorelist.size ] = attachment;
        }
    }
    
    return ignorelist;
}

// Namespace weapon
// Params 2
// Checksum 0x79ae5f6d, Offset: 0x36c8
// Size: 0x1c
function issilencerattach( weapon, attachment )
{
    return issilencedattachment( weapon, attachment );
}

// Namespace weapon
// Params 1
// Checksum 0x80ba07f7, Offset: 0x36ed
// Size: 0xf8, Type: bool
function weaponsupportslaserir( weaponobj )
{
    switch ( weaponobj.basenamehash )
    {
        case %"iw9_minigunksjugg_reload_mp":
        case %"hash_73d81ba1da5e262":
        case %"iw9_minigunksjugg_mp":
        case %"iw9_lm_dblmg2_cp":
        case %"iw9_lm_dblmg_execution_mp":
        case %"iw9_me_riotshield_mp":
        case %"iw9_lm_dblmg_mp":
            return false;
    }
    
    if ( iskillstreakweapon( weaponobj ) )
    {
        return false;
    }
    
    if ( isdefined( weaponobj ) && isdefined( weaponobj.variantid ) && weaponobj.extra == "charlie725_doom_blueprint_tuning" )
    {
        return false;
    }
    
    class = weaponclass( weaponobj );
    return class == "rifle" || class == "mg" || class == "sniper" || class == "smg" || class == "spread";
}

// Namespace weapon
// Params 1
// Checksum 0x7f890b9, Offset: 0x37ee
// Size: 0x54, Type: bool
function iskillstreakplayerweapon( weapon )
{
    weapname = getweaponname( weapon );
    
    if ( issubstr( weapname, "_mp" ) )
    {
        if ( iskillstreakweaponname( weapname ) )
        {
            if ( function_10d338d2560c67b2( weapname ) || isminigunweapon( weapname ) )
            {
                return true;
            }
        }
    }
    
    return false;
}

// Namespace weapon
// Params 1
// Checksum 0x562caf32, Offset: 0x384b
// Size: 0x7e, Type: bool
function issuperuseweapon( weapon )
{
    if ( !isdefined( weapon ) )
    {
        assertmsg( "<dev string:x6b8>" );
        return false;
    }
    
    weaponnamekey = isstring( weapon ) ? getxhashasset( weapon ) : isxhashasset( weapon ) ? weapon : weapon.basenamehash;
    
    if ( function_bebce04e93b55bfc( weaponnamekey ) )
    {
        return true;
    }
    
    return isdefined( level.superglobals.superweapons[ weaponnamekey ] );
}

// Namespace weapon
// Params 1
// Checksum 0xce1e0dd9, Offset: 0x38d2
// Size: 0x70, Type: bool
function issupergestureweapon( weapon )
{
    weaponobj = utility::function_64003742d8f5c781( weapon );
    
    if ( !isdefined( weaponobj ) )
    {
        return false;
    }
    
    switch ( weaponobj.basenamehash )
    {
        case %"battlerage_nebulizer_mp":
        case %"electric_discharge_mp":
        case %"tempv_mp":
        case %"emp_pulse_device_mp":
            return true;
    }
    
    return false;
}

// Namespace weapon
// Params 1
// Checksum 0xb9330180, Offset: 0x394b
// Size: 0x55
function function_bebce04e93b55bfc( var_b541b98c7febbc0 )
{
    if ( !isdefined( var_b541b98c7febbc0 ) )
    {
        assertmsg( "<dev string:x6fd>" );
        return 0;
    }
    
    switch ( var_b541b98c7febbc0 )
    {
        case %"iw9_pi_stimpistol_mp":
        case %"iw9_oxygenmask_mp":
            return 1;
        default:
            return 0;
    }
}

// Namespace weapon
// Params 1
// Checksum 0xf85e3178, Offset: 0x39a8
// Size: 0x78, Type: bool
function function_dec9dc19786bb57a( weapon )
{
    if ( !isdefined( weapon ) )
    {
        assertmsg( "<dev string:x747>" );
        return false;
    }
    
    weapname = undefined;
    
    if ( isweapon( weapon ) )
    {
        if ( isnullweapon( weapon ) )
        {
            return false;
        }
        
        weapname = weapon.basename;
    }
    else
    {
        if ( weapon == "none" )
        {
            return false;
        }
        
        weapname = weapon;
    }
    
    return weapname == "iw9_oxygenmask" || weapname == "iw9_oxygenmask_mp";
}

// Namespace weapon
// Params 1
// Checksum 0xc969921f, Offset: 0x3a29
// Size: 0x7f, Type: bool
function isminigunweapon( weapon )
{
    weapon = utility::function_64003742d8f5c781( weapon );
    
    if ( !isdefined( weapon ) )
    {
        assertmsg( "<dev string:x78e>" );
        return false;
    }
    
    switch ( weapon.basenamehash )
    {
        case %"iw9_minigunksjugg_reload_mp":
        case %"iw9_minigunksjugg_mp":
        case %"iw9_lm_dblmg2_cp":
        case %"iw9_lm_dblmg_jup_mp":
        case %"iw9_lm_dblmg_mp":
            return true;
    }
    
    return false;
}

// Namespace weapon
// Params 1
// Checksum 0x3e39f640, Offset: 0x3ab1
// Size: 0x19, Type: bool
function iskillstreakweaponname( weaponname )
{
    return isdefined( level.killstreakweaponmap[ weaponname ] );
}

// Namespace weapon
// Params 1
// Checksum 0x17fd1e80, Offset: 0x3ad3
// Size: 0x1a, Type: bool
function iskillstreakweapon( weapon )
{
    return iskillstreakweaponname( getweaponname( weapon ) );
}

// Namespace weapon
// Params 1
// Checksum 0x64657ec, Offset: 0x3af6
// Size: 0x19, Type: bool
function function_10d338d2560c67b2( weaponname )
{
    return isdefined( level.var_4d7a26dff433ac89[ weaponname ] );
}

// Namespace weapon
// Params 1
// Checksum 0xa36caa26, Offset: 0x3b18
// Size: 0x19, Type: bool
function function_597e1c0b6df2fada( weaponname )
{
    return isdefined( level.var_4295719b442b453d[ weaponname ] );
}

// Namespace weapon
// Params 1
// Checksum 0x99c52e79, Offset: 0x3b3a
// Size: 0x28, Type: bool
function function_1344ad15d2d7bd21( weapon )
{
    weaponname = getweaponname( weapon );
    return function_597e1c0b6df2fada( weaponname );
}

// Namespace weapon
// Params 1
// Checksum 0x99365e51, Offset: 0x3b6b
// Size: 0x7b, Type: bool
function function_6011e4dd56d52c6f( weapon )
{
    weaponname = getweaponname( weapon );
    
    if ( !isdefined( level.killstreakweaponmap[ weaponname ] ) )
    {
        return false;
    }
    
    streakname = level.killstreakweaponmap[ weaponname ];
    bundle = level.streakglobals.streakbundles[ streakname ];
    
    if ( bundle.var_6437ad480a081375 )
    {
        return false;
    }
    
    return true;
}

// Namespace weapon
// Params 2
// Checksum 0xe6218197, Offset: 0x3bef
// Size: 0x44
function registerkillstreakweaponmap( streakname, var_bf295ddc16ebf8a0 )
{
    if ( !isdefined( level.killstreakweaponmap ) )
    {
        level.killstreakweaponmap = [];
    }
    
    level.killstreakweaponmap[ var_bf295ddc16ebf8a0 ] = streakname;
    registerkillstreakweapon( getxhashasset( streakname ) );
}

// Namespace weapon
// Params 1
// Checksum 0xd80814a3, Offset: 0x3c3b
// Size: 0x31
function registerplayerkillstreakweapon( weaponname )
{
    if ( !isdefined( level.var_4d7a26dff433ac89 ) )
    {
        level.var_4d7a26dff433ac89 = [];
    }
    
    level.var_4d7a26dff433ac89[ weaponname ] = 1;
}

// Namespace weapon
// Params 0
// Checksum 0xf6b047a1, Offset: 0x3c74
// Size: 0x483
function initkillstreakweaponmap()
{
    if ( !isdefined( level.killstreakweaponmap ) )
    {
        level.killstreakweaponmap = [];
    }
    
    level.killstreakweaponmap[ "tacops_beacon_mp" ] = "marker";
    level.killstreakweaponmap[ "radar_drone_proj_mp" ] = "radar_drone_recon";
    level.killstreakweaponmap[ "gunship_105mm_mp" ] = "gunship";
    level.killstreakweaponmap[ "manual_turret_mp" ] = "manual_turret";
    level.killstreakweaponmap[ "nuke_mp" ] = "nuke";
    level.killstreakweaponmap[ "artillery_mp" ] = "precision_airstrike";
    level.killstreakweaponmap[ "iw9_spotter_scope_mp" ] = "precision_airstrike";
    level.killstreakweaponmap[ "deploy_airdrop_mp" ] = "airdrop";
    level.killstreakweaponmap[ "deploy_airdrop_sticky_mp" ] = "airdrop";
    level.killstreakweaponmap[ "nuke_multi_mp" ] = "nuke_multi";
    level.killstreakweaponmap[ "cruise_proj_mp" ] = "cruise_predator";
    level.killstreakweaponmap[ "pac_sentry_turret_mp" ] = "pac_sentry";
    level.killstreakweaponmap[ "toma_proj_mp" ] = "toma_strike";
    level.killstreakweaponmap[ "iw9_laser_large_ir_mp" ] = "toma_strike";
    level.killstreakweaponmap[ "chopper_gunner_turret_mp" ] = "chopper_gunner";
    level.killstreakweaponmap[ "chopper_gunner_proj_mp" ] = "chopper_gunner";
    level.killstreakweaponmap[ "chopper_gunner_turret_cp" ] = "chopper_gunner";
    level.killstreakweaponmap[ "chopper_gunner_proj_cp" ] = "chopper_gunner";
    level.killstreakweaponmap[ "fuelstrike_proj_mp" ] = "fuel_airstrike";
    level.killstreakweaponmap[ "chopper_support_turret_mp" ] = "chopper_support";
    level.killstreakweaponmap[ "chopper_support_turret_br" ] = "chopper_support";
    level.killstreakweaponmap[ "deploy_sentry_mp" ] = "sentry_gun";
    level.killstreakweaponmap[ "sentry_turret_mp" ] = "sentry_gun";
    level.killstreakweaponmap[ "hover_jet_turret_mp" ] = "hover_jet";
    level.killstreakweaponmap[ "hover_jet_proj_mp" ] = "hover_jet";
    level.killstreakweaponmap[ "hover_jet_bomb_mp" ] = "hover_jet";
    level.killstreakweaponmap[ "iw9_minigunksjugg_mp" ] = "juggernaut";
    level.killstreakweaponmap[ "iw9_minigunksjugg_reload_mp" ] = "juggernaut";
    level.killstreakweaponmap[ "deploy_juggernaut_mp" ] = "juggernaut";
    level.killstreakweaponmap[ "assault_drone_mp" ] = "assault_drone";
    level.killstreakweaponmap[ "assault_drone_danger_mp" ] = "assault_drone";
    level.killstreakweaponmap[ "airdrop_escort_turret_mp" ] = "airdrop_escort";
    level.killstreakweaponmap[ "super_laser_charge_mp" ] = "super_laser_charge";
    level.killstreakweaponmap[ "electric_discharge_mp" ] = "super_electric_discharge";
    level.killstreakweaponmap[ "high_jump_mp" ] = "super_high_jump";
    level.killstreakweaponmap[ "airdrop_escort_turret_ballistics_mp" ] = "airdrop_escort";
    level.killstreakweaponmap[ "chopper_gunner_turret_ballistics_mp" ] = "chopper_gunner";
    level.killstreakweaponmap[ "hover_jet_turret_ballistics_mp" ] = "hover_jet";
    level.killstreakweaponmap[ "switchblade_drone_mp" ] = "switchblade_drone";
    level.killstreakweaponmap[ "lrad_mp" ] = "lrad";
    level.killstreakweaponmap[ "deploy_remote_turret_mp" ] = "remote_turret";
    level.killstreakweaponmap[ "remote_turret_mp" ] = "remote_turret";
    level.killstreakweaponmap[ "loitering_munition_proj_mp" ] = "loitering_munition";
    level.killstreakweaponmap[ "deploy_missileturret_jup_mp" ] = "missile_turret";
    level.killstreakweaponmap[ "missile_turret_proj_jup_mp" ] = "missile_turret";
    level.killstreakweaponmap[ "drone_swarm_drone_mp" ] = "drone_swarm";
    level.killstreakweaponmap[ "toma_proj_jup_mp" ] = "toma_strike";
    level.killstreakweaponmap[ "bunker_buster_proj_jup_mp" ] = "bunker_buster";
    
    foreach ( killstreak, killstreakweapon in level.killstreakweaponmap )
    {
        registerkillstreakweapon( getxhashasset( killstreak ) );
    }
}

// Namespace weapon
// Params 1
// Checksum 0xfcf44499, Offset: 0x40ff
// Size: 0x62, Type: bool
function function_ea0f95c57e71d5b4( weapon )
{
    weaponname = getweaponname( weapon );
    
    if ( isdefined( level.killstreakweaponmap[ weaponname ] ) )
    {
        switch ( weaponname )
        {
            case #"hash_10480ca9423043c7":
            case #"hash_4cdc20240e59faaf":
            case #"hash_9acbd2b1e30a8e0e":
                return true;
        }
    }
    
    return false;
}

// Namespace weapon
// Params 2
// Checksum 0xa0060942, Offset: 0x416a
// Size: 0xba, Type: bool
function function_47517374aa9c98b7( weapon, attachmentname )
{
    if ( attachmentname == "none" )
    {
        return true;
    }
    
    if ( !isdefined( weapon ) || isstring( weapon ) && ( weapon == "none" || weapon == "" ) )
    {
        return false;
    }
    
    rootname = getweaponrootname( weapon );
    weaponasset = weaponassetnamemap( rootname );
    weaponattachments = function_94e534c2a4d98789( weaponasset );
    attachmentslot = getattachmentslot( weaponasset, attachmentname );
    attachmentarray = weaponattachments[ attachmentslot ];
    
    if ( isdefined( attachmentarray ) && arraycontains( attachmentarray, attachmentname ) )
    {
        return true;
    }
    
    return false;
}

// Namespace weapon
// Params 2
// Checksum 0x43d97c1b, Offset: 0x422d
// Size: 0x6a
function function_668a13182805f553( weapon, playerdatavalue )
{
    if ( function_47517374aa9c98b7( weapon, playerdatavalue ) )
    {
        return playerdatavalue;
    }
    
    println( "<dev string:x7d3>" + playerdatavalue );
    rootname = getweaponrootname( weapon );
    weaponasset = weaponassetnamemap( rootname );
    return function_f45dae94fb57da5c( weaponasset, "receiver", 0 );
}

// Namespace weapon
// Params 1
// Checksum 0x29151dda, Offset: 0x429f
// Size: 0x8e
function getweaponnvgattachment( weaponobj )
{
    foreach ( attachment in level.var_e0dc368290d94a40 )
    {
        if ( weaponobj canuseattachment( attachment ) )
        {
            return attachment;
        }
    }
    
    return "invalid";
}

/#

    // Namespace weapon
    // Params 10
    // Checksum 0xf8ce7989, Offset: 0x4336
    // Size: 0x136, Type: dev
    function function_12fc9c4fd8c1475( itemname, rarity, lootid, baseweapon, attachments, fullweaponname, titlestring, descstring, icon, pickupsound )
    {
        str = "<dev string:x802>";
        str += "<dev string:x80a>" + itemname;
        str += "<dev string:x80a>" + "<dev string:x810>";
        str += "<dev string:x80a>" + rarity;
        str += "<dev string:x80a>";
        str += "<dev string:x80a>" + lootid;
        str += "<dev string:x80a>";
        str += "<dev string:x80a>";
        str += "<dev string:x80a>" + baseweapon;
        str += "<dev string:x80a>";
        str += "<dev string:x80a>" + attachments;
        str += "<dev string:x80a>" + fullweaponname;
        str += "<dev string:x80a>" + function_a31c333e503a3fb0( titlestring );
        str += "<dev string:x80a>" + function_a31c333e503a3fb0( descstring );
        str += "<dev string:x80a>" + icon;
        str += "<dev string:x80a>" + pickupsound;
        return str;
    }

#/

// Namespace weapon
// Params 0
// Checksum 0x6f6ab96, Offset: 0x4474
// Size: 0x7d
function function_f763315b54ffbd()
{
    attachmentlist = [];
    numrows = tablelookupgetnumrows( "mp/attachmenttable.csv" );
    
    for ( index = 0; index < numrows ; index++ )
    {
        attachmentname = tablelookupbyrow( "mp/attachmenttable.csv", index, 4 );
        
        if ( attachmentname == "" )
        {
            continue;
        }
        
        assert( !isdefined( attachmentlist[ attachmentname ] ), "<dev string:x81a>" + attachmentname );
        attachmentlist[ attachmentname ] = attachmentname;
    }
    
    return attachmentlist;
}

// Namespace weapon
// Params 0
// Checksum 0xdbc90532, Offset: 0x44fa
// Size: 0x122
function function_16ff7d597f441100()
{
    var_7237854e3be197ca = level.weaponlistbundle;
    
    if ( isdefined( var_7237854e3be197ca ) )
    {
        return var_7237854e3be197ca;
    }
    
    weaponslist = level.gametypebundle.weaponlist ?? level.gamemodebundle.weaponlist;
    
    if ( weaponslist )
    {
        weaponlistbundle = getscriptbundle( weaponslist );
        
        if ( isdefined( weaponlistbundle.weapons ) )
        {
            level.weaponlistbundle = [];
            
            foreach ( index, struct in weaponlistbundle.weapons )
            {
                if ( isdefined( struct.weapondata ) )
                {
                    level.weaponlistbundle[ index ] = struct.weapondata;
                }
            }
            
            return level.weaponlistbundle;
        }
    }
}

// Namespace weapon
// Params 2
// Checksum 0xe523bcce, Offset: 0x4624
// Size: 0x2a
function function_659a3e10e8d1c91c( weapon, keys )
{
    return getscriptbundlefieldvalues( hashcat( %"hash_31705bf9ed477170", weapon ), keys );
}

// Namespace weapon
// Params 2
// Checksum 0xb0dc09b1, Offset: 0x4657
// Size: 0x2a
function function_e0801e95ac4c4925( attachment, keys )
{
    return getscriptbundlefieldvalues( hashcat( %"hash_3c2c9813bb16552f", attachment ), keys );
}

// Namespace weapon
// Params 3
// Checksum 0x71bc6b2b, Offset: 0x468a
// Size: 0x54
function function_c37ac3c4f987e506( weapon, key, def )
{
    if ( !isdefined( weapon ) )
    {
        return undefined;
    }
    
    value = getscriptbundlefieldvalue( hashcat( %"hash_31705bf9ed477170", weapon ), key );
    
    if ( !isdefined( value ) )
    {
        return def;
    }
    
    return value;
}

// Namespace weapon
// Params 1
// Checksum 0x8fd5c235, Offset: 0x46e7
// Size: 0xa9
function function_94e534c2a4d98789( weapon )
{
    slotarray = function_ea865062f19beca0();
    allattachments = [];
    
    foreach ( slot in slotarray )
    {
        var_bba76b2d884ae9dc = function_2e5ecdd8ac47f308( weapon, slot );
        allattachments[ slot ] = var_bba76b2d884ae9dc;
    }
    
    return allattachments;
}

// Namespace weapon
// Params 0
// Checksum 0xce2907e4, Offset: 0x4799
// Size: 0x18f
function function_ea865062f19beca0()
{
    if ( !isdefined( level.attachmentslotarray ) )
    {
        level.attachmentslotarray = [];
        level.attachmentslotarray[ level.attachmentslotarray.size ] = "receiver";
        level.attachmentslotarray[ level.attachmentslotarray.size ] = "frontpiece";
        level.attachmentslotarray[ level.attachmentslotarray.size ] = "backpiece";
        level.attachmentslotarray[ level.attachmentslotarray.size ] = "magazine";
        level.attachmentslotarray[ level.attachmentslotarray.size ] = "override";
        level.attachmentslotarray[ level.attachmentslotarray.size ] = "muzzle";
        level.attachmentslotarray[ level.attachmentslotarray.size ] = "reargrip";
        level.attachmentslotarray[ level.attachmentslotarray.size ] = "trigger";
        level.attachmentslotarray[ level.attachmentslotarray.size ] = "extra";
        level.attachmentslotarray[ level.attachmentslotarray.size ] = "scope";
        level.attachmentslotarray[ level.attachmentslotarray.size ] = "underbarrel";
        level.attachmentslotarray[ level.attachmentslotarray.size ] = "modifier";
        level.attachmentslotarray[ level.attachmentslotarray.size ] = "conversionkit";
        level.attachmentslotarray[ level.attachmentslotarray.size ] = "other";
    }
    
    return level.attachmentslotarray;
}

// Namespace weapon
// Params 1
// Checksum 0x2d7b16f, Offset: 0x4931
// Size: 0x68
function function_42e884104fc16220( weapon )
{
    weaponobj = utility::function_64003742d8f5c781( weapon );
    
    if ( !isdefined( weaponobj ) )
    {
        return 0;
    }
    
    currentweapon = 0;
    
    switch ( weaponobj.basenamehash )
    {
        case %"super_remote_map_mp":
        case %"ks_remote_map_mp":
            currentweapon = 1;
            break;
    }
    
    return currentweapon;
}

// Namespace weapon
// Params 1
// Checksum 0x15cb46de, Offset: 0x49a2
// Size: 0x74
function isdeploytablet( weapon )
{
    weaponobj = utility::function_64003742d8f5c781( weapon );
    
    if ( !isdefined( weaponobj ) )
    {
        return 0;
    }
    
    currentweapon = 0;
    
    switch ( weaponobj.basenamehash )
    {
        case %"ks_remote_device_mp":
        case %"super_remote_device_mp":
        case %"hash_6faa69ebfba55c59":
            currentweapon = 1;
            break;
    }
    
    return currentweapon;
}

// Namespace weapon
// Params 1
// Checksum 0x759784a7, Offset: 0x4a1f
// Size: 0x34, Type: bool
function function_2c9350ef77bdf665( weapon )
{
    weaponname = weapon.basename;
    
    if ( !isdefined( weaponname ) )
    {
        return false;
    }
    
    return weaponname == "super_remote_map_mp";
}

// Namespace weapon
// Params 1
// Checksum 0x93767d51, Offset: 0x4a5c
// Size: 0x4b, Type: bool
function getweaponlootid( weaponobj )
{
    if ( !isweapon( weaponobj ) )
    {
        assertmsg( "<dev string:x860>" );
        return false;
    }
    
    return weaponobj.weaponblueprint.lootid ?? weaponobj.baseweaponlootid;
}

// Namespace weapon
// Params 1
// Checksum 0x9e507c93, Offset: 0x4ab0
// Size: 0x9b
function function_d54329f1701d6349( weapon )
{
    weaponlootid = 0;
    weaponname = undefined;
    
    if ( isweapon( weapon ) )
    {
        weaponname = weapon.basename;
    }
    else
    {
        assert( isstring( weapon ) );
        weaponname = weapon;
    }
    
    if ( isdefined( weaponname ) )
    {
        weaponrootname = getweaponrootname( weaponname );
        
        if ( isdefined( level.weaponmapdata[ weaponrootname ].weaponlootid ) )
        {
            weaponlootid = level.weaponmapdata[ weaponrootname ].weaponlootid;
        }
    }
    
    return weaponlootid;
}

// Namespace weapon
// Params 1
// Checksum 0xe60c582b, Offset: 0x4b54
// Size: 0xed
function function_57559cfce1d2812d( weapon )
{
    if ( getdvarint( @"hash_8f727124cb64ae24", 1 ) == 1 )
    {
        weaponlootid = function_d54329f1701d6349( weapon );
        
        if ( weaponlootid != 0 )
        {
            return weaponlootid;
        }
    }
    
    if ( !isdefined( level.specialweaponlist ) )
    {
        level.specialweaponlist = [];
    }
    
    weaponname = function_59714dddb66e6b88( weapon );
    
    if ( !isdefined( weaponname ) )
    {
        return 0;
    }
    
    if ( isdefined( level.specialweaponlist[ weaponname ] ) )
    {
        return level.specialweaponlist[ weaponname ];
    }
    
    id = tablelookup( "loot/special_weapon_ids.csv", 1, weaponname, 0 );
    
    if ( !isdefined( id ) || id == "0" || id == "" )
    {
        return 0;
    }
    
    id = int( id );
    
    if ( isdefined( id ) )
    {
        level.specialweaponlist[ weaponname ] = id;
        return id;
    }
    
    return getweaponlootid( weapon );
}

// Namespace weapon
// Params 1
// Checksum 0xc72bd481, Offset: 0x4c4a
// Size: 0xb4
function function_59714dddb66e6b88( weapon )
{
    weaponname = "";
    weaponobj = utility::function_64003742d8f5c781( weapon );
    
    if ( !isdefined( weaponobj ) )
    {
        return weaponname;
    }
    
    switch ( weaponobj.basenamehash )
    {
        case %"iw9_mg_mrap_mp":
        case %"iw9_tur_mrap_mp":
            weaponname = "iw9_tur_mrap_mp";
            break;
        case %"iw9_mg_patrol_boat_back_mp":
        case %"iw9_mg_patrol_boat_front_mp":
            weaponname = "iw9_mg_patrol_boat_front_mp";
            break;
        case %"iw9_mg_cougar_mp":
        case %"iw9_tur_cougar_mp":
            weaponname = "iw9_tur_cougar_mp";
            break;
    }
    
    return weaponname;
}

// Namespace weapon
// Params 0
// Checksum 0x77484ab3, Offset: 0x4d07
// Size: 0x3c
function getgrenadeinpullback()
{
    offhandweapon = self getheldoffhand();
    
    if ( isdefined( self.gestureweapon ) && offhandweapon == makeweaponfromstring( self.gestureweapon ) )
    {
        offhandweapon = nullweapon();
    }
    
    return offhandweapon;
}

// Namespace weapon
// Params 1
// Checksum 0xcbf8aaa2, Offset: 0x4d4c
// Size: 0x1d, Type: bool
function isweaponequipment( weapon )
{
    return weapon.inventorytype == "offhand";
}

// Namespace weapon
// Params 1
// Checksum 0xfae737b6, Offset: 0x4d72
// Size: 0x1b, Type: bool
function isequipmentaddon( weapon )
{
    if ( weapon == "iw9_knifestab" )
    {
        return true;
    }
    
    return false;
}

// Namespace weapon
// Params 1
// Checksum 0xc6172a6e, Offset: 0x4d96
// Size: 0x36
function getweaponbotpersonalities( weapon )
{
    rootname = getweaponrootname( weapon );
    return level.weaponmapdata[ rootname ].botpersonalities;
}

// Namespace weapon
// Params 1
// Checksum 0x26b62867, Offset: 0x4dd5
// Size: 0x24, Type: bool
function function_ad2262e5ff0331a3( weapon )
{
    if ( function_180f246714b6c204( weapon ) )
    {
        return false;
    }
    
    if ( function_7974b348bf7596e9( weapon ) )
    {
        return false;
    }
    
    return true;
}

// Namespace weapon
// Params 1
// Checksum 0x87a0543d, Offset: 0x4e02
// Size: 0x1f, Type: bool
function isspreadweapon( objweapon )
{
    return isdefined( objweapon ) && weaponclass( objweapon ) == "spread";
}

// Namespace weapon
// Params 1
// Checksum 0x711f324, Offset: 0x4e2a
// Size: 0x98
function iswonderweapon( weapon )
{
    if ( !isdefined( weapon ) )
    {
        assertmsg( "<dev string:x89c>" );
        return 0;
    }
    
    if ( !isdefined( level.weaponmetadata ) )
    {
        return 0;
    }
    
    if ( isstring( weapon ) )
    {
        weapon = makeweapon( weapon );
    }
    
    var_f215d97f7ae67a6b = weapon.var_1616e6fbba9a722d;
    
    if ( !isdefined( var_f215d97f7ae67a6b ) )
    {
        return 0;
    }
    
    metadata = level.weaponmetadata[ var_f215d97f7ae67a6b ];
    
    if ( isdefined( metadata.iswonderweapon ) )
    {
        return metadata.iswonderweapon;
    }
    
    return 0;
}

// Namespace weapon
// Params 1
// Checksum 0x2bdccdad, Offset: 0x4ecb
// Size: 0x1b
function isbackuppistol( weapon )
{
    return weapon hasattachmenthash( %"backup_pistol" );
}

// Namespace weapon
// Params 0, eflags: 0x5
// Checksum 0xb501e2bc, Offset: 0x4eef
// Size: 0x2d
function private autoexec function_99b866e5ee9fe6d3()
{
    /#
        setdevdvar( @"hash_c30411f274497e85", "<dev string:x8de>" );
    #/
    
    buildweaponmap();
    buildattachmentmaps();
    function_47c21f91a5f180b8();
}

// Namespace weapon
// Params 2
// Checksum 0x5694bdc8, Offset: 0x4f24
// Size: 0x14c, Type: bool
function fixupplayerweapons( player, weapon )
{
    currentplayerweapons = player getweaponslistprimaries();
    dirtyprimary = 1;
    dirtysecondary = 1;
    weaponname = undefined;
    weaponobj = utility::function_64003742d8f5c781( weapon );
    
    if ( isweapon( weapon ) )
    {
        weaponname = getcompleteweaponname( weapon );
    }
    
    foreach ( currentweapon in currentplayerweapons )
    {
        if ( player.primaryweaponobj == currentweapon )
        {
            dirtyprimary = 0;
            continue;
        }
        
        if ( player.secondaryweaponobj == currentweapon )
        {
            dirtysecondary = 0;
        }
    }
    
    if ( dirtyprimary )
    {
        player.primaryweapon = weaponname;
        player.primaryweaponobj = weaponobj;
    }
    else if ( dirtysecondary )
    {
        player.secondaryweapon = weaponname;
        player.secondaryweaponobj = weaponobj;
    }
    
    return dirtyprimary || dirtysecondary;
}

// Namespace weapon
// Params 2
// Checksum 0xd03d6893, Offset: 0x5079
// Size: 0x4f
function getmaxattachments( slot, wildcard )
{
    maxattachments = level.maxattachments[ slot ];
    
    if ( wildcard == "wildcard_gunfighter" )
    {
        return maxattachments.gunfighter;
    }
    
    return maxattachments.standard;
}

// Namespace weapon
// Params 1
// Checksum 0x39c0796c, Offset: 0x50d1
// Size: 0x15
function getmaxprimaryattachments( wildcard )
{
    return getmaxattachments( 0, wildcard );
}

// Namespace weapon
// Params 1
// Checksum 0x66d6f0b2, Offset: 0x50ef
// Size: 0x16
function getmaxsecondaryattachments( wildcard )
{
    return getmaxattachments( 1, wildcard );
}

// Namespace weapon
// Params 1
// Checksum 0xf65e3a69, Offset: 0x510e
// Size: 0x16
function function_222f1c49e082a080( wildcard )
{
    return getmaxattachments( 2, wildcard );
}

// Namespace weapon
// Params 0
// Checksum 0x17ba00d1, Offset: 0x512d
// Size: 0xd
function function_45ab75ece154ca8f()
{
    return getmaxprimaryattachments( "wildcard_gunfighter" );
}

// Namespace weapon
// Params 0
// Checksum 0x8df66162, Offset: 0x5143
// Size: 0xd
function function_a7a39da0cf2d5b5b()
{
    return getmaxsecondaryattachments( "wildcard_gunfighter" );
}

// Namespace weapon
// Params 0
// Checksum 0xd8c47032, Offset: 0x5159
// Size: 0xd
function function_bedf9f9cfa13920d()
{
    return function_222f1c49e082a080( "wildcard_gunfighter" );
}

// Namespace weapon
// Params 0
// Checksum 0xc3905a3f, Offset: 0x516f
// Size: 0xc
function getslotcount()
{
    return level.maxattachments.size;
}

// Namespace weapon
// Params 0
// Checksum 0xab9036b8, Offset: 0x5184
// Size: 0x22, Type: bool
function function_89d2d0588f2def25()
{
    return self.var_d4fbf82d31726e1c && level.var_4aa2b67bae0df4a0[ self.var_d4fbf82d31726e1c ];
}

// Namespace weapon
// Params 0
// Checksum 0x5c491908, Offset: 0x51af
// Size: 0x39, Type: bool
function function_7e51eda73b48a495()
{
    return self.var_d4fbf82d31726e1c && self.team && level.var_ab949d4d01af0a68[ self.team ][ self.var_d4fbf82d31726e1c ];
}

// Namespace weapon
// Params 0
// Checksum 0xc1930cae, Offset: 0x51f1
// Size: 0x9
function function_6e304ebdebb410()
{
    function_684646ff6cec7318();
}

// Namespace weapon
// Params 0
// Checksum 0xed50da5c, Offset: 0x5202
// Size: 0x9
function function_4b531bff921831ff()
{
    function_dbdd90c189df6c61();
}

// Namespace weapon
// Params 2
// Checksum 0xf893d058, Offset: 0x5213
// Size: 0x49, Type: bool
function function_5529f6ffc8acec08( oldteam, newteam )
{
    if ( !level.var_4aa2b67bae0df4a0[ self.var_d4fbf82d31726e1c ] )
    {
        return false;
    }
    
    function_dbdd90c189df6c61();
    self.team = newteam;
    function_684646ff6cec7318();
    return true;
}

// Namespace weapon
// Params 0
// Checksum 0x30735927, Offset: 0x5265
// Size: 0xf
function function_438072bd0efdcff3()
{
    return arraycopy( level.var_4aa2b67bae0df4a0 );
}

// Namespace weapon
// Params 1
// Checksum 0xf4a00528, Offset: 0x527d
// Size: 0x1c
function function_556df87f7e3366bb( team )
{
    return arraycopy( level.var_ab949d4d01af0a68[ team ] );
}

// Namespace weapon
// Params 0
// Checksum 0xc33047aa, Offset: 0x52a2
// Size: 0xb
function function_3aafcaf7ff6dea9e()
{
    return level.var_4aa2b67bae0df4a0;
}

// Namespace weapon
// Params 1
// Checksum 0xd747b0cf, Offset: 0x52b6
// Size: 0xf7
function function_84ab82bdba5dfb9d( team )
{
    result = [];
    
    foreach ( mines in level.var_ab949d4d01af0a68 )
    {
        foreach ( m in mines )
        {
            result[ result.size ] = m;
        }
    }
    
    return result;
}

// Namespace weapon
// Params 0, eflags: 0x4
// Checksum 0x965da415, Offset: 0x53b6
// Size: 0x22
function private function_8eff8abb44086548()
{
    level.var_4aa2b67bae0df4a0 = [];
    level.var_ab949d4d01af0a68 = [];
    level.var_f7303e01ed5fe77f = 9999;
}

// Namespace weapon
// Params 0, eflags: 0x4
// Checksum 0xd1761d41, Offset: 0x53e0
// Size: 0x94
function private function_684646ff6cec7318()
{
    self.var_d4fbf82d31726e1c = level.var_f7303e01ed5fe77f;
    level.var_f7303e01ed5fe77f++;
    level.var_4aa2b67bae0df4a0[ self.var_d4fbf82d31726e1c ] = self;
    
    if ( self.team )
    {
        if ( !isdefined( level.var_ab949d4d01af0a68[ self.team ] ) )
        {
            level.var_ab949d4d01af0a68[ self.team ] = [];
        }
        
        level.var_ab949d4d01af0a68[ self.team ][ level.var_ab949d4d01af0a68[ self.team ].size ] = self;
    }
}

// Namespace weapon
// Params 0, eflags: 0x4
// Checksum 0xecf95992, Offset: 0x547c
// Size: 0x59
function private function_dbdd90c189df6c61()
{
    if ( self.var_d4fbf82d31726e1c )
    {
        level.var_4aa2b67bae0df4a0[ self.var_d4fbf82d31726e1c ] = undefined;
        
        if ( self.team )
        {
            level.var_ab949d4d01af0a68[ self.team ] = arrayremove( level.var_ab949d4d01af0a68[ self.team ], self );
        }
    }
}

// Namespace weapon
// Params 1, eflags: 0x4
// Checksum 0x149af791, Offset: 0x54dd
// Size: 0xa1
function private function_3c1487d3e0c3cf41( params )
{
    foreach ( trigger in params.var_619d6a48f5a56867 )
    {
        level.var_619d6a48f5a56867[ trigger.entnum ?? utility::function_6ed37478a8ad7320( trigger ) ] = trigger;
    }
}

// Namespace weapon
// Params 1
// Checksum 0xa3dfb77c, Offset: 0x5586
// Size: 0x9c, Type: bool
function function_ecbdce6df0e16a2a( var_7a7a769159687e6d )
{
    foreach ( var_4f16c60769e4f39a in level.var_619d6a48f5a56867 )
    {
        if ( var_4f16c60769e4f39a.var_4ccbc53137f1b108[ var_7a7a769159687e6d ] && self istouching( var_4f16c60769e4f39a ) )
        {
            return true;
        }
    }
    
    return false;
}

