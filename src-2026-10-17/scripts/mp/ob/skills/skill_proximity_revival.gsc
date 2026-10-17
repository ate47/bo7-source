#using script_2fe74ee229c972c3;
#using scripts\common\callbacks;
#using scripts\common\utility;
#using scripts\mp\laststand;

#namespace skill_proximity_revival;

// Namespace skill_proximity_revival
// Params 0, eflags: 0x1
// Checksum 0xca9bce4a, Offset: 0xaf
// Size: 0x17
function autoexec main()
{
    shared_skills::function_b667da63ece9b966( #"proximity_revival", &init );
}

// Namespace skill_proximity_revival
// Params 0
// Checksum 0xe5bb1ed9, Offset: 0xce
// Size: 0x68
function init()
{
    utility::registersharedfunc( #"proximity_revival", #"hash_f89602d29c289ca4", &function_1321989bae991e4f );
    utility::registersharedfunc( #"proximity_revival", #"ongiveskill", &on_give_skill );
    utility::registersharedfunc( #"proximity_revival", #"hash_4aa03f4559ac50a5", &function_c51f1692ecb73bfe );
    laststand::register_revive_reason( "last_stand_revived_proximity_revival" );
}

// Namespace skill_proximity_revival
// Params 1, eflags: 0x4
// Checksum 0xdac5478b, Offset: 0x13e
// Size: 0x3d
function private function_1321989bae991e4f( skill_bundle )
{
    if ( skill_bundle.var_7a364679912978c )
    {
        skill_bundle.var_96a8595ca5dc869d = skill_bundle.var_7a364679912978c * skill_bundle.var_7a364679912978c;
    }
}

// Namespace skill_proximity_revival
// Params 1, eflags: 0x4
// Checksum 0xd33ea0a2, Offset: 0x183
// Size: 0x17d, Type: bool
function private on_give_skill( skill_bundle )
{
    assert( skill_bundle.var_7a364679912978c, "<dev string:x24>" );
    assert( skill_bundle.var_b68035b1a3cc51f2, "<dev string:x54>" );
    assert( skill_bundle.var_9b7c4b3c767db5a1, "<dev string:x89>" );
    assert( skill_bundle.var_6611742192b57dfc, "<dev string:xc9>" );
    assert( skill_bundle.var_b86f93b9d789582f, "<dev string:x102>" );
    assert( skill_bundle.var_a8f9a780375dfb4a, "<dev string:x140>" );
    assert( skill_bundle.var_ebcb279d719a1544, "<dev string:x17c>" );
    self.var_69381c5277d862db = { #revivetargets:[], #bundle:skill_bundle };
    thread function_92c487c9945b6f94( self.var_69381c5277d862db, skill_bundle );
    assert( !callback::exists( #"player_laststand", &function_40877d7c740fb895 ) );
    assert( !callback::exists( #"player_death", &function_1f6f087fe4e955d9 ) );
    assert( !callback::exists( #"player_disconnect", &function_1f6f087fe4e955d9 ) );
    callback::add( #"player_laststand", &function_40877d7c740fb895 );
    callback::add( #"player_death", &function_1f6f087fe4e955d9 );
    callback::add( #"player_disconnect", &function_1f6f087fe4e955d9 );
    return true;
}

// Namespace skill_proximity_revival
// Params 1, eflags: 0x4
// Checksum 0x58334361, Offset: 0x309
// Size: 0x159
function private function_c51f1692ecb73bfe( skill_bundle )
{
    function_ca70a249ccd64bf1();
    skill_data = self.var_69381c5277d862db;
    
    foreach ( target in skill_data.revivetargets )
    {
        function_f21d3ac0ff27308( skill_data, self, target, 1 );
    }
    
    self notify( #"proximity_revival_stop" );
    assert( callback::exists( #"player_laststand", &function_40877d7c740fb895 ) );
    assert( callback::exists( #"player_death", &function_1f6f087fe4e955d9 ) );
    assert( callback::exists( #"player_disconnect", &function_1f6f087fe4e955d9 ) );
    callback::remove( #"player_laststand", &function_40877d7c740fb895 );
    callback::remove( #"player_death", &function_1f6f087fe4e955d9 );
    callback::remove( #"player_disconnect", &function_1f6f087fe4e955d9 );
    self.var_69381c5277d862db = undefined;
    self.proximity_reviver = undefined;
}

// Namespace skill_proximity_revival
// Params 2, eflags: 0xc
// Checksum 0x360dcd4c, Offset: 0x46a
// Size: 0x13f
function private function_92c487c9945b6f94( skill_data, bundle )
{
    self notify( #"hash_50599287ea94e740" );
    self endon( #"hash_50599287ea94e740" );
    self endon( #"death_or_disconnect" );
    self endon( #"proximity_revival_stop" );
    
    while ( true )
    {
        wait 1;
        
        if ( self.inlaststand )
        {
            continue;
        }
        
        teammates = get_players_in_radius( bundle.var_7a364679912978c, 0 );
        
        foreach ( teammate in teammates )
        {
            if ( !teammate.inlaststand )
            {
                continue;
            }
            
            if ( teammate.beingrevived )
            {
                continue;
            }
            
            if ( teammate.isselfreviving )
            {
                continue;
            }
            
            if ( function_3be0b64999a54a15( skill_data, bundle ) )
            {
                continue;
            }
            
            childthread function_9dd1d0936bbee6b7( skill_data, bundle, self, teammate, get_revive_time( skill_data, bundle ), 1 );
        }
    }
}

// Namespace skill_proximity_revival
// Params 6, eflags: 0x4
// Checksum 0x57f7b13e, Offset: 0x5b1
// Size: 0x180
function private function_9dd1d0936bbee6b7( skill_data, bundle, reviver, downed, revive_time, track_target = 0 )
{
    if ( downed.laststandreviveent.curprogress )
    {
        downed notify( #"hash_e149442d67863a88" );
        downed.var_97cc96f1f277e149 = downed.laststandreviveent.curprogress / level.laststandrevivetimer * 1000;
    }
    else if ( downed.var_97cc96f1f277e149 )
    {
        downed.var_97cc96f1f277e149 = undefined;
    }
    
    downed.proximity_reviver = reviver;
    
    if ( downed callback::exists( #"hash_bca297ef8a461ca2", &function_881e32936a99db94, undefined, 1 ) )
    {
        downed notify( #"proximity_revival_finished" );
        downed callback::remove( #"hash_bca297ef8a461ca2", &function_881e32936a99db94 );
        assert( downed callback::exists( #"player_laststand_revived", &function_881e32936a99db94 ) );
        downed callback::remove( #"player_laststand_revived", &function_881e32936a99db94 );
    }
    
    downed callback::add( #"hash_bca297ef8a461ca2", &function_881e32936a99db94 );
    downed callback::add( #"player_laststand_revived", &function_881e32936a99db94 );
    thread function_4dafec1dd002802( skill_data, bundle, reviver, downed, revive_time, track_target );
    function_c2969d678daadbf2( skill_data, bundle, reviver, downed, revive_time, track_target );
}

// Namespace skill_proximity_revival
// Params 6, eflags: 0x4
// Checksum 0x1eed8994, Offset: 0x739
// Size: 0x2b0
function private function_c2969d678daadbf2( skill_data, bundle, reviver, downed, revive_time, track_target )
{
    downed endon( #"hash_c060d6a6e503e8a7" );
    downed.beingrevived = 1;
    
    if ( track_target )
    {
        skill_data.revivetargets[ skill_data.revivetargets.size ] = downed;
    }
    
    use_time = revive_time * 1000;
    curr_progress = ( downed.var_97cc96f1f277e149 ?? 0 ) * use_time;
    radius_sq = bundle.var_96a8595ca5dc869d;
    succeeded = 0;
    var_829bcbdddf26596a = 0;
    
    if ( !isalive( downed ) || !downed.inlaststand )
    {
        function_f21d3ac0ff27308( skill_data, reviver, downed, track_target );
        return;
    }
    
    if ( !isalive( reviver ) || reviver.inlaststand || distancesquared( downed.origin, reviver.origin ) > radius_sq )
    {
        function_48f94bb6647f9aa4( skill_data, bundle, reviver, downed, track_target );
        return;
    }
    
    set_revive_scriptable_state( reviver, downed, bundle.var_b86f93b9d789582f, bundle.var_a8f9a780375dfb4a );
    downed start_revive_hud( reviver );
    
    while ( true )
    {
        waitframe();
        
        if ( !isalive( downed ) || !downed.inlaststand || downed.isselfreviving )
        {
            break;
        }
        
        if ( !isalive( reviver ) || reviver.inlaststand || distancesquared( downed.origin, reviver.origin ) > radius_sq )
        {
            var_829bcbdddf26596a = 1;
            break;
        }
        
        curr_progress += level.frameduration;
        progress = clamp( curr_progress / use_time, 0.01, 1 );
        downed.var_97cc96f1f277e149 = progress;
        downed laststand::setprogressomnvar( progress );
        
        if ( level.var_894cf9c132c87505 )
        {
            laststand::updatesquadmemberlaststandreviveprogress( downed, reviver, progress, 0 );
        }
        
        if ( downed.laststandreviveent )
        {
            downed.laststandreviveent.curprogress = progress * level.laststandrevivetimer * 1000;
        }
        
        if ( curr_progress >= use_time )
        {
            succeeded = 1;
            break;
        }
    }
    
    if ( succeeded )
    {
        function_754f54f091061699( skill_data, bundle, reviver, downed, track_target );
        return;
    }
    
    if ( var_829bcbdddf26596a )
    {
        function_48f94bb6647f9aa4( skill_data, bundle, reviver, downed, track_target );
        return;
    }
    
    function_f21d3ac0ff27308( skill_data, reviver, downed, track_target );
}

// Namespace skill_proximity_revival
// Params 6, eflags: 0x4
// Checksum 0x4aea853e, Offset: 0x9f1
// Size: 0x13e
function private function_4dafec1dd002802( skill_data, bundle, reviver, downed, revive_time, track_target )
{
    downed endon( #"death_or_disconnect" );
    downed endon( #"proximity_revival_finished" );
    self endon( #"death_or_disconnect" );
    self endon( #"proximity_revival_stop" );
    
    while ( true )
    {
        downed waittill( #"hash_c060d6a6e503e8a7" );
        set_revive_scriptable_state( reviver, downed, #"off" );
        downed waittill( #"hash_f083a725043aa852" );
        
        if ( !downed.inlaststand || !isalive( reviver ) || reviver.inlaststand )
        {
            function_f21d3ac0ff27308( skill_data, reviver, downed, track_target );
            return;
        }
        
        if ( downed.laststandreviveent && downed.laststandreviveent.curprogress )
        {
            downed.var_97cc96f1f277e149 = downed.laststandreviveent.curprogress / level.laststandrevivetimer * 1000;
        }
        
        thread function_c2969d678daadbf2( skill_data, bundle, reviver, downed, revive_time, track_target );
    }
}

// Namespace skill_proximity_revival
// Params 1, eflags: 0x4
// Checksum 0xba2e9e78, Offset: 0xb37
// Size: 0x96
function private function_881e32936a99db94( params )
{
    reviver = self.proximity_reviver;
    skill_data = self.var_69381c5277d862db ?? reviver.var_69381c5277d862db;
    track_target = !self.var_69381c5277d862db;
    
    if ( !isalive( reviver ) || reviver.inlaststand )
    {
        function_f21d3ac0ff27308( skill_data, reviver, self, track_target );
        return;
    }
    
    function_2df0c6eb914b14d8( skill_data, reviver, self, track_target );
    self notify( #"hash_f083a725043aa852" );
}

// Namespace skill_proximity_revival
// Params 5, eflags: 0x4
// Checksum 0x4be22dfd, Offset: 0xbd5
// Size: 0x6f
function private function_754f54f091061699( skill_data, bundle, reviver, downed, track_target )
{
    downed notify( #"proximity_revival_finished" );
    set_revive_scriptable_state( reviver, downed, bundle.var_ebcb279d719a1544 );
    downed laststand::auto_revive( reviver, "last_stand_revived_proximity_revival" );
    function_67bf9b18aa40e956( skill_data, reviver, downed, track_target, 0 );
}

// Namespace skill_proximity_revival
// Params 4, eflags: 0x4
// Checksum 0x30fceaf7, Offset: 0xc4c
// Size: 0x55
function private function_f21d3ac0ff27308( skill_data, reviver, downed, track_target )
{
    downed notify( #"proximity_revival_finished" );
    function_67bf9b18aa40e956( skill_data, reviver, downed, track_target, 0 );
    set_revive_scriptable_state( reviver, downed, #"off" );
}

// Namespace skill_proximity_revival
// Params 5, eflags: 0x4
// Checksum 0x51521029, Offset: 0xca9
// Size: 0x8f
function private function_48f94bb6647f9aa4( skill_data, bundle, reviver, downed, track_target )
{
    downed notify( #"proximity_revival_finished" );
    has_progress = downed.var_97cc96f1f277e149;
    function_67bf9b18aa40e956( skill_data, reviver, downed, track_target, has_progress );
    set_revive_scriptable_state( reviver, downed, #"off" );
    
    if ( has_progress )
    {
        downed thread function_2361506bed31a670( reviver, bundle.var_b68035b1a3cc51f2 );
    }
}

// Namespace skill_proximity_revival
// Params 2, eflags: 0x4
// Checksum 0x1081b2c5, Offset: 0xd40
// Size: 0x129
function private function_2361506bed31a670( reviver, revive_time )
{
    self endon( #"death_or_disconnect" );
    self endon( #"last_stand_exit" );
    self endon( #"hash_e149442d67863a88" );
    self endon( #"hash_c060d6a6e503e8a7" );
    decay_scale = level.laststandrevivedecayscale;
    
    while ( self.var_97cc96f1f277e149 )
    {
        waitframe();
        
        if ( !self.inlaststand )
        {
            break;
        }
        
        decay_amount = level.frameduration / revive_time * 1000 * decay_scale;
        self.var_97cc96f1f277e149 -= decay_amount;
        
        if ( self.var_97cc96f1f277e149 <= 0 )
        {
            self.var_97cc96f1f277e149 = 0;
            
            if ( self.laststandreviveent )
            {
                self.laststandreviveent.curprogress = 0;
            }
            
            break;
        }
        
        if ( self.laststandreviveent )
        {
            self.laststandreviveent.curprogress = self.var_97cc96f1f277e149 * level.laststandrevivetimer * 1000;
        }
    }
    
    self.var_97cc96f1f277e149 = undefined;
}

// Namespace skill_proximity_revival
// Params 4, eflags: 0x4
// Checksum 0x30960271, Offset: 0xe71
// Size: 0x5c
function private function_2df0c6eb914b14d8( skill_data, reviver, downed, track_target )
{
    set_revive_scriptable_state( reviver, downed, #"off" );
    
    if ( track_target )
    {
        skill_data.revivetargets = arrayremove( skill_data.revivetargets, downed );
    }
}

// Namespace skill_proximity_revival
// Params 5, eflags: 0x4
// Checksum 0xaf63954e, Offset: 0xed5
// Size: 0xec
function private function_67bf9b18aa40e956( skill_data, reviver, downed, track_target, keep_progress )
{
    if ( !keep_progress )
    {
        downed.var_97cc96f1f277e149 = undefined;
    }
    
    downed.beingrevived = 0;
    downed.proximity_reviver = undefined;
    
    if ( downed callback::exists( #"hash_bca297ef8a461ca2", &function_881e32936a99db94, undefined, 1 ) )
    {
        downed callback::remove( #"hash_bca297ef8a461ca2", &function_881e32936a99db94 );
        assert( downed callback::exists( #"player_laststand_revived", &function_881e32936a99db94 ) );
        downed callback::remove( #"player_laststand_revived", &function_881e32936a99db94 );
    }
    
    downed cleanup_revive_hud();
    
    if ( track_target )
    {
        skill_data.revivetargets = arrayremove( skill_data.revivetargets, downed );
    }
}

// Namespace skill_proximity_revival
// Params 1, eflags: 0x4
// Checksum 0xa2a07617, Offset: 0xfc9
// Size: 0x6d
function private start_revive_hud( reviver )
{
    self setclientomnvar( "ui_reviver_id", reviver getentitynumber() );
    laststand::setstateomnvar( 6 );
    initial_progress = self.var_97cc96f1f277e149 ?? 0.01;
    laststand::setprogressomnvar( initial_progress );
    
    if ( level.var_894cf9c132c87505 )
    {
        laststand::updatesquadmemberlaststandreviveprogress( self, reviver, initial_progress, 0 );
    }
    
    laststand::setplayerbeingrevivedextrainfo( 1 );
}

// Namespace skill_proximity_revival
// Params 0, eflags: 0x4
// Checksum 0xf67477bf, Offset: 0x103e
// Size: 0x27
function private cleanup_revive_hud()
{
    laststand::setplayerbeingrevivedextrainfo( 0 );
    laststand::setstateomnvar( 0 );
    laststand::setprogressomnvar( 0 );
    self setclientomnvar( "ui_reviver_id", -1 );
}

// Namespace skill_proximity_revival
// Params 1, eflags: 0x4
// Checksum 0x70542f81, Offset: 0x106d
// Size: 0x13
function private function_40877d7c740fb895( params )
{
    thread function_84167529194c3319();
}

// Namespace skill_proximity_revival
// Params 1, eflags: 0x4
// Checksum 0x12712b3d, Offset: 0x1088
// Size: 0x13
function private function_1f6f087fe4e955d9( params )
{
    function_ca70a249ccd64bf1();
}

// Namespace skill_proximity_revival
// Params 0, eflags: 0xc
// Checksum 0x301634be, Offset: 0x10a3
// Size: 0xfe
function private function_84167529194c3319()
{
    self notify( #"hash_1bd115817cccbd4a" );
    self endon( #"hash_1bd115817cccbd4a" );
    self endon( #"death_or_disconnect" );
    self endon( #"proximity_revival_stop" );
    skill_data = self.var_69381c5277d862db;
    bundle = skill_data.bundle;
    
    while ( self.inlaststand )
    {
        nearby_players = get_players_in_radius( bundle.var_7a364679912978c, 1 );
        
        if ( nearby_players.size && !self.beingrevived && !self.isselfreviving )
        {
            nearest = sortbydistance( nearby_players, self.origin )[ 0 ];
            self.proximity_reviver = nearest;
            function_9dd1d0936bbee6b7( skill_data, bundle, nearest, self, bundle.var_b68035b1a3cc51f2 );
            self.proximity_reviver = undefined;
        }
        
        wait 1;
    }
    
    self.proximity_reviver = undefined;
}

// Namespace skill_proximity_revival
// Params 2, eflags: 0x4
// Checksum 0xe2700767, Offset: 0x11a9
// Size: 0x36
function private get_players_in_radius( radius, ignore_laststand )
{
    return getplayersinradius( self.origin, radius, undefined, ignore_laststand, [ self ], self.team );
}

// Namespace skill_proximity_revival
// Params 2, eflags: 0x4
// Checksum 0xf6c81835, Offset: 0x11e8
// Size: 0x74
function private get_revive_time( skill_data, bundle )
{
    revive_time = bundle.var_b68035b1a3cc51f2;
    extra_revives = skill_data.revivetargets.size - 1;
    
    if ( extra_revives && bundle.var_a1d0e93b5e081d43 > 1 )
    {
        revive_time *= pow( bundle.var_a1d0e93b5e081d43, extra_revives );
    }
    
    return revive_time;
}

// Namespace skill_proximity_revival
// Params 2, eflags: 0x4
// Checksum 0x762ebc0b, Offset: 0x1265
// Size: 0x2d, Type: bool
function private function_3be0b64999a54a15( skill_data, bundle )
{
    return skill_data.revivetargets.size >= bundle.var_9b7c4b3c767db5a1;
}

// Namespace skill_proximity_revival
// Params 0, eflags: 0x4
// Checksum 0x3c7802c2, Offset: 0x129b
// Size: 0xf0
function private function_ca70a249ccd64bf1()
{
    skill_data = self.var_69381c5277d862db;
    bundle = skill_data.bundle;
    part = bundle.var_6611742192b57dfc;
    
    if ( self.proximity_reviver )
    {
        self.proximity_reviver utility::function_7c10ea82c1e305b8( part, #"off" );
    }
    
    foreach ( target in skill_data.revivetargets )
    {
        if ( target )
        {
            target utility::function_7c10ea82c1e305b8( part, #"off" );
        }
    }
}

// Namespace skill_proximity_revival
// Params 4, eflags: 0x4
// Checksum 0xf5df8743, Offset: 0x1393
// Size: 0x9b
function private set_revive_scriptable_state( reviver, revived, reviver_state, revived_state = reviver_state )
{
    skill_data = reviver.var_69381c5277d862db ?? revived.var_69381c5277d862db;
    
    if ( !skill_data )
    {
        return;
    }
    
    part = skill_data.bundle.var_6611742192b57dfc;
    
    if ( reviver )
    {
        reviver utility::function_7c10ea82c1e305b8( part, reviver_state );
    }
    
    if ( revived )
    {
        revived utility::function_7c10ea82c1e305b8( part, revived_state );
    }
}

