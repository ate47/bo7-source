#using scripts\common\callbacks;
#using scripts\common\utility;
#using scripts\cp_mp\utility\player_utility;
#using scripts\engine\utility;
#using scripts\mp\objidpoolmanager;
#using scripts\mp\utility\points;

#namespace Vendetta;

// Namespace Vendetta
// Params 0, eflags: 0x5
// Checksum 0x7691c3d1, Offset: 0x15b
// Size: 0x18
function private autoexec preinit()
{
    level callback::add( #"register_perk", &function_4297f68cc6806962 );
}

// Namespace Vendetta
// Params 1
// Checksum 0xeda3e7f3, Offset: 0x17b
// Size: 0x7c
function function_4297f68cc6806962( params )
{
    bundle = level.perkbundles[ "specialty_vendetta" ];
    
    if ( !isdefined( bundle ) )
    {
        return;
    }
    
    if ( !function_c28ff33f9f675615() )
    {
        function_79901b4637c83c86( #"hash_74fef453d7cdb3f4" );
        return;
    }
    
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_vendetta", &function_75750ebd385b190, &function_2f8a54d8b054f3d1, [], &function_dc42f3c3411d000d );
    }
}

// Namespace Vendetta
// Params 0
// Checksum 0xfd3623a8, Offset: 0x1ff
// Size: 0xc
function function_75750ebd385b190()
{
    self.var_eba3cdcee01e4ddb = 0;
}

// Namespace Vendetta
// Params 0
// Checksum 0xfcf82904, Offset: 0x213
// Size: 0xc
function function_2f8a54d8b054f3d1()
{
    self.var_eba3cdcee01e4ddb = undefined;
}

// Namespace Vendetta
// Params 0
// Checksum 0x66e58411, Offset: 0x227
// Size: 0x39
function function_dc42f3c3411d000d()
{
    level callback::add( #"player_death", &function_297a907f5fda5fd6 );
    level callback::add( #"player_spawned", &function_254e929f524b83ea );
    level.var_76a8f2fd66e2cd91 = 1;
}

// Namespace Vendetta
// Params 1, eflags: 0x4
// Checksum 0xe6cc3ffb, Offset: 0x268
// Size: 0x11f
function private function_297a907f5fda5fd6( params )
{
    attacker = params.attacker;
    victim = params.victim;
    
    if ( attacker.var_1aa7b82332ed0a2 == victim )
    {
        attacker thread points::doscoreevent( #"hash_9feecd09d2a04352" );
        attacker.var_1aa7b82332ed0a2 = undefined;
    }
    
    if ( !isdefined( victim.perks[ "specialty_vendetta" ] ) )
    {
        return;
    }
    
    if ( !victim player_utility::isenemy( attacker ) )
    {
        return;
    }
    
    if ( isdefined( attacker.perks[ "specialty_perceptive" ] ) )
    {
        if ( victim.var_1aa7b82332ed0a2 == attacker )
        {
            victim.var_1aa7b82332ed0a2 = undefined;
        }
        
        return;
    }
    
    if ( !isdefined( attacker.var_eba3cdcee01e4ddb ) )
    {
        attacker.var_eba3cdcee01e4ddb = 0;
    }
    
    bundle = level.perkbundles[ "specialty_vendetta" ];
    
    if ( attacker.var_eba3cdcee01e4ddb >= ( bundle.var_e0c13d5649ad141f ?? 3 ) )
    {
        return;
    }
    
    victim.var_1aa7b82332ed0a2 = attacker;
}

// Namespace Vendetta
// Params 1, eflags: 0x4
// Checksum 0x7f13c2b7, Offset: 0x38f
// Size: 0x7d
function private function_254e929f524b83ea( params )
{
    if ( !isdefined( self.perks[ "specialty_vendetta" ] ) )
    {
        return;
    }
    
    var_f1cfe5a9f91f6dca = self;
    target = var_f1cfe5a9f91f6dca.var_1aa7b82332ed0a2;
    
    if ( target )
    {
        target.var_eba3cdcee01e4ddb += 1;
        var_f1cfe5a9f91f6dca function_18a3132e09ed114c();
        target thread function_9f23e85751b7ef8d();
        target thread function_ec8ada8ef7dc1309();
    }
}

// Namespace Vendetta
// Params 0, eflags: 0x4
// Checksum 0xe9a1bd56, Offset: 0x414
// Size: 0x8b
function private function_18a3132e09ed114c()
{
    bundle = level.perkbundles[ "specialty_vendetta" ];
    var_ef1e97ff1a96dfb7 = bundle.var_a1a96e6ad4c09ad1;
    var_f1cfe5a9f91f6dca = self;
    var_f1cfe5a9f91f6dca.var_d9ee0921d2499a2b = objidpoolmanager::requestobjectiveid( 1 );
    var_f1cfe5a9f91f6dca thread function_3b036b208d965f78( var_f1cfe5a9f91f6dca.var_d9ee0921d2499a2b, &"mp_ingame_only/vendetta_perk_target", var_ef1e97ff1a96dfb7 );
    var_f1cfe5a9f91f6dca thread function_9c5af5ce1bb0869d();
    var_f1cfe5a9f91f6dca thread function_a4e931dcdf6df653();
    var_f1cfe5a9f91f6dca thread function_7182ee702c8b30ba();
}

// Namespace Vendetta
// Params 3, eflags: 0x4
// Checksum 0x634cbe4f, Offset: 0x4a7
// Size: 0xcc
function private function_3b036b208d965f78( objid, objlabel, objicon )
{
    level endon( "game_ended" );
    var_f1cfe5a9f91f6dca = self;
    target = self.var_1aa7b82332ed0a2;
    objective_setbackground( objid, 1 );
    objective_setzoffset( objid, 30 );
    objective_position( objid, target geteye() + ( 0, 0, 14 ) );
    objective_state( objid, "current" );
    objective_setplayintro( objid, 0 );
    objective_setownerteam( objid, undefined );
    objective_icon( objid, objicon );
    objective_settint( objid, 245, 245, 245 );
    objective_setshowdistance( objid, 0 );
    objidpoolmanager::function_e4d6a71507372662( objid, 0 );
    var_f1cfe5a9f91f6dca objidpoolmanager::objective_playermask_single( var_f1cfe5a9f91f6dca.var_d9ee0921d2499a2b, var_f1cfe5a9f91f6dca );
}

// Namespace Vendetta
// Params 0, eflags: 0xc
// Checksum 0x52b35bdf, Offset: 0x57b
// Size: 0x59
function private function_9f23e85751b7ef8d()
{
    self notify( "7ab567fb61a427a1" );
    self endon( "7ab567fb61a427a1" );
    level endon( "game_ended" );
    target = self;
    
    if ( !target )
    {
        return;
    }
    
    if ( target getclientomnvar( "ui_perceptive" ) )
    {
        return;
    }
    
    target setclientomnvar( "ui_perceptive", 1 );
    target setclientomnvar( "ui_perceptive_indicator", 2 );
}

// Namespace Vendetta
// Params 0, eflags: 0xc
// Checksum 0xa96c8fe0, Offset: 0x5dc
// Size: 0x48
function private function_ec8ada8ef7dc1309()
{
    self notify( "38520aa3bf2f1808" );
    self endon( "38520aa3bf2f1808" );
    target = self;
    level endon( "game_ended" );
    
    while ( target && target.var_eba3cdcee01e4ddb )
    {
        waitframe();
    }
    
    target function_3e42c1af36c02aa2();
}

// Namespace Vendetta
// Params 0, eflags: 0x4
// Checksum 0xa050c5e1, Offset: 0x62c
// Size: 0x40
function private function_3e42c1af36c02aa2()
{
    target = self;
    
    if ( !target )
    {
        return;
    }
    
    if ( !target getclientomnvar( "ui_perceptive" ) )
    {
        return;
    }
    
    target setclientomnvar( "ui_perceptive", 0 );
    target setclientomnvar( "ui_perceptive_indicator", 0 );
}

// Namespace Vendetta
// Params 0, eflags: 0x4
// Checksum 0xcae12e7d, Offset: 0x674
// Size: 0x55
function private function_7182ee702c8b30ba()
{
    var_f1cfe5a9f91f6dca = self;
    target = var_f1cfe5a9f91f6dca.var_1aa7b82332ed0a2;
    level utility::waittill_any_ents( target, "death", target, "disconnect" );
    
    if ( target )
    {
        target.var_eba3cdcee01e4ddb = 0;
    }
    
    var_f1cfe5a9f91f6dca function_ecf568642b42b0d5();
}

// Namespace Vendetta
// Params 0, eflags: 0xc
// Checksum 0x9ca71366, Offset: 0x6d1
// Size: 0x10e
function private function_a4e931dcdf6df653()
{
    self notify( "9ba828b8cc3dc07d" );
    self endon( "9ba828b8cc3dc07d" );
    var_f1cfe5a9f91f6dca = self;
    target = var_f1cfe5a9f91f6dca.var_1aa7b82332ed0a2;
    target endon( "death" );
    target endon( "disconnect" );
    bundle = level.perkbundles[ "specialty_vendetta" ];
    duration = bundle.var_ad784aa585f8e45e ?? 9;
    msg = level utility::waittill_any_ents_or_timeout_return( duration, var_f1cfe5a9f91f6dca, "death", var_f1cfe5a9f91f6dca, "disconnect" );
    
    if ( target )
    {
        assert( target.var_eba3cdcee01e4ddb );
        target.var_eba3cdcee01e4ddb -= 1;
    }
    
    if ( var_f1cfe5a9f91f6dca )
    {
        var_f1cfe5a9f91f6dca.var_d60e459a1a32188f = var_f1cfe5a9f91f6dca.var_1aa7b82332ed0a2;
        var_f1cfe5a9f91f6dca.var_1aa7b82332ed0a2 = undefined;
        var_f1cfe5a9f91f6dca.var_f70fa0618b1b1559 = gettime();
        var_f1cfe5a9f91f6dca function_ecf568642b42b0d5();
    }
}

// Namespace Vendetta
// Params 0, eflags: 0x4
// Checksum 0x44e6fb40, Offset: 0x7e7
// Size: 0x4f
function private function_ecf568642b42b0d5()
{
    var_f1cfe5a9f91f6dca = self;
    
    if ( var_f1cfe5a9f91f6dca.var_d9ee0921d2499a2b )
    {
        objective_delete( var_f1cfe5a9f91f6dca.var_d9ee0921d2499a2b );
        objidpoolmanager::returnobjectiveid( var_f1cfe5a9f91f6dca.var_d9ee0921d2499a2b );
    }
    
    if ( var_f1cfe5a9f91f6dca )
    {
        var_f1cfe5a9f91f6dca.var_d9ee0921d2499a2b = undefined;
    }
}

// Namespace Vendetta
// Params 0, eflags: 0xc
// Checksum 0x5470d849, Offset: 0x83e
// Size: 0xcd
function private function_9c5af5ce1bb0869d()
{
    self notify( "581b576214f41a8a" );
    self endon( "581b576214f41a8a" );
    var_f1cfe5a9f91f6dca = self;
    target = var_f1cfe5a9f91f6dca.var_1aa7b82332ed0a2;
    bundle = level.perkbundles[ "specialty_vendetta" ];
    interval = bundle.var_a76ac7bd84f031d6 ?? 1.5;
    
    while ( isdefined( var_f1cfe5a9f91f6dca.var_d9ee0921d2499a2b ) && isdefined( var_f1cfe5a9f91f6dca ) && isdefined( target ) )
    {
        if ( !target utility::isusingremote() )
        {
            objidpoolmanager::update_objective_position( var_f1cfe5a9f91f6dca.var_d9ee0921d2499a2b, target geteye() + ( 0, 0, 14 ) );
            objective_ping( var_f1cfe5a9f91f6dca.var_d9ee0921d2499a2b );
        }
        
        wait interval;
    }
}

