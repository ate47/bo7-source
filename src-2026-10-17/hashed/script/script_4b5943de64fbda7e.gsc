#using script_4554e7b8c031a3cd;
#using scripts\common\callbacks;
#using scripts\common\math;
#using scripts\common\status_effects\effect_burn;
#using scripts\mp\equipment;

#namespace inc_fire;

// Namespace inc_fire
// Params 0
// Checksum 0xf99971be, Offset: 0xfb
// Size: 0x91
function inc_fire_init()
{
    level.var_e6b433d369a28e84 = 0;
    inc_firebundle = equipment_mp::getequipmentbundlefromweaponname( "inc_fire_mp" );
    
    if ( isdefined( inc_firebundle ) )
    {
        level.var_e6b433d369a28e84 = inc_firebundle.var_9e3b922bb62e0062 ?? 0;
    }
    
    var_6b01c397a68f394c = getdvarint( @"hash_d94cba8f8128ba00", -1 );
    
    if ( var_6b01c397a68f394c >= 0 )
    {
        level.var_e6b433d369a28e84 = var_6b01c397a68f394c;
    }
    
    level.equipment.callbacks[ "equip_inc_fire" ][ "onFired" ] = &onequipmentfired;
}

// Namespace inc_fire
// Params 1
// Checksum 0xdda9dbb6, Offset: 0x194
// Size: 0xdf, Type: bool
function useinc_fire( objweapon )
{
    self endon( #"disconnect" );
    self endon( #"removeinc_fire" );
    wait level.var_e6b433d369a28e84;
    params = spawnstruct();
    params.player = self;
    params.str_element = "fire";
    callback::callback( "on_inc_used", params );
    self.var_1c26b5220bcce76 = 1;
    a_enemies = get_proximity_enemies( 1 );
    
    if ( a_enemies.size < 12 )
    {
        n_targets = a_enemies.size;
    }
    else
    {
        n_targets = 12;
    }
    
    for ( i = 0; i < n_targets ; i++ )
    {
        if ( isalive( a_enemies[ i ] ) )
        {
            a_enemies[ i ] thread function_737f1dcbbd4693c4( self, objweapon );
            waitframe();
        }
    }
    
    childthread function_ad26b9a2c54ea2ec();
    return true;
}

// Namespace inc_fire
// Params 2
// Checksum 0x76a98680, Offset: 0x27c
// Size: 0xba
function function_737f1dcbbd4693c4( player, objweapon )
{
    self endon( #"death" );
    
    if ( self.subclass == "zombie_special" )
    {
        n_damage = int( self.maxhealth * 0.02 );
    }
    else if ( self.subclass == "zombie_elite" )
    {
        n_damage = int( self.maxhealth * 0.01 );
    }
    else
    {
        n_damage = int( self.maxhealth * 0.25 );
    }
    
    thread effect_burn::burn( 8, 0, 1, player, undefined, undefined, undefined, "fire" );
    thread function_520da0d9a93bd10( 8, n_damage, 1, player, objweapon );
}

// Namespace inc_fire
// Params 5
// Checksum 0x8987c4a5, Offset: 0x33e
// Size: 0x62
function function_520da0d9a93bd10( n_duration, n_damage, n_cooldown, player, objweapon )
{
    self endon( #"death" );
    
    while ( true )
    {
        self dodamage( n_damage, self.origin, player, undefined, "MOD_FIRE", objweapon );
        wait n_cooldown;
    }
}

// Namespace inc_fire
// Params 1
// Checksum 0x5a93f2c0, Offset: 0x3a8
// Size: 0x19d
function get_proximity_enemies( b_sort )
{
    a_ai_all = getaiarrayinradius( self.origin, 550 );
    a_ai_targets = [];
    
    foreach ( ai in a_ai_all )
    {
        if ( ai.aicategory == "boss" )
        {
            continue;
        }
        
        if ( !isalive( ai ) )
        {
            continue;
        }
        
        if ( ai.team == self.team )
        {
            continue;
        }
        
        ai_tag_origin = ai gettagorigin( "j_spine4" );
        
        if ( !isdefined( ai_tag_origin ) )
        {
            continue;
        }
        
        if ( math::point_in_fov( ai_tag_origin, cos( 35 ) ) && ai.aicategory != "boss" )
        {
            a_ai_targets[ a_ai_targets.size ] = ai;
            continue;
        }
        
        if ( namespace_23f524c1fb785161::is_player_looking_at( ai.origin, 0.6 ) || namespace_23f524c1fb785161::is_player_looking_at( ai getcentroid(), 0.6 ) || namespace_23f524c1fb785161::is_player_looking_at( ai.origin + ( 0, 0, 72 ), 0.6 ) )
        {
            a_ai_targets[ a_ai_targets.size ] = ai;
        }
    }
    
    if ( b_sort )
    {
        a_ai_targets = sortbydistance( a_ai_targets, self.origin );
    }
    
    return a_ai_targets;
}

// Namespace inc_fire
// Params 0
// Checksum 0xb009a08b, Offset: 0x54e
// Size: 0x24
function removeinc_fire()
{
    if ( self.var_1c26b5220bcce76 )
    {
        self notify( #"removeinc_fire" );
        self.var_1c26b5220bcce76 = undefined;
    }
}

// Namespace inc_fire
// Params 2
// Checksum 0x5b6144cb, Offset: 0x57a
// Size: 0x1c
function onequipmenttaken( equipmentref, slot )
{
    removeinc_fire();
}

// Namespace inc_fire
// Params 3
// Checksum 0x42fe6a21, Offset: 0x59e
// Size: 0x78
function onequipmentfired( equipmentref, slot, objweapon )
{
    function_5028271091976d72( objweapon );
    
    if ( self isthrowingbackgrenade() )
    {
        self function_4bdf2fa26c2d815d();
        
        if ( isdefined( objweapon ) )
        {
            ammo = self getweaponammoclip( objweapon );
            newammo = int( max( ammo - 1, 0 ) );
            self setweaponammoclip( objweapon, newammo );
        }
    }
    
    useinc_fire( objweapon );
}

// Namespace inc_fire
// Params 0
// Checksum 0x53bc81f4, Offset: 0x61e
// Size: 0x2e
function function_ad26b9a2c54ea2ec()
{
    self notify( #"hash_141d2842c4ca79d5" );
    self endon( #"hash_141d2842c4ca79d5" );
    level waittill( #"game_ended" );
    thread removeinc_fire();
}

// Namespace inc_fire
// Params 1
// Checksum 0x71c8f8f5, Offset: 0x654
// Size: 0x5e
function function_5028271091976d72( objweapon )
{
    inc_firebundle = equipment_mp::getequipmentbundlefromweaponname( objweapon.basename );
    
    if ( isdefined( inc_firebundle ) && isdefined( inc_firebundle.var_4d1dc4756b926596 ) && inc_firebundle.var_31864f46b4509cd9 )
    {
        pbgpostfxbundlestart( self, inc_firebundle.var_4d1dc4756b926596 );
    }
}

