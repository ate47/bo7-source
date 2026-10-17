#using script_10b2574ee87e16b0;
#using script_12cac594068d4e8d;
#using script_151f9510acfc6ac9;
#using script_2dfa5ec484fda770;
#using script_41b1474d00ad9bdd;
#using script_62e7adba38537fff;
#using script_6c2f6a14fa53759e;
#using script_7e916efe0ee8c563;
#using scripts\common\callbacks;
#using scripts\common\utility;

#namespace zombie_loom_minion;

// Namespace zombie_loom_minion
// Params 2
// Checksum 0x8aa7f0b4, Offset: 0x301
// Size: 0x1e
function precache( classname, aitypescriptbundle )
{
    zombie_loom_minion_ranged_attack::function_ad0f6ba5cb0ba286( aitypescriptbundle );
}

// Namespace zombie_loom_minion
// Params 1, eflags: 0x4
// Checksum 0x5bf5fdb6, Offset: 0x327
// Size: 0x1d6
function private function_f8cdf8e79ef07eb1( params )
{
    zombie_loom_minion_audio::function_21b025ba754e4741();
    zombie_melee::init_zombie_melee_global();
    zombie_loom_minion_leap_attack::function_1f3fb977dca576aa();
    zombie_loom_minion_ranged_attack::function_881c914a4f3b43ab();
    zombie_loom_minion_medal::function_4c300e7d7d59919e();
    zombie_loom_minion_web::function_e5c4221a1bd3de40();
    callback::get_template( self.animsetname ) callback::add( "killed_body_cloned", &play_death_fx );
    callback::get_template( self.animsetname ) callback::add( "on_turned", &function_893bd0412b7bf147 );
    callback::get_template( self.animsetname ) callback::add( "poisoned", &function_91e753b101229a2 );
    callback::get_template( self.animsetname ) callback::add( "poisoned_end", &function_8c2a60ae74d8ce34 );
    callback::get_template( self.animsetname ) callback::add( "wraith_burned", &function_9a92f215ba32b261 );
    callback::get_template( self.animsetname ) callback::add( "wraith_burned_end", &function_c9afe0de75edf987 );
    callback::get_template( self.animsetname ) callback::add( "burned", &function_2080c9a8a657bc17 );
    callback::get_template( self.animsetname ) callback::add( "burned_end", &function_ef6cb4c9a207699d );
    callback::get_template( self.animsetname ) callback::add( "napalm_burned", &function_2b8879e19ccaeef3 );
    callback::get_template( self.animsetname ) callback::add( "napalm_burned_thermite", &function_aa4be0297708a8fa );
    callback::get_template( self.animsetname ) callback::add( "napalm_burned_end", &function_8b959aabb4069e99 );
    callback::get_template( self.animsetname ) callback::add( "shocked", &function_ce4fe5b7b95b73f6 );
    callback::get_template( self.animsetname ) callback::add( "shocked_end", &function_f8cbef2738adcd18 );
}

// Namespace zombie_loom_minion
// Params 1
// Checksum 0xe53a44e6, Offset: 0x505
// Size: 0xe9
function function_8c30141cd5f1d75( taskid )
{
    assert( isdefined( self.zombieaisetting ) );
    zombie_init::zombie_init_ai( self.zombieaisetting );
    assert( isdefined( self.zombieaisettings.var_d3de1a9faac42deb ) );
    callback::add( "on_first_ai_init", &function_f8cdf8e79ef07eb1 );
    self.allowpain = 0;
    self.noragdoll = 1;
    self.melee_state = "bite_attack_in";
    zombie_melee::function_2cc3729a3cdeadbf( "walk", 100 );
    zombie_melee::function_2cc3729a3cdeadbf( "run", 120 );
    self setsafemodel( self.zombieaisettings.var_d3de1a9faac42deb.arachnophobiaxmodel );
    zombie_loom_minion_audio::init_zombie_loom_minion_audio();
    zombie_melee::init_zombie_melee();
    zombie_loom_minion_leap_attack::init_zombie_loom_minion_leap_attack();
    zombie_loom_minion_ranged_attack::init_zombie_loom_minion_ranged_attack();
    thread initscriptable();
    return anim.success;
}

// Namespace zombie_loom_minion
// Params 0, eflags: 0x4
// Checksum 0x5e4297e9, Offset: 0x5f7
// Size: 0x40
function private initscriptable()
{
    self endon( #"death" );
    utility::flag_wait( "scriptables_ready" );
    utility::waittill_any_timeout( level.framedurationseconds, "post_spawn" );
    utility::function_32b24db3127bff40( "base", "base_on" );
}

// Namespace zombie_loom_minion
// Params 1, eflags: 0x4
// Checksum 0x9325726b, Offset: 0x63f
// Size: 0x9a
function private play_death_fx( params )
{
    is_disc_thrown = self getaiblackboarddynamic( "death_disc_thrown" );
    body = zombie_utils::function_4e99fb1239980783( params );
    utility::function_32b24db3127bff40( "base", "base_off" );
    
    if ( isdefined( body ) )
    {
        body endon( #"corpse_deleted" );
        
        if ( is_disc_thrown )
        {
            body waittill( #"corpse_thrown_explode" );
        }
        
        body callback::callback( "on_annihilated" );
        body utility::function_32b24db3127bff40( "death", "death_annihilate" );
        wait 0.08;
        body delete();
        return;
    }
}

// Namespace zombie_loom_minion
// Params 1, eflags: 0x4
// Checksum 0xdd11d6e0, Offset: 0x6e1
// Size: 0x30
function private function_893bd0412b7bf147( attacker )
{
    zombie_utils::function_a8ce00e0448cb6f0( "sprint", "turned", 26 );
    utility::function_32b24db3127bff40( "brainrot", "brainrot_on" );
}

// Namespace zombie_loom_minion
// Params 1, eflags: 0x4
// Checksum 0xf0adde74, Offset: 0x719
// Size: 0x1d
function private function_91e753b101229a2( s_burn_effect )
{
    utility::function_32b24db3127bff40( "poisoned", "poisoned_on" );
}

// Namespace zombie_loom_minion
// Params 1, eflags: 0x4
// Checksum 0xcdedbc74, Offset: 0x73e
// Size: 0x29
function private function_8c2a60ae74d8ce34( s_burn_effect )
{
    utility::ent_flag_clear( "poisoned" );
    utility::function_7c10ea82c1e305b8( "poisoned", "poisoned_off" );
}

// Namespace zombie_loom_minion
// Params 1, eflags: 0x4
// Checksum 0xbdf0db7, Offset: 0x76f
// Size: 0x1d
function private function_9a92f215ba32b261( s_burn_effect )
{
    utility::function_32b24db3127bff40( "wraith_burned", "wraith_burned_on" );
}

// Namespace zombie_loom_minion
// Params 1, eflags: 0x4
// Checksum 0xb770521c, Offset: 0x794
// Size: 0x29
function private function_c9afe0de75edf987( s_burn_effect )
{
    utility::ent_flag_clear( "wraith_burned" );
    utility::function_7c10ea82c1e305b8( "wraith_burned", "wraith_burned_off" );
}

// Namespace zombie_loom_minion
// Params 1, eflags: 0x4
// Checksum 0x46b7514d, Offset: 0x7c5
// Size: 0x3f
function private function_2080c9a8a657bc17( s_burn_effect )
{
    str_variant = s_burn_effect.str_variant ?? "";
    utility::function_32b24db3127bff40( "burned" + str_variant, "burned_on" );
}

// Namespace zombie_loom_minion
// Params 1, eflags: 0x4
// Checksum 0xb4b2aa8c, Offset: 0x80c
// Size: 0x3f
function private function_ef6cb4c9a207699d( s_burn_effect )
{
    str_variant = s_burn_effect.str_variant ?? "";
    utility::function_7c10ea82c1e305b8( "burned" + str_variant, "burned_off" );
}

// Namespace zombie_loom_minion
// Params 1, eflags: 0x4
// Checksum 0xbf61f1f6, Offset: 0x853
// Size: 0x1d
function private function_2b8879e19ccaeef3( s_burn_effect )
{
    utility::function_32b24db3127bff40( "napalm_burned", "napalm_burned_on" );
}

// Namespace zombie_loom_minion
// Params 1, eflags: 0x4
// Checksum 0xd9885c56, Offset: 0x878
// Size: 0x1d
function private function_aa4be0297708a8fa( s_burn_effect )
{
    utility::function_32b24db3127bff40( "napalm_burned", "napalm_burned_on_thermite" );
}

// Namespace zombie_loom_minion
// Params 1, eflags: 0x4
// Checksum 0xc65ff690, Offset: 0x89d
// Size: 0x1d
function private function_8b959aabb4069e99( s_burn_effect )
{
    utility::function_7c10ea82c1e305b8( "napalm_burned", "napalm_burned_off" );
}

// Namespace zombie_loom_minion
// Params 1, eflags: 0x4
// Checksum 0x97135ae8, Offset: 0x8c2
// Size: 0x1d
function private function_ce4fe5b7b95b73f6( var_e413418973ad5ea2 )
{
    utility::function_32b24db3127bff40( "shocked", "shocked_on" );
}

// Namespace zombie_loom_minion
// Params 1, eflags: 0x4
// Checksum 0x82fd58, Offset: 0x8e7
// Size: 0x1d
function private function_f8cbef2738adcd18( var_e413418973ad5ea2 )
{
    utility::function_7c10ea82c1e305b8( "shocked", "shocked_off" );
}

