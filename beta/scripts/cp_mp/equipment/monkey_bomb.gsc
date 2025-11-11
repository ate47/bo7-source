#using script_13865ca76df87ea;
#using script_9880b9dc28bc25e;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\engine\utility;
#using scripts\mp\equipment;

#namespace monkey_bomb;

// Namespace monkey_bomb
// Params 0
// Checksum 0x71f81faa, Offset: 0x220
// Size: 0x57
function function_5e004c1e89636a33()
{
    level.var_643e99d5a18faa82 = [];
    level.var_546d1ce59a4bfdc5 = &function_40398cd5d47e09;
    level.var_ae144a0c2c5dfda6 = "monkey_bomb_mp";
    level.var_8c94fee7994936ba = "t10_zm_monkey_bomb_dance_01";
    level._effect[ "monkey_bomb_oob" ] = loadfxasset( "vfx_jup_ob_gameplay_zm_monkey_bomb_despawn" );
    level thread function_a0da125b7486ddcd();
}

// Namespace monkey_bomb
// Params 1
// Checksum 0x1ca9acda, Offset: 0x27f
// Size: 0x2fe
function function_bc972780a3f1aa90( grenade )
{
    ref = equipment_mp::getequipmentreffromweapon( grenade.weapon_object );
    grenade.tableinfo = equipment_mp::getequipmenttableinfo( ref );
    
    if ( !isdefined( grenade.tableinfo.bundle ) )
    {
        assertmsg( "<dev string:x24>" );
    }
    
    grenade endon( "death" );
    grenade hideallparts();
    grenade.angles = self.angles;
    monkey_model = spawn( "script_model", grenade.origin );
    monkey_model.angles = grenade.angles;
    blueprintindex = grenade.weapon_object.variantid;
    
    if ( !isdefined( blueprintindex ) )
    {
        blueprintindex = 0;
    }
    
    tableinfo = equipment_mp::getequipmenttableinfo( grenade.equipment_ref ?? "equip_monkey_bomb" );
    bundle = tableinfo.bundle;
    genericblueprintname = namespace_de7b719e85d98dcc::function_9800c005d17e1d42( bundle, blueprintindex );
    
    if ( isdefined( genericblueprintname ) )
    {
        monkey_model function_94d8556593f6f4ff( genericblueprintname, #"hash_13239327fd97153e" );
    }
    
    monkey_model.grenade = grenade;
    monkey_model.team = self.team;
    monkey_model.owner = self;
    monkey_model.attractor = zombie_attractor_manager::add_attractor( monkey_model, 2, 2000, 0, undefined, &function_3f513fdf297a8d62, 0, undefined, 1 );
    monkey_model.attractor.var_9bc09bc79f28a18e = 1;
    monkey_model.equipmentref = grenade.equipment_ref ?? "equip_monkey_bomb";
    grenade.monkey_model = monkey_model;
    grenade.monkey_model linkto( grenade );
    grenade.monkey_model.var_5d7d37d12e89dcc9 = self;
    grenade.monkey_model utility::function_7c10ea82c1e305b8( "sound", "throw" );
    grenade thread function_eb91977c78c3c6cf( monkey_model, monkey_model.attractor );
    level thread function_dbab8bc7d2a74c3f( grenade );
    grenade waittill( "missile_stuck", stuckto );
    grenade.monkey_model utility::function_7c10ea82c1e305b8( "sound", "land" );
    
    if ( !isdefined( grenade ) && isdefined( monkey_model ) )
    {
        monkey_model delete();
    }
    
    if ( grenade.var_5e5d88960cbc785a )
    {
        return;
    }
    
    if ( isdefined( grenade ) && isdefined( grenade.monkey_model ) )
    {
        grenade.monkey_model.var_25346c448bb89a37 = getclosestpointonnavmesh( grenade.monkey_model.origin, self );
        level.var_643e99d5a18faa82[ level.var_643e99d5a18faa82.size ] = grenade.monkey_model;
    }
}

// Namespace monkey_bomb
// Params 1
// Checksum 0xcb8e8a26, Offset: 0x585
// Size: 0x8f
function function_dbab8bc7d2a74c3f( grenade )
{
    grenade endon( "missile_stuck" );
    msg = grenade utility::waittill_any_timeout( 10, "death" );
    
    if ( msg == "death" )
    {
        if ( isdefined( grenade.monkey_model ) )
        {
            if ( isdefined( grenade.monkey_model.attractor ) )
            {
                zombie_attractor_manager::remove_attractor( grenade.monkey_model.attractor );
            }
            
            grenade.monkey_model delete();
        }
    }
}

// Namespace monkey_bomb
// Params 2
// Checksum 0x33420f62, Offset: 0x61c
// Size: 0xb6
function function_3f513fdf297a8d62( attractor, zombie )
{
    if ( zombie.var_e85287a13ff33eba )
    {
        return 0;
    }
    
    if ( !val::get( "allow_secondary_attack_damage" ) )
    {
        return 0;
    }
    
    if ( zombie.subclass == "zombie_hellhound" )
    {
        return 0;
    }
    
    if ( zombie.var_840153567385cc6b )
    {
        return 0;
    }
    
    if ( zombie.aicategory == "normal" || zombie.aicategory == "special" )
    {
        if ( zombie.team != attractor.source.team )
        {
            return 1;
        }
        else
        {
            return 0;
        }
        
        return;
    }
    
    return 0;
}

// Namespace monkey_bomb
// Params 2
// Checksum 0xcc586655, Offset: 0x6da
// Size: 0x8a
function function_eb91977c78c3c6cf( monkey_model, attractor )
{
    self endon( "missile_stuck" );
    level endon( "game_ended" );
    childthread function_9c709124510af0c8();
    msg = utility::waittill_any_timeout( 13, "monkey_bomb_throw_into_teleport_back_area", "missile_water_impact" );
    
    if ( msg == "missile_water_impact" )
    {
        wait 1;
    }
    
    if ( isdefined( attractor ) )
    {
        zombie_attractor_manager::remove_attractor( attractor );
    }
    
    if ( !isdefined( self ) )
    {
        if ( isdefined( monkey_model ) )
        {
            monkey_model delete();
        }
        
        return;
    }
    
    level thread grenade_stolen_by_sam( self, undefined );
}

// Namespace monkey_bomb
// Params 1, eflags: 0x4
// Checksum 0x679973d3, Offset: 0x76c
// Size: 0x8f, Type: bool
function private function_aa2c8c826e715283( player )
{
    if ( !isplayer( player ) )
    {
        return false;
    }
    
    if ( utility::issharedfuncdefined( #"game", #"isCommonItemEnabled" ) )
    {
        if ( !utility::callsharedfunc( #"game", #"isCommonItemEnabled" ) )
        {
            return false;
        }
        
        if ( !( utility::issharedfuncdefined( #"game", #"hash_6a1940cb87219089" ) && utility::issharedfuncdefined( #"game", #"getItemBundleNameFromRef" ) ) )
        {
            return false;
        }
        
        return true;
    }
    
    return false;
}

// Namespace monkey_bomb
// Params 0
// Checksum 0x379690bf, Offset: 0x804
// Size: 0xf1
function function_9c709124510af0c8()
{
    self endon( "death" );
    level endon( "game_ended" );
    var_a7c0d79127c3249a = [];
    
    if ( isarray( level.var_61a459c161edc4d2 ) )
    {
        var_a7c0d79127c3249a = level.var_61a459c161edc4d2;
    }
    
    if ( isarray( level.var_dcdf2aa7cb419ad4 ) )
    {
        var_a7c0d79127c3249a = arraycombine( var_a7c0d79127c3249a, level.var_dcdf2aa7cb419ad4 );
    }
    
    if ( var_a7c0d79127c3249a.size > 0 )
    {
        while ( true )
        {
            foreach ( var_bdbcf4906661328d in var_a7c0d79127c3249a )
            {
                if ( isdefined( self ) && self istouching( var_bdbcf4906661328d ) )
                {
                    self notify( "monkey_bomb_throw_into_teleport_back_area" );
                    return;
                }
            }
            
            wait 0.05;
        }
    }
}

// Namespace monkey_bomb
// Params 2
// Checksum 0x94593e02, Offset: 0x8fd
// Size: 0x39d
function grenade_stolen_by_sam( grenade, e_actor )
{
    if ( !isdefined( grenade.monkey_model ) )
    {
        return;
    }
    
    if ( isdefined( level.var_d49f16537ce71aee ) )
    {
        var_aae4462ed3d72600 = [[ level.var_d49f16537ce71aee ]]( grenade.monkey_model );
    }
    else
    {
        var_aae4462ed3d72600 = 1;
    }
    
    grenade.var_5e5d88960cbc785a = 1;
    monkey_model = grenade.monkey_model;
    direction = grenade.monkey_model.origin;
    direction = ( direction[ 1 ], direction[ 0 ], 0 );
    
    if ( direction[ 1 ] < 0 || direction[ 0 ] > 0 && direction[ 1 ] > 0 )
    {
        direction = ( direction[ 0 ], direction[ 1 ] * -1, 0 );
    }
    else if ( direction[ 0 ] < 0 )
    {
        direction = ( direction[ 0 ] * -1, direction[ 1 ], 0 );
    }
    
    grenade.monkey_model utility::function_7c10ea82c1e305b8( "sound", "stolen" );
    grenade.monkey_model utility::function_7c10ea82c1e305b8( "vfx", "stolen" );
    grenade.monkey_model unlink();
    waitframe();
    
    if ( !isdefined( grenade ) )
    {
        if ( isdefined( monkey_model ) )
        {
            monkey_model delete();
        }
        
        return;
    }
    
    if ( !isdefined( grenade.monkey_model ) )
    {
        return;
    }
    
    total_time = 1;
    grenade.monkey_model vibrate( direction, 1.5, 2.5, total_time );
    
    if ( grenade.monkey_model.angles[ 2 ] != 0 )
    {
        grenade.monkey_model rotateroll( 0 - grenade.monkey_model.angles[ 2 ], 0.25 );
        total_time -= 0.25;
        wait 0.25;
        
        if ( !isdefined( grenade ) )
        {
            if ( isdefined( monkey_model ) )
            {
                monkey_model delete();
            }
            
            return;
        }
    }
    
    if ( var_aae4462ed3d72600 )
    {
        grenade.monkey_model movez( 60, total_time, 0.25, 0.25 );
    }
    
    wait total_time;
    
    if ( !isdefined( grenade ) )
    {
        if ( isdefined( monkey_model ) )
        {
            monkey_model delete();
        }
        
        return;
    }
    
    if ( isdefined( grenade.monkey_model ) )
    {
        grenade.monkey_model delete();
    }
    
    if ( var_aae4462ed3d72600 )
    {
        if ( isdefined( grenade.equipmentref ) && isdefined( level.var_6f5cbfe6aee65f4 ) && isdefined( grenade.owner ) )
        {
            grenade.owner [[ level.var_6f5cbfe6aee65f4 ]]( grenade.equipmentref, "secondary" );
        }
        else if ( function_aa2c8c826e715283( grenade.owner ) )
        {
            itembundlename = utility::callsharedfunc( #"game", #"getItemBundleNameFromRef", grenade.equipmentref );
            
            if ( !isdefined( itembundlename ) )
            {
                return;
            }
            
            itembundle = getscriptbundle( itembundlename );
            fakeitem = spawnstruct();
            fakeitem.count = 1;
            fakeitem.type = itembundle.scriptable;
            grenade.owner utility::callsharedfunc( #"game", #"hash_6a1940cb87219089", fakeitem, 0 );
        }
    }
    
    if ( isdefined( e_actor ) )
    {
        e_actor delete();
    }
    
    if ( isdefined( grenade ) )
    {
        if ( isdefined( grenade.damagearea ) )
        {
            grenade.damagearea delete();
        }
        
        grenade delete();
    }
}

// Namespace monkey_bomb
// Params 0
// Checksum 0x952c0aee, Offset: 0xca2
// Size: 0x10a
function function_a0da125b7486ddcd()
{
    level endon( "game_ended" );
    
    while ( true )
    {
        foreach ( monkey_model in level.var_643e99d5a18faa82 )
        {
            if ( !isdefined( monkey_model ) || monkey_model.dancing )
            {
                continue;
            }
            
            if ( !isdefined( monkey_model.grenade ) )
            {
                if ( isdefined( monkey_model.attractor ) )
                {
                    zombie_attractor_manager::remove_attractor( monkey_model.attractor );
                }
                
                monkey_model utility::function_7c10ea82c1e305b8( "sound", "off" );
                monkey_model delete();
                continue;
            }
            
            monkey_model thread function_777dbc018301fea2();
            waitframe();
        }
        
        level.var_643e99d5a18faa82 = function_5713d46873b29625( level.var_643e99d5a18faa82 );
        waitframe();
    }
}

// Namespace monkey_bomb
// Params 1
// Checksum 0xd7c3c7a6, Offset: 0xdb4
// Size: 0x3f, Type: bool
function function_40398cd5d47e09( checkloc )
{
    if ( !isdefined( self.var_25346c448bb89a37 ) )
    {
        return false;
    }
    
    squaredist = distancesquared( checkloc, self.var_25346c448bb89a37 );
    return squaredist <= 40000;
}

// Namespace monkey_bomb
// Params 0
// Checksum 0xa05f3c95, Offset: 0xdfc
// Size: 0x157
function function_777dbc018301fea2()
{
    self endon( "death" );
    waitframe();
    self.dancing = 1;
    
    if ( isdefined( level.var_546d1ce59a4bfdc5 ) && ![[ level.var_546d1ce59a4bfdc5 ]]( self.origin ) )
    {
        if ( isdefined( self.attractor ) )
        {
            zombie_attractor_manager::remove_attractor( self.attractor );
        }
        
        level thread grenade_stolen_by_sam( self.grenade, self );
        return;
    }
    
    thread function_f6ff25e05fd68bd1();
    utility::function_7c10ea82c1e305b8( "sound", "song" );
    self scriptmodelplayanim( isstring( level.var_8c94fee7994936ba ) ? level.var_8c94fee7994936ba : "t10_zm_monkey_bomb_dance_01" );
    bundle = self.grenade.tableinfo.bundle;
    totalduration = bundle.var_a0d613b6715c2a1c ?? 8.5;
    totalduration = getdvarfloat( @"hash_20d07ece0bd25ae4", totalduration );
    self.var_326a38a82a7f06c8 = gettime();
    self.var_ac326b52defc040f = self.var_326a38a82a7f06c8 + utility::function_4b74c15943231980( totalduration );
    
    while ( gettime() < self.var_ac326b52defc040f )
    {
        if ( !isdefined( self.grenade ) )
        {
            break;
        }
        
        waitframe();
    }
    
    function_4f1c858ec813ec2();
}

// Namespace monkey_bomb
// Params 0
// Checksum 0xee087e16, Offset: 0xf5b
// Size: 0x21
function function_f6ff25e05fd68bd1()
{
    self endon( "death" );
    wait 0.15;
    utility::function_7c10ea82c1e305b8( "vfx", "active" );
}

// Namespace monkey_bomb
// Params 0
// Checksum 0x16c4e5a2, Offset: 0xf84
// Size: 0x27
function function_4f1c858ec813ec2()
{
    if ( isdefined( self.grenade ) )
    {
        self.grenade detonate();
    }
    
    self.dancing = 0;
}

