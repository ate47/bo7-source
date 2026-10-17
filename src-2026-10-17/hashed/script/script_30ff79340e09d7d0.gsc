#using script_25a8fa2ac8997425;
#using script_26f5997b01261edd;
#using script_60f5f171f8299455;
#using scripts\common\callbacks;
#using scripts\common\system;
#using scripts\common\utility;
#using scripts\mp\currency;
#using scripts\mp\gametypes\common;
#using scripts\mp\playerhealth;
#using scripts\mp\weapons;

#namespace perk_juggernaut;

// Namespace perk_juggernaut
// Params 0, eflags: 0x5
// Checksum 0x154edf0b, Offset: 0x1a0
// Size: 0x15
function private autoexec __init__system__()
{
    system::register( "specialty_juggernog", undefined, &__init__, undefined );
}

// Namespace perk_juggernaut
// Params 0
// Checksum 0x6f1919f5, Offset: 0x1bd
// Size: 0xa
function __init__()
{
    level thread perk_juggernaut_init();
}

// Namespace perk_juggernaut
// Params 0
// Checksum 0xad14b21b, Offset: 0x1cf
// Size: 0xd4
function perk_juggernaut_init()
{
    if ( !level.zombie_perks_in_use )
    {
        return;
    }
    
    level endon( #"game_ended" );
    level utility::flag_init( "specialty_juggernog" + "init_complete" );
    level utility::flag_wait_all( "StartGameTypeCallbackFinished", "zombie_perks_init_complete" );
    str_currency = currency::get_perk_machine_currency( "specialty_juggernog" );
    var_fcb7626c79b3c98f = currency::get_perk_machine_cost( "specialty_juggernog" );
    level thread zombie_perks::function_a01321e09bcca843( "specialty_juggernog", str_currency, var_fcb7626c79b3c98f, &function_a6e20561d1cf4391, &function_1925ccdfc299acbb );
    dvars::registerwatchdvarint( "zombie_perk_juggernaut_health", 100 );
    dvars::registerwatchdvarint( "zombie_perk_juggernaut_health_upgrade", 150 );
    utility::registersharedfunc( #"zombie", #"hash_8df0babcf2adf617", &function_99a9b13c120a9258 );
    level utility::flag_set( "specialty_juggernog" + "init_complete" );
}

// Namespace perk_juggernaut
// Params 0
// Checksum 0xdb858b2, Offset: 0x2ab
// Size: 0x83
function function_99a9b13c120a9258()
{
    durabilitypercent = 0;
    
    if ( zombie_perks::has_perk( "specialty_juggernog" ) && utility::issharedfuncdefined( #"zombie", #"hash_5b5c73998683a47" ) && utility::callsharedfunc( #"zombie", #"hash_5b5c73998683a47", #"juggernog_well_constructed" ) )
    {
        durabilitypercent = level.zombie_augments[ #"juggernog_well_constructed" ].var_855d075ee4c2b737 ?? 0;
    }
    
    return durabilitypercent;
}

// Namespace perk_juggernaut
// Params 0
// Checksum 0x4c9bbadb, Offset: 0x337
// Size: 0x2
function init_juggernaut()
{
    
}

// Namespace perk_juggernaut
// Params 0
// Checksum 0x7ccb29ea, Offset: 0x341
// Size: 0x2
function function_58178f915e728cac()
{
    
}

// Namespace perk_juggernaut
// Params 1
// Checksum 0x3fda2e36, Offset: 0x34b
// Size: 0xc
function function_657509c71785a6d7( state )
{
    
}

// Namespace perk_juggernaut
// Params 0
// Checksum 0x85d1bb5b, Offset: 0x35f
// Size: 0x1bc
function function_a6e20561d1cf4391()
{
    function_9cbc5881d3f7b01e();
    
    if ( utility::issharedfuncdefined( #"zombie", #"hash_5b5c73998683a47" ) && utility::callsharedfunc( #"zombie", #"hash_5b5c73998683a47", #"juggernog_juggernaut" ) )
    {
        healthincrease = level.zombie_augments[ #"juggernog_juggernaut" ].var_bb0cb5f15169b37c ?? 0;
        var_e58d7a4f046100e2 = -1 * ( level.zombie_augments[ #"juggernog_juggernaut" ].var_24a25169b9b0fee2 ?? 0 );
        
        if ( isdefined( self.maxhealth ) )
        {
            n_max_total_health = self.maxhealth + healthincrease;
            self.maxhealth = n_max_total_health;
            
            if ( !utility::ent_flag( "disable_player_heal_items" ) )
            {
                self.health = self.maxhealth;
            }
            
            callback::callback( "on_player_max_health_change", { #new_max_health:n_max_total_health } );
        }
        else
        {
            return;
        }
        
        if ( var_e58d7a4f046100e2 < 0 )
        {
            weapons::addextramovespeed( "juggernog_juggernaut_augment", var_e58d7a4f046100e2 );
            
            if ( !common::function_8ff835bf23198a0( "juggernog_juggernaut_augment" ) )
            {
                common::function_ac4bf3256b2545e3( "juggernog_juggernaut_augment", var_e58d7a4f046100e2 );
            }
            
            weapons::updatemovespeedscale();
        }
    }
    
    if ( utility::issharedfuncdefined( #"zombie", #"hash_5b5c73998683a47" ) && utility::callsharedfunc( #"zombie", #"hash_5b5c73998683a47", #"juggernog_shielded" ) )
    {
        if ( utility::issharedfuncdefined( #"zombie", #"set_golden_armor" ) )
        {
            utility::callsharedfunc( #"zombie", #"set_golden_armor" );
        }
    }
}

// Namespace perk_juggernaut
// Params 4
// Checksum 0x8a04f76a, Offset: 0x523
// Size: 0x122
function function_1925ccdfc299acbb( b_pause, str_perk, str_result, n_slot )
{
    function_d349a9d632555b0();
    
    if ( utility::issharedfuncdefined( #"zombie", #"hash_5b5c73998683a47" ) && utility::callsharedfunc( #"zombie", #"hash_5b5c73998683a47", #"juggernog_juggernaut" ) )
    {
        if ( isdefined( self.var_2d0e74f429afe5a0[ "juggernog_juggernaut_augment" ] ) )
        {
            weapons::removeextramovespeed( "juggernog_juggernaut_augment" );
            
            if ( common::function_8ff835bf23198a0( "juggernog_juggernaut_augment" ) )
            {
                common::function_d85a92c557ea5a52( "juggernog_juggernaut_augment" );
            }
            
            weapons::updatemovespeedscale();
        }
    }
    
    if ( utility::issharedfuncdefined( #"zombie", #"hash_5b5c73998683a47" ) && utility::callsharedfunc( #"zombie", #"hash_5b5c73998683a47", #"juggernog_shielded" ) )
    {
        if ( utility::issharedfuncdefined( #"zombie", #"take_golden_armor" ) )
        {
            utility::callsharedfunc( #"zombie", #"take_golden_armor" );
        }
    }
}

// Namespace perk_juggernaut
// Params 0
// Checksum 0xc491cf6e, Offset: 0x64d
// Size: 0xa1
function function_9cbc5881d3f7b01e()
{
    bundle = level.perkbundles[ "specialty_juggernog" ];
    
    if ( !utility::ent_flag( "disable_player_heal_items" ) )
    {
        self.health = self.maxhealth;
    }
    
    var_e0b3bac7c5485b9d = int( getmatchrulesdata( "commonOption", "maxHealth" ) );
    n_max_total_health = var_e0b3bac7c5485b9d + bundle.var_f40eb2103401205e;
    self.maxhealth = n_max_total_health;
    callback::callback( "on_player_max_health_change", { #new_max_health:n_max_total_health } );
    playerhealth::forcehealthregendelay( self, 1, 1 );
}

// Namespace perk_juggernaut
// Params 0
// Checksum 0x4a4a0a05, Offset: 0x6f6
// Size: 0xbc
function function_d349a9d632555b0()
{
    self notify( #"take_jugg" );
    n_max_total_health = int( getmatchrulesdata( "commonOption", "maxHealth" ) );
    self.maxhealth = n_max_total_health;
    
    if ( isarray( self.var_68e0e97561171104.var_26c23587d612a939 ) && self.var_68e0e97561171104.var_26c23587d612a939.size > 0 )
    {
        var_26c23587d612a939 = self.var_68e0e97561171104.var_26c23587d612a939;
    }
    
    callback::callback( "on_player_max_health_change", { #new_max_health:n_max_total_health } );
    thread function_84e5ff1d30554c95( var_26c23587d612a939 );
    
    if ( isalive( self ) )
    {
        self.health = n_max_total_health;
    }
}

// Namespace perk_juggernaut
// Params 1, eflags: 0x4
// Checksum 0x3acfa41f, Offset: 0x7ba
// Size: 0xa5
function private function_84e5ff1d30554c95( var_26c23587d612a939 )
{
    if ( isarray( var_26c23587d612a939 ) && var_26c23587d612a939.size > 0 )
    {
        waitframe();
        waitframe();
        
        if ( isplayer( self ) && isalive( self ) )
        {
            foreach ( index, overheal_value in var_26c23587d612a939 )
            {
                health_overcharge::function_f6da758a8ee4c988( self, index, overheal_value );
            }
        }
    }
}

