#using scripts\asm\asm;
#using scripts\common\utility;

#namespace namespace_fc42512b93069ac1;

// Namespace namespace_fc42512b93069ac1
// Params 1
// Checksum 0x52597361, Offset: 0x13d
// Size: 0xe3
function function_8b1372bc3a2d158e( target_ent )
{
    assert( isdefined( self.grenadeweapon ), "<dev string:x24>" );
    self.ranged_attack_target = target_ent;
    
    if ( isplayer( target_ent ) )
    {
        if ( target_ent function_ea1c30d42bd9c659() > self._blackboard.var_d751dec818290f98 )
        {
            self._blackboard.zombieunreachableisattacking = 0;
            return;
        }
    }
    
    if ( self.ranged_attack_cooldown > gettime() )
    {
        self._blackboard.zombieunreachableisattacking = 0;
        return;
    }
    
    if ( self.zombieaisettings.var_7502a7ba1077f41a > 0 )
    {
        self.ranged_attack_cooldown = gettime() + self.zombieaisettings.var_7502a7ba1077f41a * 1000;
    }
    
    asm::function_7256f5ba459c840b( "ranged_attack_in" );
    thread manage_ranged_attack( target_ent );
}

// Namespace namespace_fc42512b93069ac1
// Params 1, eflags: 0x4
// Checksum 0x448ed0fd, Offset: 0x228
// Size: 0xd5
function private manage_ranged_attack( ranged_target )
{
    self endon( #"death" );
    self endon( #"terminate_ranged_attack" );
    firing_head = utility::array_random( self.alive_heads );
    
    if ( !isdefined( self.projectile_attach_tag ) )
    {
        self.projectile_attach_tag = firing_head == "left_head" ? "j_head_le" : "j_head_ri";
    }
    
    childthread function_494a1e81933ebf28( firing_head );
    self waittill( #"fire_projectile" );
    
    if ( !isalive( ranged_target ) )
    {
        return;
    }
    
    target_point = ranged_target.origin + ( 0, 0, 40 );
    
    if ( ranged_target tagexists( "j_spine4" ) )
    {
        target_point = ranged_target gettagorigin( "j_spine4" );
    }
    
    function_bf22d281c4651259( target_point, ranged_target );
}

// Namespace namespace_fc42512b93069ac1
// Params 1, eflags: 0x4
// Checksum 0xccafb49, Offset: 0x305
// Size: 0x26
function private function_494a1e81933ebf28( firing_head )
{
    self waittill( #"mouth_glow" );
    self setscriptablepartstate( "spit", firing_head );
}

// Namespace namespace_fc42512b93069ac1
// Params 2, eflags: 0x4
// Checksum 0x6ed55df7, Offset: 0x333
// Size: 0x124
function private function_bf22d281c4651259( target_pos, ranged_target )
{
    if ( !isdefined( target_pos ) || self.var_7b145d55c609bb == level.weaponnone )
    {
        return;
    }
    
    thread function_30a6d2141f3a1af1( ranged_target );
    start_pos = self gettagorigin( self.projectile_attach_tag );
    to_target = target_pos - start_pos;
    
    if ( lengthsquared( to_target ) == 0 )
    {
        /#
            iprintln( "<dev string:x4d>" );
        #/
        
        return;
    }
    
    gravity = getdvarfloat( @"bg_gravity", 800 );
    time = length( ( to_target[ 0 ], to_target[ 1 ], 0 ) ) / 700;
    launch_speed_z = ( 0.5 * gravity * squared( time ) + to_target[ 2 ] ) / time;
    to_target = vectornormalize( ( to_target[ 0 ], to_target[ 1 ], 0 ) );
    velocity = ( to_target[ 0 ] * 700, to_target[ 1 ] * 700, launch_speed_z );
    magicgrenademanual( self.grenadeweapon, start_pos, velocity, self.zombieaisettings.var_f3ce124063bf11bf, self );
}

// Namespace namespace_fc42512b93069ac1
// Params 1, eflags: 0x4
// Checksum 0x190b4ed6, Offset: 0x45f
// Size: 0x3d
function private function_30a6d2141f3a1af1( ranged_target )
{
    if ( isplayer( ranged_target ) )
    {
        ranged_target function_884711fc94b10261();
    }
    
    utility::waittill_any( "terminate_ranged_attack", "death" );
    
    if ( isplayer( ranged_target ) )
    {
        ranged_target function_88a6736ac53d2a25();
    }
}

// Namespace namespace_fc42512b93069ac1
// Params 3
// Checksum 0xba27227b, Offset: 0x4a4
// Size: 0xdd
function function_c04fbb60d5f2546e( asmname, statename, params )
{
    target = self.ranged_attack_target;
    alias = "ranged_attack";
    
    if ( isdefined( target ) )
    {
        if ( target.origin[ 2 ] - self.origin[ 2 ] > 200 )
        {
            alias = "ranged_attack_high";
        }
        else
        {
            targetyaw = vectortoyaw( target.origin - self.origin );
            attackyaw = angleclamp180( self.angles[ 1 ] - targetyaw );
            
            if ( attackyaw < -25 )
            {
                alias = "ranged_attack_left";
            }
            else if ( attackyaw > 25 )
            {
                alias = "ranged_attack_right";
            }
        }
    }
    
    return asm::asm_lookupanimfromalias( statename, alias );
}

