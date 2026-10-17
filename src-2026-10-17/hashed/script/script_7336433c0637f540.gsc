#using script_4eb10b8076cd40c;
#using scripts\common\ai;
#using scripts\common\callbacks;
#using scripts\common\devgui;
#using scripts\common\metabone;
#using scripts\common\utility;

#namespace custom_behavior_framework;

/#

    // Namespace custom_behavior_framework
    // Params 1
    // Checksum 0x8be5e759, Offset: 0x146
    // Size: 0x1d, Type: dev
    function function_c06fd87aa84b0a85( params )
    {
        function_89184902993eff38();
        function_9e1c096ce55887a3();
    }

#/

// Namespace custom_behavior_framework
// Params 1
// Checksum 0xf85fabc8, Offset: 0x16b
// Size: 0xa6
function function_9984fdb0e5159ebf( taskid )
{
    stealth::initstealthfunctions();
    self.battlechatter = spawnstruct();
    self.phase_list = [];
    level.var_283d677826acfc7f = self;
    self setbasearchetype( self findoverridearchetype( "default" ) );
    assert( isdefined( self.var_91302a889cc8e0b2 ), "<dev string:x24>" );
    function_612f9a423d16414e( self.var_91302a889cc8e0b2 );
    callback::add( "on_soldier_ai_damaged", &on_custom_behavior_ai_damaged );
    init_phase( self.current_phase );
    
    /#
        function_89184902993eff38();
        function_9e1c096ce55887a3();
    #/
    
    return anim.success;
}

// Namespace custom_behavior_framework
// Params 1
// Checksum 0x5c215fa0, Offset: 0x21a
// Size: 0x14a
function function_612f9a423d16414e( settings_asset_name )
{
    settings = getscriptbundle( settings_asset_name );
    self.var_3247390eb04ebb5a = settings;
    assert( isdefined( self.var_3247390eb04ebb5a ), "<dev string:x58>" );
    phase_list = arraysort( self.var_3247390eb04ebb5a.phases, undefined, &function_bbb107e8370823cb );
    
    foreach ( phase in phase_list )
    {
        register_phase( phase.phasename, phase.var_183001f8bd598108, phase.movement, phase.attacks, phase.modelname );
    }
    
    if ( self.var_3247390eb04ebb5a.metabones )
    {
        metabone::init_metabones( self.var_3247390eb04ebb5a );
    }
    
    self.current_phase = utility::array_get_first_item( self.phase_list );
}

// Namespace custom_behavior_framework
// Params 1
// Checksum 0x3dd7b8fe, Offset: 0x36c
// Size: 0x188
function on_custom_behavior_ai_damaged( params )
{
    if ( isarray( self.current_phase.var_878142f602a95c4a ) && self.current_phase.var_878142f602a95c4a.size > 0 )
    {
        valid_transitions = [];
        
        foreach ( eval in self.current_phase.var_878142f602a95c4a )
        {
            operation_callback = get_operation_func( eval.operation );
            var_2 = undefined;
            
            if ( isdefined( eval.ent_2 ) )
            {
                var_2 = get_var( eval.ent_2, eval.var_2 );
            }
            else
            {
                var_2 = eval.var_2;
            }
            
            result = [[ operation_callback ]]( eval.ent_1.health, var_2 );
            
            if ( result )
            {
                valid_transitions[ valid_transitions.size ] = eval.target_phase;
            }
        }
        
        if ( valid_transitions.size > 0 )
        {
            target_phase_index = randomintrange( 0, valid_transitions.size );
            function_7ca8bd566bd3113( valid_transitions[ target_phase_index ] );
        }
    }
}

// Namespace custom_behavior_framework
// Params 10
// Checksum 0x3f657647, Offset: 0x4fc
// Size: 0x172
function on_custom_behavior_ai_killed( einflictor, eattacker, idamage, smeansofdeath, objweapon, vdir, shitloc, timeoffset, deathanimduration, dropweapons )
{
    /#
        iprintln( "<dev string:xa2>" );
    #/
    
    params_struct = spawnstruct();
    params_struct.einflictor = einflictor;
    params_struct.eattacker = eattacker;
    params_struct.idamage = idamage;
    params_struct.smeansofdeath = smeansofdeath;
    params_struct.objweapon = objweapon;
    params_struct.vdir = vdir;
    params_struct.shitloc = shitloc;
    params_struct.timeoffset = timeoffset;
    params_struct.deathanimduration = deathanimduration;
    params_struct.dropweapons = dropweapons;
    params_struct.origin = self.origin;
    params_struct.b_in_spawn_closet = self.b_in_spawn_closet;
    callback::callback( "on_custom_behavior_ai_killed", params_struct );
    
    if ( self._blackboard.zombieindespawn )
    {
        if ( self.magic_bullet_shield )
        {
            ai::stop_magic_bullet_shield();
        }
        
        self.var_a13bed1ac47e1b2c = 1;
    }
}

// Namespace custom_behavior_framework
// Params 5
// Checksum 0xd03a9e36, Offset: 0x676
// Size: 0x131
function register_phase( name, transition_data, movement, attacks, model )
{
    phase = spawnstruct();
    phase.name = name;
    phase.model = model;
    phase.move_type = movement;
    phase.attacks = [];
    phase.transitions = [];
    self.phase_list[ name ] = phase;
    phase.transition_data = arraysort( transition_data, undefined, &function_bbb107e8370823cb );
    sorted_attacks = arraysort( attacks, undefined, &function_bbb107e8370823cb );
    
    foreach ( attack in attacks )
    {
        register_phase_attack( name, attack );
    }
}

// Namespace custom_behavior_framework
// Params 2
// Checksum 0x9529b505, Offset: 0x7af
// Size: 0x54
function register_phase_attack( phase_name, attack_data )
{
    attack = attack_data;
    phase = self.phase_list[ phase_name ];
    phase.attacks[ phase.attacks.size ] = attack;
}

// Namespace custom_behavior_framework
// Params 2
// Checksum 0x4dc2f7c4, Offset: 0x80b
// Size: 0x21f
function register_phase_transition( phase_name, transition_data )
{
    transition = spawnstruct();
    transition.target_phase = self.phase_list[ transition_data.var_842f6478834da201 ];
    transition.eval_type = transition_data.evaltype;
    phase = self.phase_list[ phase_name ];
    
    if ( transition.eval_type == "NOTIFY" )
    {
        transition.eval_data = transition_data.notifyeval;
        listener = get_ent( transition.eval_data.notifylistener );
        thread function_fb3734a3e0cf426c( listener, transition.eval_data.notifyname, transition );
    }
    else
    {
        transition.eval_data = transition_data.conditionaleval;
        ent_1 = get_ent( transition.eval_data.ent1 );
        ent_2 = get_ent( transition.eval_data.ent2 );
        
        if ( transition.eval_data.var_21af023ebb333b57 == "HEALTH" )
        {
            if ( transition.eval_data.var_72096b9e950f985 )
            {
                function_9ba7b5f92d9ba86c( phase, ent_1, undefined, float( transition.eval_data.checkvalue ), transition.eval_data.operation, transition.target_phase );
            }
            else
            {
                function_9ba7b5f92d9ba86c( phase, ent_1, ent_2, transition.eval_data.var_93a9b22afff6089c, transition.eval_data.operation, transition.target_phase );
            }
        }
    }
    
    phase.transitions[ phase.transitions.size ] = transition;
}

// Namespace custom_behavior_framework
// Params 1
// Checksum 0x4e6bcddc, Offset: 0xa32
// Size: 0x183
function init_phase( phase )
{
    /#
        iprintlnbold( "<dev string:xbd>" + phase.name );
    #/
    
    if ( phase.model != "" )
    {
        self setmodel( phase.model );
    }
    
    if ( isdefined( phase.var_dc4c52ec797579dc ) )
    {
        foreach ( part in phase.var_dc4c52ec797579dc )
        {
            utility::function_32b24db3127bff40( part, part + "_" + phase.name );
        }
    }
    
    foreach ( transition in phase.transition_data )
    {
        register_phase_transition( phase.name, transition );
    }
    
    self notify( #"phase_change", phase.name );
}

// Namespace custom_behavior_framework
// Params 1
// Checksum 0x55622df2, Offset: 0xbbd
// Size: 0x58
function function_7ca8bd566bd3113( target_phase )
{
    if ( !isdefined( self.phase_list[ target_phase.name ] ) )
    {
        assertmsg( "<dev string:xcd>" );
        return;
    }
    
    if ( self.current_phase == target_phase )
    {
        return;
    }
    
    self.current_phase = target_phase;
    init_phase( target_phase );
}

// Namespace custom_behavior_framework
// Params 3
// Checksum 0x8504a83, Offset: 0xc1d
// Size: 0x69
function function_fb3734a3e0cf426c( listener, notify_name, transition )
{
    self endon( #"death" );
    listener endon( #"death" );
    level endon( #"game_ended" );
    listener waittill( notify_name );
    transition.notify_hit = 1;
    function_7ca8bd566bd3113( transition.target_phase );
}

// Namespace custom_behavior_framework
// Params 6
// Checksum 0xcb730483, Offset: 0xc8e
// Size: 0xc5
function function_9ba7b5f92d9ba86c( start_phase, ent_1, ent_2, var_2, operation, target_phase )
{
    if ( !isdefined( start_phase.var_878142f602a95c4a ) )
    {
        start_phase.var_878142f602a95c4a = [];
    }
    
    eval = spawnstruct();
    eval.ent_1 = ent_1;
    eval.ent_2 = ent_2;
    eval.var_2 = var_2;
    eval.operation = operation;
    eval.target_phase = target_phase;
    start_phase.var_878142f602a95c4a[ start_phase.var_878142f602a95c4a.size ] = eval;
}

// Namespace custom_behavior_framework
// Params 2
// Checksum 0xbc7ab7d3, Offset: 0xd5b
// Size: 0x17, Type: bool
function function_b2ee2424c19717f0( taskid, params )
{
    return true;
}

// Namespace custom_behavior_framework
// Params 2
// Checksum 0x14d66711, Offset: 0xd7b
// Size: 0x1e
function function_1395e9d4924c7bb3( taskid, params )
{
    return anim.success;
}

// Namespace custom_behavior_framework
// Params 2
// Checksum 0x2b5a2e24, Offset: 0xda2
// Size: 0xfd
function GetValidAttack( taskid, params )
{
    potential_attacks = self.current_phase.attacks;
    valid_attacks = [];
    
    foreach ( attack in potential_attacks )
    {
        target = undefined;
        
        if ( distancesquared( self.origin, target.origin ) > squared( attack.valid_range ) )
        {
            continue;
        }
        
        if ( isdefined( attack.var_5462b35db981db4a ) )
        {
            self [[ attack.var_5462b35db981db4a ]]();
        }
    }
}

// Namespace custom_behavior_framework
// Params 2
// Checksum 0xe2562582, Offset: 0xea7
// Size: 0x17, Type: bool
function function_6d3a5cac8fd09084( taskid, params )
{
    return true;
}

// Namespace custom_behavior_framework
// Params 2
// Checksum 0x3a9ced85, Offset: 0xec7
// Size: 0x17, Type: bool
function function_fb057831a874b0b3( taskid, params )
{
    return true;
}

// Namespace custom_behavior_framework
// Params 5
// Checksum 0xd0e9e0de, Offset: 0xee7
// Size: 0xc2
function add_attack( target_type, attack, valid_range, var_3f269d708371dd1e, phase_name )
{
    new_attack = spawnstruct();
    new_attack.target_type = target_type;
    new_attack.valid_range = valid_range;
    
    if ( isstring( attack ) )
    {
        new_attack.attack_func = get_default_attack( attack );
    }
    else
    {
        new_attack.attack_func = attack;
    }
    
    new_attack.var_5462b35db981db4a = var_3f269d708371dd1e;
    
    if ( isdefined( phase_name ) )
    {
        register_phase_attack( phase_name, new_attack );
        return;
    }
    
    self.global_attacks[ self.global_attacks.size ] = attack;
}

// Namespace custom_behavior_framework
// Params 1
// Checksum 0x1853e623, Offset: 0xfb1
// Size: 0x64
function get_default_attack( attack )
{
    switch ( attack )
    {
        case #"hash_40a94c5d9e4e265b":
            return &default_melee;
        case #"hash_7b6e0a3e1c7b0de2":
            return &default_ranged;
        case #"hash_dba37c83a2434dc3":
            return &default_sweep;
        default:
            break;
    }
}

// Namespace custom_behavior_framework
// Params 1
// Checksum 0xa610f95d, Offset: 0x101d
// Size: 0x19
function default_melee( target )
{
    /#
        iprintln( "<dev string:x119>" );
    #/
}

// Namespace custom_behavior_framework
// Params 1
// Checksum 0xf0cee903, Offset: 0x103e
// Size: 0x19
function default_ranged( target )
{
    /#
        iprintln( "<dev string:x12e>" );
    #/
}

// Namespace custom_behavior_framework
// Params 1
// Checksum 0xe1dc90ce, Offset: 0x105f
// Size: 0x19
function default_sweep( target )
{
    /#
        iprintln( "<dev string:x144>" );
    #/
}

// Namespace custom_behavior_framework
// Params 2
// Checksum 0xcf599394, Offset: 0x1080
// Size: 0x50, Type: bool
function function_bbb107e8370823cb( a, b )
{
    if ( !isdefined( a.priority ) )
    {
        return false;
    }
    
    if ( !isdefined( b.priority ) )
    {
        return false;
    }
    
    return a.priority <= b.priority;
}

// Namespace custom_behavior_framework
// Params 1
// Checksum 0x4d215a91, Offset: 0x10d9
// Size: 0x131
function function_5c19b76f265937a7( eval_data )
{
    ent_1 = get_ent( eval_data.ent1 );
    var_1 = get_var( ent_1, eval_data.var_21af023ebb333b57 );
    var_2 = undefined;
    
    if ( eval_data.var_72096b9e950f985 )
    {
        var_2 = eval_data.checkvalue;
    }
    else
    {
        ent_2 = get_ent( eval_data.ent2 );
        var_2 = get_var( ent_2, eval_data.var_93a9b22afff6089c );
    }
    
    assert( isdefined( var_2 ) );
    
    switch ( eval_data.operation )
    {
        case #"hash_311013bc01bd3ec8":
            return ( var_1 == var_2 );
        case #"hash_311014bc01bd405b":
            return ( var_1 < var_2 );
        case #"hash_f99109f6bcec6092":
            return ( var_1 <= var_2 );
        case #"hash_311016bc01bd4381":
            return ( var_1 > var_2 );
        case #"hash_f99785f6bcf1a0f4":
            return ( var_1 >= var_2 );
        case #"hash_f94f05f6bcb87ee3":
            return ( var_1 != var_2 );
        default:
            return 0;
    }
}

// Namespace custom_behavior_framework
// Params 1
// Checksum 0x74f77e47, Offset: 0x1212
// Size: 0x53
function get_ent( ent_type )
{
    switch ( ent_type )
    {
        case #"hash_fc2a884ef7c334d7":
            return self;
        case #"hash_789ed5cb6e9d1a86":
            return self.enemy;
        case #"hash_4d21cda7758bb74e":
        default:
            return;
    }
}

// Namespace custom_behavior_framework
// Params 2
// Checksum 0xe2802d58, Offset: 0x126d
// Size: 0x74
function get_var( ent, var_type )
{
    switch ( var_type )
    {
        case #"hash_4a2ecdc851cc5d2f":
            return ent.health;
        case #"hash_9a7970b268aff3ea":
            return ent.origin;
        case #"hash_789ed5cb6e9d1a86":
            return ent.enemy;
        default:
            return;
    }
}

// Namespace custom_behavior_framework
// Params 1
// Checksum 0x528c98f1, Offset: 0x12e9
// Size: 0x8f
function get_operation_func( operation )
{
    switch ( operation )
    {
        case #"hash_311013bc01bd3ec8":
            return &check_equal;
        case #"hash_311014bc01bd405b":
            return &function_392614131989696c;
        case #"hash_f99109f6bcec6092":
            return &function_ce4e41b7a45f2917;
        case #"hash_311016bc01bd4381":
            return &function_d516a09b82b8f463;
        case #"hash_f99785f6bcf1a0f4":
            return &function_c94a063baa7a04f6;
        case #"hash_f94f05f6bcb87ee3":
            return &function_79b5a8daf7b2771b;
        default:
            return;
    }
}

// Namespace custom_behavior_framework
// Params 2
// Checksum 0x792a861a, Offset: 0x1380
// Size: 0x19, Type: bool
function check_equal( var1, var2 )
{
    return var1 == var2;
}

// Namespace custom_behavior_framework
// Params 2
// Checksum 0x3d698c04, Offset: 0x13a2
// Size: 0x19, Type: bool
function function_392614131989696c( var1, var2 )
{
    return var1 < var2;
}

// Namespace custom_behavior_framework
// Params 2
// Checksum 0xd4dc01cd, Offset: 0x13c4
// Size: 0x19, Type: bool
function function_ce4e41b7a45f2917( var1, var2 )
{
    return var1 <= var2;
}

// Namespace custom_behavior_framework
// Params 2
// Checksum 0x3026cc3e, Offset: 0x13e6
// Size: 0x19, Type: bool
function function_d516a09b82b8f463( var1, var2 )
{
    return var1 > var2;
}

// Namespace custom_behavior_framework
// Params 2
// Checksum 0x6675b7a2, Offset: 0x1408
// Size: 0x19, Type: bool
function function_c94a063baa7a04f6( var1, var2 )
{
    return var1 >= var2;
}

// Namespace custom_behavior_framework
// Params 2
// Checksum 0x11294295, Offset: 0x142a
// Size: 0x19, Type: bool
function function_79b5a8daf7b2771b( var1, var2 )
{
    return var1 != var2;
}

/#

    // Namespace custom_behavior_framework
    // Params 0
    // Checksum 0xe733fa4d, Offset: 0x144c
    // Size: 0x44, Type: dev
    function function_89184902993eff38()
    {
        devgui::function_9082edeb5db93280( "<dev string:x159>" );
        devgui::add_devgui_func( "<dev string:x17c>", "<dev string:x19c>", &function_4415345b103cd82a );
        devgui::add_devgui_func( "<dev string:x1c5>", "<dev string:x1ee>", &function_2441d36a25843150 );
        devgui::function_77df7fe7dd273e10();
    }

    // Namespace custom_behavior_framework
    // Params 1
    // Checksum 0xa28d1741, Offset: 0x1498
    // Size: 0x3b, Type: dev
    function function_4415345b103cd82a( notify_name )
    {
        if ( !isdefined( notify_name ) )
        {
            notify_name = getdvar( @"hash_77a6d98c1322fd33" );
        }
        
        if ( notify_name != "<dev string:x218>" )
        {
            level.var_283d677826acfc7f notify( notify_name );
        }
    }

    // Namespace custom_behavior_framework
    // Params 1
    // Checksum 0x346211f9, Offset: 0x14db
    // Size: 0x45, Type: dev
    function function_2441d36a25843150( notify_name )
    {
        if ( !isdefined( notify_name ) )
        {
            notify_name = getdvar( @"hash_77a6d98c1322fd33" );
        }
        
        if ( notify_name != "<dev string:x218>" )
        {
            level.var_283d677826acfc7f.enemy notify( notify_name );
        }
    }

    // Namespace custom_behavior_framework
    // Params 0
    // Checksum 0x140314d5, Offset: 0x1528
    // Size: 0x44, Type: dev
    function function_9e1c096ce55887a3()
    {
        self endon( #"death" );
        
        while ( true )
        {
            self waittill( #"phase_change" );
            iprintln( "<dev string:x219>" + self.current_phase.name );
        }
    }

#/
