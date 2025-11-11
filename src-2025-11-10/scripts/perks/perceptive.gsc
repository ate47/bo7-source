#using scripts\common\callbacks;
#using scripts\common\script;
#using scripts\cp_mp\utility\killstreak_utility;
#using scripts\engine\utility;

#namespace perceptive;

// Namespace perceptive
// Params 0, eflags: 0x1
// Checksum 0xc852b59a, Offset: 0x1a9
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
// Checksum 0x950f5170, Offset: 0x249
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
// Checksum 0xb8347b58, Offset: 0x317
// Size: 0x39
function function_b7859637d451072d()
{
    self setclientomnvar( o"ui_perceptive", 0 );
    self setclientomnvar( o"ui_perceptive_indicator", 0 );
    thread function_be8ee01e0f29f957();
    self notify( "perceptive_count_update" );
    level notify( "uav_update" );
}

// Namespace perceptive
// Params 0
// Checksum 0x85ea6e7, Offset: 0x358
// Size: 0x32
function function_843d313baf837998()
{
    self notify( "perceptive_unset" );
    self setclientomnvar( o"ui_perceptive", 0 );
    self setclientomnvar( o"ui_perceptive_indicator", 0 );
    level notify( "uav_update" );
}

// Namespace perceptive
// Params 1
// Checksum 0xed8a29de, Offset: 0x392
// Size: 0x50
function function_42bca1267728522d( entnum )
{
    if ( !isnumber( entnum ) )
    {
        script::demoforcesre( "EntNum is not a number." );
        return;
    }
    
    if ( !isdefined( self.var_e05c483acdc9f920 ) )
    {
        self.var_e05c483acdc9f920 = [];
    }
    
    self.var_e05c483acdc9f920[ entnum ] = 1;
    self notify( "perceptive_count_update" );
}

// Namespace perceptive
// Params 1
// Checksum 0xb99ed4fa, Offset: 0x3ea
// Size: 0x37
function function_13b9243f3f43b0e9( entnum )
{
    if ( !isnumber( entnum ) )
    {
        script::demoforcesre( "EntNum is not a number." );
        return;
    }
    
    self.var_e05c483acdc9f920[ entnum ] = undefined;
    self notify( "perceptive_count_update" );
}

// Namespace perceptive
// Params 0
// Checksum 0x23555796, Offset: 0x429
// Size: 0x53
function function_be8ee01e0f29f957()
{
    self endon( "death_or_disconnect" );
    self endon( "perceptive_unset" );
    
    while ( true )
    {
        message = utility::waittill_any_ents_return( self, "perceptive_count_update", self, "spotted_by_enemy_radar", self, "unspotted_by_enemy_radar", level, "uav_update", self, "weapon_fired" );
        thread function_7e790850c62da1ed( message );
    }
}

// Namespace perceptive
// Params 0
// Checksum 0x47803dc2, Offset: 0x484
// Size: 0xe, Type: bool
function function_ed771d0ba08e754b()
{
    return self.var_e05c483acdc9f920.size > 0;
}

// Namespace perceptive
// Params 1
// Checksum 0xf8b95a98, Offset: 0x49b
// Size: 0xdd
function function_7e790850c62da1ed( message )
{
    self notify( "8e5d46e0efb3abf8" );
    self endon( "8e5d46e0efb3abf8" );
    
    if ( !isplayer( self ) || !isalive( self ) )
    {
        return;
    }
    
    if ( message == "weapon_fired" && gettime() - ( self.var_5a4003bfe509b071 ?? 0 ) <= 100 )
    {
        function_721efc2ed2c55396();
        thread function_4abe49a4ee09ce28( level.perkbundles[ "specialty_perceptive" ].var_9c3c75f868103ee2 ?? 0.1 );
        return;
    }
    
    if ( function_ed771d0ba08e754b() || self function_8853dae8990d54be() || killstreak_utility::function_aff5860402b132d7( self.team ) )
    {
        function_721efc2ed2c55396();
        return;
    }
    
    thread function_4abe49a4ee09ce28( level.perkbundles[ "specialty_perceptive" ].var_9c3c75f868103ee2 ?? 0.1 );
}

// Namespace perceptive
// Params 0
// Checksum 0xc7b458fc, Offset: 0x580
// Size: 0x3e
function function_721efc2ed2c55396()
{
    self notify( "perceptiveActivated" );
    
    if ( !self getclientomnvar( o"ui_perceptive" ) )
    {
        self setclientomnvar( o"ui_perceptive", 1 );
        self setclientomnvar( o"ui_perceptive_indicator", 1 );
    }
}

// Namespace perceptive
// Params 1
// Checksum 0xd1307f0c, Offset: 0x5c6
// Size: 0x46
function function_4abe49a4ee09ce28( delay )
{
    if ( delay )
    {
        self endon( "death_or_disconnect", "perceptive_unset", "perceptiveActivated" );
        wait delay;
    }
    
    self setclientomnvar( o"ui_perceptive", 0 );
    self setclientomnvar( o"ui_perceptive_indicator", 0 );
}

