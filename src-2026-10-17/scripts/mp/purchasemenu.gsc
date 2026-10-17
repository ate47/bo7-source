#using script_49e4a4c208f44b76;

#namespace purchasemenu;

// Namespace purchasemenu
// Params 0
// Checksum 0x4ca87ae1, Offset: 0xc7
// Size: 0x214
function init()
{
    level.purchasemenu = [];
    purchasemenulist = level.gametypebundle.purchasemenulist ?? level.gamemodebundle.purchasemenulist;
    mapinfo = getactivemapinfobundle();
    
    if ( mapinfo.var_d2bd519e7bd218b6 && game_utility::function_21211f3255f8ea58() )
    {
        ignoreditems = mapinfo.var_d2bd519e7bd218b6;
    }
    else if ( mapinfo.var_58e3fe167604f088 )
    {
        ignoreditems = mapinfo.var_58e3fe167604f088;
    }
    
    var_683bce87d658b588 = undefined;
    
    if ( ignoreditems && isxhashasset( ignoreditems ) )
    {
        var_683bce87d658b588 = getscriptbundle( ignoreditems );
    }
    
    if ( isdefined( purchasemenulist ) )
    {
        var_7670200ae2711ca9 = getscriptbundle( purchasemenulist );
        
        if ( isdefined( level.var_73019dea778c47e6 ) )
        {
            var_7670200ae2711ca9 = getscriptbundle( level.var_73019dea778c47e6 );
        }
        
        if ( isdefined( var_7670200ae2711ca9 ) && isdefined( var_7670200ae2711ca9.purchasemenus ) )
        {
            foreach ( i, menu in var_7670200ae2711ca9.purchasemenus )
            {
                if ( isdefined( menu.menuref ) )
                {
                    level.purchasemenu[ menu.menuref ] = function_7b1d4491df5154b1( menu.purchasemenu, var_683bce87d658b588 );
                    
                    if ( isdefined( level.purchasemenu[ menu.menuref ] ) )
                    {
                        level.purchasemenu[ menu.menuref ].id = i + 1;
                        level.purchasemenu[ menu.menuref ].ref = menu.menuref;
                    }
                }
            }
        }
    }
}

// Namespace purchasemenu
// Params 2
// Checksum 0x23c7c915, Offset: 0x2e3
// Size: 0x2b9
function create_item_struct( menuref, itemindex )
{
    if ( !( isdefined( menuref ) && isdefined( itemindex ) && isdefined( level.purchasemenu[ menuref ] ) ) )
    {
        return;
    }
    
    item = level.purchasemenu[ menuref ].items[ itemindex ];
    
    if ( !isdefined( item ) )
    {
        return;
    }
    
    item_bundle = getscriptbundle( item.asset );
    
    if ( isdefined( item_bundle ) )
    {
        item_struct = spawnstruct();
        item_struct.cost = item_bundle.cost;
        item_struct.scriptable_name = item_bundle.scriptablename;
        item_struct.tier = item_bundle.tier;
        item_struct.itemref = item_bundle.itemref;
        item_struct.itemid = item_bundle.itemid;
        item_struct.itemamount = item_bundle.itemamount;
        item_struct.scalecost = item_bundle.scalecost;
        item_struct.maxstack = item_bundle.maxstack;
        item_struct.category = item.category;
        item_struct.tabindex = item.tabindex;
        item_struct.tabitemindex = item.tabitemindex;
        item_struct.globalindex = item.globalindex;
        item_struct.var_7e02ec01953711b4 = item_bundle.var_7e02ec01953711b4;
        item_struct.purchaselimit = item_bundle.purchaselimit;
        item_struct.var_fd31b7199454f3b6 = item_bundle.var_fd31b7199454f3b6;
        tab_struct = level.purchasemenu[ menuref ].tabs[ item_bundle.tabitemindex ];
        item_struct.soundpurchase = tab_struct.var_9084bbdf86f67435 ?? level.purchasemenu[ menuref ].var_9084bbdf86f67435;
        item_struct.var_ac7c10eb14c9d6e0 = tab_struct.var_c86efb1efa075fb7 ?? level.purchasemenu[ menuref ].var_c86efb1efa075fb7;
        
        if ( isdefined( item_bundle.currency ) )
        {
            var_cfadee1896fda9ba = getscriptbundle( item_bundle.currency );
            
            if ( isdefined( var_cfadee1896fda9ba ) )
            {
                item_struct.currency = var_cfadee1896fda9ba.currencyname;
            }
        }
        
        return item_struct;
    }
}

// Namespace purchasemenu
// Params 1
// Checksum 0x1ecd0f0c, Offset: 0x5a4
// Size: 0xa0, Type: bool
function is_item_valid( itemstruct )
{
    if ( isdefined( itemstruct ) && isdefined( itemstruct.purchaseitem ) )
    {
        itembundle = getscriptbundlefieldvalues( itemstruct.purchaseitem, [ #"dvaritem", #"hideinmenu" ] );
        
        if ( isdefined( itembundle ) )
        {
            hidefromdvar = isdefined( itembundle.dvaritem ) && ( !getdvarint( itembundle.dvaritem, 0 ) ?? 0 );
            return !( itembundle.hideinmenu || hidefromdvar );
        }
    }
    
    return false;
}

// Namespace purchasemenu
// Params 2
// Checksum 0x324e523c, Offset: 0x64d
// Size: 0x5da
function function_7b1d4491df5154b1( menubundlename, var_683bce87d658b588 )
{
    if ( !isdefined( menubundlename ) )
    {
        return;
    }
    
    var_24729d845f9dc3fb = spawnstruct();
    var_24729d845f9dc3fb.tabs = [];
    var_24729d845f9dc3fb.items = [];
    menubundle = getscriptbundle( menubundlename );
    var_24729d845f9dc3fb.var_912dc9ccec6a110c = menubundle.var_47f08be5559f4c77;
    var_24729d845f9dc3fb.closenotify = menubundle.var_77c74a9d8054eb0e;
    var_24729d845f9dc3fb.var_518864f924edcfb6 = menubundle.var_518864f924edcfb6;
    var_24729d845f9dc3fb.soundopenmenu = menubundle.soundopenmenu;
    var_24729d845f9dc3fb.soundclosemenu = menubundle.soundclosemenu;
    var_24729d845f9dc3fb.var_9084bbdf86f67435 = menubundle.var_9084bbdf86f67435;
    var_24729d845f9dc3fb.var_c86efb1efa075fb7 = menubundle.var_c86efb1efa075fb7;
    tabindex = 1;
    
    if ( isdefined( menubundle.var_6a003cae79cda7a6 ) )
    {
        tablist_bundle = getscriptbundle( menubundle.var_6a003cae79cda7a6 );
        globalindex = 1;
        
        if ( isdefined( tablist_bundle ) && isdefined( tablist_bundle.var_8d6107fd79dbbce0 ) )
        {
            foreach ( tab in tablist_bundle.var_8d6107fd79dbbce0 )
            {
                tab_bundle = getscriptbundle( tab.var_6465f12debc12fd3 );
                
                if ( isdefined( tab_bundle ) )
                {
                    tab_struct = spawnstruct();
                    tab_struct.asset = tab.var_6465f12debc12fd3;
                    tab_struct.index = tabindex;
                    tab_struct.ref = tab_bundle.ref;
                    tab_struct.items = [];
                    
                    if ( isdefined( tab_bundle.var_45d4e63a65fca9f9 ) )
                    {
                        var_c03c92022f916c5f = getscriptbundle( tab_bundle.var_45d4e63a65fca9f9 );
                        tabitemindex = 1;
                        
                        foreach ( index, item in var_c03c92022f916c5f.purchaseitems )
                        {
                            if ( is_item_valid( item ) && !function_84e37b7a39ef6268( item, var_683bce87d658b588 ) )
                            {
                                item_struct = spawnstruct();
                                item_struct.asset = item.purchaseitem;
                                item_struct.tabindex = tabindex;
                                item_struct.tabitemindex = tabitemindex;
                                item_struct.globalindex = globalindex;
                                item_struct.category = tab_bundle.tabcategory;
                                var_24729d845f9dc3fb.items[ globalindex ] = item_struct;
                                tab_struct.items[ tabitemindex ] = item_struct;
                                tabitemindex++;
                                globalindex++;
                            }
                        }
                    }
                    
                    var_24729d845f9dc3fb.tabs[ tabindex ] = tab_struct;
                }
                
                tabindex += 1;
            }
        }
    }
    else if ( isdefined( menubundle.var_ed999f84dad64edb ) )
    {
        tab_bundle = getscriptbundle( menubundle.var_ed999f84dad64edb );
        
        if ( isdefined( tab_bundle ) )
        {
            tab_struct = spawnstruct();
            tab_struct.asset = tab.var_6465f12debc12fd3;
            tab_struct.index = tabindex;
            tab_struct.items = [];
            tab_struct.var_a041636c049c4d29 = tab_bundle.var_f3131a694e17bdc6;
            tab_struct.packedomnvars = [];
            
            foreach ( index, item in tab_bundle.var_b01239e8bca7a4f5 )
            {
                if ( item.omnvar )
                {
                    tab_struct.packedomnvars[ tab_struct.packedomnvars.size ] = item.omnvar;
                }
            }
            
            if ( isdefined( tab_bundle.var_45d4e63a65fca9f9 ) )
            {
                var_c03c92022f916c5f = getscriptbundle( tab_bundle.var_45d4e63a65fca9f9 );
                globalindex = 1;
                
                foreach ( index, item in var_c03c92022f916c5f.purchaseitems )
                {
                    if ( is_item_valid( item ) && !function_84e37b7a39ef6268( item, var_683bce87d658b588 ) )
                    {
                        item_struct = spawnstruct();
                        item_struct.asset = item.purchaseitem;
                        item_struct.tabindex = tabindex;
                        item_struct.tabitemindex = globalindex;
                        item_struct.globalindex = globalindex;
                        item_struct.category = tab_bundle.tabcategory;
                        var_24729d845f9dc3fb.items[ globalindex ] = item_struct;
                        tab_struct.items[ globalindex ] = item_struct;
                        globalindex++;
                    }
                }
            }
            
            var_24729d845f9dc3fb.tabs[ tabindex ] = tab_struct;
        }
    }
    
    return var_24729d845f9dc3fb;
}

// Namespace purchasemenu
// Params 2
// Checksum 0x6f08e0c4, Offset: 0xc30
// Size: 0xae, Type: bool
function function_84e37b7a39ef6268( item, var_683bce87d658b588 )
{
    if ( !isdefined( var_683bce87d658b588 ) )
    {
        return false;
    }
    
    foreach ( ignored_item in var_683bce87d658b588.purchaseitems )
    {
        if ( ignored_item.purchaseitem == item.purchaseitem )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace purchasemenu
// Params 1
// Checksum 0x84ccd4a5, Offset: 0xce7
// Size: 0x1f
function get_purchasemenu( ref )
{
    if ( isdefined( ref ) )
    {
        return level.purchasemenu[ ref ];
    }
}

// Namespace purchasemenu
// Params 2
// Checksum 0x20657dd6, Offset: 0xd0e
// Size: 0x66
function get_purchasemenu_tab( ref, index )
{
    if ( isdefined( ref ) && isdefined( index ) && isdefined( level.purchasemenu[ ref ] ) && isdefined( level.purchasemenu[ ref ].tabs[ index ] ) )
    {
        return level.purchasemenu[ ref ].tabs[ index ];
    }
}

// Namespace purchasemenu
// Params 2
// Checksum 0x37c29bcd, Offset: 0xd7c
// Size: 0x66
function get_purchasemenu_item( ref, index )
{
    if ( isdefined( ref ) && isdefined( index ) && isdefined( level.purchasemenu[ ref ] ) && isdefined( level.purchasemenu[ ref ].items[ index ] ) )
    {
        return level.purchasemenu[ ref ].items[ index ];
    }
}

// Namespace purchasemenu
// Params 1
// Checksum 0xa7b7c4eb, Offset: 0xdea
// Size: 0x39
function function_cc7a4eca046e03ee( ref )
{
    if ( isdefined( ref ) && isdefined( level.purchasemenu[ ref ] ) )
    {
        return level.purchasemenu[ ref ].var_518864f924edcfb6;
    }
}

// Namespace purchasemenu
// Params 2
// Checksum 0x24e33d58, Offset: 0xe2b
// Size: 0x46, Type: bool
function function_bc886ba2b8da88c( menuref, channel )
{
    if ( isdefined( channel ) && isdefined( level.purchasemenu[ menuref ] ) )
    {
        return ( level.purchasemenu[ menuref ].closenotify == channel );
    }
    
    return false;
}

// Namespace purchasemenu
// Params 2
// Checksum 0x9cccafb5, Offset: 0xe7a
// Size: 0x7c
function menu_close_notify( s_menu, onclose )
{
    self endon( #"death" );
    level endon( #"game_ended" );
    self endon( s_menu.closenotify );
    self waittill( #"luinotifyserver", channel, value );
    
    if ( channel == s_menu.closenotify )
    {
        if ( isdefined( onclose ) )
        {
            waitframe();
            [[ onclose ]]( self );
        }
    }
}

// Namespace purchasemenu
// Params 1
// Checksum 0x4850403e, Offset: 0xefe
// Size: 0x2e
function function_93f934ea2f1c06f8( response )
{
    waitframe();
    
    if ( isdefined( self ) )
    {
        self setclientomnvar( "ui_purchasemenu_purchase_response", response );
        self setclientomnvar( "ui_purchasemenu_purchase_response_notify", gettime() );
    }
}

