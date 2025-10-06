#using script_16ea1b94f0f381b3;
#using script_45f403e1732217d3;
#using scripts\anim\utility;
#using scripts\common\callbacks;
#using scripts\common\damage_effects;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\common\weapon;
#using scripts\cp_mp\damagefeedback;
#using scripts\cp_mp\entityheadicons;
#using scripts\cp_mp\equipment;
#using scripts\cp_mp\utility\equipment_utility;
#using scripts\cp_mp\utility\player_utility;
#using scripts\engine\hud_management;
#using scripts\engine\trace;
#using scripts\engine\utility;
#using scripts\mp\damage;
#using scripts\mp\gamelogic;
#using scripts\mp\rank;
#using scripts\mp\sentientpoolmanager;
#using scripts\mp\utility\outline;
#using scripts\mp\utility\player;
#using scripts\mp\utility\points;
#using scripts\mp\utility\teams;
#using scripts\mp\weapons;

#namespace sensor_grenade;

// Namespace sensor_grenade
// Params 0, eflags: 0x1
// Checksum 0xa881ecd6, Offset: 0x4c8
// Size: 0xa
function autoexec main()
{
    level function_66c0b75886bbffc();
}

// Namespace sensor_grenade
// Params 0, eflags: 0x4
// Checksum 0x4ff32661, Offset: 0x4da
// Size: 0xed
function private function_66c0b75886bbffc()
{
    level callback::add( #"player_spawned", &function_8eb8e1017f2c6ec4 );
    level callback::add( #"on_ai_killed", &function_5e24153695eb428c );
    level callback::add( #"player_death", &function_5e24153695eb428c );
    level callback::add( #"hash_2709fd1dd4cef88d", &function_38cf8364e4d8e652 );
    level callback::add( #"hash_eb54ccc016130a88", &function_6d7acbafb1f4d32d );
    level callback::add( #"player_disconnect", &function_f8c34291459a2ba0 );
    level callback::add( #"hash_244314ef9125e636", &function_572a58d98cd7d56c );
    weapons::registerusedcallback( "sensor_grenade", &function_60de08d6e4a6308f );
    utility::add_fx( "sensor_grenade_laser_beam", "vfx_sat_equip_sensor_laser_mp" );
    utility::add_fx( "sensor_grenade_muzzle", "vfx_sat_equip_sensor_dart_muzzle" );
    utility::registersharedfunc( #"sensor_grenade", #"hack", &function_bd14d76144577d07 );
}

// Namespace sensor_grenade
// Params 1
// Checksum 0x9bacf8fc, Offset: 0x5cf
// Size: 0x2c6
function function_60de08d6e4a6308f( grenade )
{
    grenade endon( "death" );
    grenade endon( "sensor_grenade_water_impact" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    
    if ( !isdefined( level.var_246408e0d4906146 ) )
    {
        ref = equipment::function_fdc4a655fbde0dec( grenade.weapon_name );
        tableinfo = equipment::getequipmenttableinfo( ref );
        level.var_246408e0d4906146 = tableinfo.bundle;
        
        if ( !isdefined( level.var_246408e0d4906146 ) )
        {
            assertmsg( "<dev string:x24>" );
        }
    }
    
    if ( !isdefined( grenade.var_30656af96b2ac2a4 ) )
    {
        grenade.var_30656af96b2ac2a4 = [];
    }
    
    grenade.var_6296632a2be939ef = &function_6296632a2be939ef;
    grenade.var_836769537343f47e = &function_836769537343f47e;
    grenade thread function_50be5a1ce3c32e0d();
    thread function_410a8fd588157708( grenade );
    grenade waittill( "missile_stuck", stuckto );
    
    if ( isent( stuckto ) && stuckto ismovingplatform() )
    {
        grenade linkto( stuckto );
    }
    
    grenade.owner = self;
    grenade setentityowner( self );
    grenade setotherent( self );
    grenade.health = level.var_246408e0d4906146.var_b81fa30540ab2837 ?? 25;
    grenade setcandamage( 1 );
    grenade thread damage::monitordamage( grenade.health, "hitequip", &function_e57bc3a05e301372, &function_c86d6d93256453b1 );
    grenade sentientpoolmanager::registersentient( "Tactical_Static", grenade.owner );
    grenade setscriptablepartstate( #"plant_fx", #"plant" );
    grenade setscriptablepartstate( #"visual", #"visible" );
    
    if ( !isdefined( self.var_2da4c4b5ebd5dacf ) )
    {
        self.var_2da4c4b5ebd5dacf = [];
    }
    
    self.var_2da4c4b5ebd5dacf[ self.var_2da4c4b5ebd5dacf.size ] = grenade;
    imageoverride = grenade.var_30656af96b2ac2a4.size > 0 ? level.var_246408e0d4906146.var_171b9865909c4339 : undefined;
    grenade.headiconid = entityheadicons::function_e2775272ceb208ca( grenade, imageoverride );
    namespace_9d8e359c3b1041e5::function_9b4fb0a03905926d( grenade, &function_4db53a5fbf77074a );
    utility::callsharedfunc( #"hash_d8976e21a6adafba", #"hash_ca0042e3cac99672", grenade, &function_498767fdd7c6b823, &function_d3e471ee2ed15a11 );
    wait level.var_246408e0d4906146.var_d75b50d3e5e98a51 ?? 1;
    grenade.var_76d4515a04d0ef12 = [];
    weapons::onequipmentplanted( grenade, "equip_sensor_grenade", &function_e57bc3a05e301372 );
    grenade thread function_9d2caa8f2bea4fb2( self );
    grenade thread function_4d8212cd28dca85c( self );
}

// Namespace sensor_grenade
// Params 1, eflags: 0xc
// Checksum 0xf05c79bf, Offset: 0x89d
// Size: 0x76
function private function_410a8fd588157708( grenade )
{
    self notify( "e66c5b011c196dc5" );
    self endon( "e66c5b011c196dc5" );
    grenade endon( "death" );
    grenade endon( "missile_stuck" );
    self endon( "disconnect" );
    level endon( "game_ended" );
    msg = utility::waittill_any_timeout( 5, "missile_water_impact" );
    
    if ( msg == "timeout" )
    {
        return;
    }
    
    grenade notify( "sensor_grenade_water_impact" );
    grenade thread function_e57bc3a05e301372( undefined );
}

// Namespace sensor_grenade
// Params 0, eflags: 0xc
// Checksum 0x8a947ba3, Offset: 0x91b
// Size: 0x3d
function private function_50be5a1ce3c32e0d()
{
    self notify( "77a3a0387d6d2044" );
    self endon( "77a3a0387d6d2044" );
    self endon( "death" );
    wait 0.2;
    
    if ( isdefined( self ) )
    {
        self setscriptablepartstate( #"model_visibility", #"visible" );
    }
}

// Namespace sensor_grenade
// Params 1, eflags: 0xc
// Checksum 0x8d7f3622, Offset: 0x960
// Size: 0x51e
function private function_9d2caa8f2bea4fb2( owner )
{
    self notify( "2afcd40cc256da88" );
    self endon( "2afcd40cc256da88" );
    level endon( "game_ended" );
    owner endon( "disconnect" );
    self endon( "death" );
    self endon( "grenade_hacked" );
    var_102533614c9dd55c = level.var_246408e0d4906146.var_b15981b2658ce613 ?? 700;
    var_9b00e7f569ba789a = level.var_246408e0d4906146.var_233718f2d68108ff ?? 500;
    
    if ( !isdefined( self.var_9f1d71842b80f073 ) )
    {
        self.var_9f1d71842b80f073 = level.var_246408e0d4906146.var_20a9e3c4d4cb07fa ?? 5;
    }
    
    var_cf756a18e7bb1d87 = self getentitynumber();
    
    if ( self.bundle.var_c7709714d768097c && self.weapon_object hasattachmenthash( self.bundle.var_c7709714d768097c ) )
    {
        var_b2df48f9f91e6cfb = level.var_246408e0d4906146.var_8bf563eac1069f56 ?? 1.2;
        var_102533614c9dd55c *= var_b2df48f9f91e6cfb;
        var_9b00e7f569ba789a *= var_b2df48f9f91e6cfb;
    }
    
    if ( self.bundle.var_e36b84555e7df1d3 && self.weapon_object hasattachmenthash( self.bundle.var_e36b84555e7df1d3 ) )
    {
        self.var_1c66fc2ea253c2a4 = 1;
    }
    
    while ( isdefined( self ) && self.var_9f1d71842b80f073 > 0 && !self.isdying && !self.isjammed )
    {
        var_e9f245b8221e1e45 = 0;
        var_411f2467e9a5214f = 0;
        
        if ( self.var_30656af96b2ac2a4.size > 0 )
        {
            if ( self.var_4c8db6072e69d191 )
            {
                self.var_e9f245b8221e1e45 = self.var_34d5be132068dd5 * self.var_30656af96b2ac2a4.size;
                self.var_411f2467e9a5214f = self.var_31b2148b669e7beb * self.var_30656af96b2ac2a4.size;
            }
            else
            {
                self.var_e9f245b8221e1e45 = self.var_34d5be132068dd5;
                self.var_411f2467e9a5214f = self.var_31b2148b669e7beb;
            }
        }
        
        foreach ( ent in function_ba55bce1d76015c5( self.origin, var_102533614c9dd55c + var_e9f245b8221e1e45 ) )
        {
            if ( ent.isjuggernaut && self.bundle.var_abf9c59406f0d018 )
            {
                continue;
            }
            
            var_877d02ea00dfe071 = 0;
            
            if ( player::isreallyalive( ent ) && owner.team != ent.team && !isdefined( ent.perks[ "specialty_blindeye" ] ) )
            {
                tracepoint = function_77c9d10aba0f79b7( ent );
                
                if ( isdefined( tracepoint ) )
                {
                    var_877d02ea00dfe071 = 1;
                    
                    if ( !arraycontains( self.var_76d4515a04d0ef12, ent ) )
                    {
                        self.var_76d4515a04d0ef12[ self.var_76d4515a04d0ef12.size ] = ent;
                        function_ecc976246e039552( ent, var_9b00e7f569ba789a + var_411f2467e9a5214f );
                    }
                }
            }
            
            if ( !var_877d02ea00dfe071 && arraycontains( self.var_76d4515a04d0ef12, ent ) )
            {
                if ( isdefined( ent.var_f28dc2b29553a25a[ var_cf756a18e7bb1d87 ] ) )
                {
                    ent.var_f28dc2b29553a25a[ var_cf756a18e7bb1d87 ] delete();
                    ent.var_f28dc2b29553a25a[ var_cf756a18e7bb1d87 ] = undefined;
                }
                
                self.var_76d4515a04d0ef12 = arrayremove( self.var_76d4515a04d0ef12, ent );
            }
        }
        
        foreach ( ent in self.var_76d4515a04d0ef12 )
        {
            if ( !isdefined( ent ) )
            {
                self.var_76d4515a04d0ef12 = arrayremove( self.var_76d4515a04d0ef12, ent );
                continue;
            }
            
            if ( !player::isreallyalive( ent ) )
            {
                self.var_76d4515a04d0ef12 = arrayremove( self.var_76d4515a04d0ef12, ent );
                continue;
            }
            
            if ( distance2dsquared( self.origin, ent.origin ) > squared( var_102533614c9dd55c + var_e9f245b8221e1e45 ) )
            {
                self.var_76d4515a04d0ef12 = arrayremove( self.var_76d4515a04d0ef12, ent );
                
                if ( isdefined( ent.var_f28dc2b29553a25a[ var_cf756a18e7bb1d87 ] ) )
                {
                    ent.var_f28dc2b29553a25a[ var_cf756a18e7bb1d87 ] delete();
                    ent.var_f28dc2b29553a25a[ var_cf756a18e7bb1d87 ] = undefined;
                }
            }
        }
        
        waitframe();
    }
    
    if ( self.isjammed )
    {
        return;
    }
    
    if ( isdefined( self ) && !self.isdying )
    {
        thread function_e57bc3a05e301372( undefined );
    }
}

// Namespace sensor_grenade
// Params 1, eflags: 0xc
// Checksum 0xb237a5f1, Offset: 0xe86
// Size: 0xde
function private function_4d8212cd28dca85c( owner )
{
    self notify( "374b99b4912c7cf7" );
    self endon( "374b99b4912c7cf7" );
    level endon( "game_ended" );
    owner endon( "disconnect" );
    self endon( "death" );
    self endon( "grenade_hacked" );
    lifetime = level.var_246408e0d4906146.var_238545fecca4b37 ?? 20;
    
    if ( self.bundle.var_c7709714d768097c && self.weapon_object hasattachmenthash( self.bundle.var_c7709714d768097c ) )
    {
        lifetime *= level.var_246408e0d4906146.var_e46c02e8aea75087 ?? 1.2;
    }
    
    wait lifetime;
    
    if ( isdefined( self ) && !self.isdying )
    {
        thread function_e57bc3a05e301372( undefined, 1 );
    }
}

// Namespace sensor_grenade
// Params 2, eflags: 0x4
// Checksum 0xf6e57ec, Offset: 0xf6c
// Size: 0x8f
function private function_ecc976246e039552( ent, var_f722a3b01f77bcbc )
{
    if ( ent.var_1f4aa153cbdc3919 || isdefined( ent.var_4f13010847a7dc86 ) )
    {
        return;
    }
    
    if ( isdefined( ent.var_c9b559b555a97062 ) )
    {
        if ( gettime() - ent.var_c9b559b555a97062 < ( level.var_246408e0d4906146.var_c7fcce670ae72e53 ?? 60 ) * 1000 )
        {
            return;
        }
    }
    
    ent.var_1f4aa153cbdc3919 = 1;
    thread function_d043948ae4351dd7( ent, var_f722a3b01f77bcbc );
}

// Namespace sensor_grenade
// Params 2, eflags: 0x4
// Checksum 0xbb08f0ba, Offset: 0x1003
// Size: 0x2a3
function private function_d043948ae4351dd7( ent, var_f722a3b01f77bcbc )
{
    level endon( "game_ended" );
    self.owner endon( "disconnect" );
    self endon( "death" );
    self endon( "grenade_hacked" );
    time = 0;
    
    if ( !isdefined( ent.var_f28dc2b29553a25a ) )
    {
        ent.var_f28dc2b29553a25a = [];
    }
    
    var_cf756a18e7bb1d87 = self getentitynumber();
    var_fee77ae7fcaf16f7 = level.var_246408e0d4906146.var_2f8353ce63915c24 ?? 0.4;
    var_cba542ae63a0a2a9 = level.var_246408e0d4906146.var_29738bee72f2fcc4 ?? 0.25;
    var_fc726df3a12ea3ec = var_fee77ae7fcaf16f7 - var_cba542ae63a0a2a9;
    var_3c296a2632f9b39 = level.var_246408e0d4906146.var_1ad2b5356990eeaa ?? 1;
    var_ec97ee52a3013195 = 0;
    ent playlocalsound( "eqp_sensor_grenade_tripped" );
    var_cdb915b4b83f7522 = squared( var_f722a3b01f77bcbc );
    
    while ( true )
    {
        if ( self.isdying || !player::isreallyalive( ent ) || !arraycontains( self.var_76d4515a04d0ef12, ent ) || self.isjammed )
        {
            ent.var_1f4aa153cbdc3919 = 0;
            
            if ( isdefined( ent.var_f28dc2b29553a25a[ var_cf756a18e7bb1d87 ] ) )
            {
                ent.var_f28dc2b29553a25a[ var_cf756a18e7bb1d87 ] delete();
                ent.var_f28dc2b29553a25a[ var_cf756a18e7bb1d87 ] = undefined;
            }
            
            return;
        }
        
        if ( time >= var_3c296a2632f9b39 && distance2dsquared( self.origin, ent.origin ) < var_cdb915b4b83f7522 )
        {
            if ( isdefined( ent.var_f28dc2b29553a25a[ var_cf756a18e7bb1d87 ] ) )
            {
                ent.var_f28dc2b29553a25a[ var_cf756a18e7bb1d87 ] delete();
                ent.var_f28dc2b29553a25a[ var_cf756a18e7bb1d87 ] = undefined;
            }
            
            break;
        }
        
        if ( !var_ec97ee52a3013195 )
        {
            ent.var_f28dc2b29553a25a[ var_cf756a18e7bb1d87 ] = function_f5f8abcd7522eee2( level._effect[ "sensor_grenade_laser_beam" ], self.origin, ( ent utility::function_f02ebab438642e16() + ent utility::function_68061c3d21a6d57a() ) * 0.5 );
            time += var_cba542ae63a0a2a9;
            wait var_cba542ae63a0a2a9;
        }
        else
        {
            if ( isdefined( ent.var_f28dc2b29553a25a[ var_cf756a18e7bb1d87 ] ) )
            {
                ent.var_f28dc2b29553a25a[ var_cf756a18e7bb1d87 ] delete();
                ent.var_f28dc2b29553a25a[ var_cf756a18e7bb1d87 ] = undefined;
            }
            
            time += var_fc726df3a12ea3ec;
            wait var_fc726df3a12ea3ec;
        }
        
        var_ec97ee52a3013195 = !var_ec97ee52a3013195;
    }
    
    self.owner thread function_ee504ba42e8ad56e( self, ent );
}

// Namespace sensor_grenade
// Params 2, eflags: 0x4
// Checksum 0x4e9cdf30, Offset: 0x12ae
// Size: 0x281
function private function_ee504ba42e8ad56e( grenade, targetent )
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    self endon( "grenade_hacked" );
    
    if ( isdefined( grenade ) )
    {
        grenade.var_9f1d71842b80f073--;
        grenade setscriptablepartstate( #"fx", #"launch" );
        startpoint = grenade.origin;
        var_62f0c02022e3b913 = ( targetent utility::function_f02ebab438642e16() + targetent utility::function_68061c3d21a6d57a() ) * 0.5;
        forwardvector = vectornormalize( var_62f0c02022e3b913 - startpoint );
        playfx( level._effect[ "sensor_grenade_muzzle" ], startpoint, forwardvector );
    }
    
    targetent.var_1f4aa153cbdc3919 = 0;
    targetent.var_4f13010847a7dc86 = { #weaponobj:grenade.weapon_object, #entityid:grenade getentitynumber(), #enemyowner:self, #owner:targetent };
    namespace_23c79201421792eb::function_594cbdc6a4d8098a( targetent, self, grenade.weapon_object, grenade getentitynumber() );
    thread namespace_2c42f1b7d9a6dd72::threadedsetweaponstatbyname( grenade.weapon_object, 1, "special_hits" );
    wait 0.5;
    targetent playlocalsound( "eqp_sensor_grenade_online" );
    var_38359749852350a1 = teams::getfriendlyplayers( self.team, 1 );
    
    foreach ( ally in var_38359749852350a1 )
    {
        ally playlocalsound( "eqp_sensor_grenade_tagged" );
    }
    
    thread points::doscoreevent( #"hash_e772e4d4e5c99c84", grenade.weapon_object );
    thread damagefeedback::updatedamagefeedback( "hitequip" );
    var_70066bca8cadbd68 = utility::callsharedfunc( #"hud", #"hash_785d65fc31ffd85", 0 );
    
    if ( var_70066bca8cadbd68 )
    {
        self playlocalsound( var_70066bca8cadbd68 );
    }
    
    targetent damage_effects::function_396a4a03ea0e2628( 1, grenade, self, targetent, "MOD_IMPACT", undefined, 0, undefined, "torso_upper" );
    
    if ( isplayer( targetent ) )
    {
        targetent setclientomnvar( "ui_grenade_tagged_notify", gettime() );
    }
    
    targetent thread function_79ad21c18fac5b45( self, grenade.var_1c66fc2ea253c2a4 );
}

// Namespace sensor_grenade
// Params 2, eflags: 0xc
// Checksum 0xd1ce0318, Offset: 0x1537
// Size: 0x310
function private function_79ad21c18fac5b45( enemyowner, var_1c66fc2ea253c2a4 )
{
    self notify( "2c26a6164b272235" );
    self endon( "2c26a6164b272235" );
    level endon( "game_ended" );
    self endon( "death_or_disconnect" );
    self endon( "sensor_grenade_tracker_destroyed" );
    self endon( "grenade_hacked" );
    self.var_c9b559b555a97062 = gettime();
    time = 0;
    radius = 20;
    pinginterval = level.var_246408e0d4906146.var_4a65e96e04ecbe3e ?? 2.5;
    fadetime = level.var_246408e0d4906146.var_5684dc2d43329678 ?? 1;
    assert( fadetime < pinginterval, "<dev string:x46>" );
    expiretime = level.var_246408e0d4906146.var_c2cbb198af8df985 ?? 25;
    var_bfad811bac7c2ef3 = 100;
    radarstrength = 6;
    self.var_5d1b8f6d96fc0127 = self.var_5d1b8f6d96fc0127 ?? [];
    
    if ( var_1c66fc2ea253c2a4 )
    {
        self.var_236adc9556c1eb4f = outline::outlineenableforteam( self, enemyowner.team, "sensor_grenade", "equipment" );
        
        foreach ( p in level.players )
        {
            if ( !isbot( p ) && p.team == enemyowner.team )
            {
                p hud_management::function_437d5e32e42a61bb( self, "sensor_grenade", "scripted_widget_sensor_scanner_box", "scripted_widget_bounding_box" );
                p hud_management::function_57aa7da905b51106( self, "sensor_grenade", "Show" );
                self.var_5d1b8f6d96fc0127[ self.var_5d1b8f6d96fc0127.size ] = enemyowner;
                self.var_4193d1557ef26d9[ p getentitynumber() ] = gettime();
            }
        }
    }
    else
    {
        self.var_236adc9556c1eb4f = outline::outlineenableforplayer( self, enemyowner, "sensor_grenade", "equipment" );
        enemyowner hud_management::function_437d5e32e42a61bb( self, "sensor_grenade", "scripted_widget_sensor_scanner_box", "scripted_widget_bounding_box" );
        enemyowner hud_management::function_57aa7da905b51106( self, "sensor_grenade", "Show" );
        self.var_5d1b8f6d96fc0127[ self.var_5d1b8f6d96fc0127.size ] = enemyowner;
        self.var_4193d1557ef26d9[ enemyowner getentitynumber() ] = gettime();
    }
    
    if ( isplayer( self ) )
    {
        thread function_bc1dac655511336a();
    }
    
    do
    {
        time += pinginterval;
        
        if ( var_1c66fc2ea253c2a4 )
        {
            triggerportableradarpingteam( self.origin, enemyowner.team, radius, var_bfad811bac7c2ef3, radarstrength, fadetime );
        }
        else
        {
            triggerportableradarping( self.origin, enemyowner, radius, var_bfad811bac7c2ef3, "", fadetime, 1, 0 );
        }
        
        wait pinginterval;
    }
    while ( time < expiretime );
    
    thread function_3bf4718ff3decfd1();
}

// Namespace sensor_grenade
// Params 1
// Checksum 0xfa46f7ce, Offset: 0x184f
// Size: 0xbe
function function_8eb8e1017f2c6ec4( params )
{
    if ( isdefined( self.var_2da4c4b5ebd5dacf ) )
    {
        foreach ( var_5421c1b269d4086 in self.var_2da4c4b5ebd5dacf )
        {
            if ( isdefined( var_5421c1b269d4086 ) )
            {
                var_5421c1b269d4086 thread function_e57bc3a05e301372( undefined );
            }
        }
        
        self.var_2da4c4b5ebd5dacf = undefined;
    }
    
    self.var_4f13010847a7dc86 = undefined;
    self.var_c9b559b555a97062 = undefined;
    function_b6df3ff4411c07b5();
}

// Namespace sensor_grenade
// Params 0, eflags: 0xc
// Checksum 0x2bd2d63a, Offset: 0x1915
// Size: 0x14f
function private function_bc1dac655511336a()
{
    self notify( "f716fff74d4ac70a" );
    self endon( "f716fff74d4ac70a" );
    level endon( "game_ended" );
    self endon( "death_or_disconnect" );
    val::set( "sensor_grenade", "weapon_pickup", 0 );
    var_a2b0f8f03b5f6a5b = ( level.var_246408e0d4906146.var_3de9e95b8d3e2a2e ?? 0.15 ) * 1000;
    function_89ec89458bb0f955( var_a2b0f8f03b5f6a5b );
    var_f8c5b357c370c3c = 0;
    var_55138ba7de9f38ec = undefined;
    
    while ( self.var_4f13010847a7dc86 )
    {
        currtime = gettime();
        
        if ( self usebuttonpressed() )
        {
            if ( !isdefined( var_55138ba7de9f38ec ) )
            {
                var_55138ba7de9f38ec = currtime;
            }
        }
        else
        {
            var_55138ba7de9f38ec = undefined;
        }
        
        if ( var_55138ba7de9f38ec && currtime - var_55138ba7de9f38ec >= var_a2b0f8f03b5f6a5b )
        {
            var_f8c5b357c370c3c = 1;
            thread utility::function_72b6372d2d8c997( "sat_sensor_grenade_tracker_mp" );
            self setmovespeedscale( level.var_246408e0d4906146.var_6bcae2700676d81f ?? 0.5 );
            break;
        }
        
        waitframe();
    }
    
    val::reset( "sensor_grenade", "weapon_pickup" );
    
    if ( var_f8c5b357c370c3c )
    {
        thread points::doscoreevent( #"hash_5760954f61b40374" );
        self playlocalsound( "eqp_sensor_grenade_remove" );
        wait 1;
        wait 0.5;
        self setmovespeedscale( 1 );
    }
    
    if ( self.var_4f13010847a7dc86 )
    {
        thread function_3bf4718ff3decfd1();
    }
}

// Namespace sensor_grenade
// Params 1
// Checksum 0xb1057e9a, Offset: 0x1a6c
// Size: 0x62
function function_5e24153695eb428c( params )
{
    if ( isdefined( self.var_f28dc2b29553a25a ) )
    {
        utility::array_delete( self.var_f28dc2b29553a25a );
        self.var_f28dc2b29553a25a = undefined;
    }
    
    if ( self.var_4f13010847a7dc86 )
    {
        thread function_3bf4718ff3decfd1();
        self setmovespeedscale( 1 );
        val::reset( "sensor_grenade", "weapon_pickup" );
    }
}

// Namespace sensor_grenade
// Params 1, eflags: 0x4
// Checksum 0xc3ee83de, Offset: 0x1ad6
// Size: 0xaf
function private function_6f3169943c92d4a9( entityid )
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    
    if ( !isdefined( self.var_9e04ae6a697e6bc6 ) )
    {
        self.var_9e04ae6a697e6bc6 = [];
    }
    
    if ( !isdefined( self.var_9e04ae6a697e6bc6[ entityid ] ) )
    {
        self.var_9e04ae6a697e6bc6[ entityid ] = 0;
    }
    
    self.var_9e04ae6a697e6bc6[ entityid ]++;
    var_63fc69cc254ed6b5 = self.var_9e04ae6a697e6bc6[ entityid ];
    
    if ( var_63fc69cc254ed6b5 == 2 )
    {
        self.modifiers[ "wasSecondSensorGrenadeKill" ] = 1;
    }
    
    wait 2;
    
    if ( self.var_9e04ae6a697e6bc6[ entityid ] == var_63fc69cc254ed6b5 )
    {
        self.var_9e04ae6a697e6bc6[ entityid ] = undefined;
    }
}

// Namespace sensor_grenade
// Params 1
// Checksum 0x6693e521, Offset: 0x1b8d
// Size: 0x142
function function_38cf8364e4d8e652( params )
{
    var_4f13010847a7dc86 = params.victim.var_4f13010847a7dc86;
    
    if ( var_4f13010847a7dc86.enemyowner )
    {
        self.modifiers[ "wasSpottedBySensorGrenadeTracker" ] = var_4f13010847a7dc86;
        
        if ( self == var_4f13010847a7dc86.enemyowner )
        {
            self.modifiers[ "wasSpottedBySensorGrenade" ] = 1;
            thread function_6f3169943c92d4a9( var_4f13010847a7dc86.entityid );
            return;
        }
        
        if ( !player_utility::playersareenemies( var_4f13010847a7dc86.enemyowner, self ) )
        {
            if ( !isdefined( self.modifiers[ "wasSpottedByAnotherSensorGrenadeList" ] ) )
            {
                self.modifiers[ "wasSpottedByAnotherSensorGrenadeList" ] = [];
            }
            
            if ( !function_978bde7975eb37( self.modifiers[ "wasSpottedByAnotherSensorGrenadeList" ], var_4f13010847a7dc86.enemyowner ) )
            {
                var_32687339cd7ffa62 = spawnstruct();
                var_32687339cd7ffa62.player = var_4f13010847a7dc86.enemyowner;
                var_32687339cd7ffa62.var_dcf500678d35ab56 = var_4f13010847a7dc86.weaponobj;
                self.modifiers[ "wasSpottedByAnotherSensorGrenadeList" ][ self.modifiers[ "wasSpottedByAnotherSensorGrenadeList" ].size ] = var_32687339cd7ffa62;
            }
        }
    }
}

// Namespace sensor_grenade
// Params 1
// Checksum 0x77e3b8b5, Offset: 0x1cd7
// Size: 0x105
function function_6d7acbafb1f4d32d( params )
{
    if ( self.modifiers[ "wasSpottedBySensorGrenade" ] )
    {
        thread points::doscoreevent( #"hash_22f58dfc42f76fff", self.modifiers[ "wasSpottedBySensorGrenadeTracker" ].weaponobj );
        
        if ( self.modifiers[ "wasSecondSensorGrenadeKill" ] )
        {
            thread points::doscoreevent( #"double_prox_alarm" );
        }
    }
    
    foreach ( struct in self.modifiers[ "wasSpottedByAnotherSensorGrenadeList" ] )
    {
        struct.player thread points::doscoreevent( #"hash_e935d9231c8357cc", struct.var_dcf500678d35ab56 );
    }
}

// Namespace sensor_grenade
// Params 2
// Checksum 0x3bb65e83, Offset: 0x1de4
// Size: 0x93, Type: bool
function function_978bde7975eb37( structarray, targetplayer )
{
    foreach ( struct in structarray )
    {
        if ( struct.player == targetplayer )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace sensor_grenade
// Params 1
// Checksum 0xb2e444f8, Offset: 0x1e80
// Size: 0xc8
function function_f8c34291459a2ba0( params )
{
    if ( isdefined( self.var_f28dc2b29553a25a ) )
    {
        utility::array_delete( self.var_f28dc2b29553a25a );
        self.var_f28dc2b29553a25a = undefined;
    }
    
    if ( self.var_2da4c4b5ebd5dacf )
    {
        foreach ( var_5421c1b269d4086 in self.var_2da4c4b5ebd5dacf )
        {
            if ( var_5421c1b269d4086 )
            {
                var_5421c1b269d4086 thread function_e57bc3a05e301372( undefined );
            }
        }
        
        self.var_2da4c4b5ebd5dacf = undefined;
    }
}

// Namespace sensor_grenade
// Params 1, eflags: 0x4
// Checksum 0xf0849918, Offset: 0x1f50
// Size: 0x40
function private function_572a58d98cd7d56c( deathdata )
{
    var_4f13010847a7dc86 = deathdata.victim.var_4f13010847a7dc86;
    
    if ( !isdefined( var_4f13010847a7dc86 ) )
    {
        return;
    }
    
    self.var_95a789937b05993d = 1;
}

// Namespace sensor_grenade
// Params 1
// Checksum 0x59fe5d80, Offset: 0x1f98
// Size: 0x23c
function function_6296632a2be939ef( params )
{
    if ( isarray( self.var_30656af96b2ac2a4 ) )
    {
        self.var_30656af96b2ac2a4[ self.var_30656af96b2ac2a4.size ] = params.var_39a25939271f4d6a;
        
        if ( !self.var_2695e71ddf32816c[ params.var_39a25939271f4d6a.owner getentitynumber() ] )
        {
            basepoints = rank::getscoreinfovalue( #"hash_8133aa87520f50f6" ) ?? 0;
            params.var_39a25939271f4d6a.owner thread points::doscoreevent( #"hash_8133aa87520f50f6", params.var_39a25939271f4d6a.weapon_object, basepoints * params.var_39a25939271f4d6a.var_352099d9d2836866 );
            
            if ( !isdefined( self.var_2695e71ddf32816c ) )
            {
                self.var_2695e71ddf32816c = [];
            }
            
            self.var_2695e71ddf32816c[ params.var_39a25939271f4d6a.owner getentitynumber() ] = 1;
        }
        
        if ( params.var_39a25939271f4d6a.owner != self.owner && !self.var_2b2f786d6b12c032 )
        {
            self.owner thread points::doscoreevent( #"hash_25e1629f3588e56f", params.var_39a25939271f4d6a.weapon_object );
            self.var_2b2f786d6b12c032 = 1;
        }
        
        if ( self.var_30656af96b2ac2a4.size == 1 )
        {
            self.var_34d5be132068dd5 = params.bundle.var_e8ed71e7337d6be5 ?? 100;
            self.var_31b2148b669e7beb = params.bundle.var_d4d519984831ed7b ?? 100;
            self.var_4c8db6072e69d191 = params.bundle.var_be18e85d3d3c1f9c ?? 0;
            
            if ( isdefined( self.headiconid ) && isdefined( level.var_246408e0d4906146.var_171b9865909c4339 ) )
            {
                setheadiconimage( self.headiconid, level.var_246408e0d4906146.var_171b9865909c4339 );
            }
        }
    }
}

// Namespace sensor_grenade
// Params 1
// Checksum 0xff26f72a, Offset: 0x21dc
// Size: 0xca
function function_836769537343f47e( params )
{
    if ( isarray( self.var_30656af96b2ac2a4 ) )
    {
        if ( arraycontains( self.var_30656af96b2ac2a4, params.var_39a25939271f4d6a ) )
        {
            self.var_30656af96b2ac2a4 = arrayremove( self.var_30656af96b2ac2a4, params.var_39a25939271f4d6a );
            
            if ( self.var_30656af96b2ac2a4.size <= 0 )
            {
                self.var_34d5be132068dd5 = undefined;
                self.var_31b2148b669e7beb = undefined;
                self.var_4c8db6072e69d191 = undefined;
                
                if ( isdefined( self.headiconid ) && isdefined( level.gamemodebundle.var_b96d2dfbabc4742d ) )
                {
                    setheadiconimage( self.headiconid, level.gamemodebundle.var_b96d2dfbabc4742d );
                }
            }
        }
    }
}

// Namespace sensor_grenade
// Params 1
// Checksum 0xf6e0461e, Offset: 0x22ae
// Size: 0x4c
function function_c86d6d93256453b1( damagedata )
{
    attackingplayer = function_a4855afcb04f541d( damagedata.attacker, self );
    
    if ( !isdefined( attackingplayer ) )
    {
        return 0;
    }
    
    attackingplayer thread damagefeedback::updatedamagefeedback( "hitequip" );
    return damagedata.damage;
}

// Namespace sensor_grenade
// Params 2
// Checksum 0x8bcce2e1, Offset: 0x2303
// Size: 0x224
function function_e57bc3a05e301372( damagedata, isexpired )
{
    self notify( "deb19228dd1e09eb" );
    self endon( "deb19228dd1e09eb" );
    
    if ( self && !self.isdying )
    {
        self.isdying = 1;
        var_cf756a18e7bb1d87 = self getentitynumber();
        utility::callsharedfunc( #"hash_d8976e21a6adafba", #"hash_c33ceb91d0ca7a9d", self );
        
        foreach ( ent in self.var_76d4515a04d0ef12 )
        {
            if ( isdefined( ent.var_f28dc2b29553a25a[ var_cf756a18e7bb1d87 ] ) )
            {
                ent.var_f28dc2b29553a25a[ var_cf756a18e7bb1d87 ] delete();
                ent.var_f28dc2b29553a25a[ var_cf756a18e7bb1d87 ] = undefined;
            }
            
            ent.var_1f4aa153cbdc3919 = 0;
        }
        
        if ( isdefined( self.headiconid ) )
        {
            entityheadicons::setheadicon_deleteicon( self.headiconid );
        }
        
        if ( isdefined( damagedata.attacker ) )
        {
            attackingplayer = function_a4855afcb04f541d( damagedata.attacker, self );
            
            if ( isdefined( attackingplayer ) && attackingplayer != self.owner )
            {
                attackingplayer thread points::doscoreevent( #"hash_fc2bc69127096d9e", damagedata.objweapon );
            }
        }
        
        self notify( "death" );
        
        if ( weapon::function_89d2d0588f2def25() )
        {
            weapon::function_4b531bff921831ff();
        }
        
        if ( isexpired )
        {
            self setscriptablepartstate( #"visual", #"expired" );
        }
        else
        {
            self setscriptablepartstate( #"visual", #"explode" );
        }
        
        self setscriptablepartstate( #"model_visibility", #"hidden" );
        self setscriptablepartstate( #"sfx", #"idle_beep_off" );
        wait 1;
        
        if ( isdefined( self ) )
        {
            self delete();
        }
    }
}

// Namespace sensor_grenade
// Params 0, eflags: 0xc
// Checksum 0xa71af9a6, Offset: 0x252f
// Size: 0x60
function private function_3bf4718ff3decfd1()
{
    self notify( "52dae6c5d9aab12" );
    self endon( "52dae6c5d9aab12" );
    self notify( "sensor_grenade_tracker_destroyed" );
    function_7d6f910182fa3a90();
    function_b6df3ff4411c07b5();
    namespace_23c79201421792eb::function_edb43d25c7bd56c6( self, self.var_4f13010847a7dc86.weaponobj, self.var_4f13010847a7dc86.entityid );
    self.var_4f13010847a7dc86 = undefined;
}

// Namespace sensor_grenade
// Params 1, eflags: 0x4
// Checksum 0x2a570bd8, Offset: 0x2597
// Size: 0xe2
function private function_77c9d10aba0f79b7( target )
{
    if ( !isdefined( target ) )
    {
        return 0;
    }
    
    tracecontents = trace::create_contents( 0, 1, 0, 0, 1, 1, 0, 0 );
    defaultorigin = target.origin;
    tracepoints = [ defaultorigin ];
    headpos = target utility::function_f02ebab438642e16();
    centerpos = target utility::function_68061c3d21a6d57a();
    tracepoints = [ centerpos, headpos, defaultorigin ];
    ignorelist = [ self, target ];
    
    for ( i = 0; i < tracepoints.size ; i++ )
    {
        if ( !trace::ray_trace_passed( self.origin, tracepoints[ i ], ignorelist, tracecontents ) )
        {
            continue;
        }
        
        return tracepoints[ i ];
    }
    
    return undefined;
}

// Namespace sensor_grenade
// Params 2, eflags: 0x4
// Checksum 0x9c7c9ec6, Offset: 0x2682
// Size: 0x83
function private function_a4855afcb04f541d( attacker, instance )
{
    attackingplayer = undefined;
    
    if ( isplayer( attacker ) )
    {
        attackingplayer = attacker;
    }
    else if ( isplayer( attacker.owner ) )
    {
        attackingplayer = attacker.owner;
    }
    
    if ( !( isdefined( attackingplayer ) && isdefined( instance.owner ) ) )
    {
        return undefined;
    }
    
    if ( weapons::friendlyfirecheck( instance.owner, attackingplayer ) )
    {
        return attackingplayer;
    }
    
    return undefined;
}

// Namespace sensor_grenade
// Params 0, eflags: 0x4
// Checksum 0x44a591ed, Offset: 0x270e
// Size: 0xc0
function private function_b6df3ff4411c07b5()
{
    if ( isdefined( self.var_236adc9556c1eb4f ) )
    {
        outline::outlinedisable( self.var_236adc9556c1eb4f, self );
        self.var_236adc9556c1eb4f = undefined;
    }
    
    if ( isdefined( self.var_5d1b8f6d96fc0127 ) )
    {
        foreach ( p in self.var_5d1b8f6d96fc0127 )
        {
            p hud_management::function_62aba896177e2f50( self, "sensor_grenade" );
        }
        
        self.var_5d1b8f6d96fc0127 = undefined;
    }
}

// Namespace sensor_grenade
// Params 2
// Checksum 0x60aa96e7, Offset: 0x27d6
// Size: 0x181
function function_bd14d76144577d07( hackeffect, attacker )
{
    self notify( "grenade_hacked" );
    
    if ( !hackeffect.var_30e7de3d76d5a085 )
    {
        return;
    }
    
    self.owner thread equipment_utility::function_364a1a0e0c018518( self.equipmentref, #"hash_baf1458ef81f3e1f" );
    self.owner = attacker;
    self.team = attacker.team;
    self setentityowner( attacker );
    self setotherent( attacker );
    var_cf756a18e7bb1d87 = self getentitynumber();
    
    if ( self.var_76d4515a04d0ef12 )
    {
        foreach ( ent in self.var_76d4515a04d0ef12 )
        {
            self.var_76d4515a04d0ef12 = arrayremove( self.var_76d4515a04d0ef12, ent );
            ent.var_1f4aa153cbdc3919 = 0;
        }
    }
    
    self setscriptablepartstate( #"hacked", #"stolen", 0 );
    thread function_9d2caa8f2bea4fb2( attacker );
    thread function_4d8212cd28dca85c( attacker );
    
    if ( level.teambased )
    {
        self filteroutplayermarks( attacker.team );
        return;
    }
    
    self filteroutplayermarks( attacker );
}

// Namespace sensor_grenade
// Params 1
// Checksum 0xd29e19ad, Offset: 0x295f
// Size: 0x15
function function_4db53a5fbf77074a( empstruct )
{
    thread function_e57bc3a05e301372( empstruct );
}

// Namespace sensor_grenade
// Params 1
// Checksum 0xf4842a3e, Offset: 0x297c
// Size: 0x53
function function_498767fdd7c6b823( grenade )
{
    if ( grenade && !grenade.isdying )
    {
        grenade setscriptablepartstate( #"visual", #"jammed" );
        grenade setscriptablepartstate( #"sfx", #"idle_beep_off" );
    }
}

// Namespace sensor_grenade
// Params 1
// Checksum 0x454b6c51, Offset: 0x29d7
// Size: 0x4e
function function_d3e471ee2ed15a11( grenade )
{
    if ( grenade && !grenade.isdying )
    {
        grenade setscriptablepartstate( #"visual", #"visible" );
        grenade thread function_9d2caa8f2bea4fb2( grenade.owner );
    }
}

// Namespace sensor_grenade
// Params 2, eflags: 0x4
// Checksum 0x574c54c1, Offset: 0x2a2d
// Size: 0x51
function private function_4d438c9d0219d9e2( player, hintent )
{
    hintent endon( "death" );
    level endon( "game_ended" );
    
    while ( true )
    {
        level waittill( "connected", p );
        
        if ( p != player )
        {
            hintent disableplayeruse( p );
        }
    }
}

// Namespace sensor_grenade
// Params 1, eflags: 0x4
// Checksum 0xc99e86, Offset: 0x2a86
// Size: 0xe3
function private function_89ec89458bb0f955( var_87996cb8dd74f9ee )
{
    if ( isbot( self ) )
    {
        return;
    }
    
    if ( !self.var_8f89350e2cbd8c50 )
    {
        fov = 360;
        range = 100;
        hintent = spawn( "script_origin", self.origin );
        hintent linkto( self, "tag_origin" );
        hintent makeusable();
        hintent sethintstring( &"sat_equipment/sensor_grenade_remove" );
        hintent sethintonobstruction( "show" );
        hintent sethintdisplayfov( fov );
        hintent setusefov( fov );
        hintent sethintdisplayrange( range );
        hintent setuserange( range );
        hintent setusepriority( -4 );
        hintent disableplayeruseforallplayers();
        hintent enableplayeruse( self );
        
        if ( var_87996cb8dd74f9ee )
        {
            hintent setuseholdduration( var_87996cb8dd74f9ee );
        }
        
        thread function_4d438c9d0219d9e2( self, hintent );
        self.var_8f89350e2cbd8c50 = hintent;
    }
}

// Namespace sensor_grenade
// Params 0, eflags: 0x4
// Checksum 0x8998284b, Offset: 0x2b71
// Size: 0x3e
function private function_7d6f910182fa3a90()
{
    if ( self.var_8f89350e2cbd8c50 && !self.var_8f89350e2cbd8c50.isdestroyed )
    {
        self.var_8f89350e2cbd8c50 delete();
        self.var_8f89350e2cbd8c50 = undefined;
    }
}

