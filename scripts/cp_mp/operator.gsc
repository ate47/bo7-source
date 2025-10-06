#using scripts\common\callbacks;
#using scripts\common\devgui;
#using scripts\common\utility;
#using scripts\common\vehicle;
#using scripts\cp_mp\utility\loot;
#using scripts\engine\utility;

#namespace operator;

// Namespace operator
// Params 0
// Checksum 0x4cae11dd, Offset: 0x2a0
// Size: 0x62
function function_c79f6a12d91ad551()
{
    projectname = getprojectname();
    
    if ( projectname == "T10" || projectname == "WZ2" )
    {
        return getdvarint( @"hash_1fd86bdad9333d2", 0 );
    }
    else if ( level.projectbundle.var_786bc1b37b3f67fa )
    {
        return getdvarint( @"hash_1fd86bdad9333d2", 1 );
    }
    
    return 0;
}

// Namespace operator
// Params 0
// Checksum 0xee81b26c, Offset: 0x30b
// Size: 0x2d, Type: bool
function function_fce13d709d67dd26()
{
    projectname = getprojectname();
    
    if ( projectname == "SAT" || projectname == "SAW" )
    {
        return true;
    }
    
    return false;
}

// Namespace operator
// Params 0, eflags: 0x4
// Checksum 0xe4eb0db6, Offset: 0x341
// Size: 0x33, Type: bool
function private isbuildingmap()
{
    /#
        if ( getdvarint( @"hash_e6afce2cf5cf7515", 0 ) == 1 )
        {
            return true;
        }
        
        if ( getdvarint( @"hash_742caa13b3c2e685" ) == 1 )
        {
            return true;
        }
    #/
    
    return false;
}

/#

    // Namespace operator
    // Params 0, eflags: 0x4
    // Checksum 0x3565dc7a, Offset: 0x37d
    // Size: 0x376, Type: dev
    function private function_7412a0b60cad7aec()
    {
        if ( level.var_a2929374d108d239 )
        {
            return;
        }
        
        level.var_a2929374d108d239 = 1;
        profilestart();
        devgui::function_9082edeb5db93280( "<dev string:x24>" );
        
        foreach ( operator in level.var_b3fc180d242c4d12 )
        {
            operatorbundle = getoperatorbundle( operator );
            operatorgender = operatorbundle.gender ?? "<dev string:x37>";
            gender = undefined;
            
            switch ( operatorgender )
            {
                case #"hash_5e9616b9548f69b9":
                    gender = "<dev string:x49>";
                    break;
                case #"hash_b411a9fa1c94e739":
                    gender = "<dev string:x6d>";
                    break;
                default:
                    gender = "<dev string:x88>";
                    break;
            }
            
            faction = ( operatorbundle.superfaction ?? "<dev string:x9d>" ) == "<dev string:x9d>" ? "<dev string:xa5>" : "<dev string:xba>";
            
            if ( isdefined( level.var_ff43edef64cd11ef[ operator ] ) )
            {
                foreach ( skin in level.var_ff43edef64cd11ef[ operator ] )
                {
                    if ( issubstr( getxhashsourcename( skin ), "<dev string:xcf>" ) )
                    {
                        devgui::add_devgui_command( "<dev string:xd7>" + "<dev string:xdf>" + getxhashsourcename( skin ), "<dev string:xe4>" + getxhashsourcename( skin ) );
                    }
                    
                    project = "<dev string:xfe>";
                    
                    if ( issubstr( tolower( getxhashsourcename( skin ) ), "<dev string:x107>" ) )
                    {
                        project = "<dev string:x10e>";
                    }
                    else if ( issubstr( tolower( getxhashsourcename( skin ) ), "<dev string:x118>" ) )
                    {
                        project = "<dev string:x11f>";
                    }
                    else if ( issubstr( tolower( getxhashsourcename( skin ) ), "<dev string:x129>" ) )
                    {
                        project = "<dev string:x130>";
                    }
                    
                    devgui::add_devgui_command( project + gender + getxhashsourcename( operator ) + "<dev string:xdf>" + getxhashsourcename( skin ), "<dev string:xe4>" + getxhashsourcename( skin ) );
                    devgui::add_devgui_command( project + faction + getxhashsourcename( operator ) + "<dev string:xdf>" + getxhashsourcename( skin ), "<dev string:xe4>" + getxhashsourcename( skin ) );
                }
            }
        }
        
        utility::callsharedfunc( #"bodysize", #"hash_77e79f676746c38d" );
        devgui::add_devgui_command( "<dev string:x13a>", "<dev string:x158>" );
        devgui::add_devgui_command( "<dev string:x17a>", "<dev string:x191>" );
        devgui::add_devgui_command( "<dev string:x1b3>", "<dev string:x1cb>" );
        devgui::add_devgui_command( "<dev string:x1ed>", "<dev string:x20e>" );
        devgui::add_devgui_command( "<dev string:x230>", "<dev string:x24f>" );
        devgui::add_devgui_command( "<dev string:x273>", "<dev string:x28d>" );
        devgui::add_devgui_command( "<dev string:x31e>", "<dev string:x339>" );
        devgui::add_devgui_command( "<dev string:x355>", "<dev string:x370>" );
        devgui::function_77df7fe7dd273e10();
        profilestop();
    }

#/

// Namespace operator
// Params 0
// Checksum 0x9d866aa6, Offset: 0x6fb
// Size: 0x52
function function_d846e5ddf3fe819()
{
    if ( level.var_53d46e3fba9849a5 )
    {
        function_b32394f15d245bec();
    }
    
    if ( !level.var_b4c751094ee885a7 )
    {
        if ( getdvarint( @"hash_2e21b938e2994ff5", 0 ) == 0 )
        {
            level.var_53d46e3fba9849a5 = 1;
            function_e5efd24ec4dbf5d9();
            waitframe();
            level.var_53d46e3fba9849a5 = undefined;
        }
    }
}

// Namespace operator
// Params 0, eflags: 0x4
// Checksum 0xdc5b12f2, Offset: 0x755
// Size: 0x35
function private function_b32394f15d245bec()
{
    var_b0d06f51bf884f15 = 0;
    
    while ( level.var_53d46e3fba9849a5 )
    {
        var_b0d06f51bf884f15++;
        
        if ( var_b0d06f51bf884f15 > 10 )
        {
            level.var_53d46e3fba9849a5 = undefined;
            return;
        }
        
        waitframe();
    }
}

// Namespace operator
// Params 0
// Checksum 0xc20dd32b, Offset: 0x792
// Size: 0x9
function function_2a088dd032a61c0a()
{
    function_c0a88ddbad609f58();
}

// Namespace operator
// Params 0, eflags: 0x4
// Checksum 0xe2a74429, Offset: 0x7a3
// Size: 0x17
function private function_c0a88ddbad609f58()
{
    if ( isdefined( level.var_b3fc180d242c4d12 ) )
    {
        return;
    }
    
    function_91b15d3a8ac032c0();
}

// Namespace operator
// Params 0, eflags: 0x4
// Checksum 0x1f50c58a, Offset: 0x7c2
// Size: 0x1cf
function private function_91b15d3a8ac032c0()
{
    level.var_b3fc180d242c4d12 = [];
    
    if ( isbuildingmap() )
    {
        return;
    }
    
    gamemodebundle = level.gamemodebundle;
    
    if ( !isdefined( gamemodebundle.operatorlist ) )
    {
        return;
    }
    
    operatorlistbundle = function_4012b9b076e857d5( gamemodebundle.operatorlist );
    
    /#
        if ( !isdefined( operatorlistbundle ) )
        {
            println( "<dev string:x38c>" + gamemodebundle.operatorlist );
            return;
        }
    #/
    
    operatorlist = operatorlistbundle.operatorlist;
    level.defaultoperator = [];
    level.defaultoperator[ "allies" ] = operatorlistbundle.var_c2b6e3c927c2a5e4;
    level.defaultoperator[ "axis" ] = operatorlistbundle.var_8597bc9b07f488ee;
    
    for ( i = 0; i < operatorlist.size ; i++ )
    {
        operatorref = operatorlist[ i ].operator;
        
        if ( !isdefined( operatorref ) )
        {
            continue;
        }
        
        /#
            operatorbundle = function_d31f72cf98934929( operatorref, #"defaultexecution" );
            
            if ( !isdefined( operatorbundle ) )
            {
                println( "<dev string:x3ba>" + gamemodebundle.operatorlist + "<dev string:x3f1>" + getxhashsourcename( operatorref ) );
                continue;
            }
            
            if ( getdvarint( @"hash_fe759d6fbaec1079", 0 ) == 1 )
            {
                assert( isdefined( operatorbundle.defaultexecution ), "<dev string:x3f7>" + getxhashsourcename( operatorref ) + "<dev string:x404>" );
            }
        #/
        
        level.var_b3fc180d242c4d12[ level.var_b3fc180d242c4d12.size ] = operatorref;
    }
    
    level.var_55b857e48f4f0dab[ 0 ] = operatorlistbundle.var_c2b6e3c927c2a5e4;
    level.var_55b857e48f4f0dab[ 1 ] = operatorlistbundle.var_8597bc9b07f488ee;
}

// Namespace operator
// Params 1
// Checksum 0xa848b05b, Offset: 0x999
// Size: 0x7c
function function_449035ab2454100( operatorref )
{
    if ( isbuildingmap() )
    {
        return;
    }
    
    operatorbundle = function_d31f72cf98934929( operatorref, [ #"skins", #"defaultskin" ] );
    
    /#
        if ( !isdefined( operatorbundle ) )
        {
            println( "<dev string:x472>" + operatorref );
            return;
        }
    #/
    
    level.var_b3fc180d242c4d12[ level.var_b3fc180d242c4d12.size ] = operatorref;
    function_6c240cb0de0e0db1( operatorref, operatorbundle );
}

// Namespace operator
// Params 0
// Checksum 0x9844ae98, Offset: 0xa1d
// Size: 0x12
function function_91f90d6f14a0f260()
{
    function_c0a88ddbad609f58();
    return level.var_b3fc180d242c4d12;
}

// Namespace operator
// Params 1
// Checksum 0xab04df0d, Offset: 0xa38
// Size: 0x20
function function_fb3ad5cd3a9ae76b( operatorref )
{
    if ( !operatorref )
    {
        return 0;
    }
    
    return arraycontains( function_91f90d6f14a0f260(), operatorref );
}

// Namespace operator
// Params 2
// Checksum 0x41e92fa8, Offset: 0xa61
// Size: 0x48
function getoperatorbundle( operatorref, var_5c6c42708a3dc0c )
{
    operatorbundle = function_d31f72cf98934929( operatorref, var_5c6c42708a3dc0c );
    
    /#
        if ( !isdefined( operatorbundle ) )
        {
            assertmsg( "<dev string:x49b>" + getxhashsourcename( operatorref ) );
        }
    #/
    
    return operatorbundle;
}

// Namespace operator
// Params 1
// Checksum 0x51e7286b, Offset: 0xab2
// Size: 0x41, Type: bool
function getoperatorsuperfaction( operatorref )
{
    operatorbundle = getoperatorbundle( operatorref, #"superfaction" );
    
    if ( operatorbundle.superfaction == "EAST" )
    {
        return true;
    }
    
    return false;
}

// Namespace operator
// Params 2
// Checksum 0xab4e4ff3, Offset: 0xafc
// Size: 0x8f
function function_bc6d8ad64545fc57( operatorref, operatorSkinRef )
{
    value = undefined;
    var_7a924103a375a9fb = function_b13392d83a0191e0( operatorSkinRef );
    
    if ( var_7a924103a375a9fb.var_6ff78a8c39146e65 )
    {
        value = var_7a924103a375a9fb.var_83dee9f4a0c1845;
    }
    else
    {
        operatorbundle = getoperatorbundle( operatorref );
        value = operatorbundle.var_83dee9f4a0c1845 ?? #"";
    }
    
    if ( !isxhash( value ) )
    {
        value = getxhash( value );
    }
    
    return value;
}

// Namespace operator
// Params 1
// Checksum 0x5e264996, Offset: 0xb94
// Size: 0x40
function function_66a3fbacf1fcad50( operatorref )
{
    operatorbundle = getoperatorbundle( operatorref );
    
    if ( isdefined( operatorbundle.var_32f1671d700d69b6 ) )
    {
        return getscriptbundle( operatorbundle.var_32f1671d700d69b6 );
    }
    
    return undefined;
}

// Namespace operator
// Params 1
// Checksum 0xe18dd1d8, Offset: 0xbdd
// Size: 0x40
function function_82d89269854f2e0f( operatorref )
{
    operatorbundle = getoperatorbundle( operatorref );
    
    if ( isdefined( operatorbundle.var_52e9517775f84ce5 ) )
    {
        return getscriptbundle( operatorbundle.var_52e9517775f84ce5 );
    }
    
    return undefined;
}

// Namespace operator
// Params 1
// Checksum 0xb97140b7, Offset: 0xc26
// Size: 0x4e
function getoperatorvoice( operatorref )
{
    operatorbundle = getoperatorbundle( operatorref, [ #"voice" ] );
    
    if ( isdefined( operatorbundle.voice ) )
    {
        return operatorbundle.voice;
    }
    
    return "";
}

// Namespace operator
// Params 1
// Checksum 0x95390947, Offset: 0xc7d
// Size: 0x4d
function getoperatorgender( operatorref )
{
    operatorbundle = getoperatorbundle( operatorref, [ #"gender" ] );
    
    if ( operatorbundle.gender == "FEMALE" )
    {
        return "female";
    }
    
    return "male";
}

// Namespace operator
// Params 1
// Checksum 0x4bb406e1, Offset: 0xcd3
// Size: 0x4e
function function_db4f41253b282a4f( operatorref )
{
    operatorbundle = getoperatorbundle( operatorref, [ #"defaultexecution" ] );
    
    if ( isdefined( operatorbundle.defaultexecution ) )
    {
        return operatorbundle.defaultexecution;
    }
    
    return "";
}

// Namespace operator
// Params 1
// Checksum 0x89103dc0, Offset: 0xd2a
// Size: 0x4e
function function_d5a18e550f529e2c( operatorref )
{
    operatorbundle = getoperatorbundle( operatorref, [ #"defaultquip" ] );
    
    if ( isdefined( operatorbundle.defaultquip ) )
    {
        return operatorbundle.defaultquip;
    }
    
    return "";
}

// Namespace operator
// Params 1
// Checksum 0x4e7745b, Offset: 0xd81
// Size: 0x2c, Type: bool
function isoperatorunlocked( operatorref )
{
    return getoperatorbundle( operatorref, #"hash_1aad59b5bb5eb9fe" ).var_ffaa6b376f7925ff ?? 1;
}

// Namespace operator
// Params 1
// Checksum 0xd576c607, Offset: 0xdb6
// Size: 0x56
function function_2b34573c920ee585( operatorref )
{
    operatorbundle = getoperatorbundle( operatorref, #"botinvalid" );
    
    if ( isdefined( operatorbundle ) )
    {
        if ( isdefined( operatorbundle.botinvalid ) )
        {
            return !operatorbundle.botinvalid;
        }
        else
        {
            return 1;
        }
        
        return;
    }
    
    return 0;
}

// Namespace operator
// Params 1
// Checksum 0x3dc04a6, Offset: 0xe14
// Size: 0x4e
function function_d0589f3304fb58da( operatorref )
{
    operatorbundle = getoperatorbundle( operatorref, [ #"botgroup" ] );
    
    if ( isdefined( operatorbundle.botgroup ) )
    {
        return operatorbundle.botgroup;
    }
    
    return "";
}

// Namespace operator
// Params 1
// Checksum 0x7e39eb2e, Offset: 0xe6b
// Size: 0x55
function getoperatorteambyref( operatorref )
{
    operatorbundle = getoperatorbundle( operatorref );
    team = ( operatorbundle.superfaction ?? "WEST" ) == "WEST" ? "allies" : "axis";
    return team;
}

// Namespace operator
// Params 1
// Checksum 0x332a8a3b, Offset: 0xec9
// Size: 0x4a
function function_f3a3ee0b2758d139( operatorref )
{
    operatorbundle = getoperatorbundle( operatorref, [ #"lootid" ] );
    
    if ( isdefined( operatorbundle.lootid ) )
    {
        return operatorbundle.lootid;
    }
    
    return 0;
}

// Namespace operator
// Params 1
// Checksum 0x6378deae, Offset: 0xf1c
// Size: 0x3d, Type: bool
function function_ba9b1d7b8bbd957e( operatorref )
{
    operatorbundle = getoperatorbundle( operatorref, [ #"hash_e0f7a8bdbdc8d533" ] );
    return operatorbundle.var_d3a61d86c7348092 ?? 0;
}

// Namespace operator
// Params 1
// Checksum 0x4f7174b, Offset: 0xf62
// Size: 0x41, Type: bool
function function_a47e3481b8d81aa7( operatorref )
{
    operatorbundle = getoperatorbundle( operatorref, [ #"suit" ] );
    return operatorbundle.suit ?? "";
}

// Namespace operator
// Params 0
// Checksum 0x6500b702, Offset: 0xfac
// Size: 0xd
function function_1e97ddc0ff6d0c40()
{
    return level.var_55b857e48f4f0dab[ 0 ];
}

// Namespace operator
// Params 0
// Checksum 0x35fab7fc, Offset: 0xfc2
// Size: 0xe
function function_8d28c3fcfc8cc4a2()
{
    return level.var_55b857e48f4f0dab[ 1 ];
}

// Namespace operator
// Params 1
// Checksum 0xd303ff9a, Offset: 0xfd9
// Size: 0x25
function function_297589994c9a9eff( var_a3559c3721faf851 )
{
    if ( var_a3559c3721faf851 == 1 )
    {
        return function_8d28c3fcfc8cc4a2();
    }
    
    return function_1e97ddc0ff6d0c40();
}

// Namespace operator
// Params 0, eflags: 0x4
// Checksum 0x21e55863, Offset: 0x1006
// Size: 0x17
function private function_e5efd24ec4dbf5d9()
{
    if ( isdefined( level.var_b4c751094ee885a7 ) )
    {
        return;
    }
    
    function_84302cb6ff5837f();
}

// Namespace operator
// Params 0, eflags: 0x4
// Checksum 0x914f1e52, Offset: 0x1025
// Size: 0x30b
function private function_84302cb6ff5837f()
{
    function_c0a88ddbad609f58();
    level.var_aea805ad236a525f = [];
    level.var_b4c751094ee885a7 = [];
    level.var_ff43edef64cd11ef = [];
    level.var_7c09484f1926c102 = [];
    level.var_212650972ad1a958 = [];
    
    if ( isbuildingmap() )
    {
        return;
    }
    
    foreach ( operatorref in level.var_b3fc180d242c4d12 )
    {
        operatorbundle = getoperatorbundle( operatorref, [ #"skins", #"defaultskin" ] );
        
        if ( !isdefined( operatorbundle ) )
        {
            continue;
        }
        
        foreach ( var_6ae831966348de25 in operatorbundle.skins )
        {
            skinref = var_6ae831966348de25.skin;
            
            if ( !isdefined( skinref ) )
            {
                continue;
            }
            
            var_6739a9c997eec5c5 = function_b13392d83a0191e0( skinref, #"hash_ac7fd2c9c6408186" ).var_6739a9c997eec5c5;
            level.var_aea805ad236a525f[ level.var_aea805ad236a525f.size ] = skinref;
            level.var_b4c751094ee885a7[ skinref ] = operatorref;
            
            if ( function_35303b94875f6d5b( var_6739a9c997eec5c5 ) )
            {
                level.var_212650972ad1a958[ function_b13392d83a0191e0( skinref, #"lootid" ).lootid ] = var_6739a9c997eec5c5;
            }
            
            if ( !isdefined( level.var_ff43edef64cd11ef[ operatorref ] ) )
            {
                level.var_ff43edef64cd11ef[ operatorref ] = [];
            }
            
            level.var_ff43edef64cd11ef[ operatorref ][ level.var_ff43edef64cd11ef[ operatorref ].size ] = skinref;
        }
        
        assert( isdefined( level.var_ff43edef64cd11ef[ operatorref ] ), "<dev string:x4bb>" + getxhashsourcename( operatorref ) + "<dev string:x4c9>" );
        
        if ( isdefined( operatorbundle.defaultskin ) )
        {
            skinref = operatorbundle.defaultskin;
            var_7a924103a375a9fb = function_b13392d83a0191e0( skinref, [ #"hash_ac7fd2c9c6408186", #"lootid" ] );
            
            if ( isdefined( var_7a924103a375a9fb ) )
            {
                level.var_7c09484f1926c102[ operatorref ] = skinref;
                
                if ( function_35303b94875f6d5b( var_7a924103a375a9fb.var_6739a9c997eec5c5 ) )
                {
                    level.var_212650972ad1a958[ var_7a924103a375a9fb.lootid ] = var_7a924103a375a9fb.var_6739a9c997eec5c5;
                }
                
                continue;
            }
            
            assertmsg( "<dev string:x3f7>" + getxhashsourcename( operatorref ) + "<dev string:x4ec>" );
        }
    }
    
    /#
        function_7412a0b60cad7aec();
    #/
}

// Namespace operator
// Params 2, eflags: 0x4
// Checksum 0xb4e708c3, Offset: 0x1338
// Size: 0x216
function private function_6c240cb0de0e0db1( operatorref, operatorbundle )
{
    if ( isbuildingmap() )
    {
        return;
    }
    
    assert( isdefined( level.var_b4c751094ee885a7 ) );
    
    foreach ( var_6ae831966348de25 in operatorbundle.skins )
    {
        if ( !isdefined( var_6ae831966348de25.skin ) )
        {
            continue;
        }
        
        skinref = var_6ae831966348de25.skin;
        var_6739a9c997eec5c5 = function_b13392d83a0191e0( skinref, #"hash_ac7fd2c9c6408186" ).var_6739a9c997eec5c5;
        level.var_aea805ad236a525f[ level.var_aea805ad236a525f.size ] = skinref;
        level.var_b4c751094ee885a7[ skinref ] = operatorref;
        
        if ( function_35303b94875f6d5b( var_6739a9c997eec5c5 ) )
        {
            level.var_212650972ad1a958[ function_b13392d83a0191e0( skinref, #"lootid" ).lootid ] = var_6739a9c997eec5c5;
        }
        
        if ( !isdefined( level.var_ff43edef64cd11ef[ operatorref ] ) )
        {
            level.var_ff43edef64cd11ef[ operatorref ] = [];
        }
        
        level.var_ff43edef64cd11ef[ operatorref ][ level.var_ff43edef64cd11ef[ operatorref ].size ] = skinref;
    }
    
    if ( isdefined( operatorbundle.defaultskin ) )
    {
        var_7a924103a375a9fb = function_b13392d83a0191e0( operatorbundle.defaultskin, [ #"hash_ac7fd2c9c6408186", #"lootid" ] );
        skinref = operatorbundle.defaultskin;
        
        if ( isdefined( var_7a924103a375a9fb ) )
        {
            level.var_7c09484f1926c102[ operatorref ] = skinref;
            
            if ( function_35303b94875f6d5b( var_7a924103a375a9fb.var_6739a9c997eec5c5 ) )
            {
                level.var_212650972ad1a958[ var_7a924103a375a9fb.lootid ] = var_7a924103a375a9fb.var_6739a9c997eec5c5;
            }
        }
    }
}

// Namespace operator
// Params 1
// Checksum 0xc130fc59, Offset: 0x1556
// Size: 0x6a, Type: bool
function function_10ad0df66b5a20a7( skinlootid )
{
    if ( !skinlootid || loot::function_52cf8374c44a4ff5( skinlootid ) != "operator_skin" )
    {
        return false;
    }
    
    operatorSkinRef = loot::function_f54ecb89dfab8e8c( skinlootid );
    operatorref = function_30f20ce375c4ee40( operatorSkinRef );
    return arraycontains( function_91f90d6f14a0f260(), operatorref ) && arraycontains( function_98bc5ea0c0c97599( operatorref ), operatorSkinRef );
}

// Namespace operator
// Params 1
// Checksum 0x35489ae0, Offset: 0x15c9
// Size: 0x39
function function_447fce2531e40d0e( operatorref )
{
    function_e5efd24ec4dbf5d9();
    
    if ( isdefined( level.var_7c09484f1926c102[ operatorref ] ) )
    {
        return level.var_7c09484f1926c102[ operatorref ];
    }
    
    return %"";
}

// Namespace operator
// Params 1
// Checksum 0xc7e2fde, Offset: 0x160b
// Size: 0x23, Type: bool
function function_98bc5ea0c0c97599( operatorref )
{
    function_e5efd24ec4dbf5d9();
    return level.var_ff43edef64cd11ef[ operatorref ] ?? [];
}

// Namespace operator
// Params 0
// Checksum 0x1c0b0eaf, Offset: 0x1637
// Size: 0x12
function function_27f5412663e0a09()
{
    function_e5efd24ec4dbf5d9();
    return level.var_aea805ad236a525f;
}

// Namespace operator
// Params 1
// Checksum 0x4531ebe5, Offset: 0x1652
// Size: 0xab
function function_de170b6ef0100e22( operatorname )
{
    if ( isstring( operatorname ) )
    {
        operatorname = getxhashasset( operatorname );
    }
    
    if ( isdefined( level.var_b4c751094ee885a7[ operatorname ] ) )
    {
        return operatorname;
    }
    
    foreach ( var_d2205cd4623841a3, operator in level.var_b4c751094ee885a7 )
    {
        if ( operator == operatorname )
        {
            return var_d2205cd4623841a3;
        }
    }
    
    return undefined;
}

// Namespace operator
// Params 1
// Checksum 0xa20cde2e, Offset: 0x1706
// Size: 0x58
function function_30f20ce375c4ee40( skinref )
{
    function_e5efd24ec4dbf5d9();
    
    if ( isstring( skinref ) )
    {
        skinref = getxhashasset( skinref );
    }
    
    /#
        if ( !isdefined( level.var_b4c751094ee885a7[ skinref ] ) )
        {
            assertmsg( "<dev string:x544>" + getxhashsourcename( skinref ) );
        }
    #/
    
    return level.var_b4c751094ee885a7[ skinref ];
}

// Namespace operator
// Params 0
// Checksum 0xc51a2f85, Offset: 0x1767
// Size: 0xf
function function_c62a41afcf68898b()
{
    return function_d3d2d68859f2d1e0( #"hash_e628945a034fe8cb" );
}

// Namespace operator
// Params 2
// Checksum 0xc5a3288d, Offset: 0x177f
// Size: 0x48
function function_d1e10cddb12fbe17( skinref, var_5c6c42708a3dc0c )
{
    var_7a924103a375a9fb = function_b13392d83a0191e0( skinref, var_5c6c42708a3dc0c );
    
    /#
        if ( !isdefined( var_7a924103a375a9fb ) )
        {
            assertmsg( "<dev string:x56b>" + getxhashsourcename( skinref ) );
        }
    #/
    
    return var_7a924103a375a9fb;
}

// Namespace operator
// Params 1
// Checksum 0xcc790cc, Offset: 0x17d0
// Size: 0x7a
function function_115f78fb5f506daa( skinref )
{
    if ( function_c62a41afcf68898b() )
    {
        return function_d1e10cddb12fbe17( skinref, #"headmodel" ).headmodel;
    }
    
    head = function_d1e10cddb12fbe17( skinref, #"head" ).head;
    
    if ( head )
    {
        return getscriptbundlefieldvalue( head, #"model" );
    }
    
    return %"";
}

// Namespace operator
// Params 1
// Checksum 0x32417034, Offset: 0x1852
// Size: 0x7a
function function_4e6b11f7340acc24( skinref )
{
    if ( function_c62a41afcf68898b() )
    {
        return function_d1e10cddb12fbe17( skinref, #"bodymodel" ).bodymodel;
    }
    
    body = function_d1e10cddb12fbe17( skinref, #"body" ).body;
    
    if ( body )
    {
        return getscriptbundlefieldvalue( body, #"model" );
    }
    
    return %"";
}

// Namespace operator
// Params 1
// Checksum 0x748cf5ba, Offset: 0x18d4
// Size: 0x7a
function function_50896d2b645d13c2( skinref )
{
    if ( function_c62a41afcf68898b() )
    {
        return function_d1e10cddb12fbe17( skinref, #"hash_c608451914de1770" ).var_872d17c7eb1da015;
    }
    
    body = function_d1e10cddb12fbe17( skinref, #"body" ).body;
    
    if ( body )
    {
        return getscriptbundlefieldvalue( body, #"armmodel" );
    }
    
    return %"";
}

// Namespace operator
// Params 1
// Checksum 0xc0ddfd67, Offset: 0x1956
// Size: 0x14b
function function_fb2ad6ca3c6b708d( skinref )
{
    models = [];
    
    if ( function_c62a41afcf68898b() )
    {
        var_7a924103a375a9fb = function_d1e10cddb12fbe17( skinref, [ #"bodymodel", #"headmodel", #"hash_c608451914de1770" ] );
        models[ 0 ] = var_7a924103a375a9fb.bodymodel;
        models[ 1 ] = var_7a924103a375a9fb.headmodel;
        models[ 2 ] = var_7a924103a375a9fb.var_872d17c7eb1da015;
    }
    else
    {
        var_7a924103a375a9fb = function_d1e10cddb12fbe17( skinref, [ #"body", #"head" ] );
        
        if ( var_7a924103a375a9fb.body )
        {
            var_d4df908b9cfc08de = getscriptbundlefieldvalue( var_7a924103a375a9fb.body, [ #"model", #"armmodel" ] );
            models[ 0 ] = var_d4df908b9cfc08de.head;
            models[ 2 ] = var_d4df908b9cfc08de.armmodel;
        }
        
        if ( var_7a924103a375a9fb.head )
        {
            models[ 1 ] = getscriptbundlefieldvalue( var_7a924103a375a9fb.head, #"model" ).model;
        }
    }
    
    return models;
}

// Namespace operator
// Params 1
// Checksum 0xb390c8b6, Offset: 0x1aaa
// Size: 0x33, Type: bool
function function_5c6e83213643805( skinref )
{
    return function_d1e10cddb12fbe17( skinref, #"hash_f171c2efd1b161cf" ).var_6d14360d020a276c ?? %"";
}

// Namespace operator
// Params 1
// Checksum 0x656f941c, Offset: 0x1ae6
// Size: 0x33, Type: bool
function function_4dcee1262a4ab410( skinref )
{
    return function_d1e10cddb12fbe17( skinref, #"hash_f0045d079ca24066" ).var_594edf28884a02ad ?? %"";
}

// Namespace operator
// Params 1
// Checksum 0xcdf964b7, Offset: 0x1b22
// Size: 0x2c, Type: bool
function function_faa5d37f28e6d925( skinref )
{
    return function_d1e10cddb12fbe17( skinref, #"canequip" ).canequip ?? 1;
}

// Namespace operator
// Params 1
// Checksum 0xbff614ec, Offset: 0x1b57
// Size: 0x56
function function_6261fa1bcd3ce668( skinref )
{
    var_7a924103a375a9fb = function_d1e10cddb12fbe17( skinref, #"botinvalid" );
    
    if ( isdefined( var_7a924103a375a9fb ) )
    {
        if ( isdefined( var_7a924103a375a9fb.botinvalid ) )
        {
            return !var_7a924103a375a9fb.botinvalid;
        }
        else
        {
            return 1;
        }
        
        return;
    }
    
    return 0;
}

// Namespace operator
// Params 1
// Checksum 0x34e7700f, Offset: 0x1bb5
// Size: 0x2f, Type: bool
function function_82781d300aee973e( skinref )
{
    return function_d1e10cddb12fbe17( skinref, #"lootimage" ).lootimage ?? "";
}

// Namespace operator
// Params 1
// Checksum 0x8211000a, Offset: 0x1bed
// Size: 0x2f, Type: bool
function function_b1788ccf1b3c0ae9( skinref )
{
    return function_d1e10cddb12fbe17( skinref, #"hash_a190b92d12131db0" ).var_561cd3d671f43fef ?? "";
}

// Namespace operator
// Params 1
// Checksum 0xdfea1b10, Offset: 0x1c25
// Size: 0x2f, Type: bool
function function_d633420b529828e8( skinref )
{
    return function_d1e10cddb12fbe17( skinref, #"hash_2e5c6d338f029967" ).var_792276a508ec7f1a ?? "";
}

// Namespace operator
// Params 1
// Checksum 0x7ce3746c, Offset: 0x1c5d
// Size: 0x2f, Type: bool
function function_5f1afd050db1579b( skinref )
{
    return function_d1e10cddb12fbe17( skinref, #"hash_e5cac6afd35e1f45" ).var_a61af6bf6ea49f06 ?? "";
}

// Namespace operator
// Params 1
// Checksum 0x7d09611b, Offset: 0x1c95
// Size: 0x2b, Type: bool
function function_c203df33ce95f84c( skinref )
{
    return function_d1e10cddb12fbe17( skinref, #"lootid" ).lootid ?? 0;
}

// Namespace operator
// Params 1
// Checksum 0xf9ecc45c, Offset: 0x1cc9
// Size: 0x2c
function function_cb12383888078591( skinref )
{
    return function_d1e10cddb12fbe17( skinref, [ #"reactiveoperator" ] ).var_a8d1b98ea8e4c341;
}

// Namespace operator
// Params 1
// Checksum 0x2eaa43f7, Offset: 0x1cfe
// Size: 0x2c
function function_bb4618718e086740( skinref )
{
    return function_d1e10cddb12fbe17( skinref, [ #"hash_b74126130fe1bde8" ] ).var_ba5ef8ce1f6a6aa3;
}

// Namespace operator
// Params 1
// Checksum 0xfe596156, Offset: 0x1d33
// Size: 0x2c
function function_4c7f17b5ae87e7be( skinref )
{
    return function_d1e10cddb12fbe17( skinref, [ #"hash_a30796472eab0efe" ] ).var_1a6762affce6e181;
}

// Namespace operator
// Params 1
// Checksum 0xd841a9da, Offset: 0x1d68
// Size: 0x2c
function function_4c23b4a4c457f40b( skinref )
{
    return function_d1e10cddb12fbe17( skinref, [ #"hash_babfddf124746871" ] ).var_ce1ec4a85f852e14;
}

// Namespace operator
// Params 1
// Checksum 0x5d8902f4, Offset: 0x1d9d
// Size: 0x2c
function function_233474e80ffd30( skinref )
{
    return function_d1e10cddb12fbe17( skinref, [ #"hash_321fae418d44abbc" ] ).var_430f23d923c86ba3;
}

// Namespace operator
// Params 1
// Checksum 0xab1e01fc, Offset: 0x1dd2
// Size: 0x2c
function function_5b6aad02fe43f871( skinref )
{
    return function_d1e10cddb12fbe17( skinref, [ #"hash_3f979bdff8dd6b0d" ] ).var_5f51bf7f6da09282;
}

// Namespace operator
// Params 1
// Checksum 0x9912462f, Offset: 0x1e07
// Size: 0xf9, Type: bool
function function_35303b94875f6d5b( var_e1488ff65b74a26c )
{
    if ( !isdefined( var_e1488ff65b74a26c ) || var_e1488ff65b74a26c == #"" )
    {
        return false;
    }
    
    assert( isxhash( var_e1488ff65b74a26c ) );
    
    if ( !isdefined( level.var_c769fc53a092c8b4 ) )
    {
        var_f2961c59221ccf42 = strtok( getdvar( @"hash_888c1a8e6ebb7178", "" ), "," );
        level.var_c769fc53a092c8b4 = [];
        
        foreach ( var_810c69ad564562e9 in var_f2961c59221ccf42 )
        {
            level.var_c769fc53a092c8b4[ getxhash( var_810c69ad564562e9 ) ] = 1;
        }
    }
    
    return isdefined( level.var_c769fc53a092c8b4[ var_e1488ff65b74a26c ] );
}

// Namespace operator
// Params 1
// Checksum 0x8c4e24f6, Offset: 0x1f09
// Size: 0x31
function function_647772866281c051( lootid )
{
    function_e5efd24ec4dbf5d9();
    
    if ( isdefined( level.var_212650972ad1a958[ lootid ] ) )
    {
        return level.var_212650972ad1a958[ lootid ];
    }
    
    return undefined;
}

// Namespace operator
// Params 0, eflags: 0x4
// Checksum 0xbdd7afda, Offset: 0x1f43
// Size: 0x1a5
function private function_e0f57a7fe250f216()
{
    if ( isdefined( level.var_ba16f6b55c830dd7 ) )
    {
        return;
    }
    
    level.var_ba16f6b55c830dd7 = [];
    level.var_e671d0cb401c31b4 = [];
    
    if ( isbuildingmap() )
    {
        return;
    }
    
    gamemodebundle = level.gamemodebundle;
    
    if ( !isdefined( gamemodebundle.execution_list ) )
    {
        return;
    }
    
    var_a16dfa195494bfb0 = getscriptbundle( hashcat( %"hash_3cf279fa8ccaf24e", gamemodebundle.execution_list ) );
    
    /#
        if ( !isdefined( var_a16dfa195494bfb0 ) )
        {
            println( "<dev string:x590>" + gamemodebundle.execution_list );
            return;
        }
    #/
    
    executionlist = var_a16dfa195494bfb0.operatorexecutionlist;
    
    for ( i = 0; i < executionlist.size ; i++ )
    {
        if ( !isdefined( executionlist[ i ].operatorexecution ) )
        {
            continue;
        }
        
        executionbundle = getscriptbundlefieldvalues( hashcat( %"hash_3c0bcccfd8362f86", executionlist[ i ].operatorexecution ), [ #"lootid", #"execution", #"propweapon" ] );
        executionref = executionlist[ i ].operatorexecution;
        
        /#
            if ( !isdefined( executionbundle ) )
            {
                println( "<dev string:x5c0>" + gamemodebundle.execution_list + "<dev string:x3f1>" + executionlist[ i ].operatorexecution );
                continue;
            }
        #/
        
        level.var_ba16f6b55c830dd7[ executionref ] = executionbundle;
        level.var_e671d0cb401c31b4[ level.var_e671d0cb401c31b4.size ] = executionref;
    }
}

// Namespace operator
// Params 1, eflags: 0x4
// Checksum 0xda482760, Offset: 0x20f0
// Size: 0x3c
function private function_2480f61a1b8bce30( executionref )
{
    function_e0f57a7fe250f216();
    assert( isdefined( level.var_ba16f6b55c830dd7[ executionref ] ), "<dev string:x5f8>" + executionref );
    return level.var_ba16f6b55c830dd7[ executionref ];
}

// Namespace operator
// Params 1, eflags: 0x4
// Checksum 0x169b966d, Offset: 0x2135
// Size: 0x32, Type: bool
function private isexecutionvalid( executionref )
{
    if ( executionref )
    {
        return ( utility::callsharedfunc( #"execution", #"validate", executionref ) ?? 1 );
    }
    
    return false;
}

// Namespace operator
// Params 0, eflags: 0x4
// Checksum 0x346cec86, Offset: 0x2170
// Size: 0x9
function private function_10f49a11ea83fafe()
{
    return function_3f565e1417cc2505( 0 );
}

// Namespace operator
// Params 0
// Checksum 0xaf6dcd7c, Offset: 0x2182
// Size: 0x12
function function_17165c3055f66282()
{
    function_e0f57a7fe250f216();
    return level.var_e671d0cb401c31b4;
}

// Namespace operator
// Params 1
// Checksum 0x18f99256, Offset: 0x219d
// Size: 0x3c
function function_3f565e1417cc2505( executionid )
{
    function_e0f57a7fe250f216();
    assert( isdefined( level.var_e671d0cb401c31b4[ executionid ] ), "<dev string:x622>" + executionid );
    return level.var_e671d0cb401c31b4[ executionid ];
}

// Namespace operator
// Params 1
// Checksum 0xe6e163e3, Offset: 0x21e2
// Size: 0x43
function function_dc3356e535601e05( executionref )
{
    function_e0f57a7fe250f216();
    executionid = function_f02c63b99c9614c9( level.var_e671d0cb401c31b4, executionref );
    assert( isdefined( executionid ), "<dev string:x64d>" + executionref );
    return executionid;
}

// Namespace operator
// Params 1
// Checksum 0x8171e9bb, Offset: 0x222e
// Size: 0x34
function function_81f3e01100510bff( executionref )
{
    var_7237854e3be197ca = function_2480f61a1b8bce30( executionref ).lootid;
    
    if ( isdefined( var_7237854e3be197ca ) )
    {
        return var_7237854e3be197ca;
    }
    
    return 0;
}

// Namespace operator
// Params 1
// Checksum 0x1d3846de, Offset: 0x226b
// Size: 0x38
function function_843ab3d2e4282f00( executionref )
{
    var_7237854e3be197ca = function_2480f61a1b8bce30( executionref ).execution;
    
    if ( isdefined( var_7237854e3be197ca ) )
    {
        return var_7237854e3be197ca;
    }
    
    return "none";
}

// Namespace operator
// Params 1
// Checksum 0x5d63946f, Offset: 0x22ac
// Size: 0x38
function function_4bd4a8df3ca7ae0c( executionref )
{
    var_7237854e3be197ca = function_2480f61a1b8bce30( executionref ).propweapon;
    
    if ( isdefined( var_7237854e3be197ca ) )
    {
        return var_7237854e3be197ca;
    }
    
    return "none";
}

// Namespace operator
// Params 0
// Checksum 0xb1d970b1, Offset: 0x22ed
// Size: 0x167
function getoperatorcustomization()
{
    customization = [];
    body = undefined;
    head = undefined;
    operatorSkinRef = undefined;
    
    if ( !isdefined( self.operatorcustomization ) )
    {
        createoperatorcustomization();
    }
    
    operatorSkinRef = self.operatorcustomization.skinref;
    
    if ( isdefined( level.modegetforceoperatorcustomization ) )
    {
        operatorref = function_30f20ce375c4ee40( operatorSkinRef );
        [ operatorindex, operatorSkinRef ] = [[ level.modegetforceoperatorcustomization ]]( self, operatorref, operatorSkinRef );
    }
    
    models = function_fb2ad6ca3c6b708d( operatorSkinRef );
    
    if ( models[ 0 ] == "" || models[ 1 ] == "" || models[ 2 ] == "" )
    {
        assertmsg( "<dev string:x679>" + getxhashsourcename( operatorSkinRef ) + "<dev string:x6d1>" + getxhashsourcename( models[ 1 ] ) + "<dev string:x6df>" + getxhashsourcename( models[ 0 ] ), "<dev string:x6ed>" + getxhashsourcename( models[ 2 ] ) );
        defaultskin = function_447fce2531e40d0e( self.operatorcustomization.operatorref );
        models = function_fb2ad6ca3c6b708d( defaultskin );
    }
    
    self.bodymodelname = models[ 0 ];
    self.backuphead = models[ 1 ];
    return models;
}

// Namespace operator
// Params 2
// Checksum 0xcc657587, Offset: 0x245d
// Size: 0x484
function createoperatorcustomization( operatorref, operatorskin )
{
    if ( isbuildingmap() )
    {
        return;
    }
    
    self function_16332a7775f10aa9();
    self.operatorcustomization = undefined;
    operatorcustomization = spawnstruct();
    
    /#
        var_19dac495352462f2 = getdvar( @"hash_17a1591e3fe7c036" );
        var_bae05cfc6db1421e = getdvarint( @"hash_18d61f3fa39645ac", 0 );
        
        if ( var_19dac495352462f2 )
        {
            var_1d6c368bd4334 = strtok( var_19dac495352462f2, "<dev string:x701>" );
            operatorskin = getxhashasset( var_1d6c368bd4334[ randomint( var_1d6c368bd4334.size ) ] );
            operatorref = function_30f20ce375c4ee40( operatorskin );
        }
        else if ( var_bae05cfc6db1421e == 1 && isdefined( level.gamemodebundle.var_e8fe08e7fc3b1dd8 ) )
        {
            var_612d5293af92eac3 = level.gamemodebundle.var_e8fe08e7fc3b1dd8;
            
            if ( var_612d5293af92eac3.size > 0 )
            {
                operatorskin = getxhashasset( var_612d5293af92eac3[ randomint( var_612d5293af92eac3.size ) ].skin );
                operatorref = function_30f20ce375c4ee40( operatorskin );
            }
        }
    #/
    
    if ( !( isdefined( operatorref ) && isdefined( operatorskin ) ) )
    {
        operatorref = function_899f4c5b97e8a453();
        operatorskin = function_cc5d60d5178c5007();
    }
    
    var_3349ff2ffef57c34 = istrue( getdvarint( @"scr_loadout_validate_banned_items", 0 ) );
    
    if ( var_3349ff2ffef57c34 && loot::function_72263d7f509cd8cd( operatorskin ) )
    {
        operatorskin = function_447fce2531e40d0e( operatorref );
    }
    
    if ( var_3349ff2ffef57c34 && loot::function_72263d7f509cd8cd( operatorref ) )
    {
        operatorref = function_297589994c9a9eff( self.team == "allies" ? 0 : 1 );
        operatorskin = function_447fce2531e40d0e( operatorref );
    }
    
    operatorcustomization.operatorref = operatorref;
    operatorcustomization.skinref = operatorskin;
    operatorcustomization.var_a8d1b98ea8e4c341 = function_cb12383888078591( operatorskin );
    operatorcustomization.skinlootid = function_c203df33ce95f84c( operatorskin );
    operatorcustomization.gender = getoperatorgender( operatorref );
    operatorcustomization.voice = getoperatorvoice( operatorref );
    operatorcustomization.clothtype = function_b1788ccf1b3c0ae9( operatorskin );
    operatorcustomization.geartype = function_d633420b529828e8( operatorskin );
    operatorcustomization.superfaction = getoperatorsuperfaction( operatorref );
    operatorcustomization.execution = function_4308bc9472e8e835();
    operatorcustomization.parachute = function_e6885d5990982272();
    operatorcustomization.contrail = function_4202dbfeb87e9ddb();
    operatorcustomization.dialogset = function_bc6d8ad64545fc57( operatorref, operatorskin );
    
    if ( utility::issharedfuncdefined( #"bodysize", #"hash_db91c8d9ee604746" ) )
    {
        operatorcustomization.suit = utility::callsharedfunc( #"bodysize", #"hash_db91c8d9ee604746", operatorref );
    }
    else
    {
        operatorcustomization.suit = utility::function_f825237e0eda5adf();
    }
    
    operatorcustomization.rebuild = 0;
    self.operatorcustomization = operatorcustomization;
    customization = getoperatorcustomization();
    body = customization[ 0 ];
    head = customization[ 1 ];
    viewmodel = customization[ 2 ];
    
    if ( !isagent( self ) )
    {
        function_c8490391be6bc57e( body, head );
        var_c44293a24579c8fb = self getcustomizationbody();
        var_65385198cd46487d = self getcustomizationhead();
        var_1595237faa50b3e8 = self getcustomizationviewmodel();
    }
    
    if ( !level.projectbundle.var_672cd1b066200001 )
    {
        operatorcustomization.chroma = function_54b61a935e8d6ed2();
        self function_3c56353f6ca59558( operatorcustomization.chroma );
    }
    
    self.operatorcustomization.body = body;
    self.operatorcustomization.defaultbody = var_c44293a24579c8fb;
    self.operatorcustomization.head = head;
    self.operatorcustomization.defaulthead = var_65385198cd46487d;
    self.operatorcustomization.vm = viewmodel;
    self.operatorcustomization.defaultvm = var_1595237faa50b3e8;
    
    if ( !isagent( self ) && !isbot( self ) && !isdefined( self.vehiclecustomization ) )
    {
        self.vehiclecustomization = vehicle::create_customization();
    }
    
    function_d94a89bd1eb20033( self.operatorcustomization );
    callback::callback( #"hash_1c82c96d0d334fcc" );
}

// Namespace operator
// Params 1, eflags: 0x4
// Checksum 0x92acceac, Offset: 0x28e9
// Size: 0xe3
function private function_d94a89bd1eb20033( operatorcustomization )
{
    var_d275275b9c49f288 = getdvarint( @"hash_838359d5ebdcc7e0", 0 );
    
    if ( var_d275275b9c49f288 == 0 )
    {
        return;
    }
    
    var_e0ab867b479dae36 = getdvarint( @"hash_b77bb859108e69cd", 0 );
    var_94e77c4dc77013b7 = getdvarint( @"hash_91b801ddfb57ae8a", 0 );
    
    if ( !level.rankedmatch || !level.matchmakingmatch || !level.onlinestatsenabled )
    {
        return;
    }
    
    var_8a9fe7aa2cde3afe = [];
    
    if ( var_e0ab867b479dae36 == 1 )
    {
        var_8a9fe7aa2cde3afe[ var_8a9fe7aa2cde3afe.size ] = self.operatorcustomization.skinlootid;
    }
    
    if ( var_94e77c4dc77013b7 == 1 )
    {
        var_8a9fe7aa2cde3afe[ var_8a9fe7aa2cde3afe.size ] = loot::getlootidfromref( self.operatorcustomization.execution );
    }
    
    self function_49bdd1291f4756ca( var_8a9fe7aa2cde3afe );
}

// Namespace operator
// Params 2
// Checksum 0xec422d19, Offset: 0x29d4
// Size: 0x4c
function function_c8490391be6bc57e( body, head )
{
    if ( !self isvalidcustomization( body, head ) )
    {
        assertmsg( "<dev string:x706>" + getxhashsourcename( head ) + "<dev string:x72b>" + getxhashsourcename( body ) );
        return;
    }
    
    self setcustomization( body, head );
}

// Namespace operator
// Params 0
// Checksum 0x91ecf9c1, Offset: 0x2a28
// Size: 0x3ab
function function_99f3495eb915fb96()
{
    if ( isdefined( level.var_77fb663123a79288 ) )
    {
        return;
    }
    
    level.var_77fb663123a79288 = [];
    setdvar( @"hash_2b669ad6c3e1d864", 1 );
    
    if ( !isdefined( level.var_77fb663123a79288[ "allies" ] ) )
    {
        level.var_77fb663123a79288[ "allies" ] = [];
    }
    
    if ( !isdefined( level.var_77fb663123a79288[ "axis" ] ) )
    {
        level.var_77fb663123a79288[ "axis" ] = [];
    }
    
    operatorrefs = function_91f90d6f14a0f260();
    var_c14f2aed1868e9bc = getdvarint( @"hash_88e9180e81267df2", 0 );
    
    foreach ( operatorref in operatorrefs )
    {
        if ( !isdefined( operatorref ) || operatorref == %"" )
        {
            continue;
        }
        
        unlocked = isoperatorunlocked( operatorref );
        
        if ( !unlocked && !var_c14f2aed1868e9bc )
        {
            continue;
        }
        
        if ( !function_2b34573c920ee585( operatorref ) && !var_c14f2aed1868e9bc )
        {
            continue;
        }
        
        superfaction = getoperatorsuperfaction( operatorref );
        team = superfaction == 0 ? "allies" : "axis";
        level.var_77fb663123a79288[ team ][ operatorref ] = [];
    }
    
    skinRefs = function_27f5412663e0a09();
    
    foreach ( skinref in skinRefs )
    {
        if ( !skinref )
        {
            continue;
        }
        
        if ( !function_faa5d37f28e6d925( skinref ) )
        {
            continue;
        }
        
        if ( !function_6261fa1bcd3ce668( skinref ) )
        {
            continue;
        }
        
        operatorref = function_30f20ce375c4ee40( skinref );
        superfaction = getoperatorsuperfaction( operatorref );
        team = superfaction == 0 ? "allies" : "axis";
        
        if ( !level.var_77fb663123a79288[ team ][ operatorref ] )
        {
            continue;
        }
        
        level.var_77fb663123a79288[ team ][ operatorref ][ level.var_77fb663123a79288[ team ][ operatorref ].size ] = skinref;
    }
    
    teams = [];
    teams = [ "allies", "axis" ];
    
    foreach ( team in teams )
    {
        newarray = [];
        
        foreach ( key, entry in level.var_77fb663123a79288[ team ] )
        {
            if ( entry.size > 0 )
            {
                newarray[ key ] = entry;
            }
        }
        
        level.var_77fb663123a79288[ team ] = newarray;
    }
}

// Namespace operator
// Params 0
// Checksum 0x145ea7c7, Offset: 0x2ddb
// Size: 0x5d, Type: bool
function function_4d6b18d1d4da29bd()
{
    if ( level.multiteambased || !level.teambased )
    {
        return true;
    }
    
    if ( isdefined( level.gametypebundle ) )
    {
        if ( level.gametypebundle.teambased == 1 )
        {
            return ( level.gametypebundle.var_4b6318add901104c == 1 );
        }
    }
    
    return false;
}

// Namespace operator
// Params 0
// Checksum 0xb39e9538, Offset: 0x2e41
// Size: 0x70
function function_2d5c14a8c98cf89d()
{
    assert( isplayer( self ) );
    var_a3559c3721faf851 = self.team == "allies" ? 0 : 1;
    
    if ( function_4d6b18d1d4da29bd() && !level.projectbundle.var_786bc1b37b3f67fa )
    {
        var_a3559c3721faf851 = self getplayerdata( level.loadoutsgroup, "customizationSetup", "selectedOperatorIndex" );
    }
    
    return var_a3559c3721faf851;
}

// Namespace operator
// Params 1
// Checksum 0x23c4143f, Offset: 0x2eba
// Size: 0xec
function function_ce41b4b58036e41c( var_a3559c3721faf851 )
{
    assert( isdefined( self ) );
    assert( isplayer( self ) );
    assert( var_a3559c3721faf851 == 0 || var_a3559c3721faf851 == 1 );
    operatorlootid = 0;
    
    if ( function_fce13d709d67dd26() )
    {
        operatorref = self getplayerdata( level.loadoutsgroup, "customizations", "operators", var_a3559c3721faf851, "operatorRef" );
        operatorlootid = loot::getlootidfromref( operatorref );
    }
    else if ( function_c79f6a12d91ad551() )
    {
        operatorlootid = self getplayerdata( level.loadoutsgroup, "customizationSetup", "selectedOperator", var_a3559c3721faf851, "operatorLootId" );
    }
    else
    {
        operatorref = self getplayerdata( level.loadoutsgroup, "customizationSetup", "operators", var_a3559c3721faf851 );
        operatorlootid = loot::getlootidfromref( operatorref );
    }
    
    if ( loot::function_52cf8374c44a4ff5( operatorlootid ) == "operator" )
    {
        return operatorlootid;
    }
    
    return 0;
}

// Namespace operator
// Params 1
// Checksum 0xe629a258, Offset: 0x2faf
// Size: 0xdb
function function_dc48b1d8163a5d60( var_a3559c3721faf851 )
{
    assert( isdefined( self ) );
    assert( isplayer( self ) );
    assert( var_a3559c3721faf851 == 0 || var_a3559c3721faf851 == 1 );
    defaultoperatorteam = function_1e32019139bf7206();
    
    if ( getdvarint( @"hash_9377281fd8d98b6e", 0 ) == 1 || self.pers[ "forceDefaultLoadouts" ] )
    {
        return level.defaultoperator[ defaultoperatorteam ];
    }
    
    operatorlootid = function_ce41b4b58036e41c( var_a3559c3721faf851 );
    
    if ( operatorlootid != 0 )
    {
        ref = loot::function_f54ecb89dfab8e8c( operatorlootid );
        
        if ( isdefined( ref ) )
        {
            operatorref = getxhashasset( ref );
        }
    }
    
    if ( !function_fb3ad5cd3a9ae76b( operatorref ) )
    {
        operatorref = level.defaultoperator[ defaultoperatorteam ];
    }
    
    return operatorref;
}

// Namespace operator
// Params 1
// Checksum 0xc4cbf63a, Offset: 0x3093
// Size: 0x33a
function function_88393e18041634ac( superfaction )
{
    assert( isai( self ) || self isplayerheadless() );
    function_99f3495eb915fb96();
    operatorref = "";
    
    if ( isdefined( self.botoperatorref ) )
    {
        return self.botoperatorref;
    }
    
    var_6e8217c1a6d26f54 = getdvar( @"hash_803cefdbe23f6bfe", "" );
    var_8e142dbf8e355048 = getdvar( @"hash_536fb96e928e1c53", "" );
    
    if ( var_6e8217c1a6d26f54 != "" )
    {
        var_1d6c368bd4334 = strtok( var_6e8217c1a6d26f54, "," );
        var_a011809dacf9838f = getxhashasset( var_1d6c368bd4334[ randomint( var_1d6c368bd4334.size ) ] );
        var_2006406403e406f8 = function_30f20ce375c4ee40( var_a011809dacf9838f );
        
        if ( function_fb3ad5cd3a9ae76b( var_2006406403e406f8 ) )
        {
            self.botoperatorref = var_2006406403e406f8;
            self.var_a011809dacf9838f = var_a011809dacf9838f;
            return self.botoperatorref;
        }
    }
    else if ( var_8e142dbf8e355048 != "" )
    {
        assert( level.botloadouts );
        assert( level.botloadouts.var_7bfac80ced088018.size > 0 );
        skinoverride = utility::array_random( level.botloadouts.var_7bfac80ced088018 );
        var_a011809dacf9838f = getxhashasset( skinoverride );
        var_2006406403e406f8 = function_30f20ce375c4ee40( var_a011809dacf9838f );
        
        if ( function_fb3ad5cd3a9ae76b( var_2006406403e406f8 ) )
        {
            self.botoperatorref = var_2006406403e406f8;
            self.var_a011809dacf9838f = var_a011809dacf9838f;
            return self.botoperatorref;
        }
    }
    
    if ( !isdefined( self.pers[ "operatorTeam" ] ) )
    {
        team = self.team;
        
        if ( isdefined( superfaction ) )
        {
            team = superfaction == 0 ? "allies" : "axis";
        }
        else
        {
            assert( isdefined( team ) );
        }
        
        if ( !isdefined( level.var_77fb663123a79288[ team ] ) )
        {
            var_1bfdfe698f07f365 = getarraykeys( level.var_77fb663123a79288 );
            self.pers[ "operatorTeam" ] = utility::random( var_1bfdfe698f07f365 );
        }
        else
        {
            self.pers[ "operatorTeam" ] = team;
        }
    }
    
    if ( !isdefined( self.pers[ "operatorIndex" ] ) )
    {
        self.pers[ "operatorIndex" ] = randomint( level.var_77fb663123a79288[ self.pers[ "operatorTeam" ] ].size );
    }
    
    currentindex = 0;
    
    foreach ( operatorkey, var_b606fe8bb5fd950 in level.var_77fb663123a79288[ self.pers[ "operatorTeam" ] ] )
    {
        if ( currentindex == self.pers[ "operatorIndex" ] )
        {
            self.botoperatorref = operatorkey;
            break;
        }
        
        currentindex++;
    }
    
    return self.botoperatorref;
}

// Namespace operator
// Params 0
// Checksum 0x99ad4fd6, Offset: 0x33d6
// Size: 0x2a
function function_1e32019139bf7206()
{
    var_a3559c3721faf851 = function_2d5c14a8c98cf89d();
    
    if ( var_a3559c3721faf851 == 0 )
    {
        return "allies";
    }
    
    return "axis";
}

// Namespace operator
// Params 1
// Checksum 0x3df9e1b8, Offset: 0x3408
// Size: 0xf4
function function_899f4c5b97e8a453( superfaction )
{
    if ( !isplayer( self ) && !isai( self ) )
    {
        assert( 0, "<dev string:x738>" );
        return "";
    }
    
    if ( isdefined( self.operatorcustomization ) && isdefined( self.operatorcustomization.operatorref ) )
    {
        return self.operatorcustomization.operatorref;
    }
    
    operatorref = undefined;
    
    if ( isai( self ) || self isplayerheadless() )
    {
        return function_88393e18041634ac( superfaction );
    }
    else
    {
        operatorlootid = utility::callsharedfunc( #"instanceInventory", #"getActiveOperatorLootID", self );
        
        if ( isdefined( operatorlootid ) && operatorlootid != 0 )
        {
            operatorref = getxhashasset( loot::function_f54ecb89dfab8e8c( operatorlootid ) );
        }
        else
        {
            var_a3559c3721faf851 = function_2d5c14a8c98cf89d();
            operatorref = function_dc48b1d8163a5d60( var_a3559c3721faf851 );
        }
    }
    
    return operatorref;
}

// Namespace operator
// Params 1, eflags: 0x4
// Checksum 0x9e00a44e, Offset: 0x3505
// Size: 0x123
function private function_4c56ad6bdf59f32d( superfaction )
{
    assert( isdefined( self ) );
    assert( isplayer( self ) );
    assert( superfaction == 0 || superfaction == 1 );
    
    if ( self.pers[ "forceDefaultLoadouts" ] )
    {
        return 0;
    }
    
    operatorskinlootid = 0;
    
    if ( function_fce13d709d67dd26() )
    {
        operatorSkinRef = self getplayerdata( level.loadoutsgroup, "customizations", "operators", superfaction, "skinRef" );
        operatorskinlootid = loot::getlootidfromref( operatorSkinRef );
    }
    else if ( function_c79f6a12d91ad551() )
    {
        operatorskinlootid = self getplayerdata( level.loadoutsgroup, "customizationSetup", "selectedOperator", superfaction, "skinLootId" );
    }
    else
    {
        operatorref = function_dc48b1d8163a5d60( superfaction );
        
        if ( operatorref && function_fb3ad5cd3a9ae76b( operatorref ) )
        {
            operatorSkinRef = self getplayerdata( level.loadoutsgroup, "customizationSetup", "operatorCustomization", operatorref, "skin" );
            operatorskinlootid = loot::getlootidfromref( operatorSkinRef );
        }
    }
    
    if ( !function_10ad0df66b5a20a7( operatorskinlootid ) )
    {
        return 0;
    }
    
    return operatorskinlootid;
}

// Namespace operator
// Params 1
// Checksum 0xd6445c51, Offset: 0x3631
// Size: 0x1b0
function function_cc5d60d5178c5007( superfaction )
{
    assert( isplayer( self ) );
    
    if ( !isplayer( self ) )
    {
        return "";
    }
    
    if ( isdefined( self.operatorcustomization.skinref ) )
    {
        return self.operatorcustomization.skinref;
    }
    
    skinref = "";
    
    if ( !isagent( self ) )
    {
        lootid = utility::callsharedfunc( #"instanceInventory", #"getActiveOperatorSkinLootID", self );
        
        if ( isdefined( lootid ) && lootid != 0 )
        {
            return getxhashasset( loot::function_f54ecb89dfab8e8c( lootid ) );
        }
    }
    
    if ( isbot( self ) || self isplayerheadless() )
    {
        operatorref = function_899f4c5b97e8a453( superfaction );
        
        if ( isdefined( self.var_a011809dacf9838f ) )
        {
            return self.var_a011809dacf9838f;
        }
        
        if ( !isdefined( level.var_77fb663123a79288 ) )
        {
            function_99f3495eb915fb96();
        }
        
        team = self.pers[ "operatorTeam" ] ?? self.team;
        randomindex = randomint( level.var_77fb663123a79288[ team ][ operatorref ].size );
        return level.var_77fb663123a79288[ team ][ operatorref ][ randomindex ];
    }
    
    superfaction = function_2d5c14a8c98cf89d();
    operatorskinlootid = function_4c56ad6bdf59f32d( superfaction );
    lootref = loot::function_f54ecb89dfab8e8c( operatorskinlootid );
    
    if ( lootref )
    {
        skinref = getxhashasset( lootref );
    }
    
    if ( !isdefined( skinref ) || skinref == %"" )
    {
        operatorref = function_899f4c5b97e8a453();
        return function_447fce2531e40d0e( operatorref );
    }
    
    return skinref;
}

// Namespace operator
// Params 0
// Checksum 0x7c186c72, Offset: 0x37ea
// Size: 0x9
function function_d24f366ea9117af1()
{
    return function_cc5d60d5178c5007( 0 );
}

// Namespace operator
// Params 0
// Checksum 0x97e312e4, Offset: 0x37fc
// Size: 0xa
function function_ef2efa78a5ae293f()
{
    return function_cc5d60d5178c5007( 1 );
}

// Namespace operator
// Params 1, eflags: 0x4
// Checksum 0x15254a31, Offset: 0x380f
// Size: 0xd6
function private function_11ab18dc0f9b6e54( var_a3559c3721faf851 )
{
    assert( isdefined( self ) );
    assert( isplayer( self ) );
    
    if ( self.pers[ "forceDefaultLoadouts" ] )
    {
        return 0;
    }
    
    if ( !isdefined( var_a3559c3721faf851 ) )
    {
        var_a3559c3721faf851 = function_2d5c14a8c98cf89d();
    }
    
    if ( function_c79f6a12d91ad551() )
    {
        executionlootid = self getplayerdata( level.loadoutsgroup, "customizationSetup", "selectedOperator", var_a3559c3721faf851, "executionLootId" );
    }
    else
    {
        operatorref = function_dc48b1d8163a5d60( var_a3559c3721faf851 );
        
        if ( operatorref && function_fb3ad5cd3a9ae76b( operatorref ) )
        {
            executionlootid = self getplayerdata( level.loadoutsgroup, "customizationSetup", "operatorCustomization", operatorref, "execution" );
        }
    }
    
    if ( loot::function_52cf8374c44a4ff5( executionlootid ) != "executions" )
    {
        return 0;
    }
    
    return executionlootid;
}

// Namespace operator
// Params 0
// Checksum 0x36eee59f, Offset: 0x38ee
// Size: 0x121
function function_4308bc9472e8e835()
{
    assert( isplayer( self ) );
    
    if ( !isplayer( self ) )
    {
        return "";
    }
    
    operatorref = function_899f4c5b97e8a453();
    executionlootid = 0;
    
    if ( !isagent( self ) )
    {
        executionlootid = utility::callsharedfunc( #"instanceInventory", #"getActiveOperatorExecutionLootID", self ) ?? 0;
        
        if ( executionlootid == 0 )
        {
            executionlootid = function_11ab18dc0f9b6e54();
        }
    }
    
    if ( isdefined( executionlootid ) && executionlootid != 0 )
    {
        var_795640b75d113220 = loot::function_f54ecb89dfab8e8c( executionlootid );
        
        if ( isexecutionvalid( var_795640b75d113220 ) )
        {
            return var_795640b75d113220;
        }
        
        assertmsg( "<dev string:x76b>" + var_795640b75d113220 + "<dev string:x794>" );
    }
    
    var_83d21bf52ce92f15 = getdvar( @"hash_57210a2c6c50497b" );
    
    if ( isexecutionvalid( var_83d21bf52ce92f15 ) )
    {
        return var_83d21bf52ce92f15;
    }
    
    var_b9390f534fcde91c = function_db4f41253b282a4f( operatorref );
    
    if ( isexecutionvalid( var_b9390f534fcde91c ) )
    {
        return var_b9390f534fcde91c;
    }
    
    var_3e9e7a054da76197 = function_10f49a11ea83fafe();
    
    if ( isexecutionvalid( var_3e9e7a054da76197 ) )
    {
        return var_3e9e7a054da76197;
    }
    
    return "";
}

// Namespace operator
// Params 0
// Checksum 0x17e9004c, Offset: 0x3a18
// Size: 0x8b
function function_54b61a935e8d6ed2()
{
    if ( !isagent( self ) )
    {
        if ( function_c79f6a12d91ad551() )
        {
            return getxhashasset( "none" );
        }
        else
        {
            operatorref = function_899f4c5b97e8a453();
            
            if ( !self hasplayerdata( level.loadoutsgroup, "customizationSetup", "operatorCustomization", operatorref, "chroma" ) )
            {
                return getxhashasset( "none" );
            }
            
            var_57322adc28d49c77 = self getplayerdata( level.loadoutsgroup, "customizationSetup", "operatorCustomization", operatorref, "chroma" );
        }
    }
    
    return var_57322adc28d49c77;
}

// Namespace operator
// Params 0
// Checksum 0x5f060388, Offset: 0x3aac
// Size: 0x20
function function_f88d52fd5e48c60a()
{
    var_805ecfacf843aea7 = function_54b61a935e8d6ed2();
    return getxhashasset( loot::function_f54ecb89dfab8e8c( var_805ecfacf843aea7 ) );
}

// Namespace operator
// Params 0
// Checksum 0x2fe3dbd0, Offset: 0x3ad5
// Size: 0x42
function function_e6885d5990982272()
{
    parachutelootid = self getplayerdata( "common", "commonCustomization", "parachute" );
    parachuteref = loot::function_f54ecb89dfab8e8c( parachutelootid );
    
    if ( !parachuteref )
    {
        return undefined;
    }
    
    return getxhashasset( parachuteref );
}

// Namespace operator
// Params 0
// Checksum 0x39d44f69, Offset: 0x3b20
// Size: 0x42
function function_4202dbfeb87e9ddb()
{
    contraillootid = self getplayerdata( "common", "commonCustomization", "contrail" );
    contrailref = loot::function_f54ecb89dfab8e8c( contraillootid );
    
    if ( !contrailref )
    {
        return undefined;
    }
    
    return getxhashasset( contrailref );
}

// Namespace operator
// Params 0
// Checksum 0xbee3feb4, Offset: 0x3b6b
// Size: 0xab
function function_b518cf4ab4b71ede()
{
    /#
        if ( getdvarint( @"hash_4753586a2ac8718f", 0 ) == 0 )
        {
            println( "<dev string:x7d0>" + "<dev string:x80f>" );
            return;
        }
    #/
    
    headsize = 1;
    head = self.operatorcustomization.head;
    var_5b99f965fcb3c896 = head[ head.size - 1 ];
    
    switch ( var_5b99f965fcb3c896 )
    {
        case #"hash_31103fbc01bd840c":
            headsize = 1;
            break;
        case #"hash_311042bc01bd88c5":
            headsize = 2;
            break;
        case #"hash_311041bc01bd8732":
            headsize = 3;
            break;
    }
    
    return headsize;
}

// Namespace operator
// Params 0
// Checksum 0x91acbbcf, Offset: 0x3c1f
// Size: 0x29, Type: bool
function isfemale()
{
    return isdefined( self.operatorcustomization ) && self.operatorcustomization.gender == "female";
}

// Namespace operator
// Params 0, eflags: 0x4
// Checksum 0x36800cb0, Offset: 0x3c51
// Size: 0xf6
function private function_17f449ac974622de()
{
    result = "";
    
    if ( isdefined( self.operatorcustomization.operatorref ) )
    {
        operatorbundle = getoperatorbundle( self.operatorcustomization.operatorref, [ #"gendersoundcontext" ] );
        result = operatorbundle.gendersoundcontext ?? result;
    }
    
    if ( isdefined( self.operatorcustomization.skinref ) )
    {
        var_7a924103a375a9fb = function_d1e10cddb12fbe17( self.operatorcustomization.skinref, [ #"hash_b05b686f13e4736e", #"gendersoundcontext" ] );
        
        if ( var_7a924103a375a9fb.var_866e482772f02fe1 )
        {
            result = var_7a924103a375a9fb.gendersoundcontext ?? result;
        }
    }
    
    if ( result == "male" )
    {
        result = "";
    }
    
    return result;
}

// Namespace operator
// Params 0
// Checksum 0xaafff375, Offset: 0x3d50
// Size: 0x42
function setgendersoundcontext()
{
    if ( getdvarint( @"hash_42eedfce002ae468", 1 ) )
    {
        self function_92b2c5eabba31eb0( 0 );
        return;
    }
    
    self function_dbb6f7adbaeb1040( "" );
    
    if ( isdefined( self.operatorcustomization ) )
    {
        self function_dbb6f7adbaeb1040( function_17f449ac974622de() );
    }
}

// Namespace operator
// Params 0
// Checksum 0x38abdfe7, Offset: 0x3d9a
// Size: 0x41
function function_89e5e91ee0fb0836()
{
    if ( getdvarint( @"hash_42eedfce002ae468", 1 ) )
    {
        self function_92b2c5eabba31eb0( 1 );
        return;
    }
    
    if ( isfemale() )
    {
        self function_dbb6f7adbaeb1040( "gasmask_female" );
        return;
    }
    
    self function_dbb6f7adbaeb1040( "gasmask_male" );
}

