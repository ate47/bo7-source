#using scripts\common\weapon;

#namespace namespace_285f2d8d2827221c;

// Namespace namespace_285f2d8d2827221c
// Params 1
// Checksum 0x51791a5e, Offset: 0x9f
// Size: 0x6a
function function_3b1f07954db2a81( isprimary )
{
    gamemodebundle = getgamemodescriptbundle();
    
    if ( isdefined( gamemodebundle ) && isdefined( gamemodebundle.weaponlist ) )
    {
        weaponlistbundle = getscriptbundle( gamemodebundle.weaponlist );
        
        if ( isprimary )
        {
            return weaponlistbundle.defaultprimaryweapon;
        }
        
        return weaponlistbundle.defaultsecondaryweapon;
    }
}

// Namespace namespace_285f2d8d2827221c
// Params 0
// Checksum 0x59b8aa71, Offset: 0x111
// Size: 0x212
function update_player_weapon()
{
    if ( isdefined( self.primaryweaponobj ) )
    {
        self takeweapon( self.primaryweaponobj );
    }
    
    if ( isdefined( self.secondaryweaponobj ) && self.secondaryweaponobj.basename != "none" )
    {
        self takeweapon( self.secondaryweaponobj );
    }
    
    self.primaryweaponobj = undefined;
    self.secondaryweaponobj = undefined;
    loadoutdata = self function_cb8df376b3e57420();
    self.primaryweaponobj = loadoutdata.primaryweaponentityindex;
    
    if ( !isdefined( self.primaryweaponobj ) || self.primaryweaponobj.basename == "none" )
    {
        primaryweapon = function_3b1f07954db2a81( 1 );
        self.primaryweaponobj = weapon::buildweapon( primaryweapon, [], "camo_none", "none", 0, [], "none", [], 0, [] );
    }
    
    self giveweapon( self.primaryweaponobj );
    self setweaponammoclip( self.primaryweaponobj, weaponclipsize( self.primaryweaponobj ) );
    self setweaponammostock( self.primaryweaponobj, weaponmaxammo( self.primaryweaponobj ) );
    self setactionslot( 3, "altmode" );
    self.secondaryweaponobj = loadoutdata.secondaryweaponentityindex;
    
    if ( !isdefined( self.secondaryweaponobj ) || self.secondaryweaponobj.basename == "none" )
    {
        secondaryweapon = function_3b1f07954db2a81();
        self.secondaryweaponobj = weapon::buildweapon( secondaryweapon, [], "camo_none", "none", 0, [], "none", [], 0, [] );
    }
    
    self giveweapon( self.secondaryweaponobj );
    self setweaponammoclip( self.secondaryweaponobj, weaponclipsize( self.secondaryweaponobj ) );
    self setweaponammostock( self.secondaryweaponobj, weaponmaxammo( self.secondaryweaponobj ) );
    self switchtoweaponimmediate( self.primaryweaponobj );
}

