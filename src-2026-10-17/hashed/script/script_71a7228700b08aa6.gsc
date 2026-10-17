#using scripts\common\system;
#using scripts\common\utility;
#using scripts\mp\loot\common_item;
#using scripts\mp\zm\ztron\ztron_arena;
#using scripts\mp\zm\ztron\ztron_hazard;
#using scripts\mp\zm\ztron\ztron_item;
#using scripts\mp\zm\ztron\ztron_sound;
#using scripts\mp\zm\ztron\ztron_utility;

#namespace namespace_d77bf41d44d11cb4;

// Namespace namespace_d77bf41d44d11cb4
// Params 0, eflags: 0x5
// Checksum 0x1a670d5e, Offset: 0x192
// Size: 0x21
function private autoexec __init__system__()
{
    system::register( #"hash_f18c10ed4e1c87b7", #"hash_4599115b7d4d2ff0", undefined, &init );
}

// Namespace namespace_d77bf41d44d11cb4
// Params 0
// Checksum 0xfadc80c8, Offset: 0x1bb
// Size: 0x60
function init()
{
    ztron_hazard::function_6f661fac5fd31f1( #"crate", #"create", &create_crate );
    ztron_hazard::function_6f661fac5fd31f1( #"crate", #"arenaspawn", &function_4008b3c7f3fcee35 );
    utility::add_fx( "ztron_crate_reward", "vfx_sat_zm_racing_shooting_fireworks_ztron" );
    ztron_sound::function_4ac735395b173fe( "ztron_sound_crate_reward", "evt_ztron_pickup_giftbox_fireworks" );
}

// Namespace namespace_d77bf41d44d11cb4
// Params 0
// Checksum 0xb793e7be, Offset: 0x223
// Size: 0xca
function function_4008b3c7f3fcee35()
{
    if ( !isdefined( level.ztron.active_arena ) )
    {
        return;
    }
    
    level.ztron.var_f3ec6a2c4160617d = [];
    traps = level.ztron.active_arena ztron_arena::function_eb3bad474c41ae42( "crate" );
    
    foreach ( trap in traps )
    {
        create_crate( trap );
    }
}

// Namespace namespace_d77bf41d44d11cb4
// Params 2
// Checksum 0x548d0497, Offset: 0x2f5
// Size: 0x59
function create_crate( trap, paged = 0 )
{
    if ( paged )
    {
        level.ztron.var_f3ec6a2c4160617d[ level.ztron.var_f3ec6a2c4160617d.size ] = trap;
        return;
    }
    
    function_71a2fa06c78812d4( trap );
}

// Namespace namespace_d77bf41d44d11cb4
// Params 0, eflags: 0x4
// Checksum 0xc0918ca9, Offset: 0x356
// Size: 0x34
function private get_crate_model()
{
    models = [ "sat_zm_ztron_props_crate24x32", "sat_zm_ztron_props_crate24x32x48", "sat_zm_ztron_props_crate24x32x64" ];
    return models[ randomintrange( 0, models.size ) ];
}

// Namespace namespace_d77bf41d44d11cb4
// Params 2, eflags: 0x4
// Checksum 0xe32daa8, Offset: 0x393
// Size: 0xa1
function private function_71a2fa06c78812d4( trap, paged = 0 )
{
    if ( !isdefined( trap ) )
    {
        return;
    }
    
    trap.reward_list = trap.script_parameters ?? %"hash_d8df79ceee86ed7";
    model = get_crate_model();
    hazard = trap function_f8fe90c9a0e9b29a( model, trap.origin, trap.angles );
    trap.script_model = hazard;
    trap.paged = paged;
    return trap;
}

// Namespace namespace_d77bf41d44d11cb4
// Params 3, eflags: 0x4
// Checksum 0xfff9d0f, Offset: 0x43d
// Size: 0xa6
function private function_f8fe90c9a0e9b29a( model, origin, angles )
{
    hazard = utility::spawn_model( model, origin, angles );
    
    if ( !isdefined( hazard ) )
    {
        return;
    }
    
    hazard.hazardtype = "crate";
    hazard setcandamage( 1 );
    hazard.health = 1000;
    hazard.maxhealth = 1000;
    hazard solid();
    hazard enableaimassist();
    hazard disconnectpaths();
    hazard.var_d62ad5bfd64ba592 = "tag_origin";
    thread function_15a4f170b867714d( 0, hazard );
    return hazard;
}

// Namespace namespace_d77bf41d44d11cb4
// Params 2, eflags: 0xc
// Checksum 0x9a6b294f, Offset: 0x4ec
// Size: 0x63
function private function_15a4f170b867714d( damaged, hazard )
{
    self notify( #"hash_381eeb688d1477f8" );
    self endon( #"hash_381eeb688d1477f8" );
    level endon( #"ztron_game_is_over" );
    self endon( #"death" );
    self endon( #"destroy_hazard" );
    thread function_39ec2ecdeae1bea( hazard );
    thread function_38b9633cd59a9b4b( hazard );
}

// Namespace namespace_d77bf41d44d11cb4
// Params 1, eflags: 0xc
// Checksum 0xa349266d, Offset: 0x557
// Size: 0x108
function private function_38b9633cd59a9b4b( hazard )
{
    self notify( #"hash_84bdd766e928fc19" );
    self endon( #"hash_84bdd766e928fc19" );
    self endon( #"death" );
    self endon( #"destroy_hazard" );
    
    while ( true )
    {
        hazard waittill( #"damage", damage, attacker, direction_vec, point, meansofdeath, modelname, tagname, partname, dflags, objweapon );
        
        if ( isdefined( attacker ) && damage >= 0 )
        {
            ztron_util::function_eb8ba16055d6da7c( attacker, hazard, "none", meansofdeath, objweapon, damage, point, undefined, undefined, 0, 0 );
        }
        
        if ( hazard.health <= 0 )
        {
            hazard.health = 0;
            self notify( #"destroy_hazard" );
        }
    }
}

// Namespace namespace_d77bf41d44d11cb4
// Params 1, eflags: 0x4
// Checksum 0x59cfeee5, Offset: 0x667
// Size: 0x94
function private function_39ec2ecdeae1bea( hazard )
{
    self endon( #"death" );
    thread ztron_hazard::function_4d643b159a80c647( 1 );
    self waittill( #"destroy_hazard" );
    
    if ( hazard.health == 0 )
    {
        thread function_3d72a454dcc442e7();
        thread function_66c6302a133e4c32();
    }
    
    if ( isdefined( self.script_model ) )
    {
        self.script_model notsolid();
        self.script_model setcandamage( 0 );
        self.script_model disableaimassist();
        self.script_model thread ztron_util::function_2dcb2513692d8ffa();
    }
}

// Namespace namespace_d77bf41d44d11cb4
// Params 0, eflags: 0x4
// Checksum 0x3e877e1f, Offset: 0x703
// Size: 0x148
function private function_3d72a454dcc442e7()
{
    playfx( utility::getfx( "ztron_crate_reward" ), self.origin );
    ztron_sound::ztron_playsound( "ztron_sound_crate_reward" );
    origin = ztron_util::function_3fe38741460a4a49( self.origin );
    spawnoptions = ztron_item::function_41854e96b8bf4a06( origin );
    itemnames = common_item::items_selectfromlist( self.reward_list, 5 );
    
    foreach ( itemname in itemnames )
    {
        params = spawnstruct();
        type = getscriptbundlefieldvalue( itemname, #"genericstring" );
        
        if ( type == #"gem" )
        {
            if ( !isdefined( params.launchforce ) )
            {
                params.launchforce = ( randomintrange( -10, 10 ), randomintrange( -10, 10 ), 200 );
            }
        }
        
        ztron_item::requestspawnitem( itemname, origin, 52, spawnoptions, params );
    }
}

// Namespace namespace_d77bf41d44d11cb4
// Params 0, eflags: 0x4
// Checksum 0x99125fe7, Offset: 0x853
// Size: 0xb2
function private function_66c6302a133e4c32()
{
    var_df30f0fb56850d9b = utility::getstructarray( self.target, "targetname" );
    
    foreach ( trap in var_df30f0fb56850d9b )
    {
        trap.var_4e8d6a50d83d5156 = 0;
        ztron_hazard::function_ed33fea23f0d8109( #"rats_horde", #"create", trap, 0 );
    }
}

