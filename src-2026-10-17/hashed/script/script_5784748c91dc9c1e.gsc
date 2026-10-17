#using script_2b51dca51198db31;
#using script_33e3590e7eb028f3;
#using script_4f9ce8d249a99f4a;
#using script_5560f3066718e34c;
#using script_6549c4611bbb9960;
#using script_71cef547a69e4a26;
#using script_734dce84c468439b;
#using script_7b1e082b2533e255;
#using scripts\common\system;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\common\vehicle;
#using scripts\mp\emp_debuff;
#using scripts\mp\hud_message;

#namespace ability_emp_blast;

// Namespace ability_emp_blast
// Params 0, eflags: 0x5
// Checksum 0x1b5753c8, Offset: 0x135
// Size: 0x21
function private autoexec __init__system__()
{
    system::register( #"ability_emp_blast", #"ability_manager", &pre_main, undefined );
}

// Namespace ability_emp_blast
// Params 0, eflags: 0x4
// Checksum 0x845fa89d, Offset: 0x15e
// Size: 0x54
function private pre_main()
{
    ability_manager::register_ability( { #cleanup_func:&function_a278dd984dd334d0, #activate_func:&on_activate_emp_blast, #can_activate_func:&can_activate_emp_blast, #ref:"emp_blast" } );
    init_vfx( ability_manager::function_46f903265663b45b( "emp_blast" ) );
}

// Namespace ability_emp_blast
// Params 1, eflags: 0x4
// Checksum 0xb2e9137, Offset: 0x1ba
// Size: 0x29
function private init_vfx( tunables )
{
    utility::add_fx( tunables.vfx, tunables.vfx );
}

// Namespace ability_emp_blast
// Params 1, eflags: 0x4
// Checksum 0x2c5a0856, Offset: 0x1eb
// Size: 0x4f, Type: bool
function private can_activate_emp_blast( params )
{
    if ( self isgestureplaying() && self isonground() )
    {
        return false;
    }
    
    if ( self isswimunderwater() )
    {
        hud_message::showerrormessage( %"hash_4adbfce1ad6ba8f4" );
        return false;
    }
    
    if ( self isonladder() )
    {
        return false;
    }
    
    if ( self isthrowinggrenade() )
    {
        return false;
    }
    
    return true;
}

// Namespace ability_emp_blast
// Params 1, eflags: 0x4
// Checksum 0x5ccdc4b9, Offset: 0x243
// Size: 0x1bc
function private on_activate_emp_blast( params )
{
    tunables = params.tunables;
    castseconds = tunables.castseconds;
    var_7378ca6c7945ffd0 = tunables.var_7378ca6c7945ffd0;
    var_a0824062bc1bcc26 = castseconds * var_7378ca6c7945ffd0;
    var_404570396f2cc805 = castseconds - var_a0824062bc1bcc26;
    radius = tunables.radius;
    debuffsec = tunables.debuffseconds;
    gesture = tunables.gesture;
    
    if ( weapon::grenadeinpullback() )
    {
        self canceloffhands();
    }
    
    val::set( #"emp_blast", "offhand_weapons", 0 );
    val::set( #"emp_blast", "offhand_primary_weapons", 0 );
    val::set( #"emp_blast", "offhand_secondary_weapons", 0 );
    val::set( #"emp_blast", "equipment_primary", 0 );
    val::set( #"emp_blast", "equipment_secondary", 0 );
    
    if ( self.currentweapon && self.currentweapon.basename != "none" )
    {
        self forceplaygestureviewmodel( gesture );
    }
    
    self playlocalsound( tunables.soundself );
    self playsound( tunables.soundarea, undefined, self );
    wait var_a0824062bc1bcc26;
    do_emp_blast( self.origin, radius, debuffsec, tunables );
    wait var_404570396f2cc805;
    
    if ( self isgestureplaying( gesture ) )
    {
        self stopgestureviewmodel( gesture );
    }
    
    val::reset_all( #"emp_blast" );
    wait 1;
}

// Namespace ability_emp_blast
// Params 1, eflags: 0x4
// Checksum 0xfefe61b5, Offset: 0x407
// Size: 0x80
function private function_a278dd984dd334d0( params )
{
    tunables = params.tunables;
    gesture = tunables.gesture;
    
    if ( isalive( self ) && self tagexists( "tag_head" ) )
    {
        stopfxontag( level._effect[ tunables.vfx ], self, "tag_head" );
    }
    
    if ( self isgestureplaying( gesture ) )
    {
        self stopgestureviewmodel( gesture );
    }
}

// Namespace ability_emp_blast
// Params 4, eflags: 0x4
// Checksum 0x8b981f72, Offset: 0x48f
// Size: 0x3d1
function private do_emp_blast( position, radius, debuffseconds, tunables )
{
    /#
        if ( isdefined( tunables.debugenabled ) && tunables.debugenabled )
        {
            level thread debug_utility::drawsphere( position, radius, debuffseconds, ( 0.2, 0.2, 1 ) );
        }
    #/
    
    playfxontag( level._effect[ tunables.vfx ], self, "tag_origin" );
    var_3d5d737bf9d49f13 = emp_debuff::empdebuff_get_emp_ents( position, radius );
    weaponobj = makeweapon( tunables.weapon );
    
    foreach ( entity in var_3d5d737bf9d49f13 )
    {
        entowner = entity.owner;
        
        if ( isdefined( entowner ) && player_utility::function_51a0c300008ab56b( self, entowner ) )
        {
            continue;
        }
        
        /#
            if ( isdefined( tunables.debugenabled ) && tunables.debugenabled )
            {
                level thread debug_utility::drawsphere( entity.origin, 25, debuffseconds, ( 0.2, 0.7, 1 ) );
            }
        #/
        
        if ( entity vehicle::is_vehicle() )
        {
            vehtunables = entity function_c42ce5593fcb9259( tunables );
            health = int( ceil( entity.maxhealth * vehtunables.damagepct ) );
            
            if ( tunables.var_8dbf206e6d5dff82 )
            {
                entity dodamage( health, position, self, self, "MOD_EXPLOSIVE" );
            }
            
            if ( vehtunables.debuffseconds > 0 )
            {
                data = damage_utility::packdamagedata( self, entity, health, weaponobj, "MOD_EXPLOSIVE", undefined, position );
                data.issubmunition = 0;
                data.debuffseconds = vehtunables.debuffseconds;
                level thread function_fa06edac1dc782fd( data );
            }
            
            continue;
        }
        
        data = damage_utility::packdamagedata( self, entity, 10000, weaponobj, "MOD_EXPLOSIVE", undefined, position );
        data.issubmunition = 0;
        data.debuffseconds = debuffseconds;
        level thread function_fa06edac1dc782fd( data );
    }
    
    players = getplayersinradius( position, radius );
    
    foreach ( player in players )
    {
        if ( player === self || player.iszombie )
        {
            continue;
        }
        
        if ( !player emp_debuff::can_be_empd() )
        {
            continue;
        }
        
        if ( !player_utility::playersareenemies( self, player ) )
        {
            continue;
        }
        
        /#
            if ( isdefined( tunables.debugenabled ) && tunables.debugenabled )
            {
                level thread debug_utility::drawsphere( player.origin, 30, debuffseconds, ( 0.2, 0.2, 1 ) );
            }
        #/
        
        data = damage_utility::packdamagedata( self, player, 1, weaponobj, "MOD_EXPLOSIVE", undefined, position );
        data.issubmunition = 0;
        data.scoreevent = #"emped_player";
        data.debuffseconds = debuffseconds;
        level thread function_f56d5660ca6490a9( data, tunables );
    }
}

// Namespace ability_emp_blast
// Params 1, eflags: 0x4
// Checksum 0xe53a48fe, Offset: 0x868
// Size: 0x164
function private function_c42ce5593fcb9259( tunables )
{
    switch ( vehicle::get_ref() )
    {
        case %"hash_d37d79c77996a18":
        case %"vehiclebundle:veh_sat_atv_wz":
            return { #debuffseconds:tunables.var_d6e060f32c9e4875, #damagepct:tunables.var_c3a05fefd5c0434e };
        case %"vehiclebundle:veh_sat_utv_wz":
            return { #debuffseconds:tunables.var_c690c44994da87fc, #damagepct:tunables.var_8ee7df6428ef69cf };
        case %"hash_3e02b17ce7e578b2":
        case %"hash_40342e43bfc33421":
        case %"hash_52db5eb12cf54f8d":
        case %"hash_5615135cc8b0bfe5":
            return { #debuffseconds:tunables.var_9aadc32670e41b57, #damagepct:tunables.var_c2c169d43ef8e530 };
        case %"hash_336856991f0344eb":
        case %"hash_6ecc4b72654c75a5":
            return { #debuffseconds:tunables.var_b234668552a0c38, #damagepct:tunables.var_7c0233bdd0956f4b };
        default:
            return { #debuffseconds:tunables.var_9aadc32670e41b57, #damagepct:tunables.var_c2c169d43ef8e530 };
    }
}

// Namespace ability_emp_blast
// Params 2, eflags: 0x4
// Checksum 0x6f45b361, Offset: 0x9d4
// Size: 0x31
function private function_c2b2492fa2fde65f( victim, durationseconds )
{
    level endon( #"game_ended" );
    victim endon( #"death_or_disconnect" );
    wait durationseconds;
}

// Namespace ability_emp_blast
// Params 1, eflags: 0x4
// Checksum 0x2694e11, Offset: 0xa0d
// Size: 0x55
function private function_fa06edac1dc782fd( data )
{
    emp_debuff::apply_emp_struct( data );
    function_c2b2492fa2fde65f( data.victim, data.debuffseconds );
    
    if ( !isdefined( data.victim ) )
    {
        return;
    }
    
    data.victim emp_debuff::remove_emp();
}

// Namespace ability_emp_blast
// Params 2, eflags: 0x4
// Checksum 0xc16270f1, Offset: 0xa6a
// Size: 0x227
function private function_f56d5660ca6490a9( data, tunables )
{
    if ( tunables.var_f58636374540bda7 && data.victim.shockname == tunables.shockasset )
    {
        return;
    }
    
    if ( isdefined( data.victim.var_43afb1faa42c3318 ) && tunables.var_233e00715dcd7754 > 0 && !utility::time_has_passed( data.victim.var_43afb1faa42c3318, tunables.var_233e00715dcd7754 ) )
    {
        return;
    }
    
    data.victim.var_43afb1faa42c3318 = gettime();
    emp_debuff::apply_emp_struct( data );
    data.victim emp_debuff::play_emp_scramble( tunables.var_d887c07cd8f9dbca );
    data.victim shellshock_utility_cpmp::_shellshock( tunables.shockasset, #"stun", data.debuffseconds, 1 );
    data.victim utility::function_32b24db3127bff40( #"shockstickvfx", #"vfx_start" );
    data.victim playlocalsound( tunables.var_7b5ea13fdad02f3e );
    data.victim utility::setplayerstunned();
    data.victim thread weapon_utility::cleanupconcussionstun( data.debuffseconds );
    data.victim player::codcastersetplayerstatuseffect( "stun", data.debuffseconds );
    function_c2b2492fa2fde65f( data.victim, data.debuffseconds );
    
    if ( !isdefined( data.victim ) )
    {
        return;
    }
    
    data.victim emp_debuff::remove_emp();
    data.victim emp_debuff::stop_emp_scramble( tunables.var_d887c07cd8f9dbca );
    data.victim utility::function_32b24db3127bff40( #"shockstickvfx", #"off" );
}

