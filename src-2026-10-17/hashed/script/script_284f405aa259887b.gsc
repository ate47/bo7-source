#using script_5004300c8ee32b35;
#using scripts\common\callbacks;
#using scripts\common\math;
#using scripts\common\utility;

#namespace zombie_shade_dismemberment;

// Namespace zombie_shade_dismemberment
// Params 0
// Checksum 0xca977892, Offset: 0xe1
// Size: 0x29
function function_be94e63ff4741f52()
{
    zombie_dismemberment::init_zombie_dismemberment_global();
    callback::get_template( self.animsetname ) callback::add( "on_zombie_ai_damaged", &on_damaged_dismember );
}

// Namespace zombie_shade_dismemberment
// Params 0
// Checksum 0xd8cedc57, Offset: 0x112
// Size: 0x9
function init_zombie_shade_dismemberment()
{
    zombie_dismemberment::init_zombie_dismemberment();
}

// Namespace zombie_shade_dismemberment
// Params 1, eflags: 0x4
// Checksum 0xa760f766, Offset: 0x123
// Size: 0x36a
function private on_damaged_dismember( params )
{
    if ( !zombie_dismemberment::is_dismemberment_allowed( params.shitloc ) || weaponisimpaling( params.sweapon ) )
    {
        return;
    }
    
    is_lethal_dmg = params.idamage >= self.health;
    limb = zombie_dismemberment::function_7838e35455091288( params.shitloc );
    is_explosion = isexplosivedamagemod( params.smeansofdeath );
    
    if ( is_lethal_dmg && !is_friendly_damage( self, params.eattacker ) && !is_friendly_damage( self, params.einflictor ) )
    {
        if ( zombie_dismemberment::should_annihilate( params.eattacker, params.shitloc, params.sweapon, params.idamage ) )
        {
            zombie_dismemberment::dismember_annihilate();
            return;
        }
        
        if ( is_explosion )
        {
            zombie_dismemberment::function_14463e39cc414bab( is_lethal_dmg );
            
            if ( is_lethal_dmg && ( params.smeansofdeath != "MOD_PROJECTILE_SPLASH" && params.smeansofdeath != "MOD_PROJECTILE" && params.weaponelementtype != "fire" && params.sweapon.classname != "throwingknife" || function_94d6b4a927b1e0a0( params.sweapon ) ) )
            {
                self.forceragdollimmediate = 1;
                var_13605a17fee734d5 = getdvarfloat( @"hash_7203d10072b66cc9", 100 );
                var_dc1d9d7f5f172f31 = getdvarfloat( @"hash_b82aefef04f63ebd", 1500 );
                var_457399733c8f983c = getdvarfloat( @"hash_cd037fbfa057f118", 100 );
                var_24674a480ef455b6 = getdvarfloat( @"hash_6d2f434b6e94dbfa", 2500 );
                var_9d418738f90e5a0a = clamp( math::remap( distance( self.origin, params.vpoint ), 0, var_457399733c8f983c, 0, 1 ), 0, 1 );
                up_vector = ( 0, 0, 1 ) * ( var_dc1d9d7f5f172f31 + ( 1 - var_9d418738f90e5a0a ) * var_24674a480ef455b6 );
                self.ragdollimpactvector = ( params.vdir ?? ( 0, 0, 0 ) ) * var_13605a17fee734d5 + up_vector;
                self.ragdollhitloc = "torso_lower";
            }
            
            return;
        }
        
        if ( limb != 0 && limb != 1 )
        {
            zombie_dismemberment::dismember_limb( is_lethal_dmg, limb );
            return;
        }
        
        if ( randomint( 100 ) < 50 )
        {
            zombie_dismemberment::function_14463e39cc414bab( is_lethal_dmg );
            
            if ( randomint( 100 ) < 50 )
            {
                zombie_dismemberment::function_14463e39cc414bab( is_lethal_dmg );
            }
        }
        
        return;
    }
    
    health_percent = self.maxhealth > 0 ? self.health / self.maxhealth : 0;
    damage_percent = self.maxhealth > 0 ? params.idamage / self.maxhealth : 1;
    
    if ( limb == 16 )
    {
        if ( health_percent - damage_percent < self.zombieaisettings.var_b964a71d0bd52af && randomint( 100 ) < 50 )
        {
            zombie_dismemberment::dismember_limb( is_lethal_dmg, 16 );
        }
    }
}

// Namespace zombie_shade_dismemberment
// Params 2, eflags: 0x4
// Checksum 0xc99818a9, Offset: 0x495
// Size: 0x75, Type: bool
function private is_friendly_damage( agent, attacker )
{
    if ( isdefined( attacker ) && isdefined( agent ) && isdefined( agent.team ) )
    {
        if ( attacker.team == agent.team )
        {
            return true;
        }
        
        if ( attacker.owner.team == agent.team )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace zombie_shade_dismemberment
// Params 1, eflags: 0x4
// Checksum 0x9f535be6, Offset: 0x513
// Size: 0x2a, Type: bool
function private function_94d6b4a927b1e0a0( weapon )
{
    return utility::callsharedfunc( #"ai", #"hash_dc7f360ca2fd1558", weapon ) ?? 0;
}

