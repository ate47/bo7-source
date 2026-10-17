#using scripts\asm\asm;
#using scripts\common\utility;

#namespace namespace_75a5bbd3a938f9df;

// Namespace namespace_75a5bbd3a938f9df
// Params 0
// Checksum 0x41ced039, Offset: 0x134
// Size: 0xf4
function function_8b1372bc3a2d158e()
{
    assert( isdefined( self.grenadeweapon ), "<dev string:x24>" );
    
    if ( isplayer( self.ranged_attack_target ) )
    {
        var_ce291a62e8536b99 = self.ranged_attack_target function_ab2359b30bdc3b6a( "spit_attack" );
        
        /#
            var_c338a9ae91c40768 = getdvarint( @"scr_parasite_debug", 0 ) == 3;
            
            if ( var_c338a9ae91c40768 )
            {
                debug_color = var_ce291a62e8536b99 >= self._blackboard.var_22b3c9556dff44b1 ? ( 1, 0, 0 ) : ( 0, 1, 0 );
                debugstar( self.origin, debug_color, 10, var_ce291a62e8536b99 );
            }
        #/
        
        if ( var_ce291a62e8536b99 >= self._blackboard.var_22b3c9556dff44b1 )
        {
            self._blackboard.zombieunreachableisattacking = 0;
            return;
        }
    }
    
    thread manage_ranged_attack();
}

// Namespace namespace_75a5bbd3a938f9df
// Params 0, eflags: 0x4
// Checksum 0xb8ef0842, Offset: 0x230
// Size: 0xea
function private manage_ranged_attack()
{
    self endon( #"death" );
    self endon( #"terminate_ranged_attack" );
    thread function_30a6d2141f3a1af1();
    
    if ( !self._blackboard.var_99f794dc99944d15 )
    {
        self.projectile_attach_tag = "j_tongue_01";
        
        if ( self.zombieaisettings.var_4d1ea9cb46a12ea6.size > 0 )
        {
            self.projectile_model = utility::array_random( self.zombieaisettings.var_4d1ea9cb46a12ea6 ).modelname;
        }
        
        spit_attack_cooldown = int( utility::function_4b74c15943231980( randomfloatrange( self.var_fe9bb2f0c2468d9a, self.var_95fe29c1ef1d5ac0 ) ) );
        self function_786bb6aa1b76c7ee( "ranged_attack_cooldown", spit_attack_cooldown );
        asm::function_7256f5ba459c840b( "ranged_attack_in" );
        thread function_bf22d281c4651259( self._blackboard.var_c894b0896ac6f7d );
    }
}

// Namespace namespace_75a5bbd3a938f9df
// Params 1, eflags: 0x4
// Checksum 0xf7dd0027, Offset: 0x322
// Size: 0x129
function private function_bf22d281c4651259( projectile_velocity )
{
    self endon( #"death" );
    self endon( #"terminate_ranged_attack" );
    
    if ( !isdefined( projectile_velocity ) )
    {
        return;
    }
    
    thread function_494a1e81933ebf28();
    self waittill( #"launch_grenade_start" );
    start_pos = self gettagorigin( self.projectile_attach_tag );
    ranged_weapon = self.grenadeweapon;
    
    if ( isdefined( self.ranged_attack_target ) )
    {
        var_12095e4a686b23f2 = self function_d5e40e88a4ac1386( ranged_weapon, self.ranged_attack_target, 0, 0 );
        projectile_velocity = var_12095e4a686b23f2 ?? projectile_velocity;
    }
    
    grenade = magicgrenademanual( ranged_weapon, start_pos, projectile_velocity, 8, self );
    grenade.angles = self gettagangles( self.projectile_attach_tag );
    
    if ( isdefined( self.projectile_model ) )
    {
        grenade setmodel( self.projectile_model );
    }
    
    if ( isdefined( self.var_9202ed60c8e01258 ) )
    {
        grenade.var_9202ed60c8e01258 = self.var_9202ed60c8e01258;
    }
    
    grenade utility::function_32b24db3127bff40( "spit", "aerial" );
    grenade thread function_62e129c11e94926b();
}

// Namespace namespace_75a5bbd3a938f9df
// Params 0, eflags: 0x4
// Checksum 0x6413dbc9, Offset: 0x453
// Size: 0x96
function private function_62e129c11e94926b()
{
    self endon( #"delay_death" );
    childthread delay_endon( "death" );
    self waittill( #"explode", origin, var_4cd1a139c1b0c2b7 );
    normal = isvector( var_4cd1a139c1b0c2b7 ) ? var_4cd1a139c1b0c2b7 : undefined;
    var_2f7ee79efdc2bbec = utility::function_e153375527829ec3( self.var_9202ed60c8e01258, "parasite_spit_attack_impact_fx" );
    var_62e858c45bbf3f11 = utility::getfx( var_2f7ee79efdc2bbec );
    
    if ( var_62e858c45bbf3f11 )
    {
        playfx( var_62e858c45bbf3f11, origin, undefined, normal );
    }
}

// Namespace namespace_75a5bbd3a938f9df
// Params 1, eflags: 0x4
// Checksum 0x6adf7e30, Offset: 0x4f1
// Size: 0x1e
function private delay_endon( string )
{
    self waittill( string );
    waitframe();
    self notify( "delay_" + string );
}

// Namespace namespace_75a5bbd3a938f9df
// Params 0, eflags: 0x4
// Checksum 0x6e9f1e6d, Offset: 0x517
// Size: 0x6f
function private function_30a6d2141f3a1af1()
{
    ranged_target = self.ranged_attack_target;
    
    if ( isplayer( ranged_target ) )
    {
        ranged_target function_884711fc94b10261();
        ranged_target function_a58e1bd7ca9f6222( "spit_attack" );
    }
    
    utility::waittill_any( "terminate_ranged_attack", "death" );
    
    if ( isdefined( self ) )
    {
        self.projectile_attach_tag = undefined;
    }
    
    if ( isplayer( ranged_target ) )
    {
        ranged_target function_88a6736ac53d2a25();
        ranged_target function_31d0b50675d9d6e( "spit_attack" );
    }
}

// Namespace namespace_75a5bbd3a938f9df
// Params 1, eflags: 0x4
// Checksum 0xe9e31c97, Offset: 0x58e
// Size: 0x67
function private function_5759eea0c8acb088( duration )
{
    self notify( #"hash_39b8ae7d85af7801" );
    self endon( #"hash_39b8ae7d85af7801" );
    
    if ( self.b_invisible )
    {
        return;
    }
    
    self endon( #"death" );
    utility::function_32b24db3127bff40( "spit", "glow" );
    wait duration;
    
    if ( isdefined( self ) )
    {
        utility::function_32b24db3127bff40( "spit", "idle" );
    }
}

// Namespace namespace_75a5bbd3a938f9df
// Params 0, eflags: 0x4
// Checksum 0xa15aa841, Offset: 0x5fd
// Size: 0x30
function private function_494a1e81933ebf28()
{
    self endon( #"death" );
    self endon( #"terminate_ranged_attack" );
    self waittill( #"mouth_glow" );
    thread function_5759eea0c8acb088( 1 );
}

