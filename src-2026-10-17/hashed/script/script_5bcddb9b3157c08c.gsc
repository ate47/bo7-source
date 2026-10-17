#using scripts\common\utility;

#namespace namespace_9bde28f6fb0d35d1;

// Namespace namespace_9bde28f6fb0d35d1
// Params 4
// Checksum 0x6dde8a2e, Offset: 0xc4
// Size: 0xfd
function function_faf7ed88035696ef( skill_ref, boost_duration, max_duration, end_notify )
{
    self endon( end_notify );
    self endon( #"death_or_disconnect" );
    assert( skill_ref, "<dev string:x24>" );
    assert( boost_duration > 0, "<dev string:x41>" );
    assert( max_duration > 0, "<dev string:x68>" );
    
    if ( self.var_3b2945185cdb3574 && self.var_3b2945185cdb3574 != skill_ref )
    {
        return;
    }
    
    self.var_3b2945185cdb3574 = skill_ref;
    skill_index = utility::callsharedfunc( #"skills", #"hash_6dc9835d47a52b35", skill_ref ) + 1;
    self setclientomnvar( "ui_skill_boost_active_skill_index", skill_index );
    percentage_boost = min( boost_duration / max_duration, 1 );
    self setclientomnvar( "ui_skill_boost_active_fill_percentage", percentage_boost );
    thread function_93236e3c1438aa71( "ui_skill_boost_active_fill_percentage", boost_duration, max_duration, end_notify, skill_ref );
}

// Namespace namespace_9bde28f6fb0d35d1
// Params 1
// Checksum 0x435e5242, Offset: 0x1c9
// Size: 0x53
function end_boost( skill_ref )
{
    assert( skill_ref, "<dev string:x24>" );
    
    if ( skill_ref && self.var_3b2945185cdb3574 != skill_ref )
    {
        return;
    }
    
    self setclientomnvar( "ui_skill_boost_active_fill_percentage", 0 );
    self setclientomnvar( "ui_skill_boost_active_skill_index", 0 );
    self.var_3b2945185cdb3574 = undefined;
}

// Namespace namespace_9bde28f6fb0d35d1
// Params 5, eflags: 0xc
// Checksum 0x21661, Offset: 0x224
// Size: 0xd0
function private function_93236e3c1438aa71( progress_omnvar, boost_duration, max_duration, end_notify, skill_name )
{
    self notify( #"hash_ded01897b659c53e" );
    self endon( #"hash_ded01897b659c53e" );
    self endon( end_notify );
    self endon( #"death_or_disconnect" );
    boost_duration_ms = boost_duration * 1000;
    max_duration_ms = max_duration * 1000;
    end_time = gettime() + boost_duration_ms;
    
    while ( gettime() < end_time )
    {
        remaining_ms = end_time - gettime();
        progress = remaining_ms / max_duration_ms;
        self setclientomnvar( progress_omnvar, progress );
        wait 0.05;
    }
    
    end_boost( skill_name );
}

