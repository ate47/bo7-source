#using script_4f9ce8d249a99f4a;
#using script_734dce84c468439b;
#using scripts\common\callbacks;
#using scripts\common\throttle;
#using scripts\common\utility;
#using scripts\common\weapon;
#using scripts\mp\ammorestock;
#using scripts\mp\armor;
#using scripts\mp\damagefeedback;
#using scripts\mp\equipment;
#using scripts\mp\hud_message;
#using scripts\mp\loot\common_item;
#using scripts\mp\loot\common_item_ammo;

#namespace ammopouch;

// Namespace ammopouch
// Params 0
// Checksum 0xa0708b32, Offset: 0x28c
// Size: 0x2f4
function init_ammopouch()
{
    if ( isdefined( level.var_c29d903007598945 ) )
    {
        return;
    }
    
    ammopouchbundle = getscriptbundle( "ammopouch:ob_ammopouch_sat_ob" );
    
    if ( !isdefined( ammopouchbundle ) )
    {
        ammopouchbundle = spawnstruct();
    }
    
    if ( !isdefined( ammopouchbundle.var_4ab877bbd93ce488 ) )
    {
        ammopouchbundle.var_4ab877bbd93ce488 = 0;
    }
    
    if ( !isdefined( ammopouchbundle.var_f953adc14f7f8d55 ) )
    {
        ammopouchbundle.var_f953adc14f7f8d55 = 0;
    }
    
    if ( !isdefined( ammopouchbundle.var_349245f662457238 ) )
    {
        ammopouchbundle.var_349245f662457238 = 0;
    }
    
    if ( !isdefined( ammopouchbundle.var_fa8630d5f67bc53c ) )
    {
        ammopouchbundle.var_fa8630d5f67bc53c = 0;
    }
    
    if ( !isdefined( ammopouchbundle.despawntime ) )
    {
        ammopouchbundle.despawntime = 0;
    }
    
    if ( !isdefined( ammopouchbundle.var_6927abae739b791c ) )
    {
        ammopouchbundle.var_6927abae739b791c = 0;
    }
    
    if ( !isdefined( ammopouchbundle.var_8623b5e4b5cd5d3b ) )
    {
        ammopouchbundle.var_8623b5e4b5cd5d3b = 0;
    }
    
    level callback::add( "on_zombie_ai_killed", &on_zombie_ai_killed );
    level callback::add( #"on_ai_killed", &function_2be36dfdd05dbb47 );
    level.var_c29d903007598945 = spawnstruct();
    level.var_c29d903007598945.ammopouchitem = ammopouchbundle.ammopouchitem;
    level.var_c29d903007598945.var_4ab877bbd93ce488 = ammopouchbundle.var_4ab877bbd93ce488;
    level.var_c29d903007598945.var_f953adc14f7f8d55 = ammopouchbundle.var_f953adc14f7f8d55;
    level.var_c29d903007598945.var_349245f662457238 = ammopouchbundle.var_349245f662457238;
    level.var_c29d903007598945.var_fa8630d5f67bc53c = ammopouchbundle.var_fa8630d5f67bc53c;
    level.var_c29d903007598945.despawntime = ammopouchbundle.despawntime;
    level.var_c29d903007598945.var_6927abae739b791c = ammopouchbundle.var_6927abae739b791c;
    level.var_c29d903007598945.var_8623b5e4b5cd5d3b = ammopouchbundle.var_8623b5e4b5cd5d3b;
    level.var_c29d903007598945.var_b3b6a3295277efb1 = ammopouchbundle.var_b3b6a3295277efb1;
    level.var_c29d903007598945.var_8be5c57519ba97a4 = ammopouchbundle.var_8be5c57519ba97a4;
    level.var_c29d903007598945.lootid = common_item::function_779887309ec71dfe( getscriptbundle( "itemspawnentry:ob_sat_item_ammo" ) );
    level.ammopouch_drop_throttle = throttle::throttle_initialize( "ammopouch_drop", 1, level.framedurationseconds );
    utility::registersharedfunc( #"ammo_item", #"can_refill_ammo", &canpickupammopouch );
    utility::registersharedfunc( #"ammo_item", #"refill_ammo", &pickupammopouch );
    utility::registersharedfunc( #"gamemode", #"ammorestockused", &ammorestockused );
}

// Namespace ammopouch
// Params 0
// Checksum 0xcb61cfd2, Offset: 0x588
// Size: 0x76
function init_ammopouch_item()
{
    common_item::function_4b30c091d3b04a25( "ammo" );
    common_item::function_84174b793b5fe9a7( "ammo", #"use", &pickupammopouch );
    common_item::function_84174b793b5fe9a7( "ammo", #"canautouse", &canpickupammopouch );
    common_item::function_84174b793b5fe9a7( "ammo", #"canuse", &canpickupammopouch );
    common_item::function_84174b793b5fe9a7( "ammo", #"database_additem", &item_ammo::function_87d214afcb21b724 );
}

// Namespace ammopouch
// Params 6
// Checksum 0x15616c4b, Offset: 0x606
// Size: 0xbc
function ammorestockused( instance, part, state, player, bautouse, usestring )
{
    assert( issubstr( part, "<dev string:x24>" ) );
    result = ammorestock( player, instance );
    
    if ( result == 1 )
    {
        thread ammorestock::ammorestock_disableusefortime( instance, player, 0.1 );
        thread ammorestock::function_2c7ced6e527ed331( player, instance, getdvarint( @"ammorestockcooldown", 20 ) );
        return;
    }
    
    if ( result == 0 )
    {
        thread ammorestock::ammorestock_disableusefortime( instance, player, 0.1 );
        return;
    }
    
    thread ammorestock::ammorestock_disableusefortime( instance, player, 0.1 );
}

// Namespace ammopouch
// Params 2, eflags: 0x4
// Checksum 0xe18884ad, Offset: 0x6ca
// Size: 0x262
function private ammorestock( player, instance )
{
    player endon( #"death_or_disconnect" );
    guid = player player::getuniqueid();
    
    if ( !isdefined( level.var_c95a4556478f1db8[ guid ] ) )
    {
        level.var_c95a4556478f1db8[ guid ] = [];
    }
    
    if ( level.var_c95a4556478f1db8[ guid ][ instance.index ] )
    {
        player hud_message::showerrormessage( %"mp_ingame_only/ammo_restock_on_cooldown", int( ( level.var_c95a4556478f1db8[ guid ][ instance.index ] - gettime() ) / 1000 ) );
        player playlocalsound( "fly_pickup_deny" );
        return 2;
    }
    
    var_d1f84487d38a5d5b = 0;
    
    if ( isusingmatchrulesdata() )
    {
        var_d1f84487d38a5d5b = getdvarint( @"ammorestockmaxequipment", getmatchrulesdata( "commonOption", "ammoRestockMaxEquipment" ) );
    }
    
    var_14ead2f28e138726 = player function_14ead2f28e138726();
    var_1ea7282f498205a0 = var_d1f84487d38a5d5b && player equipment_mp::function_1ea7282f498205a0();
    var_b343432f7bbf6d5f = !player armor::function_917d57b2f6b9d879();
    
    if ( !var_14ead2f28e138726 && !var_b343432f7bbf6d5f && !var_1ea7282f498205a0 )
    {
        player hud_message::showerrormessage( %"mp_ingame_only/ammo_restock_stock_full" );
        player playlocalsound( "fly_pickup_deny" );
        return 0;
    }
    
    var_4c48fad50fa1fc28 = [];
    
    if ( var_b343432f7bbf6d5f )
    {
        armorpickup = player function_94d6e6933b497cec();
        
        if ( var_14ead2f28e138726 )
        {
            var_4c48fad50fa1fc28[ var_4c48fad50fa1fc28.size ] = { #count:1, #ref:"brloot_ammo_ob_sat" };
        }
        else
        {
            var_4c48fad50fa1fc28[ var_4c48fad50fa1fc28.size ] = armorpickup;
        }
    }
    
    if ( var_14ead2f28e138726 )
    {
        var_52226a7f0df824f5 = 0;
        
        if ( isusingmatchrulesdata() )
        {
            var_52226a7f0df824f5 = getdvarint( @"hash_ffdcf3aa9cb235fe", getmatchrulesdata( "commonOption", "ammoRestockMaxAmmo" ) );
        }
        
        ammopickups = player refillammo( var_52226a7f0df824f5 );
    }
    
    if ( var_1ea7282f498205a0 )
    {
        equipmentpickups = player equipment_mp::function_45c3c3f7df352e9f();
        var_4c48fad50fa1fc28 = arraycombine( var_4c48fad50fa1fc28, equipmentpickups );
    }
    
    player damagefeedback::hudicontype( "br_ammo" );
    
    if ( utility::issharedfuncdefined( #"game", #"showstocklootfeed" ) )
    {
        level thread [[ utility::getsharedfunc( #"game", #"showstocklootfeed" ) ]]( player, var_4c48fad50fa1fc28 );
    }
    
    player playlocalsound( "fly_pickup_ammo_gen" );
    return 1;
}

// Namespace ammopouch
// Params 0, eflags: 0x4
// Checksum 0xa36d8b4a, Offset: 0x935
// Size: 0xfa
function private function_5ef2eb1bb4dacb37()
{
    var_41dcb4a8e7461a0b = 0;
    
    if ( isusingmatchrulesdata() )
    {
        var_41dcb4a8e7461a0b = getdvarint( @"ammorestockallowsuperweapons", getmatchrulesdata( "commonOption", "ammoRestockAllowSuperWeapons" ) );
    }
    
    var_f3f1ae1911b3c3c6 = self.primaryinventory;
    temparray = [];
    
    foreach ( item in var_f3f1ae1911b3c3c6 )
    {
        if ( !weapon::ismeleeonly( item ) && ( var_41dcb4a8e7461a0b || !weapon::issuperweapon( item ) ) && !weapon::iskillstreakweapon( item ) && !weapon::isgamemodeweapon( item ) )
        {
            temparray[ temparray.size ] = item;
        }
    }
    
    return temparray;
}

// Namespace ammopouch
// Params 0, eflags: 0x4
// Checksum 0x10e8c37c, Offset: 0xa38
// Size: 0x78
function private function_94d6e6933b497cec()
{
    platecount = armor::function_22290101992e4874();
    platemax = armor::function_db9ebf086f67fe92();
    
    if ( platecount >= platemax )
    {
        return;
    }
    
    var_f7c4220e45e080f5 = platemax - platecount;
    armor::function_164c824617d7e8d7( var_f7c4220e45e080f5 );
    armor::function_df9c3f3288ff004f( var_f7c4220e45e080f5 );
    fakepickup = {};
    fakepickup.count = var_f7c4220e45e080f5;
    fakepickup.ref = "equip_armorplate";
    return fakepickup;
}

// Namespace ammopouch
// Params 0, eflags: 0x4
// Checksum 0xb3b7ee63, Offset: 0xab9
// Size: 0xff, Type: bool
function private function_14ead2f28e138726()
{
    var_f3f1ae1911b3c3c6 = function_5ef2eb1bb4dacb37();
    
    foreach ( weaponobj in var_f3f1ae1911b3c3c6 )
    {
        if ( weapon::isaxeweapon( weaponobj ) )
        {
            if ( self getweaponammoclip( weaponobj ) < weaponclipsize( weaponobj ) )
            {
                continue;
            }
        }
        
        if ( self getweaponammostock( weaponobj ) < weaponmaxammo( weaponobj ) )
        {
            return true;
        }
        
        if ( weaponobj.hasalternate )
        {
            weaponaltobj = weaponobj getaltweapon();
            
            if ( self getweaponammostock( weaponaltobj ) < weaponmaxammo( weaponaltobj ) )
            {
                return true;
            }
        }
        
        if ( level.var_27a577c921d994b1 && weaponobj.reloaddisabled )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace ammopouch
// Params 1
// Checksum 0xa2024120, Offset: 0xbc1
// Size: 0x49
function on_zombie_ai_killed( sparams )
{
    if ( isplayer( sparams.eattacker ) && !self.var_a13bed1ac47e1b2c )
    {
        function_42269be08d49e701( sparams.smeansofdeath, sparams.eattacker );
    }
}

// Namespace ammopouch
// Params 1
// Checksum 0x78cd7b84, Offset: 0xc12
// Size: 0x73
function function_2be36dfdd05dbb47( sparams )
{
    if ( isplayer( sparams.eattacker ) && self.death_source != "despawn" )
    {
        if ( self.unittype == "soldier" || self.unittype == "juggernaut" )
        {
            function_42269be08d49e701( sparams.smeansofdeath, sparams.eattacker );
        }
    }
}

// Namespace ammopouch
// Params 2
// Checksum 0x2cee0c9a, Offset: 0xc8d
// Size: 0x382
function function_42269be08d49e701( smeansofdeath, eattacker )
{
    if ( self.var_a13bed1ac47e1b2c || self.b_in_spawn_closet || !getdvarint( @"ob_loot_drops", 1 ) )
    {
        return;
    }
    
    if ( !isdefined( level.var_c29d903007598945.ammopouchitem ) )
    {
        return;
    }
    
    unittype = self.unittype ?? "default";
    origin = self.origin;
    angles = self.angles;
    drop_event = spawnstruct();
    throttle::throttle_wait_in_queue( level.ammopouch_drop_throttle, drop_event );
    percent_data = { #var_ddc04754c8c96d14:level.var_c29d903007598945.var_349245f662457238, #var_3b40d48b1fb3042e:level.var_c29d903007598945.var_f953adc14f7f8d55, #var_523f42d5076356fa:level.var_c29d903007598945.var_4ab877bbd93ce488, #soldierdeath:level.var_c29d903007598945.var_b3b6a3295277efb1, #execution:level.var_c29d903007598945.var_fa8630d5f67bc53c, #soldierexecution:level.var_c29d903007598945.var_8be5c57519ba97a4 };
    eattacker callback::callback( #"hash_e62e1bb16840185b", percent_data );
    percentchancedrop = 0;
    
    if ( smeansofdeath == "MOD_EXECUTION" )
    {
        if ( unittype == "soldier" )
        {
            percentchancedrop = percent_data.soldierexecution;
        }
        else
        {
            percentchancedrop = percent_data.execution;
        }
    }
    else
    {
        regiondifficulty = "difficulty_easy";
        
        if ( isfunction( level.var_bb131187d6741752 ) )
        {
            regiondifficulty = [[ level.var_bb131187d6741752 ]]( origin ) ?? "difficulty_easy";
        }
        
        if ( unittype == "soldier" )
        {
            percentchancedrop = percent_data.soldierdeath;
        }
        else
        {
            percentchancedrop = percent_data.var_523f42d5076356fa;
            
            if ( regiondifficulty == "difficulty_normal" )
            {
                percentchancedrop = percent_data.var_3b40d48b1fb3042e;
            }
            else if ( regiondifficulty == "difficulty_hard" || regiondifficulty == "difficulty_darkaether" || regiondifficulty == "difficulty5" || regiondifficulty == "difficulty6" )
            {
                percentchancedrop = percent_data.var_ddc04754c8c96d14;
            }
        }
        
        if ( regiondifficulty )
        {
            dvarvalue = getdvarint( hashcat( @"hash_a8d91c7cdcddba93", unittype, "__", regiondifficulty ), percentchancedrop );
            percentchancedrop = max( percentchancedrop, dvarvalue );
        }
    }
    
    if ( getdvarint( @"scr_ammopouch_force_drop", 0 ) )
    {
        percentchancedrop = 100;
    }
    
    if ( utility::percent_chance( percentchancedrop ) )
    {
        itembundle = getscriptbundle( "itemspawnentry:" + level.var_c29d903007598945.ammopouchitem );
        spawnoptions = common_item::items_initspawnoptions_spawnfromposition( origin );
        spawnoptions.spawningent = self;
        item = common_item::function_61c2c0251e742ffd( itembundle, 1, spawnoptions );
        params = { #itemname:level.var_c29d903007598945.ammopouchitem, #itembundle:itembundle, #item:item, #eattacker:eattacker };
        callback::callback( "on_ammo_pouch_drop", params );
    }
}

// Namespace ammopouch
// Params 4
// Checksum 0xee4001b4, Offset: 0x1017
// Size: 0x5e, Type: bool
function canpickupammopouch( item_def, item, auto_pickup, var_a0f59cb55797bb59 )
{
    if ( !isplayer( self ) )
    {
        return false;
    }
    
    if ( function_14ead2f28e138726() )
    {
        return true;
    }
    
    if ( function_b343432f7bbf6d5f() )
    {
        return true;
    }
    
    return callback::response( 0, #"can_pickup_ammo_pouch" ) ?? 0;
}

// Namespace ammopouch
// Params 4, eflags: 0x4
// Checksum 0x6fa72ed5, Offset: 0x107e
// Size: 0x58, Type: bool
function private function_b343432f7bbf6d5f( item_def, item, auto_pickup, var_a0f59cb55797bb59 )
{
    if ( !isplayer( self ) )
    {
        return false;
    }
    
    platecount = armor::function_22290101992e4874();
    platemax = armor::function_db9ebf086f67fe92();
    return platecount < platemax;
}

// Namespace ammopouch
// Params 1, eflags: 0x4
// Checksum 0x9c06781c, Offset: 0x10df
// Size: 0x232
function private refillammo( fullrefill = 0 )
{
    var_f3f1ae1911b3c3c6 = function_5ef2eb1bb4dacb37();
    
    foreach ( var_ab13966355ea575f in var_f3f1ae1911b3c3c6 )
    {
        maxstockammo = max( weaponmaxammo( var_ab13966355ea575f ), var_ab13966355ea575f.clipsize );
        currentstockammo = self getweaponammostock( var_ab13966355ea575f );
        normalpercent = 1;
        wonderpercent = 1;
        
        if ( !fullrefill )
        {
            normalpercent = level.var_c29d903007598945.var_6927abae739b791c / 100;
            wonderpercent = level.var_c29d903007598945.var_8623b5e4b5cd5d3b / 100;
        }
        
        var_7ee2cd26e86a1ceb = weapon::iswonderweapon( var_ab13966355ea575f );
        var_bbc21d630608de47 = 0;
        
        if ( var_7ee2cd26e86a1ceb )
        {
            var_bbc21d630608de47 = maxstockammo * wonderpercent;
        }
        else
        {
            var_bbc21d630608de47 = maxstockammo * normalpercent;
        }
        
        var_bbc21d630608de47 = max( var_bbc21d630608de47, 1 );
        totalammo = currentstockammo + var_bbc21d630608de47;
        totalammo = clamp( totalammo, 0, maxstockammo );
        totalammo = int( totalammo );
        self setweaponammostock( var_ab13966355ea575f, totalammo );
        
        if ( level.var_27a577c921d994b1 && var_ab13966355ea575f.reloaddisabled )
        {
            currentclip = self getweaponammoclip( var_ab13966355ea575f );
            totalclip = currentclip + var_bbc21d630608de47;
            totalclip = clamp( totalclip, 0, var_ab13966355ea575f.clipsize );
            totalclip = int( totalclip );
            self setweaponammoclip( var_ab13966355ea575f, totalclip );
        }
        
        if ( !weapon::isaxeweapon( var_ab13966355ea575f ) && var_ab13966355ea575f.hasalternate )
        {
            weaponaltobj = var_ab13966355ea575f getaltweapon();
            addammo = 30;
            stockammo = self getweaponammostock( weaponaltobj );
            newammo = int( stockammo + addammo );
            self setweaponammostock( weaponaltobj, newammo );
        }
    }
}

// Namespace ammopouch
// Params 4
// Checksum 0xf725f451, Offset: 0x1319
// Size: 0x53, Type: bool
function pickupammopouch( item_def, item, autouse, var_981c264073bf1154 )
{
    if ( !isplayer( self ) )
    {
        return true;
    }
    
    self playlocalsound( "fly_pickup_ammo_gen" );
    refillammo();
    refillarmor( item_def, item, autouse, var_981c264073bf1154 );
    return false;
}

// Namespace ammopouch
// Params 4, eflags: 0x4
// Checksum 0x94097898, Offset: 0x1375
// Size: 0x45, Type: bool
function private refillarmor( item_def, item, autouse, var_981c264073bf1154 )
{
    if ( !isplayer( self ) )
    {
        return false;
    }
    
    armor::function_164c824617d7e8d7( 1 );
    armor::function_df9c3f3288ff004f( 1 );
    return false;
}

// Namespace ammopouch
// Params 0
// Checksum 0x428363da, Offset: 0x13c3
// Size: 0x4, Type: bool
function function_34cbf8d5ef381377()
{
    return true;
}

