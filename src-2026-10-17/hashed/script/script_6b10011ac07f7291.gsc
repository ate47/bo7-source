#using script_2399696a9d953451;
#using script_50689c1d9e3ef00a;
#using script_58e3e625f502a4f;
#using script_636bd827a012af12;
#using script_6ed201c5af7d130e;
#using script_7129baf8ee832ed2;
#using scripts\common\ai;
#using scripts\common\callbacks;
#using scripts\common\hints;
#using scripts\common\scripted_widgets;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\mp\agents\agent_utils;
#using scripts\mp\ai_sentry_turret;
#using scripts\mp\damagefeedback;
#using scripts\mp\gametypes\ob;
#using scripts\mp\hostmigration;
#using scripts\mp\mp_agent_damage;
#using scripts\mp\objidpoolmanager;
#using scripts\mp\weapons;

#namespace sat_libra_mech_turret;

// Namespace sat_libra_mech_turret
// Params 5
// Checksum 0x54a7649c, Offset: 0x6b6
// Size: 0xcc
function spawn_mech( origin, angles, leftweapon, rightweapon, canusemortar )
{
    if ( ob::nightmare() )
    {
        mech = dospawnaitype( "sat_libra_mech", origin, angles, 1, 0, 1, 0, "team_two_hundred" );
        mech setup_mech( leftweapon, rightweapon, canusemortar );
        mech val::set( "mech_vals", "ignoreme", 1 );
        mech.kfe_ignore = 1;
    }
    else
    {
        mech = dospawnaitype( "sat_libra_mech", origin, angles, 1, 0, 1, 0, "team_hundred_ninety_four" );
        mech setup_mech( leftweapon, rightweapon, canusemortar );
        mech val::set( "mech_vals", "ignoreme", 1 );
    }
    
    return mech;
}

// Namespace sat_libra_mech_turret
// Params 3
// Checksum 0xc5a721c2, Offset: 0x78b
// Size: 0x4f2
function setup_mech( leftweapon, rightweapon, canusemortar )
{
    mech = self;
    precache_fx();
    weapons::function_ef0cb557b1a93af9( self );
    mech.var_46f7fffc626f2e7b = 1;
    mech.var_d1b3f29a9c852576 = ( 0, 0, 120 );
    mech.headyaw = 0;
    mech.ignoreall = 1;
    mech.fixednode = 1;
    mech.goalradius = 256;
    mech.health = 15000;
    
    if ( level.players.size >= 3 )
    {
        mech.health *= 2;
    }
    
    if ( ob::nightmare() )
    {
        if ( level.players.size )
        {
            mech.health = 1800000 * level.players.size;
        }
        else
        {
            mech.health = 1800000;
        }
    }
    
    mech.maxhealth = mech.health;
    mech.var_2ffc71aa3aa17005 = 3000;
    mech.shield_on = 0;
    mech.var_b73c033f1d73bd80 = 1;
    mech.var_c3c4d711e69d5ab9 = 1;
    origin = mech gettagorigin( "tag_turret_attach" );
    angles = mech gettagangles( "tag_turret_attach" );
    
    if ( !ob::nightmare() )
    {
        self.agent_damage_callback = &on_damage_callback;
    }
    else
    {
        self.agent_damage_callback = &function_786772134de85587;
    }
    
    mechentnum = self getentitynumber();
    turretspawn = spawnstruct();
    turretspawn.origin = self.origin;
    turretspawn.angles = self.angles;
    self.aicategory = "boss";
    
    if ( rightweapon === "rocket" )
    {
        turretspawn.weaponinfo = "sat_mech_turret_rocket";
        rightarm = turret_spawn( turretspawn, mechentnum );
        rightarm.rocket = 1;
    }
    else if ( rightweapon === "laser" )
    {
        turretspawn.weaponinfo = "sat_mech_turret_laser";
        rightarm = turret_spawn( turretspawn, mechentnum );
        rightarm.laser = 1;
    }
    else
    {
        turretspawn.weaponinfo = "sat_mech_turret";
        rightarm = turret_spawn( turretspawn, mechentnum );
    }
    
    rightarm linkto( self, "tag_gunner2_flash", ( 0, 3, 0 ), ( 0, 0, 0 ) );
    rightarm startarm( mech );
    
    if ( leftweapon === "rocket" )
    {
        turretspawn.weaponinfo = "sat_mech_turret_rocket";
        leftarm = turret_spawn( turretspawn, mechentnum );
        leftarm.rocket = 1;
    }
    else if ( leftweapon === "laser" )
    {
        turretspawn.weaponinfo = "sat_mech_turret_laser";
        leftarm = turret_spawn( turretspawn, mechentnum );
        leftarm.laser = 1;
    }
    else
    {
        turretspawn.weaponinfo = "sat_mech_turret";
        leftarm = turret_spawn( turretspawn, mechentnum );
    }
    
    leftarm linkto( self, "tag_gunner1_flash1", ( 0, 3, 0 ), ( 0, 0, 0 ) );
    leftarm startarm( mech );
    mech.rightarm = rightarm;
    mech.leftarm = leftarm;
    mech thread targetfinder();
    mech thread rotatehead();
    mech.mortarenabled = istrue( canusemortar );
    toma_strike::init_toma_strike_params( 1 );
    mech.grenades = [];
    mech.mortarsinair = 0;
    mech.var_86ae674f9ec97d64 = [];
    level.boss_struct = {};
    
    if ( !ob::nightmare() )
    {
        level.boss_struct.health = mech.health;
        level.boss_struct.maxhealth = mech.maxhealth;
        mech zombie_boss_healthbar::function_f50a10314e72caa1();
        mech zombie_boss_healthbar::init_zombie_boss_healthbar();
    }
    else if ( isdefined( level.boss_struct.health ) )
    {
    }
    else
    {
        level.boss_struct.health = mech.health;
        level.boss_struct.maxhealth = mech.maxhealth;
        level.boss_struct zombie_boss_healthbar::function_f50a10314e72caa1();
        level.boss_struct zombie_boss_healthbar::init_zombie_boss_healthbar();
    }
    
    mech namespace_2bfee0fa87a9007a::init_mech_beam_attack();
    return mech;
}

// Namespace sat_libra_mech_turret
// Params 0
// Checksum 0x7050164f, Offset: 0xc86
// Size: 0x11f
function showhealthbar()
{
    if ( !ob::nightmare() )
    {
        foreach ( player in level.players )
        {
            player ob_story_mission_utils::function_16e0adef86e5d052( "ob_boss_libra_mech", level.boss_struct );
        }
    }
    else
    {
        foreach ( player in level.players )
        {
            player ob_story_mission_utils::function_16e0adef86e5d052( "ob_boss_nm_mech", level.boss_struct );
        }
    }
    
    utility::ent_flag_set( "boss_bar_initialized" );
}

// Namespace sat_libra_mech_turret
// Params 1
// Checksum 0x1c3fe5a, Offset: 0xdad
// Size: 0x17
function function_dcdb69dc09717b57( damage_amt )
{
    self.var_dcdb69dc09717b57 = damage_amt;
}

// Namespace sat_libra_mech_turret
// Params 2
// Checksum 0x4af314db, Offset: 0xdcc
// Size: 0x2b
function set_health_threshold_notify( pct_health, notify_str )
{
    self.health_pct_threshold = pct_health;
    self.var_48a1ce658bbc7378 = notify_str;
}

// Namespace sat_libra_mech_turret
// Params 1, eflags: 0x4
// Checksum 0x18a35b28, Offset: 0xdff
// Size: 0x45
function private startarm( mech )
{
    if ( self.laser )
    {
        thread lasertargeting( mech );
        return;
    }
    
    if ( self.rocket )
    {
        thread rockettargeting( mech );
        return;
    }
    
    thread guntargeting( mech );
}

// Namespace sat_libra_mech_turret
// Params 14, eflags: 0x4
// Checksum 0x3ff1fff3, Offset: 0xe4c
// Size: 0x227
function private on_damage_callback( einflictor, attacker, idamage, idflags, damagetype, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, objweapon, poisedamage )
{
    damage = 0;
    
    if ( !self.invulnerable && self.health > 1 )
    {
        if ( isplayer( attacker ) )
        {
            explosivedamage = damagetype == "MOD_EXPLOSIVE" || damagetype == "MOD_PROJECTILE" || damagetype == "MOD_PROJECTILE_SPLASH" || damagetype == "MOD_GRENADE_SPLASH" || damagetype == "MOD_IMPACT" || damagetype == "MOD_GRENADE" || damagetype == "MOD_SPECIAL_KILL";
            damage = idamage;
            
            if ( isdefined( self.var_dcdb69dc09717b57 ) )
            {
                if ( !explosivedamage )
                {
                    damage = self.var_dcdb69dc09717b57;
                    attacker thread function_c752a8feda203741();
                }
                else
                {
                    damage = function_86b186b259920cfb( idamage, damagetype, sweapon.basename );
                }
            }
        }
    }
    
    clamp_health = 1;
    
    if ( isdefined( self.health_pct_threshold ) )
    {
        clamp_health = int( self.maxhealth * self.health_pct_threshold );
    }
    
    if ( self.health - damage < clamp_health )
    {
        damage = self.health - clamp_health;
    }
    
    if ( damage > 0 && mp_agent_damage::function_e257c518b45c4dbb() )
    {
        numbersorigin = self.origin + ( 0, 0, 180 );
        mp_agent_damage::function_eb8ba16055d6da7c( attacker, self, shitloc, damagetype, sweapon, damage, numbersorigin, 0, undefined, 0, 0 );
    }
    
    if ( damage >= 0.05 * self.maxhealth )
    {
        set_focus_target( attacker );
        thread function_97ac63bbb364f618( attacker );
    }
    
    update_health_state( self.health - damage );
    return damage;
}

// Namespace sat_libra_mech_turret
// Params 1, eflags: 0x4
// Checksum 0x83c3658d, Offset: 0x107c
// Size: 0xc6
function private update_health_state( newhealth )
{
    mech = self;
    
    if ( isdefined( mech.health_pct_threshold ) && isdefined( mech.var_48a1ce658bbc7378 ) )
    {
        notify_health = int( mech.maxhealth * mech.health_pct_threshold );
        
        if ( newhealth <= notify_health )
        {
            mech notify( mech.var_48a1ce658bbc7378 );
        }
    }
    
    if ( newhealth > 1 )
    {
        health_pct = newhealth / mech.maxhealth;
        mech notify( #"health_pct", health_pct );
    }
    else if ( !mech.disabled )
    {
        mech thread mech_disabled();
    }
    
    mech update_healthbar( newhealth );
}

// Namespace sat_libra_mech_turret
// Params 1, eflags: 0x4
// Checksum 0xf7c15905, Offset: 0x114a
// Size: 0x55
function private update_healthbar( newhealth )
{
    level.boss_struct.health = newhealth;
    level.boss_struct.maxhealth = self.maxhealth;
    level callback::callback( "on_boss_progress_updated", level.boss_struct );
}

// Namespace sat_libra_mech_turret
// Params 1
// Checksum 0x7e62eeaa, Offset: 0x11a7
// Size: 0x37
function set_focus_target( target )
{
    if ( is_valid_target( target ) )
    {
        self.focustarget = target;
        self notify( #"focus_target_found" );
        thread function_f1a498f50248fd3a( target );
    }
}

// Namespace sat_libra_mech_turret
// Params 0, eflags: 0x4
// Checksum 0x61abd548, Offset: 0x11e6
// Size: 0xc
function private focus_target_lost()
{
    self.focustarget = undefined;
}

// Namespace sat_libra_mech_turret
// Params 1, eflags: 0xc
// Checksum 0xad02d1f8, Offset: 0x11fa
// Size: 0x8a
function private function_f1a498f50248fd3a( target )
{
    self notify( #"hash_91501c7bdfee0a4" );
    self endon( #"hash_91501c7bdfee0a4" );
    self endon( #"death" );
    self endon( #"disabled" );
    endtime = gettime() + utility::function_4b74c15943231980( 3 );
    
    while ( endtime > gettime() && is_valid_target( target ) )
    {
        wait 0.5;
    }
    
    if ( self.focustarget === target )
    {
        focus_target_lost();
    }
}

// Namespace sat_libra_mech_turret
// Params 1
// Checksum 0x648cc147, Offset: 0x128c
// Size: 0x1e
function immune_feedback_complete( player )
{
    if ( player )
    {
        player.showingimmune = 0;
    }
}

// Namespace sat_libra_mech_turret
// Params 0
// Checksum 0x9b31bd50, Offset: 0x12b2
// Size: 0x56
function function_c752a8feda203741()
{
    if ( !self.showingimmune )
    {
        self.showingimmune = 1;
        hints::hint_add_simple( "bullets_cant_damage", &"sat_wc/mech_damage_immune", 2 );
        thread utility::delaythreadendon( 5, [ "death_or_disconnect", "immune_feedback_complete" ], &immune_feedback_complete, self );
    }
}

// Namespace sat_libra_mech_turret
// Params 0
// Checksum 0x40fbb7a2, Offset: 0x1310
// Size: 0x17d
function mech_disabled()
{
    mech = self;
    mech.mortarenabled = 0;
    mech.leftarm notify( #"stop" );
    mech.rightarm notify( #"stop" );
    mech notify( #"hash_5588a9fdca62f361" );
    weapons::function_d5eafafe8f6a97bf( self );
    mech.leftarm stopbarrelspin();
    mech function_51103bbed4297d06( 0 );
    mech mech_invulnerable( 1 );
    mech.disabled = 1;
    mech utility::ent_flag_set( "disabled" );
    mech notify( #"disabled" );
    
    if ( !mech.disabledstate )
    {
        mech.disabledstate = 1;
    }
    
    mech asmsetstate( "libra_mech", "disabled_0" + mech.disabledstate );
    
    if ( !ob::nightmare() )
    {
        foreach ( player in level.players )
        {
            player ob_story_mission_utils::function_5a707116af438c92();
        }
    }
    
    playfxontag( utility::getfx( "vfx_sat_wc_libra_mech_stunned_upper" ), mech, "tag_turret_attach" );
}

// Namespace sat_libra_mech_turret
// Params 0
// Checksum 0x93991049, Offset: 0x1495
// Size: 0x31
function mech_die()
{
    self notify( #"death" );
    self.rightarm delete();
    self.leftarm delete();
    agent_utils::despawnagent();
}

// Namespace sat_libra_mech_turret
// Params 0
// Checksum 0xa09764a2, Offset: 0x14ce
// Size: 0x49
function function_c5e63fdb63bf7f14()
{
    self notify( #"death" );
    
    if ( self.rightarm )
    {
        self.rightarm delete();
    }
    
    if ( self.leftarm )
    {
        self.leftarm delete();
    }
    
    agent_utils::despawnagent();
}

// Namespace sat_libra_mech_turret
// Params 0
// Checksum 0xd0b0cdee, Offset: 0x151f
// Size: 0x26
function disable_left_arm()
{
    self.leftarm turretfiredisable();
    self.leftarm.disabled = 1;
}

// Namespace sat_libra_mech_turret
// Params 0
// Checksum 0xdde2379e, Offset: 0x154d
// Size: 0x23
function enable_left_arm()
{
    self.leftarm turretfireenable();
    self.leftarm.disabled = undefined;
}

// Namespace sat_libra_mech_turret
// Params 0
// Checksum 0x9e5ed76b, Offset: 0x1578
// Size: 0x26
function disable_right_arm()
{
    self.rightarm turretfiredisable();
    self.rightarm.disabled = 1;
}

// Namespace sat_libra_mech_turret
// Params 0
// Checksum 0xeb5eb5d8, Offset: 0x15a6
// Size: 0x23
function enable_right_arm()
{
    self.rightarm turretfireenable();
    self.rightarm.disabled = undefined;
}

// Namespace sat_libra_mech_turret
// Params 0
// Checksum 0xfe606463, Offset: 0x15d1
// Size: 0xc
function disable_mortar()
{
    self.mortarenabled = undefined;
}

// Namespace sat_libra_mech_turret
// Params 0
// Checksum 0xbdd30ec7, Offset: 0x15e5
// Size: 0xd
function enable_mortar()
{
    self.mortarenabled = 1;
}

// Namespace sat_libra_mech_turret
// Params 1, eflags: 0x4
// Checksum 0xae477ea, Offset: 0x15fa
// Size: 0x18e
function private function_97ac63bbb364f618( target )
{
    self endon( #"death" );
    mortar_offset = [ ( 14, -44, 60 ), ( 14, 44, 60 ) ];
    index = 0;
    targetpos = target.origin;
    
    if ( distance2dsquared( targetpos, self.origin ) < 44100 )
    {
        targetpos = self.origin + vectornormalize( targetpos - self.origin ) * 210;
    }
    
    wait 0.3;
    marker = marker( targetpos );
    angle = randomfloat( 360 );
    
    for ( i = 0; i < 3 ; i++ )
    {
        headorigin = self gettagorigin( "tag_turret_attach" );
        headangles = ( 0, self.headyaw + 90, 0 );
        var_9f8f66c22e8e887c = coordtransform( mortar_offset[ index ], headorigin, headangles );
        index = ( index + 1 ) % 2;
        playfx( level._effect[ "mech_mortar_launch" ], var_9f8f66c22e8e887c );
        thread launchmortar( targetpos, angle, marker );
        angle += 120;
        
        /#
            if ( getdvarint( @"hash_16ff13e5e454f2b0", 0 ) )
            {
                sphere( var_9f8f66c22e8e887c, 30, ( 0, 1, 0 ), 0, int( 20000 / getframeduration() ) );
            }
        #/
        
        wait 0.5;
    }
}

// Namespace sat_libra_mech_turret
// Params 3, eflags: 0x4
// Checksum 0x4baab1ec, Offset: 0x1790
// Size: 0x1b1
function private launchmortar( targetpos, angle, marker )
{
    self endon( #"death" );
    bombinggravity = ( 0, 0, -1 * getdvarfloat( @"bg_gravity" ) );
    var_a6614410e9346630 = cos( angle );
    var_a6614510e9346863 = sin( angle );
    var_39ea0250a47bf6c9 = vectornormalize2( ( var_a6614410e9346630, var_a6614510e9346863, 0 ) ) * 100;
    randompos = targetpos + var_39ea0250a47bf6c9;
    
    /#
        if ( getdvarint( @"hash_16ff13e5e454f2b0", 0 ) )
        {
            sphere( randompos, 150, ( 0, 0, 1 ), 0, int( 20000 / getframeduration() ) );
        }
    #/
    
    delay = getdvarint( @"hash_dee97f78643918b5", 2 );
    wait delay;
    grenade = self function_b3c3716e2fedee4b( randompos + ( 0, 0, 3000 ), randompos, 500, 0 );
    grenade.angles = ( -90, 0, 0 );
    self.mortarsinair++;
    self.grenades[ self.grenades.size ] = grenade;
    self notify( #"mortar_launch" );
    self playsound( "evt_mech_boss_mortar_launch" );
    grenade waittill( #"missile_stuck", stuckto );
    marker notify( #"mortar_landed" );
    grenade mortar_explode( grenade.origin, grenade.angles, self );
    
    if ( isdefined( self.mortarsinair ) )
    {
        self.mortarsinair--;
    }
}

// Namespace sat_libra_mech_turret
// Params 3, eflags: 0x4
// Checksum 0x7a8cdb7c, Offset: 0x1949
// Size: 0xfc
function private mortar_explode( groundexplodepos, var_1e4591e5c045a586, owner )
{
    level endon( #"game_ended" );
    groundexplodeent = spawn( "script_model", groundexplodepos );
    groundexplodeent.angles = var_1e4591e5c045a586;
    groundexplodeent.owner = owner;
    groundexplodeent.starttime = 0;
    groundexplodeent setmodel( "ks_toma_strike_cluster_sat_ob_mech" );
    explodepart = "explode_large";
    groundexplodeent setscriptablepartstate( explodepart, "active", 1 );
    
    if ( isdefined( self.explodeent ) )
    {
        self.explodeent delete();
    }
    
    if ( isdefined( owner.grenades ) )
    {
        owner.grenades = arrayremove( owner.grenades, self );
    }
    
    self notify( #"exploded" );
    self delete();
    hostmigration::waitlongdurationwithpause( 3 );
    groundexplodeent delete();
}

// Namespace sat_libra_mech_turret
// Params 1, eflags: 0x4
// Checksum 0x3eaf7781, Offset: 0x1a4d
// Size: 0x131
function private marker( markerorigin )
{
    owner = self;
    marker = spawn( "script_model", markerorigin );
    marker setmodel( "sat_ob_machete_attack_marker" );
    marker.objidnum = 0;
    
    if ( utility::issharedfuncdefined( #"game", #"requestobjectiveid" ) )
    {
        marker.objidnum = [[ utility::getsharedfunc( #"game", #"requestobjectiveid" ) ]]( 99 );
    }
    
    objidpoolmanager::function_e4d6a71507372662( marker.objidnum, 0 );
    marker.icon = "hud_icon_killstreak_tomastrike";
    marker setotherent( owner );
    
    /#
        if ( getdvarint( @"hash_16ff13e5e454f2b0", 0 ) )
        {
            cylinder( markerorigin + ( 0, 0, -12 ), markerorigin + ( 0, 0, 24 ), 256, ( 1, 0, 0 ), 0, int( 20000 / getframeduration() ) );
        }
    #/
    
    owner.var_e8196b1de7e7b7dd = markerorigin;
    self notify( #"marker_placed" );
    marker thread function_ed4e46b6e22a994b();
    return marker;
}

// Namespace sat_libra_mech_turret
// Params 0, eflags: 0x4
// Checksum 0xb3322b82, Offset: 0x1b87
// Size: 0x7c
function private function_ed4e46b6e22a994b()
{
    self endon( #"death" );
    self setscriptablepartstate( "target", "on", 0 );
    utility::waittill_any_timeout( 5, "mortar_landed", "mech_landed" );
    
    if ( isdefined( self ) )
    {
        if ( utility::issharedfuncdefined( #"game", #"returnobjectiveid" ) )
        {
            [[ utility::getsharedfunc( #"game", #"returnobjectiveid" ) ]]( self.objidnum );
        }
        
        self delete();
    }
}

// Namespace sat_libra_mech_turret
// Params 1
// Checksum 0x62718d71, Offset: 0x1c0b
// Size: 0x6f, Type: bool
function is_valid_target( target )
{
    if ( isalive( target ) && isplayer( target ) && target.sessionstate == "playing" && !target.inlaststand )
    {
        if ( !target utility::isusingremote() )
        {
            if ( !target ai::get_ignoreme() )
            {
                return true;
            }
            
            /#
                if ( isingodmode( target ) )
                {
                    return true;
                }
            #/
        }
    }
    
    return false;
}

// Namespace sat_libra_mech_turret
// Params 0, eflags: 0x4
// Checksum 0xb9f4612b, Offset: 0x1c83
// Size: 0x8d
function private targetfinder()
{
    self endon( #"death" );
    var_ff8fdb33fb45d343 = -1;
    self.mechtarget = undefined;
    
    while ( true )
    {
        if ( is_valid_target( self.focustarget ) )
        {
            self.mechtarget = self.focustarget;
        }
        else if ( !is_valid_target( self.mechtarget ) || gettime() >= var_ff8fdb33fb45d343 )
        {
            self.mechtarget = function_2105f5e71766e0c8();
            var_ff8fdb33fb45d343 = gettime() + 8000;
        }
        
        waitframe();
    }
}

// Namespace sat_libra_mech_turret
// Params 1, eflags: 0x4
// Checksum 0x346910fe, Offset: 0x1d18
// Size: 0x2d
function private function_51103bbed4297d06( yaw )
{
    self.headyaw = angleclamp180( yaw );
    self function_af99635258e79543( self.headyaw );
    
    /#
    #/
}

// Namespace sat_libra_mech_turret
// Params 0
// Checksum 0xec357a86, Offset: 0x1d4d
// Size: 0x90
function rotatehead()
{
    self endon( #"death" );
    self endon( #"disabled" );
    self endon( #"hash_b93d1e95d4b48ceb" );
    
    while ( true )
    {
        if ( is_valid_target( self.mechtarget ) )
        {
            yaw_to_target = vectortoyaw( self.mechtarget.origin - self.origin );
            yaw = yaw_to_target - self.angles[ 1 ];
            function_51103bbed4297d06( yaw );
        }
        
        waitframe();
    }
}

// Namespace sat_libra_mech_turret
// Params 0, eflags: 0x4
// Checksum 0x6d225029, Offset: 0x1de5
// Size: 0xd0
function private function_2105f5e71766e0c8()
{
    target = undefined;
    closestsq = -1;
    
    foreach ( player in level.players )
    {
        if ( is_valid_target( player ) )
        {
            distsq = distance2dsquared( player.origin, self.origin );
            
            if ( distsq < closestsq || closestsq == -1 )
            {
                closestsq = distsq;
                target = player;
            }
        }
    }
    
    return target;
}

// Namespace sat_libra_mech_turret
// Params 2, eflags: 0x4
// Checksum 0x620a32f1, Offset: 0x1ebe
// Size: 0x235
function private turret_spawn( turretstruct, parententnum )
{
    turret = spawnturret( "misc_turret", turretstruct.origin, turretstruct.weaponinfo );
    turret.weaponinfo = turretstruct.weaponinfo;
    turret.angles = turretstruct.angles;
    turret.kfe_ignore = 1;
    
    if ( !ob::nightmare() )
    {
        turret.health = 15000;
        turret.maxhealth = 15000;
    }
    else
    {
        turret.health = 1800000 * level.players.size;
        turret.maxhealth = 1800000 * level.players.size;
    }
    
    turret.ammocount = undefined;
    turret.timeout = undefined;
    turret.momentum = 0;
    turret.heatlevel = 0;
    turret.overheated = 0;
    turret.cooldownwaittime = 0.1;
    turret.sentrytype = "ai_sentry_turret";
    
    if ( !&ob::nightmare )
    {
        turret.team = "team_hundred_ninety_four";
        turret.owningteam = "team_hundred_ninety_four";
    }
    else
    {
        turret.team = "team_two_hundred";
        turret.owningteam = "team_two_hundred";
    }
    
    turret.parententnum = parententnum;
    turret setmodel( "tag_turret_mech" );
    turret setturretteam( turret.owningteam );
    turret setcandamage( 0 );
    turret makeunusable();
    turret setnodeploy( 1 );
    turret setdefaultdroppitch( 0 );
    turret setautorotationdelay( 0.5 );
    turret maketurretinoperable();
    turret setleftarc( 5 );
    turret setrightarc( 5 );
    turret setbottomarc( 90 );
    turret settoparc( 0 );
    turret thread ai_sentry_turret::function_a99c369d4ea722b1();
    turret.turreton = 1;
    turret setmode( "sentry" );
    return turret;
}

// Namespace sat_libra_mech_turret
// Params 1, eflags: 0x4
// Checksum 0x1cfa5e8f, Offset: 0x20fc
// Size: 0x11c
function private guntargeting( mech )
{
    self endon( #"death", #"stop" );
    mech endon( #"death" );
    minshots = 40;
    maxshots = 60;
    firetime = 0.2;
    pause = 1;
    
    while ( true )
    {
        if ( self.turreton && !self.disabled && ai_sentry_turret::turret_isvalidtarget( mech.mechtarget ) )
        {
            self settargetentity( mech.mechtarget );
            self laseron();
            self startbarrelspin();
            wait 3;
            numshots = randomintrange( minshots, maxshots + 1 );
            
            for ( i = 0; i < numshots ; i++ )
            {
                self shootturret( "tag_flash" );
                function_cf30a4de5c104e4f( mech, "gun_muzzle_flash" );
                wait firetime;
            }
            
            hostmigration::waitlongdurationwithpause( pause );
            self laseroff();
            self stopbarrelspin();
            wait 2;
        }
        
        waitframe();
    }
}

// Namespace sat_libra_mech_turret
// Params 1, eflags: 0x4
// Checksum 0xa9644e09, Offset: 0x2220
// Size: 0x290
function private rockettargeting( mech )
{
    self endon( #"death", #"stop" );
    mech endon( #"death" );
    firedelay = 1;
    pause = 4;
    notifytime = 2;
    numshots = 4;
    widget_struct = { #param:"EnemyAttackIndicator" };
    fields = [];
    fields[ "show_distance" ] = 0;
    wait firedelay;
    
    while ( true )
    {
        if ( self.turreton && !self.disabled )
        {
            foreach ( player in level.players )
            {
                level thread utility::play_sound_in_space( "mechboss_missile_locked", player.origin );
            }
            
            wait notifytime;
            valid_targets = [];
            
            foreach ( player in level.players )
            {
                if ( is_valid_target( player ) )
                {
                    valid_targets[ valid_targets.size ] = player;
                }
            }
            
            if ( valid_targets.size > 0 )
            {
                for ( i = 0; i < numshots ; i++ )
                {
                    if ( i < valid_targets.size )
                    {
                        missiletarget = valid_targets[ i ];
                    }
                    else
                    {
                        missiletarget = valid_targets[ randomintrange( 0, valid_targets.size ) ];
                    }
                    
                    if ( is_valid_target( missiletarget ) )
                    {
                        self settargetentity( missiletarget );
                        self setturretlockedon( 1 );
                        missile = self shootturret( "tag_flash" );
                        function_cf30a4de5c104e4f( mech, "missile_muzzle_flash" );
                        missile setcandamage( 1 );
                        missile.health = 1;
                        missiletarget scripted_widgets::anchored_add( missile, "MissileWarning", "scripted_widget_generic_in_world_marker_indicator_mp_sat_ob", "scripted_widget_anchor_in_world_marker_clamped_only_mp_sat_ob", widget_struct );
                        missiletarget scripted_widgets::function_f67a7797f3301a25( missile, "MissileWarning", fields );
                        wait firedelay;
                    }
                }
            }
            
            hostmigration::waitlongdurationwithpause( pause );
        }
        
        waitframe();
    }
}

// Namespace sat_libra_mech_turret
// Params 1, eflags: 0x4
// Checksum 0xa7c9f5ab, Offset: 0x24b8
// Size: 0x104
function private lasertargeting( mech )
{
    self endon( #"death", #"stop" );
    mech endon( #"death" );
    minshots = 12;
    maxshots = 15;
    firetime = 0.2;
    pause = 3;
    
    while ( true )
    {
        while ( self.turreton && !self.disabled && ai_sentry_turret::turret_isvalidtarget( mech.mechtarget ) )
        {
            self settargetentity( mech.mechtarget );
            wait 2;
            numshots = randomintrange( minshots, maxshots + 1 );
            
            for ( i = 0; i < numshots ; i++ )
            {
                self shootturret( "tag_flash" );
                function_cf30a4de5c104e4f( mech, "laser_muzzle_flash" );
                wait firetime;
            }
            
            hostmigration::waitlongdurationwithpause( pause );
        }
        
        waitframe();
    }
}

// Namespace sat_libra_mech_turret
// Params 2, eflags: 0x4
// Checksum 0xb22c52f5, Offset: 0x25c4
// Size: 0x5d
function private function_cf30a4de5c104e4f( mech, part )
{
    if ( self.firestate === 1 )
    {
        self.firestate = 0;
        state = "fire";
    }
    else
    {
        self.firestate = 1;
        state = "fire2";
    }
    
    mech setscriptablepartstate( part, state );
}

// Namespace sat_libra_mech_turret
// Params 1
// Checksum 0xf71b96e9, Offset: 0x2629
// Size: 0x14e
function function_3cc8731d810f2b1a( centerorigin )
{
    self endon( #"death" );
    mech = self;
    mech.var_cbbaa03e3d35a64c = mech.mortarenabled;
    mech.mortarenabled = 0;
    mech.leftarm.turreton = 0;
    mech.rightarm.turreton = 0;
    mech.mechtarget = undefined;
    mech notify( #"hash_b93d1e95d4b48ceb" );
    
    if ( !ob::nightmare() )
    {
        mech mech_invulnerable( 1 );
        mech thread function_d0221b71e077980();
    }
    
    mech.focustarget = undefined;
    mech.var_3cc8731d810f2b1a = 1;
    mech.var_aa3cf41f66a0769 = centerorigin;
    mech function_51103bbed4297d06( 0 );
    mech clearpath();
    mech pausepath( 0 );
    mech thread jumpmarker( centerorigin );
    mech waittill( #"jumpfinished" );
    mech.var_3cc8731d810f2b1a = undefined;
    
    if ( !ob::nightmare() )
    {
        mech mech_invulnerable( 0 );
    }
    
    mech forceteleport( centerorigin, mech.angles );
    mech.mortarenabled = mech.var_cbbaa03e3d35a64c;
}

// Namespace sat_libra_mech_turret
// Params 1, eflags: 0x4
// Checksum 0xa10b9a8d, Offset: 0x277f
// Size: 0x4f
function private jumpmarker( centerorigin )
{
    self endon( #"death" );
    wait 1;
    marker = marker( centerorigin );
    utility::waittill_any_timeout( 1, "jumpfinished", "landed" );
    marker notify( #"mech_landed" );
}

// Namespace sat_libra_mech_turret
// Params 1
// Checksum 0xfc328660, Offset: 0x27d6
// Size: 0x1aa
function function_be370ee8d86e6772( targetorigin )
{
    self endon( #"death" );
    mech = self;
    mech notify( #"hash_5588a9fdca62f361" );
    mech.var_cbbaa03e3d35a64c = mech.mortarenabled;
    mech.mortarenabled = 0;
    mech.allowpain = 1;
    mech.leftarm stopbarrelspin();
    targetangles = vectortoangles( vectornormalize( mech.origin - targetorigin ) );
    mech mech_invulnerable( 1 );
    mech thread function_d0221b71e077980();
    mech.var_be370ee8d86e6772 = 1;
    mech.var_aa3cf41f66a0769 = targetorigin;
    mech.var_21cbe54bf8835bf7 = targetangles;
    mech function_51103bbed4297d06( 0 );
    mech clearpath();
    mech waittill( #"jumpfinished" );
    mech.var_be370ee8d86e6772 = undefined;
    mech forceteleport( targetorigin, targetangles );
    mech setgoalpos( targetorigin );
    mech mech_invulnerable( 0 );
    waitframe();
    
    if ( !self.leftarm.disabled )
    {
        self.leftarm.turreton = 1;
    }
    
    if ( !self.rightarm.disabled )
    {
        self.rightarm.turreton = 1;
    }
    
    mech.mortarenabled = mech.var_cbbaa03e3d35a64c;
    mech.var_cbbaa03e3d35a64c = undefined;
    mech thread rotatehead();
    wait 0.5;
    mech resumepath();
}

// Namespace sat_libra_mech_turret
// Params 0, eflags: 0x4
// Checksum 0x2c6f16ee, Offset: 0x2988
// Size: 0x27
function private function_d0221b71e077980()
{
    self endon( #"death" );
    utility::waittill_any( "jumpfinished", "landed" );
    mech_invulnerable( 0 );
}

// Namespace sat_libra_mech_turret
// Params 0
// Checksum 0xd61a5e3a, Offset: 0x29b7
// Size: 0x385
function repulsoron()
{
    self endon( #"death" );
    self endon( #"stop_repulsor" );
    level endon( #"stop_mech_repulsor" );
    thread function_dce89f8718800d74();
    
    while ( true )
    {
        foreach ( p in level.players )
        {
            dist = distance( p.origin, self.origin );
            push_org = ( self.origin[ 0 ], self.origin[ 1 ], min( self.origin[ 2 ] - 50, p.origin[ 2 ] - 50 ) );
            
            if ( dist <= 300 )
            {
                if ( !p.being_repulsed )
                {
                    self notify( #"mech_repulse" );
                    inv_dist = 1 / dist;
                    push_vec = vectornormalize( p.origin - push_org );
                    push_vec *= clamp( inv_dist * 300 * 50, 0, 100 );
                    p.being_repulsed = 1;
                    p pushplayervector( push_vec, 1 );
                    p dodamage( 10, self.origin, self, undefined, "MOD_ELEMENTAL_ELEC" );
                    level notify( #"mech_repulsed" );
                    damage = inv_dist * 50;
                }
                
                continue;
            }
            
            if ( p.being_repulsed )
            {
                p.being_repulsed = undefined;
                p pushplayervector( ( 0, 0, 0 ), 1 );
            }
        }
        
        if ( !ob::nightmare() )
        {
            ais = getaiarrayinradius( self.origin, 300 );
            
            foreach ( ai in ais )
            {
                if ( ai != self && abs( ai.origin[ 2 ] - self.origin[ 2 ] ) < 80 )
                {
                    ai kill();
                }
            }
        }
        else
        {
            ais = getaiarrayinradius( self.origin, 96 );
            
            foreach ( ai in ais )
            {
                if ( ai != self && abs( ai.origin[ 2 ] - self.origin[ 2 ] ) < 80 )
                {
                    playfx( level._effect[ "enemy_vfx" ], ai.origin + ( 0, 0, 32 ) );
                    ai agent_utils::despawnagent();
                }
            }
        }
        
        waitframe();
    }
}

// Namespace sat_libra_mech_turret
// Params 0, eflags: 0x4
// Checksum 0x2c826275, Offset: 0x2d44
// Size: 0x51
function private function_dce89f8718800d74()
{
    self endon( #"stop_repulsor" );
    
    while ( true )
    {
        self waittill( #"mech_repulse" );
        playfx( level._effect[ "mech_repulsor" ], self.origin + ( 0, 0, 50 ) );
        wait 1;
    }
}

// Namespace sat_libra_mech_turret
// Params 0
// Checksum 0xc389db1c, Offset: 0x2d9d
// Size: 0xad
function repulsoroff()
{
    self notify( #"stop_repulsor" );
    
    foreach ( player in level.players )
    {
        if ( player.being_repulsed )
        {
            player pushplayervector( ( 0, 0, 0 ) );
            player.being_repulsed = 0;
        }
    }
}

// Namespace sat_libra_mech_turret
// Params 2, eflags: 0x4
// Checksum 0xbba9d9b8, Offset: 0x2e52
// Size: 0xad
function private fadeoutrepulse( push_vec, fade_time )
{
    self endon( #"death" );
    self notify( #"faderepulse" );
    self endon( #"faderepulse" );
    curtime = gettime();
    endtime = curtime + utility::function_4b74c15943231980( fade_time );
    
    while ( curtime <= endtime )
    {
        waitframe();
        curtime = gettime();
        time_left_frac = ( endtime - curtime ) / utility::function_4b74c15943231980( fade_time );
        self pushplayervector( push_vec * time_left_frac );
    }
    
    self pushplayervector( ( 0, 0, 0 ) );
    self.being_repulsed = 0;
}

// Namespace sat_libra_mech_turret
// Params 3
// Checksum 0xe48280d, Offset: 0x2f07
// Size: 0x1f4
function spinattack( var_8c7c3044e8958235 = 1, total_spin = undefined, var_c2b07ad93e615476 = 1 )
{
    mech = self;
    self endon( #"death" );
    self endon( #"hash_5588a9fdca62f361" );
    mech.var_c2b07ad93e615476 = var_c2b07ad93e615476;
    mech namespace_2bfee0fa87a9007a::start_beam_attack( var_8c7c3044e8958235 );
    mech thread function_26e9802252b30d31();
    waitframe();
    self.allowpain = 0;
    var_bb168ae68fbefa8f = 0;
    
    while ( true )
    {
        if ( isdefined( self.focustarget ) )
        {
            spin_speed = 3 * var_8c7c3044e8958235;
            yaw_to_target = vectortoyaw( self.focustarget.origin - self.origin );
            yaw = yaw_to_target - self.angles[ 1 ];
            clampangles = anglelerpquat( ( 0, self.headyaw, 0 ), ( 0, yaw, 0 ), spin_speed );
            function_51103bbed4297d06( clampangles[ 1 ] );
        }
        else if ( isdefined( self.beamtarget ) )
        {
            if ( self.beamlockedon )
            {
                spin_speed = 0.3 * var_8c7c3044e8958235;
            }
            else
            {
                spin_speed = 1 * var_8c7c3044e8958235;
            }
            
            yaw_to_target = vectortoyaw( self.beamtarget.origin - self.origin );
            yaw = yaw_to_target - self.angles[ 1 ];
            clampangles = anglelerpquat( ( 0, self.headyaw, 0 ), ( 0, yaw, 0 ), spin_speed );
            function_51103bbed4297d06( clampangles[ 1 ] );
        }
        else
        {
            spin_speed = 1 * var_8c7c3044e8958235;
            yaw = self.headyaw + spin_speed;
            mech function_51103bbed4297d06( yaw );
            
            if ( isdefined( total_spin ) )
            {
                var_bb168ae68fbefa8f += spin_speed;
                
                if ( var_bb168ae68fbefa8f >= total_spin )
                {
                    mech notify( #"hash_7830d6de09252899" );
                    return;
                }
            }
        }
        
        waitframe();
    }
}

// Namespace sat_libra_mech_turret
// Params 0, eflags: 0x4
// Checksum 0x515a9952, Offset: 0x3103
// Size: 0x22
function private function_26e9802252b30d31()
{
    self endon( #"death" );
    self waittill( #"hash_5588a9fdca62f361" );
    namespace_2bfee0fa87a9007a::stop_beam_attack();
}

// Namespace sat_libra_mech_turret
// Params 0
// Checksum 0xc2f10b7, Offset: 0x312d
// Size: 0x2
function bt_move()
{
    
}

/#

    // Namespace sat_libra_mech_turret
    // Params 0, eflags: 0x4
    // Checksum 0x12394d37, Offset: 0x3137
    // Size: 0x9b, Type: dev
    function private mechdebug()
    {
        while ( true )
        {
            if ( isalive( self.mechtarget ) )
            {
                print3d( self.origin + ( 0, 0, 196 ), self.mechtarget.name, ( 1, 0, 0 ), 1, 1, 20, 1 );
            }
            else
            {
                print3d( self.origin + ( 0, 0, 196 ), "<dev string:x24>", ( 1, 0, 0 ), 1, 1, 20, 1 );
            }
            
            waitframe();
        }
    }

#/

// Namespace sat_libra_mech_turret
// Params 3
// Checksum 0x645d93e5, Offset: 0x31da
// Size: 0x1c1
function function_86b186b259920cfb( dmg, damagetype, weaponname )
{
    if ( isdefined( self.dmg_pct ) )
    {
        target_pct = 0;
        var_2d0e2053ae512298 = self.dmg_pct[ "default_exp" ];
        
        foreach ( weap_substr, info_arr in self.dmg_pct )
        {
            if ( issubstr( weaponname, weap_substr ) )
            {
                if ( !isarray( info_arr[ 0 ] ) )
                {
                    var_2d0e2053ae512298 = [ info_arr ];
                }
                else
                {
                    var_2d0e2053ae512298 = info_arr;
                }
                
                break;
            }
        }
        
        foreach ( dmg_info in var_2d0e2053ae512298 )
        {
            if ( !isdefined( dmg_info[ 1 ] ) || dmg_info[ 1 ] == "ALL" || dmg_info[ 1 ] == damagetype )
            {
                target_pct = dmg_info[ 0 ];
                break;
            }
        }
        
        if ( target_pct > 0 )
        {
            target_pct += randomfloatrange( 0, 0.03 );
            target_pct /= float( level.players.size );
            dmg = self.maxhealth * target_pct;
        }
    }
    
    self notify( #"took_explosive_damage" );
    return dmg;
}

// Namespace sat_libra_mech_turret
// Params 1
// Checksum 0xd0effb5e, Offset: 0x33a4
// Size: 0x140
function mech_invulnerable( on )
{
    if ( ob::nightmare() )
    {
        return;
    }
    
    if ( on )
    {
        if ( !self.invulnerable )
        {
            self.invulnerable = 1;
            utility::ent_flag_wait( "boss_bar_initialized" );
            
            foreach ( player in level.players )
            {
                player ob_story_mission_utils::player_boss_healthbar_immune();
            }
        }
        
        return;
    }
    
    if ( self.invulnerable )
    {
        self.invulnerable = undefined;
        
        foreach ( player in level.players )
        {
            player ob_story_mission_utils::player_boss_healthbar_show();
        }
    }
}

// Namespace sat_libra_mech_turret
// Params 0, eflags: 0x4
// Checksum 0x4a0c9155, Offset: 0x34ec
// Size: 0x104
function private precache_fx()
{
    if ( !isdefined( level._effect[ "mech_repulsor" ] ) )
    {
        level._effect[ "mech_repulsor" ] = loadfxasset( "vfx_sat_wc_libra_mech_repulsor_aoe" );
    }
    
    if ( !isdefined( level._effect[ "vfx_sat_wc_libra_mech_stunned_upper" ] ) )
    {
        level._effect[ "vfx_sat_wc_libra_mech_stunned_upper" ] = loadfxasset( "vfx_sat_wc_libra_mech_stunned_upper" );
    }
    
    if ( !isdefined( level._effect[ "vfx_sat_wc_libra_mech_beam" ] ) )
    {
        level._effect[ "vfx_sat_wc_libra_mech_beam" ] = loadfxasset( "vfx_sat_wc_libra_mech_beam" );
    }
    
    if ( !isdefined( level._effect[ "mech_mortar_launch" ] ) )
    {
        level._effect[ "mech_mortar_launch" ] = loadfxasset( "vfx_sat_wc_libra_mech_mortar_muz" );
    }
    
    if ( !isdefined( level._effect[ "shock_hit_player_arms" ] ) )
    {
        level._effect[ "shock_hit_player_arms" ] = loadfxasset( "vfx_t10_core_player_electrocuted_arms" );
    }
    
    if ( !isdefined( level._effect[ "shock_hit_player" ] ) )
    {
        level._effect[ "shock_hit_player" ] = loadfxasset( "vfx_t10_core_player_electrocuted" );
    }
}

// Namespace sat_libra_mech_turret
// Params 14
// Checksum 0xde081084, Offset: 0x35f8
// Size: 0x220
function function_786772134de85587( einflictor, attacker, idamage, idflags, damagetype, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, objweapon, poisedamage )
{
    inflictor = einflictor;
    damage = idamage;
    dmgstruct = zombie_damage::build_damage_struct( inflictor, attacker, damage, idflags, damagetype, objweapon, vpoint, vdir, undefined, undefined, undefined, undefined, objweapon );
    damage = zombie_damage::function_881dfa87252ee0ea( dmgstruct );
    clamp_health = 1;
    
    if ( isdefined( self.health_pct_threshold ) )
    {
        clamp_health = int( self.maxhealth * self.health_pct_threshold );
    }
    
    if ( self.health - damage < clamp_health )
    {
        damage = self.health - clamp_health;
    }
    
    if ( isplayer( attacker ) )
    {
        attacker damagefeedback::updatehitmarker( "standard", self.health == 0, 0, 1 );
    }
    else if ( isplayer( attacker.owner ) )
    {
        attacker.owner damagefeedback::updatehitmarker( "standard", self.health == 0, 0, 1 );
    }
    
    if ( damage < 100 )
    {
        damage = 300;
    }
    
    if ( damage > 0 && mp_agent_damage::function_e257c518b45c4dbb() )
    {
        numbersorigin = self.origin + ( 0, 0, 180 );
        mp_agent_damage::function_eb8ba16055d6da7c( attacker, self, shitloc, damagetype, sweapon, damage, numbersorigin, 0, undefined, 0, 0 );
    }
    
    if ( damage >= 0.05 * self.maxhealth )
    {
        set_focus_target( attacker );
        thread function_97ac63bbb364f618( attacker );
    }
    
    function_f293094f8e1b1782( self.health - damage, damage );
    
    if ( self.health - damage > 0 )
    {
    }
    else
    {
        damage = 0;
    }
    
    return damage;
}

// Namespace sat_libra_mech_turret
// Params 2
// Checksum 0x3c5ba24e, Offset: 0x3821
// Size: 0xf1
function function_f293094f8e1b1782( newhealth, damage )
{
    mech = self;
    
    if ( isdefined( mech.health_pct_threshold ) && isdefined( mech.var_48a1ce658bbc7378 ) )
    {
        notify_health = int( mech.maxhealth * mech.health_pct_threshold );
        
        if ( newhealth <= notify_health )
        {
            mech notify( mech.var_48a1ce658bbc7378 );
        }
    }
    
    if ( newhealth > 1 )
    {
        health_pct = newhealth / mech.maxhealth;
        mech notify( #"health_pct", health_pct );
        
        if ( ob::nightmare() )
        {
            health_pct = newhealth / mech.maxhealth;
        }
    }
    else if ( !mech.disabled )
    {
        mech thread mech_disabled();
        
        if ( ob::nightmare() )
        {
        }
    }
    
    level function_2bdd0c9a8d10bdd1( damage );
}

// Namespace sat_libra_mech_turret
// Params 1
// Checksum 0x68acbc35, Offset: 0x391a
// Size: 0x4c
function function_2bdd0c9a8d10bdd1( damage )
{
    level.boss_struct.health -= damage;
    level callback::callback( "on_boss_progress_updated", level.boss_struct );
}

// Namespace sat_libra_mech_turret
// Params 1
// Checksum 0xc1023664, Offset: 0x396e
// Size: 0x4c
function function_aa49d4f9973d90f9( health_pct )
{
    mech = self;
    mech endon( #"death" );
    level.nm_activity_instance mission_ui::function_d84701041f6f95c2( mech.mech_number, int( health_pct * 100 ), 100 );
}

// Namespace sat_libra_mech_turret
// Params 0
// Checksum 0xff7610a4, Offset: 0x39c2
// Size: 0x2f
function function_f0adce0c92372126()
{
    attacker = utility::array_random( level.players );
    set_focus_target( attacker );
    thread function_97ac63bbb364f618( attacker );
}

