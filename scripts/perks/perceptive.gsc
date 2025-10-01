#using scripts\common\callbacks;
#using scripts\common\utility;
#using scripts\cp_mp\utility\killstreak_utility;
#using scripts\engine\utility;

#namespace perceptive;

// Namespace perceptive
// Params 0, eflags: 0x1
// Checksum 0x4b9770e2, Offset: 0x194
// Size: 0x98
function autoexec preinit()
{
    level callback::add( #"register_perk", &function_3c26e63df0ff0308 );
    
    if ( !isdefined( level.sharedfuncs[ #"perceptive" ][ #"hash_2e6a34ebabf3ebdd" ] ) )
    {
        utility::registersharedfunc( #"perceptive", #"hash_2e6a34ebabf3ebdd", &function_42bca1267728522d );
    }
    
    if ( !isdefined( level.sharedfuncs[ #"perceptive" ][ #"decrementcount" ] ) )
    {
        utility::registersharedfunc( #"perceptive", #"decrementcount", &function_13b9243f3f43b0e9 );
    }
}

// Namespace perceptive
// Params 1
// Checksum 0x7050e992, Offset: 0x234
// Size: 0xc6
function function_3c26e63df0ff0308( params )
{
    bundle = level.perkbundles[ "specialty_perceptive" ];
    
    if ( !isdefined( bundle ) )
    {
        return;
    }
    
    if ( !function_c28ff33f9f675615() )
    {
        function_79901b4637c83c86( #"hash_dd58a067fa442c02" );
        return;
    }
    
    if ( isfunction( params.var_a2358848c4408242 ) )
    {
        level [[ params.var_a2358848c4408242 ]]( "specialty_spykitimmune" );
        level [[ params.var_a2358848c4408242 ]]( "specialty_enemyradar" );
    }
    
    if ( isfunction( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_perceptive", &function_b7859637d451072d, &function_843d313baf837998, [ "specialty_spykitimmune", "specialty_enemyradar" ] );
    }
}

// Namespace perceptive
// Params 0
// Checksum 0xeac01a8e, Offset: 0x302
// Size: 0x31
function function_b7859637d451072d()
{
    self setclientomnvar( "ui_perceptive", 0 );
    self setclientomnvar( "ui_perceptive_indicator", 0 );
    thread function_be8ee01e0f29f957();
    self notify( "perceptive_count_update" );
    level notify( "uav_update" );
}

// Namespace perceptive
// Params 0
// Checksum 0x40fae112, Offset: 0x33b
// Size: 0x2a
function function_843d313baf837998()
{
    self notify( "perceptive_unset" );
    self setclientomnvar( "ui_perceptive", 0 );
    self setclientomnvar( "ui_perceptive_indicator", 0 );
    level notify( "uav_update" );
}

// Namespace perceptive
// Params 1
// Checksum 0x81e049bb, Offset: 0x36d
// Size: 0x4d
function function_42bca1267728522d( ent )
{
    if ( !isdefined( self.var_e05c483acdc9f920 ) )
    {
        self.var_e05c483acdc9f920 = [];
    }
    
    self.var_e05c483acdc9f920[ ent.entnum ?? utility::function_6ed37478a8ad7320( ent ) ] = 1;
    self notify( "perceptive_count_update" );
}

// Namespace perceptive
// Params 1
// Checksum 0xd1d384d7, Offset: 0x3c2
// Size: 0x34
function function_13b9243f3f43b0e9( ent )
{
    self.var_e05c483acdc9f920[ ent.entnum ?? utility::function_6ed37478a8ad7320( ent ) ] = undefined;
    self notify( "perceptive_count_update" );
}

// Namespace perceptive
// Params 0
// Checksum 0x25b9f548, Offset: 0x3fe
// Size: 0x4b
function function_be8ee01e0f29f957()
{
    self endon( "death_or_disconnect" );
    self endon( "perceptive_unset" );
    
    while ( true )
    {
        message = utility::waittill_any_ents_return( self, "perceptive_count_update", self, "spotted_by_enemy_radar", self, "unspotted_by_enemy_radar", level, "uav_update" );
        thread function_7e790850c62da1ed();
    }
}

// Namespace perceptive
// Params 0
// Checksum 0x43a70f5c, Offset: 0x451
// Size: 0xe, Type: bool
function function_ed771d0ba08e754b()
{
    return self.var_e05c483acdc9f920.size > 0;
}

// Namespace perceptive
// Params 0
// Checksum 0x8eb9e4f3, Offset: 0x468
// Size: 0x111
function function_7e790850c62da1ed()
{
    self notify( "46bf2a828e21db8c" );
    self endon( "46bf2a828e21db8c" );
    self endon( "death_or_disconnect" );
    self endon( "perceptive_unset" );
    
    if ( !isplayer( self ) || !isalive( self ) )
    {
        return;
    }
    
    bundle = level.perkbundles[ "specialty_perceptive" ];
    var_9c3c75f868103ee2 = bundle.var_9c3c75f868103ee2 ?? 0.1;
    
    if ( function_ed771d0ba08e754b() || self function_8853dae8990d54be() || killstreak_utility::function_aff5860402b132d7( self.team ) )
    {
        self.var_52f69de1575f545b = undefined;
        
        if ( !self getclientomnvar( "ui_perceptive" ) )
        {
            self setclientomnvar( "ui_perceptive", 1 );
            self setclientomnvar( "ui_perceptive_indicator", 1 );
        }
        
        return;
    }
    
    if ( self getclientomnvar( "ui_perceptive" ) )
    {
        self.var_52f69de1575f545b = 1;
        wait var_9c3c75f868103ee2;
        
        if ( self.var_52f69de1575f545b )
        {
            self setclientomnvar( "ui_perceptive", 0 );
            self setclientomnvar( "ui_perceptive_indicator", 0 );
            self.var_52f69de1575f545b = undefined;
        }
    }
}

