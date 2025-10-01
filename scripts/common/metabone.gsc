#using scripts\common\callbacks;
#using scripts\common\devgui;
#using scripts\engine\math;

#namespace metabone;

// Namespace metabone
// Params 1
// Checksum 0xf8de5a9, Offset: 0x122
// Size: 0x48
function init_metabones( var_5306b5e9cae7d5d3 )
{
    assert( !isdefined( self.metabones ), "<dev string:x24>" );
    function_15781388b197771( var_5306b5e9cae7d5d3 );
    callback::add( "on_ai_set_max_health", &function_8a959a3ac510c2d0 );
    
    /#
        thread debug_metabones();
    #/
}

// Namespace metabone
// Params 1
// Checksum 0xcad1d873, Offset: 0x172
// Size: 0x25f
function function_237f8d886269f297( var_7bece7d0a0b448ee )
{
    metabones_def = function_3e1e54de9c8abc35( self.metabones.bundle_name );
    
    foreach ( var_5f8347a0f23310c in var_7bece7d0a0b448ee )
    {
        foreach ( var_c112db77526f5405 in metabones_def.metabones )
        {
            var_fd04b8d568b6190d = getxhash( var_c112db77526f5405.name );
            
            if ( var_fd04b8d568b6190d == var_5f8347a0f23310c.name )
            {
                metabone_name = var_c112db77526f5405.name;
                break;
            }
        }
        
        metabone_info = self.metabones.info[ metabone_name ];
        metabone_info.is_active = var_5f8347a0f23310c.is_active;
        metabone = metabones_def.var_2972332beaa5b174[ metabone_name ];
        
        foreach ( state_name, state in metabone.var_63e19fb21594d5a2 )
        {
            if ( state.index == var_5f8347a0f23310c.state_index )
            {
                function_b02dc51e7399490e( metabone_name, state_name );
                
                if ( self getscriptablehaspart( metabone_name ) && self getscriptableparthasstate( metabone_name, state_name ) && self getscriptablepartstate( metabone_name ) != state_name )
                {
                    self setscriptablepartstate( metabone_name, state_name, 1 );
                }
                
                break;
            }
        }
    }
}

// Namespace metabone
// Params 1
// Checksum 0x7dd00412, Offset: 0x3d9
// Size: 0x6f
function function_cd1c0d469715b2ec( metabone_name )
{
    if ( !( isdefined( metabone_name ) && isdefined( self.metabones ) ) )
    {
        return 0;
    }
    
    metabones_def = function_3e1e54de9c8abc35( self.metabones.bundle_name );
    metabone = metabones_def.var_2972332beaa5b174[ metabone_name ];
    
    if ( isdefined( metabone ) )
    {
        return is_destroyed( metabone );
    }
    
    return 0;
}

// Namespace metabone
// Params 2
// Checksum 0xe046903f, Offset: 0x451
// Size: 0x9d
function function_ae1fbe819833ff94( metabone_name, data_type )
{
    if ( !( isdefined( metabone_name ) && isdefined( self.metabones ) ) )
    {
        return undefined;
    }
    
    metabones_def = function_3e1e54de9c8abc35( self.metabones.bundle_name );
    metabone = metabones_def.var_2972332beaa5b174[ metabone_name ];
    
    if ( isdefined( metabone ) )
    {
        metadata = function_a4f4ee60be8ebe7b( metabone, data_type );
        
        if ( isdefined( metadata ) )
        {
            metadata_copy = structcopy( metadata, 1 );
            return metadata_copy;
        }
    }
    
    return undefined;
}

// Namespace metabone
// Params 2
// Checksum 0x96b2ef3c, Offset: 0x4f7
// Size: 0x1a0
function function_169ab69956ed127( metabone_name, active )
{
    if ( !( isdefined( self.metabones ) && isdefined( metabone_name ) && isdefined( self.metabones.info ) ) )
    {
        return;
    }
    
    metabones_def = function_3e1e54de9c8abc35( self.metabones.bundle_name );
    metabone = metabones_def.var_2972332beaa5b174[ metabone_name ];
    
    if ( isdefined( metabone ) )
    {
        self.metabones.info[ metabone.name ].is_active = active;
        
        /#
            if ( active && isdefined( metabone.tags ) )
            {
                foreach ( tag in metabone.tags )
                {
                    assert( isdefined( self gettagindex( tag.tagname ) ), "<dev string:x58>" + self getentitynumber() + "<dev string:x64>" + tag.tagname + "<dev string:x7f>" + metabone.name + "<dev string:x93>" + self.metabones.bundle_name + "<dev string:x9d>" );
                }
            }
        #/
    }
}

// Namespace metabone
// Params 2
// Checksum 0xa372aa02, Offset: 0x69f
// Size: 0x1ec
function function_b02dc51e7399490e( metabone_name, state_name )
{
    if ( !( isdefined( self.metabones ) && isdefined( metabone_name ) && isdefined( self.metabones.info ) ) )
    {
        return undefined;
    }
    
    metabones_def = function_3e1e54de9c8abc35( self.metabones.bundle_name );
    metabone = metabones_def.var_2972332beaa5b174[ metabone_name ];
    metabone_info = self.metabones.info[ metabone.name ];
    
    if ( isdefined( metabone ) )
    {
        if ( isdefined( metabone_info.var_544bcf80d3c4bfba ) )
        {
            data = function_36ae1f4a9778c321( metabone.states[ metabone_info.var_544bcf80d3c4bfba ], "Types_Damageable" );
            
            if ( isdefined( data ) )
            {
                if ( isdefined( metabone_info.health ) )
                {
                    metabone_info.var_9001c14ad8db7425[ metabone_info.var_544bcf80d3c4bfba ] = metabone_info.health;
                }
            }
        }
        
        state = metabone.var_63e19fb21594d5a2[ state_name ];
        
        if ( isdefined( state ) )
        {
            metabone_info.var_544bcf80d3c4bfba = state.index;
            
            if ( isdefined( metabone_info.var_9001c14ad8db7425[ metabone_info.var_544bcf80d3c4bfba ] ) )
            {
                metabone_info.health = metabone_info.var_9001c14ad8db7425[ metabone_info.var_544bcf80d3c4bfba ];
            }
            else
            {
                metabone_info.health = undefined;
            }
            
            params = spawnstruct();
            params.metabone_name = metabone.name;
            params.state_name = state.name;
            callback::callback( "metabone_state_changed", params );
        }
    }
}

// Namespace metabone
// Params 5
// Checksum 0x92c6a348, Offset: 0x893
// Size: 0x148
function damage_metabone( metabone_name, damage, eattacker, einflictor, vdir )
{
    if ( !( isdefined( self.metabones ) && isdefined( metabone_name ) && isdefined( self.metabones.info ) ) )
    {
        return 0;
    }
    
    b_destroyed = 0;
    metabone_info = self.metabones.info[ metabone_name ];
    
    if ( metabone_info.health > 0 )
    {
        if ( damage < metabone_info.health )
        {
            metabone_info.health -= damage;
            params = spawnstruct();
            params.metabone_name = metabone_name;
            params.damage = damage;
            params.health = metabone_info.health;
            params.eattacker = eattacker;
            callback::callback( "metabone_damaged_not_destroyed", params );
            self notify( "metabone_damaged_not_destroyed" );
        }
        else
        {
            destroy_metabone( metabone_name, eattacker, einflictor, vdir );
            self notify( "metabone_destroyed" );
            b_destroyed = 1;
        }
    }
    
    return b_destroyed;
}

// Namespace metabone
// Params 5
// Checksum 0x718aa1ba, Offset: 0x9e4
// Size: 0x75
function function_89c290701fb18e61( metabone_name, damage, state_name, eattacker, einflictor )
{
    assert( isdefined( state_name ) && damage >= 0 );
    new_health = function_c635b0dc08baefad( metabone_name, 1, -1 * damage, state_name );
    
    if ( new_health <= 0 )
    {
        destroy_metabone( metabone_name, eattacker, einflictor );
    }
}

// Namespace metabone
// Params 3
// Checksum 0x7bb38673, Offset: 0xa61
// Size: 0x2c
function function_dbe4a2c3b0797294( metabone_name, health, state_name )
{
    function_c635b0dc08baefad( metabone_name, 1, health, state_name );
}

// Namespace metabone
// Params 3
// Checksum 0xe4469b66, Offset: 0xa95
// Size: 0x2b
function function_13685edc76d22c67( metabone_name, health, state_name )
{
    function_c635b0dc08baefad( metabone_name, 0, health, state_name );
}

// Namespace metabone
// Params 1
// Checksum 0xb7cdc536, Offset: 0xac8
// Size: 0x52
function function_50a0af5f47ae9a88( metabone_name )
{
    metabones_def = function_3e1e54de9c8abc35( self.metabones.bundle_name );
    metabone = metabones_def.var_2972332beaa5b174[ metabone_name ];
    function_452e9c3c677cfb85( metabone );
}

// Namespace metabone
// Params 2
// Checksum 0x5e3e7a83, Offset: 0xb22
// Size: 0x164
function function_906751e54d1bf5b3( metabone_name, state_name )
{
    if ( !( isdefined( self.metabones ) && isdefined( metabone_name ) && isdefined( self.metabones.info ) ) )
    {
        return undefined;
    }
    
    metabone_info = self.metabones.info[ metabone_name ];
    
    if ( !isdefined( metabone_info ) )
    {
        assertmsg( "<dev string:xb2>" + metabone_name );
        return undefined;
    }
    
    if ( isdefined( state_name ) )
    {
        metabones_def = function_3e1e54de9c8abc35( self.metabones.bundle_name );
        target_metabone = metabones_def.var_2972332beaa5b174[ metabone_name ];
        target_state = target_metabone.var_63e19fb21594d5a2[ state_name ];
        var_cacdc8ec017b1062 = target_state.index;
        
        if ( var_cacdc8ec017b1062 != metabone_info.var_544bcf80d3c4bfba )
        {
            damageable_data = function_36ae1f4a9778c321( target_state, "Types_Damageable" );
            
            if ( !isdefined( damageable_data ) )
            {
                return undefined;
            }
            
            assert( isdefined( metabone_info.var_9001c14ad8db7425[ var_cacdc8ec017b1062 ] ) );
            return metabone_info.var_9001c14ad8db7425[ var_cacdc8ec017b1062 ];
        }
    }
    
    if ( isdefined( metabone_info.health ) )
    {
        return metabone_info.health;
    }
    
    return undefined;
}

// Namespace metabone
// Params 2
// Checksum 0x15fba346, Offset: 0xc8f
// Size: 0x143
function function_7b81be2ff0d35c4f( metabone_name, state_name )
{
    if ( !( isdefined( self.metabones ) && isdefined( metabone_name ) && isdefined( self.metabones.info ) ) )
    {
        return undefined;
    }
    
    metabone_info = self.metabones.info[ metabone_name ];
    
    if ( !isdefined( metabone_info ) )
    {
        assertmsg( "<dev string:xb2>" + metabone_name );
        return undefined;
    }
    
    maxhealth = undefined;
    
    if ( isdefined( state_name ) )
    {
        metabones_def = function_3e1e54de9c8abc35( self.metabones.bundle_name );
        target_metabone = metabones_def.var_2972332beaa5b174[ metabone_name ];
        target_state = target_metabone.var_63e19fb21594d5a2[ state_name ];
        damageable_data = function_36ae1f4a9778c321( target_state, "Types_Damageable" );
        
        if ( isdefined( damageable_data ) )
        {
            if ( !damageable_data.absolutehealth )
            {
                maxhealth = damageable_data.health * self.metabones.stored_maxhealth;
            }
            else
            {
                maxhealth = damageable_data.health;
            }
        }
    }
    
    return maxhealth;
}

// Namespace metabone
// Params 4
// Checksum 0x7f7106d4, Offset: 0xddb
// Size: 0x112
function destroy_metabone( metabone_name, eattacker, einflictor, vdir )
{
    if ( !( isdefined( self.metabones ) && isdefined( metabone_name ) && isdefined( self.metabones.info ) ) )
    {
        return undefined;
    }
    
    metabone_info = self.metabones.info[ metabone_name ];
    
    if ( metabone_info.health > 0 )
    {
        metabone_info.health = 0;
    }
    
    metabone_info.is_active = 0;
    
    if ( isai( self ) )
    {
        self._blackboard.var_3a0516652d1efb68 = metabone_name;
    }
    
    params = spawnstruct();
    params.metabone_name = metabone_name;
    params.eattacker = eattacker;
    params.einflictor = einflictor;
    params.vdir = vdir;
    callback::callback( "metabone_destroyed", params );
}

// Namespace metabone
// Params 2
// Checksum 0xaf0c2087, Offset: 0xef5
// Size: 0x209
function function_ddf2fd7b79c9d5b5( hit_loc, direction )
{
    if ( !( isdefined( self.metabones ) && isdefined( self.metabones.info ) ) )
    {
        return undefined;
    }
    
    metabones_def = function_3e1e54de9c8abc35( self.metabones.bundle_name );
    
    foreach ( metabone in metabones_def.metabones )
    {
        if ( !self.metabones.info[ metabone.name ].is_active )
        {
            continue;
        }
        
        if ( is_destroyed( metabone ) )
        {
            continue;
        }
        
        if ( !isdefined( metabone.hitlocations ) )
        {
            continue;
        }
        
        foreach ( var_cd8b5a9888b84d06 in metabone.hitlocations )
        {
            if ( var_cd8b5a9888b84d06.hitlocation == hit_loc )
            {
                if ( isdefined( var_cd8b5a9888b84d06.cosmaxangle ) && isdefined( direction ) )
                {
                    root_forward = anglestoforward( self.angles );
                    hit_dot = vectordot( root_forward, vectornormalize( direction ) * -1 );
                    
                    if ( hit_dot < var_cd8b5a9888b84d06.cosmaxangle )
                    {
                        continue;
                    }
                }
                
                return metabone.name;
            }
        }
    }
    
    return undefined;
}

// Namespace metabone
// Params 2
// Checksum 0x2cce30fb, Offset: 0x1107
// Size: 0x1da
function function_927e17286f4e0a54( part_name, direction )
{
    if ( !( isdefined( self.metabones ) && isdefined( part_name ) && isdefined( self.metabones.info ) ) )
    {
        return undefined;
    }
    
    metabones_def = function_3e1e54de9c8abc35( self.metabones.bundle_name );
    
    foreach ( metabone in metabones_def.metabones )
    {
        if ( !self.metabones.info[ metabone.name ].is_active )
        {
            continue;
        }
        
        if ( is_destroyed( metabone ) )
        {
            continue;
        }
        
        if ( !( isdefined( metabone.parts ) && isdefined( metabone.partmap ) ) )
        {
            continue;
        }
        
        partindex = metabone.partmap[ part_name ];
        
        if ( isdefined( partindex ) )
        {
            metabone_part = metabone.parts[ partindex ];
            
            if ( isdefined( metabone_part.cosmaxangle ) && isdefined( direction ) )
            {
                bone_forward = anglestoforward( self gettagangles( metabone_part.partname ) );
                hit_dot = vectordot( bone_forward, vectornormalize( direction ) * -1 );
                
                if ( hit_dot < metabone_part.cosmaxangle )
                {
                    continue;
                }
            }
            
            return metabone.name;
        }
    }
    
    return undefined;
}

// Namespace metabone
// Params 2
// Checksum 0xcbbf3192, Offset: 0x12ea
// Size: 0x2d3
function function_2d9c443204521c97( point, direction )
{
    if ( !( isdefined( self.metabones ) && isdefined( point ) && isdefined( self.metabones.info ) ) )
    {
        return undefined;
    }
    
    /#
        if ( getdvarint( @"hash_8ef2fd5f0121ed80", 0 ) > 0 )
        {
            sphere( point, 5, ( 1, 0, 0 ) );
            print3d( point, "<dev string:xe6>", ( 1, 0, 0 ), 0.5 );
        }
    #/
    
    metabones_def = function_3e1e54de9c8abc35( self.metabones.bundle_name );
    closest_metabone = undefined;
    var_ffca636c4032ad1b = 0;
    
    foreach ( metabone in metabones_def.metabones )
    {
        if ( !self.metabones.info[ metabone.name ].is_active )
        {
            continue;
        }
        
        if ( is_destroyed( metabone ) )
        {
            continue;
        }
        
        if ( !isdefined( metabone.tags ) )
        {
            continue;
        }
        
        foreach ( tag in metabone.tags )
        {
            tag_origin = self gettagorigin( tag.tagname );
            var_3c601b790e519ade = squared( tag.radius ?? 1 );
            dist_sq = distancesquared( point, tag_origin );
            
            if ( dist_sq <= var_3c601b790e519ade && ( !isdefined( closest_metabone ) || dist_sq < var_ffca636c4032ad1b ) )
            {
                if ( isdefined( tag.cosmaxangle ) && isdefined( direction ) )
                {
                    tag_forward = anglestoforward( self gettagangles( tag.tagname ) );
                    tag_dot = vectordot( tag_forward, vectornormalize( direction ) * -1 );
                    
                    if ( tag_dot < tag.cosmaxangle )
                    {
                        continue;
                    }
                }
                
                closest_metabone = metabone;
                var_ffca636c4032ad1b = dist_sq;
            }
        }
    }
    
    if ( isdefined( closest_metabone ) )
    {
        return closest_metabone.name;
    }
    
    return undefined;
}

// Namespace metabone
// Params 4
// Checksum 0x344a30b7, Offset: 0x15c6
// Size: 0x495
function function_656811c370c4ec5a( hit_loc, part_name, point, direction )
{
    if ( !( isdefined( hit_loc ) && isdefined( point ) ) || !( isdefined( self.metabones ) && isdefined( self.metabones.info ) ) )
    {
        return undefined;
    }
    
    metabones_def = function_3e1e54de9c8abc35( self.metabones.bundle_name );
    
    foreach ( metabone in metabones_def.metabones )
    {
        if ( !self.metabones.info[ metabone.name ].is_active )
        {
            continue;
        }
        
        if ( is_destroyed( metabone ) )
        {
            continue;
        }
        
        if ( isdefined( metabone.hitlocations ) )
        {
            foreach ( var_cd8b5a9888b84d06 in metabone.hitlocations )
            {
                if ( var_cd8b5a9888b84d06.hitlocation == hit_loc )
                {
                    if ( isdefined( var_cd8b5a9888b84d06.cosmaxangle ) && isdefined( direction ) )
                    {
                        root_forward = anglestoforward( self.angles );
                        hit_dot = vectordot( root_forward, vectornormalize( direction ) * -1 );
                        
                        if ( hit_dot < var_cd8b5a9888b84d06.cosmaxangle )
                        {
                            continue;
                        }
                    }
                    
                    return metabone.name;
                }
            }
        }
        
        if ( isdefined( metabone.parts ) && isdefined( part_name ) && isdefined( metabone.partmap ) )
        {
            partindex = metabone.partmap[ part_name ];
            
            if ( isdefined( partindex ) )
            {
                metabone_part = metabone.parts[ partindex ];
                
                if ( isdefined( metabone_part.cosmaxangle ) && isdefined( direction ) )
                {
                    bone_forward = anglestoforward( self gettagangles( metabone_part.partname ) );
                    hit_dot = vectordot( bone_forward, vectornormalize( direction ) * -1 );
                    
                    if ( hit_dot < metabone_part.cosmaxangle )
                    {
                        continue;
                    }
                }
                
                return metabone.name;
            }
        }
        
        if ( isdefined( metabone.tags ) )
        {
            closest_metabone = undefined;
            var_ffca636c4032ad1b = 99999999;
            
            foreach ( tag in metabone.tags )
            {
                tag_origin = self gettagorigin( tag.tagname );
                dist_sq = distancesquared( point, tag_origin );
                
                if ( !isdefined( closest_metabone ) || dist_sq < var_ffca636c4032ad1b )
                {
                    tag_radius = tag.radius ?? 1;
                    penetration_dist = tag.penetrationdist;
                    
                    if ( isdefined( penetration_dist ) && isdefined( direction ) )
                    {
                        if ( !math::segmentvssphere( point, point + direction * penetration_dist, tag_origin, tag_radius ) )
                        {
                            continue;
                        }
                    }
                    else if ( dist_sq > squared( tag_radius ) )
                    {
                        continue;
                    }
                    
                    if ( isdefined( tag.cosmaxangle ) && isdefined( direction ) )
                    {
                        tag_forward = anglestoforward( self gettagangles( tag.tagname ) );
                        tag_dot = vectordot( tag_forward, vectornormalize( direction ) * -1 );
                        
                        if ( tag_dot < tag.cosmaxangle )
                        {
                            continue;
                        }
                    }
                    
                    closest_metabone = metabone;
                    var_ffca636c4032ad1b = dist_sq;
                }
            }
            
            if ( isdefined( closest_metabone ) )
            {
                return closest_metabone.name;
            }
        }
    }
    
    return undefined;
}

// Namespace metabone
// Params 2
// Checksum 0x120c2395, Offset: 0x1a64
// Size: 0x39
function function_cd947f1a3391c065( var_fb56e56d94279338, var_15ce677c9f4c0c3 )
{
    if ( !isdefined( level.var_93f9a5daebf6b466 ) )
    {
        level.var_93f9a5daebf6b466 = [];
    }
    
    level.var_93f9a5daebf6b466[ var_fb56e56d94279338 ] = var_15ce677c9f4c0c3;
}

// Namespace metabone
// Params 2
// Checksum 0x33e77b4f, Offset: 0x1aa5
// Size: 0x39
function function_7b57cab1f2311c7b( var_fb56e56d94279338, var_439953d86d0a8aad )
{
    if ( !isdefined( level.var_9b860665f87348c8 ) )
    {
        level.var_9b860665f87348c8 = [];
    }
    
    level.var_9b860665f87348c8[ var_fb56e56d94279338 ] = var_439953d86d0a8aad;
}

// Namespace metabone
// Params 1
// Checksum 0x7b60b043, Offset: 0x1ae6
// Size: 0x17
function function_b68bd9932f284448( var_682bceb3c14d0d51 )
{
    self.var_682bceb3c14d0d51 = var_682bceb3c14d0d51;
}

// Namespace metabone
// Params 1
// Checksum 0x4ba65673, Offset: 0x1b05
// Size: 0x27
function function_b7f4a00525689bee( dmgstruct )
{
    if ( isdefined( self.var_682bceb3c14d0d51 ) )
    {
        return [[ self.var_682bceb3c14d0d51 ]]( dmgstruct );
    }
}

// Namespace metabone
// Params 0
// Checksum 0x627cab10, Offset: 0x1b34
// Size: 0xc, Type: bool
function function_83525a0b05843168()
{
    return isdefined( self.var_682bceb3c14d0d51 );
}

// Namespace metabone
// Params 1
// Checksum 0xd7a173db, Offset: 0x1b49
// Size: 0x17
function function_23dfe92664fb40fd( var_af316a1ce17a9c8a )
{
    self.var_af316a1ce17a9c8a = var_af316a1ce17a9c8a;
}

// Namespace metabone
// Params 1
// Checksum 0x1fed1172, Offset: 0x1b68
// Size: 0x27
function function_d985a5fbf5939161( dmgstruct )
{
    if ( isdefined( self.var_af316a1ce17a9c8a ) )
    {
        return [[ self.var_af316a1ce17a9c8a ]]( dmgstruct );
    }
}

// Namespace metabone
// Params 0
// Checksum 0xd37e8df7, Offset: 0x1b97
// Size: 0xc, Type: bool
function function_3866ce438fcee825()
{
    return isdefined( self.var_af316a1ce17a9c8a );
}

// Namespace metabone
// Params 1
// Checksum 0xb41e67db, Offset: 0x1bac
// Size: 0x2bc
function function_8a959a3ac510c2d0( params )
{
    metabones_def = function_3e1e54de9c8abc35( self.metabones.bundle_name );
    
    foreach ( metabone in metabones_def.metabones )
    {
        if ( metabone.states.size > 0 )
        {
            metabone_info = self.metabones.info[ metabone.name ];
            
            foreach ( state_index, state in metabone.states )
            {
                damageable_data = function_36ae1f4a9778c321( state, "Types_Damageable" );
                
                if ( isdefined( damageable_data ) )
                {
                    if ( !damageable_data.absolutehealth )
                    {
                        assert( isdefined( self.maxhealth ), "<dev string:x58>" + self getentitynumber() + "<dev string:xf8>" + metabone.name + "<dev string:x93>" + self.metabones.bundle_name + "<dev string:x123>" );
                        var_9ff900e47a6acddc = damageable_data.health;
                        
                        if ( isdefined( self.metabones.stored_maxhealth ) && isdefined( metabone_info.health ) )
                        {
                            var_9ff900e47a6acddc = damageable_data.health * self.metabones.stored_maxhealth;
                        }
                        
                        if ( state_index == metabone_info.var_544bcf80d3c4bfba && isdefined( metabone_info.health ) )
                        {
                            var_cf4e5bdc673857ce = metabone_info.health / var_9ff900e47a6acddc;
                            metabone_info.health = damageable_data.health * self.maxhealth * var_cf4e5bdc673857ce;
                            continue;
                        }
                        
                        var_cf4e5bdc673857ce = metabone_info.var_9001c14ad8db7425[ state_index ] / var_9ff900e47a6acddc;
                        metabone_info.var_9001c14ad8db7425[ state_index ] = damageable_data.health * self.maxhealth * var_cf4e5bdc673857ce;
                    }
                }
            }
        }
    }
}

// Namespace metabone
// Params 1
// Checksum 0xe17362fe, Offset: 0x1e70
// Size: 0xe9, Type: bool
function function_30716bbed991d974( metabone_name )
{
    if ( !( isdefined( self.metabones ) && isdefined( metabone_name ) && isdefined( self.metabones.info ) ) )
    {
        return false;
    }
    
    metabone_info = self.metabones.info[ metabone_name ];
    
    if ( !( isdefined( metabone_info ) && isdefined( metabone_info.var_544bcf80d3c4bfba ) ) )
    {
        return false;
    }
    
    metabones_def = function_3e1e54de9c8abc35( self.metabones.bundle_name );
    metabone = metabones_def.var_2972332beaa5b174[ metabone_name ];
    state = metabone.states[ metabone_info.var_544bcf80d3c4bfba ];
    armor_data = function_36ae1f4a9778c321( state, "Types_Armor" );
    return isdefined( armor_data );
}

// Namespace metabone
// Params 1
// Checksum 0x15151739, Offset: 0x1f62
// Size: 0xe1
function function_81906360882441d4( metabone_name )
{
    if ( !( isdefined( self.metabones ) && isdefined( metabone_name ) && isdefined( self.metabones.info ) ) )
    {
        return undefined;
    }
    
    metabone_info = self.metabones.info[ metabone_name ];
    
    if ( !( isdefined( metabone_info ) && isdefined( metabone_info.var_544bcf80d3c4bfba ) ) )
    {
        return undefined;
    }
    
    metabones_def = function_3e1e54de9c8abc35( self.metabones.bundle_name );
    metabone = metabones_def.var_2972332beaa5b174[ metabone_name ];
    state = metabone.states[ metabone_info.var_544bcf80d3c4bfba ];
    
    if ( isdefined( state ) )
    {
        return state.name;
    }
}

// Namespace metabone
// Params 1
// Checksum 0x757485a8, Offset: 0x204b
// Size: 0x144
function function_30d906ccb9fe2142( data_type )
{
    if ( !( isdefined( self.metabones ) && isdefined( self.metabones.info ) ) )
    {
        return [];
    }
    
    active_metabones = [];
    metabones_def = function_3e1e54de9c8abc35( self.metabones.bundle_name );
    
    foreach ( metabone in metabones_def.metabones )
    {
        metabone_info = self.metabones.info[ metabone.name ];
        
        if ( !metabone_info.is_active )
        {
            continue;
        }
        
        if ( isdefined( data_type ) )
        {
            metadata = function_a4f4ee60be8ebe7b( metabone, data_type );
            
            if ( !isdefined( metadata ) )
            {
                continue;
            }
        }
        
        active_metabones[ active_metabones.size ] = metabone.name;
    }
    
    return active_metabones;
}

// Namespace metabone
// Params 4, eflags: 0x4
// Checksum 0x4903a3eb, Offset: 0x2198
// Size: 0x1dc
function private function_c635b0dc08baefad( metabone_name, relative_add, health, state_name )
{
    if ( !( isdefined( self.metabones ) && isdefined( metabone_name ) && isdefined( self.metabones.info ) ) )
    {
        return;
    }
    
    metabone_info = self.metabones.info[ metabone_name ];
    
    if ( !isdefined( metabone_info ) )
    {
        assertmsg( "<dev string:x15b>" + metabone_name );
        return;
    }
    
    if ( isdefined( state_name ) )
    {
        metabones_def = function_3e1e54de9c8abc35( self.metabones.bundle_name );
        target_metabone = metabones_def.var_2972332beaa5b174[ metabone_name ];
        target_state = target_metabone.var_63e19fb21594d5a2[ state_name ];
        var_cacdc8ec017b1062 = target_state.index;
        
        if ( var_cacdc8ec017b1062 != metabone_info.var_544bcf80d3c4bfba )
        {
            /#
                damageable_data = function_36ae1f4a9778c321( target_state, "<dev string:x18f>" );
                assert( isdefined( damageable_data ) );
                assert( isdefined( metabone_info.var_9001c14ad8db7425[ var_cacdc8ec017b1062 ] ) );
            #/
            
            if ( relative_add )
            {
                metabone_info.var_9001c14ad8db7425[ var_cacdc8ec017b1062 ] += health;
            }
            else
            {
                metabone_info.var_9001c14ad8db7425[ var_cacdc8ec017b1062 ] = health;
            }
            
            return metabone_info.var_9001c14ad8db7425[ var_cacdc8ec017b1062 ];
        }
    }
    
    if ( isdefined( metabone_info.health ) )
    {
        if ( relative_add )
        {
            metabone_info.health += health;
        }
        else
        {
            metabone_info.health = health;
        }
    }
    
    return metabone_info.health;
}

// Namespace metabone
// Params 1, eflags: 0x4
// Checksum 0x4da23259, Offset: 0x237d
// Size: 0x71, Type: bool
function private is_destroyed( metabone )
{
    if ( !( isdefined( self.metabones ) && isdefined( metabone ) && isdefined( self.metabones.info ) ) )
    {
        return false;
    }
    
    metabone_info = self.metabones.info[ metabone.name ];
    return metabone_info.health <= 0;
}

// Namespace metabone
// Params 2, eflags: 0x4
// Checksum 0x3abd8715, Offset: 0x23f7
// Size: 0x134
function private function_a4f4ee60be8ebe7b( metabone, data_type )
{
    if ( !( isdefined( self.metabones ) && isdefined( metabone ) && isdefined( self.metabones.info ) ) )
    {
        return undefined;
    }
    
    metabone_info = self.metabones.info[ metabone.name ];
    
    if ( isdefined( metabone_info.var_544bcf80d3c4bfba ) )
    {
        data = function_36ae1f4a9778c321( metabone.states[ metabone_info.var_544bcf80d3c4bfba ], data_type );
        
        if ( isdefined( data ) )
        {
            return data;
        }
    }
    
    foreach ( data in metabone.metadata )
    {
        if ( data.variant_type == data_type )
        {
            return data.variant_object;
        }
    }
    
    return undefined;
}

// Namespace metabone
// Params 2, eflags: 0x4
// Checksum 0x2cec527c, Offset: 0x2534
// Size: 0xa5
function private function_36ae1f4a9778c321( metabone_state, data_type )
{
    foreach ( data in metabone_state.metadata )
    {
        if ( data.variant_type == data_type )
        {
            return data.variant_object;
        }
    }
    
    return undefined;
}

// Namespace metabone
// Params 1
// Checksum 0x6d2c215e, Offset: 0x25e2
// Size: 0x60
function function_3e1e54de9c8abc35( var_5306b5e9cae7d5d3 )
{
    metabones_def = undefined;
    
    if ( isdefined( level.metabones_defs ) )
    {
        metabones_def = level.metabones_defs[ var_5306b5e9cae7d5d3 ];
    }
    
    if ( !isdefined( metabones_def ) )
    {
        metabones_def = function_c72068a54dd6d1a1( var_5306b5e9cae7d5d3 );
        level.metabones_defs[ var_5306b5e9cae7d5d3 ] = metabones_def;
    }
    
    assert( isdefined( metabones_def ) );
    return metabones_def;
}

// Namespace metabone
// Params 1, eflags: 0x4
// Checksum 0x2875170a, Offset: 0x264b
// Size: 0x192
function private function_c72068a54dd6d1a1( var_5306b5e9cae7d5d3 )
{
    metabones_def = getscriptbundle( "metabonelist:" + var_5306b5e9cae7d5d3 );
    metabones_def.var_2972332beaa5b174 = [];
    
    for ( metabone_index = 0; metabone_index < metabones_def.metabones.size ; metabone_index++ )
    {
        metabone = metabones_def.metabones[ metabone_index ];
        
        if ( !isdefined( metabone.name ) || metabone.name == "" )
        {
            metabone.name = string( metabone_index );
        }
        
        if ( isdefined( metabones_def.var_2972332beaa5b174[ metabone.name ] ) )
        {
            assertmsg( "<dev string:x1a3>" + var_5306b5e9cae7d5d3 + "<dev string:x1af>" + metabone.name + "<dev string:x1d7>" );
            metabone.name = string( metabone_index );
        }
        
        metabones_def.var_2972332beaa5b174[ metabone.name ] = metabone;
        metabone.var_63e19fb21594d5a2 = [];
        
        for ( state_index = 0; state_index < metabone.states.size ; state_index++ )
        {
            state = metabone.states[ state_index ];
            state.index = state_index;
            
            if ( state.name )
            {
                metabone.var_63e19fb21594d5a2[ state.name ] = state;
            }
        }
    }
    
    return metabones_def;
}

// Namespace metabone
// Params 1, eflags: 0x4
// Checksum 0x1b93062c, Offset: 0x27e6
// Size: 0x42e
function private function_15781388b197771( var_5306b5e9cae7d5d3 )
{
    self.metabones = spawnstruct();
    self.metabones.bundle_name = var_5306b5e9cae7d5d3;
    self.metabones.info = [];
    self.metabones.stored_maxhealth = self.maxhealth;
    metabones_def = function_3e1e54de9c8abc35( self.metabones.bundle_name );
    
    foreach ( metabone in metabones_def.metabones )
    {
        metabone_info = spawnstruct();
        self.metabones.info[ metabone.name ] = metabone_info;
        metabone_info.is_active = metabone.activebydefault ?? 0;
        
        if ( metabone.states.size > 0 )
        {
            metabone_info.var_544bcf80d3c4bfba = 0;
        }
        
        function_452e9c3c677cfb85( metabone );
        
        if ( isdefined( metabone.tags ) )
        {
            foreach ( tag in metabone.tags )
            {
                if ( isdefined( tag.maxangle ) )
                {
                    tag.cosmaxangle = cos( tag.maxangle * 0.5 );
                }
            }
        }
        
        if ( isdefined( metabone.hitlocations ) )
        {
            foreach ( var_cd8b5a9888b84d06 in metabone.hitlocations )
            {
                if ( isdefined( var_cd8b5a9888b84d06.maxangle ) )
                {
                    var_cd8b5a9888b84d06.cosmaxangle = cos( var_cd8b5a9888b84d06.maxangle * 0.5 );
                }
            }
        }
        
        if ( isdefined( metabone.parts ) )
        {
            if ( metabone.parts.size > 0 )
            {
                metabone.partmap = [];
                
                for ( i = 0; i < metabone.parts.size ; i++ )
                {
                    metabone_part = metabone.parts[ i ];
                    metabone.partmap[ metabone_part.partname ] = i;
                    
                    if ( isdefined( metabone_part.maxangle ) )
                    {
                        metabone_part.cosmaxangle = cos( metabone_part.maxangle * 0.5 );
                    }
                }
            }
        }
    }
    
    if ( isdefined( metabones_def.var_90ed8916f56ef56d ) && isdefined( level.var_93f9a5daebf6b466 ) && isdefined( level.var_93f9a5daebf6b466[ metabones_def.var_90ed8916f56ef56d ] ) )
    {
        callback::add( "metabone_destroyed", level.var_93f9a5daebf6b466[ metabones_def.var_90ed8916f56ef56d ] );
    }
    
    if ( isdefined( metabones_def.var_90ed8916f56ef56d ) && isdefined( level.var_9b860665f87348c8 ) && isdefined( level.var_9b860665f87348c8[ metabones_def.var_90ed8916f56ef56d ] ) )
    {
        callback::add( "metabone_damaged_not_destroyed", level.var_9b860665f87348c8[ metabones_def.var_90ed8916f56ef56d ] );
    }
    
    /#
        validate_metabones();
    #/
}

// Namespace metabone
// Params 1, eflags: 0x4
// Checksum 0xae1ee7ab, Offset: 0x2c1c
// Size: 0x1aa
function private function_452e9c3c677cfb85( metabone )
{
    metabone_info = self.metabones.info[ metabone.name ];
    metabone_info.health = undefined;
    
    if ( !isdefined( metabone_info.var_9001c14ad8db7425 ) )
    {
        metabone_info.var_9001c14ad8db7425 = [];
        
        foreach ( state in metabone.var_63e19fb21594d5a2 )
        {
            damageable_data = function_36ae1f4a9778c321( state, "Types_Damageable" );
            
            if ( isdefined( damageable_data ) )
            {
                metabone_info.var_9001c14ad8db7425[ state.index ] = function_159026b8b70ff467( self, damageable_data );
            }
        }
    }
    
    if ( isdefined( metabone_info.var_9001c14ad8db7425[ metabone_info.var_544bcf80d3c4bfba ] ) )
    {
        metabone_info.health = metabone_info.var_9001c14ad8db7425[ metabone_info.var_544bcf80d3c4bfba ];
        return;
    }
    
    var_26517a1aa9262796 = function_a4f4ee60be8ebe7b( metabone, "Types_Damageable" );
    
    if ( isdefined( var_26517a1aa9262796 ) )
    {
        assert( metabone_info.var_9001c14ad8db7425.size <= 0, "<dev string:x1dc>" + metabone.name );
        metabone_info.health = function_159026b8b70ff467( self, var_26517a1aa9262796 );
    }
}

// Namespace metabone
// Params 2, eflags: 0x4
// Checksum 0xcc1bcefb, Offset: 0x2dce
// Size: 0x88
function private function_159026b8b70ff467( entity, damageable_data )
{
    if ( damageable_data.absolutehealth )
    {
        return damageable_data.health;
    }
    
    assert( isdefined( entity.maxhealth ), "<dev string:x58>" + entity getentitynumber() + "<dev string:x224>" + entity.metabones.bundle_name + "<dev string:x123>" );
    return damageable_data.health * entity.maxhealth;
}

/#

    // Namespace metabone
    // Params 0, eflags: 0x4
    // Checksum 0x97e3e373, Offset: 0x2e5f
    // Size: 0x1ae, Type: dev
    function private validate_metabones()
    {
        metabones_def = function_3e1e54de9c8abc35( self.metabones.bundle_name );
        
        foreach ( metabone in metabones_def.metabones )
        {
            if ( isdefined( metabone.tags ) && self.metabones.info[ metabone.name ].is_active )
            {
                foreach ( tag in metabone.tags )
                {
                    assert( isdefined( self gettagindex( tag.tagname ) ), "<dev string:x58>" + self getentitynumber() + "<dev string:x64>" + tag.tagname + "<dev string:x7f>" + metabone.name + "<dev string:x93>" + self.metabones.bundle_name + "<dev string:x9d>" );
                }
            }
        }
    }

    // Namespace metabone
    // Params 0, eflags: 0x4
    // Checksum 0xeabc96f2, Offset: 0x3015
    // Size: 0x587, Type: dev
    function private debug_metabones()
    {
        if ( level.var_5656a3e2dbd51f5f )
        {
            return;
        }
        
        level.var_5656a3e2dbd51f5f = 1;
        level endon( "<dev string:x245>" );
        devgui::function_9082edeb5db93280( "<dev string:x253>" );
        devgui::function_eaac4ba4b3caf621( "<dev string:x268>", @"debug_metabones" );
        devgui::function_502a7d5e4d9dfa5b( "<dev string:x285>", "<dev string:x2a6>", &function_2d207b2301e14996 );
        devgui::function_77df7fe7dd273e10();
        
        while ( true )
        {
            if ( getdvarint( @"debug_metabones", 0 ) <= 0 )
            {
                waitframe();
                continue;
            }
            
            entity_num = getdvarint( @"hash_cb5d8071bd842694", -1 );
            entity = getentbynum( entity_num );
            
            if ( !isalive( entity ) )
            {
                entity_num = function_cf6713d9938a16d5();
                entity = getentbynum( entity_num );
            }
            
            if ( isdefined( entity ) && isdefined( entity.metabones ) )
            {
                print_x = 400;
                print_y = 200;
                var_c0120496c3299fb1 = 30;
                printtoscreen2d( print_x, print_y, "<dev string:x2c8>" );
                metabones_def = function_3e1e54de9c8abc35( entity.metabones.bundle_name );
                
                foreach ( metabone in metabones_def.metabones )
                {
                    print_y += 40;
                    metabone_info = entity.metabones.info[ metabone.name ];
                    var_22e9e9c48204b51 = ( 1, 1, 1 );
                    var_a9485e6a874a730a = metabone.name;
                    
                    if ( !metabone_info.is_active )
                    {
                        var_a9485e6a874a730a += "<dev string:x2d5>";
                        var_22e9e9c48204b51 = ( 0.6, 0.6, 0.6 );
                    }
                    
                    if ( entity is_destroyed( metabone ) )
                    {
                        var_a9485e6a874a730a += "<dev string:x2e4>";
                        var_22e9e9c48204b51 = ( 0.7, 0.7, 0.7 );
                    }
                    
                    printtoscreen2d( print_x, print_y, var_a9485e6a874a730a, var_22e9e9c48204b51, 1 );
                    state_name = undefined;
                    print_y += 18;
                    
                    if ( isdefined( metabone_info.var_544bcf80d3c4bfba ) )
                    {
                        state = metabone.states[ metabone_info.var_544bcf80d3c4bfba ];
                        var_169020cf8ff43468 = "<dev string:x2f4>" + metabone_info.var_544bcf80d3c4bfba;
                        
                        if ( isdefined( state.name ) )
                        {
                            state_name = state.name;
                            var_169020cf8ff43468 = "<dev string:x2ff>" + state.name + "<dev string:x304>";
                        }
                        
                        printtoscreen2d( print_x + var_c0120496c3299fb1, print_y, var_169020cf8ff43468, var_22e9e9c48204b51 );
                    }
                    
                    print_y += 18;
                    hurt_col = undefined;
                    
                    if ( isdefined( metabone_info.health ) )
                    {
                        max_health = entity function_7b81be2ff0d35c4f( metabone.name, state_name );
                        health_percentage = "<dev string:x309>";
                        
                        if ( isdefined( max_health ) )
                        {
                            health_percentage = "<dev string:x30d>" + metabone_info.health / max_health * 100 + "<dev string:x313>";
                        }
                        
                        health_col = var_22e9e9c48204b51;
                        
                        if ( isdefined( state_name ) && entity.var_e9337184e37620f.metabonename == metabone.name && gettime() - ( entity.var_e9337184e37620f.timehit ?? 0 ) < 100 )
                        {
                            hurt_col = ( 0.1, 1, 0.1 );
                            health_col = hurt_col;
                        }
                        
                        printtoscreen2d( print_x + var_c0120496c3299fb1, print_y, "<dev string:x319>" + metabone_info.health + health_percentage, health_col );
                    }
                    else
                    {
                        printtoscreen2d( print_x + var_c0120496c3299fb1, print_y, "<dev string:x325>", var_22e9e9c48204b51 );
                    }
                    
                    if ( entity isscriptable() )
                    {
                        if ( entity getscriptablehaspart( metabone.name ) )
                        {
                            scriptable_state = entity getscriptablepartstate( metabone.name, 1 );
                            
                            if ( isdefined( scriptable_state ) )
                            {
                                print_y += 18;
                                printtoscreen2d( print_x + var_c0120496c3299fb1, print_y, "<dev string:x334>" + scriptable_state, var_22e9e9c48204b51 );
                            }
                        }
                    }
                    
                    if ( !entity is_destroyed( metabone ) )
                    {
                        if ( isdefined( metabone.tags ) )
                        {
                            foreach ( tag in metabone.tags )
                            {
                                tagorigin = entity gettagorigin( tag.tagname, 1 );
                                
                                if ( isdefined( tagorigin ) )
                                {
                                    tag_color = metabone_info.is_active ? ( 0.2, 0.2, 1 ) : hurt_col ?? ( 0.7, 0.1, 0.1 );
                                    sphere( tagorigin, tag.radius, tag_color, 1 );
                                    print3d( tagorigin, metabone.name, tag_color, 1, 0.25 );
                                }
                            }
                        }
                    }
                }
            }
            
            waitframe();
        }
    }

    // Namespace metabone
    // Params 1, eflags: 0x4
    // Checksum 0x15fecb7d, Offset: 0x35a4
    // Size: 0x23, Type: dev
    function private function_2d207b2301e14996( params )
    {
        setdvar( @"hash_cb5d8071bd842694", function_cf6713d9938a16d5() );
    }

    // Namespace metabone
    // Params 0, eflags: 0x4
    // Checksum 0x13f9a3a8, Offset: 0x35cf
    // Size: 0x57, Type: dev
    function private function_cf6713d9938a16d5()
    {
        look_pos = devgui::function_97024c0a6d1256a6();
        
        if ( isdefined( look_pos ) )
        {
            nearby_ai = getaiarrayinradius( look_pos, 512 );
            
            if ( isdefined( nearby_ai ) )
            {
                entity = function_47c86977a18df38b( nearby_ai, look_pos );
                
                if ( isdefined( entity ) )
                {
                    return entity getentitynumber();
                }
            }
        }
        
        return -1;
    }

#/
