#using script_2fe74ee229c972c3;
#using scripts\common\callbacks;
#using scripts\common\utility;
#using scripts\mp\gametypes\common;
#using scripts\mp\weapons;

#namespace skill_fast_revive;

// Namespace skill_fast_revive
// Params 0, eflags: 0x1
// Checksum 0x89f03730, Offset: 0x98
// Size: 0x17
function autoexec main()
{
    shared_skills::function_b667da63ece9b966( #"fast_revive", &init );
}

// Namespace skill_fast_revive
// Params 0
// Checksum 0x11972e9b, Offset: 0xb7
// Size: 0x54
function init()
{
    utility::registersharedfunc( #"fast_revive", #"ongiveskill", &on_give_skill );
    utility::registersharedfunc( #"fast_revive", #"hash_4aa03f4559ac50a5", &function_c51f1692ecb73bfe );
    level callback::add( #"player_laststand_revived", &on_player_revived );
}

// Namespace skill_fast_revive
// Params 1, eflags: 0x4
// Checksum 0x51491ca0, Offset: 0x113
// Size: 0xa5, Type: bool
function private on_give_skill( skill_bundle )
{
    /#
        if ( skill_bundle.var_153f299b1b087952 )
        {
            boost_duration = skill_bundle.var_51b5e59c7abcfdf0;
            speed_boost_factor = skill_bundle.var_a49923b76e3cc161;
            var_7913e6efdb008c72 = skill_bundle.var_1890cb6406f4309d;
            assert( boost_duration && isdefined( speed_boost_factor ) || var_7913e6efdb008c72, "<dev string:x24>" );
        }
    #/
    
    self.var_a12ec60b3cfebf6b = skill_bundle.var_362c92bea07858d8;
    self.var_39c1c990e828f154 = { #bundle:skill_bundle };
    return true;
}

// Namespace skill_fast_revive
// Params 1, eflags: 0x4
// Checksum 0xf606a893, Offset: 0x1c1
// Size: 0x41
function private function_c51f1692ecb73bfe( skill_bundle )
{
    if ( skill_bundle.var_153f299b1b087952 )
    {
        self notify( #"hash_ccb50a769dafe144" );
        clear_speed_boost();
    }
    
    self.var_39c1c990e828f154 = undefined;
    self.var_a12ec60b3cfebf6b = undefined;
}

// Namespace skill_fast_revive
// Params 1, eflags: 0x4
// Checksum 0x9f74089e, Offset: 0x20a
// Size: 0xa0
function private on_player_revived( params )
{
    reviver = params.reviver;
    skill_data = reviver.var_39c1c990e828f154 ?? self.var_39c1c990e828f154;
    
    if ( !skill_data.bundle.var_153f299b1b087952 )
    {
        return;
    }
    
    bundle = skill_data.bundle;
    
    if ( !params.selfrevive )
    {
        thread monitor_boost( bundle, reviver );
    }
    
    if ( isplayer( reviver ) )
    {
        reviver thread monitor_boost( bundle, reviver );
    }
}

// Namespace skill_fast_revive
// Params 2, eflags: 0xc
// Checksum 0xf82c04c0, Offset: 0x2b2
// Size: 0xd7
function private monitor_boost( bundle, reviver )
{
    self notify( #"hash_3f0a486f3bcedfc0" );
    self endon( #"hash_3f0a486f3bcedfc0" );
    self endon( #"disconnect" );
    self endon( #"hash_ccb50a769dafe144" );
    boost_duration = bundle.var_51b5e59c7abcfdf0 ?? 0;
    speed_boost_factor = bundle.var_a49923b76e3cc161 ?? 1;
    var_7913e6efdb008c72 = bundle.var_1890cb6406f4309d ?? 0;
    
    if ( boost_duration )
    {
        start_speed_boost( speed_boost_factor );
    }
    
    if ( var_7913e6efdb008c72 && self == reviver )
    {
        function_57c47e0afb013dae( var_7913e6efdb008c72 );
    }
    
    utility::waittill_notify_or_timeout( "death", boost_duration );
    clear_speed_boost();
}

// Namespace skill_fast_revive
// Params 1, eflags: 0x4
// Checksum 0xde4a6377, Offset: 0x391
// Size: 0x49
function private start_speed_boost( speed_factor )
{
    var_6b3038b8c446034e = weapons::function_1a21795a419517d7();
    
    if ( var_6b3038b8c446034e )
    {
        common::function_1f09590404e452e4( "skill_healthy_revival", speed_factor );
    }
    else
    {
        weapons::function_4512b7715789e4cf( "skill_healthy_revival", speed_factor );
    }
    
    weapons::updatemovespeedscale();
}

// Namespace skill_fast_revive
// Params 0, eflags: 0x4
// Checksum 0x88cf6905, Offset: 0x3e2
// Size: 0x57
function private clear_speed_boost()
{
    var_6b3038b8c446034e = weapons::function_1a21795a419517d7();
    
    if ( var_6b3038b8c446034e )
    {
        if ( common::function_8ff835bf23198a0( "skill_healthy_revival" ) )
        {
            common::function_d85a92c557ea5a52( "skill_healthy_revival" );
        }
    }
    else if ( weapons::function_8131aea7eb196354( "skill_healthy_revival" ) )
    {
        weapons::function_986fc44dada307f4( "skill_healthy_revival" );
    }
    
    weapons::updatemovespeedscale();
}

// Namespace skill_fast_revive
// Params 1, eflags: 0x4
// Checksum 0x7664307c, Offset: 0x441
// Size: 0x4b
function private function_57c47e0afb013dae( health_percent )
{
    extra_health = int( self.maxhealth * health_percent );
    self.health = clampint( extra_health + self.health, 0, self.maxhealth );
}

