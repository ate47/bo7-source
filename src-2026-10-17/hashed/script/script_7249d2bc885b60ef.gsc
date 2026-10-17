#using script_359b0b3edb7487ee;

#namespace zombie_ranged_attack;

// Namespace zombie_ranged_attack
// Params 0
// Checksum 0x2e673398, Offset: 0x76
// Size: 0xb4
function init_zombie_ranged_attack()
{
    if ( !self.zombieaisettings.var_61f7cb9d1effbf0a )
    {
        return;
    }
    
    thread function_c1583b59d9b9ef64();
    self._blackboard.var_3c7d7ae944556d92 = int( self.zombieaisettings.var_26c04115883926d8 * 1000 );
    self._blackboard.var_3c5a84e9442f3bd8 = int( self.zombieaisettings.var_26e35715885f9ef2 * 1000 );
    self._blackboard.var_d751dec818290f98 = self.zombieaisettings.var_9d909c03fc59c1b1;
    self.var_7f8ab9bb9f4957fc = &function_2408adb3cab0c16c;
}

// Namespace zombie_ranged_attack
// Params 0
// Checksum 0xfdda5276, Offset: 0x132
// Size: 0x16, Type: bool
function is_in_ranged_attack()
{
    return istrue( self._blackboard.zombieunreachableisattacking );
}

// Namespace zombie_ranged_attack
// Params 0
// Checksum 0xab8c4067, Offset: 0x151
// Size: 0x40
function force_ranged_attack()
{
    self._blackboard.zombieunreachableisattacking = 1;
    self._blackboard.var_7ba1c73f07fdd7ae = randomint( 2 ) == 0;
    self notify( #"ranged_attack_enemy_start" );
}

// Namespace zombie_ranged_attack
// Params 0, eflags: 0x4
// Checksum 0x29952851, Offset: 0x199
// Size: 0x33
function private function_c1583b59d9b9ef64()
{
    self endon( #"death" );
    
    while ( true )
    {
        self waittill( #"ranged_attack_enemy_start" );
        zombie_ranged_attack_asm::function_8b1372bc3a2d158e( self.enemy );
    }
}

// Namespace zombie_ranged_attack
// Params 5, eflags: 0x4
// Checksum 0x5c8d9d4b, Offset: 0x1d4
// Size: 0xd2
function private function_2408adb3cab0c16c( idamage, eattacker, objweapon, smeansofdeath, vpoint )
{
    if ( eattacker.grenadeweapon && objweapon == eattacker.grenadeweapon )
    {
        if ( eattacker.zombieaisettings.var_794ee7b60b0d8ed5 && isdefined( eattacker.ranged_damage_multiplier ) )
        {
            idamage = int( ceil( idamage * eattacker.ranged_damage_multiplier ) );
            
            if ( eattacker.var_7977644af14eab4e )
            {
                idamage = minint( idamage, eattacker.maxdamagecap );
            }
        }
        else if ( isdefined( eattacker.var_ed7e32b499cce4e0 ) )
        {
            idamage = eattacker.var_ed7e32b499cce4e0;
        }
    }
    
    return idamage;
}

