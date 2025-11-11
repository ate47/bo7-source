#using scripts\common\callbacks;

#namespace operative;

// Namespace operative
// Params 0, eflags: 0x5
// Checksum 0x1e87f408, Offset: 0x175
// Size: 0x18
function private autoexec preinit()
{
    level callback::add( #"register_perk", &function_170395bfa77c95f0 );
}

// Namespace operative
// Params 1
// Checksum 0x7a6553da, Offset: 0x195
// Size: 0x92
function function_170395bfa77c95f0( params )
{
    bundle = level.perkbundles[ "specialty_operative" ];
    
    if ( !isdefined( bundle ) )
    {
        return;
    }
    
    if ( !function_c28ff33f9f675615() )
    {
        function_79901b4637c83c86( #"hash_14c2b22e2eb07d2e" );
        return;
    }
    
    if ( isdefined( params.var_a2358848c4408242 ) )
    {
        level [[ params.var_a2358848c4408242 ]]( "specialty_operative", &setoperative, &unsetoperative, [ "specialty_sixth_sense", "specialty_nodeathicon", "specialty_silentkill" ] );
    }
}

// Namespace operative
// Params 0
// Checksum 0x26f3f5a9, Offset: 0x22f
// Size: 0x114
function setoperative()
{
    self.var_e3b3191ad394eb0d = &function_4ad95061f1e97681;
    
    if ( !self.var_7b49e8c6cc1ac023 )
    {
        return;
    }
    
    bundle = self.var_9842326056fd7207 ?? level.perkbundles[ "specialty_operative" ];
    
    if ( bundle.var_21d58f249be8cb70 )
    {
        return;
    }
    
    if ( !isdefined( self.var_67976ffe7c8ef90b ) )
    {
        self.var_67976ffe7c8ef90b = 0;
        return;
    }
    
    if ( self.var_67976ffe7c8ef90b )
    {
        return;
    }
    
    thread function_fb7a67dca23944ef();
    self notify( "setoperative_outlines" );
    
    if ( self.gettingloadout )
    {
        self endon( "setoperative_outlines" );
        self endon( "death_or_disconnect" );
        self waittill( "giveLoadout" );
    }
    
    setoperativeoutlines();
    var_2c124e2ccc1e8842 = level.sharedfuncs[ #"perk" ][ #"hash_5c931797494661ab" ];
    
    if ( isdefined( var_2c124e2ccc1e8842 ) )
    {
        self [[ var_2c124e2ccc1e8842 ]]( bundle, %"hash_229e9f030260552d" );
    }
    
    buffduration = bundle.var_ceaad80aac12f9e3 ?? 0;
    function_b0064754af8ab8e7( buffduration );
}

// Namespace operative
// Params 0, eflags: 0x4
// Checksum 0xbea21746, Offset: 0x34b
// Size: 0x2c
function private function_fb7a67dca23944ef()
{
    self notify( "resetOperativeSingleton" );
    self endon( "resetOperativeSingleton" );
    self endon( "disconnect" );
    self waittill( "death" );
    self.var_67976ffe7c8ef90b = 0;
}

// Namespace operative
// Params 0
// Checksum 0x45fa467d, Offset: 0x37f
// Size: 0x135
function setoperativeoutlines()
{
    self.var_67976ffe7c8ef90b = 1;
    
    if ( !isdefined( self.var_b312cfcd203c63eb ) )
    {
        self.var_b312cfcd203c63eb = [];
    }
    
    var_6865fca5966be685 = level.sharedfuncs[ #"player" ][ #"isenemy" ];
    
    if ( !isdefined( var_6865fca5966be685 ) )
    {
        return;
    }
    
    var_3e58eb1d414b2ec3 = level.sharedfuncs[ #"outline" ][ #"outlineenableforplayer" ];
    
    if ( !isdefined( var_3e58eb1d414b2ec3 ) )
    {
        return;
    }
    
    self function_cae29f205142cbb();
    
    foreach ( enemy in level.players )
    {
        if ( !isplayer( enemy ) )
        {
            continue;
        }
        
        if ( !self [[ var_6865fca5966be685 ]]( enemy ) )
        {
            continue;
        }
        
        self.var_b312cfcd203c63eb[ enemy getentitynumber() ] = [[ var_3e58eb1d414b2ec3 ]]( enemy, self, "operative_perk", "level_script" );
    }
}

// Namespace operative
// Params 1
// Checksum 0xdc42d7d9, Offset: 0x4bc
// Size: 0x155
function function_b0064754af8ab8e7( delaytime )
{
    if ( !isarray( self.var_b312cfcd203c63eb ) )
    {
        return;
    }
    
    if ( delaytime )
    {
        self endon( "setoperative_outlines" );
        self endon( "death_or_disconnect" );
        wait delaytime;
    }
    
    var_6865fca5966be685 = level.sharedfuncs[ #"player" ][ #"isenemy" ];
    
    if ( !isdefined( var_6865fca5966be685 ) )
    {
        return;
    }
    
    var_9ad5823aef10d35a = level.sharedfuncs[ #"outline" ][ #"outlinedisable" ];
    
    if ( !isdefined( var_9ad5823aef10d35a ) )
    {
        return;
    }
    
    foreach ( enemy in level.players )
    {
        if ( !isplayer( enemy ) )
        {
            continue;
        }
        
        if ( !self [[ var_6865fca5966be685 ]]( enemy ) )
        {
            continue;
        }
        
        enemyentnum = enemy getentitynumber();
        
        if ( !isdefined( self.var_b312cfcd203c63eb[ enemyentnum ] ) )
        {
            continue;
        }
        
        [[ var_9ad5823aef10d35a ]]( self.var_b312cfcd203c63eb[ enemyentnum ], enemy );
    }
}

// Namespace operative
// Params 0
// Checksum 0x702deb50, Offset: 0x619
// Size: 0x6e
function unsetoperative()
{
    function_b0064754af8ab8e7( 0 );
    var_73f2be6e9a6bb5db = level.sharedfuncs[ #"perk" ][ #"hash_672d4e1ac1650080" ];
    
    if ( isdefined( var_73f2be6e9a6bb5db ) )
    {
        bundle = level.perkbundles[ "specialty_operative" ];
        self [[ var_73f2be6e9a6bb5db ]]( bundle, %"hash_31735a8f602d9c32", 0 );
    }
    
    self.var_e3b3191ad394eb0d = undefined;
}

// Namespace operative
// Params 0, eflags: 0x4
// Checksum 0x75325825, Offset: 0x68f
// Size: 0x5b
function private function_4ad95061f1e97681()
{
    var_7e23a6ccf4cd709 = level.sharedfuncs[ #"perk" ][ #"hash_5c931797494661ab" ];
    
    if ( isdefined( var_7e23a6ccf4cd709 ) )
    {
        bundle = level.perkbundles[ "specialty_operative" ];
        self [[ var_7e23a6ccf4cd709 ]]( bundle, %"hash_3a2eafa27caa2162" );
    }
}

