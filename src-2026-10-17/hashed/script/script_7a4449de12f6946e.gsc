#using script_aa3bac81ad4fc8e;
#using scripts\common\callbacks;
#using scripts\common\system;
#using scripts\common\utility;
#using scripts\mp\weapons;

#namespace zm_bgb_all_hallows_eve;

// Namespace zm_bgb_all_hallows_eve
// Params 0, eflags: 0x5
// Checksum 0x942db08a, Offset: 0x1fa
// Size: 0x1d
function private autoexec __init__system__()
{
    system::register( "all_hallows_eve", #"bgb", &__init__, undefined );
}

// Namespace zm_bgb_all_hallows_eve
// Params 0
// Checksum 0xed60a8b5, Offset: 0x21f
// Size: 0x85
function __init__()
{
    bgb::register( "all_hallows_eve", "time", 180, &enable, &disable, undefined );
    callback::add( "on_zombie_ai_spawned", &on_ai_spawned );
    callback::add( "on_zombie_ai_killed", &on_ai_killed );
    callback::add( "on_zombie_ai_damaged", &on_ai_damaged );
    level._effect[ "bgb_ahe_eye" ] = loadfxasset( "vfx_t10_gameplay_zm_gobblegum_halloween_eye_glow" );
    level._effect[ "bgb_ahe_chunk" ] = loadfxasset( "vfx_t10_gameplay_zm_gobblegum_halloween_chunk" );
}

// Namespace zm_bgb_all_hallows_eve
// Params 0
// Checksum 0x75f3b9b9, Offset: 0x2ac
// Size: 0x2
function enable()
{
    
}

// Namespace zm_bgb_all_hallows_eve
// Params 0
// Checksum 0xc9163cda, Offset: 0x2b6
// Size: 0x2
function disable()
{
    
}

// Namespace zm_bgb_all_hallows_eve
// Params 1, eflags: 0x4
// Checksum 0xcf7ef111, Offset: 0x2c0
// Size: 0x11d
function private on_ai_spawned( params )
{
    level endon( #"game_ended" );
    self endon( #"disconnect" );
    
    if ( self.subclass === "zombie_base" )
    {
        var_8ac1f467353c2a1f = 0;
        
        foreach ( player in level.players )
        {
            if ( player bgb::is_enabled( "all_hallows_eve" ) )
            {
                var_8ac1f467353c2a1f = 1;
            }
        }
        
        if ( var_8ac1f467353c2a1f )
        {
            if ( isdefined( self.hatmodel ) )
            {
                self detach( self.hatmodel );
                self.hatmodel = undefined;
            }
            
            waitframe();
            self attach( "c_t10_zmb_zombie_jack_o_lantern_head", "j_head" );
            utility::function_7c10ea82c1e305b8( "bgb_all_hallows_eve", "jacko_eye_glow_on" );
            self.var_8ac1f467353c2a1f = 1;
        }
    }
}

// Namespace zm_bgb_all_hallows_eve
// Params 1, eflags: 0x4
// Checksum 0x59a8dedf, Offset: 0x3e5
// Size: 0x1f
function private on_ai_killed( params )
{
    if ( self.var_8ac1f467353c2a1f )
    {
        pop_chunks();
    }
}

// Namespace zm_bgb_all_hallows_eve
// Params 1, eflags: 0x4
// Checksum 0x296a8ffa, Offset: 0x40c
// Size: 0x5e
function private on_ai_damaged( params )
{
    if ( self.var_8ac1f467353c2a1f && ( params.shitloc == "head" || params.shitloc == "neck" || params.shitloc == "helmet" ) )
    {
        thread pop_chunks();
    }
}

// Namespace zm_bgb_all_hallows_eve
// Params 0
// Checksum 0xfa9e38a, Offset: 0x472
// Size: 0xc2
function pop_chunks()
{
    self notify( #"hash_1acd716b5a57f6ac" );
    self endon( #"hash_1acd716b5a57f6ac" );
    
    if ( self.var_8ac1f467353c2a1f )
    {
        self.var_8ac1f467353c2a1f = undefined;
        var_5b5783a1169629f1 = self.origin;
        
        if ( isdefined( self ) )
        {
            var_5b5783a1169629f1 = self gettagorigin( "j_head" );
            var_58f2978ef7e187f = self gettagangles( "j_head" );
            utility::function_7c10ea82c1e305b8( "bgb_all_hallows_eve", "jacko_eye_glow_off" );
        }
        
        playfx( level._effect[ "bgb_ahe_chunk" ], var_5b5783a1169629f1, anglestoforward( var_58f2978ef7e187f ), anglestoup( var_58f2978ef7e187f ) );
        
        if ( isdefined( self ) )
        {
            self playsound( #"hash_b226085ccd008067" );
            weapons::detachifattached( "c_t10_zmb_zombie_jack_o_lantern_head", "j_head" );
        }
    }
}

