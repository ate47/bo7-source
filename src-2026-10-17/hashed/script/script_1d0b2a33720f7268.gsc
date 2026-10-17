#using script_2fe74ee229c972c3;
#using script_762e73cd6088bff;
#using scripts\common\utility;
#using scripts\common\values;

#namespace namespace_7727490011376d;

// Namespace namespace_7727490011376d
// Params 0, eflags: 0x1
// Checksum 0x94b38e47, Offset: 0xb7
// Size: 0x17
function autoexec main()
{
    shared_skills::function_b667da63ece9b966( #"recharger", &init );
}

// Namespace namespace_7727490011376d
// Params 0
// Checksum 0x6bacf724, Offset: 0xd6
// Size: 0x3e
function init()
{
    utility::registersharedfunc( #"recharger", #"ongiveskill", &function_f6f956f52c9797d5 );
    utility::registersharedfunc( #"recharger", #"hash_4aa03f4559ac50a5", &function_e815b79c730d6282 );
}

// Namespace namespace_7727490011376d
// Params 1
// Checksum 0xfd9cd597, Offset: 0x11c
// Size: 0x5d, Type: bool
function function_f6f956f52c9797d5( skill_bundle )
{
    if ( skill_bundle.var_a52da47d4465c227 )
    {
        perk::giveperk( "specialty_faster_field_upgrade" );
        val::set( #"recharger", "field_upgrade_recharge_mult", skill_bundle.var_a52da47d4465c227 );
    }
    
    self.var_5b4b541c397a369c = { #bundle:skill_bundle };
    return true;
}

// Namespace namespace_7727490011376d
// Params 1
// Checksum 0xa4402034, Offset: 0x182
// Size: 0x68
function function_e815b79c730d6282( skill_bundle )
{
    val::reset( #"recharger", "field_upgrade_recharge_mult" );
    recharge_mult = val::get( "field_upgrade_recharge_mult" );
    
    if ( !recharge_mult && isdefined( self.perks[ "specialty_faster_field_upgrade" ] ) )
    {
        perk::removeperk( "specialty_faster_field_upgrade" );
    }
    
    self.var_5b4b541c397a369c = undefined;
}

