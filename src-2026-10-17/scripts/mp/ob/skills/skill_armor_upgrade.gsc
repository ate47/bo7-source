#using script_2fe74ee229c972c3;
#using scripts\common\utility;
#using scripts\mp\armor;

#namespace skill_armor_upgrade;

// Namespace skill_armor_upgrade
// Params 0, eflags: 0x1
// Checksum 0x1a5fab, Offset: 0x76
// Size: 0x17
function autoexec main()
{
    shared_skills::function_b667da63ece9b966( #"armor_upgrade", &init );
}

// Namespace skill_armor_upgrade
// Params 0
// Checksum 0xf7a146f4, Offset: 0x95
// Size: 0x3e
function init()
{
    utility::registersharedfunc( #"armor_upgrade", #"ongiveskill", &function_c0b208094095448 );
    utility::registersharedfunc( #"armor_upgrade", #"hash_4aa03f4559ac50a5", &function_6c74751fd7faec6f );
}

// Namespace skill_armor_upgrade
// Params 1
// Checksum 0xa4ae746d, Offset: 0xdb
// Size: 0x9a, Type: bool
function function_c0b208094095448( skill_bundle )
{
    if ( skill_bundle )
    {
        if ( utility::issharedfuncdefined( #"ob_armor", #"give_armor" ) )
        {
            self [[ utility::getsharedfunc( #"ob_armor", #"give_armor" ) ]]( skill_bundle.var_4b73c136896b176b );
        }
        else
        {
            self.platecarrierlevel = skill_bundle.var_4b73c136896b176b;
            self.maxarmorhealth = self.platecarrierlevel * level.armorplateamount;
            armor::setarmorhealth( self.maxarmorhealth );
        }
        
        return true;
    }
    
    return false;
}

// Namespace skill_armor_upgrade
// Params 1
// Checksum 0x6bf09afd, Offset: 0x17e
// Size: 0xe1, Type: bool
function function_6c74751fd7faec6f( skill_bundle )
{
    var_cd17cbf06d9d82db = 1;
    
    if ( level.var_1e9e024bcfca2274 )
    {
        var_cd17cbf06d9d82db = level.var_1e9e024bcfca2274.var_794dfc5af7dde3a0;
    }
    else if ( isdefined( level.var_b53174d3e41fb5da ) )
    {
        var_cd17cbf06d9d82db = level.var_b53174d3e41fb5da;
    }
    
    if ( utility::issharedfuncdefined( #"ob_armor", #"give_armor" ) )
    {
        self [[ utility::getsharedfunc( #"ob_armor", #"give_armor" ) ]]( var_cd17cbf06d9d82db );
    }
    else
    {
        self.platecarrierlevel = var_cd17cbf06d9d82db;
        self.maxarmorhealth = self.platecarrierlevel * level.armorplateamount;
        
        if ( self.armorhealth > self.maxarmorhealth )
        {
            armor::setarmorhealth( self.maxarmorhealth );
        }
    }
    
    return true;
}

