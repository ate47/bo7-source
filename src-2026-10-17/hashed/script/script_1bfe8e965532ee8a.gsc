#using scripts\asm\asm;
#using scripts\common\utility;

#namespace namespace_ad26fae8b8e8dfb9;

// Namespace namespace_ad26fae8b8e8dfb9
// Params 0
// Checksum 0xb5883a44, Offset: 0x161
// Size: 0x10
function init_ranged_attack_asm()
{
    self.var_7f8ab9bb9f4957fc = &function_2408adb3cab0c16c;
}

// Namespace namespace_ad26fae8b8e8dfb9
// Params 1
// Checksum 0xd29427ba, Offset: 0x179
// Size: 0x11f
function function_8b1372bc3a2d158e( targets )
{
    if ( self.ranged_attack_cooldown > gettime() )
    {
        self._blackboard.zombieunreachableisattacking = 0;
        return;
    }
    
    if ( !isdefined( targets ) )
    {
        targets = [ self.ranged_attack_target ];
    }
    
    final_targets = [];
    
    foreach ( ranged_target in targets )
    {
        if ( isplayer( ranged_target ) )
        {
            if ( ranged_target function_ea1c30d42bd9c659() > self._blackboard.var_d751dec818290f98 )
            {
                continue;
            }
        }
        
        final_targets[ final_targets.size ] = ranged_target;
    }
    
    if ( final_targets.size == 0 )
    {
        self._blackboard.zombieunreachableisattacking = 0;
        return;
    }
    
    asm::function_7256f5ba459c840b( "ranged_attack_in" );
    thread manage_ranged_attack( final_targets );
}

// Namespace namespace_ad26fae8b8e8dfb9
// Params 1, eflags: 0x4
// Checksum 0xbb57b393, Offset: 0x2a0
// Size: 0x120
function private manage_ranged_attack( targets )
{
    self endon( #"death" );
    self endon( #"terminate_ranged_attack" );
    
    if ( !isdefined( self.projectile_attach_tag ) )
    {
        self.projectile_attach_tag = "tag_weakpoint_mouth";
    }
    
    self waittill( #"fire_projectile" );
    
    foreach ( ranged_target in targets )
    {
        if ( !isalive( ranged_target ) )
        {
            continue;
        }
        
        target_point = ranged_target.origin;
        
        if ( ranged_target tagexists( "j_spine4" ) )
        {
            target_point = ranged_target gettagorigin( "j_spine4" );
        }
        
        function_bf22d281c4651259( target_point, ranged_target );
    }
    
    self.ranged_attack_cooldown = gettime() + self.zombieaisettings.var_7502a7ba1077f41a * 1000;
}

// Namespace namespace_ad26fae8b8e8dfb9
// Params 2, eflags: 0x4
// Checksum 0x9ef2971c, Offset: 0x3c8
// Size: 0x114
function private function_bf22d281c4651259( target_pos, ranged_target )
{
    if ( !isdefined( target_pos ) )
    {
        return;
    }
    
    thread function_30a6d2141f3a1af1( ranged_target );
    start_pos = self gettagorigin( self.projectile_attach_tag );
    to_target = target_pos - start_pos;
    
    if ( lengthsquared( to_target ) == 0 )
    {
        /#
            iprintln( "<dev string:x24>" );
        #/
        
        return;
    }
    
    gravity = getdvarfloat( @"bg_lowgravity", 400 );
    time = length( ( to_target[ 0 ], to_target[ 1 ], 0 ) ) / 700;
    launch_speed_z = ( 0.5 * gravity * squared( time ) + to_target[ 2 ] ) / time;
    to_target = vectornormalize( ( to_target[ 0 ], to_target[ 1 ], 0 ) );
    e_grenade = magicgrenademanual( self.grenadeweapon, start_pos, ( to_target[ 0 ] * 700, to_target[ 1 ] * 700, launch_speed_z ), self.zombieaisettings.var_f3ce124063bf11bf, self );
    e_grenade thread function_62e129c11e94926b();
}

// Namespace namespace_ad26fae8b8e8dfb9
// Params 0, eflags: 0x4
// Checksum 0x8d86b50c, Offset: 0x4e4
// Size: 0x55
function private function_62e129c11e94926b()
{
    self endon( #"delay_death" );
    childthread delay_endon( "death" );
    self waittill( #"projectile_impact_player", hitent );
    
    if ( isplayer( hitent ) )
    {
        playfxontagforclients( utility::getfx( "player_hit_by_mimic_ranged_attack_fx" ), hitent, "j_head", hitent );
    }
}

// Namespace namespace_ad26fae8b8e8dfb9
// Params 5
// Checksum 0xdd24b30a, Offset: 0x541
// Size: 0x6f
function function_2408adb3cab0c16c( idamage, eattacker, objweapon, smeansofdeath, vpoint )
{
    if ( isdefined( eattacker.var_ed7e32b499cce4e0 ) && isdefined( eattacker.grenadeweapon ) && objweapon == eattacker.grenadeweapon )
    {
        idamage = eattacker.var_ed7e32b499cce4e0;
    }
    
    return idamage;
}

// Namespace namespace_ad26fae8b8e8dfb9
// Params 1, eflags: 0x4
// Checksum 0x7b0f5856, Offset: 0x5b9
// Size: 0x1e
function private delay_endon( string )
{
    self waittill( string );
    waitframe();
    self notify( "delay_" + string );
}

// Namespace namespace_ad26fae8b8e8dfb9
// Params 1, eflags: 0x4
// Checksum 0x32e50bae, Offset: 0x5df
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

// Namespace namespace_ad26fae8b8e8dfb9
// Params 4
// Checksum 0xdef5f6ec, Offset: 0x624
// Size: 0x81, Type: bool
function function_99d9ff5b13d4dc09( asmname, statename, tostatename, params )
{
    target = self.ranged_attack_target;
    
    if ( isdefined( target ) )
    {
        targetyaw = vectortoyaw( target.origin - self.origin );
        return ( abs( angleclamp180( self.angles[ 1 ] - targetyaw ) ) > 25 );
    }
    
    return false;
}

// Namespace namespace_ad26fae8b8e8dfb9
// Params 3
// Checksum 0x4b4801b9, Offset: 0x6ae
// Size: 0xe9
function function_867dbc92b8abf99a( asmname, statename, params )
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
    
    result = asm::asm_lookupanimfromalias( statename, alias );
    return result;
}

