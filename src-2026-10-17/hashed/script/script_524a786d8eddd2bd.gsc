#using script_175692a62b8813a2;
#using scripts\asm\asm;
#using scripts\common\utility;

#namespace zombie_bloat;

// Namespace zombie_bloat
// Params 0, eflags: 0x5
// Checksum 0x5b69d678, Offset: 0xb4
// Size: 0x3e
function private autoexec init()
{
    utility::registersharedfunc( #"zombie", #"bloatzombie", &bloat_ai );
    utility::registersharedfunc( #"zombie", #"hash_c4551fbc625eab56", &clear_bloat );
}

// Namespace zombie_bloat
// Params 2
// Checksum 0x9143745e, Offset: 0xfa
// Size: 0xa6
function bloat_ai( duration, attacker )
{
    assert( isdefined( duration ) );
    
    if ( !isalive( self ) )
    {
        return;
    }
    
    archetype_override = self findoverridearchetype( "animscript" );
    
    if ( isdefined( archetype_override ) && archetype_override != self getbasearchetype() )
    {
        return;
    }
    
    if ( !isdefined( self.asmname ) )
    {
        return;
    }
    
    if ( !self asmhasstate( self.asmname, "bloat_in" ) )
    {
        return;
    }
    
    if ( self.disallow_bloat )
    {
        return;
    }
    
    if ( zombie_vehicle_attack::is_in_vehicle_attack() )
    {
        thread function_caa523468e74fe2d( duration, attacker );
        return;
    }
    
    activate_bloat( duration );
}

// Namespace zombie_bloat
// Params 0
// Checksum 0x289e1ce7, Offset: 0x1a8
// Size: 0x10, Type: bool
function function_515d0ff3aa6cc5d2()
{
    return gettime() < self.bloat_end_time;
}

// Namespace zombie_bloat
// Params 0
// Checksum 0x120b8444, Offset: 0x1c1
// Size: 0x18
function clear_bloat()
{
    self.bloat_end_time = undefined;
    self function_786bb6aa1b76c7ee( "bloat_end_time", 0 );
}

// Namespace zombie_bloat
// Params 2, eflags: 0x4
// Checksum 0xb921b464, Offset: 0x1e1
// Size: 0x77
function private function_caa523468e74fe2d( duration, attacker )
{
    self endon( #"death" );
    var_dbc7bd1946222dea = 8;
    
    if ( isdefined( attacker ) )
    {
        var_3b47613711457bbd = self.origin - attacker.origin;
    }
    
    zombie_vehicle_attack::function_1103fe44822e8b55( var_3b47613711457bbd );
    utility::waittill_notify_or_timeout( "cannonball_end", var_dbc7bd1946222dea );
    activate_bloat( duration );
}

// Namespace zombie_bloat
// Params 1, eflags: 0x4
// Checksum 0x5fea0198, Offset: 0x260
// Size: 0x5b
function private activate_bloat( duration )
{
    end_time = gettime() + int( duration * 1000 );
    
    if ( self.bloat_end_time > end_time )
    {
        return;
    }
    
    self.bloat_end_time = end_time;
    self function_786bb6aa1b76c7ee( "bloat_end_time", end_time );
    asm::function_7256f5ba459c840b( "bloat_in" );
}

