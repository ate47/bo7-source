#using scripts\common\utility;

#namespace namespace_a2c34b6f27e5d4c0;

// Namespace namespace_a2c34b6f27e5d4c0
// Params 0, eflags: 0x1
// Checksum 0x48c9f910, Offset: 0x134
// Size: 0x32
function autoexec function_2ef3aea04ea8b661()
{
    if ( !isdefined( level.var_4cc1197dd650913a ) )
    {
        level.var_4cc1197dd650913a = [];
    }
    
    level.var_4cc1197dd650913a[ level.var_4cc1197dd650913a.size ] = &init_juggernaut_damage_states;
}

// Namespace namespace_a2c34b6f27e5d4c0
// Params 0
// Checksum 0xfd7dd330, Offset: 0x16e
// Size: 0xcb
function init_juggernaut_damage_states()
{
    self endon( #"death" );
    utility::flag_wait( "scriptables_ready" );
    
    if ( self.model != "body_opforce_juggernaut_basebody" )
    {
        return;
    }
    
    if ( isdefined( level.var_ff3f2f5b40e913e ) )
    {
        [[ level.var_ff3f2f5b40e913e ]]( self );
    }
    
    create_juggernaut_damagedata( "left_arm", 100, [ "left_arm_upper", "left_arm_lower", "left_hand" ] );
    create_juggernaut_damagedata( "right_arm", 100, [ "right_arm_upper", "right_arm_lower", "right_hand" ] );
    
    if ( !isdefined( self.var_85111bb9ad8b0dba ) )
    {
        self.var_85111bb9ad8b0dba = [];
    }
    
    self.var_85111bb9ad8b0dba[ self.var_85111bb9ad8b0dba.size ] = &function_6fa1aea24290f3de;
}

// Namespace namespace_a2c34b6f27e5d4c0
// Params 13, eflags: 0x4
// Checksum 0x2b14c0d7, Offset: 0x241
// Size: 0x8a
function private function_6fa1aea24290f3de( einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, stun_fraction, modelindex, partname )
{
    apply_juggernaut_part_damage( self.damagelocation, idamage );
}

// Namespace namespace_a2c34b6f27e5d4c0
// Params 3, eflags: 0x4
// Checksum 0x42ab1919, Offset: 0x2d3
// Size: 0xf8
function private create_juggernaut_damagedata( name, health, parts )
{
    data = spawnstruct();
    data.health = health;
    data.is_part_swapped = 0;
    
    if ( !isdefined( self.damagedata ) )
    {
        self.damagedata = [];
    }
    
    self.damagedata[ name ] = data;
    
    if ( !isdefined( self.damagedatalookup ) )
    {
        self.damagedatalookup = [];
    }
    
    foreach ( part in parts )
    {
        self.damagedatalookup[ part ] = name;
    }
}

// Namespace namespace_a2c34b6f27e5d4c0
// Params 2, eflags: 0x4
// Checksum 0x23b0c438, Offset: 0x3d3
// Size: 0xac
function private apply_juggernaut_part_damage( location, dmg )
{
    if ( !isdefined( self.damagedatalookup[ location ] ) )
    {
        return;
    }
    
    name = self.damagedatalookup[ location ];
    data = self.damagedata[ name ];
    data.health -= dmg;
    
    if ( data.health <= 0 && !data.is_part_swapped )
    {
        self setscriptablepartstate( name, "dmg", 1 );
        data.is_part_swapped = 1;
    }
}

