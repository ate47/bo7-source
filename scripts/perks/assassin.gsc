#using scripts\common\callbacks;
#using scripts\mp\objidpoolmanager;

#namespace assassin;

// Namespace assassin
// Params 0, eflags: 0x1
// Checksum 0xc09125e1, Offset: 0x11e
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &function_f31ce4140ed08fc2 );
}

// Namespace assassin
// Params 1
// Checksum 0x42c5f2b5, Offset: 0x13e
// Size: 0x7c
function function_f31ce4140ed08fc2( params )
{
    bundle = level.perkbundles[ "specialty_assassin" ];
    
    if ( !isdefined( bundle ) )
    {
        return;
    }
    
    if ( !function_c28ff33f9f675615() )
    {
        function_79901b4637c83c86( #"hash_4b9f86862ac484d8" );
        return;
    }
    
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_assassin", &function_d25f0a88b6ad8cfb, &function_40ee281a0bcad3da, undefined, &function_40b6718a73ecd549 );
    }
}

// Namespace assassin
// Params 0
// Checksum 0xce51e5ee, Offset: 0x1c2
// Size: 0x9f
function function_40b6718a73ecd549()
{
    bundle = level.perkbundles[ "specialty_assassin" ];
    level.var_6f47ece75eebb413 = spawnstruct();
    level_info = level.var_6f47ece75eebb413;
    assert( isstruct( level_info ) );
    level_info.assassins = [];
    level_info.var_2234d19645305f7b = [];
    level_info.bundle = bundle;
    level_info.var_7cf5f5c633c1bf5a = { #objids:[] };
    callback::add( #"player_death", &function_2b88207bac0c9236 );
}

// Namespace assassin
// Params 0
// Checksum 0x9cdde44f, Offset: 0x269
// Size: 0x5d
function function_d25f0a88b6ad8cfb()
{
    level_info = level.var_6f47ece75eebb413;
    
    if ( !isdefined( level_info ) )
    {
        return;
    }
    
    var_b64cad84f5b9226d = level_info.assassins.size == 0;
    level_info.assassins[ self getentitynumber() ] = self;
    
    if ( var_b64cad84f5b9226d )
    {
        function_87941df9d391c5bf();
    }
    
    function_28654279ff13d2d7();
}

// Namespace assassin
// Params 0
// Checksum 0x3c3aa907, Offset: 0x2ce
// Size: 0x37
function function_40ee281a0bcad3da()
{
    level_info = level.var_6f47ece75eebb413;
    
    if ( !isdefined( level_info ) )
    {
        return;
    }
    
    level_info.assassins[ self getentitynumber() ] = undefined;
    function_abb054b2a5bbd34f();
}

// Namespace assassin
// Params 1
// Checksum 0x2a2304a5, Offset: 0x30d
// Size: 0x17d
function function_2b88207bac0c9236( deathdata )
{
    level_info = level.var_6f47ece75eebb413;
    
    if ( level_info.assassins.size == 0 )
    {
        return;
    }
    
    attacker = deathdata.attacker;
    
    if ( !isplayer( attacker ) )
    {
        return;
    }
    
    victim = deathdata.victim;
    
    if ( !isplayer( victim ) )
    {
        return;
    }
    
    if ( attacker == victim )
    {
        return;
    }
    
    if ( attacker.killcountthislife >= level_info.bundle.var_941c09a372f0c22e )
    {
        function_704d402fd2e0b1d1( attacker );
    }
    
    var_4ce87cc797f1469d = victim getentitynumber();
    
    if ( isdefined( level_info.var_2234d19645305f7b[ var_4ce87cc797f1469d ] ) )
    {
        if ( isdefined( level_info.assassins[ attacker getentitynumber() ] ) )
        {
            bundle = level_info.bundle;
            model = attacker function_280dbc267d75edb4( bundle, victim.killcountthislife );
            
            if ( isdefined( model ) )
            {
                victim function_c9bd2a221c741448( attacker, model );
            }
            
            if ( isxhash( bundle.var_d49ae350912bd88a ) )
            {
                var_dbd43a8b925f566f = level.sharedfuncs[ #"player" ][ #"doScoreEvent" ];
                
                if ( isdefined( var_dbd43a8b925f566f ) )
                {
                    attacker thread [[ var_dbd43a8b925f566f ]]( bundle.var_d49ae350912bd88a );
                }
            }
        }
        
        function_5c2bcbf1d014e0c6( var_4ce87cc797f1469d );
    }
}

// Namespace assassin
// Params 0
// Checksum 0xddcc4c5e, Offset: 0x492
// Size: 0x131
function function_28654279ff13d2d7()
{
    level_info = level.var_6f47ece75eebb413;
    
    if ( level_info.var_2234d19645305f7b.size == 0 )
    {
        return;
    }
    
    var_5956efc838d66a3a = level.sharedfuncs[ #"objective" ][ #"showtoplayer" ];
    
    if ( isdefined( var_5956efc838d66a3a ) )
    {
        var_d28790844c2fb396 = self.team;
        
        foreach ( var_6a126a0c16dbb5ea in level_info.var_2234d19645305f7b )
        {
            if ( !isplayer( var_6a126a0c16dbb5ea ) )
            {
                continue;
            }
            
            if ( var_d28790844c2fb396 == var_6a126a0c16dbb5ea.team )
            {
                continue;
            }
            
            var_b0947f2c9c0c3701 = level_info.var_7cf5f5c633c1bf5a.objids[ var_6a126a0c16dbb5ea getentitynumber() ];
            
            if ( !isdefined( var_b0947f2c9c0c3701 ) )
            {
                continue;
            }
            
            [[ var_5956efc838d66a3a ]]( var_b0947f2c9c0c3701, self );
        }
    }
}

// Namespace assassin
// Params 0
// Checksum 0xdede3959, Offset: 0x5cb
// Size: 0x10a
function function_abb054b2a5bbd34f()
{
    level_info = level.var_6f47ece75eebb413;
    
    if ( level_info.var_2234d19645305f7b.size == 0 )
    {
        return;
    }
    
    var_560f3d69cba3cac2 = level.sharedfuncs[ #"objective" ][ #"hidefromplayer" ];
    
    if ( isdefined( var_560f3d69cba3cac2 ) )
    {
        foreach ( var_6a126a0c16dbb5ea in level_info.var_2234d19645305f7b )
        {
            if ( !isplayer( var_6a126a0c16dbb5ea ) )
            {
                continue;
            }
            
            var_b0947f2c9c0c3701 = level_info.var_7cf5f5c633c1bf5a.objids[ var_6a126a0c16dbb5ea getentitynumber() ];
            
            if ( !isdefined( var_b0947f2c9c0c3701 ) )
            {
                continue;
            }
            
            [[ var_560f3d69cba3cac2 ]]( var_b0947f2c9c0c3701, self );
        }
    }
}

// Namespace assassin
// Params 0
// Checksum 0xc750c0c4, Offset: 0x6dd
// Size: 0x99
function function_87941df9d391c5bf()
{
    level_info = level.var_6f47ece75eebb413;
    
    foreach ( target in level_info.var_2234d19645305f7b )
    {
        if ( isplayer( target ) )
        {
            function_704d402fd2e0b1d1( target );
        }
    }
}

// Namespace assassin
// Params 1
// Checksum 0x890d85fa, Offset: 0x77e
// Size: 0x1ed
function function_704d402fd2e0b1d1( target )
{
    level_info = level.var_6f47ece75eebb413;
    targetentnum = target getentitynumber();
    
    if ( !isdefined( level_info.var_2234d19645305f7b[ targetentnum ] ) )
    {
        level_info.var_2234d19645305f7b[ targetentnum ] = target;
    }
    
    if ( level_info.assassins.size == 0 )
    {
        return;
    }
    
    if ( isdefined( level_info.var_7cf5f5c633c1bf5a.objids[ targetentnum ] ) )
    {
        return;
    }
    
    var_d099a4b088c802e5 = level.sharedfuncs[ #"game" ][ #"hash_e91bc85197ff5694" ];
    
    if ( isfunction( var_d099a4b088c802e5 ) )
    {
        var_b0947f2c9c0c3701 = target [[ var_d099a4b088c802e5 ]]( level_info.bundle.var_e055cb2cf1ffe249, 1, 1, "icon_regular" );
        level_info.var_7cf5f5c633c1bf5a.objids[ targetentnum ] = var_b0947f2c9c0c3701;
        var_6c42a8f7d5d26fea = level.sharedfuncs[ #"objective" ][ #"hash_8114455fc014da35" ];
        
        if ( isdefined( var_6c42a8f7d5d26fea ) )
        {
            [[ var_6c42a8f7d5d26fea ]]( var_b0947f2c9c0c3701, 1 );
        }
    }
    
    if ( isdefined( var_b0947f2c9c0c3701 ) )
    {
        objidpoolmanager::function_e4d6a71507372662( var_b0947f2c9c0c3701, 0 );
        targetteam = target.team;
        
        foreach ( assassin in level_info.assassins )
        {
            if ( !isplayer( assassin ) )
            {
                continue;
            }
            
            if ( targetteam == assassin.team )
            {
                continue;
            }
            
            objidpoolmanager::objective_playermask_addshowplayer( var_b0947f2c9c0c3701, assassin );
        }
    }
}

// Namespace assassin
// Params 1
// Checksum 0x6dfc950c, Offset: 0x973
// Size: 0xdb
function function_5c2bcbf1d014e0c6( targetentnum )
{
    level_info = level.var_6f47ece75eebb413;
    var_b0947f2c9c0c3701 = level_info.var_7cf5f5c633c1bf5a.objids[ targetentnum ];
    
    if ( isdefined( var_b0947f2c9c0c3701 ) )
    {
        var_84d98283324fa83e = level.sharedfuncs[ #"objective" ][ #"hidefromall" ];
        
        if ( isfunction( var_84d98283324fa83e ) )
        {
            [[ var_84d98283324fa83e ]]( var_b0947f2c9c0c3701 );
        }
        
        var_4bae1d302a2a086a = level.sharedfuncs[ #"game" ][ #"returnobjectiveid" ];
        
        if ( isfunction( var_4bae1d302a2a086a ) )
        {
            [[ var_4bae1d302a2a086a ]]( var_b0947f2c9c0c3701 );
        }
        
        level_info.var_7cf5f5c633c1bf5a.objids[ targetentnum ] = undefined;
    }
    
    level_info.var_2234d19645305f7b[ targetentnum ] = undefined;
}

// Namespace assassin
// Params 2
// Checksum 0x342f97ed, Offset: 0xa56
// Size: 0x6c
function function_c9bd2a221c741448( attacker, model )
{
    bag = spawn( "script_model", self.origin );
    bag setmodel( model );
    bag.angles = ( 0, 0, 0 );
    bag.owner = self;
    bag thread function_24e6ba3bf0515c29( attacker, self );
}

// Namespace assassin
// Params 2
// Checksum 0x84cfa34e, Offset: 0xaca
// Size: 0x159
function function_24e6ba3bf0515c29( attacker, victim )
{
    self endon( "death_or_disconnect" );
    self endon( "bag_timeout" );
    level_info = level.var_6f47ece75eebb413;
    bundle = level_info.bundle;
    self.trigger = spawn( "trigger_radius", self.origin, 0, 36, 36 );
    self showonlytoplayer( attacker );
    thread function_6917ced4c24c6bdb();
    var_ad74393df579cd03 = victim.killcountthislife;
    
    while ( true )
    {
        self.trigger waittill( "trigger", player );
        
        if ( player == attacker )
        {
            self notify( "assassinBag_pickedUp" );
            var_dbd43a8b925f566f = level.sharedfuncs[ #"player" ][ #"doScoreEvent" ];
            
            if ( isdefined( var_dbd43a8b925f566f ) )
            {
                if ( isxhash( bundle.var_527138a550e65fc1 ) )
                {
                    attacker thread [[ var_dbd43a8b925f566f ]]( bundle.var_527138a550e65fc1 );
                }
                
                if ( isxhash( bundle.var_26b3a363aad41e29 ) )
                {
                    var_2b8e8a392ecc38ce = var_ad74393df579cd03 - bundle.var_941c09a372f0c22e;
                    
                    if ( var_2b8e8a392ecc38ce > 0 )
                    {
                        attacker thread function_e5676fdb09f91f17( var_2b8e8a392ecc38ce, bundle, var_dbd43a8b925f566f );
                    }
                }
            }
            
            function_cee7dee0852b4613();
        }
    }
}

// Namespace assassin
// Params 3, eflags: 0x4
// Checksum 0x276b91bc, Offset: 0xc2b
// Size: 0x96
function private function_e5676fdb09f91f17( var_2b8e8a392ecc38ce, bundle, var_dbd43a8b925f566f )
{
    if ( var_2b8e8a392ecc38ce <= 0 )
    {
        return;
    }
    
    self endon( "disconnect" );
    
    for ( i = 0; i < bundle.var_941c09a372f0c22e ; i++ )
    {
        self thread [[ var_dbd43a8b925f566f ]]( bundle.var_26b3a363aad41e29, undefined, 0 );
        waitframe();
        
        if ( !isdefined( self ) )
        {
            return;
        }
    }
    
    for ( i = 0; i < var_2b8e8a392ecc38ce ; i++ )
    {
        self thread [[ var_dbd43a8b925f566f ]]( bundle.var_26b3a363aad41e29 );
        waitframe();
        
        if ( !isdefined( self ) )
        {
            return;
        }
    }
}

// Namespace assassin
// Params 2, eflags: 0x4
// Checksum 0x8597f928, Offset: 0xcc9
// Size: 0x106
function private function_280dbc267d75edb4( bundle, kills )
{
    if ( !isdefined( bundle.var_bae8957cbf51547a ) )
    {
        return undefined;
    }
    
    var_4b7981c564b77 = undefined;
    
    foreach ( packinfo in bundle.var_bae8957cbf51547a )
    {
        if ( isdefined( packinfo.var_4ee8bb58e5eab5c9 ) )
        {
            if ( kills >= packinfo.kills )
            {
                if ( !isdefined( var_4b7981c564b77 ) || var_4b7981c564b77.kills < packinfo.kills )
                {
                    var_4b7981c564b77 = packinfo;
                }
            }
        }
    }
    
    if ( isdefined( var_4b7981c564b77.var_4ee8bb58e5eab5c9 ) )
    {
        return var_4b7981c564b77.var_4ee8bb58e5eab5c9;
    }
    
    return undefined;
}

// Namespace assassin
// Params 0
// Checksum 0xf63e6491, Offset: 0xdd8
// Size: 0x55
function function_6917ced4c24c6bdb()
{
    self endon( "death_or_disconnect" );
    self endon( "assassinBag_pickedUp" );
    bag_lifetime = level.var_6f47ece75eebb413.bundle.var_edfa2af5fe2381b8;
    
    if ( !isdefined( bag_lifetime ) )
    {
        return;
    }
    
    wait bag_lifetime;
    self notify( "bag_timeout" );
    function_cee7dee0852b4613();
}

// Namespace assassin
// Params 0
// Checksum 0xcda2b22, Offset: 0xe35
// Size: 0x16
function function_cee7dee0852b4613()
{
    self.trigger delete();
    self delete();
}

