#using scripts\common\utility;
#using scripts\common\vehicle_code;
#using scripts\common\vehicle_lights;
#using scripts\common\vehicle_treadfx;
#using scripts\engine\utility;

#namespace vehicle_build;

// Namespace vehicle_build
// Params 4
// Checksum 0x6d691ce7, Offset: 0x2b9
// Size: 0xaf
function build_radiusdamage( offset, range, maxdamage, mindamage )
{
    if ( !isdefined( offset ) )
    {
        offset = ( 0, 0, 0 );
    }
    
    struct = spawnstruct();
    struct.offset = offset;
    struct.range = range;
    struct.maxdamage = maxdamage;
    struct.mindamage = mindamage;
    level.vehicle.templates.death_radiusdamage[ level.vtclassname ] = struct;
}

// Namespace vehicle_build
// Params 6
// Checksum 0x55458cff, Offset: 0x370
// Size: 0xdd
function build_rumble( rumble, scale, duration, radius, basetime, randomaditionaltime )
{
    if ( !isdefined( level.vehicle.templates.rumble ) )
    {
        level.vehicle.templates.rumble = [];
    }
    
    struct = build_quake( scale, duration, radius, basetime, randomaditionaltime );
    assert( isdefined( rumble ) );
    precacherumble( rumble );
    struct.rumble = rumble;
    level.vehicle.templates.rumble[ level.vtclassname ] = struct;
}

// Namespace vehicle_build
// Params 3
// Checksum 0x9d2fd538, Offset: 0x455
// Size: 0x9f
function build_deathquake( scale, duration, radius )
{
    classname = level.vtclassname;
    
    if ( !isdefined( level.vehicle.templates.death_earthquake ) )
    {
        level.vehicle.templates.death_earthquake = [];
    }
    
    level.vehicle.templates.death_earthquake[ classname ] = build_quake( scale, duration, radius );
}

// Namespace vehicle_build
// Params 5
// Checksum 0x254f64e6, Offset: 0x4fc
// Size: 0x94
function build_quake( scale, duration, radius, basetime, randomaditionaltime )
{
    struct = spawnstruct();
    struct.scale = scale;
    struct.duration = duration;
    struct.radius = radius;
    
    if ( isdefined( basetime ) )
    {
        struct.basetime = basetime;
    }
    
    if ( isdefined( randomaditionaltime ) )
    {
        struct.randomaditionaltime = randomaditionaltime;
    }
    
    return struct;
}

// Namespace vehicle_build
// Params 12
// Checksum 0x4c88d9f5, Offset: 0x599
// Size: 0x14e
function build_fx( effect, tag, sound, beffectlooping, delay, bsoundlooping, waitdelay, stayontag, notifystring, selfdeletedelay, remove_deathfx_entity_delay, attacker_velocity_lerp )
{
    if ( !isdefined( bsoundlooping ) )
    {
        bsoundlooping = 0;
    }
    
    if ( !isdefined( beffectlooping ) )
    {
        beffectlooping = 0;
    }
    
    if ( !isdefined( delay ) )
    {
        delay = 1;
    }
    
    struct = spawnstruct();
    struct.effect = utility::load_fx( effect );
    struct.tag = tag;
    struct.sound = sound;
    struct.bsoundlooping = bsoundlooping;
    struct.delay = delay;
    struct.waitdelay = waitdelay;
    struct.stayontag = stayontag;
    struct.notifystring = notifystring;
    struct.beffectlooping = beffectlooping;
    struct.selfdeletedelay = selfdeletedelay;
    struct.remove_deathfx_entity_delay = remove_deathfx_entity_delay;
    struct.attacker_velocity_lerp = attacker_velocity_lerp;
    return struct;
}

// Namespace vehicle_build
// Params 12
// Checksum 0xe7fabd80, Offset: 0x6f0
// Size: 0x134
function build_deathfx( effect, tag, sound, beffectlooping, delay, bsoundlooping, waitdelay, stayontag, notifystring, var_327652284cd8b192, remove_deathfx_entity_delay, attacker_velocity_lerp )
{
    assert( isdefined( effect ), "<dev string:x24>" );
    classname = level.vtclassname;
    
    if ( !isdefined( level.vehicle.templates.vehicle_death_fx[ classname ] ) )
    {
        level.vehicle.templates.vehicle_death_fx[ classname ] = [];
    }
    
    level.vehicle.templates.vehicle_death_fx[ classname ][ level.vehicle.templates.vehicle_death_fx[ classname ].size ] = build_fx( effect, tag, sound, beffectlooping, delay, bsoundlooping, waitdelay, stayontag, notifystring, var_327652284cd8b192, remove_deathfx_entity_delay, attacker_velocity_lerp );
}

// Namespace vehicle_build
// Params 11
// Checksum 0x2d304dfc, Offset: 0x82c
// Size: 0x12a
function build_rocket_deathfx( effect, tag, sound, beffectlooping, delay, bsoundlooping, waitdelay, stayontag, notifystring, var_327652284cd8b192, remove_deathfx_entity_delay )
{
    assert( isdefined( effect ), "<dev string:x24>" );
    classname = level.vtclassname;
    
    if ( !isdefined( level.vehicle.templates.vehicle_rocket_death_fx[ classname ] ) )
    {
        level.vehicle.templates.vehicle_rocket_death_fx[ classname ] = [];
    }
    
    level.vehicle.templates.vehicle_rocket_death_fx[ classname ][ level.vehicle.templates.vehicle_rocket_death_fx[ classname ].size ] = build_fx( effect, tag, sound, beffectlooping, delay, bsoundlooping, waitdelay, stayontag, notifystring, var_327652284cd8b192, remove_deathfx_entity_delay );
}

// Namespace vehicle_build
// Params 9
// Checksum 0x2e97ac31, Offset: 0x95e
// Size: 0xac
function function_7f52823cfdedd8db( effect, tag, sound, beffectlooping, delay, bsoundlooping, waitdelay, stayontag, notifystring )
{
    assert( isdefined( effect ), "<dev string:x24>" );
    classname = level.vtclassname;
    level.vehicle.templates.var_5cc6ecb6fb44af7c[ classname ] = build_fx( effect, tag, sound, beffectlooping, delay, bsoundlooping, waitdelay, stayontag, notifystring );
}

// Namespace vehicle_build
// Params 4
// Checksum 0xe5e921f1, Offset: 0xa12
// Size: 0x18f
function build_deathanimations( forwardanimation, rightanimation, backwardanimation, leftanimation )
{
    assert( isdefined( forwardanimation ), "<dev string:x8e>" + level.vtclassname );
    assert( isdefined( rightanimation ), "<dev string:xbb>" + level.vtclassname );
    assert( isdefined( backwardanimation ), "<dev string:xe6>" + level.vtclassname );
    assert( isdefined( leftanimation ), "<dev string:x114>" + level.vtclassname );
    classname = level.vtclassname;
    
    if ( !isdefined( level.vehicle.templates.deathanimations[ classname ] ) )
    {
        level.vehicle.templates.deathanimations[ classname ] = [];
    }
    
    level.vehicle.templates.deathanimations[ classname ][ "forward" ] = forwardanimation;
    level.vehicle.templates.deathanimations[ classname ][ "right" ] = rightanimation;
    level.vehicle.templates.deathanimations[ classname ][ "backward" ] = backwardanimation;
    level.vehicle.templates.deathanimations[ classname ][ "left" ] = leftanimation;
}

// Namespace vehicle_build
// Params 9
// Checksum 0xf361dfd4, Offset: 0xba9
// Size: 0x110
function build_turret( info, tag, model, defaultonmode, defaultdroppitch, defaultdropyaw, offset_tag, referencename, mainturretchild )
{
    classname = level.vtclassname;
    
    if ( !isdefined( level.vehicle.templates.mgturret[ classname ] ) )
    {
        level.vehicle.templates.mgturret[ classname ] = [];
    }
    
    struct = build_turret_struct( info, tag, model, defaultonmode, defaultdroppitch, defaultdropyaw, offset_tag, referencename, mainturretchild );
    level.vehicle.templates.mgturret[ classname ][ level.vehicle.templates.mgturret[ classname ].size ] = struct;
}

// Namespace vehicle_build
// Params 8
// Checksum 0xbf4dfcb0, Offset: 0xcc1
// Size: 0xce
function build_mainturret( info, tag, model, defaultonmode, defaultdroppitch, defaultdropyaw, offset_tag, referencename )
{
    classname = level.vtclassname;
    
    if ( isdefined( level.vehicle.templates.mainturret[ classname ] ) )
    {
        assertmsg( "<dev string:x13e>" );
    }
    
    struct = build_turret_struct( info, tag, model, defaultonmode, defaultdroppitch, defaultdropyaw, offset_tag, referencename );
    level.vehicle.templates.mainturret[ classname ] = struct;
}

// Namespace vehicle_build
// Params 9
// Checksum 0x1e7e0704, Offset: 0xd97
// Size: 0x103
function build_turret_struct( info, tag, model, defaultonmode, defaultdroppitch, defaultdropyaw, offset_tag, referencename, mainturretchild )
{
    precachemodel( model );
    precacheturret( info );
    struct = spawnstruct();
    struct.info = info;
    struct.tag = tag;
    struct.model = model;
    struct.defaultonmode = defaultonmode;
    struct.defaultdroppitch = defaultdroppitch;
    struct.defaultdropyaw = defaultdropyaw;
    
    if ( isdefined( offset_tag ) )
    {
        struct.offset_tag = offset_tag;
    }
    
    if ( isdefined( referencename ) )
    {
        struct.referencename = referencename;
    }
    
    if ( mainturretchild )
    {
        struct.mainturretchild = mainturretchild;
    }
    
    return struct;
}

// Namespace vehicle_build
// Params 6
// Checksum 0xbd31fc02, Offset: 0xea3
// Size: 0x180
function build_light( classname, name, tag, effect, group, delay )
{
    if ( !isdefined( level.vehicle.templates.vehicle_lights ) )
    {
        level.vehicle.templates.vehicle_lights = [];
    }
    
    if ( !isdefined( level.vehicle.templates.vehicle_lights_group_override ) )
    {
        level.vehicle.templates.vehicle_lights_group_override = [];
    }
    
    if ( isdefined( level.vehicle.templates.vehicle_lights_group_override[ group ] ) && !level.vtoverride )
    {
        return;
    }
    
    struct = spawnstruct();
    struct.name = name;
    struct.tag = tag;
    struct.delay = delay;
    struct.effect = utility::load_fx( effect );
    level.vehicle.templates.vehicle_lights[ classname ][ name ] = struct;
    vehicle_lights::group_light( classname, name, "all" );
    
    if ( isdefined( group ) )
    {
        vehicle_lights::group_light( classname, name, group );
    }
}

// Namespace vehicle_build
// Params 6
// Checksum 0x840ad429, Offset: 0x102b
// Size: 0x189
function function_b446834d4287bfdf( classname, name, part, group, delay, var_3b8d5cf93766831c )
{
    if ( !isdefined( level.vehicle.templates.vehicle_lights ) )
    {
        level.vehicle.templates.vehicle_lights = [];
    }
    
    if ( !isdefined( level.vehicle.templates.vehicle_lights_group_override ) )
    {
        level.vehicle.templates.vehicle_lights_group_override = [];
    }
    
    if ( isdefined( level.vehicle.templates.vehicle_lights_group_override[ group ] ) && !level.vtoverride )
    {
        return;
    }
    
    struct = spawnstruct();
    struct.name = name;
    struct.part = part;
    struct.delay = delay;
    struct.isscriptable = 1;
    level.vehicle.templates.vehicle_lights[ classname ][ name ] = struct;
    
    if ( !isdefined( var_3b8d5cf93766831c ) || var_3b8d5cf93766831c == 0 )
    {
        vehicle_lights::group_light( classname, name, "all" );
    }
    
    if ( isdefined( group ) )
    {
        vehicle_lights::group_light( classname, name, group );
    }
}

// Namespace vehicle_build
// Params 2
// Checksum 0x489eca58, Offset: 0x11bc
// Size: 0x8e
function build_hideparts( classname, parts_array )
{
    assert( isdefined( classname ) );
    assert( isdefined( parts_array ) );
    
    if ( !isdefined( level.vehicle.templates.hide_part_list ) )
    {
        level.vehicle.templates.hide_part_list = [];
    }
    
    level.vehicle.templates.hide_part_list[ classname ] = parts_array;
}

// Namespace vehicle_build
// Params 2
// Checksum 0xed9e417a, Offset: 0x1252
// Size: 0x60
function build_deathmodel( model, deathmodel )
{
    if ( model != level.vtmodel )
    {
        return;
    }
    
    if ( !isdefined( deathmodel ) )
    {
        deathmodel = model;
    }
    
    precachemodel( model );
    precachemodel( deathmodel );
    level.vehicle.templates.deathmodel[ model ] = deathmodel;
}

// Namespace vehicle_build
// Params 4
// Checksum 0x10ec9ee1, Offset: 0x12ba
// Size: 0xd6
function build_husk( model, huskmodel, type, var_d941668d6444bf8f )
{
    if ( model != level.vtmodel )
    {
        return;
    }
    
    assert( isdefined( huskmodel ), "<dev string:x167>" );
    assert( isdefined( type ), "<dev string:x18b>" );
    precachemodel( model );
    precachemodel( huskmodel );
    level.vehicle.templates.husk[ model ] = huskmodel;
    level.vehicle.templates.husktype[ model ] = type;
    
    if ( !isdefined( var_d941668d6444bf8f ) )
    {
        var_d941668d6444bf8f = 1;
    }
    
    level.vehicle.templates.var_bc8fe258d26d514[ model ] = var_d941668d6444bf8f;
}

// Namespace vehicle_build
// Params 4
// Checksum 0x958e97e8, Offset: 0x1398
// Size: 0xe6
function build_drive( forward, reverse, normalspeed, rate )
{
    if ( !isdefined( normalspeed ) )
    {
        normalspeed = 10;
    }
    
    level.vehicle.templates.driveidle[ level.vtmodel ] = forward;
    
    if ( isdefined( reverse ) )
    {
        level.vehicle.templates.driveidle_r[ level.vtmodel ] = reverse;
    }
    
    level.vehicle.templates.driveidle_normal_speed[ level.vtmodel ] = normalspeed;
    
    if ( isdefined( rate ) )
    {
        level.vehicle.templates.driveidle_animrate[ level.vtmodel ] = rate;
    }
}

// Namespace vehicle_build
// Params 4
// Checksum 0x814f4cd1, Offset: 0x1486
// Size: 0x4d1
function build_template( class, model, type, classname )
{
    vehicle_code::vehicle_setuplevelvariables();
    
    if ( !isdefined( type ) )
    {
        type = class;
    }
    
    assert( isdefined( classname ), "<dev string:x1ac>" );
    precachevehicle( type );
    level.vehicle.templates.type[ classname ] = type;
    level.vehicle.templates.team[ classname ] = "neutral";
    level.vehicle.templates.has_main_turret[ model ] = 0;
    level.vehicle.templates.main_turrets[ model ] = [];
    level.vtmodel = model;
    level.vttype = type;
    level.vtclassname = classname;
    level.vehicle.templates.model[ classname ] = model;
    
    switch ( class )
    {
        case #"hash_37e412543c51c9ec":
            build_life( 10000, 9500, 10500 );
            build_deathquake( 1, 1.6, 500 );
            level.vehicle.templates.explosivehits[ classname ] = 2;
            break;
        case #"hash_b626ccb5ac25b9c":
        case #"hash_68cb10ac5667e070":
            build_life( 9000, 8750, 9250 );
            build_deathquake( 1, 1.6, 500 );
            build_radiusdamage( ( 0, 0, 0 ), 500, 120, 20 );
            level.vehicle.templates.explosivehits[ classname ] = 2;
            break;
        case #"hash_e88686bc1d16bcea":
            build_life( 12000, 11750, 12250 );
            build_deathquake( 1, 1.6, 500 );
            build_radiusdamage( ( 0, 0, 0 ), 500, 120, 20 );
            level.vehicle.templates.explosivehits[ classname ] = 2;
            break;
        case #"hash_178f2685991a7482":
            build_life( 20000, 19000, 21000 );
            build_deathquake( 1, 1.6, 500 );
            build_radiusdamage( ( 0, 0, 0 ), 500, 120, 20 );
            level.vehicle.templates.explosivehits[ classname ] = 5;
            break;
        case #"hash_290903a1af40c196":
            build_life( 4000, 3750, 4250 );
            build_deathquake( 1, 1.6, 500 );
            build_radiusdamage( ( 0, 0, 0 ), 400, 120, 20 );
            level.vehicle.templates.explosivehits[ classname ] = 1;
            break;
        case #"hash_479ffef06a7cc84e":
            build_life( 10000, 9500, 10500 );
            build_deathquake( 1, 1.6, 500 );
            build_radiusdamage( ( 0, 0, 0 ), 400, 120, 20 );
            level.vehicle.templates.explosivehits[ classname ] = 2;
            break;
        case #"hash_c93466c10cc10ba":
        case #"hash_619324ebc667112c":
        case #"hash_79dd32c8d8093d05":
        case #"hash_895a2c6c51da0091":
            build_life( 2500, 2300, 2700 );
            build_deathquake( 1, 1.6, 500 );
            build_radiusdamage( ( 0, 0, 0 ), 400, 120, 20 );
            level.vehicle.templates.explosivehits[ classname ] = 0;
            break;
        case #"hash_1a86166c17e05dc1":
        case #"hash_7ec20b2ed0c1c55b":
        case #"hash_bd2b14a6c78f31a8":
        default:
            build_life( 2500, 2300, 2700 );
            build_deathquake( 1, 1.6, 500 );
            build_radiusdamage( ( 0, 0, 0 ), 400, 120, 20 );
            level.vehicle.templates.explosivehits[ classname ] = 1;
            break;
    }
}

// Namespace vehicle_build
// Params 2
// Checksum 0x7a01f827, Offset: 0x195f
// Size: 0x798, Type: bool
function function_ff2a7dd585b6ae27( vehicleref, vehicleclass )
{
    if ( isxhashasset( vehicleref ) )
    {
        bundle = getscriptbundle( vehicleref );
        classname = bundle.ref;
    }
    else
    {
        classname = vehicleref;
        bundlename = classname + "_sp";
        bundle = getscriptbundle( "vehiclebundle:" + bundlename );
    }
    
    if ( !isdefined( bundle ) )
    {
        return false;
    }
    
    if ( isdefined( bundle.compositemodel ) )
    {
        model = bundle.compositemodel;
    }
    else
    {
        model = bundle.model;
    }
    
    type = bundle.vehicle;
    
    if ( !( isdefined( model ) && isdefined( type ) ) )
    {
        return false;
    }
    
    build_template( vehicleclass, model, type, classname );
    
    if ( bundle.husk.hashusk )
    {
        if ( isdefined( bundle.husk.compositemodel ) )
        {
            huskmodel = bundle.husk.compositemodel;
        }
        else if ( isdefined( bundle.husk.model ) )
        {
            huskmodel = bundle.husk.model;
        }
        else
        {
            huskmodel = model;
        }
        
        if ( isdefined( bundle.husk.vehicle ) )
        {
            huskvehicle = bundle.husk.vehicle;
        }
        else
        {
            huskvehicle = type;
        }
        
        build_husk( model, huskmodel, huskvehicle, 0 );
    }
    
    if ( bundle.ai.supportsai )
    {
        assert( bundle.ai.vehicleanimalias, "<dev string:x1cb>" + getxhashsourcename( vehicleref ) );
        unload_groups = [];
        unload_groups[ "default" ] = [];
        unload_groups[ "all" ] = [];
        
        foreach ( index, seatdata in bundle.aiseats )
        {
            if ( isdefined( seatdata.vehicle_getinanim ) && isdefined( seatdata.vehicle_getinanim.id ) )
            {
                seatdata.vehicle_getinanim = seatdata.vehicle_getinanim.id;
            }
            else
            {
                seatdata.vehicle_getinanim = undefined;
            }
            
            if ( isdefined( seatdata.var_e19d02150c7f7b20 ) && isdefined( seatdata.var_e19d02150c7f7b20.id ) )
            {
                seatdata.vehicle_getinanim = seatdata.var_e19d02150c7f7b20.id;
            }
            else
            {
                seatdata.vehicle_getinanim = undefined;
            }
            
            if ( isdefined( seatdata.vehicle_getoutanim ) && isdefined( seatdata.vehicle_getoutanim.id ) )
            {
                seatdata.vehicle_getoutanim = seatdata.vehicle_getoutanim.id;
            }
            else
            {
                seatdata.vehicle_getoutanim = undefined;
            }
            
            if ( isdefined( seatdata.linkoffset ) )
            {
                x = seatdata.linkoffset.x ?? 0;
                y = seatdata.linkoffset.y ?? 0;
                z = seatdata.linkoffset.z ?? 0;
                
                if ( x != 0 || y != 0 || z != 0 )
                {
                    seatdata.linkoffset = ( x, y, z );
                    seatdata.linkangle = ( 0, 0, 0 );
                }
                else
                {
                    seatdata.linkoffset = undefined;
                }
            }
            
            if ( isdefined( bundle.aianimations ) && isdefined( bundle.aianimations[ index ] ) )
            {
                animationdata = bundle.aianimations[ index ];
                
                if ( isdefined( animationdata.idle ) && isdefined( animationdata.idle.id ) )
                {
                    seatdata.idle = animationdata.idle.id;
                }
                
                if ( isdefined( animationdata.getin ) && isdefined( animationdata.getin.id ) )
                {
                    seatdata.getin = animationdata.getin.id;
                }
                
                if ( isdefined( animationdata.getout ) && isdefined( animationdata.getout.id ) )
                {
                    seatdata.getout = animationdata.getout.id;
                }
                
                if ( isdefined( animationdata.death ) && isdefined( animationdata.death.id ) )
                {
                    seatdata.death = animationdata.death.id;
                }
                
                if ( isdefined( animationdata.ragdoll_fall_anim ) && isdefined( animationdata.ragdoll_fall_anim.id ) )
                {
                    seatdata.ragdoll_fall_anim = animationdata.ragdoll_fall_anim.id;
                }
                
                if ( animationdata.idle_anim )
                {
                    seatdata.idle_anim = animationdata.idle_anim;
                }
            }
            
            if ( !seatdata.do_not_unload )
            {
                unload_groups[ "default" ][ unload_groups[ "default" ].size ] = index;
                unload_groups[ "all" ][ unload_groups[ "all" ].size ] = index;
            }
        }
        
        foreach ( extraunloadgroup in bundle.unloadgroups )
        {
            unload_groups[ extraunloadgroup.name ] = [];
            
            foreach ( index, seatdata in extraunloadgroup.seats )
            {
                unload_groups[ extraunloadgroup.name ][ unload_groups[ extraunloadgroup.name ].size ] = seatdata.seatindex;
            }
        }
        
        bundle.unloadgroups = undefined;
        bundle.aianimations = undefined;
        assign_aianims( bundle.aiseats, bundle.ai.vehicleanimalias );
        function_51ee9c0f53cb8f70( unload_groups );
    }
    
    return true;
}

// Namespace vehicle_build
// Params 4
// Checksum 0xd60bba25, Offset: 0x2100
// Size: 0x7d
function build_treadfx( classname, type, fx, do_wash )
{
    if ( !utility::issp() )
    {
        return;
    }
    
    if ( isdefined( classname ) )
    {
        set_vehicle_effect( classname, type, fx );
        
        if ( do_wash )
        {
            set_vehicle_effect( classname, type, fx, "_bank" );
            set_vehicle_effect( classname, type, fx, "_bank_lg" );
        }
        
        return;
    }
    
    classname = level.vtclassname;
    vehicle_treadfx::main();
}

// Namespace vehicle_build
// Params 2
// Checksum 0xfcce58fa, Offset: 0x2185
// Size: 0x98
function build_all_treadfx( classname, fx )
{
    types = get_surface_types();
    
    foreach ( type in types )
    {
        set_vehicle_effect( classname, type );
    }
}

// Namespace vehicle_build
// Params 4
// Checksum 0x5d4c4d41, Offset: 0x2225
// Size: 0x11a
function set_vehicle_effect( classname, material, fx, suffix )
{
    if ( !isdefined( level.vehicle.templates.surface_effects ) )
    {
        level.vehicle.templates.surface_effects = [];
    }
    
    if ( isdefined( suffix ) )
    {
        material += suffix;
        fx += suffix;
    }
    
    if ( isdefined( fx ) )
    {
        level.vehicle.templates.surface_effects[ classname ][ material ] = utility::load_fx( fx );
        return;
    }
    
    if ( isdefined( level.vehicle.templates.surface_effects[ classname ] ) && isdefined( level.vehicle.templates.surface_effects[ classname ][ material ] ) )
    {
        level.vehicle.templates.surface_effects[ classname ][ material ] = undefined;
    }
}

// Namespace vehicle_build
// Params 0
// Checksum 0x83b7773b, Offset: 0x2347
// Size: 0x11a
function get_surface_types()
{
    return [ "brick", "bark", "carpet", "cloth", "concrete", "dirt", "flesh", "foliage", "glass", "grass", "gravel", "ice", "metal", "mud", "paper", "plaster", "rock", "sand", "snow", "water", "wood", "asphalt", "ceramic", "plastic", "rubber", "cushion", "fruit", "paintedmetal", "riotshield", "slush", "default" ];
}

// Namespace vehicle_build
// Params 1
// Checksum 0xb4c7571, Offset: 0x246a
// Size: 0x36
function build_team( team )
{
    level.vehicle.templates.team[ level.vtclassname ] = team;
}

// Namespace vehicle_build
// Params 1
// Checksum 0xb9e1380c, Offset: 0x24a8
// Size: 0x41
function build_bulletshield( bshield )
{
    assert( isdefined( bshield ) );
    level.vehicle.templates.bullet_shield[ level.vtclassname ] = bshield;
}

// Namespace vehicle_build
// Params 1
// Checksum 0x1dd329, Offset: 0x24f1
// Size: 0x41
function build_grenadeshield( bshield )
{
    assert( isdefined( bshield ) );
    level.vehicle.templates.grenade_shield[ level.vtclassname ] = bshield;
}

// Namespace vehicle_build
// Params 1
// Checksum 0xa86ebadb, Offset: 0x253a
// Size: 0x41
function function_e193637d7025cbb1( weaponarray )
{
    assert( isdefined( weaponarray ) );
    level.vehicle.templates.var_d499c951c21f6dbb[ level.vtclassname ] = weaponarray;
}

// Namespace vehicle_build
// Params 1
// Checksum 0x4044f0ed, Offset: 0x2583
// Size: 0x41
function function_b1b60a52dca51a1c( bshield )
{
    assert( isdefined( bshield ) );
    level.vehicle.templates.collision_shield[ level.vtclassname ] = bshield;
}

// Namespace vehicle_build
// Params 3
// Checksum 0x82560af9, Offset: 0x25cc
// Size: 0x124
function build_aianims( aithread, vehiclethread, vehicleanimalias )
{
    classname = level.vtclassname;
    level.vehicle.templates.aianims[ classname ] = [[ aithread ]]();
    
    if ( isdefined( level.func ) && isdefined( vehicleanimalias ) && isdefined( level.func[ "set_vehicle_anims_" + vehicleanimalias ] ) )
    {
        level.vehicle.templates.aianims[ classname ] = [[ level.func[ "set_vehicle_anims_" + vehicleanimalias ] ]]( level.vehicle.templates.aianims[ classname ] );
        return;
    }
    
    if ( isdefined( vehiclethread ) )
    {
        level.vehicle.templates.aianims[ classname ] = [[ vehiclethread ]]( level.vehicle.templates.aianims[ classname ] );
    }
}

// Namespace vehicle_build
// Params 2
// Checksum 0x7f9ee214, Offset: 0x26f8
// Size: 0xca
function assign_aianims( aithreadresult, vehicleanimalias )
{
    classname = level.vtclassname;
    level.vehicle.templates.aianims[ classname ] = aithreadresult;
    
    if ( isdefined( level.func ) && isdefined( vehicleanimalias ) && isdefined( level.func[ "set_vehicle_anims_" + vehicleanimalias ] ) )
    {
        level.vehicle.templates.aianims[ classname ] = [[ level.func[ "set_vehicle_anims_" + vehicleanimalias ] ]]( level.vehicle.templates.aianims[ classname ] );
    }
}

// Namespace vehicle_build
// Params 1
// Checksum 0x77013c6e, Offset: 0x27ca
// Size: 0x38
function build_attach_models( modelsthread )
{
    level.vehicle.templates.attachedmodels[ level.vtclassname ] = [[ modelsthread ]]();
}

// Namespace vehicle_build
// Params 1
// Checksum 0x1fb7f488, Offset: 0x280a
// Size: 0x36
function function_b36241dc6dbc0ab4( attachmodels )
{
    level.vehicle.templates.attachedmodels[ level.vtclassname ] = attachmodels;
}

// Namespace vehicle_build
// Params 1
// Checksum 0x828ed4ba, Offset: 0x2848
// Size: 0x38
function build_unload_groups( unloadgroupsthread )
{
    level.vehicle.templates.unloadgroups[ level.vtclassname ] = [[ unloadgroupsthread ]]();
}

// Namespace vehicle_build
// Params 1
// Checksum 0xea381ce4, Offset: 0x2888
// Size: 0x36
function function_51ee9c0f53cb8f70( unloadgroups )
{
    level.vehicle.templates.unloadgroups[ level.vtclassname ] = unloadgroups;
}

// Namespace vehicle_build
// Params 3
// Checksum 0xd661fd34, Offset: 0x28c6
// Size: 0x99
function build_life( health, minhealth, maxhealth )
{
    classname = level.vtclassname;
    level.vehicle.templates.life[ classname ] = health;
    level.vehicle.templates.life_range_low[ classname ] = minhealth;
    level.vehicle.templates.life_range_high[ classname ] = maxhealth;
}

// Namespace vehicle_build
// Params 1
// Checksum 0xe6c3bf25, Offset: 0x2967
// Size: 0x30
function build_localinit( init_thread )
{
    level.vehicleinitthread[ getxhashasset( level.vttype ) ][ level.vtclassname ] = init_thread;
}

// Namespace vehicle_build
// Params 1
// Checksum 0x62812619, Offset: 0x299f
// Size: 0x86
function build_is_helicopter( vehicle_type )
{
    if ( !isdefined( level.vehicle.templates.helicopter_list ) )
    {
        level.vehicle.templates.helicopter_list = [];
    }
    
    if ( !isdefined( vehicle_type ) )
    {
        vehicle_type = level.vttype;
    }
    
    level.vehicle.templates.helicopter_list[ getxhashasset( vehicle_type ) ] = 1;
}

// Namespace vehicle_build
// Params 1
// Checksum 0xa8d87efb, Offset: 0x2a2d
// Size: 0x86
function function_797c51bf258893ca( vehicle_type )
{
    if ( !isdefined( level.vehicle.templates.boat_list ) )
    {
        level.vehicle.templates.boat_list = [];
    }
    
    if ( !isdefined( vehicle_type ) )
    {
        vehicle_type = level.vttype;
    }
    
    level.vehicle.templates.boat_list[ getxhashasset( vehicle_type ) ] = 1;
}

// Namespace vehicle_build
// Params 1
// Checksum 0xc90000e9, Offset: 0x2abb
// Size: 0x86
function build_is_airplane( vehicle_type )
{
    if ( !isdefined( level.vehicle.templates.airplane_list ) )
    {
        level.vehicle.templates.airplane_list = [];
    }
    
    if ( !isdefined( vehicle_type ) )
    {
        vehicle_type = level.vttype;
    }
    
    level.vehicle.templates.airplane_list[ getxhashasset( vehicle_type ) ] = 1;
}

// Namespace vehicle_build
// Params 1
// Checksum 0xdda4549c, Offset: 0x2b49
// Size: 0x86
function function_48f5afa952de20dc( vehicle_type )
{
    if ( !isdefined( level.vehicle.templates.tank_list ) )
    {
        level.vehicle.templates.tank_list = [];
    }
    
    if ( !isdefined( vehicle_type ) )
    {
        vehicle_type = level.vttype;
    }
    
    level.vehicle.templates.tank_list[ getxhashasset( vehicle_type ) ] = 1;
}

// Namespace vehicle_build
// Params 1
// Checksum 0xab45cc9e, Offset: 0x2bd7
// Size: 0x77
function build_rider_death_func( func )
{
    if ( !isdefined( level.vehicle.templates.rider_death_func ) )
    {
        level.vehicle.templates.rider_death_func = [];
    }
    
    level.vehicle.templates.rider_death_func[ level.vtclassname ] = func;
}

// Namespace vehicle_build
// Params 3
// Checksum 0x814e2c2b, Offset: 0x2c56
// Size: 0x55
function build_iw9physics( classname, vehicletype, init_thread )
{
    level.vehicle.templates.iw9physics[ classname ] = vehicletype;
    level.vehicleinitthread[ getxhashasset( vehicletype ) ][ classname ] = init_thread;
}

// Namespace vehicle_build
// Params 2
// Checksum 0x786b2c95, Offset: 0x2cb3
// Size: 0x37
function build_hud( classname, index )
{
    level.vehicle.templates.hudindex[ classname ] = index;
}

// Namespace vehicle_build
// Params 3
// Checksum 0xa6079dba, Offset: 0x2cf2
// Size: 0x96
function build_dependentparts( classname, parentbone, childbones )
{
    if ( !isdefined( level.vehicle.templates.dependentparts ) )
    {
        level.vehicle.templates.dependentparts = [];
    }
    
    if ( !isarray( childbones ) )
    {
        childbones = [ childbones ];
    }
    
    level.vehicle.templates.dependentparts[ classname ][ parentbone ] = childbones;
}

