#using script_151f9510acfc6ac9;
#using script_3c932a9341d37f4e;
#using script_4c628d19ac1a7128;
#using script_4fc8c3b82dff2cee;
#using script_6c2f6a14fa53759e;
#using script_7b959fbe197bb9da;
#using script_7e916efe0ee8c563;
#using scripts\common\callbacks;
#using scripts\common\utility;

#namespace zombie_ghoul;

// Namespace zombie_ghoul
// Params 2
// Checksum 0x68d0c33e, Offset: 0x352
// Size: 0x27
function precache( classname, aitypescriptbundle )
{
    zombie_ghoul_blast_attack::precache( aitypescriptbundle );
    zombie_ghoul_evolve::precache( aitypescriptbundle );
}

// Namespace zombie_ghoul
// Params 1, eflags: 0x4
// Checksum 0xd18ef454, Offset: 0x381
// Size: 0x208
function private function_ae4f5cd736d03eba( params )
{
    zombie_melee::init_zombie_melee_global();
    zombie_ghoul_blast_attack::function_bb2be6939cc4c949();
    zombie_ghoul_evolve::function_7cf79a3bca1e2c3b();
    zombie_ghoul_medal::function_c4fe4b7bc84836a7();
    callback::get_template( self.animsetname ) callback::add( "killed_body_cloned", &play_death_fx );
    callback::get_template( self.animsetname ) callback::add( "on_zombie_ai_killed", &function_87bf03dfb0c714e7 );
    callback::get_template( self.animsetname ) callback::add( "on_turned", &function_fd7643c56d126ffd );
    callback::get_template( self.animsetname ) callback::add( "on_brainrot_end", &function_97a1453ff3d9f383 );
    callback::get_template( self.animsetname ) callback::add( "shocked", &function_ce4fe5b7b95b73f6 );
    callback::get_template( self.animsetname ) callback::add( "shocked_end", &function_f8cbef2738adcd18 );
    callback::get_template( self.animsetname ) callback::add( "poisoned", &function_91e753b101229a2 );
    callback::get_template( self.animsetname ) callback::add( "poisoned_end", &function_8c2a60ae74d8ce34 );
    callback::get_template( self.animsetname ) callback::add( "wraith_burned", &function_9a92f215ba32b261 );
    callback::get_template( self.animsetname ) callback::add( "wraith_burned_end", &function_c9afe0de75edf987 );
    callback::get_template( self.animsetname ) callback::add( "burned", &function_2080c9a8a657bc17 );
    callback::get_template( self.animsetname ) callback::add( "burned_end", &function_ef6cb4c9a207699d );
    callback::get_template( self.animsetname ) callback::add( "napalm_burned", &function_2b8879e19ccaeef3 );
    callback::get_template( self.animsetname ) callback::add( "napalm_burned_thermite", &function_aa4be0297708a8fa );
    callback::get_template( self.animsetname ) callback::add( "napalm_burned_end", &function_8b959aabb4069e99 );
}

// Namespace zombie_ghoul
// Params 1
// Checksum 0x4a726784, Offset: 0x591
// Size: 0xa7
function function_cffea90c0041bae7( taskid )
{
    assert( isdefined( self.zombieaisetting ) );
    zombie_init::zombie_init_ai( self.zombieaisetting );
    zombie_melee::init_zombie_melee();
    zombie_ghoul_blast_attack::init_zombie_ghoul_blast_attack();
    zombie_ghoul_evolve::init_zombie_ghoul_evolve();
    init_zombie_ghoul_ranged_attack();
    callback::add( "on_first_ai_init", &function_ae4f5cd736d03eba );
    self.alive_heads = [ "left_head", "right_head" ];
    thread initscriptable();
    
    if ( !isdefined( level.var_3f7c286049c0018c ) )
    {
        level.var_3f7c286049c0018c = 0;
    }
    
    level.var_3f7c286049c0018c++;
    return anim.success;
}

// Namespace zombie_ghoul
// Params 0, eflags: 0x4
// Checksum 0xfd25a551, Offset: 0x641
// Size: 0x62
function private initscriptable()
{
    self endon( #"death" );
    utility::flag_wait( "scriptables_ready" );
    waitframe();
    utility::function_32b24db3127bff40( "base", self.var_50b2eb7be2a4c8b0 ? "base_lite" : "base_on" );
    utility::function_32b24db3127bff40( "left_head", "attached" );
    utility::function_32b24db3127bff40( "right_head", "attached" );
}

// Namespace zombie_ghoul
// Params 1
// Checksum 0x28b34b0c, Offset: 0x6ab
// Size: 0x2a
function function_87bf03dfb0c714e7( params )
{
    level.var_3f7c286049c0018c = int( max( level.var_3f7c286049c0018c - 1, 0 ) );
}

// Namespace zombie_ghoul
// Params 1, eflags: 0x4
// Checksum 0x410dd290, Offset: 0x6dd
// Size: 0x18c
function private play_death_fx( params )
{
    body = zombie_utils::function_4e99fb1239980783( params );
    
    if ( isdefined( body ) )
    {
        body endon( #"corpse_deleted" );
        body setcorpsecanremovetimer( 5 );
        
        if ( self.forceannihilate )
        {
            body callback::callback( "on_annihilated" );
            body utility::function_32b24db3127bff40( "death_explode", "death_annihilate" );
            waitframe();
            body delete();
            return;
        }
        
        body utility::function_32b24db3127bff40( "death_explode", "start_explode" );
        
        if ( isdefined( self.var_bd22ba6c600a23a3 ) )
        {
            body.var_bd22ba6c600a23a3 = self.var_bd22ba6c600a23a3;
            body.team = self.var_bd22ba6c600a23a3.team;
            body.brainrot_kills = self.brainrot_kills;
        }
        
        b_explode = 1;
        n_dist = self.var_41445aa8a5b2dd95;
        n_damage = self.death_blast_attack_damage_player;
        wait_time = self.death_fx_wait_time ?? 2.9;
        
        if ( utility::ent_flag( "dissolve_purple" ) )
        {
            b_explode = 0;
            body utility::function_32b24db3127bff40( "reveal_death_purple", "reveal_death_purple" );
        }
        else
        {
            wait 0.1;
        }
        
        wait wait_time;
        
        if ( b_explode )
        {
            body notify( #"explode" );
            body zombie_ghoul_blast_attack::function_6de7b88d25e1e604( n_dist, -1, n_damage );
        }
        
        body hide();
        wait 0.1;
        body delete();
    }
}

// Namespace zombie_ghoul
// Params 1, eflags: 0x4
// Checksum 0x506dc199, Offset: 0x871
// Size: 0x1d
function private function_ce4fe5b7b95b73f6( var_e413418973ad5ea2 )
{
    utility::function_32b24db3127bff40( "shocked", "shocked_on" );
}

// Namespace zombie_ghoul
// Params 1, eflags: 0x4
// Checksum 0xc7fc6629, Offset: 0x896
// Size: 0x1d
function private function_f8cbef2738adcd18( var_e413418973ad5ea2 )
{
    utility::function_7c10ea82c1e305b8( "shocked", "shocked_off" );
}

// Namespace zombie_ghoul
// Params 1, eflags: 0x4
// Checksum 0x37d34505, Offset: 0x8bb
// Size: 0x1d
function private function_91e753b101229a2( s_burn_effect )
{
    utility::function_32b24db3127bff40( "poisoned", "poisoned_on" );
}

// Namespace zombie_ghoul
// Params 1, eflags: 0x4
// Checksum 0xa932705, Offset: 0x8e0
// Size: 0x29
function private function_8c2a60ae74d8ce34( s_burn_effect )
{
    utility::ent_flag_clear( "poisoned" );
    utility::function_7c10ea82c1e305b8( "poisoned", "poisoned_off" );
}

// Namespace zombie_ghoul
// Params 1, eflags: 0x4
// Checksum 0xcca196c6, Offset: 0x911
// Size: 0x1d
function private function_9a92f215ba32b261( s_burn_effect )
{
    utility::function_32b24db3127bff40( "wraith_burned", "wraith_burned_on" );
}

// Namespace zombie_ghoul
// Params 1, eflags: 0x4
// Checksum 0x700ec96d, Offset: 0x936
// Size: 0x29
function private function_c9afe0de75edf987( s_burn_effect )
{
    utility::ent_flag_clear( "wraith_burned" );
    utility::function_7c10ea82c1e305b8( "wraith_burned", "wraith_burned_off" );
}

// Namespace zombie_ghoul
// Params 1, eflags: 0x4
// Checksum 0x81c9ca3c, Offset: 0x967
// Size: 0x3f
function private function_2080c9a8a657bc17( s_burn_effect )
{
    str_variant = s_burn_effect.str_variant ?? "";
    utility::function_32b24db3127bff40( "burned" + str_variant, "burned_on" );
}

// Namespace zombie_ghoul
// Params 1, eflags: 0x4
// Checksum 0x923fe132, Offset: 0x9ae
// Size: 0x3f
function private function_ef6cb4c9a207699d( s_burn_effect )
{
    str_variant = s_burn_effect.str_variant ?? "";
    utility::function_32b24db3127bff40( "burned" + str_variant, "burned_off" );
}

// Namespace zombie_ghoul
// Params 1, eflags: 0x4
// Checksum 0x781f6a87, Offset: 0x9f5
// Size: 0x1d
function private function_2b8879e19ccaeef3( s_burn_effect )
{
    utility::function_32b24db3127bff40( "napalm_burned", "napalm_burned_on" );
}

// Namespace zombie_ghoul
// Params 1, eflags: 0x4
// Checksum 0x1ef6c727, Offset: 0xa1a
// Size: 0x1d
function private function_aa4be0297708a8fa( s_burn_effect )
{
    utility::function_32b24db3127bff40( "napalm_burned", "napalm_burned_on_thermite" );
}

// Namespace zombie_ghoul
// Params 1, eflags: 0x4
// Checksum 0x1216de1, Offset: 0xa3f
// Size: 0x1d
function private function_8b959aabb4069e99( s_burn_effect )
{
    utility::function_7c10ea82c1e305b8( "napalm_burned", "napalm_burned_off" );
}

// Namespace zombie_ghoul
// Params 1, eflags: 0x4
// Checksum 0x5a286594, Offset: 0xa64
// Size: 0x43
function private function_fd7643c56d126ffd( attacker )
{
    zombie_utils::function_a8ce00e0448cb6f0( "sprint", "turned", 26 );
    utility::function_32b24db3127bff40( "brainrot", "brainrot_on" );
    
    if ( self.enablespreading )
    {
        self enableavoidance( 0 );
    }
}

// Namespace zombie_ghoul
// Params 1, eflags: 0x4
// Checksum 0x35ab9896, Offset: 0xaaf
// Size: 0x20
function private function_97a1453ff3d9f383( params )
{
    if ( self.enablespreading )
    {
        self enableavoidance( 1 );
    }
}

// Namespace zombie_ghoul
// Params 0
// Checksum 0x72633b39, Offset: 0xad7
// Size: 0x9c
function init_zombie_ghoul_ranged_attack()
{
    thread function_c1583b59d9b9ef64();
    self._blackboard.var_3c7d7ae944556d92 = int( self.zombieaisettings.var_26c04115883926d8 * 1000 );
    self._blackboard.var_3c5a84e9442f3bd8 = int( self.zombieaisettings.var_26e35715885f9ef2 * 1000 );
    self._blackboard.var_d751dec818290f98 = self.zombieaisettings.var_9d909c03fc59c1b1;
    self.var_7f8ab9bb9f4957fc = &function_2408adb3cab0c16c;
}

// Namespace zombie_ghoul
// Params 0, eflags: 0x4
// Checksum 0xa2e12b71, Offset: 0xb7b
// Size: 0x33
function private function_c1583b59d9b9ef64()
{
    self endon( #"death" );
    
    while ( true )
    {
        self waittill( #"ranged_attack_enemy_start" );
        namespace_fc42512b93069ac1::function_8b1372bc3a2d158e( self.enemy );
    }
}

// Namespace zombie_ghoul
// Params 5, eflags: 0x4
// Checksum 0x9eac1f1, Offset: 0xbb6
// Size: 0x6f
function private function_2408adb3cab0c16c( idamage, eattacker, objweapon, smeansofdeath, vpoint )
{
    if ( isdefined( eattacker.var_ed7e32b499cce4e0 ) && isdefined( eattacker.grenadeweapon ) && objweapon == eattacker.grenadeweapon )
    {
        idamage = eattacker.var_ed7e32b499cce4e0;
    }
    
    return idamage;
}

