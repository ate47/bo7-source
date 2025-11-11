#using scripts\common\callbacks;
#using scripts\common\script;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\common\vehicle;
#using scripts\common\vehicle_interact;
#using scripts\common\vehicle_occupancy;
#using scripts\common\vehicle_omnvar_utility;
#using scripts\common\vehicle_spawn;
#using scripts\common\vehicle_tracking;
#using scripts\engine\math;
#using scripts\engine\scriptable;
#using scripts\engine\utility;

#namespace vehicle_damage;

// Namespace vehicle_damage
// Params 1
// Checksum 0xb9eef53b, Offset: 0x9b9
// Size: 0xb8
function set_can_damage( bool )
{
    linkedents = self getlinkedchildren( 1 );
    
    if ( isdefined( linkedents ) )
    {
        foreach ( linkedent in linkedents )
        {
            if ( linkedent.code_classname == "misc_turret" )
            {
                linkedent setcandamage( bool );
            }
        }
    }
    
    self setcandamage( bool );
    function_8a2d9000eaf56a61( self );
}

// Namespace vehicle_damage
// Params 3
// Checksum 0xf73ecead, Offset: 0xa79
// Size: 0x155
function get_data( vehicleref, create, var_e6c819f806ce2c86 )
{
    if ( create && ( !vehicle::has_data( vehicleref ) || !isdefined( vehicle::get_data( vehicleref ).damage ) || !isdefined( vehicle::get_data( vehicleref ).damage.class ) ) )
    {
        data = undefined;
        
        if ( !vehicle::has_data( vehicleref ) )
        {
            data = spawnstruct();
        }
        else
        {
            data = vehicle::get_data( vehicleref );
        }
        
        if ( !isdefined( data.damage ) )
        {
            data.damage = spawnstruct();
        }
        
        data.damage.damagestatedata = [];
        data.damage.class = "none";
        data.damage.visualpercents = [];
        data.damage.visualcallbacks = [];
        data.damage.visualclearcallbacks = [];
        vehicle::add_data( vehicleref, data );
    }
    
    if ( vehicle::has_data( vehicleref ) )
    {
        return vehicle::get_data( vehicleref ).damage;
    }
}

// Namespace vehicle_damage
// Params 3
// Checksum 0xf5e39224, Offset: 0xbd6
// Size: 0xc5
function function_29894e0fa6bf739( vehicle, create, var_e6c819f806ce2c86 )
{
    instancedataforvehicle = vehicle.damagedata;
    
    if ( !isdefined( instancedataforvehicle ) )
    {
        if ( create )
        {
            instancedataforvehicle = spawnstruct();
            vehicle.damagedata = instancedataforvehicle;
            instancedataforvehicle.destroyscoreevent = undefined;
            instancedataforvehicle.destroyscorelaunchonly = undefined;
            instancedataforvehicle.destroyaward = undefined;
            instancedataforvehicle.destroyawardlaunchonly = undefined;
            instancedataforvehicle.heavydamagescoreevent = undefined;
            instancedataforvehicle.heavydamagescorelaunchonly = undefined;
            instancedataforvehicle.heavydamageaward = undefined;
            instancedataforvehicle.heavydamageawardlaunchonly = undefined;
        }
        else if ( !var_e6c819f806ce2c86 )
        {
            assertmsg( "<dev string:x24>" );
        }
    }
    
    return instancedataforvehicle;
}

// Namespace vehicle_damage
// Params 1
// Checksum 0xaa1ab6ee, Offset: 0xca4
// Size: 0x17
function deregister_instance( vehicle )
{
    vehicle.damagedata = undefined;
}

// Namespace vehicle_damage
// Params 4
// Checksum 0x86acba55, Offset: 0xcc3
// Size: 0xa5
function function_9a9c7f377e631a4d( vehicleref, stateref, create, var_e6c819f806ce2c86 )
{
    leveldataforvehicle = get_data( vehicleref, create, var_e6c819f806ce2c86 );
    leveldatafordamagestate = leveldataforvehicle.damagestatedata[ stateref ];
    
    if ( !isdefined( leveldatafordamagestate ) )
    {
        if ( create )
        {
            leveldatafordamagestate = spawnstruct();
            leveldataforvehicle.damagestatedata[ stateref ] = leveldatafordamagestate;
            leveldatafordamagestate.onentercallback = undefined;
            leveldatafordamagestate.onexitcallback = undefined;
        }
        else if ( !var_e6c819f806ce2c86 )
        {
            assertmsg( "<dev string:x7b>" );
        }
    }
    
    return leveldatafordamagestate;
}

// Namespace vehicle_damage
// Params 3
// Checksum 0x324f9893, Offset: 0xd71
// Size: 0xb9
function clear_visuals( data, changed, fromdeath )
{
    leveldataforvehicle = get_data( vehicle::get_ref(), 0, 1 );
    
    if ( isdefined( leveldataforvehicle ) )
    {
        foreach ( callback in leveldataforvehicle.visualclearcallbacks )
        {
            self thread [[ callback ]]( data, changed, fromdeath );
        }
    }
}

// Namespace vehicle_damage
// Params 0
// Checksum 0x849e9117, Offset: 0xe32
// Size: 0x12
function function_38da7f8b8c6a4560()
{
    add_health( self.maxhealth );
}

// Namespace vehicle_damage
// Params 1
// Checksum 0x98d50e99, Offset: 0xe4c
// Size: 0x68
function add_health( var_27f5fc9f07f89733 )
{
    self.health = int( min( self.health + var_27f5fc9f07f89733, self.maxhealth ) );
    leveldataforvehicle = get_data( vehicle::get_ref(), undefined, 1 );
    
    if ( !isdefined( leveldataforvehicle ) )
    {
        return;
    }
    
    function_ef5c9d683bcae0c7( undefined, 0, 1 );
    vehicle_omnvar::function_ca8a66bb3a611610( self );
}

// Namespace vehicle_damage
// Params 1
// Checksum 0xf002dfea, Offset: 0xebc
// Size: 0x51
function set_health( healthtoset )
{
    self.health = int( healthtoset );
    leveldataforvehicle = get_data( vehicle::get_ref(), undefined, 1 );
    
    if ( !isdefined( leveldataforvehicle ) )
    {
        return;
    }
    
    function_ef5c9d683bcae0c7( undefined, 0, 1 );
    vehicle_omnvar::function_ca8a66bb3a611610( self );
}

// Namespace vehicle_damage
// Params 8
// Checksum 0x74133aec, Offset: 0xf15
// Size: 0x19a
function function_c95ff728d8d53bce( vehicle, player, idamage, idflags, shitloc, smeansofdeath, eattacker, objweapon )
{
    if ( !vehicle_occupancy::function_b20cd24c7d75deeb( vehicle ) )
    {
        return idamage;
    }
    
    seatid = vehicle_occupancy::function_338f50d73ebf6fe4( vehicle, player );
    
    if ( !isdefined( seatid ) )
    {
        return idamage;
    }
    
    leveldataforvehicle = get_data( vehicle vehicle::get_ref() );
    seatdata = vehicle_occupancy::function_568cd324ac705619( vehicle vehicle::get_ref(), seatid );
    
    if ( isdefined( leveldataforvehicle.occupantdamagescale ) && isdefined( leveldataforvehicle.occupantdamagescale[ seatid ] ) )
    {
        idamage *= leveldataforvehicle.occupantdamagescale[ seatid ];
    }
    
    if ( isdefined( leveldataforvehicle.occupantdamageclamp ) && isdefined( leveldataforvehicle.occupantdamageclamp[ seatid ] ) )
    {
        idamage = clamp( idamage, 0, leveldataforvehicle.occupantdamageclamp[ seatid ] );
    }
    
    if ( isdefined( seatdata.var_86386389c0f70b5d ) && isdefined( seatdata ) && isdefined( idflags ) && idflags & 8 && !( idflags & 16384 ) && !player isinvehicleleanout() && !( utility::callsharedfunc( #"damage", #"isheadshot", shitloc, smeansofdeath, eattacker ) && isdefined( objweapon ) && weaponclass( objweapon ) == "sniper" ) )
    {
        idamage *= seatdata.var_86386389c0f70b5d;
    }
    
    return idamage;
}

// Namespace vehicle_damage
// Params 15, eflags: 0x4
// Checksum 0x3afd42cd, Offset: 0x10b8
// Size: 0x1a2
function private function_84328709396bb762( attacker, victim, damage, objweapon, meansofdeath, inflictor, point, direction_vec, modelname, attachtagname, partname, tagname, idflags, eventid, hitloc )
{
    struct = spawnstruct();
    struct.attacker = attacker;
    struct.victim = victim;
    struct.damage = damage;
    struct.objweapon = objweapon;
    struct.meansofdeath = meansofdeath;
    struct.inflictor = inflictor;
    struct.point = point;
    struct.direction_vec = direction_vec;
    struct.modelname = modelname;
    struct.attachtagname = attachtagname;
    struct.partname = partname;
    struct.tagname = tagname;
    struct.idflags = idflags;
    struct.damageflags = idflags;
    struct.eventid = eventid;
    struct.hitloc = hitloc;
    
    if ( isdefined( struct.attacker ) )
    {
        struct.attacker.assistedsuicide = 0;
    }
    
    return struct;
}

// Namespace vehicle_damage
// Params 0
// Checksum 0xfa56f267, Offset: 0x1263
// Size: 0x3d6
function function_94850857710e138d()
{
    self endon( "death" );
    ref = vehicle::get_ref();
    vehicledata = get_data( ref );
    
    while ( true )
    {
        var_371ef2ba49d636c5 = self.health;
        self waittill( "damage", amount, attacker, direction_vec, damagelocation, meansofdeath, modelname, attachtagname, partname, dflags, objweapon, origin, angles, normal, inflictor, time );
        partname = vehicle::function_d88b357b027cbaed( partname );
        attachtagname = vehicle::function_d88b357b027cbaed( attachtagname );
        data = function_84328709396bb762( attacker, self, amount, objweapon, meansofdeath, inflictor, damagelocation, direction_vec, modelname, attachtagname, partname, dflags, undefined, damagelocation );
        
        if ( isdefined( data.attacker ) && data.attacker.classname == "worldspawn" )
        {
            data.attacker = undefined;
        }
        
        if ( !isplayer( data.attacker ) )
        {
            if ( isdefined( data.attacker ) && isdefined( data.attacker.owner ) )
            {
                data.attacker = data.attacker.owner;
            }
            else if ( isdefined( data.inflictor ) )
            {
                if ( isplayer( data.inflictor ) )
                {
                    data.attacker = data.inflictor;
                }
                else
                {
                    data.attacker = data.inflictor.owner;
                }
            }
            else
            {
                data.attacker = undefined;
            }
        }
        
        if ( data.damage <= 0 )
        {
            continue;
        }
        
        if ( self.godmode || level.vehiclegod )
        {
            self.health = self.maxhealth;
            continue;
        }
        
        new_damage = data.damage;
        
        if ( data.objweapon )
        {
            new_damage = get_hit_damage( data.damage, self, data.objweapon );
            
            if ( data.damage == new_damage )
            {
                new_damage = get_mod_damage( data.damage, self, data.objweapon, data.attacker );
            }
        }
        
        if ( data.damage != new_damage )
        {
            data.damage = new_damage;
            var_c833e6f08a4e3e09 = clamp( ( var_371ef2ba49d636c5 - data.damage ) / self.maxhealth, 0, 1 );
            
            if ( var_c833e6f08a4e3e09 > 0 )
            {
                self setnormalhealth( var_c833e6f08a4e3e09 );
            }
        }
        else if ( vehicledata.var_dc3a1788b82d490d )
        {
            data.damage = 0;
            var_c833e6f08a4e3e09 = clamp( var_371ef2ba49d636c5 / self.maxhealth, 0, 1 );
            self setnormalhealth( var_c833e6f08a4e3e09 );
            continue;
        }
        
        callback::callback( #"vehicle_damage", data );
        var_81430703f4f6c83d = function_eefd0f962152cc9f( self, data, data.damage );
        log_event( self, data );
        update_state( data, 0, 1 );
        vehicle_omnvar::function_ca8a66bb3a611610( self, data );
        thread vehicle_interact::on_damage( data );
        vehicle_occupancy::function_4a74835a652d1d7d( data );
    }
}

// Namespace vehicle_damage
// Params 0
// Checksum 0xdb4541b6, Offset: 0x1641
// Size: 0x3c
function function_7a749bb684749078()
{
    self waittill( "death" );
    
    if ( !isdefined( self ) || self.isdestroyed )
    {
        return;
    }
    
    if ( utility::issp() && self.var_e0b54303300bc72a )
    {
        return;
    }
    
    vehicle::explode();
}

// Namespace vehicle_damage
// Params 0
// Checksum 0xe3c35fe4, Offset: 0x1685
// Size: 0x59c
function function_56038afb3e96ac8e()
{
    self endon( "death" );
    
    if ( !utility::issharedfuncdefined( #"game_utility", #"createProjectilePartition" ) )
    {
        return;
    }
    
    createProjectilePartition = utility::getsharedfunc( #"game_utility", #"createProjectilePartition" );
    function_8327b9cd020cadb4();
    castcontents = physics_createcontents( [ "physicscontents_missileclip", "physicscontents_vehicle", "physicscontents_glass", "physicscontents_water", "physicscontents_item" ] );
    
    while ( true )
    {
        if ( !isdefined( self.reactivearmor ) || self.reactivearmor.size == 0 || !isdefined( self.origin ) )
        {
            break;
        }
        
        if ( self.reactivearmordisabled )
        {
            waitframe();
            continue;
        }
        
        friendlyteam = vehicle_occupancy::function_88fc32afbd317644( self );
        [[ createProjectilePartition ]]();
        
        foreach ( projectilearray in level.projectilepartition utility::function_92fef8fe5211a388( self.origin ) )
        {
            foreach ( projectile in projectilearray )
            {
                if ( !( isdefined( projectile ) && isdefined( projectile.origin ) ) )
                {
                    continue;
                }
                
                if ( distancesquared( projectile.origin, self.origin ) > 160000 )
                {
                    continue;
                }
                
                owner = projectile.owner;
                
                if ( !isdefined( owner ) && isdefined( projectile.weapon_name ) && weaponclass( projectile.weapon_name ) == "grenade" )
                {
                    owner = getmissileowner( projectile );
                }
                
                var_7abb8ea921e296dc = 1;
                
                /#
                    if ( getdvarint( @"hash_3c6c485214ca7673", 0 ) == 1 )
                    {
                        var_7abb8ea921e296dc = 0;
                    }
                #/
                
                if ( var_7abb8ea921e296dc && isdefined( owner ) && friendlyteam == owner.team )
                {
                    continue;
                }
                
                /#
                    if ( getdvarint( @"hash_b16f847dc3049239" ) )
                    {
                        sphere( projectile.origin, 15, ( 1, 0, 0 ) );
                    }
                #/
                
                projectileorigin = projectile.origin;
                
                foreach ( tagname, data in self.reactivearmor )
                {
                    tagorigin = self gettagorigin( tagname );
                    totag = projectileorigin - tagorigin;
                    angle = math::anglebetweenvectors( totag, anglestoforward( self gettagangles( tagname ) ) );
                    
                    if ( angle > 30 )
                    {
                        continue;
                    }
                    
                    castresults = physics_raycast( tagorigin, projectileorigin, castcontents, [ self, projectile ], 0, "physicsquery_closest" );
                    
                    if ( isdefined( castresults ) && castresults.size > 0 )
                    {
                        continue;
                    }
                    
                    isleft = issubstr( tagname, "left" );
                    var_a46a0429c19e3841 = undefined;
                    
                    foreach ( othertag, data in utility::array_randomize_objects( self.reactivearmor ) )
                    {
                        if ( othertag == tagname || issubstr( othertag, "left" ) != isleft )
                        {
                            continue;
                        }
                        
                        var_a46a0429c19e3841 = othertag;
                        break;
                    }
                    
                    kill_part( self, tagname, undefined, 1 );
                    
                    if ( isdefined( var_a46a0429c19e3841 ) )
                    {
                        kill_part( self, var_a46a0429c19e3841, undefined, 1 );
                    }
                    
                    if ( isdefined( self.var_ebb6178b34de4d4f ) )
                    {
                        self thread [[ self.var_ebb6178b34de4d4f ]]();
                    }
                    
                    destroy_projectile( projectile );
                    break;
                }
            }
        }
        
        /#
            if ( getdvarint( @"hash_b16f847dc3049239" ) )
            {
                sphere( self.origin, 400, ( 0, 0, 1 ) );
                
                foreach ( tagname, data in self.reactivearmor )
                {
                    start = self gettagorigin( tagname );
                    end = start + anglestoforward( self gettagangles( tagname ) ) * 250;
                    line( start, end, ( 0, 0, 1 ) );
                }
            }
        #/
        
        waitframe();
    }
}

// Namespace vehicle_damage
// Params 1
// Checksum 0x1cb8872c, Offset: 0x1c29
// Size: 0x182
function destroy_projectile( target )
{
    target setcandamage( 0 );
    target.exploding = 1;
    target stopsounds();
    
    if ( !isdefined( target.owner ) )
    {
        return;
    }
    
    if ( isplayer( target.owner ) )
    {
        target.owner utility::callsharedfunc( #"damage", #"updatedamagefeedback", "reactivearmorexplosion" );
    }
    
    self.reactivearmorexplosion.origin = target.origin;
    up = target.origin - self.origin;
    right = up + ( 1, 0, 0 );
    forward = vectorcross( up, right );
    right = vectorcross( forward, up );
    self.reactivearmorexplosion.angles = axistoangles( forward, right, up );
    
    if ( self.explode1available )
    {
        self.reactivearmorexplosion setscriptablepartstate( "explode1", "activeDirectional", 0 );
        self.explode1available = 0;
    }
    else
    {
        self.reactivearmorexplosion setscriptablepartstate( "explode2", "activeDirectional", 0 );
        self.explode1available = 1;
    }
    
    if ( target.streakname == "cruise_predator" )
    {
        target notify( "trophy_blocked" );
        return;
    }
    
    target delete();
}

// Namespace vehicle_damage
// Params 0, eflags: 0x4
// Checksum 0xdb60f2bd, Offset: 0x1db3
// Size: 0x4f
function private function_8327b9cd020cadb4()
{
    self.explode1available = 1;
    self.reactivearmorexplosion = spawnscriptable( vehicle::get_data( vehicle::get_ref() ).tank.reactivearmorexplosion ?? %"hash_7f2b644720862187", self.origin );
}

// Namespace vehicle_damage
// Params 1
// Checksum 0x42e1d59b, Offset: 0x1e0a
// Size: 0x1e
function function_64d13c7869b93433( vehicleref )
{
    return get_data( vehicleref ).var_5e5dc92250389a1f;
}

// Namespace vehicle_damage
// Params 1
// Checksum 0x59f20e13, Offset: 0x1e31
// Size: 0x1e
function function_18d800e98361417f( vehicleref )
{
    return get_data( vehicleref ).var_4adaed6d37ec6c16;
}

// Namespace vehicle_damage
// Params 2
// Checksum 0x174c2cef, Offset: 0x1e58
// Size: 0x37
function function_b84ee64d4e9bd27f( vehicleref, expdamageradiussq )
{
    leveldataforvehicle = get_data( vehicleref );
    leveldataforvehicle.expdamageradiussq = expdamageradiussq;
}

// Namespace vehicle_damage
// Params 2
// Checksum 0xdb308748, Offset: 0x1e97
// Size: 0x1cc
function activate_parts( vehicle, spawndata )
{
    leveldataforvehicle = get_data( vehicle vehicle::get_ref(), 0, 1 );
    ishusk = vehicle vehicle::is_husk();
    tags = undefined;
    
    if ( isdefined( spawndata.damageableparts ) )
    {
        tags = spawndata.damageableparts;
    }
    else if ( ishusk )
    {
        tags = leveldataforvehicle.var_4adaed6d37ec6c16;
    }
    else
    {
        tags = leveldataforvehicle.var_5e5dc92250389a1f;
    }
    
    if ( isdefined( tags ) )
    {
        vehicle.damageableparts = [];
        
        foreach ( tagname, damageablepartdata in tags )
        {
            if ( damageablepartdata.inactive )
            {
                continue;
            }
            
            instancedata = { #damaged:damageablepartdata.damaged, #explosivedamagehealthvalue:damageablepartdata.explosivedamagehealthvalue, #healthvalue:damageablepartdata.healthvalue };
            vehicle.damageableparts[ tagname ] = instancedata;
            
            if ( damageablepartdata.isreactivearmor && !ishusk )
            {
                if ( !isdefined( vehicle.reactivearmor ) )
                {
                    vehicle.reactivearmor = [];
                }
                
                vehicle.reactivearmor[ tagname ] = instancedata;
            }
        }
    }
    
    if ( isdefined( vehicle.reactivearmor ) )
    {
        vehicle thread function_56038afb3e96ac8e();
    }
}

// Namespace vehicle_damage
// Params 2
// Checksum 0x2c1a0f10, Offset: 0x206b
// Size: 0xf8
function activate_part( vehicle, tag )
{
    if ( !( isdefined( vehicle ) && isdefined( tag ) ) )
    {
        return 0;
    }
    
    data = get_data( vehicle vehicle::get_ref() );
    tags = undefined;
    
    if ( vehicle vehicle::is_husk() )
    {
        tags = data.var_4adaed6d37ec6c16;
    }
    else
    {
        tags = data.var_5e5dc92250389a1f;
    }
    
    if ( !isdefined( tags[ tag ] ) )
    {
        return 0;
    }
    
    damageablepartdata = spawnstruct();
    damageablepartdata.healthvalue = tags[ tag ].healthvalue;
    damageablepartdata.explosivedamagehealthvalue = tags[ tag ].explosivedamagehealthvalue;
    
    if ( !isdefined( vehicle.damageableparts ) )
    {
        vehicle.damageableparts = [];
    }
    
    vehicle.damageableparts[ tag ] = damageablepartdata;
    vehicle setscriptablepartstate( tag, "default" );
}

// Namespace vehicle_damage
// Params 1
// Checksum 0x431593f6, Offset: 0x216b
// Size: 0xf9
function deactivate_wheels( vehicle )
{
    if ( !isdefined( vehicle ) || !vehicle vehicle::is_vehicle() )
    {
        return;
    }
    
    data = get_data( vehicle vehicle::get_ref() );
    
    if ( !isdefined( data ) )
    {
        return;
    }
    
    tags = vehicle vehicle::is_husk() ? data.var_4adaed6d37ec6c16 : data.var_5e5dc92250389a1f;
    
    if ( !isdefined( tags ) )
    {
        return;
    }
    
    foreach ( tagname, damageablepartdata in tags )
    {
        if ( isdefined( damageablepartdata.wheelref ) )
        {
            deactivate_part( vehicle, tagname );
        }
    }
}

// Namespace vehicle_damage
// Params 1
// Checksum 0x77c9aa3b, Offset: 0x226c
// Size: 0xf9
function function_2503ae8a3537c782( vehicle )
{
    if ( !isdefined( vehicle ) || !vehicle vehicle::is_vehicle() )
    {
        return;
    }
    
    data = get_data( vehicle vehicle::get_ref() );
    
    if ( !isdefined( data ) )
    {
        return;
    }
    
    tags = vehicle vehicle::is_husk() ? data.var_4adaed6d37ec6c16 : data.var_5e5dc92250389a1f;
    
    if ( !isdefined( tags ) )
    {
        return;
    }
    
    foreach ( tagname, damageablepartdata in tags )
    {
        if ( isdefined( damageablepartdata.doorref ) )
        {
            deactivate_part( vehicle, tagname );
        }
    }
}

// Namespace vehicle_damage
// Params 2
// Checksum 0xabd3e687, Offset: 0x236d
// Size: 0x47
function deactivate_part( vehicle, tag )
{
    if ( !( isdefined( vehicle ) && isdefined( tag ) ) )
    {
        return 0;
    }
    
    if ( !isdefined( vehicle.damageableparts[ tag ] ) )
    {
        return 0;
    }
    
    vehicle.damageableparts[ tag ] = undefined;
}

// Namespace vehicle_damage
// Params 1
// Checksum 0x596425df, Offset: 0x23bc
// Size: 0x22b
function function_45cd8b1d7ce8e74( vehicle )
{
    if ( !isdefined( vehicle ) || !vehicle vehicle::is_vehicle() || vehicle vehicle::is_husk() )
    {
        return;
    }
    
    data = vehicle::get_data( vehicle vehicle::get_ref() );
    tags = data.damage.var_5e5dc92250389a1f;
    
    if ( !( isdefined( vehicle.damageableparts ) && isdefined( data.interact.lights ) && isdefined( data.interact ) && isdefined( data ) && isdefined( tags ) ) )
    {
        return;
    }
    
    foreach ( tag, light in data.interact.lights )
    {
        if ( !isdefined( vehicle.damageableparts[ tag ] ) || !function_63ddfcea9493cb5( vehicle.damageableparts[ tag ] ) )
        {
            continue;
        }
        
        if ( !isdefined( tags[ tag ] ) )
        {
            return;
        }
        
        vehicle.damageableparts[ tag ] = spawnstruct();
        vehicle.damageableparts[ tag ].healthvalue = tags[ tag ].healthvalue;
        vehicle.damageableparts[ tag ].explosivedamagehealthvalue = tags[ tag ].explosivedamagehealthvalue;
        state = "off";
        
        if ( vehicle.enginelightson )
        {
            if ( light.type == "engine_is_on_day_and_night" )
            {
                state = "on";
            }
            else if ( utility::isnightmap() && light.type == "engine_is_on_at_night" )
            {
                state = "on";
            }
        }
        
        vehicle setscriptablepartstate( tag, state );
        break;
    }
}

// Namespace vehicle_damage
// Params 3
// Checksum 0xed2e3a2d, Offset: 0x25ef
// Size: 0x3cd
function function_eefd0f962152cc9f( vehicle, damagedata, unmodifieddamage )
{
    damagemultiplier = 1;
    tagnames = function_f983e067957101f2( vehicle, damagedata );
    ref = vehicle vehicle::get_ref();
    vehicledata = get_data( ref );
    
    /#
        if ( getdvarint( @"hash_d6a84652bcb25596", 0 ) == 1 && tagnames.size > 0 )
        {
            string = "<dev string:xc9>";
            
            foreach ( tag in tagnames )
            {
                string += tag + "<dev string:xd2>";
            }
            
            string += "<dev string:xd8>" + unmodifieddamage;
            iprintlnbold( string );
        }
    #/
    
    foreach ( tagname in tagnames )
    {
        if ( !function_ea5f5ad915b3206f( vehicle, tagname, damagedata ) )
        {
            continue;
        }
        
        if ( isdefined( vehicledata.damageableparts[ tagname ].wheelref ) )
        {
            damagedata.iswheeldamage = 1;
        }
        else if ( isdefined( vehicledata.damageableparts[ tagname ].doorref ) )
        {
            damagedata.isdoordamage = 1;
        }
        
        if ( isexplosivedamagemod( damagedata.meansofdeath ) )
        {
            if ( vehicledata.damageableparts[ tagname ].var_5785352fb80e135c != 0 && !vehicle.damageableparts[ tagname ].damaged && function_badd1a49fc9ab374( vehicle, tagname ) )
            {
                damage_part( vehicle, tagname );
            }
            else
            {
                var_25fa5e5ade4d01a8 = vehicle.damageableparts[ tagname ].explosivedamagehealthvalue;
                var_1f8307fc54187c6d = var_25fa5e5ade4d01a8 - unmodifieddamage;
                vehicle.damageableparts[ tagname ].explosivedamagehealthvalue = max( 0, var_1f8307fc54187c6d );
            }
            
            if ( vehicledata.damageableparts[ tagname ].blockexplosivedamage )
            {
                damagemultiplier *= 0.33;
            }
        }
        else
        {
            var_78ab58f95a296c5d = vehicle.damageableparts[ tagname ].healthvalue;
            damage = max( 0, unmodifieddamage - function_ed5d3fa7667ac54( ref, tagname ) );
            var_c6bbfef8c7c86952 = max( 0, var_78ab58f95a296c5d - damage );
            vehicle.damageableparts[ tagname ].healthvalue = var_c6bbfef8c7c86952;
            
            if ( vehicledata.damageableparts[ tagname ].blockbulletdamage )
            {
                damagemultiplier = 0.0001;
            }
        }
        
        if ( function_63ddfcea9493cb5( vehicle.damageableparts[ tagname ] ) )
        {
            kill_part( vehicle, tagname, damagedata );
            continue;
        }
        
        if ( vehicledata.damageableparts[ tagname ].var_8ff3785a03b4a866 != 0 && !vehicle.damageableparts[ tagname ].damaged && function_e2e7b1a840f99653( vehicle, tagname ) )
        {
            damage_part( vehicle, tagname );
        }
    }
    
    return damagemultiplier;
}

// Namespace vehicle_damage
// Params 1
// Checksum 0x5def890f, Offset: 0x29c5
// Size: 0x22
function function_2673f58d98e0d40b( tagname )
{
    return self.damageableparts[ tagname ].healthvalue;
}

// Namespace vehicle_damage
// Params 2
// Checksum 0x70626531, Offset: 0x29f0
// Size: 0x2f7
function function_a964146d900cef25( vehicle, damagedata )
{
    ref = vehicle vehicle::get_ref();
    
    if ( !isdefined( ref ) )
    {
        return;
    }
    
    vehicledata = get_data( ref );
    
    if ( !isdefined( vehicledata ) )
    {
        return;
    }
    
    partdata = vehicledata.damageableparts;
    
    if ( !isdefined( partdata ) )
    {
        return;
    }
    
    tagnames = function_f983e067957101f2( vehicle, damagedata );
    
    /#
        if ( getdvarint( @"hash_d6a84652bcb25596", 0 ) == 1 && tagnames.size > 0 )
        {
            string = "<dev string:xc9>";
            
            foreach ( tag in tagnames )
            {
                string += tag + "<dev string:xd2>";
            }
            
            iprintlnbold( string );
        }
    #/
    
    foreach ( tagname in tagnames )
    {
        if ( function_ea5f5ad915b3206f( vehicle, tagname, damagedata ) )
        {
            if ( !( isdefined( partdata[ tagname ] ) && isdefined( partdata[ tagname ].windowref ) ) )
            {
                continue;
            }
            
            if ( isexplosivedamagemod( damagedata.meansofdeath ) )
            {
                var_1f8307fc54187c6d = vehicle.damageableparts[ tagname ].explosivedamagehealthvalue - damagedata.damage;
                vehicle.damageableparts[ tagname ].explosivedamagehealthvalue = max( 0, var_1f8307fc54187c6d );
            }
            else
            {
                damage = max( 0, damagedata.damage - function_ed5d3fa7667ac54( ref, tagname ) );
                var_c6bbfef8c7c86952 = max( 0, vehicle.damageableparts[ tagname ].healthvalue - damage );
                vehicle.damageableparts[ tagname ].healthvalue = var_c6bbfef8c7c86952;
            }
            
            if ( function_63ddfcea9493cb5( vehicle.damageableparts[ tagname ] ) )
            {
                kill_part( vehicle, tagname, damagedata );
                continue;
            }
            
            if ( vehicledata.damageableparts[ tagname ].var_8ff3785a03b4a866 != 0 && !vehicle.damageableparts[ tagname ].damaged && function_e2e7b1a840f99653( vehicle, tagname ) )
            {
                damage_part( vehicle, tagname );
            }
        }
    }
}

// Namespace vehicle_damage
// Params 4
// Checksum 0x9d9fb63d, Offset: 0x2cef
// Size: 0xa1
function function_ad39d0a9e71456f8( instance, note, param, var_64ffacba090c91be )
{
    part = function_41bec0232e24ee41( note, "damage vehicle part " );
    data = instance.entity.damageableparts[ part ];
    
    if ( isdefined( data ) && function_badd1a49fc9ab374( instance.entity, part ) && !data.damaged )
    {
        damage_part( instance.entity, part );
    }
}

// Namespace vehicle_damage
// Params 2
// Checksum 0x2dc2173f, Offset: 0x2d98
// Size: 0x3f
function damage_part( vehicle, tagname )
{
    vehicle.damageableparts[ tagname ].damaged = 1;
    vehicle setscriptablepartstate( tagname, "damaged", 1 );
}

// Namespace vehicle_damage
// Params 4
// Checksum 0x5d81d04, Offset: 0x2ddf
// Size: 0x87
function function_6757cfd75a460ed5( instance, note, param, var_64ffacba090c91be )
{
    part = function_41bec0232e24ee41( note, "kill vehicle part " );
    data = instance.entity.damageableparts[ part ];
    
    if ( isdefined( data ) && !function_63ddfcea9493cb5( data ) )
    {
        kill_part( instance.entity, part );
    }
}

// Namespace vehicle_damage
// Params 4
// Checksum 0xa3642f4f, Offset: 0x2e6e
// Size: 0x290
function kill_part( vehicle, tagname, damagedata, reactivearmorexplosion )
{
    deathstatename = function_7b560d1e1dadd7e1( vehicle, tagname, reactivearmorexplosion );
    
    if ( vehicle getscriptableparthasstate( tagname, deathstatename ) )
    {
        vehicle setscriptablepartstate( tagname, deathstatename, 1 );
    }
    
    var_d6aa641e123523f4 = function_d1683f189b6bff40( vehicle vehicle::get_ref(), tagname );
    damageablepartdata = vehicle::get_data( vehicle vehicle::get_ref() ).damage.damageableparts[ tagname ];
    
    if ( isdefined( vehicle.damageableparts[ tagname ] ) )
    {
        vehicle.damageableparts[ tagname ].healthvalue = 0;
    }
    
    if ( isdefined( damageablepartdata ) && isdefined( damageablepartdata.wheelref ) )
    {
        if ( !isdefined( vehicle.deadwheels ) )
        {
            vehicle.deadwheels = [];
        }
        
        vehicle.deadwheels[ tagname ] = damageablepartdata;
    }
    
    if ( isdefined( damageablepartdata.windowref ) && isdefined( damageablepartdata ) && isdefined( damagedata ) && isplayer( damagedata.attacker ) )
    {
        isenemy = vehicle::function_8266feb1ae1c46bd( vehicle, damagedata.attacker );
        callback::callback( "player_shatter_window", { #isenemy:isenemy, #vehicle:vehicle, #player:damagedata.attacker } );
    }
    
    if ( isdefined( damageablepartdata ) && isdefined( damageablepartdata.doorref ) )
    {
        if ( !isdefined( vehicle.var_6711e9077cf90709 ) )
        {
            vehicle.var_6711e9077cf90709 = [];
        }
        
        vehicle.var_6711e9077cf90709[ damageablepartdata.doorref ] = 1;
        
        if ( vehicle function_2b7271a5e9ac2ec6( damageablepartdata.doorref ) )
        {
            vehicle function_c6b77e6af71ab7d6( damageablepartdata.doorref );
        }
        
        occupant = vehicle_occupancy::function_604f6aa3a5ef5250( vehicle, damageablepartdata.doorref );
        
        if ( isdefined( occupant ) )
        {
            occupant val::set( "vehicle_occupant", "vehicle_lean_out", 0 );
            vehicle_omnvar::function_ee70edd4b038cf14( vehicle, damageablepartdata.doorref, occupant );
        }
    }
    
    if ( isdefined( damageablepartdata ) && isdefined( vehicle.reactivearmor ) && damageablepartdata.isreactivearmor )
    {
        vehicle.reactivearmor[ tagname ] = undefined;
    }
    
    if ( isdefined( var_d6aa641e123523f4 ) )
    {
        vehicle thread [[ var_d6aa641e123523f4 ]]( vehicle, damagedata );
    }
}

// Namespace vehicle_damage
// Params 1
// Checksum 0x62d972e5, Offset: 0x3106
// Size: 0x2d, Type: bool
function function_e8fd01c9b2bad245( seatref )
{
    return !( isdefined( self ) && isdefined( self.var_6711e9077cf90709 ) ) || !self.var_6711e9077cf90709[ seatref ];
}

// Namespace vehicle_damage
// Params 2
// Checksum 0x5bf56088, Offset: 0x313c
// Size: 0xad
function function_c0997f62f7c7cbd8( vehicle, damagedata )
{
    if ( isdefined( vehicle.damageableparts ) )
    {
        foreach ( tagname, data in vehicle.damageableparts )
        {
            if ( !function_63ddfcea9493cb5( data ) )
            {
                kill_part( vehicle, tagname, damagedata );
            }
        }
    }
}

// Namespace vehicle_damage
// Params 1
// Checksum 0xc42100ec, Offset: 0x31f1
// Size: 0xc2
function function_df830940cda6bda( vehicle )
{
    data = get_data( vehicle vehicle::get_ref() );
    tags = undefined;
    
    if ( vehicle vehicle::is_husk() )
    {
        tags = data.var_4adaed6d37ec6c16;
    }
    else
    {
        tags = data.var_5e5dc92250389a1f;
    }
    
    foreach ( tag, data in tags )
    {
        activate_part( vehicle, tag );
    }
}

// Namespace vehicle_damage
// Params 1, eflags: 0x4
// Checksum 0x6b407fb3, Offset: 0x32bb
// Size: 0x1b1
function private function_4716d5b665e24428( vehicle )
{
    if ( isdefined( vehicle.damageableparts ) )
    {
        damageablepartdata = function_2befc25ca15fa4ef( vehicle vehicle::get_ref() );
        
        if ( !isdefined( vehicle.randomwindows ) )
        {
            windows = [];
            
            foreach ( tagname, data in vehicle.damageableparts )
            {
                if ( isdefined( damageablepartdata[ tagname ].windowref ) )
                {
                    windows[ tagname ] = data;
                }
            }
            
            vehicle.randomwindows = utility::array_randomize_objects( windows );
        }
        
        foreach ( tagname, data in vehicle.randomwindows )
        {
            if ( !function_63ddfcea9493cb5( data ) )
            {
                data.healthvalue = max( 0, data.healthvalue - randomintrange( 50, 125 ) );
                
                if ( function_63ddfcea9493cb5( data ) )
                {
                    kill_part( vehicle, tagname );
                    vehicle.randomwindows[ tagname ] = undefined;
                }
                
                break;
            }
            
            vehicle.randomwindows[ tagname ] = undefined;
        }
    }
}

// Namespace vehicle_damage
// Params 3
// Checksum 0xf32c0d4b, Offset: 0x3474
// Size: 0x7f
function hide_part( vehicle, tagname, damagedata )
{
    scriptablepartname = function_832c3ca9c66e59ba( vehicle vehicle::get_ref(), tagname );
    
    if ( vehicle getscriptableparthasstate( scriptablepartname, "hide" ) )
    {
        vehicle setscriptablepartstate( scriptablepartname, "hide" );
    }
    
    var_d6aa641e123523f4 = function_d1683f189b6bff40( vehicle vehicle::get_ref(), tagname );
    
    if ( isdefined( var_d6aa641e123523f4 ) )
    {
        vehicle thread [[ var_d6aa641e123523f4 ]]( vehicle, damagedata );
    }
}

// Namespace vehicle_damage
// Params 2
// Checksum 0xc4c3db40, Offset: 0x34fb
// Size: 0x21
function function_4d63793b20448722( vehicle, damagedata )
{
    function_fa412bafb43e1901( vehicle, 0, damagedata );
}

// Namespace vehicle_damage
// Params 2
// Checksum 0x45832cf0, Offset: 0x3524
// Size: 0x22
function function_4d53fdec4c872dbf( vehicle, damagedata )
{
    function_fa412bafb43e1901( vehicle, 1, damagedata );
}

// Namespace vehicle_damage
// Params 2
// Checksum 0x5d21bd43, Offset: 0x354e
// Size: 0x22
function function_15797dca5168f05f( vehicle, damagedata )
{
    function_fa412bafb43e1901( vehicle, 2, damagedata );
}

// Namespace vehicle_damage
// Params 2
// Checksum 0x321dfe02, Offset: 0x3578
// Size: 0x22
function function_769a396f81a9b18c( vehicle, damagedata )
{
    function_fa412bafb43e1901( vehicle, 3, damagedata );
}

// Namespace vehicle_damage
// Params 2
// Checksum 0x9caf6285, Offset: 0x35a2
// Size: 0x22
function function_7faccfa4db0c08bc( vehicle, damagedata )
{
    function_fa412bafb43e1901( vehicle, 4, damagedata );
}

// Namespace vehicle_damage
// Params 2
// Checksum 0xa9b8b26b, Offset: 0x35cc
// Size: 0x22
function function_7c170f3977150969( vehicle, damagedata )
{
    function_fa412bafb43e1901( vehicle, 5, damagedata );
}

// Namespace vehicle_damage
// Params 2
// Checksum 0xb5947704, Offset: 0x35f6
// Size: 0x22
function function_cbacf54d43d06309( vehicle, damagedata )
{
    function_fa412bafb43e1901( vehicle, 6, damagedata );
}

// Namespace vehicle_damage
// Params 2
// Checksum 0xdd205be6, Offset: 0x3620
// Size: 0x22
function function_92c1df7b033bf896( vehicle, damagedata )
{
    function_fa412bafb43e1901( vehicle, 7, damagedata );
}

// Namespace vehicle_damage
// Params 3, eflags: 0x4
// Checksum 0x4578d9c4, Offset: 0x364a
// Size: 0x32b
function private function_fa412bafb43e1901( vehicle, tireindex, damagedata )
{
    isstatic = vehicle vehicle::is_static();
    
    if ( !isstatic )
    {
        vehicle blowuptire( tireindex );
    }
    
    if ( !isdefined( vehicle.flattiremask ) )
    {
        vehicle.flattiremask = 0;
    }
    
    vehicle.flattiremask |= 1 << tireindex;
    occupants = vehicle_occupancy::function_8ed9bcd8e9ea74f5( self, 0 );
    
    if ( isdefined( occupants ) )
    {
        foreach ( occupant in occupants )
        {
            function_5ca0c600bb09b1d2( vehicle, occupant );
        }
    }
    
    tagname = undefined;
    
    if ( isdefined( damagedata ) && isstring( damagedata.partname ) && damagedata.partname != "" )
    {
        tagname = damagedata.partname;
    }
    else if ( isdefined( damagedata ) && isstring( damagedata.attachtagname ) && damagedata.attachtagname != "" )
    {
        tagname = damagedata.attachtagname;
    }
    
    if ( isdefined( vehicle.origin ) && !isstatic && isdefined( tagname ) && vehicle vehicle_isphysveh() )
    {
        data = vehicle::get_data( vehicle vehicle::get_ref() );
        speed = vehicle vehicle_getspeed();
        maxspeed = vehicle vehicle_gettopspeedforward();
        force = math::normalize_value( 0, maxspeed / 2, speed );
        force = force * 0.8 + 0.2;
        force *= data.damage.var_a7bd60167008f054;
        self vehphys_impulse( vehicle.origin - vehicle gettagorigin( tagname ) + ( 0, 0, 300 ), int( 255 * force ), 1 );
    }
    
    if ( isdefined( damagedata ) && !vehicle vehicle::is_husk() && isplayer( damagedata.attacker ) )
    {
        isenemy = vehicle::function_8266feb1ae1c46bd( vehicle, damagedata.attacker );
        damagedata.givepointsandxp = isenemy;
        damagedata.attacker function_d060bb312634dea7( #"destroyed_vehicle_tire", undefined, damagedata, vehicle );
        callback::callback( "player_pop_enemy_tire", { #isenemy:isenemy, #vehicle:vehicle, #player:damagedata.attacker } );
    }
    
    callback::callback( "player_pop_tire", { #vehicle:vehicle, #player:damagedata.attacker } );
}

// Namespace vehicle_damage
// Params 0, eflags: 0x4
// Checksum 0xa92fbb1f, Offset: 0x397d
// Size: 0xe
function private function_d20754d07226daaf()
{
    scriptable::scriptable_addusedcallback( &function_15c89879cc02ad28 );
}

// Namespace vehicle_damage
// Params 6
// Checksum 0x15dbca15, Offset: 0x3993
// Size: 0xe4
function function_15c89879cc02ad28( instance, part, state, player, bautouse, usestring )
{
    if ( !( isdefined( instance ) && isdefined( usestring ) && isdefined( instance.entity ) ) || !instance.entity vehicle::is_vehicle() )
    {
        return;
    }
    
    if ( usestring == "row1_left" || usestring == "row1_right" || usestring == "row2_left" || usestring == "row2_right" || usestring == "row3_left" || usestring == "row3_right" || usestring == "row4_left" || usestring == "row4_right" )
    {
        repair_tire( instance.entity, instance, part, usestring, player, 0 );
    }
}

// Namespace vehicle_damage
// Params 1
// Checksum 0x7d759da8, Offset: 0x3a7f
// Size: 0xa9
function function_4b56eb7facbe21a6( vehicle )
{
    if ( isdefined( vehicle.deadwheels ) )
    {
        foreach ( part, data in vehicle.deadwheels )
        {
            repair_tire( vehicle, vehicle, part, data.wheelref, undefined, 1 );
            break;
        }
    }
}

// Namespace vehicle_damage
// Params 1
// Checksum 0x193188c, Offset: 0x3b30
// Size: 0xa8
function function_b0ba8090957b72f3( vehicle )
{
    if ( isdefined( vehicle.deadwheels ) )
    {
        foreach ( part, data in vehicle.deadwheels )
        {
            vehicle thread repair_tire( vehicle, vehicle, part, data.wheelref, undefined, 1 );
        }
    }
}

// Namespace vehicle_damage
// Params 6, eflags: 0x4
// Checksum 0x54aab2f5, Offset: 0x3be0
// Size: 0x1fd
function private repair_tire( vehicle, scriptable, part, tirename, player, var_3ea59fa343133a74 )
{
    vehicle endon( "death" );
    
    if ( isdefined( player ) )
    {
        player thread function_a522b22e20ed58da();
    }
    
    scriptable setscriptablepartstate( part, "repaired" );
    wait 0.1;
    tireindex = function_171e25698ffc0189( tirename );
    vehicle pristinetire( tireindex );
    
    if ( isdefined( vehicle.deadwheels ) && isdefined( vehicle.deadwheels[ part ] ) )
    {
        vehicle.damageableparts[ part ].healthvalue = vehicle.deadwheels[ part ].healthvalue;
        vehicle.damageableparts[ part ].explosivedamagehealthvalue = vehicle.deadwheels[ part ].explosivedamagehealthvalue;
    }
    
    if ( !isdefined( vehicle.flattiremask ) )
    {
        vehicle.flattiremask = 0;
    }
    
    vehicle.flattiremask &= ~( 1 << tireindex );
    occupants = vehicle_occupancy::function_8ed9bcd8e9ea74f5( vehicle, 0 );
    
    if ( isdefined( occupants ) )
    {
        foreach ( occupant in occupants )
        {
            function_5ca0c600bb09b1d2( vehicle, occupant );
        }
    }
    
    vehicle.deadwheels[ part ] = undefined;
    
    if ( vehicle.deadwheels.size == 0 )
    {
        vehicle.deadwheels = undefined;
    }
    
    function_6d5a43e898d2d97( vehicle, part, var_3ea59fa343133a74 );
}

// Namespace vehicle_damage
// Params 0, eflags: 0x4
// Checksum 0xd29d302a, Offset: 0x3de5
// Size: 0x3f
function private function_a522b22e20ed58da()
{
    self endon( "death_or_disconnect" );
    weapobj = makeweapon( "iw8_ges_plyr_loot_pickup" );
    self giveandfireoffhand( weapobj );
    wait 1.17;
    
    if ( self hasweapon( weapobj ) )
    {
        self takeweapon( weapobj );
    }
}

// Namespace vehicle_damage
// Params 3, eflags: 0x4
// Checksum 0x1c460d17, Offset: 0x3e2c
// Size: 0x54
function private function_6d5a43e898d2d97( vehicle, part, var_3ea59fa343133a74 )
{
    repairsoundlocation = vehicle gettagorigin( part );
    repairsound = "veh_repair_tire";
    
    if ( var_3ea59fa343133a74 )
    {
        repairsound = "veh_repair_tire_at_station";
    }
    
    playsoundatpos( repairsoundlocation, repairsound );
}

// Namespace vehicle_damage
// Params 1, eflags: 0x4
// Checksum 0x7fd7c4d5, Offset: 0x3e88
// Size: 0xa6
function private function_171e25698ffc0189( tirename )
{
    switch ( tirename )
    {
        case #"hash_19baa7ca5b52f06a":
            return 0;
        case #"hash_60b26be014fd7337":
            return 1;
        case #"hash_67ed6be3637f19ed":
            return 2;
        case #"hash_227fe4df4167aa26":
            return 3;
        case #"hash_f0704f57a0dd2250":
            return 4;
        case #"hash_cbd67f63f80e6245":
            return 5;
        case #"hash_711797dce2a722a3":
            return 6;
        case #"hash_6ade103971ce6e2c":
            return 7;
        default:
            assert( "<dev string:xe5>" );
            break;
    }
}

// Namespace vehicle_damage
// Params 2
// Checksum 0x60e948cf, Offset: 0x3f36
// Size: 0x49
function function_5ca0c600bb09b1d2( vehicle, player )
{
    if ( !isdefined( vehicle.flattiremask ) )
    {
        vehicle.flattiremask = 0;
    }
    
    player setclientomnvar( "ui_veh_flat_tire_mask", vehicle.flattiremask );
}

// Namespace vehicle_damage
// Params 1
// Checksum 0xd4f6f8e7, Offset: 0x3f87
// Size: 0xc0
function function_164e018743398931( data )
{
    ref = vehicle::get_ref();
    
    if ( !isdefined( ref ) || !vehicle::has_data( ref ) )
    {
        return;
    }
    
    utility::script_func( "check_vehicle_weak_points", data );
    
    if ( isagent( data.inflictor ) )
    {
        vehicledata = vehicle::get_data( ref );
        
        if ( isdefined( vehicledata.damage ) && isdefined( vehicledata ) && isdefined( vehicledata.damage.agentdamagemultiplier ) )
        {
            data.damage *= vehicledata.damage.agentdamagemultiplier;
        }
    }
}

// Namespace vehicle_damage
// Params 1
// Checksum 0xf4dee4cd, Offset: 0x404f
// Size: 0x1aa, Type: bool
function function_f2a732b19943daa0( data )
{
    if ( !( isdefined( data.objweapon ) && isdefined( data.point ) && isdefined( data.objweapon.damageradius ) ) )
    {
        return true;
    }
    
    ref = vehicle::get_ref();
    
    if ( !isdefined( ref ) || !vehicle::has_data( ref ) )
    {
        return true;
    }
    
    vehicledata = vehicle::get_data( ref );
    
    if ( !( isdefined( vehicledata.damage ) && isdefined( vehicledata ) && isdefined( vehicledata.damage.explosionextents ) ) )
    {
        return true;
    }
    
    radius = data.objweapon.damageradius;
    bounds = vehicledata.damage.explosionextents;
    localorigin = coordtransformtranspose( data.point, self.origin, self.angles );
    return localorigin[ 0 ] > ( bounds.back + radius ) * -1 && localorigin[ 0 ] < bounds.front + radius && localorigin[ 1 ] > ( bounds.left + radius ) * -1 && localorigin[ 1 ] < bounds.right + radius && localorigin[ 2 ] > ( bounds.bottom + radius ) * -1 && localorigin[ 2 ] < bounds.top + radius;
}

// Namespace vehicle_damage
// Params 0
// Checksum 0xfcfc777, Offset: 0x4202
// Size: 0x19f
function init()
{
    assert( isdefined( level.vehicle ), "<dev string:x123>" );
    assert( !isdefined( level.vehicle.damage ), "<dev string:x15b>" );
    leveldata = spawnstruct();
    level.vehicle.damage = leveldata;
    level.var_a78a5c3c321451a4 = getdvarint( @"hash_4421544b585f6be5", utility::ismp() ) == 1;
    
    if ( level.projectbundle.var_4b0a96a3b624c9ec && function_4042d2fbe6237835( #"hash_4ba7f1603e721859" ) )
    {
        level.projectbundle.var_4b0a96a3b624c9ec = 0;
    }
    
    if ( level.projectbundle.var_f58a6e2322572bc2 && function_4042d2fbe6237835( #"hash_f13e37a2307443e0" ) )
    {
        level.projectbundle.var_f58a6e2322572bc2 = 0;
    }
    
    leveldata.mediumstatehealthratio = getdvarfloat( @"hash_4217d1e671e33953", 0.5 );
    leveldata.burndowntime = getdvarfloat( @"hash_1021d59d6f0d99a0", 8 );
    
    if ( utility::issharedfuncdefined( #"vehicle_damage", #"init" ) )
    {
        [[ utility::getsharedfunc( #"vehicle_damage", #"init" ) ]]();
    }
    
    init_hit_damage_data();
    init_mod_damage_data();
    load_table();
    init_debug();
    function_d20754d07226daaf();
    callback::add( #"on_ai_killed", &onagentkilled );
}

// Namespace vehicle_damage
// Params 0, eflags: 0x4
// Checksum 0xccdaae39, Offset: 0x43a9
// Size: 0x194
function private load_table()
{
    if ( !( isdefined( level.gametypebundle ) && isdefined( level.gametypebundle.damagetable ) ) )
    {
        return;
    }
    
    leveldata = get_level_data();
    leveldata.table = getscriptbundle( level.gametypebundle.damagetable );
    
    foreach ( struct in leveldata.table.weapons )
    {
        set_weapon_hit_damage_data( struct.weapon, struct.hits );
    }
    
    foreach ( struct in leveldata.table.perks )
    {
        function_74377470e00a470( struct.perk, struct.modifier, struct.type == "Multiplicative" );
    }
}

// Namespace vehicle_damage
// Params 2
// Checksum 0xc7f7373e, Offset: 0x4545
// Size: 0x54b
function function_f80dee5b045a4ee8( vehicleref, var_e6c819f806ce2c86 )
{
    leveldata = get_level_data();
    table = leveldata.table;
    leveldataforvehicle = get_data( vehicleref, undefined, var_e6c819f806ce2c86 );
    
    if ( !( isdefined( leveldataforvehicle ) && isdefined( table ) ) )
    {
        return;
    }
    
    class = leveldataforvehicle.class;
    
    if ( isdefined( class ) )
    {
        foreach ( struct in table.var_2d3d5a248d07d8aa )
        {
            switch ( class )
            {
                case #"hash_d2a55c7ac538641b":
                    modifier = struct.super_light;
                    break;
                case #"hash_d582c3286e5c390f":
                    modifier = struct.light;
                    break;
                case #"hash_21622ca3ad06efb5":
                    modifier = struct.medium_light;
                    break;
                case #"hash_c71b112fe04823d6":
                    modifier = struct.medium;
                    break;
                case #"hash_53e0b558455f04c6":
                    modifier = struct.medium_heavy;
                    break;
                case #"hash_2453c9ffec9f5c20":
                    modifier = struct.heavy;
                    break;
                case #"hash_e8ec392f4f2724e4":
                    modifier = struct.super_heavy;
                    break;
                default:
                    assertmsg( "<dev string:x191>" + class );
                    continue;
            }
            
            function_86431c2d7f105aee( struct.weapon_class, modifier, 0, vehicleref );
        }
        
        foreach ( struct in table.var_62aaa5c1b920ac4a )
        {
            switch ( class )
            {
                case #"hash_d2a55c7ac538641b":
                    hits = struct.super_light;
                    break;
                case #"hash_d582c3286e5c390f":
                    hits = struct.light;
                    break;
                case #"hash_21622ca3ad06efb5":
                    hits = struct.medium_light;
                    break;
                case #"hash_c71b112fe04823d6":
                    hits = struct.medium;
                    break;
                case #"hash_53e0b558455f04c6":
                    hits = struct.medium_heavy;
                    break;
                case #"hash_2453c9ffec9f5c20":
                    hits = struct.heavy;
                    break;
                case #"hash_e8ec392f4f2724e4":
                    hits = struct.super_heavy;
                    break;
                default:
                    assertmsg( "<dev string:x191>" + class );
                    continue;
            }
            
            set_weapon_hit_damage_data_for_vehicle( struct.weapon, hits, vehicleref );
            set_vehicle_hit_damage_data_for_weapon( vehicleref, 100, struct.weapon );
        }
    }
    
    if ( vehicleref == %"hash_7f492eb947d5169a" || vehicleref == %"hash_511d52fb0fdd07c7" || vehicleref == %"hash_79d97f9d1822b8fc" || vehicleref == %"hash_1dd941f8f4026e3" || vehicleref == %"hash_578ab89b711f6104" || vehicleref == %"hash_5768bc9b7102816a" || vehicleref == %"hash_593d071ede26eb8b" )
    {
        foreach ( struct in table.var_7846c0aacadee0f6 )
        {
            hits = undefined;
            
            switch ( vehicleref )
            {
                case %"hash_7f492eb947d5169a":
                    hits = struct.veh9_cougar;
                    break;
                case %"hash_511d52fb0fdd07c7":
                    hits = struct.light_tank;
                    break;
                case %"hash_79d97f9d1822b8fc":
                    hits = struct.veh9_apc_8x8;
                    break;
                case %"hash_1dd941f8f4026e3":
                    hits = struct.veh9_palfa;
                    break;
                case %"hash_5768bc9b7102816a":
                case %"hash_578ab89b711f6104":
                    hits = struct.var_b83beed7a9fb6c24;
                    break;
                case %"hash_593d071ede26eb8b":
                    hits = struct.var_e344dae76503d889;
                    break;
            }
            
            if ( !isdefined( hits ) )
            {
                continue;
            }
            
            set_weapon_hit_damage_data_for_vehicle( struct.weapon, hits, vehicleref );
            set_vehicle_hit_damage_data_for_weapon( vehicleref, 100, struct.weapon );
        }
    }
}

// Namespace vehicle_damage
// Params 0
// Checksum 0x97aacc42, Offset: 0x4a98
// Size: 0x36
function get_level_data()
{
    assert( isdefined( level.vehicle.damage ), "<dev string:x1a9>" );
    return level.vehicle.damage;
}

// Namespace vehicle_damage
// Params 2
// Checksum 0xb6d629c3, Offset: 0x4ad7
// Size: 0x11f, Type: bool
function function_a9180f1c3402163( vehicle, data )
{
    if ( isdefined( data.inflictor ) )
    {
        if ( data.inflictor == vehicle )
        {
            return true;
        }
        
        turrets = vehicle::get_turrets( vehicle );
        
        foreach ( turret in turrets )
        {
            if ( data.inflictor == turret )
            {
                return true;
            }
        }
        
        if ( data.inflictor.classname == "rocket" && isdefined( data.inflictor.vehicle ) && data.inflictor.vehicle == vehicle )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace vehicle_damage
// Params 1
// Checksum 0x6f2695dd, Offset: 0x4bff
// Size: 0x1a
function function_f22ce6c0cf2d903b( vehicle )
{
    vehicle.ownerdamageenabled = 1;
}

// Namespace vehicle_damage
// Params 1
// Checksum 0xea31e90d, Offset: 0x4c21
// Size: 0x18, Type: bool
function function_27edcd33039acc04( vehicle )
{
    return istrue( vehicle.ownerdamageenabled );
}

// Namespace vehicle_damage
// Params 2
// Checksum 0xec6df166, Offset: 0x4c42
// Size: 0x105
function log_event( vehicle, data )
{
    if ( !isdefined( vehicle.damageevents ) )
    {
        vehicle.damageevents = [];
    }
    
    vehicle.damageevents[ vehicle.damageevents.size ] = data;
    
    if ( isdefined( data.attacker ) && isdefined( data.attacker.super ) && data.attacker.overridefieldupgrade1 == "super_suppression_rounds" )
    {
        if ( isdefined( data.attacker.super.vehiclehitcount ) )
        {
            data.attacker.super.vehiclehitcount++;
        }
        else
        {
            data.attacker.super.vehiclehitcount = 1;
        }
    }
    
    thread function_ade9cadb785cabe3( vehicle );
}

// Namespace vehicle_damage
// Params 1
// Checksum 0xb1292378, Offset: 0x4d4f
// Size: 0x20
function function_8a2d9000eaf56a61( vehicle )
{
    vehicle notify( "vehicle_damage_clearEventLog" );
    vehicle.damageevents = undefined;
}

// Namespace vehicle_damage
// Params 1
// Checksum 0x7c4def7, Offset: 0x4d77
// Size: 0x3a
function function_ade9cadb785cabe3( vehicle )
{
    vehicle endon( "death" );
    vehicle endon( "vehicle_damage_clearEventLog" );
    vehicle notify( "vehicle_damage_clearEventLogAtFrameEnd" );
    vehicle endon( "vehicle_damage_clearEventLogAtFrameEnd" );
    waittillframeend();
    thread function_8a2d9000eaf56a61( vehicle );
}

// Namespace vehicle_damage
// Params 2
// Checksum 0xe6035f00, Offset: 0x4db9
// Size: 0xe8
function function_ae99b703d6f83373( stateref, data )
{
    self notify( "vehicle_damage_visualStopWatchingSpeedChange" );
    self endon( "vehicle_damage_visualStopWatchingSpeedChange" );
    oldspeedstate = undefined;
    
    while ( isdefined( self ) )
    {
        speedstate = undefined;
        speed = int( self vehicle_getspeed() );
        canfly = istrue( vehicle::can_fly() );
        
        if ( canfly && self vehicle_isonground() )
        {
            speedstate = 0;
        }
        else if ( !canfly && speed <= 3 )
        {
            speedstate = 0;
        }
        else if ( speed <= 25 )
        {
            speedstate = 1;
        }
        else
        {
            speedstate = 2;
        }
        
        if ( isdefined( oldspeedstate ) && speedstate != oldspeedstate )
        {
            leveldatafordamagestate = function_9a9c7f377e631a4d( vehicle::get_ref(), stateref );
            self thread [[ leveldatafordamagestate.onentercallback ]]( stateref, data );
            return;
        }
        
        oldspeedstate = speedstate;
        wait 0.1;
    }
}

// Namespace vehicle_damage
// Params 0
// Checksum 0x5da90ec6, Offset: 0x4ea9
// Size: 0xa
function function_e0917adf3efd7fca()
{
    self notify( "vehicle_damage_visualStopWatchingSpeedChange" );
}

// Namespace vehicle_damage
// Params 2
// Checksum 0x9c84f1ff, Offset: 0x4ebb
// Size: 0xbf
function function_7e4bf1b30c77e5b7( data, changed )
{
    speed = int( self vehicle_getspeed() );
    canfly = istrue( vehicle::can_fly() );
    
    if ( canfly && self vehicle_isonground() )
    {
        self setscriptablepartstate( "damageLight", "stopped", 1 );
    }
    else if ( !canfly && speed <= 3 )
    {
        self setscriptablepartstate( "damageLight", "stopped", 1 );
    }
    else if ( speed <= 25 )
    {
        self setscriptablepartstate( "damageLight", "lowSpeed", 1 );
    }
    else
    {
        self setscriptablepartstate( "damageLight", "highSpeed", 1 );
    }
    
    thread function_ae99b703d6f83373( "light", data );
}

// Namespace vehicle_damage
// Params 3
// Checksum 0xc2d63211, Offset: 0x4f82
// Size: 0x18a
function function_608f2ee15878882d( data, changed, fromdeath )
{
    function_e0917adf3efd7fca();
    
    if ( !self isscriptable() )
    {
        if ( isdefined( self.vehiclename ) )
        {
            ref = self.vehiclename;
        }
        else
        {
            ref = "undefined";
        }
        
        if ( isdefined( self.vehicletype ) )
        {
            type = self.vehicletype;
        }
        else
        {
            type = "undefined";
        }
        
        script::demoforcesre( "Vehicle is not a scriptable: ref: " + ref + " type: " + type );
        return;
    }
    
    if ( !self getscriptablehaspart( "damageLight" ) )
    {
        if ( isdefined( self.vehiclename ) )
        {
            ref = self.vehiclename;
        }
        else
        {
            ref = "undefined";
        }
        
        if ( isdefined( self.vehicletype ) )
        {
            type = self.vehicletype;
        }
        else
        {
            type = "undefined";
        }
        
        script::demoforcesre( "Vehicle does not have damageLight part: ref: " + ref + " type: " + type );
        return;
    }
    
    if ( !self getscriptableparthasstate( "damageLight", "off" ) )
    {
        if ( isdefined( self.vehiclename ) )
        {
            ref = self.vehiclename;
        }
        else
        {
            ref = "undefined";
        }
        
        if ( isdefined( self.vehicletype ) )
        {
            type = self.vehicletype;
        }
        else
        {
            type = "undefined";
        }
        
        script::demoforcesre( "Vehicle does not have part damageLight with state off: ref: " + ref + " type: " + type );
        return;
    }
    
    self setscriptablepartstate( "damageLight", "off", 1 );
}

// Namespace vehicle_damage
// Params 2
// Checksum 0x5b30e890, Offset: 0x5114
// Size: 0xbf
function function_ca478928dc5fa5a4( data, changed )
{
    speed = int( self vehicle_getspeed() );
    canfly = istrue( vehicle::can_fly() );
    
    if ( canfly && self vehicle_isonground() )
    {
        self setscriptablepartstate( "damageMedium", "stopped", 1 );
    }
    else if ( !canfly && speed <= 3 )
    {
        self setscriptablepartstate( "damageMedium", "stopped", 1 );
    }
    else if ( speed <= 25 )
    {
        self setscriptablepartstate( "damageMedium", "lowSpeed", 1 );
    }
    else
    {
        self setscriptablepartstate( "damageMedium", "highSpeed", 1 );
    }
    
    thread function_ae99b703d6f83373( "medium", data );
}

// Namespace vehicle_damage
// Params 3
// Checksum 0xa0c94cd0, Offset: 0x51db
// Size: 0x37
function function_dc4ddc6821110582( data, changed, fromdeath )
{
    function_e0917adf3efd7fca();
    self setscriptablepartstate( "damageMedium", "off", 1 );
}

// Namespace vehicle_damage
// Params 2
// Checksum 0xf48c0897, Offset: 0x521a
// Size: 0xbf
function function_d7e4fea731d24020( data, changed )
{
    speed = int( self vehicle_getspeed() );
    canfly = istrue( vehicle::can_fly() );
    
    if ( canfly && self vehicle_isonground() )
    {
        self setscriptablepartstate( "damageHeavy", "stopped", 1 );
    }
    else if ( !canfly && speed <= 3 )
    {
        self setscriptablepartstate( "damageHeavy", "stopped", 1 );
    }
    else if ( speed <= 25 )
    {
        self setscriptablepartstate( "damageHeavy", "lowSpeed", 1 );
    }
    else
    {
        self setscriptablepartstate( "damageHeavy", "highSpeed", 1 );
    }
    
    thread function_ae99b703d6f83373( "heavy", data );
}

// Namespace vehicle_damage
// Params 3
// Checksum 0x86f82bbd, Offset: 0x52e1
// Size: 0x37
function function_f60f559ead41cb86( data, changed, fromdeath )
{
    function_e0917adf3efd7fca();
    self setscriptablepartstate( "damageHeavy", "off", 1 );
}

// Namespace vehicle_damage
// Params 2
// Checksum 0x51c14d33, Offset: 0x5320
// Size: 0x4b
function function_721a99ea5b048315( data, changed )
{
    if ( utility::function_9f2c41c1dcc8c94( "damageEngine", "explode" ) )
    {
        self setscriptablepartstate( "damageEngine", "explode", 1 );
    }
    
    if ( !vehicle::can_fly() )
    {
        vehicle_occupancy::disable_engine();
    }
}

// Namespace vehicle_damage
// Params 3
// Checksum 0x39541985, Offset: 0x5373
// Size: 0x30
function function_d034de5e6901e7f7( data, changed, fromdeath )
{
    self setscriptablepartstate( "damageEngine", "off", 1 );
}

// Namespace vehicle_damage
// Params 0
// Checksum 0x59deefa5, Offset: 0x53ab
// Size: 0x13, Type: bool
function get_state()
{
    return self.damagestateref ?? "pristine";
}

// Namespace vehicle_damage
// Params 3
// Checksum 0x9ef1fa0e, Offset: 0x53c7
// Size: 0xd8
function set_state( stateref, oldstateref, data )
{
    assert( isdefined( stateref ) && isdefined( oldstateref ) && stateref != oldstateref );
    self notify( "damage_state_change" );
    ref = vehicle::get_ref();
    
    if ( oldstateref != "pristine" )
    {
        var_32d2c4b687724ddc = function_9a9c7f377e631a4d( ref, oldstateref, 0, 1 );
        
        if ( isdefined( var_32d2c4b687724ddc.onexitcallback ) )
        {
            self thread [[ var_32d2c4b687724ddc.onexitcallback ]]( stateref, data );
        }
    }
    
    if ( stateref != "pristine" )
    {
        var_32d2c4b687724ddc = function_9a9c7f377e631a4d( ref, stateref, 0, 1 );
        
        if ( isdefined( var_32d2c4b687724ddc.onentercallback ) )
        {
            self thread [[ var_32d2c4b687724ddc.onentercallback ]]( oldstateref, data );
        }
    }
    
    self.damagestateref = stateref;
}

// Namespace vehicle_damage
// Params 3
// Checksum 0x5f74f5ea, Offset: 0x54a7
// Size: 0x59
function update_state( data, var_b35b7da28aec24cd, var_e6c819f806ce2c86 )
{
    leveldataforvehicle = get_data( vehicle::get_ref(), undefined, var_e6c819f806ce2c86 );
    
    if ( !isdefined( leveldataforvehicle ) )
    {
        return;
    }
    
    self.lasttimedamaged = gettime();
    function_ef5c9d683bcae0c7( data, var_b35b7da28aec24cd, var_e6c819f806ce2c86 );
}

// Namespace vehicle_damage
// Params 3, eflags: 0x4
// Checksum 0x6c98a22, Offset: 0x5508
// Size: 0x2c3
function private function_ef5c9d683bcae0c7( data, var_b35b7da28aec24cd, var_e6c819f806ce2c86 )
{
    leveldata = get_level_data();
    leveldataforvehicle = get_data( vehicle::get_ref(), undefined, var_e6c819f806ce2c86 );
    vehiclehealth = self.health;
    
    if ( isdefined( data ) && isdefined( data.damage ) && !utility::issp() )
    {
        vehiclehealth -= int( data.damage );
    }
    
    beststateref = "pristine";
    var_7ceb88916f0fff03 = self.maxhealth;
    
    if ( vehicle::is_husk() )
    {
        states = [ "heavy":function_8c4b44320250db18( self ) ];
    }
    else if ( leveldataforvehicle.var_a090dfa65197b852 )
    {
        states = [ "heavy":self.maxhealth * leveldataforvehicle.var_ba4f5726e822c571 / 100, "medium":self.maxhealth * leveldataforvehicle.var_86cdcfef9a17b4d3 / 100, "light":self.maxhealth * leveldataforvehicle.var_9a083e0f55accd4c / 100 ];
    }
    else
    {
        states = [ "heavy":function_8c4b44320250db18( self ), "medium":self.maxhealth * leveldata.mediumstatehealthratio, "light":self.maxhealth * 0.9 ];
    }
    
    foreach ( stateref, maxhealth in states )
    {
        if ( maxhealth < var_7ceb88916f0fff03 && vehiclehealth <= maxhealth )
        {
            beststateref = stateref;
            var_7ceb88916f0fff03 = maxhealth;
        }
    }
    
    oldstateref = get_state();
    
    if ( beststateref != oldstateref )
    {
        if ( !var_b35b7da28aec24cd && beststateref == "heavy" && !self.disableheavystatedamagefloor )
        {
            heavystatemaxhealth = function_8c4b44320250db18( undefined, vehicle::get_ref() );
            
            if ( isdefined( heavystatemaxhealth ) )
            {
                var_933222aa4ef8d86b = heavystatemaxhealth;
                
                if ( !utility::issp() )
                {
                    var_933222aa4ef8d86b += data.damage;
                }
                
                if ( isdefined( data.damage ) && data.damage != 0 )
                {
                    self.health = int( max( self.health, var_933222aa4ef8d86b ) );
                }
            }
        }
        
        set_state( beststateref, oldstateref, data );
    }
}

// Namespace vehicle_damage
// Params 1
// Checksum 0xa923dd2, Offset: 0x57d3
// Size: 0x29
function function_658976b407a5b2e1( bool )
{
    if ( bool )
    {
        self.disableheavystatedamagefloor = 1;
        return;
    }
    
    self.disableheavystatedamagefloor = undefined;
}

// Namespace vehicle_damage
// Params 2
// Checksum 0x7ef7e6d4, Offset: 0x5804
// Size: 0x20
function function_c8cee5463d38045b( oldstateref, data )
{
    function_7e4bf1b30c77e5b7( data, 1 );
}

// Namespace vehicle_damage
// Params 2
// Checksum 0xf03fead0, Offset: 0x582c
// Size: 0x20
function function_29e415d33db31135( newstateref, data )
{
    function_608f2ee15878882d( data, 1 );
}

// Namespace vehicle_damage
// Params 2
// Checksum 0xb6cd1168, Offset: 0x5854
// Size: 0x20
function function_35d199879ef7efaa( oldstateref, data )
{
    function_ca478928dc5fa5a4( data, 1 );
}

// Namespace vehicle_damage
// Params 2
// Checksum 0x4efe760c, Offset: 0x587c
// Size: 0x20
function function_5beb7eb571bec434( newstateref, data )
{
    function_dc4ddc6821110582( data, 1 );
}

// Namespace vehicle_damage
// Params 2
// Checksum 0x81a96400, Offset: 0x58a4
// Size: 0xc8
function function_f4c9964d3c4ddd44( oldstateref, data )
{
    if ( utility::issharedfuncdefined( #"vehicle", #"hash_c91a9f6e5e3f772f" ) )
    {
        skip_logic = utility::callsharedfunc( #"vehicle", #"hash_c91a9f6e5e3f772f", {} );
        
        if ( skip_logic )
        {
            return;
        }
    }
    
    if ( vehicle::is_husk() )
    {
        function_56353dccab157e56( data );
    }
    else
    {
        function_d7e4fea731d24020( data, 1 );
        function_721a99ea5b048315( data, 1 );
    }
    
    if ( oldstateref != "heavy" )
    {
        vehicle_occupancy::allow_movement( self, 0 );
        vehicle_occupancy::function_6d9760c4971403c2( self, 0 );
        vehicle_interact::allow_use( self, 0 );
        
        if ( function_2fec514ed5f9106d() )
        {
            function_6c7722241a521e9( oldstateref, data );
        }
        
        thread function_d4925e0ea413bbde( data );
    }
}

// Namespace vehicle_damage
// Params 2
// Checksum 0xa62bd1fd, Offset: 0x5974
// Size: 0x7a
function function_7e728a3ed58dd4e6( newstateref, data )
{
    if ( vehicle::is_husk() )
    {
        function_32e3d0ee599bd470( data );
    }
    else
    {
        function_f60f559ead41cb86( data, 1 );
        function_d034de5e6901e7f7( data, 1 );
    }
    
    if ( newstateref != "heavy" )
    {
        if ( !vehicle::is_husk() )
        {
            vehicle_occupancy::allow_movement( self, 1 );
            vehicle_occupancy::function_6d9760c4971403c2( self, 1 );
            vehicle_interact::allow_use( self, 1 );
        }
        
        end_burn_down();
    }
}

// Namespace vehicle_damage
// Params 1
// Checksum 0xded1927c, Offset: 0x59f6
// Size: 0x162
function function_6e59be779e385adc( vehicleref )
{
    leveldataforvehicle = get_data( vehicleref, 1 );
    haslight = !isdefined( leveldataforvehicle.damagestates ) || leveldataforvehicle.damagestates == "light_medium_heavy";
    hasmedium = haslight || !isdefined( leveldataforvehicle.damagestates ) || leveldataforvehicle.damagestates == "medium_heavy";
    hasheavy = hasmedium || !isdefined( leveldataforvehicle.damagestates ) || leveldataforvehicle.damagestates == "heavy";
    
    if ( haslight )
    {
        leveldatafordamagestate = function_9a9c7f377e631a4d( vehicleref, "light", 1 );
        leveldatafordamagestate.onentercallback = &function_c8cee5463d38045b;
        leveldatafordamagestate.onexitcallback = &function_29e415d33db31135;
    }
    
    if ( hasmedium )
    {
        leveldatafordamagestate = function_9a9c7f377e631a4d( vehicleref, "medium", 1 );
        leveldatafordamagestate.onentercallback = &function_35d199879ef7efaa;
        leveldatafordamagestate.onexitcallback = &function_5beb7eb571bec434;
    }
    
    if ( hasheavy )
    {
        leveldatafordamagestate = function_9a9c7f377e631a4d( vehicleref, "heavy", 1 );
        leveldatafordamagestate.onentercallback = &function_f4c9964d3c4ddd44;
        leveldatafordamagestate.onexitcallback = &function_7e728a3ed58dd4e6;
    }
}

// Namespace vehicle_damage
// Params 1
// Checksum 0xc658cb75, Offset: 0x5b60
// Size: 0xb0
function function_56353dccab157e56( data )
{
    var_6fd04269d9f0829e = utility::function_edc4cc03e9e60b3e( @"hash_6fa2847af53be191", 0, level.gametypebundle.var_6fd04269d9f0829e );
    
    if ( self getscriptableparthasstate( "damageHeavy", "on" ) )
    {
        state = var_6fd04269d9f0829e ? "only_smoke" : "on";
        self setscriptablepartstate( "damageHeavy", state, 1 );
        return;
    }
    
    if ( self getscriptableparthasstate( "damageHeavy", "stopped" ) )
    {
        state = var_6fd04269d9f0829e ? "only_smoke" : "stopped";
        self setscriptablepartstate( "damageHeavy", state, 1 );
    }
}

// Namespace vehicle_damage
// Params 1
// Checksum 0x11235a1e, Offset: 0x5c18
// Size: 0xbe
function function_32e3d0ee599bd470( data )
{
    self setscriptablepartstate( "damageHeavy", "off", 1 );
    transitionscriptableparts = vehicle_spawn::function_b65e41134b5a89af( self.pristineref );
    
    if ( isdefined( transitionscriptableparts ) )
    {
        foreach ( struct in transitionscriptableparts )
        {
            self setscriptablepartstate( struct.var_bfed29f09b275d4b, "off", 1 );
        }
    }
}

// Namespace vehicle_damage
// Params 2
// Checksum 0xe5a21cc, Offset: 0x5cde
// Size: 0xd0
function get_max_health( vehicle, vehicleref )
{
    if ( !isdefined( vehicleref ) )
    {
        vehicleref = vehicle vehicle::get_ref();
    }
    
    spawndata = vehicle vehicle_tracking::function_d2bad728e2163c17();
    
    if ( isdefined( spawndata.script_startinghealth ) )
    {
        maxhealth = spawndata.script_startinghealth;
    }
    else
    {
        leveldataforvehicle = get_data( vehicleref, 1 );
        
        if ( !( isdefined( leveldataforvehicle ) && isdefined( leveldataforvehicle.health ) ) )
        {
            if ( isdefined( vehicle ) )
            {
                return vehicle.maxhealth;
            }
            
            return undefined;
        }
        
        maxhealth = leveldataforvehicle.health;
    }
    
    heavystatehealthadd = function_9063fec90e443ad3( vehicleref );
    
    if ( isdefined( heavystatehealthadd ) )
    {
        maxhealth += heavystatehealthadd;
    }
    
    return int( maxhealth );
}

// Namespace vehicle_damage
// Params 2
// Checksum 0x8614b4a1, Offset: 0x5db7
// Size: 0x8e
function function_a5c118b954f2ccba( vehicle, vehicleref )
{
    if ( !isdefined( vehicleref ) )
    {
        vehicleref = vehicle vehicle::get_ref();
    }
    
    leveldata = get_level_data();
    
    if ( !isdefined( leveldata.mediumstatehealthratio ) )
    {
        return undefined;
    }
    
    leveldataforvehicle = get_data( vehicleref );
    
    if ( !isdefined( leveldataforvehicle ) )
    {
        return undefined;
    }
    
    if ( !isdefined( leveldataforvehicle.health ) )
    {
        return undefined;
    }
    
    return leveldataforvehicle.health * leveldata.mediumstatehealthratio;
}

// Namespace vehicle_damage
// Params 2
// Checksum 0xd41d2909, Offset: 0x5e4e
// Size: 0x8e
function function_8c4b44320250db18( vehicle, vehicleref )
{
    if ( !isdefined( vehicleref ) )
    {
        vehicleref = vehicle vehicle::get_ref();
    }
    
    leveldata = get_level_data();
    leveldataforvehicle = get_data( vehicleref );
    
    if ( !isdefined( leveldataforvehicle ) )
    {
        return undefined;
    }
    
    if ( !isdefined( leveldataforvehicle.health ) )
    {
        return undefined;
    }
    
    heavystatehealthadd = function_9063fec90e443ad3( vehicleref );
    
    if ( !isdefined( heavystatehealthadd ) || heavystatehealthadd <= 0 )
    {
        return undefined;
    }
    
    return int( heavystatehealthadd );
}

// Namespace vehicle_damage
// Params 1
// Checksum 0x761924a6, Offset: 0x5ee5
// Size: 0x26
function function_9063fec90e443ad3( vehicleref )
{
    return int( get_data( vehicleref ).heavystatehealthadd ?? 0 );
}

// Namespace vehicle_damage
// Params 1
// Checksum 0x94ae00c5, Offset: 0x5f14
// Size: 0x1cb, Type: bool
function function_fbafe88248510c34( data )
{
    if ( isdefined( data.inflictor ) && data.inflictor.weapon_name == "gl" )
    {
        return ( data.meansofdeath == "MOD_GRENADE" );
    }
    
    if ( isdefined( data.objweapon ) && isdefined( data.objweapon.basename ) )
    {
        switch ( data.objweapon.basename )
        {
            case #"hash_708fb6e22f87a3a4":
            case #"hash_a622e958420b92a0":
                return ( isdefined( data.meansofdeath ) && ( data.meansofdeath == "MOD_PROJECTILE" || data.meansofdeath == "MOD_RIFLE_BULLET" ) );
            case #"hash_13608f01c909bed3":
            case #"hash_13a265ac820ea0df":
            case #"hash_1717a0115ff7a1c4":
            case #"hash_348ae4b5cc97ad79":
            case #"hash_3e782fd775b72022":
            case #"hash_5c272c0617caebf0":
            case #"hash_8c12df11df01f306":
            case #"hash_a86d4075406d2de4":
            case #"hash_fd9c279f85990dad":
                return ( isdefined( data.meansofdeath ) && data.meansofdeath == "MOD_PROJECTILE" );
            case #"hash_c500a77b6bb7c5d0":
                return ( isdefined( data.meansofdeath ) && data.meansofdeath == "MOD_GRENADE" );
            case #"hash_56ee829cc162271a":
                return ( isdefined( data.meansofdeath ) && data.meansofdeath == "MOD_EXPLOSIVE" );
        }
    }
    
    return false;
}

// Namespace vehicle_damage
// Params 1
// Checksum 0x5b2d6551, Offset: 0x60e8
// Size: 0x283
function function_751760054809604d( data )
{
    ref = vehicle::get_ref();
    
    if ( !isdefined( ref ) )
    {
        return;
    }
    
    if ( data.meansofdeath == "MOD_GRENADE" || data.meansofdeath == "MOD_GRENADE_SPLASH" || data.meansofdeath == "MOD_PROJECTILE" || data.meansofdeath == "MOD_PROJECTILE_SPLASH" || data.meansofdeath == "MOD_EXPLOSIVE" )
    {
        if ( vehicle::has_data( ref ) )
        {
            bundle = vehicle::get_data( ref );
            
            if ( !isdefined( bundle ) )
            {
                return;
            }
            
            if ( !isdefined( bundle.damageknockback ) )
            {
                return;
            }
        }
        else
        {
            return;
        }
        
        magnitude = clamp( data.damage, 0, bundle.damageknockback.var_f4ca450e4481d219 ) / bundle.damageknockback.var_f4ca450e4481d219 * bundle.damageknockback.var_53d3481c22156866;
        
        if ( magnitude < 0.01 )
        {
            return;
        }
        
        forcevec = data.direction_vec * magnitude;
        forcevec *= bundle.damageknockback.var_514ba586d40dfce4;
        forcevec += ( 0, 0, magnitude * bundle.damageknockback.var_514ba586d40dfce4 * bundle.damageknockback.var_834463582355514d );
        
        if ( vehicle::is_husk() )
        {
            forcevec *= bundle.damageknockback.var_4752892bd8d9257e;
        }
        
        if ( isdefined( self getvehicleowner() ) )
        {
            forcevec *= bundle.damageknockback.var_62b13ee648fd7ba4;
            collisionblend = bundle.damageknockback.var_292f5cff38e96f56;
        }
        else
        {
            collisionblend = bundle.damageknockback.var_377aef654c7ac8b5;
            
            if ( self getscriptablehaspart( "stability" ) )
            {
                utility::function_7c10ea82c1e305b8( "stability", "unstable" );
            }
        }
        
        forcevec = coordtransformtranspose( forcevec, ( 0, 0, 0 ), self.angles );
        point = function_dfdf2f34d4908f2a( data.point, collisionblend );
        forcevec = function_31abc9d9133eddfa( forcevec, bundle );
        self vehphys_force( forcevec, point, 0 );
    }
}

// Namespace vehicle_damage
// Params 2, eflags: 0x4
// Checksum 0x82991a8, Offset: 0x6373
// Size: 0xbf
function private function_dfdf2f34d4908f2a( point, percentage )
{
    point = coordtransformtranspose( point, self.origin, self.angles );
    cornersarray = self getboundscorners();
    cornersarray[ 0 ] = coordtransformtranspose( cornersarray[ 0 ], self.origin, self.angles );
    cornersarray[ 1 ] = coordtransformtranspose( cornersarray[ 1 ], self.origin, self.angles );
    point = ( clamp( point[ 0 ], cornersarray[ 1 ][ 0 ], cornersarray[ 0 ][ 0 ] ), clamp( point[ 1 ], cornersarray[ 1 ][ 1 ], cornersarray[ 0 ][ 1 ] ), clamp( point[ 2 ], cornersarray[ 1 ][ 2 ], cornersarray[ 0 ][ 2 ] ) );
    return point * percentage;
}

// Namespace vehicle_damage
// Params 0
// Checksum 0x408f88b3, Offset: 0x643b
// Size: 0x9
function function_bdf87ac8d69f745e()
{
    thread function_fc722083e5cc3687();
}

// Namespace vehicle_damage
// Params 0, eflags: 0x4
// Checksum 0x73272cfe, Offset: 0x644c
// Size: 0x17e
function private function_fc722083e5cc3687()
{
    ref = vehicle::get_ref();
    
    if ( !isdefined( ref ) )
    {
        return;
    }
    
    bundle = vehicle::get_data( ref );
    
    if ( !isdefined( bundle ) )
    {
        return;
    }
    
    self endon( "death" );
    waitframe();
    forcevec = rotatevector( ( 1, 0, 0 ), ( 0, randomfloat( 360 ), 0 ) ) * bundle.damageknockback.var_2a748c4ee31cc1fc * bundle.damageknockback.var_53d3481c22156866;
    forcevec += ( 0, 0, bundle.damageknockback.var_e09d2a9f1a91ea6a * bundle.damageknockback.var_53d3481c22156866 );
    forcevec = coordtransformtranspose( forcevec, self.origin, self.angles );
    forceloc = ( randomfloatrange( bundle.damageknockback.var_10bbbefa82858738, bundle.damageknockback.var_48d2e287b3893e1a ), randomfloatrange( bundle.damageknockback.var_366046c646e23f7b, bundle.damageknockback.var_73080944f8087da5 ), 0 );
    forceloc = ( forceloc[ 0 ] * ( randomintrange( 0, 2 ) * 2 - 1 ), forceloc[ 1 ] * ( randomintrange( 0, 2 ) * 2 - 1 ), 0 );
    self vehphys_force( forcevec, forceloc, 0 );
}

// Namespace vehicle_damage
// Params 2, eflags: 0x4
// Checksum 0x4828440e, Offset: 0x65d2
// Size: 0x8d
function private function_31abc9d9133eddfa( force, bundle )
{
    recordedtime = gettime();
    
    if ( isdefined( self.lastdamagedtime ) && recordedtime - self.lastdamagedtime < bundle.damageknockback.var_16f1e0129aabafd9 * 1000 )
    {
        self.lastdamagedtime = recordedtime;
        return ( force * bundle.damageknockback.var_56f933d5cdad385c );
    }
    
    self.lastdamagedtime = recordedtime;
    return force;
}

// Namespace vehicle_damage
// Params 3, eflags: 0x4
// Checksum 0xf7ff4c9f, Offset: 0x6668
// Size: 0x214
function private function_ea5f5ad915b3206f( vehicle, tagname, damagedata )
{
    if ( !isdefined( vehicle.damageableparts ) )
    {
        return 0;
    }
    
    if ( !isdefined( tagname ) )
    {
        return 0;
    }
    
    if ( !isdefined( vehicle.damageableparts[ tagname ] ) )
    {
        return 0;
    }
    
    if ( function_63ddfcea9493cb5( vehicle.damageableparts[ tagname ] ) )
    {
        return 0;
    }
    
    if ( isdefined( damagedata ) && isdefined( damagedata.objweapon ) && ( utility::callsharedfunc( #"weapons", #"isthrowingknife", damagedata.objweapon ) || utility::callsharedfunc( #"weapons", #"isThrowStar", damagedata.objweapon ) ) )
    {
        damageablepartdata = function_2befc25ca15fa4ef( vehicle vehicle::get_ref() );
        
        if ( !isdefined( damageablepartdata[ tagname ].wheelref ) )
        {
            return 0;
        }
    }
    
    if ( isdefined( damagedata ) && isdefined( damagedata.objweapon ) && damagedata.meansofdeath == "MOD_MELEE" )
    {
        damageablepartdata = function_2befc25ca15fa4ef( vehicle vehicle::get_ref() );
        issharp = utility::callsharedfunc( #"weapons", #"isSharpMeleeWeapon", damagedata.objweapon );
        iswindow = isdefined( damageablepartdata[ tagname ].windowref );
        istire = isdefined( damageablepartdata[ tagname ].wheelref );
        
        if ( issharp && !iswindow && !istire )
        {
            return 0;
        }
        else if ( !issharp && !iswindow )
        {
            return 0;
        }
    }
    
    state = vehicle getscriptablepartstate( tagname, 1 );
    
    if ( isdefined( state ) && ( state == "start_hidden" || state == "hidden_usable" ) )
    {
        return 0;
    }
    
    damagefilterfunc = function_46e4d0ba5e829f68( vehicle vehicle::get_ref(), tagname );
    
    if ( isdefined( damagefilterfunc ) )
    {
        return [[ damagefilterfunc ]]( damagedata );
    }
    
    return 1;
}

// Namespace vehicle_damage
// Params 1
// Checksum 0x5c99f551, Offset: 0x6885
// Size: 0xaf, Type: bool
function function_2b7271a5e9ac2ec6( seatid )
{
    data = vehicle_occupancy::get_data( vehicle::get_ref() );
    return isdefined( self.damageableparts ) && isdefined( data.seatdata[ seatid ].doorwindowref ) && isdefined( data.seatdata[ seatid ] ) && isdefined( self.damageableparts[ data.seatdata[ seatid ].doorwindowref ] ) && !function_63ddfcea9493cb5( self.damageableparts[ data.seatdata[ seatid ].doorwindowref ] );
}

// Namespace vehicle_damage
// Params 1
// Checksum 0x5907f884, Offset: 0x693d
// Size: 0x72
function function_c6b77e6af71ab7d6( seatid )
{
    data = vehicle_occupancy::get_data( vehicle::get_ref() );
    
    if ( isdefined( data.seatdata[ seatid ] ) && isdefined( data.seatdata[ seatid ].doorwindowref ) )
    {
        kill_part( self, data.seatdata[ seatid ].doorwindowref );
    }
}

// Namespace vehicle_damage
// Params 2
// Checksum 0xd8e600ed, Offset: 0x69b7
// Size: 0x4c
function function_8b54529d7c41c894( vehicle, seatid )
{
    self endon( "death_or_disconnect" );
    self endon( "vehicle_seat_exit" );
    utility::waittill_any( "vehicle_leanout_begin", "roof_exit" );
    
    if ( vehicle function_2b7271a5e9ac2ec6( seatid ) )
    {
        vehicle function_c6b77e6af71ab7d6( seatid );
    }
}

// Namespace vehicle_damage
// Params 2
// Checksum 0xe8b96793, Offset: 0x6a0b
// Size: 0x6e
function function_46e4d0ba5e829f68( vehicleref, tagname )
{
    leveldataforvehicle = get_data( vehicleref );
    damagefilter = leveldataforvehicle.damageableparts[ tagname ].damagefilter;
    
    if ( isdefined( damagefilter ) )
    {
        switch ( damagefilter )
        {
            case #"hash_519952040ad478cb":
                return &function_d05a153bd013b437;
        }
    }
    
    return undefined;
}

// Namespace vehicle_damage
// Params 1
// Checksum 0x5c3ce8f, Offset: 0x6a82
// Size: 0x2b
function function_2befc25ca15fa4ef( vehicleref )
{
    leveldataforvehicle = get_data( vehicleref );
    return leveldataforvehicle.damageableparts;
}

// Namespace vehicle_damage
// Params 2
// Checksum 0xae4b5fe, Offset: 0x6ab6
// Size: 0x41
function function_832c3ca9c66e59ba( vehicleref, tagname )
{
    leveldataforvehicle = get_data( vehicleref );
    return leveldataforvehicle.damageableparts[ tagname ].scriptablepartname;
}

// Namespace vehicle_damage
// Params 3
// Checksum 0xdc38e554, Offset: 0x6b00
// Size: 0x4c
function function_ec222609915dafe4( vehicleref, tagname, callbackfunc )
{
    leveldataforvehicle = get_data( vehicleref );
    leveldataforvehicle.damageableparts[ tagname ].var_d6aa641e123523f4 = callbackfunc;
}

// Namespace vehicle_damage
// Params 2
// Checksum 0xe30d2551, Offset: 0x6b54
// Size: 0x41
function function_d1683f189b6bff40( vehicleref, tagname )
{
    leveldataforvehicle = get_data( vehicleref );
    return leveldataforvehicle.damageableparts[ tagname ].var_d6aa641e123523f4;
}

// Namespace vehicle_damage
// Params 1
// Checksum 0xcb7948af, Offset: 0x6b9e
// Size: 0xe2
function function_37a5eba1057e9f53( chance = 0 )
{
    if ( !isdefined( self ) || !vehicle::is_vehicle() )
    {
        return;
    }
    
    data = get_data( vehicle::get_ref() );
    
    if ( !isdefined( data ) )
    {
        return;
    }
    
    tags = data.damageableparts;
    
    if ( !isdefined( tags ) )
    {
        return;
    }
    
    foreach ( tagname, damageablepartdata in tags )
    {
        if ( damageablepartdata.wheelref )
        {
            function_e1a2ac299197f480( tagname, chance );
        }
    }
}

// Namespace vehicle_damage
// Params 2
// Checksum 0xd41c905a, Offset: 0x6c88
// Size: 0x52
function function_e1a2ac299197f480( part, chance )
{
    spawndata = vehicle_tracking::function_d53ca0a2fd01145f();
    
    if ( !isdefined( spawndata.var_67ef11b9f2bef4cf ) )
    {
        spawndata.var_67ef11b9f2bef4cf = [];
    }
    
    spawndata.var_67ef11b9f2bef4cf[ part ] = chance;
}

// Namespace vehicle_damage
// Params 2
// Checksum 0x8ac56ed1, Offset: 0x6ce2
// Size: 0x6c
function function_f2b615c14472e0a4( vehicleref, tagname )
{
    var_7237854e3be197ca = vehicle_tracking::function_d53ca0a2fd01145f().var_67ef11b9f2bef4cf[ tagname ];
    
    if ( isdefined( var_7237854e3be197ca ) )
    {
        return var_7237854e3be197ca;
    }
    
    leveldataforvehicle = get_data( vehicleref );
    return leveldataforvehicle.damageableparts[ tagname ].var_67ef11b9f2bef4cf ?? 30;
}

// Namespace vehicle_damage
// Params 2
// Checksum 0x1e7d450d, Offset: 0x6d57
// Size: 0x42, Type: bool
function function_2e51ef7ed0446ca7( vehicleref, tagname )
{
    leveldataforvehicle = get_data( vehicleref );
    return istrue( leveldataforvehicle.damageableparts[ tagname ].var_aab34cb56f293c25 );
}

// Namespace vehicle_damage
// Params 2
// Checksum 0xa8d71f1, Offset: 0x6da2
// Size: 0x57
function function_ed5d3fa7667ac54( vehicleref, tagname )
{
    leveldataforvehicle = get_data( vehicleref );
    reduction = leveldataforvehicle.damageableparts[ tagname ].damagereduction;
    
    if ( !isdefined( reduction ) )
    {
        reduction = 0;
    }
    
    return reduction;
}

// Namespace vehicle_damage
// Params 3
// Checksum 0x57723f04, Offset: 0x6e02
// Size: 0xcc, Type: bool
function function_68a723ff2e305869( vehicle, tagname, var_d64226ce9e21e098 )
{
    if ( !isdefined( var_d64226ce9e21e098 ) )
    {
        var_d64226ce9e21e098 = 1;
    }
    
    if ( !isdefined( tagname ) )
    {
        return false;
    }
    
    if ( !isdefined( vehicle.damageableparts ) )
    {
        return false;
    }
    
    if ( !isdefined( vehicle.damageableparts[ tagname ] ) )
    {
        return false;
    }
    
    damageablepartdata = function_2befc25ca15fa4ef( vehicle vehicle::get_ref() );
    iswindow = isdefined( damageablepartdata[ tagname ].windowref );
    istire = isdefined( damageablepartdata[ tagname ].wheelref );
    
    if ( istire )
    {
        return true;
    }
    
    if ( var_d64226ce9e21e098 )
    {
        if ( iswindow )
        {
            return true;
        }
        
        if ( issubstr( tagname, "tag_light" ) )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace vehicle_damage
// Params 3
// Checksum 0x31ba55a1, Offset: 0x6ed7
// Size: 0xb5
function function_7b560d1e1dadd7e1( vehicle, tagname, reactivearmorexplosion )
{
    data = vehicle::get_data( vehicle vehicle::get_ref() );
    damageablepartdata = data.damage.damageableparts[ tagname ];
    
    if ( reactivearmorexplosion )
    {
        return "reactive_armor_explosion";
    }
    
    if ( !vehicle vehicle::is_husk() && isdefined( damageablepartdata.wheelref ) && damageablepartdata.wheelref != "not_a_wheel" && level.var_a78a5c3c321451a4 )
    {
        return "death_usable";
    }
    
    return "death";
}

// Namespace vehicle_damage
// Params 4
// Checksum 0x25d874ce, Offset: 0x6f94
// Size: 0x207
function function_eb89abdecc0cacc0( vehicle, damage, point, radius )
{
    if ( !( isdefined( vehicle ) && isdefined( vehicle.damageableparts ) ) || vehicle.damageableparts.size == 0 )
    {
        return;
    }
    
    ref = vehicle vehicle::get_ref();
    expdamageradiussq = function_8832382ea33eb692( ref );
    damageablepartdata = function_2befc25ca15fa4ef( ref );
    radiussquared = radius * radius;
    var_a6cb44236bf4ac6f = undefined;
    var_92117d7cc8d83c0c = undefined;
    var_f4f434fa13cd3d2c = undefined;
    
    foreach ( tagname, healthdata in vehicle.damageableparts )
    {
        if ( vehicle tagexists( tagname ) && damageablepartdata[ tagname ].var_f0bb6cc5e876fad5 )
        {
            var_4b0a0dc6f6033efb = distancesquared( point, vehicle gettagorigin( tagname ) );
            
            if ( var_4b0a0dc6f6033efb <= radiussquared && function_ea5f5ad915b3206f( vehicle, tagname ) && ( !isdefined( var_a6cb44236bf4ac6f ) || var_4b0a0dc6f6033efb < var_a6cb44236bf4ac6f ) )
            {
                var_a6cb44236bf4ac6f = var_4b0a0dc6f6033efb;
                var_92117d7cc8d83c0c = tagname;
                var_f4f434fa13cd3d2c = healthdata;
            }
        }
    }
    
    if ( isdefined( var_92117d7cc8d83c0c ) && isdefined( var_f4f434fa13cd3d2c ) )
    {
        if ( damageablepartdata[ var_92117d7cc8d83c0c ].var_ef2241083f89be87 != 0 && !var_f4f434fa13cd3d2c.damaged && function_badd1a49fc9ab374( vehicle, var_92117d7cc8d83c0c ) )
        {
            damage_part( vehicle, var_92117d7cc8d83c0c );
            return;
        }
        
        var_f4f434fa13cd3d2c.healthvalue = max( 0, var_f4f434fa13cd3d2c.healthvalue - damage );
        
        if ( function_63ddfcea9493cb5( var_f4f434fa13cd3d2c ) )
        {
            kill_part( vehicle, var_92117d7cc8d83c0c );
        }
    }
}

// Namespace vehicle_damage
// Params 4
// Checksum 0xaa89e181, Offset: 0x71a3
// Size: 0x285, Type: bool
function function_95120e6392cd14f1( vehicle, damage, point, wheelstodamage )
{
    if ( !( isdefined( vehicle ) && isdefined( vehicle.damageableparts ) ) || vehicle.damageableparts.size == 0 || wheelstodamage == 0 )
    {
        return false;
    }
    
    ref = vehicle vehicle::get_ref();
    damageablepartdata = function_2befc25ca15fa4ef( ref );
    wheels = [];
    
    foreach ( tagname, healthdata in vehicle.damageableparts )
    {
        if ( !vehicle tagexists( tagname ) || !( isdefined( damageablepartdata[ tagname ].wheelref ) && isdefined( vehicle.damageableparts[ tagname ] ) ) || function_63ddfcea9493cb5( vehicle.damageableparts[ tagname ] ) )
        {
            continue;
        }
        
        wheeldata = spawnstruct();
        wheeldata.origin = vehicle gettagorigin( tagname );
        wheeldata.tag = tagname;
        wheeldata.data = healthdata;
        wheels[ wheels.size ] = wheeldata;
    }
    
    if ( wheels.size == 0 )
    {
        return false;
    }
    
    if ( isdefined( point ) )
    {
        wheels = sortbydistance( wheels, point );
    }
    else
    {
        wheels = utility::array_randomize( wheels );
    }
    
    foreach ( wheel in wheels )
    {
        wheel.data.healthvalue = max( 0, wheel.data.healthvalue - damage );
        
        if ( function_63ddfcea9493cb5( wheel.data ) )
        {
            kill_part( vehicle, wheel.tag );
        }
        
        wheelstodamage -= 1;
        
        if ( wheelstodamage <= 0 )
        {
            return true;
        }
    }
    
    return true;
}

// Namespace vehicle_damage
// Params 2
// Checksum 0x45681a6a, Offset: 0x7431
// Size: 0x3d2
function function_f983e067957101f2( vehicle, damagedata )
{
    tagnames = [];
    tagdistances = [];
    data = get_data( vehicle vehicle::get_ref() );
    
    if ( isdefined( damagedata.partname ) && vehicle tagexists( damagedata.partname ) )
    {
        tagnames[ damagedata.partname ] = damagedata.partname;
    }
    
    if ( isdefined( damagedata.attachtagname ) && vehicle tagexists( damagedata.attachtagname ) )
    {
        tagnames[ damagedata.attachtagname ] = damagedata.attachtagname;
    }
    
    foreach ( tag in tagnames )
    {
        tagdistances[ tag ] = distancesquared( damagedata.point, vehicle gettagorigin( tag ) );
    }
    
    if ( isdefined( vehicle.damageableparts ) && vehicle.damageableparts.size > 0 && isexplosivedamagemod( damagedata.meansofdeath ) )
    {
        expdamageradiussq = data.expdamageradiussq;
        var_cf73a18783d75c7b = data.var_ad08183ba8a73943;
        
        foreach ( tagname, healthvalue in vehicle.damageableparts )
        {
            if ( vehicle tagexists( tagname ) && !function_63ddfcea9493cb5( healthvalue ) && !isdefined( tagnames[ tagname ] ) )
            {
                distancesq = distancesquared( damagedata.point, vehicle gettagorigin( tagname ) );
                
                if ( distancesq <= expdamageradiussq )
                {
                    tagnames[ tagname ] = tagname;
                    tagdistances[ tagname ] = distancesq;
                }
            }
        }
        
        if ( tagdistances.size > var_cf73a18783d75c7b )
        {
            closesttagnames = [];
            
            for ( i = 0; i < var_cf73a18783d75c7b ; i++ )
            {
                closest = undefined;
                closestdistance = undefined;
                
                foreach ( tagname, tagdistance in tagdistances )
                {
                    if ( !isdefined( closestdistance ) || tagdistance < closestdistance )
                    {
                        closestdistance = tagdistance;
                        closest = tagname;
                    }
                }
                
                if ( isdefined( closest ) )
                {
                    closesttagnames[ i ] = closest;
                    tagdistances[ closest ] = undefined;
                    continue;
                }
                
                return closesttagnames;
            }
            
            return closesttagnames;
        }
    }
    
    if ( isdefined( data.var_a24bea462b38d510 ) )
    {
        foreach ( tagnamekey, tagnamevalue in tagnames )
        {
            if ( isdefined( data.var_a24bea462b38d510[ tagnamevalue ] ) )
            {
                tagnames[ tagnamekey ] = data.var_a24bea462b38d510[ tagnamevalue ];
            }
        }
    }
    
    return tagnames;
}

// Namespace vehicle_damage
// Params 2
// Checksum 0xc4540dd4, Offset: 0x780c
// Size: 0xf3
function function_62b5a7480945627a( vehicleref, damageableparts )
{
    huskdamageableparts = function_18d800e98361417f( vehicleref );
    var_d46fcf6efb6584f9 = [];
    
    foreach ( tag, part in huskdamageableparts )
    {
        if ( isdefined( damageableparts[ tag ] ) )
        {
            var_d46fcf6efb6584f9[ tag ] = damageableparts[ tag ];
            continue;
        }
        
        var_b4b92133f6140876 = spawnstruct();
        var_b4b92133f6140876.healthvalue = part.healthvalue;
        var_b4b92133f6140876.explosivedamagehealthvalue = part.explosivedamagehealthvalue;
        var_d46fcf6efb6584f9[ tag ] = var_b4b92133f6140876;
    }
    
    return var_d46fcf6efb6584f9;
}

// Namespace vehicle_damage
// Params 3
// Checksum 0xdf35806a, Offset: 0x7908
// Size: 0x126
function function_f7cac766d4a43bba( vehicleref, damageableparts, isstatic )
{
    if ( !isdefined( damageableparts ) )
    {
        return;
    }
    
    var_b5fa492caf504f56 = !vehicle_tracking::function_d53ca0a2fd01145f() vehicle_spawn::has_flag( 5 );
    
    foreach ( tagname, var_b4b92133f6140876 in damageableparts )
    {
        if ( function_a4800b77fe1849f2( vehicleref, tagname, var_b4b92133f6140876 ) )
        {
            var_b4b92133f6140876.healthvalue = 0;
            hide_part( self, tagname, undefined );
            continue;
        }
        
        if ( function_9b17a89d00082df8( vehicleref, tagname, var_b4b92133f6140876, isstatic ) )
        {
            if ( !var_b5fa492caf504f56 )
            {
                var_b4b92133f6140876.healthvalue = 0;
                hide_part( self, tagname, undefined );
            }
            else
            {
                kill_part( self, tagname, undefined );
            }
            
            continue;
        }
        
        if ( var_b4b92133f6140876.damaged )
        {
            damage_part( self, tagname );
        }
    }
}

// Namespace vehicle_damage
// Params 4
// Checksum 0x4fd30bab, Offset: 0x7a36
// Size: 0x99, Type: bool
function function_9b17a89d00082df8( vehicleref, parttag, healthvalues, isstatic = 0 )
{
    if ( isstatic && isdefined( function_2befc25ca15fa4ef( vehicleref )[ parttag ].wheelref ) )
    {
        return false;
    }
    
    if ( healthvalues.damaged && !function_2befc25ca15fa4ef( vehicleref )[ parttag ].var_61fb2f12d4523437 )
    {
        return true;
    }
    
    destructionchance = function_f2b615c14472e0a4( vehicleref, parttag );
    return randomint( 100 ) < destructionchance;
}

// Namespace vehicle_damage
// Params 3
// Checksum 0x4ca1ee00, Offset: 0x7ad8
// Size: 0x33, Type: bool
function function_a4800b77fe1849f2( vehicleref, parttag, healthvalues )
{
    return function_2e51ef7ed0446ca7( vehicleref, parttag ) || function_63ddfcea9493cb5( healthvalues );
}

// Namespace vehicle_damage
// Params 1
// Checksum 0x6769ed75, Offset: 0x7b14
// Size: 0x2a, Type: bool
function function_63ddfcea9493cb5( var_b4b92133f6140876 )
{
    return var_b4b92133f6140876.healthvalue <= 0 || var_b4b92133f6140876.explosivedamagehealthvalue <= 0;
}

// Namespace vehicle_damage
// Params 2
// Checksum 0x294a8c8a, Offset: 0x7b47
// Size: 0x65, Type: bool
function function_badd1a49fc9ab374( vehicle, part )
{
    partdata = function_2befc25ca15fa4ef( vehicle vehicle::get_ref() );
    
    if ( !partdata[ part ].hasdamagedstate )
    {
        return false;
    }
    
    if ( vehicle vehicle::is_husk() && !partdata[ part ].var_61fb2f12d4523437 )
    {
        return false;
    }
    
    return true;
}

// Namespace vehicle_damage
// Params 2
// Checksum 0x739ad610, Offset: 0x7bb5
// Size: 0xab
function function_e2e7b1a840f99653( vehicle, part )
{
    if ( !isdefined( vehicle.damageableparts[ part ].healthvalue ) )
    {
        return;
    }
    
    partdata = function_2befc25ca15fa4ef( vehicle vehicle::get_ref() );
    
    if ( !partdata[ part ].hasdamagedstate )
    {
        return 0;
    }
    
    var_c1e3d757bf1e235a = ( partdata[ part ].damagedhealthpercent ?? 60 ) / 100 * partdata[ part ].healthvalue;
    return vehicle.damageableparts[ part ].healthvalue < var_c1e3d757bf1e235a;
}

// Namespace vehicle_damage
// Params 1
// Checksum 0x6cbd6943, Offset: 0x7c69
// Size: 0x2b
function function_8832382ea33eb692( vehicleref )
{
    leveldataforvehicle = get_data( vehicleref );
    return leveldataforvehicle.expdamageradiussq;
}

// Namespace vehicle_damage
// Params 1
// Checksum 0xeba777d5, Offset: 0x7c9d
// Size: 0x1b
function function_d05a153bd013b437( damagedata )
{
    return isexplosivedamagemod( damagedata.meansofdeath );
}

// Namespace vehicle_damage
// Params 1, eflags: 0x4
// Checksum 0x4d85bd58, Offset: 0x7cc1
// Size: 0x313
function private function_d4925e0ea413bbde( data )
{
    self endon( "death" );
    self endon( "end_burn_down" );
    ref = vehicle::get_ref();
    
    if ( self.var_1c590489c81560c9 )
    {
        thread vehicle::explode( data, 0 );
        return;
    }
    
    if ( !self.burningdown )
    {
        leveldataforvehicle = vehicle::get_data( ref );
        burndowntime = function_b78d1e92d6ea2ac1( ref, data.objweapon.basename );
        utility::script_func( "onBeginBurndown", data );
        self.burningdown = 1;
        
        if ( isdefined( data ) )
        {
            if ( !isplayer( data.attacker ) )
            {
                if ( isdefined( data.attacker ) && isdefined( data.attacker.owner ) )
                {
                    data.attacker = data.attacker.owner;
                }
                else if ( isdefined( data.inflictor ) )
                {
                    if ( isplayer( data.inflictor ) )
                    {
                        data.attacker = data.inflictor;
                    }
                    else
                    {
                        data.attacker = data.inflictor.owner;
                    }
                }
                else
                {
                    data.attacker = undefined;
                }
            }
            
            self.burndownattacker = data.attacker;
            
            if ( isdefined( data.objweapon ) )
            {
                self.burndownweapon = data.objweapon;
            }
            else
            {
                self.burndownweapon = undefined;
            }
            
            /#
                if ( isdefined( data.attacker ) )
                {
                    assert( isdefined( data.objweapon ), "<dev string:x1f3>" );
                    assert( isdefined( data.objweapon ) && isdefined( data.objweapon.basename ), "<dev string:x24e>" );
                }
            #/
        }
        
        occupants = vehicle_occupancy::function_8ed9bcd8e9ea74f5( self, 0 );
        
        if ( isdefined( occupants ) )
        {
            vehicle_omnvar::show_warning( "burningDown", occupants, ref );
        }
        
        if ( utility::issharedfuncdefined( ref, #"beginBurnDown" ) )
        {
            [[ utility::getsharedfunc( ref, #"beginBurnDown" ) ]]();
        }
        
        explosiondata = vehicle::is_husk() || self.dontspawnhusk && isdefined( leveldataforvehicle.huskexplosion ) ? leveldataforvehicle.huskexplosion : leveldataforvehicle.pristineexplosion;
        radius = int( explosiondata.radius ?? 250 ) + 50;
        childthread function_3713d15304443663( data, burndowntime, radius );
        wait burndowntime;
        self.burningdown = undefined;
        deathfunc = level.vehicles.deathcallback ?? &vehicle::explode;
        self thread [[ deathfunc ]]( data );
        return;
    }
}

// Namespace vehicle_damage
// Params 3, eflags: 0x4
// Checksum 0xabe54c06, Offset: 0x7fdc
// Size: 0x352
function private function_3713d15304443663( data, burndowntime, radius )
{
    if ( vehicle::is_static() )
    {
        wait burndowntime;
        
        if ( utility::issp() )
        {
            self notify( "death" );
        }
        else if ( isdefined( level.vehicles.deathcallback ) )
        {
            level thread [[ level.vehicles.deathcallback ]]( { #direction_vec:( 0, 0, 0 ), #point:( 0, 0, 0 ), #meansofdeath:"MOD_UNKNOWN", #damage:self.health, #victim:self } );
        }
        
        return;
    }
    
    remaininghealth = self.health;
    
    if ( isdefined( data ) && isdefined( data.damage ) )
    {
        remaininghealth = self.health - data.damage;
    }
    
    if ( burndowntime == 0 )
    {
        var_c64f4d1e3ae6e664 = 1;
        var_cd3c16cf48d2d22f = int( ceil( remaininghealth / 0.25 ) );
    }
    else
    {
        var_c64f4d1e3ae6e664 = int( ceil( burndowntime / 1 ) );
        var_cd3c16cf48d2d22f = int( ceil( remaininghealth / var_c64f4d1e3ae6e664 / 0.25 ) );
    }
    
    badplaceorigin = undefined;
    
    for ( i = 0; i < var_c64f4d1e3ae6e664 ; i++ )
    {
        wait 1;
        self dodamage( var_cd3c16cf48d2d22f, self.origin );
        function_4716d5b665e24428( self );
        
        if ( i > 1 )
        {
            if ( !isdefined( badplaceorigin ) && utility::function_6eafaf04149c97d4() )
            {
                badplaceorigin = self.origin;
                
                if ( isdefined( level.var_3d90777bfb7fc504 ) )
                {
                    self.explosionbadplace = function_8c64f71738a17713( badplaceorigin, ( 0, 0, 0 ), 8, radius, radius, level.var_3d90777bfb7fc504 );
                }
                else
                {
                    self.explosionbadplace = createnavbadplacebyshape( badplaceorigin, ( 0, 0, 0 ), 8, radius, radius );
                }
                
                foreach ( agent in utility::agentsnear( badplaceorigin, radius ) )
                {
                    agent.var_980cf4d8967084db = "combat";
                    agent.var_b52fca22f7f1e144 = "combat";
                }
            }
            
            if ( isdefined( self.origin ) && isdefined( badplaceorigin ) && isdefined( self.explosionbadplace ) && distance( badplaceorigin, self.origin ) > 100 )
            {
                destroynavobstacle( self.explosionbadplace );
                badplaceorigin = self.origin;
                
                if ( isdefined( level.var_3d90777bfb7fc504 ) )
                {
                    self.explosionbadplace = function_8c64f71738a17713( badplaceorigin, ( 0, 0, 0 ), 8, radius, radius, level.var_3d90777bfb7fc504 );
                    continue;
                }
                
                self.explosionbadplace = createnavbadplacebyshape( badplaceorigin, ( 0, 0, 0 ), 8, radius, radius );
            }
        }
    }
}

// Namespace vehicle_damage
// Params 1, eflags: 0x4
// Checksum 0xf931fdb4, Offset: 0x8336
// Size: 0x60
function private end_burn_down( fromdeath )
{
    if ( !self.burningdown )
    {
        return;
    }
    
    self notify( "end_burn_down" );
    
    if ( !fromdeath )
    {
        occupants = vehicle_occupancy::function_8ed9bcd8e9ea74f5( self, 0 );
        
        if ( isdefined( occupants ) )
        {
            vehicle_omnvar::hide_warning( "burningDown", occupants, vehicle::get_ref() );
        }
    }
    
    self.burningdown = undefined;
}

// Namespace vehicle_damage
// Params 0
// Checksum 0xfc2e98f9, Offset: 0x839e
// Size: 0xc, Type: bool
function function_b06b0d26ac291477()
{
    return istrue( self.burningdown );
}

// Namespace vehicle_damage
// Params 2
// Checksum 0x76bc9250, Offset: 0x83b3
// Size: 0x310
function function_b78d1e92d6ea2ac1( vehicleref, weaponname )
{
    var_7237854e3be197ca = self.var_d17d7176fa6477c9;
    
    if ( isdefined( var_7237854e3be197ca ) )
    {
        return var_7237854e3be197ca;
    }
    
    leveldata = get_level_data();
    burndowntimes = [ leveldata.burndowntime ];
    vehicledata = get_data( vehicleref );
    
    if ( isdefined( vehicledata.burndowntime ) )
    {
        burndowntimes[ burndowntimes.size ] = vehicledata.burndowntime;
    }
    
    if ( isdefined( self.burndowntime ) )
    {
        burndowntimes[ burndowntimes.size ] = self.burndowntime;
    }
    
    if ( isdefined( vehicledata.class ) && isdefined( weaponname ) && vehicledata.class != "none" )
    {
        hash = getxhash( weaponname );
        tableburndowntime = undefined;
        
        if ( isdefined( leveldata.table.var_2d338257de595229[ hash ] ) )
        {
            switch ( vehicledata.class )
            {
                case #"hash_d2a55c7ac538641b":
                    tableburndowntime = leveldata.table.var_2d338257de595229[ hash ].super_light;
                    break;
                case #"hash_d582c3286e5c390f":
                    tableburndowntime = leveldata.table.var_2d338257de595229[ hash ].light;
                    break;
                case #"hash_21622ca3ad06efb5":
                    tableburndowntime = leveldata.table.var_2d338257de595229[ hash ].medium_light;
                    break;
                case #"hash_c71b112fe04823d6":
                    tableburndowntime = leveldata.table.var_2d338257de595229[ hash ].medium;
                    break;
                case #"hash_53e0b558455f04c6":
                    tableburndowntime = leveldata.table.var_2d338257de595229[ hash ].medium_heavy;
                    break;
                case #"hash_2453c9ffec9f5c20":
                    tableburndowntime = leveldata.table.var_2d338257de595229[ hash ].heavy;
                    break;
                case #"hash_e8ec392f4f2724e4":
                    tableburndowntime = leveldata.table.var_2d338257de595229[ hash ].super_heavy;
                    break;
            }
        }
        
        if ( isdefined( tableburndowntime ) )
        {
            burndowntimes[ burndowntimes.size ] = tableburndowntime;
        }
    }
    
    mintime = burndowntimes[ 0 ];
    
    foreach ( time in burndowntimes )
    {
        mintime = min( time, mintime );
    }
    
    return mintime;
}

// Namespace vehicle_damage
// Params 1
// Checksum 0xef50f1d4, Offset: 0x86cc
// Size: 0x2b3
function function_bbbc556bc9d51672( data )
{
    if ( vehicle::is_killstreak() )
    {
        return 1;
    }
    
    if ( isdefined( data.meansofdeath ) )
    {
        if ( !isexplosivedamagemod( data.meansofdeath ) && data.meansofdeath != "MOD_FIRE" )
        {
            return 0;
        }
        
        if ( data.meansofdeath == "MOD_CRUSH" )
        {
            return 1;
        }
    }
    
    objweapon = data.objweapon;
    
    if ( isdefined( objweapon ) && isdefined( vehicle::get_ref() ) && !isnullweapon( objweapon ) )
    {
        shouldskipburndown = undefined;
        vehiclename = vehicle::get_ref();
        leveldataforvehicle = get_data( vehiclename, undefined, 1 );
        
        if ( isdefined( leveldataforvehicle ) )
        {
            classname = leveldataforvehicle.class;
            
            if ( !isdefined( classname ) || classname == "none" )
            {
                return 1;
            }
            
            if ( leveldataforvehicle.skipburndown )
            {
                return 1;
            }
            
            leveldata = get_level_data();
            table = leveldata.table;
            weaponname = objweapon.basename;
            hash = getxhash( weaponname );
            
            if ( isdefined( table.var_fc11f9579ab02463[ hash ] ) )
            {
                switch ( classname )
                {
                    case #"hash_d2a55c7ac538641b":
                        shouldskipburndown = table.var_fc11f9579ab02463[ hash ].super_light;
                        break;
                    case #"hash_d582c3286e5c390f":
                        shouldskipburndown = table.var_fc11f9579ab02463[ hash ].light;
                        break;
                    case #"hash_21622ca3ad06efb5":
                        shouldskipburndown = table.var_fc11f9579ab02463[ hash ].medium_light;
                        break;
                    case #"hash_c71b112fe04823d6":
                        shouldskipburndown = table.var_fc11f9579ab02463[ hash ].medium;
                        break;
                    case #"hash_53e0b558455f04c6":
                        shouldskipburndown = table.var_fc11f9579ab02463[ hash ].medium_heavy;
                        break;
                    case #"hash_2453c9ffec9f5c20":
                        shouldskipburndown = table.var_fc11f9579ab02463[ hash ].heavy;
                        break;
                    case #"hash_e8ec392f4f2724e4":
                        shouldskipburndown = table.var_fc11f9579ab02463[ hash ].super_heavy;
                        break;
                }
            }
            
            var_7237854e3be197ca = shouldskipburndown;
            
            if ( isdefined( var_7237854e3be197ca ) )
            {
                return var_7237854e3be197ca;
            }
        }
        else
        {
            return 1;
        }
    }
    else
    {
        return 1;
    }
    
    return 0;
}

// Namespace vehicle_damage
// Params 1
// Checksum 0x6404ecf4, Offset: 0x8988
// Size: 0x1e
function function_bbb46fd1c4790a39( vehicleref )
{
    return vehicle::get_data( vehicleref ).weapon;
}

// Namespace vehicle_damage
// Params 1
// Checksum 0xc691590e, Offset: 0x89af
// Size: 0x2b
function function_db73eaef77b6f00d( vehicleref )
{
    data = vehicle::get_data( vehicleref );
    return data.weapon;
}

// Namespace vehicle_damage
// Params 0
// Checksum 0x7c8038f6, Offset: 0x89e3
// Size: 0x30c
function explode()
{
    if ( !vehicle::can_explode() )
    {
        return;
    }
    
    ref = vehicle::get_ref();
    data = vehicle::get_data( ref );
    ishusk = vehicle::is_husk();
    explosiondata = ishusk || self.dontspawnhusk && isdefined( data.huskexplosion ) ? data.huskexplosion : data.pristineexplosion;
    weaponstring = ishusk ? function_db73eaef77b6f00d( ref ) : function_bbb46fd1c4790a39( ref );
    mtx = self.mtx;
    waittillframeend();
    
    if ( !isdefined( self ) )
    {
        return;
    }
    
    assert( isdefined( explosiondata ), "<dev string:x2c7>" );
    explosionposition = self gettagorigin( explosiondata.tag );
    damageposition = explosionposition;
    
    if ( isdefined( explosiondata.damageoffset ) )
    {
        damageposition += rotatevector( ( explosiondata.damageoffset.x ?? 0, explosiondata.damageoffset.y ?? 0, explosiondata.damageoffset.z ?? 0 ), self.angles );
    }
    
    attacker = self.burndownattacker ?? self;
    
    if ( !isent( attacker ) )
    {
        attacker = undefined;
    }
    
    self radiusdamage( damageposition, explosiondata.radius, explosiondata.maxdamage, explosiondata.mindamage, attacker, "MOD_EXPLOSIVE", weaponstring );
    self stopsounds();
    explosionstring = vehicle::is_husk() ? "_husk_explosion" : "_explosion";
    fxname = isxhashasset( vehicle::get_ref() ) ? hashcat( vehicle::get_ref(), explosionstring ) : vehicle::get_ref() + explosionstring;
    function_c10f854d96e7458f( explosiondata, damageposition, fxname, mtx );
    
    if ( level.projectbundle.var_f58a6e2322572bc2 && function_4042d2fbe6237835( #"hash_f13e37a2307443e0" ) )
    {
        level.projectbundle.var_f58a6e2322572bc2 = 0;
    }
    
    if ( level.projectbundle.var_f58a6e2322572bc2 && isdefined( explosiondata.shockwave ) )
    {
        utility::function_ce86ddbb7d60e9bd( explosionposition, explosiondata.shockwave, self.owner );
    }
    else
    {
        if ( explosiondata.earthquakescale > 0 )
        {
            earthquake( explosiondata.earthquakescale, explosiondata.earthquakeduration, explosionposition, explosiondata.earthquakeradius );
        }
        
        playrumbleonposition( "grenade_rumble", explosionposition );
    }
    
    physicsexplosionsphere( explosionposition, explosiondata.physicsouterradius, explosiondata.physicsinnerradius, explosiondata.physicsscale );
}

// Namespace vehicle_damage
// Params 4
// Checksum 0xf3a324f0, Offset: 0x8cf7
// Size: 0x13c
function function_c10f854d96e7458f( explosiondata, explosionposition, explosionfxname, mtx )
{
    if ( isdefined( explosiondata.scriptable ) )
    {
        explosionscriptable = spawn( "script_model", explosionposition );
        explosionscriptable setmodel( explosiondata.scriptable );
        explosionscriptable.angles = self.angles;
        
        if ( isdefined( mtx.var_d461a71290fd3dcd ) && explosionscriptable getscriptableparthasstate( "explosion", mtx.var_d461a71290fd3dcd ) )
        {
            explosionscriptable setscriptablepartstate( "explosion", mtx.var_d461a71290fd3dcd );
        }
        else
        {
            explosionscriptable setscriptablepartstate( "explosion", "on" );
        }
        
        explosionscriptable utility::delaycall( explosiondata.var_593583c7d7ba2ae6 ?? 7, &delete );
        return;
    }
    
    if ( utility::fxexists( explosionfxname ) )
    {
        playfx( utility::getfx( explosionfxname ), explosionposition, anglestoforward( self.angles ), anglestoup( self.angles ) );
    }
    
    if ( isdefined( explosiondata.sfx ) )
    {
        playsoundatpos( explosionposition, explosiondata.sfx );
    }
}

// Namespace vehicle_damage
// Params 0
// Checksum 0xc1d7a98, Offset: 0x8e3b
// Size: 0x13
function function_2fec514ed5f9106d()
{
    if ( vehicle::is_husk() )
    {
        return 0;
    }
    
    return 1;
}

// Namespace vehicle_damage
// Params 2
// Checksum 0x25bfa5ca, Offset: 0x8e56
// Size: 0x242
function function_6c7722241a521e9( oldstateref, data )
{
    if ( isdefined( data ) && isdefined( data.attacker ) )
    {
        leveldataforvehicle = get_data( vehicle::get_ref(), undefined, 1 );
        
        if ( isdefined( leveldataforvehicle ) )
        {
            instancedataforvehicle = function_29894e0fa6bf739( self, undefined, 1 );
            scoreevent = undefined;
            var_3eb1a94a2f14121 = undefined;
            award = undefined;
            awardlaunchonly = undefined;
            
            if ( isdefined( instancedataforvehicle ) )
            {
                scoreevent = instancedataforvehicle.heavydamagescoreevent;
                var_3eb1a94a2f14121 = instancedataforvehicle.heavydamagescorelaunchonly;
                award = instancedataforvehicle.heavydamageaward;
                awardlaunchonly = instancedataforvehicle.heavydamageawardlaunchonly;
            }
            
            if ( isdefined( leveldataforvehicle.class ) )
            {
                if ( !isdefined( scoreevent ) )
                {
                    switch ( leveldataforvehicle.class )
                    {
                        case #"hash_d2a55c7ac538641b":
                        case #"hash_d582c3286e5c390f":
                            scoreevent = #"disabled_vehicle_light";
                            break;
                        case #"hash_21622ca3ad06efb5":
                        case #"hash_53e0b558455f04c6":
                        case #"hash_c71b112fe04823d6":
                            scoreevent = #"disabled_vehicle_medium";
                            break;
                        case #"hash_2453c9ffec9f5c20":
                        case #"hash_e8ec392f4f2724e4":
                            scoreevent = #"disabled_vehicle_heavy";
                            break;
                    }
                }
                
                if ( !isdefined( award ) )
                {
                }
            }
            
            if ( scoreevent == #"none" )
            {
                scoreevent = undefined;
            }
            
            if ( award == "none" )
            {
                award = undefined;
            }
            
            if ( !data.givepointsandxp && isplayer( data.attacker ) )
            {
                data.givepointsandxp = vehicle::function_8266feb1ae1c46bd( self, data.attacker );
            }
            
            if ( isdefined( data.objweapon ) && weaponclass( data.objweapon.basename ) != "rocketlauncher" )
            {
                if ( var_3eb1a94a2f14121 )
                {
                    data.scoreeventnoweaponxp = 1;
                }
                
                if ( awardlaunchonly )
                {
                    data.awardnoweaponxp = 1;
                }
            }
            
            data.attacker thread function_d060bb312634dea7( scoreevent, award, data, self );
        }
    }
}

// Namespace vehicle_damage
// Params 1
// Checksum 0x722703d3, Offset: 0x90a0
// Size: 0x33e
function function_7d082f909fac51a3( data )
{
    if ( vehicle::is_killstreak() )
    {
        return;
    }
    
    if ( isdefined( data ) && isdefined( data.attacker ) )
    {
        leveldataforvehicle = get_data( vehicle::get_ref(), undefined, 1 );
        
        if ( isdefined( leveldataforvehicle ) )
        {
            instancedataforvehicle = function_29894e0fa6bf739( self, undefined, 1 );
            scoreevent = undefined;
            var_3eb1a94a2f14121 = undefined;
            award = undefined;
            awardlaunchonly = undefined;
            
            if ( isdefined( instancedataforvehicle ) )
            {
                scoreevent = instancedataforvehicle.destroyscoreevent;
                var_3eb1a94a2f14121 = instancedataforvehicle.destroyscorelaunchonly;
                award = instancedataforvehicle.destroyaward;
                awardlaunchonly = instancedataforvehicle.destroyawardlaunchonly;
            }
            
            if ( isdefined( leveldataforvehicle.class ) )
            {
                if ( !isdefined( scoreevent ) )
                {
                    switch ( leveldataforvehicle.class )
                    {
                        case #"hash_d2a55c7ac538641b":
                        case #"hash_d582c3286e5c390f":
                            scoreevent = #"destroyed_vehicle_light";
                            break;
                        case #"hash_21622ca3ad06efb5":
                        case #"hash_53e0b558455f04c6":
                        case #"hash_c71b112fe04823d6":
                            scoreevent = #"destroyed_vehicle_medium";
                            break;
                        case #"hash_2453c9ffec9f5c20":
                        case #"hash_e8ec392f4f2724e4":
                            scoreevent = #"destroyed_vehicle_heavy";
                            break;
                        default:
                            scoreevent = #"none";
                            break;
                    }
                }
                
                if ( !isdefined( award ) )
                {
                }
            }
            
            if ( scoreevent == #"none" )
            {
                scoreevent = undefined;
            }
            
            if ( award == "none" )
            {
                award = undefined;
            }
            
            if ( isplayer( data.attacker ) )
            {
                if ( !isdefined( data.givepointsandxp ) )
                {
                    data.givepointsandxp = vehicle::function_8266feb1ae1c46bd( self, data.attacker );
                }
                else if ( data.givepointsandxp && vehicle::function_8957ae4cd340941c( self, data.attacker ) )
                {
                    data.givepointsandxp = 0;
                }
                else if ( !data.givepointsandxp && vehicle::function_8266feb1ae1c46bd( self, data.attacker ) )
                {
                    data.givepointsandxp = 1;
                }
            }
            else
            {
                data.givepointsandxp = 0;
            }
            
            if ( isdefined( data.objweapon ) && weaponclass( data.objweapon.basename ) != "rocketlauncher" )
            {
                if ( var_3eb1a94a2f14121 )
                {
                    data.scoreeventnoweaponxp = 1;
                }
                
                if ( awardlaunchonly )
                {
                    data.awardnoweaponxp = 1;
                }
            }
            
            if ( utility::issharedfuncdefined( #"challenges", #"onVehicleKilled" ) )
            {
                data.attacker thread [[ utility::getsharedfunc( #"challenges", #"onVehicleKilled" ) ]]( self, data.attacker, data.damage, data.objweapon );
            }
            
            data.attacker function_1921aed0ac6366ed( scoreevent, award, data, self getentitynumber() );
        }
    }
}

// Namespace vehicle_damage
// Params 1
// Checksum 0xd29d3842, Offset: 0x93e6
// Size: 0x94
function function_3fe90cbe40505e7d( data )
{
    vehicleref = vehicle::get_ref();
    
    if ( isdefined( vehicleref ) && isdefined( data ) )
    {
        vehicledata = get_data( vehicleref );
        
        if ( isdefined( vehicledata ) && vehicledata.scrapassist && utility::issharedfuncdefined( #"killstreak", #"processscrapassist" ) )
        {
            self thread [[ utility::getsharedfunc( #"killstreak", #"processscrapassist" ) ]]( data.attacker );
        }
    }
}

// Namespace vehicle_damage
// Params 4, eflags: 0x4
// Checksum 0x41fe4410, Offset: 0x9482
// Size: 0x66
function private function_d060bb312634dea7( scoreevent, award, data, vehicle )
{
    if ( vehicle vehicle::is_killstreak() )
    {
        return;
    }
    
    vehentnum = vehicle getentitynumber();
    self endon( "disconnect" );
    self endon( "vehicle_damage_giveScoreAndXP" + vehentnum );
    waittillframeend();
    thread function_1921aed0ac6366ed( scoreevent, award, data, vehentnum );
}

// Namespace vehicle_damage
// Params 4, eflags: 0x4
// Checksum 0xa3a05e6b, Offset: 0x94f0
// Size: 0x114
function private function_1921aed0ac6366ed( scoreevent, award, data, vehentnum )
{
    self notify( "vehicle_damage_giveScoreAndXP" + vehentnum );
    
    if ( isdefined( scoreevent ) && utility::issharedfuncdefined( #"vehicle_damage", #"givescore" ) )
    {
        objweapon = data.scoreeventnoweaponxp ? undefined : data.objweapon;
        self [[ utility::getsharedfunc( #"vehicle_damage", #"givescore" ) ]]( scoreevent, objweapon, !data.givepointsandxp );
    }
    
    if ( isdefined( award ) && utility::issharedfuncdefined( #"vehicle_damage", #"giveaward" ) )
    {
        objweapon = data.awardnoweaponxp ? undefined : data.objweapon;
        self [[ utility::getsharedfunc( #"vehicle_damage", #"giveaward" ) ]]( award, objweapon, !data.givepointsandxp );
    }
}

// Namespace vehicle_damage
// Params 0, eflags: 0x4
// Checksum 0xae602e35, Offset: 0x960c
// Size: 0x59
function private init_hit_damage_data()
{
    assert( isdefined( level.vehicle ), "<dev string:x36a>" );
    data = spawnstruct();
    level.vehicle.hitdamage = data;
    data.vehicles = [];
    data.weapons = [];
}

// Namespace vehicle_damage
// Params 0, eflags: 0x4
// Checksum 0xc29d64b5, Offset: 0x966d
// Size: 0x73
function private init_mod_damage_data()
{
    assert( isdefined( level.vehicle ), "<dev string:x3b1>" );
    data = spawnstruct();
    level.vehicle.moddamage = data;
    data.vehicles = [];
    data.weaponclasses = [];
    data.perks = [];
    data.attachments = [];
}

// Namespace vehicle_damage
// Params 3
// Checksum 0xa77bc948, Offset: 0x96e8
// Size: 0x146
function get_hit_damage( damage, vehicle, objweapon )
{
    vehicleref = vehicle vehicle::get_ref();
    weaponref = objweapon.basename;
    vehicledata = get_vehicle_hit_damage_data( vehicleref );
    weapondata = get_weapon_hit_damage_data( weaponref );
    
    if ( isdefined( vehicledata ) && isdefined( weapondata ) )
    {
        hitstokill = weapondata.vehiclehitstokill[ vehicleref ];
        
        if ( !isdefined( hitstokill ) || hitstokill == 0 )
        {
            hitstokill = vehicledata.hitstokill;
        }
        
        hitsperattack = vehicledata.weaponhitsperattack[ weaponref ];
        
        if ( !isdefined( hitsperattack ) || hitsperattack == 0 )
        {
            hitsperattack = weapondata.hitsperattack;
        }
        
        if ( hitstokill > 0 && hitsperattack > 0 && !vehicle.debugdamage )
        {
            healthratio = hitsperattack / hitstokill;
            maxhealth = get_data( vehicleref ).health ?? vehicle.maxhealth;
            damage = int( ceil( healthratio * maxhealth ) );
        }
    }
    
    return damage;
}

// Namespace vehicle_damage
// Params 4
// Checksum 0x15538593, Offset: 0x9837
// Size: 0x45
function get_mod_damage( damage, vehicle, objweapon, attacker )
{
    modifier = get_mod_damage_modifier( vehicle, objweapon, attacker );
    return ceil( damage * modifier );
}

// Namespace vehicle_damage
// Params 3, eflags: 0x4
// Checksum 0xdddcbcf9, Offset: 0x9885
// Size: 0x318
function private get_mod_damage_modifier( vehicle, objweapon, attacker )
{
    assert( vehicle vehicle::is_vehicle(), "<dev string:x3f8>" );
    assert( isdefined( objweapon ), "<dev string:x435>" );
    modifier = 0;
    var_24113db7b0ea127d = 1;
    vehicleref = vehicle vehicle::get_ref();
    vehicledata = get_vehicle_mod_damage_data( vehicleref );
    
    if ( isdefined( vehicledata ) )
    {
        weaponclassref = objweapon.classname;
        weaponclassdata = get_weapon_class_mod_damage_data( weaponclassref );
        
        if ( isdefined( weaponclassdata ) )
        {
            var_cf498c8cc6bcacae = vehicledata.weaponclassdata[ weaponclassref ];
            
            if ( isdefined( var_cf498c8cc6bcacae ) )
            {
                weaponclassdata = var_cf498c8cc6bcacae;
            }
            
            if ( weaponclassdata.modifier != 0 )
            {
                if ( weaponclassdata.ismultiplicative )
                {
                    var_24113db7b0ea127d *= weaponclassdata.modifier;
                }
                else
                {
                    modifier += weaponclassdata.modifier;
                }
            }
        }
        
        if ( isdefined( attacker ) && isdefined( attacker.perks ) )
        {
            foreach ( perkref, stackcount in attacker.perks )
            {
                perkdata = get_perk_mod_damage_data( perkref );
                
                if ( isdefined( perkdata ) )
                {
                    var_69060e8a58f7c7d2 = vehicledata.perkdata[ perkref ];
                    
                    if ( isdefined( var_69060e8a58f7c7d2 ) )
                    {
                        perkdata = var_69060e8a58f7c7d2;
                    }
                    
                    if ( perkdata.modifier != 0 )
                    {
                        if ( perkdata.ismultiplicative )
                        {
                            var_24113db7b0ea127d *= perkdata.modifier;
                            continue;
                        }
                        
                        modifier += perkdata.modifier;
                    }
                }
            }
        }
        
        if ( isdefined( objweapon.attachments ) )
        {
            foreach ( attachmentref in objweapon.attachments )
            {
                attachmentref = attachmentref;
                attachmentdata = get_attachment_mod_damage_data( attachmentref );
                
                if ( isdefined( attachmentdata ) )
                {
                    var_fb81c3cdc0040af3 = vehicledata.attachmentdata[ attachmentref ];
                    
                    if ( isdefined( var_fb81c3cdc0040af3 ) )
                    {
                        attachmentdata = var_fb81c3cdc0040af3;
                    }
                    
                    if ( attachmentdata.modifier != 0 )
                    {
                        if ( attachmentdata.ismultiplicative )
                        {
                            var_24113db7b0ea127d *= attachmentdata.modifier;
                            continue;
                        }
                        
                        modifier += attachmentdata.modifier;
                    }
                }
            }
        }
    }
    
    return modifier + var_24113db7b0ea127d;
}

// Namespace vehicle_damage
// Params 4
// Checksum 0xd89bf0d1, Offset: 0x9ba6
// Size: 0xb1
function function_86431c2d7f105aee( weaponclass, mod, var_39391a3c00d2aba0, vehicleref )
{
    if ( var_39391a3c00d2aba0 )
    {
        assert( mod > 0, "<dev string:x474>" );
    }
    
    vehicledata = get_vehicle_mod_damage_data( vehicleref, 1 );
    get_weapon_class_mod_damage_data( weaponclass, 1 );
    data = vehicledata.weaponclassdata[ weaponclass ];
    
    if ( !isdefined( data ) )
    {
        data = create_mod_damage_data_empty();
    }
    
    data.modifier = mod;
    data.ismultiplicative = var_39391a3c00d2aba0;
    vehicledata.weaponclassdata[ weaponclass ] = data;
}

// Namespace vehicle_damage
// Params 3
// Checksum 0xfddcf991, Offset: 0x9c5f
// Size: 0x66
function function_74377470e00a470( ref, mod, var_39391a3c00d2aba0 )
{
    if ( var_39391a3c00d2aba0 )
    {
        assert( mod > 0, "<dev string:x474>" );
    }
    
    data = get_perk_mod_damage_data( ref, 1 );
    data.modifier = mod;
    data.ismultiplicative = var_39391a3c00d2aba0;
}

// Namespace vehicle_damage
// Params 2
// Checksum 0x130e618d, Offset: 0x9ccd
// Size: 0x9b
function get_perk_mod_damage_data( ref, create )
{
    assert( isdefined( level.vehicle.moddamage ), "<dev string:x49f>" );
    data = level.vehicle.moddamage.perks[ ref ];
    
    if ( !isdefined( data ) && create )
    {
        data = create_mod_damage_data_empty();
        level.vehicle.moddamage.perks[ ref ] = data;
    }
    
    return data;
}

// Namespace vehicle_damage
// Params 0
// Checksum 0xcfa6c050, Offset: 0x9d71
// Size: 0x2e
function create_mod_damage_data_empty()
{
    data = spawnstruct();
    data.modifier = 0;
    data.ismultiplicative = 0;
    return data;
}

// Namespace vehicle_damage
// Params 2
// Checksum 0xea06158a, Offset: 0x9da8
// Size: 0x4a
function set_weapon_hit_damage_data( weaponref, hitsperattack )
{
    assert( hitsperattack > 0, "<dev string:x4e3>" );
    data = get_weapon_hit_damage_data( weaponref, 1 );
    data.hitsperattack = hitsperattack;
}

// Namespace vehicle_damage
// Params 2
// Checksum 0xc9880bc, Offset: 0x9dfa
// Size: 0xc1
function get_weapon_hit_damage_data( ref, create )
{
    assert( isdefined( level.vehicle.hitdamage ), "<dev string:x510>" );
    data = level.vehicle.hitdamage.weapons[ ref ];
    
    if ( !isdefined( data ) && create )
    {
        data = spawnstruct();
        data.ref = ref;
        data.hitsperattack = 0;
        data.vehiclehitstokill = [];
        level.vehicle.hitdamage.weapons[ ref ] = data;
    }
    
    return data;
}

// Namespace vehicle_damage
// Params 2
// Checksum 0x773635a1, Offset: 0x9ec4
// Size: 0x4a
function set_vehicle_hit_damage_data( ref, hitstokill )
{
    assert( hitstokill > 0, "<dev string:x55a>" );
    data = get_vehicle_hit_damage_data( ref, 1 );
    data.hitstokill = hitstokill;
}

// Namespace vehicle_damage
// Params 3
// Checksum 0xc8948fb2, Offset: 0x9f16
// Size: 0x69
function set_vehicle_hit_damage_data_for_weapon( ref, hitstokill, weaponref )
{
    assert( hitstokill > 0, "<dev string:x55a>" );
    data = get_vehicle_hit_damage_data( ref, 1 );
    weapondata = get_weapon_hit_damage_data( weaponref, 1 );
    weapondata.vehiclehitstokill[ ref ] = hitstokill;
}

// Namespace vehicle_damage
// Params 3
// Checksum 0x7da4fa72, Offset: 0x9f87
// Size: 0x69
function set_weapon_hit_damage_data_for_vehicle( weaponref, hitsperattack, vehicleref )
{
    assert( hitsperattack > 0, "<dev string:x4e3>" );
    data = get_weapon_hit_damage_data( weaponref, 1 );
    vehicledata = get_vehicle_hit_damage_data( vehicleref, 1 );
    vehicledata.weaponhitsperattack[ weaponref ] = hitsperattack;
}

// Namespace vehicle_damage
// Params 2
// Checksum 0x953d19d, Offset: 0x9ff8
// Size: 0xc1
function get_vehicle_hit_damage_data( ref, create )
{
    assert( isdefined( level.vehicle.hitdamage ), "<dev string:x584>" );
    data = level.vehicle.hitdamage.vehicles[ ref ];
    
    if ( !isdefined( data ) && create )
    {
        data = spawnstruct();
        data.ref = ref;
        data.hitstokill = 0;
        data.weaponhitsperattack = [];
        level.vehicle.hitdamage.vehicles[ ref ] = data;
    }
    
    return data;
}

// Namespace vehicle_damage
// Params 2
// Checksum 0xde005189, Offset: 0xa0c2
// Size: 0xc0
function get_vehicle_mod_damage_data( ref, create )
{
    assert( isdefined( level.vehicle.moddamage ), "<dev string:x5cf>" );
    data = level.vehicle.moddamage.vehicles[ ref ];
    
    if ( !isdefined( data ) && create )
    {
        data = spawnstruct();
        data.weaponclassdata = [];
        data.perkdata = [];
        data.attachmentdata = [];
        level.vehicle.moddamage.vehicles[ ref ] = data;
    }
    
    return data;
}

// Namespace vehicle_damage
// Params 2
// Checksum 0x9e90f210, Offset: 0xa18b
// Size: 0x9b
function get_weapon_class_mod_damage_data( ref, create )
{
    assert( isdefined( level.vehicle.moddamage ), "<dev string:x616>" );
    data = level.vehicle.moddamage.weaponclasses[ ref ];
    
    if ( !isdefined( data ) && create )
    {
        data = create_mod_damage_data_empty();
        level.vehicle.moddamage.weaponclasses[ ref ] = data;
    }
    
    return data;
}

// Namespace vehicle_damage
// Params 2
// Checksum 0x2d692360, Offset: 0xa22f
// Size: 0x9b
function get_attachment_mod_damage_data( ref, create )
{
    assert( isdefined( level.vehicle.moddamage ), "<dev string:x662>" );
    data = level.vehicle.moddamage.attachments[ ref ];
    
    if ( !isdefined( data ) && create )
    {
        data = create_mod_damage_data_empty();
        level.vehicle.moddamage.attachments[ ref ] = data;
    }
    
    return data;
}

// Namespace vehicle_damage
// Params 3
// Checksum 0xcdfd712f, Offset: 0xa2d3
// Size: 0x66
function set_weapon_class_mod_damage_data( ref, mod, var_39391a3c00d2aba0 )
{
    if ( var_39391a3c00d2aba0 )
    {
        assert( mod > 0, "<dev string:x474>" );
    }
    
    data = get_weapon_class_mod_damage_data( ref, 1 );
    data.modifier = mod;
    data.ismultiplicative = var_39391a3c00d2aba0;
}

// Namespace vehicle_damage
// Params 3
// Checksum 0xb743e48e, Offset: 0xa341
// Size: 0x66
function set_perk_mod_damage_data( ref, mod, var_39391a3c00d2aba0 )
{
    if ( var_39391a3c00d2aba0 )
    {
        assert( mod > 0, "<dev string:x474>" );
    }
    
    data = get_perk_mod_damage_data( ref, 1 );
    data.modifier = mod;
    data.ismultiplicative = var_39391a3c00d2aba0;
}

// Namespace vehicle_damage
// Params 4
// Checksum 0x561defd1, Offset: 0xa3af
// Size: 0xb1
function set_perk_mod_damage_data_for_vehicle( ref, mod, var_39391a3c00d2aba0, vehicleref )
{
    if ( var_39391a3c00d2aba0 )
    {
        assert( mod > 0, "<dev string:x474>" );
    }
    
    vehicledata = get_vehicle_mod_damage_data( vehicleref, 1 );
    get_perk_mod_damage_data( ref, 1 );
    data = vehicledata.perkdata[ ref ];
    
    if ( !isdefined( data ) )
    {
        data = create_mod_damage_data_empty();
    }
    
    data.modifier = mod;
    data.ismultiplicative = var_39391a3c00d2aba0;
    vehicledata.perkdata[ ref ] = data;
}

// Namespace vehicle_damage
// Params 3
// Checksum 0x2041b5ce, Offset: 0xa468
// Size: 0x66
function set_attachment_mod_damage_data( ref, mod, var_39391a3c00d2aba0 )
{
    if ( var_39391a3c00d2aba0 )
    {
        assert( mod > 0, "<dev string:x474>" );
    }
    
    data = get_attachment_mod_damage_data( ref, 1 );
    data.modifier = mod;
    data.ismultiplicative = var_39391a3c00d2aba0;
}

// Namespace vehicle_damage
// Params 4
// Checksum 0xc6fe4183, Offset: 0xa4d6
// Size: 0xb1
function set_attachment_mod_damage_data_for_vehicle( ref, mod, var_39391a3c00d2aba0, vehicleref )
{
    if ( var_39391a3c00d2aba0 )
    {
        assert( mod > 0, "<dev string:x474>" );
    }
    
    vehicledata = get_vehicle_mod_damage_data( vehicleref, 1 );
    get_attachment_mod_damage_data( ref, 1 );
    data = vehicledata.attachmentdata[ ref ];
    
    if ( !isdefined( data ) )
    {
        data = create_mod_damage_data_empty();
    }
    
    data.modifier = mod;
    data.ismultiplicative = var_39391a3c00d2aba0;
    vehicledata.attachmentdata[ ref ] = data;
}

// Namespace vehicle_damage
// Params 2
// Checksum 0xc4a216df, Offset: 0xa58f
// Size: 0x4e
function set_pre_mod_damage_callback( vehicleref, callback )
{
    if ( utility::issharedfuncdefined( #"vehicle_damage", #"setPreModDamageCallback" ) )
    {
        [[ utility::getsharedfunc( #"vehicle_damage", #"setPreModDamageCallback" ) ]]( vehicleref, callback );
    }
}

// Namespace vehicle_damage
// Params 2
// Checksum 0xb3e43c12, Offset: 0xa5e5
// Size: 0x4e
function set_post_mod_damage_callback( vehicleref, callback )
{
    if ( utility::issharedfuncdefined( #"vehicle_damage", #"setPostModDamageCallback" ) )
    {
        [[ utility::getsharedfunc( #"vehicle_damage", #"setPostModDamageCallback" ) ]]( vehicleref, callback );
    }
}

// Namespace vehicle_damage
// Params 2
// Checksum 0xf0c233da, Offset: 0xa63b
// Size: 0x4e
function set_death_callback( vehicleref, callback )
{
    if ( utility::issharedfuncdefined( #"vehicle_damage", #"setDeathCallback" ) )
    {
        [[ utility::getsharedfunc( #"vehicle_damage", #"setDeathCallback" ) ]]( vehicleref, callback );
    }
}

// Namespace vehicle_damage
// Params 3
// Checksum 0x777c147, Offset: 0xa691
// Size: 0x61
function function_1668b048ae097d01( vehicleref, seatid, damagescale )
{
    leveldataforvehicle = get_data( vehicleref, 1 );
    
    if ( !isdefined( leveldataforvehicle.occupantdamagescale ) )
    {
        leveldataforvehicle.occupantdamagescale = [];
    }
    
    leveldataforvehicle.occupantdamagescale[ seatid ] = damagescale;
}

// Namespace vehicle_damage
// Params 3
// Checksum 0x777c147, Offset: 0xa6fa
// Size: 0x61
function function_e0545be231a5016c( vehicleref, seatid, damageclamp )
{
    leveldataforvehicle = get_data( vehicleref, 1 );
    
    if ( !isdefined( leveldataforvehicle.occupantdamageclamp ) )
    {
        leveldataforvehicle.occupantdamageclamp = [];
    }
    
    leveldataforvehicle.occupantdamageclamp[ seatid ] = damageclamp;
}

// Namespace vehicle_damage
// Params 1, eflags: 0x4
// Checksum 0x39497d14, Offset: 0xa763
// Size: 0xd6
function private onagentkilled( params )
{
    if ( params.smeansofdeath != "MOD_CRUSH" )
    {
        return;
    }
    
    vehicle = params.einflictor;
    
    if ( !isdefined( vehicle ) || !vehicle vehicle::is_vehicle() )
    {
        return;
    }
    
    ref = vehicle vehicle::get_ref();
    
    if ( !isdefined( ref ) || !vehicle::has_data( ref ) )
    {
        return;
    }
    
    data = get_data( ref );
    
    if ( !isdefined( data.var_bcfe42623f129b7b ) )
    {
        return;
    }
    
    vehicle dodamage( int( vehicle.maxhealth * data.var_bcfe42623f129b7b / 100 ), vehicle.origin, self, self, "MOD_CRUSH", function_bbb46fd1c4790a39( ref ) );
}

// Namespace vehicle_damage
// Params 0, eflags: 0x4
// Checksum 0xe522ca, Offset: 0xa841
// Size: 0x3f
function private init_debug()
{
    /#
        if ( getdvarint( @"nodebug", 0 ) >= 1 )
        {
            return;
        }
        
        setdvarifuninitialized( @"scr_vehiclegod", 0 );
        setdvarifuninitialized( @"hash_4827ebae75561872", 0 );
        thread monitor_debug();
    #/
}

/#

    // Namespace vehicle_damage
    // Params 0, eflags: 0x4
    // Checksum 0x12411595, Offset: 0xa888
    // Size: 0x156, Type: dev
    function private monitor_debug()
    {
        level.vehiclegod = getdvarint( @"scr_vehiclegod", 0 ) > 0;
        
        while ( true )
        {
            simulatedamagepercent = getdvarint( @"hash_4827ebae75561872", 0 );
            
            if ( simulatedamagepercent > 0 )
            {
                vehicles = vehicle_tracking::function_5820a38c9873992e();
                
                if ( vehicles.size > 0 )
                {
                    iprintln( "<dev string:x6ac>" + simulatedamagepercent + "<dev string:x6b1>" );
                }
                
                foreach ( vehicle in vehicles )
                {
                    if ( isdefined( vehicle ) && !vehicle vehicle::is_destroyed() )
                    {
                        simulate_damage( vehicle, simulatedamagepercent );
                    }
                }
                
                setdevdvar( @"hash_4827ebae75561872", 0 );
            }
            
            vehiclegod = getdvarint( @"scr_vehiclegod", 0 ) > 0;
            
            if ( level.vehiclegod != vehiclegod )
            {
                if ( vehiclegod )
                {
                    iprintln( "<dev string:x6cb>" );
                }
                else
                {
                    iprintln( "<dev string:x6dd>" );
                }
                
                level.vehiclegod = vehiclegod;
            }
            
            waitframe();
        }
    }

    // Namespace vehicle_damage
    // Params 2
    // Checksum 0xa40cd74e, Offset: 0xa9e6
    // Size: 0xa2, Type: dev
    function simulate_damage( vehicle, percent )
    {
        damagedata = spawnstruct();
        attacker = level.players[ 0 ];
        percent = min( percent, 100 ) / 100;
        damage = int( min( vehicle.health, ceil( vehicle.maxhealth * percent ) ) );
        thread function_818bb739ba11dd25();
        vehicle dodamage( damage, vehicle.origin, attacker, undefined, "<dev string:x6f0>" );
        thread function_dbf73fb86f62937f();
    }

    // Namespace vehicle_damage
    // Params 0
    // Checksum 0x2e89858, Offset: 0xaa90
    // Size: 0x49, Type: dev
    function function_818bb739ba11dd25()
    {
        level notify( "<dev string:x701>" );
        level endon( "<dev string:x701>" );
        
        if ( !isdefined( level.vehiclefriendlydamageold ) )
        {
            level.vehiclefriendlydamageold = istrue( level.vehiclefriendlydamage );
            level.vehiclefriendlydamage = 1;
        }
        
        waittillframeend();
        thread function_dbf73fb86f62937f();
    }

    // Namespace vehicle_damage
    // Params 0
    // Checksum 0x4ffd2eff, Offset: 0xaae1
    // Size: 0x36, Type: dev
    function function_dbf73fb86f62937f()
    {
        level notify( "<dev string:x701>" );
        
        if ( isdefined( level.vehiclefriendlydamageold ) )
        {
            level.vehiclefriendlydamage = level.vehiclefriendlydamageold;
            level.vehiclefriendlydamageold = undefined;
        }
    }

#/
