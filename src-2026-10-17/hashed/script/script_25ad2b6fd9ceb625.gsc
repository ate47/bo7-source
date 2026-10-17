#using script_16ea1b94f0f381b3;
#using scripts\common\powerups;
#using scripts\common\utility;

#namespace powerup_zombie_legs;

// Namespace powerup_zombie_legs
// Params 0, eflags: 0x1
// Checksum 0x8e7a9c1e, Offset: 0xc2
// Size: 0x1b
function autoexec main()
{
    if ( getdvarint( @"scr_disable_powerup_zombie_legs", 0 ) )
    {
        return;
    }
    
    init();
}

// Namespace powerup_zombie_legs
// Params 0
// Checksum 0x2d046cc1, Offset: 0xe5
// Size: 0x18
function init()
{
    powerups::register_powerup( "zombie_legs", &powerup_grab, &powerup_should_drop );
}

// Namespace powerup_zombie_legs
// Params 2
// Checksum 0x5fe5ef8e, Offset: 0x105
// Size: 0x99
function powerup_grab( str_powerup, ent_powerup )
{
    a_players = powerups::get_powerup_players( str_powerup );
    
    foreach ( player in a_players )
    {
        player thread function_e35e0623da0e89ec();
    }
}

// Namespace powerup_zombie_legs
// Params 0
// Checksum 0xae8acac6, Offset: 0x1a6
// Size: 0x4, Type: bool
function powerup_should_drop()
{
    return true;
}

// Namespace powerup_zombie_legs
// Params 1
// Checksum 0xc52a2187, Offset: 0x1b3
// Size: 0x95
function function_e35e0623da0e89ec( n_lifetime )
{
    self notify( #"hash_81c3cb306caaedf5" );
    self endon( #"hash_81c3cb306caaedf5" );
    self endon( #"disconnect" );
    
    if ( !isdefined( n_lifetime ) )
    {
        n_lifetime = powerups::function_f379817a62e3850c( "zombie_legs" );
    }
    
    thread namespace_9d8e359c3b1041e5::showpoweruphudsharedfunc( "zombie_legs", n_lifetime );
    
    if ( !self.var_c7db4a5f206339af )
    {
        self.var_c7db4a5f206339af = 1;
        namespace_9d8e359c3b1041e5::giveperksharedfunc( "specialty_zombie_legs" );
        thread function_2a4c443657270442();
    }
    
    utility::waittill_any_timeout( n_lifetime, "end_powerup_zombie_legs", "death" );
    function_574219c5e8771baa();
}

// Namespace powerup_zombie_legs
// Params 0
// Checksum 0x7f8cf6a3, Offset: 0x250
// Size: 0x24
function function_574219c5e8771baa()
{
    self notify( #"hash_d18da2883157b811" );
    namespace_9d8e359c3b1041e5::removeperksharedfunc( "specialty_zombie_legs" );
    self.var_c7db4a5f206339af = undefined;
}

// Namespace powerup_zombie_legs
// Params 0
// Checksum 0xfccda639, Offset: 0x27c
// Size: 0x42
function function_2a4c443657270442()
{
    self endon( #"hash_d18da2883157b811" );
    self endon( #"death_or_disconnect" );
    
    while ( self.var_c7db4a5f206339af )
    {
        self waittill( #"giveloadout" );
        namespace_9d8e359c3b1041e5::giveperksharedfunc( "specialty_zombie_legs" );
    }
}

