#using scripts\common\callbacks;
#using scripts\common\utility;
#using scripts\common\weapon;
#using scripts\mp\content_manager;
#using scripts\mp\currency;
#using scripts\mp\interaction;
#using scripts\mp\pack_a_punch;

#namespace ammo_cache;

// Namespace ammo_cache
// Params 1
// Checksum 0x2d5b2e7b, Offset: 0x1f5
// Size: 0x479
function init_ammo_cache( scriptbundlename = "ammocache:base_ammo_cache" )
{
    ammocachebundle = getscriptbundle( scriptbundlename );
    currencytype = #"essence";
    cost = 100;
    modelname = "t10_zm_large_ammo_crate_01";
    hintstring = &"shared_hintstrings/ammo_cache_use_essence";
    useradius = 64;
    heightoffset = 64;
    var_b73cf47f78dc7922 = 100;
    var_b73cf37f78dc76ef = 100;
    var_b73cf27f78dc74bc = 100;
    var_b73cf17f78dc7289 = 100;
    var_cecc0a1d213a5866 = 100;
    var_89de21b8a22ba0e3 = 100;
    var_89de22b8a22ba316 = 100;
    var_89de23b8a22ba549 = 100;
    var_89de24b8a22ba77c = 100;
    icon = "none";
    var_5158d7704946ab06 = 0;
    
    if ( isdefined( ammocachebundle ) )
    {
        currencytype = ammocachebundle.currencytype;
        cost = ammocachebundle.cost;
        modelname = ammocachebundle.modelname;
        hintstring = ammocachebundle.hintstring;
        useradius = ammocachebundle.useradius;
        heightoffset = ammocachebundle.heightoffset;
        var_b73cf47f78dc7922 = ammocachebundle.var_b73cf47f78dc7922;
        var_b73cf37f78dc76ef = ammocachebundle.var_b73cf37f78dc76ef;
        var_b73cf27f78dc74bc = ammocachebundle.var_b73cf27f78dc74bc;
        var_b73cf17f78dc7289 = ammocachebundle.var_b73cf17f78dc7289;
        var_cecc0a1d213a5866 = ammocachebundle.var_cecc0a1d213a5866;
        var_89de21b8a22ba0e3 = ammocachebundle.var_89de21b8a22ba0e3;
        var_89de22b8a22ba316 = ammocachebundle.var_89de22b8a22ba316;
        var_89de23b8a22ba549 = ammocachebundle.var_89de23b8a22ba549;
        var_89de24b8a22ba77c = ammocachebundle.var_89de24b8a22ba77c;
        icon = ammocachebundle.icon;
        var_c5b05b48e97902b4 = ammocachebundle.scriptableuse;
        var_5158d7704946ab06 = ammocachebundle.noentscriptable;
        scriptablespawn = ammocachebundle.scriptablespawn;
    }
    
    level.var_6c83d1b7ba6fafa5 = spawnstruct();
    level.var_6c83d1b7ba6fafa5.currencytype = currencytype;
    level.var_6c83d1b7ba6fafa5.cost = cost;
    level.var_6c83d1b7ba6fafa5.modelname = modelname;
    level.var_6c83d1b7ba6fafa5.hintstring = hintstring;
    level.var_6c83d1b7ba6fafa5.useradius = useradius;
    level.var_6c83d1b7ba6fafa5.heightoffset = heightoffset;
    level.var_6c83d1b7ba6fafa5.var_b73cf47f78dc7922 = var_b73cf47f78dc7922;
    level.var_6c83d1b7ba6fafa5.var_b73cf37f78dc76ef = var_b73cf37f78dc76ef;
    level.var_6c83d1b7ba6fafa5.var_b73cf27f78dc74bc = var_b73cf27f78dc74bc;
    level.var_6c83d1b7ba6fafa5.var_b73cf17f78dc7289 = var_b73cf17f78dc7289;
    level.var_6c83d1b7ba6fafa5.var_cecc0a1d213a5866 = var_cecc0a1d213a5866;
    level.var_6c83d1b7ba6fafa5.var_89de21b8a22ba0e3 = var_89de21b8a22ba0e3;
    level.var_6c83d1b7ba6fafa5.var_89de22b8a22ba316 = var_89de22b8a22ba316;
    level.var_6c83d1b7ba6fafa5.var_89de23b8a22ba549 = var_89de23b8a22ba549;
    level.var_6c83d1b7ba6fafa5.var_89de24b8a22ba77c = var_89de24b8a22ba77c;
    level.var_6c83d1b7ba6fafa5.var_ea07e36d8fd28578 = [];
    level.var_e1a38c4e5a18b794 = [];
    level.var_bb25f7425fe2cf0c = [];
    level.var_6c83d1b7ba6fafa5.icon = icon;
    level.var_6c83d1b7ba6fafa5.var_c5b05b48e97902b4 = var_c5b05b48e97902b4;
    level.var_6c83d1b7ba6fafa5.var_5158d7704946ab06 = var_5158d7704946ab06;
    level.var_6c83d1b7ba6fafa5.scriptablespawn = scriptablespawn;
    utility::registersharedfunc( #"ammo_cache", #"hash_2c8f07b47ebbf19d", &function_9d2388a89ebef5da );
    utility::registersharedfunc( #"ammo_cache", #"ammo_cache_give_ammo", &ammo_cache_give_ammo );
    
    if ( !( level.gametypebundle.disableammocaches ?? 0 ) )
    {
        content_manager::register_script( "ammo_cache", &on_spawn_ammo_cache );
        content_manager::register_disable_toggle( "ammo_cache", &content_manager::function_5d04e50a29a2142c, &function_4584de7145dbe3b8, &function_be00eab57cc29bd1 );
        level thread init_ammo_cache_postmain();
    }
}

// Namespace ammo_cache
// Params 2
// Checksum 0x3342a864, Offset: 0x676
// Size: 0x77
function function_a3aebb9fda9f2bef( weapon_name, isalternate )
{
    if ( isalternate )
    {
        if ( !isdefined( level.var_bb25f7425fe2cf0c ) )
        {
            level.var_bb25f7425fe2cf0c = [];
        }
        
        level.var_bb25f7425fe2cf0c[ level.var_bb25f7425fe2cf0c.size ] = weapon_name;
        return;
    }
    
    if ( !isdefined( level.var_e1a38c4e5a18b794 ) )
    {
        level.var_e1a38c4e5a18b794 = [];
    }
    
    level.var_e1a38c4e5a18b794[ level.var_e1a38c4e5a18b794.size ] = weapon_name;
}

// Namespace ammo_cache
// Params 0
// Checksum 0x7dffd035, Offset: 0x6f5
// Size: 0x178
function init_ammo_cache_postmain()
{
    level endon( #"game_ended" );
    wait 1;
    mapdestinations = utility::getstructarray( "content_destination", "variantname" );
    
    if ( isdefined( mapdestinations ) && mapdestinations.size > 0 )
    {
        foreach ( destination in mapdestinations )
        {
            level thread function_2e00347f6d9e5aca( destination );
        }
    }
    
    waittillframeend();
    var_288c06f658da68dc = utility::getstructarray( "content_struct", "variantname" );
    
    foreach ( s_content in var_288c06f658da68dc )
    {
        if ( s_content.content_key == "ammo_cache_spawn" && !arraycontains( level.var_6c83d1b7ba6fafa5.var_ea07e36d8fd28578, s_content ) )
        {
            if ( s_content content_manager::function_e0f0562adcd2c071() )
            {
                thread function_48881059553792e5( s_content );
            }
        }
    }
}

// Namespace ammo_cache
// Params 1
// Checksum 0x99081fdd, Offset: 0x875
// Size: 0x118
function function_2e00347f6d9e5aca( destination )
{
    foreach ( location in destination.locations )
    {
        ammo_cache = location.instances[ "ammo_cache" ];
        
        if ( isdefined( ammo_cache ) )
        {
            foreach ( instance in ammo_cache.versions )
            {
                content_manager::spawn_instance( instance );
            }
        }
    }
}

// Namespace ammo_cache
// Params 1
// Checksum 0x436aa057, Offset: 0x995
// Size: 0xc4
function on_spawn_ammo_cache( instance )
{
    assert( isstruct( instance ), "<dev string:x24>" );
    spawn_points = instance.contentgroups[ "ammo_cache_spawn" ];
    
    foreach ( point in spawn_points )
    {
        if ( point content_manager::function_e0f0562adcd2c071() )
        {
            thread function_48881059553792e5( point );
        }
    }
    
    level utility::flag_set( "ammo_caches_initialized" );
}

// Namespace ammo_cache
// Params 1
// Checksum 0x8799faca, Offset: 0xa61
// Size: 0x315
function function_48881059553792e5( spawn_struct )
{
    level.var_6c83d1b7ba6fafa5.var_ea07e36d8fd28578 = arraycombineunique( level.var_6c83d1b7ba6fafa5.var_ea07e36d8fd28578, [ spawn_struct ] );
    
    if ( isdefined( spawn_struct.script_flag_wait ) )
    {
        utility::flag_wait( spawn_struct.script_flag_wait );
    }
    
    if ( isdefined( spawn_struct.mdl_ammo_cache ) )
    {
        return;
    }
    
    if ( level.var_6c83d1b7ba6fafa5.var_5158d7704946ab06 )
    {
        scriptmodel = spawnscriptable( level.var_6c83d1b7ba6fafa5.scriptablespawn, spawn_struct.origin, spawn_struct.angles );
        var_38ab0335efaa5fa5 = interaction::register_scriptable_interact( scriptmodel, &function_a0ed846a4d4d08ac, undefined, undefined, &function_28ef526b03663f63, 0 );
        var_38ab0335efaa5fa5.var_a3338cc37b82b7b3 = scriptmodel;
        var_38ab0335efaa5fa5.cost = level.var_6c83d1b7ba6fafa5.cost;
        spawn_struct.var_38ab0335efaa5fa5 = var_38ab0335efaa5fa5;
        
        if ( isdefined( level.var_b171481be469074a ) )
        {
            level thread [[ level.var_b171481be469074a ]]( spawn_struct, scriptmodel );
        }
        else
        {
            utility::callsharedfunc( #"scriptable", #"setminimapfloor", scriptmodel, "icon" );
        }
    }
    else
    {
        scriptmodel = content_manager::spawn_script_model( spawn_struct, level.var_6c83d1b7ba6fafa5.modelname, 1, 1, spawn_struct.origin );
        spawn_struct.mdl_ammo_cache = scriptmodel;
        
        if ( isdefined( level.var_b171481be469074a ) )
        {
            level thread [[ level.var_b171481be469074a ]]( spawn_struct, scriptmodel );
        }
        else
        {
            utility::callsharedfunc( #"scriptable", #"setminimapfloor", scriptmodel, "icon" );
        }
        
        fwd = anglestoforward( scriptmodel.angles );
        up = anglestoup( scriptmodel.angles );
        trigger_pos_offset = scriptmodel.origin + fwd * 24;
        trigger_pos_offset += up * level.var_6c83d1b7ba6fafa5.heightoffset;
        
        if ( isdefined( level.var_6c83d1b7ba6fafa5.var_c5b05b48e97902b4 ) )
        {
            var_d744ddf30b5a0afd = spawnscriptable( level.var_6c83d1b7ba6fafa5.var_c5b05b48e97902b4, trigger_pos_offset, scriptmodel.angles );
            var_38ab0335efaa5fa5 = interaction::register_scriptable_interact( var_d744ddf30b5a0afd, &function_a0ed846a4d4d08ac, undefined, undefined, &function_28ef526b03663f63, 0 );
        }
        else
        {
            assertmsg( "<dev string:x42>" );
        }
        
        var_38ab0335efaa5fa5.var_a3338cc37b82b7b3 = scriptmodel;
        var_38ab0335efaa5fa5.cost = level.var_6c83d1b7ba6fafa5.cost;
        spawn_struct.var_38ab0335efaa5fa5 = var_38ab0335efaa5fa5;
    }
    
    spawn_struct callback::callback( #"hash_406f38242baa9b03" );
    scriptmodel utility::callsharedfunc( #"zombie", #"hash_896b88a46f6a4c15", "ammocache" );
}

// Namespace ammo_cache
// Params 1, eflags: 0x4
// Checksum 0x17818bf7, Offset: 0xd7e
// Size: 0x15a
function private function_b647553421761b4f( var_ab13966355ea575f )
{
    var_482e9999b75ed3d8 = istrue( utility::callsharedfunc( #"zombie", #"hash_3930894d8d2f0ee6", "specialty_z_mod", #"z_mod_pack_mule" ) );
    var_544821a0af6853e9 = 99999;
    weapons = self getweaponslist( "primary" );
    
    foreach ( weapon in weapons )
    {
        if ( weapon != var_ab13966355ea575f && !weapon.ismelee )
        {
            max_clip_ammo = weaponclipsize( weapon );
            max_stock_ammo = utility::get_max_stock_ammo( weapon, var_482e9999b75ed3d8 );
            currentstockammo = self getweaponammostock( weapon );
            currentclipammo = self getweaponammoclip( weapon );
            
            if ( max_clip_ammo == currentclipammo && max_stock_ammo == currentstockammo )
            {
                continue;
            }
            
            totalammo = currentstockammo + currentclipammo;
            
            if ( totalammo < var_544821a0af6853e9 )
            {
                var_ab13966355ea575f = weapon;
                var_544821a0af6853e9 = totalammo;
            }
            
            var_ab13966355ea575f = weapon;
        }
    }
    
    return var_ab13966355ea575f;
}

// Namespace ammo_cache
// Params 2, eflags: 0x4
// Checksum 0x28f25c0d, Offset: 0xee1
// Size: 0x442
function private function_28ef526b03663f63( usable, player )
{
    if ( isplayer( player ) && isdefined( usable ) )
    {
        if ( player.interactions_disabled || player.ammo_cache_disabled || usable.b_disable )
        {
            return { #interactable:0, #string:&"", #type:"HINT_NOICON" };
        }
        
        var_ab13966355ea575f = player getcurrentweapon();
        cost = level.var_6c83d1b7ba6fafa5.cost;
        
        if ( var_ab13966355ea575f.ismelee )
        {
            var_ab13966355ea575f = player function_b647553421761b4f( var_ab13966355ea575f );
        }
        
        if ( weapon::iskillstreakweapon( var_ab13966355ea575f ) )
        {
            return { #string:&"shared_hintstrings/ammo_cache_weapon_disabled", #type:"HINT_NOBUTTON" };
        }
        
        if ( !isdefined( level.var_e1a38c4e5a18b794 ) )
        {
            level.var_e1a38c4e5a18b794 = [];
        }
        
        if ( !isdefined( level.var_bb25f7425fe2cf0c ) )
        {
            level.var_bb25f7425fe2cf0c = [];
        }
        
        if ( arraycontains( level.var_e1a38c4e5a18b794, var_ab13966355ea575f.basename ) )
        {
            return { #string:&"shared_hintstrings/ammo_cache_weapon_disabled", #type:"HINT_NOBUTTON" };
        }
        
        if ( var_ab13966355ea575f.isalternate && arraycontains( level.var_bb25f7425fe2cf0c, var_ab13966355ea575f.basename ) )
        {
            return { #string:&"shared_hintstrings/ammo_cache_weapon_disabled", #type:"HINT_NOBUTTON" };
        }
        
        if ( var_ab13966355ea575f.ismelee )
        {
            return { #string:&"shared_hintstrings/ammo_cache_weapon_disabled", #type:"HINT_NOBUTTON" };
        }
        
        cost = function_9d2388a89ebef5da( player, var_ab13966355ea575f );
        cost = usable function_60355d4a5847e024( player, cost );
        obj = { #icon:level.var_6c83d1b7ba6fafa5.icon, #icon_text_value:cost, #icon_text:&"shared_hintstrings/cost_essence", #description:&"shared_hintstrings/ammo_cache_desc", #title:&"shared_hintstrings/ammo_cache_title", #buttoncallout:&"shared_hintstrings/ammo_cache_button_callout", #type:"HINT_BUTTON" };
        var_1b2c5433c92213f7 = 0;
        
        if ( isdefined( var_ab13966355ea575f.underbarrel ) )
        {
            var_6d03eea324f864e4 = getattachmentbasetype( var_ab13966355ea575f, var_ab13966355ea575f.underbarrel );
            
            if ( var_6d03eea324f864e4 != "selectfire" )
            {
                var_1b2c5433c92213f7 = 1;
            }
        }
        
        var_482e9999b75ed3d8 = istrue( player utility::callsharedfunc( #"zombie", #"hash_3930894d8d2f0ee6", "specialty_z_mod", #"z_mod_pack_mule" ) );
        
        if ( var_ab13966355ea575f.isalternate && var_1b2c5433c92213f7 )
        {
            var_96e495d8a64db3e7 = utility::get_max_stock_ammo( var_ab13966355ea575f, var_482e9999b75ed3d8 );
            var_96e495d8a64db3e7++;
            currentclipammo = player getweaponammoclip( var_ab13966355ea575f );
            currentstockammo = player getweaponammostock( var_ab13966355ea575f );
            var_a5827d02dd10b8c5 = currentclipammo + currentstockammo;
            bfullammo = var_a5827d02dd10b8c5 >= var_96e495d8a64db3e7;
        }
        else
        {
            max_clip_ammo = weaponclipsize( var_ab13966355ea575f );
            max_stock_ammo = utility::get_max_stock_ammo( var_ab13966355ea575f, var_482e9999b75ed3d8 );
            currentclipammo = player getweaponammoclip( var_ab13966355ea575f );
            currentstockammo = player getweaponammostock( var_ab13966355ea575f );
            bfullammo = currentclipammo >= max_clip_ammo && currentstockammo >= max_stock_ammo;
        }
        
        if ( bfullammo )
        {
            obj.aux_text = &"shared_hintstrings/ammo_full";
            obj.interactable = 0;
        }
        else
        {
            playercurrency = player currency::get_currency_amount( #"essence" );
            
            if ( playercurrency < cost )
            {
                obj.aux_text = &"shared_hintstrings/not_enough_essence";
                obj.icon_text = &"shared_hintstrings/cost_essence_not_enough";
                obj.interactable = 0;
            }
        }
        
        return obj;
    }
    
    return { #string:&"", #type:"HINT_NOBUTTON" };
}

// Namespace ammo_cache
// Params 1
// Checksum 0x1f151664, Offset: 0x132c
// Size: 0x428
function function_a0ed846a4d4d08ac( player )
{
    if ( !isplayer( player ) )
    {
        return;
    }
    
    if ( player.interactions_disabled || player.ammo_cache_disabled || self.b_disable )
    {
        return;
    }
    
    if ( player attackbuttonpressed() )
    {
        return;
    }
    
    if ( !utility::function_af749a6c1f8241f0( player, self.var_a3338cc37b82b7b3.origin, 140 ) )
    {
        return;
    }
    
    var_ab13966355ea575f = player getcurrentweapon();
    var_208d419b01461140 = 0;
    
    if ( var_ab13966355ea575f.ismelee )
    {
        var_208d419b01461140 = 1;
        var_ab13966355ea575f = player function_b647553421761b4f( var_ab13966355ea575f );
    }
    
    if ( var_ab13966355ea575f.ismelee )
    {
        return;
    }
    
    if ( weapon::iskillstreakweapon( var_ab13966355ea575f ) )
    {
        return;
    }
    
    if ( !isdefined( level.var_e1a38c4e5a18b794 ) )
    {
        level.var_e1a38c4e5a18b794 = [];
    }
    
    if ( !isdefined( level.var_bb25f7425fe2cf0c ) )
    {
        level.var_bb25f7425fe2cf0c = [];
    }
    
    if ( arraycontains( level.var_e1a38c4e5a18b794, var_ab13966355ea575f.basename ) )
    {
        return;
    }
    
    if ( var_ab13966355ea575f.isalternate && arraycontains( level.var_bb25f7425fe2cf0c, var_ab13966355ea575f.basename ) )
    {
        return;
    }
    
    currencytype = level.var_6c83d1b7ba6fafa5.currencytype;
    var_50bac4dcea60a475 = self.cost;
    var_50bac4dcea60a475 = function_9d2388a89ebef5da( player, var_ab13966355ea575f );
    var_50bac4dcea60a475 = function_60355d4a5847e024( player, var_50bac4dcea60a475 );
    var_1b2c5433c92213f7 = 0;
    
    if ( isdefined( var_ab13966355ea575f.underbarrel ) )
    {
        var_6d03eea324f864e4 = getattachmentbasetype( var_ab13966355ea575f, var_ab13966355ea575f.underbarrel );
        
        if ( var_6d03eea324f864e4 != "selectfire" )
        {
            var_1b2c5433c92213f7 = 1;
        }
    }
    
    var_482e9999b75ed3d8 = istrue( player utility::callsharedfunc( #"zombie", #"hash_3930894d8d2f0ee6", "specialty_z_mod", #"z_mod_pack_mule" ) );
    
    if ( var_ab13966355ea575f.isalternate && var_1b2c5433c92213f7 )
    {
        var_96e495d8a64db3e7 = utility::get_max_stock_ammo( var_ab13966355ea575f, var_482e9999b75ed3d8 );
        var_96e495d8a64db3e7++;
        currentclipammo = player getweaponammoclip( var_ab13966355ea575f );
        currentstockammo = player getweaponammostock( var_ab13966355ea575f );
        var_a5827d02dd10b8c5 = currentclipammo + currentstockammo;
        bfullammo = var_a5827d02dd10b8c5 >= var_96e495d8a64db3e7;
    }
    else
    {
        max_clip_ammo = weaponclipsize( var_ab13966355ea575f );
        max_stock_ammo = utility::get_max_stock_ammo( var_ab13966355ea575f, var_482e9999b75ed3d8 );
        currentclipammo = player getweaponammoclip( var_ab13966355ea575f );
        currentstockammo = player getweaponammostock( var_ab13966355ea575f );
        
        if ( isweaponcliponly( var_ab13966355ea575f ) )
        {
            bfullammo = currentclipammo >= max_clip_ammo;
        }
        else
        {
            bfullammo = currentclipammo >= max_clip_ammo && currentstockammo >= max_stock_ammo;
        }
    }
    
    if ( var_ab13966355ea575f.isdualwield )
    {
        var_506693b2ebc6da6a = player getweaponammoclip( var_ab13966355ea575f, "left" );
        
        if ( var_506693b2ebc6da6a < max_clip_ammo )
        {
            bfullammo = 0;
        }
    }
    
    if ( bfullammo )
    {
        if ( isdefined( level.currency[ currencytype ].denysound ) )
        {
            player playsoundtoplayer( level.currency[ currencytype ].denysound, player );
        }
        
        return;
    }
    
    sparams = spawnstruct();
    sparams.ammorefilled = 0;
    
    if ( !isdefined( currencytype ) || var_50bac4dcea60a475 == 0 )
    {
        player ammo_cache_give_ammo( var_ab13966355ea575f );
        self.var_a3338cc37b82b7b3 setscriptablepartstate( "base", "used" );
        sparams.ammorefilled = 1;
    }
    else if ( player currency::attempt_purchase( currencytype, var_50bac4dcea60a475, 1, 0, #"ammo_cache", undefined, 1 ) )
    {
        player ammo_cache_give_ammo( var_ab13966355ea575f );
        sparams.ammorefilled = 1;
        self.var_a3338cc37b82b7b3 setscriptablepartstate( "base", "used" );
    }
    
    if ( sparams.ammorefilled )
    {
        if ( isplayer( player ) )
        {
            player playrumbleonentity( "use_interact" );
        }
    }
    
    player callback::callback( "ammo_cache_used", sparams );
    
    if ( sparams.ammorefilled && var_208d419b01461140 && !isdefined( player.var_e128bf4e7e72ad92 ) )
    {
        player switchtoweapon( var_ab13966355ea575f );
    }
}

// Namespace ammo_cache
// Params 1
// Checksum 0xbf861d8c, Offset: 0x175c
// Size: 0x13b
function ammo_cache_give_ammo( weapon )
{
    var_482e9999b75ed3d8 = istrue( utility::callsharedfunc( #"zombie", #"hash_3930894d8d2f0ee6", "specialty_z_mod", #"z_mod_pack_mule" ) );
    var_f40d3888c3a0cd44 = utility::get_max_stock_ammo( weapon, var_482e9999b75ed3d8 );
    n_clip_max = weaponclipsize( weapon );
    
    if ( weapon.isdualwield )
    {
        self setweaponammoclip( weapon, n_clip_max, "left" );
        self setweaponammoclip( weapon, n_clip_max, "right" );
    }
    else
    {
        self setweaponammoclip( weapon, n_clip_max );
    }
    
    self setweaponammostock( weapon, var_f40d3888c3a0cd44 );
    
    if ( !isdefined( level.var_bb25f7425fe2cf0c ) )
    {
        level.var_bb25f7425fe2cf0c = [];
    }
    
    if ( isdefined( weapon ) && weapon.hasalternate && !arraycontains( level.var_bb25f7425fe2cf0c, weapon.basename ) )
    {
        weaponaltobj = weapon getaltweapon();
        var_f40d3888c3a0cd44 = utility::get_max_stock_ammo( weaponaltobj, var_482e9999b75ed3d8 );
        self setweaponammostock( weaponaltobj, var_f40d3888c3a0cd44 );
        n_clip_current = self getweaponammoclip( weaponaltobj );
        n_clip_max = weaponclipsize( weaponaltobj );
        
        if ( n_clip_current < n_clip_max )
        {
            self setweaponammoclip( weaponaltobj, weaponclipsize( weaponaltobj ) );
        }
    }
}

// Namespace ammo_cache
// Params 2
// Checksum 0x85e38bcf, Offset: 0x189f
// Size: 0xbb
function function_60355d4a5847e024( player, cost )
{
    if ( isplayer( player ) && isdefined( player.mary_paris_mdl ) && player utility::callsharedfunc( #"zombie", #"hash_5b5c73998683a47", #"mary_paris_family_discount" ) )
    {
        if ( distance2d( player.mary_paris_mdl.origin, self.origin ) <= 62500 )
        {
            cost_modifier = level.zombie_augments[ #"mary_paris_family_discount" ].var_fd44baa3fdbc070 ?? 0.5;
            cost = int( cost * cost_modifier );
        }
    }
    
    return cost;
}

// Namespace ammo_cache
// Params 2
// Checksum 0x473e95ca, Offset: 0x1963
// Size: 0x1b1
function function_9d2388a89ebef5da( player, weapon )
{
    cost = level.var_6c83d1b7ba6fafa5.cost;
    
    if ( isplayer( player ) && isdefined( weapon ) )
    {
        paplevel = player pack_a_punch::get_pap_level( weapon );
        iswonderweapon = weapon::iswonderweapon( weapon );
        
        switch ( paplevel )
        {
            case 0:
                if ( iswonderweapon )
                {
                    cost = level.var_6c83d1b7ba6fafa5.var_cecc0a1d213a5866;
                }
                
                break;
            case 1:
                if ( iswonderweapon )
                {
                    cost = level.var_6c83d1b7ba6fafa5.var_89de21b8a22ba0e3;
                }
                else
                {
                    cost = level.var_6c83d1b7ba6fafa5.var_b73cf47f78dc7922;
                }
                
                break;
            case 2:
                if ( iswonderweapon )
                {
                    cost = level.var_6c83d1b7ba6fafa5.var_89de22b8a22ba316;
                }
                else
                {
                    cost = level.var_6c83d1b7ba6fafa5.var_b73cf37f78dc76ef;
                }
                
                break;
            case 3:
                if ( iswonderweapon )
                {
                    cost = level.var_6c83d1b7ba6fafa5.var_89de23b8a22ba549;
                }
                else
                {
                    cost = level.var_6c83d1b7ba6fafa5.var_b73cf27f78dc74bc;
                }
                
                break;
            case 4:
                if ( iswonderweapon )
                {
                    cost = level.var_6c83d1b7ba6fafa5.var_89de24b8a22ba77c;
                }
                else
                {
                    cost = level.var_6c83d1b7ba6fafa5.var_b73cf17f78dc7289;
                }
                
                break;
            default:
                break;
        }
    }
    
    return cost;
}

// Namespace ammo_cache
// Params 1
// Checksum 0x817cbd8d, Offset: 0x1b1d
// Size: 0x42
function function_4584de7145dbe3b8( s_feature )
{
    ammo_cache = s_feature.var_38ab0335efaa5fa5;
    ammo_cache setscriptablepartstate( "light", "hidden" );
    ammo_cache.b_disable = 1;
}

// Namespace ammo_cache
// Params 1
// Checksum 0x88fa1e6d, Offset: 0x1b67
// Size: 0x3f
function function_be00eab57cc29bd1( s_feature )
{
    ammo_cache = s_feature.var_38ab0335efaa5fa5;
    ammo_cache setscriptablepartstate( "light", "base" );
    ammo_cache.b_disable = undefined;
}

