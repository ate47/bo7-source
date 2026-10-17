#using script_56e2519a4d33f9a2;
#using script_6995a3eb7d571a9f;
#using script_aa3bac81ad4fc8e;
#using scripts\common\callbacks;
#using scripts\common\system;
#using scripts\mp\loot\common_item;
#using scripts\mp\loot\common_item_database;
#using scripts\mp\loot\common_item_killstreak;

#namespace namespace_8c5a195026d2a48c;

// Namespace namespace_8c5a195026d2a48c
// Params 0, eflags: 0x5
// Checksum 0x54e85e95, Offset: 0x10e
// Size: 0x1d
function private autoexec __init__system__()
{
    system::register( "support_group", #"bgb", &__init__, undefined );
}

// Namespace namespace_8c5a195026d2a48c
// Params 0
// Checksum 0x98812999, Offset: 0x133
// Size: 0x36
function __init__()
{
    bgb::register( "support_group", "activated", 1, undefined, undefined, &validation, &activation );
    callback::add( #"hash_a1314093a84c7a9d", &function_95e61d2b9a202628 );
}

// Namespace namespace_8c5a195026d2a48c
// Params 0
// Checksum 0x9a4e1433, Offset: 0x171
// Size: 0x10a
function activation()
{
    if ( item_killstreak::hasanykillstreak() )
    {
        self.bgb_support_group_killstreak_save = self.streakdata.streaks[ 1 ].streakname;
        killstreaks::removekillstreak( 1 );
        killstreaks::updatekillstreakuislot( 1 );
    }
    
    var_76ca26f427aa51d0 = [ "rcxd", "mangler_cannon", "remote_turret", "zm_dinj" ];
    
    while ( var_76ca26f427aa51d0.size )
    {
        function_8a8af5e9a286ae88( var_76ca26f427aa51d0[ 0 ] );
        var_76ca26f427aa51d0[ 0 ] = undefined;
        function_cdc669dbc8ea2101( var_76ca26f427aa51d0 );
        
        while ( killstreak_utility::is_using_killstreak() || item_killstreak::hasanykillstreak() || level.var_174e613b8723391f )
        {
            waitframe();
        }
    }
    
    if ( isdefined( self.bgb_support_group_killstreak_save ) && self.bgb_support_group_killstreak_save != "none" )
    {
        while ( killstreak_utility::is_using_killstreak() || item_killstreak::hasanykillstreak() )
        {
            waitframe();
        }
        
        function_8a8af5e9a286ae88( self.bgb_support_group_killstreak_save );
        self.bgb_support_group_killstreak_save = undefined;
    }
}

// Namespace namespace_8c5a195026d2a48c
// Params 0
// Checksum 0x768e3d0d, Offset: 0x283
// Size: 0x1a
function disable()
{
    self endon( #"disconnect" );
    self notify( #"disable_support_group" );
}

// Namespace namespace_8c5a195026d2a48c
// Params 0
// Checksum 0x40fc9909, Offset: 0x2a5
// Size: 0x52, Type: bool
function validation()
{
    if ( killstreak_utility::is_using_killstreak() )
    {
        return false;
    }
    
    if ( level.s_active_challenge.hash_name == #"mangler_cannon_kills" || level.s_active_challenge.hash_name == #"rcxd_kills" )
    {
        return false;
    }
    
    return true;
}

// Namespace namespace_8c5a195026d2a48c
// Params 1
// Checksum 0x9decf1e6, Offset: 0x300
// Size: 0xd3
function function_8a8af5e9a286ae88( str_killstreak )
{
    item_bundle_name = common_item_database::function_a4f0a21951180013( str_killstreak );
    scriptable_name = getscriptbundlefieldvalue( item_bundle_name, #"scriptable" );
    
    switch ( str_killstreak )
    {
        case #"hash_6fd2a59c9aaf30b9":
            item_count = 3;
            break;
        case #"hash_18a50be37f8412e4":
            item_count = 10;
            break;
        case #"hash_f52d13c9b43e5098":
            item_count = 30;
            break;
        case #"hash_be9119805c60c78a":
            item_count = 350;
            break;
    }
    
    fake_scriptable = { #count:item_count ?? 1, #type:scriptable_name };
    success = common_item::function_2b5e2ff57d5f392( fake_scriptable, 0, 1 );
}

// Namespace namespace_8c5a195026d2a48c
// Params 1
// Checksum 0x94b9d1c2, Offset: 0x3db
// Size: 0x17
function function_95e61d2b9a202628( params )
{
    self.is_clearing_killstreak = 1;
}

