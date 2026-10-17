#using script_2f9865564c75a1d7;
#using script_34a396b44ede2542;
#using script_45795d34fc12632a;
#using script_49e4a4c208f44b76;
#using script_75fa5e2835aeb1ae;
#using scripts\common\script;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\common\vehicle_spawn;
#using scripts\mp\challenges;
#using scripts\mp\outofbounds;
#using scripts\mp\superdeploy;
#using scripts\mp\supers;

#namespace vehicle_drop;

// Namespace vehicle_drop
// Params 0
// Checksum 0xc75c7db7, Offset: 0x199
// Size: 0xb, Type: bool
function function_7d294a933f391ac0()
{
    thread function_e545185f44c8c490();
    return true;
}

// Namespace vehicle_drop
// Params 0
// Checksum 0x5be022f, Offset: 0x1ad
// Size: 0x158
function function_e545185f44c8c490()
{
    level endon( #"game_ended" );
    self endon( #"death_or_disconnect" );
    waitframe();
    superinfo = supers_mp::getcurrentsuper();
    
    if ( isdefined( level.var_d6dbcfd3322e6005 ) )
    {
        superinfo.var_21f1b0b4d8d3ea8f = level.var_d6dbcfd3322e6005;
    }
    
    val::set( "giveDropWeapon", "killstreaks", 0 );
    deployresult = superdeploy::superdeploy_doweaponfireddeploy( superinfo, makeweapon( "deploy_vehicle_drop_mp" ), "grenade_fire" );
    val::reset_all( "giveDropWeapon" );
    
    if ( deployresult )
    {
        self notify( #"super_finished_with_deploy_weapon" );
        
        if ( utility::issharedfuncdefined( #"supers", #"superusefinished" ) )
        {
            [[ utility::getsharedfunc( #"supers", #"superusefinished" ) ]]();
            challenges::function_a0936b0e5b4550f3( "super_vehicle_drop", 0 );
        }
        
        return;
    }
    
    if ( utility::issharedfuncdefined( #"hud", #"showerrormessage" ) )
    {
        self [[ utility::getsharedfunc( #"hud", #"showerrormessage" ) ]]( "MP/CANNOT_USE_GENERIC" );
    }
    
    if ( utility::issharedfuncdefined( #"supers", #"superusefinished" ) )
    {
        [[ utility::getsharedfunc( #"supers", #"superusefinished" ) ]]( 1 );
    }
}

// Namespace vehicle_drop
// Params 1
// Checksum 0xfead0be5, Offset: 0x30d
// Size: 0x5c
function function_e3edb34cf2a878dd( grenade )
{
    player = self;
    player endon( #"disconnect" );
    player endon( #"hash_92ef961de50d23da" );
    grenade waittill( #"death" );
    waitframe();
    
    if ( isdefined( player.super ) )
    {
        player supers_mp::superusefinished( 1 );
    }
}

// Namespace vehicle_drop
// Params 1
// Checksum 0x35b9dd21, Offset: 0x371
// Size: 0x261
function vehicledrop_used( grenade )
{
    self endon( #"disconnect" );
    level endon( #"game_ended" );
    grenade endon( #"explode_end" );
    
    if ( !isdefined( self ) )
    {
        return;
    }
    
    if ( br_gametype_truckwar::function_5600eb428823ffdb() )
    {
    }
    
    grenade thread script::notifyafterframeend( "death", "explode_end" );
    thread function_e3edb34cf2a878dd( grenade );
    
    if ( isdefined( level.var_8828b182d5497d81 ) )
    {
        level thread advanced_supply_drop::function_c414630139a61b21( self, grenade );
    }
    
    grenade waittill( #"explode", position );
    self notify( #"hash_92ef961de50d23da" );
    
    if ( outofbounds::ispointinoutofbounds( position ) )
    {
        if ( isdefined( grenade ) )
        {
            grenade delete();
        }
        
        if ( isdefined( self.super ) )
        {
            supers_mp::superusefinished( 1 );
        }
        
        if ( utility::issharedfuncdefined( #"hud", #"showerrormessage" ) )
        {
            self [[ utility::getsharedfunc( #"hud", #"showerrormessage" ) ]]( "SUPER_MP/VEHICLE_DROP_CANNOT_USE_OOB" );
        }
        
        return;
    }
    
    istruckwar = game_utility::getgametype() == "truckwar";
    spawndata = spawnstruct();
    spawndata.origin = position;
    spawndata.angles = self.angles;
    spawndata.var_c95d646de6b9216c = 1;
    spawndata.disablepopsmoke = 1;
    spawndata.var_5deb24d6fac0806b = 1;
    spawndata.var_be20d52d9ea88e67 = 1;
    itemdata = spawnstruct();
    itemdata.ref = "veh9_mil_lnd_mrap";
    
    if ( !vehicle_spawn::function_c49e68f891a06e6f( spawndata.origin, itemdata.ref ) )
    {
        if ( isdefined( grenade ) )
        {
            grenade delete();
        }
        
        if ( isdefined( self.super ) )
        {
            supers_mp::superusefinished( 1 );
        }
        
        if ( utility::issharedfuncdefined( #"hud", #"showerrormessage" ) )
        {
            self [[ utility::getsharedfunc( #"hud", #"showerrormessage" ) ]]( "SUPER_MP/VEHICLE_DROP_CANNOT_USE_OOB" );
        }
    }
    
    self notify( #"vehicle_drop_success" );
    thread br_gametype_dmz::showdmzsplash( "truckwar_vehicle_deploying", level.teamdata[ self.team ][ "players" ] );
    thread br_armory_kiosk::function_29e5da897c7fb1fa( itemdata, spawndata, istruckwar );
    return 1;
}

// Namespace vehicle_drop
// Params 1
// Checksum 0x300f310e, Offset: 0x5db
// Size: 0x14, Type: bool
function function_1147d252fa28e09f( equipmentref )
{
    return equipmentref == "equip_advanced_vehicle_drop";
}

