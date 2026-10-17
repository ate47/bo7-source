#using script_7c5632db7555b4f5;
#using scripts\common\callbacks;
#using scripts\mp\zm\systems\zm_vo;

#namespace zm_sat_firefly_audio;

// Namespace zm_sat_firefly_audio
// Params 0
// Checksum 0xcbd9888b, Offset: 0x91
// Size: 0x2d
function main()
{
    level callback::add( "zone_changed", &on_zone_changed );
    zm_vo::function_55319be40b828f47( #"hash_82dd371e8c64b3f7", #"hash_c0867aed547e7e0c" );
}

// Namespace zm_sat_firefly_audio
// Params 1
// Checksum 0xe4e0ec62, Offset: 0xc6
// Size: 0x112
function on_zone_changed( params )
{
    var_d56981529221d44 = params.zone_struct.script_zone_name;
    var_e74a9e7fb261982 = params.previous_zone_struct.script_zone_name;
    var_518e20dbc0343c76 = issubstr( var_d56981529221d44, "zone_ts" );
    var_633db7feef39209f = issubstr( var_e74a9e7fb261982, "zone_ts" );
    
    if ( var_518e20dbc0343c76 )
    {
        if ( self.var_b93c209539a70a5d )
        {
            return;
        }
        
        thread function_7861c4e858088737();
        return;
    }
    
    if ( self.var_b93c209539a70a5d )
    {
        self.var_b93c209539a70a5d = undefined;
        musicbank_utility::function_4f253fd35ec68cbc( self, #"hash_a216637255b344e6" );
        self notify( #"hash_70e9ba6cb3253236" );
        
        if ( !isdefined( self.var_1eeff51a92cd099f ) )
        {
            self.var_1eeff51a92cd099f = 0;
        }
        
        if ( ( gettime() - self.var_1eeff51a92cd099f ) / 1000 < 4 )
        {
            return;
        }
        
        self playsoundtoplayer( #"hash_d7e586e30f82b279", self );
        self.var_1eeff51a92cd099f = gettime();
    }
}

// Namespace zm_sat_firefly_audio
// Params 0
// Checksum 0x60463ca6, Offset: 0x1e0
// Size: 0x60
function function_7861c4e858088737()
{
    self notify( #"hash_77771ad82e682ffb" );
    self endon( #"hash_77771ad82e682ffb" );
    self endon( #"death_or_disconnect" );
    self endon( #"hash_70e9ba6cb3253236" );
    self.var_b93c209539a70a5d = 1;
    
    while ( self.var_b93c209539a70a5d )
    {
        musicbank_utility::function_5aca66c390aa347d( self, #"hash_a216637255b344e6" );
        wait 2;
    }
}

