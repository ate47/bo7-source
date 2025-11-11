#using scripts\engine\utility;

#namespace flare_system;

// Namespace flare_system
// Params 0, eflags: 0x1
// Checksum 0x4d529bec, Offset: 0x121
// Size: 0xf2
function autoexec main()
{
    utility::registersharedfunc( #"flare_system", #"defender_init", &defender_init );
    utility::registersharedfunc( #"flare_system", #"hash_bb66c31dec02b91a", &function_c8e5791b1d17b773 );
    utility::registersharedfunc( #"flare_system", #"hash_c402efcb2b8bce33", &function_2147b3e064b6646e );
    utility::registersharedfunc( #"flare_system", #"hash_926d7bf5497212e8", &function_4f3ffbff50ec8655 );
    utility::registersharedfunc( #"flare_system", #"hash_1101719e6ff74ce", &function_66fd13f12a68fa71 );
    utility::registersharedfunc( #"flare_system", #"hash_aa84d9f6a2574574", &function_74bf52055c564baf );
    utility::registersharedfunc( #"flare_system", #"hash_58a53f4881a5cfa7", &function_411ad6c6c718aeea );
    utility::registersharedfunc( #"flare_system", #"hash_93285145eafb4db4", &function_fdbb7d1acba3bf49 );
}

// Namespace flare_system
// Params 6
// Checksum 0x5a80b04a, Offset: 0x21b
// Size: 0x159
function defender_init( numflares, var_ab12a9a4eebfb9bc, var_2ab7104cd7df6e87, canlockon, var_f737c7e70dd29b99, var_9455a1d404771ffc )
{
    assert( numflares >= 0, "<dev string:x24>" );
    assert( var_ab12a9a4eebfb9bc >= 0, "<dev string:x49>" );
    assert( var_2ab7104cd7df6e87 >= 0, "<dev string:x82>" );
    
    if ( !isdefined( canlockon ) )
    {
        canlockon = 1;
    }
    
    self.var_65e07134b0e3df2b = spawnstruct();
    self.var_65e07134b0e3df2b.incomingmissiles = [];
    self.var_65e07134b0e3df2b.var_f786dad007bbe375 = [];
    self.var_65e07134b0e3df2b.numflares = numflares;
    self.var_65e07134b0e3df2b.var_8fa187d5c8db09ff = utility::function_4b74c15943231980( var_ab12a9a4eebfb9bc );
    self.var_65e07134b0e3df2b.var_c845b69f289c8c22 = utility::function_4b74c15943231980( var_2ab7104cd7df6e87 );
    self.var_65e07134b0e3df2b.var_bd957d1ed0892590 = self.var_65e07134b0e3df2b.var_8fa187d5c8db09ff * -1;
    self.var_65e07134b0e3df2b.var_f737c7e70dd29b99 = var_f737c7e70dd29b99;
    self.var_65e07134b0e3df2b.var_9455a1d404771ffc = var_9455a1d404771ffc;
    function_411ad6c6c718aeea( canlockon );
}

// Namespace flare_system
// Params 0
// Checksum 0x2906753, Offset: 0x37c
// Size: 0xf7, Type: bool
function function_66fd13f12a68fa71()
{
    if ( !function_74bf52055c564baf() )
    {
        return false;
    }
    
    self.var_65e07134b0e3df2b.numflares -= 1;
    self.var_65e07134b0e3df2b.var_bd957d1ed0892590 = gettime();
    
    if ( isdefined( self.var_65e07134b0e3df2b.incomingmissiles ) )
    {
        foreach ( missile in self.var_65e07134b0e3df2b.incomingmissiles )
        {
            if ( isdefined( missile ) )
            {
                missile.var_935a78de5fd11f63 = 1;
            }
        }
    }
    
    return true;
}

// Namespace flare_system
// Params 0
// Checksum 0xbb7067c2, Offset: 0x47c
// Size: 0x5f, Type: bool
function function_74bf52055c564baf()
{
    if ( !isdefined( self.var_65e07134b0e3df2b ) )
    {
        return false;
    }
    
    if ( self.var_65e07134b0e3df2b.numflares <= 0 )
    {
        return false;
    }
    
    if ( gettime() - self.var_65e07134b0e3df2b.var_bd957d1ed0892590 < self.var_65e07134b0e3df2b.var_8fa187d5c8db09ff )
    {
        return false;
    }
    
    return true;
}

// Namespace flare_system
// Params 2
// Checksum 0x8c2faaee, Offset: 0x4e4
// Size: 0x8b
function function_bb0e1bf238671c08( attacker, target )
{
    attacker waittill( "death" );
    
    if ( isdefined( target.var_65e07134b0e3df2b ) )
    {
        if ( isdefined( attacker ) )
        {
            target.var_65e07134b0e3df2b.var_f786dad007bbe375[ attacker getentitynumber() ] = undefined;
        }
        
        target.var_65e07134b0e3df2b.var_f786dad007bbe375 = utility::function_8391781ea0784541( target.var_65e07134b0e3df2b.var_f786dad007bbe375, 1 );
        target function_d286548dc279fa03();
    }
}

// Namespace flare_system
// Params 1
// Checksum 0x7664b816, Offset: 0x577
// Size: 0xd9
function function_2147b3e064b6646e( target )
{
    if ( !( isdefined( target ) && isdefined( target.var_65e07134b0e3df2b ) ) )
    {
        return;
    }
    
    target.var_8fbeda1e21b4eff7 = gettime() + 100;
    num = self getentitynumber();
    
    if ( !isdefined( target.var_65e07134b0e3df2b.var_f786dad007bbe375[ num ] ) )
    {
        if ( target.var_65e07134b0e3df2b.var_9455a1d404771ffc )
        {
            target [[ target.var_65e07134b0e3df2b.var_9455a1d404771ffc ]]( { #attacker:self } );
        }
        
        target.var_65e07134b0e3df2b.var_f786dad007bbe375[ num ] = self;
        level thread function_bb0e1bf238671c08( self, target );
        target function_d286548dc279fa03();
        target thread function_5ab0b6304bcbb141( self );
    }
}

// Namespace flare_system
// Params 1
// Checksum 0xd26847c1, Offset: 0x658
// Size: 0x8d
function function_5ab0b6304bcbb141( attacker )
{
    while ( true )
    {
        wait 0.1;
        
        if ( !isdefined( self ) )
        {
            break;
        }
        
        if ( self.var_8fbeda1e21b4eff7 < gettime() )
        {
            if ( isdefined( attacker ) )
            {
                self.var_65e07134b0e3df2b.var_f786dad007bbe375[ attacker getentitynumber() ] = undefined;
            }
            
            self.var_65e07134b0e3df2b.var_f786dad007bbe375 = utility::function_8391781ea0784541( self.var_65e07134b0e3df2b.var_f786dad007bbe375, 1 );
            function_d286548dc279fa03();
            break;
        }
    }
}

// Namespace flare_system
// Params 0
// Checksum 0xf188a59f, Offset: 0x6ed
// Size: 0x219
function function_d286548dc279fa03()
{
    target = self;
    
    if ( !isdefined( target ) )
    {
        return;
    }
    
    if ( target.var_65e07134b0e3df2b.var_f737c7e70dd29b99 )
    {
        return;
    }
    
    target function_aa0f7d41f9300884();
    var_2c88b2ef0206496a = target.owner;
    
    if ( !target.var_65e07134b0e3df2b.canlockon )
    {
        if ( isdefined( var_2c88b2ef0206496a ) )
        {
            var_2c88b2ef0206496a setclientomnvarbit( "ui_veh_warning", 2, 0 );
            var_2c88b2ef0206496a setclientomnvarbit( "ui_veh_warning", 4, 0 );
        }
        
        return;
    }
    
    target.var_65e07134b0e3df2b.incomingmissiles = function_f943bef551ff028c( target.var_65e07134b0e3df2b.incomingmissiles );
    target.var_65e07134b0e3df2b.var_f786dad007bbe375 = utility::function_8391781ea0784541( target.var_65e07134b0e3df2b.var_f786dad007bbe375, 1 );
    
    if ( target.var_65e07134b0e3df2b.var_432f3791a903498c )
    {
        if ( isdefined( var_2c88b2ef0206496a ) )
        {
            var_2c88b2ef0206496a setclientomnvarbit( "ui_veh_warning", 2, 0 );
            var_2c88b2ef0206496a setclientomnvarbit( "ui_veh_warning", 4, 0 );
        }
        
        return;
    }
    
    if ( target.var_65e07134b0e3df2b.incomingmissiles.size > 0 )
    {
        if ( isdefined( var_2c88b2ef0206496a ) )
        {
            var_2c88b2ef0206496a setclientomnvarbit( "ui_veh_warning", 2, 0 );
            var_2c88b2ef0206496a setclientomnvarbit( "ui_veh_warning", 4, 1 );
        }
        
        bundle = level.streakglobals.streakbundles[ target.streakname ];
        target function_e4f9ad0087c2288e( bundle.var_f68b92309b8fbad0 ?? "missile_incoming" );
        return;
    }
    
    if ( target.var_65e07134b0e3df2b.var_f786dad007bbe375.size > 0 )
    {
        if ( isdefined( var_2c88b2ef0206496a ) )
        {
            var_2c88b2ef0206496a setclientomnvarbit( "ui_veh_warning", 2, 0 );
            var_2c88b2ef0206496a setclientomnvarbit( "ui_veh_warning", 4, 0 );
        }
        
        return;
    }
    
    if ( isdefined( var_2c88b2ef0206496a ) )
    {
        var_2c88b2ef0206496a setclientomnvarbit( "ui_veh_warning", 2, 0 );
        var_2c88b2ef0206496a setclientomnvarbit( "ui_veh_warning", 4, 0 );
    }
}

// Namespace flare_system
// Params 1
// Checksum 0xd8eab7e9, Offset: 0x90e
// Size: 0xbf
function function_c8e5791b1d17b773( target )
{
    if ( isarray( target ) )
    {
        assert( "<dev string:xc6>" );
        return #"hash_c0575d063210ca41";
    }
    
    if ( !isdefined( target ) )
    {
        return #"hash_c0575d063210ca41";
    }
    
    if ( !target.var_65e07134b0e3df2b )
    {
        return #"lockon_success";
    }
    
    if ( !target.var_65e07134b0e3df2b.canlockon )
    {
        return #"hash_c0575d063210ca41";
    }
    
    if ( gettime() - target.var_65e07134b0e3df2b.var_bd957d1ed0892590 < target.var_65e07134b0e3df2b.var_c845b69f289c8c22 )
    {
        return #"hash_c0575d063210ca41";
    }
    
    return #"lockon_success";
}

// Namespace flare_system
// Params 1
// Checksum 0x12c16a61, Offset: 0x9d6
// Size: 0x6b
function function_e4f9ad0087c2288e( soundname )
{
    self.alarm_model = spawn( "script_origin", self.origin );
    self.alarm_model linkto( self );
    self.alarm_model hide();
    self.alarm_model showtoplayer( self.owner );
    self.alarm_model playloopsound( soundname );
}

// Namespace flare_system
// Params 0
// Checksum 0x2e818f70, Offset: 0xa49
// Size: 0x2b
function function_aa0f7d41f9300884()
{
    if ( isdefined( self.alarm_model ) )
    {
        self.alarm_model stoploopsound();
        self.alarm_model delete();
    }
}

// Namespace flare_system
// Params 2
// Checksum 0xbb3d4b40, Offset: 0xa7c
// Size: 0x97
function function_4f3ffbff50ec8655( missile, target )
{
    if ( !( isdefined( missile ) && isdefined( self ) && isdefined( target.var_65e07134b0e3df2b ) ) )
    {
        return;
    }
    
    target.var_65e07134b0e3df2b.incomingmissiles[ missile getentitynumber() ] = missile;
    target.var_65e07134b0e3df2b.var_f786dad007bbe375[ self getentitynumber() ] = undefined;
    target function_d286548dc279fa03();
    
    if ( isdefined( target.var_65e07134b0e3df2b ) )
    {
        target thread function_fb005b489d89e7e9( missile );
    }
    
    target thread function_eb2aaf24387d9dda( missile );
}

// Namespace flare_system
// Params 1
// Checksum 0x1760d09e, Offset: 0xb1b
// Size: 0x3f
function function_411ad6c6c718aeea( canlockon )
{
    if ( isdefined( self.var_65e07134b0e3df2b ) )
    {
        self.var_65e07134b0e3df2b.canlockon = canlockon ? 1 : undefined;
        function_d286548dc279fa03();
    }
}

// Namespace flare_system
// Params 1
// Checksum 0xd6b8bc6c, Offset: 0xb62
// Size: 0x3f
function function_fdbb7d1acba3bf49( isactive )
{
    if ( isdefined( self.var_65e07134b0e3df2b ) )
    {
        self.var_65e07134b0e3df2b.var_432f3791a903498c = isactive ? undefined : 1;
        function_d286548dc279fa03();
    }
}

// Namespace flare_system
// Params 1, eflags: 0x4
// Checksum 0x85467ce6, Offset: 0xba9
// Size: 0x4b
function private function_eb2aaf24387d9dda( missile )
{
    missile waittill( "explode" );
    
    if ( !isdefined( self.var_65e07134b0e3df2b ) )
    {
        return;
    }
    
    if ( isdefined( missile ) )
    {
        self.var_65e07134b0e3df2b.incomingmissiles[ missile getentitynumber() ] = undefined;
    }
    
    function_d286548dc279fa03();
}

// Namespace flare_system
// Params 1, eflags: 0x4
// Checksum 0x444bafa7, Offset: 0xbfc
// Size: 0x84
function private function_fb005b489d89e7e9( missile )
{
    missile endon( "explode" );
    
    while ( isdefined( self ) && isdefined( missile ) )
    {
        if ( missile.var_935a78de5fd11f63 && distancesquared( missile.origin, self.origin ) < 4000000 )
        {
            missile notify( "clearTargetLockedOntoByProjectile" );
            flare = _create_flare_decoy( self );
            missile missile_settargetent( flare );
            missile notify( "missile_pairedWithFlare" );
            break;
        }
        
        waitframe();
    }
}

// Namespace flare_system
// Params 1, eflags: 0x4
// Checksum 0x41a996f0, Offset: 0xc88
// Size: 0x8b
function private _create_flare_decoy( target )
{
    flare = spawn( "script_origin", target.origin + ( 0, 0, -256 ) );
    flare.targetname = "_create_flare_decoy";
    flare.angles = target.angles;
    flare movegravity( ( 0, 0, -1 ), 5 );
    flare thread function_4b046bab401040e3( 5 );
    return flare;
}

// Namespace flare_system
// Params 1, eflags: 0x4
// Checksum 0x3f75f1cb, Offset: 0xd1c
// Size: 0x15
function private function_4b046bab401040e3( delaydelete )
{
    wait delaydelete;
    self delete();
}

