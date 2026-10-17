#using script_6dfd03280678b65d;
#using scripts\common\callbacks;
#using scripts\common\metabone;
#using scripts\common\utility;
#using scripts\common\values;

#namespace namespace_9d5bb15c1f6db1c5;

// Namespace namespace_9d5bb15c1f6db1c5
// Params 0
// Checksum 0x7ba7ffae, Offset: 0x1ea
// Size: 0x42
function init_pain_global()
{
    callback::get_template( self.animsetname ) callback::add( "on_zombie_ai_damaged", &on_damaged );
    callback::get_template( self.animsetname ) callback::add( "on_is_crawling_changed", &pain_on_is_crawling_changed );
}

// Namespace namespace_9d5bb15c1f6db1c5
// Params 0
// Checksum 0x550fd3a4, Offset: 0x234
// Size: 0x87
function init_pain()
{
    pain_on_is_crawling_changed();
    self.var_1462b75e7584c1be = 0;
    self.var_f1357b72479bc3b9 = gettime();
    self.var_ded7983c59a5b813 = self.health * 0.15;
    self.var_e949360aff767b20 = self.health * 0.075;
    self.var_63a69a506d864a31 = gettime();
    callback::add( "on_zombie_ai_spawned", &set_hat );
    
    if ( !isdefined( level.var_b4336ca1c16c0f09 ) )
    {
        level.var_b4336ca1c16c0f09 = gettime();
    }
}

// Namespace namespace_9d5bb15c1f6db1c5
// Params 1, eflags: 0x4
// Checksum 0x2525ccb2, Offset: 0x2c3
// Size: 0x69
function private set_hat( params )
{
    if ( isdefined( self.hatmodel ) )
    {
        callback::add( "zombie_base_dismember_head_alive", &pop_hat );
        
        if ( self.var_597d3d7b2f685c74 )
        {
            callback::add( "on_zombie_ai_killed", &pop_hat );
            return;
        }
        
        metabone::set_metabone_active( "hat", 1 );
        callback::add( "metabone_destroyed", &pop_hat );
    }
}

// Namespace namespace_9d5bb15c1f6db1c5
// Params 1, eflags: 0x4
// Checksum 0x93b6a31f, Offset: 0x334
// Size: 0x163
function private on_damaged( params )
{
    if ( !isalive( self ) )
    {
        return;
    }
    
    if ( metabone::is_metabone_armor( params.metabonename ) )
    {
        self function_786bb6aa1b76c7ee( "last_damage_hit_armor", 1 );
    }
    else
    {
        self clearaiblackboarddynamic( "last_damage_hit_armor" );
    }
    
    if ( getdvarint( @"zombie_stagger_enabled", 0 ) <= 0 )
    {
        return;
    }
    
    if ( isexplosivedamagemod( params.smeansofdeath ) )
    {
        return;
    }
    
    if ( params.smeansofdeath == "MOD_MELEE" )
    {
        return;
    }
    
    if ( self._blackboard.zombieinstagger )
    {
        return;
    }
    
    if ( gettime() > self.var_f1357b72479bc3b9 )
    {
        self.var_1462b75e7584c1be = 0;
        self.var_f1357b72479bc3b9 = gettime() + 5000;
    }
    
    self.var_1462b75e7584c1be += params.idamage;
    
    if ( is_head( params.shitloc ) )
    {
        stagger();
        return;
    }
    
    if ( gettime() > self.var_63a69a506d864a31 )
    {
        if ( is_lower_body( params.shitloc ) && self.var_1462b75e7584c1be > self.var_e949360aff767b20 )
        {
            stagger();
            return;
        }
        
        if ( self.var_1462b75e7584c1be > self.var_ded7983c59a5b813 )
        {
            stagger();
        }
    }
}

// Namespace namespace_9d5bb15c1f6db1c5
// Params 1, eflags: 0x4
// Checksum 0xb823b8c, Offset: 0x49f
// Size: 0x3b
function private pain_on_is_crawling_changed( params )
{
    if ( zombie_base_dismemberment::is_crawling() )
    {
        val::set( "pain", "pain", 0 );
        return;
    }
    
    val::reset( "pain", "pain" );
}

// Namespace namespace_9d5bb15c1f6db1c5
// Params 1
// Checksum 0xc5919e36, Offset: 0x4e2
// Size: 0x28c
function pop_hat( params )
{
    if ( params.metabone_name && params.metabone_name != "hat" )
    {
        return;
    }
    
    if ( !isdefined( level.zombie_hats ) )
    {
        level.zombie_hats = [];
    }
    
    level.zombie_hats = function_5713d46873b29625( level.zombie_hats );
    
    if ( !isdefined( level.var_f970e1782c73d8ef ) )
    {
        level.var_f970e1782c73d8ef = [];
    }
    
    level.var_f970e1782c73d8ef = function_5713d46873b29625( level.var_f970e1782c73d8ef );
    
    if ( isdefined( self.hatmodel ) )
    {
        flying_hat = spawn( "script_model", self.origin );
        
        if ( isdefined( flying_hat ) )
        {
            if ( self.trackhat )
            {
                flying_hat_struct = { #tracking_purpose:self.var_508e987d3198ea88, #tracking_hat:flying_hat };
                level.var_f970e1782c73d8ef[ level.var_f970e1782c73d8ef.size ] = flying_hat_struct;
                flying_hat utility::ent_flag_set( "do_not_delete_hat" );
            }
            else if ( level.zombie_hats.size >= 3 )
            {
                if ( isdefined( level.zombie_hats[ 2 ] ) )
                {
                    level.zombie_hats[ 2 ] delete();
                }
                
                level.zombie_hats[ 2 ] = flying_hat;
            }
            else
            {
                level.zombie_hats[ level.zombie_hats.size ] = flying_hat;
            }
            
            self detach( self.hatmodel );
            partname = getpartname( self.hatmodel, 0 );
            flying_hat.origin = self gettagorigin( partname );
            flying_hat.angles = self gettagangles( partname );
            flying_hat setmodel( self.hatmodel );
            self.hatmodel = undefined;
            waitframe();
            
            if ( isdefined( flying_hat ) )
            {
                var_a383ef7a3aaaa65b = ( params.vdir ?? ( 0, 0, 0 ) ) * getdvarfloat( @"hash_9a4196fa2d6f3975", 150 );
                var_2ff7e501926ed41d = anglestoforward( ( 0, randomint( 360 ), 0 ) ) * getdvarfloat( @"hash_8e4a7b83f7affa6b", 150 );
                var_dad1e02f7fb6deef = ( 0, 0, getdvarfloat( @"hat_up_speed", 500 ) );
                flying_hat physicslaunchserver( flying_hat.origin, var_a383ef7a3aaaa65b + var_2ff7e501926ed41d + var_dad1e02f7fb6deef );
                
                if ( !flying_hat utility::ent_flag( "do_not_delete_hat" ) )
                {
                    flying_hat thread utility::function_439f7faeb95d2028( 10 );
                }
            }
        }
    }
}

// Namespace namespace_9d5bb15c1f6db1c5
// Params 0, eflags: 0x4
// Checksum 0xbeafb886, Offset: 0x776
// Size: 0xb6
function private stagger()
{
    self notify( #"stagger" );
    self endon( #"stagger" );
    self endon( #"death" );
    self._blackboard.zombieinstagger = 1;
    self.var_63a69a506d864a31 = gettime() + 10000;
    self.var_1462b75e7584c1be = 0;
    self.var_f1357b72479bc3b9 = gettime() + 5000;
    self waittill( #"stagger_end" );
    self.var_63a69a506d864a31 = gettime() + 10000;
    self.var_1462b75e7584c1be = 0;
    self.var_f1357b72479bc3b9 = gettime() + 5000;
    self._blackboard.zombieinstagger = 0;
}

// Namespace namespace_9d5bb15c1f6db1c5
// Params 1, eflags: 0x4
// Checksum 0xbf003c22, Offset: 0x834
// Size: 0x6f
function private is_lower_body( location )
{
    switch ( location )
    {
        case #"hash_168c74e879f0ba11":
        case #"hash_1cbc508a2fe01b79":
        case #"hash_7b36142458a6c2d5":
        case #"hash_810a7426c8bac3ac":
        case #"hash_9536712388e65bce":
        case #"hash_a638fec9040cfcf4":
            return 1;
        default:
            return 0;
    }
}

// Namespace namespace_9d5bb15c1f6db1c5
// Params 1, eflags: 0x4
// Checksum 0xd025a725, Offset: 0x8ab
// Size: 0x4b
function private is_head( location )
{
    switch ( location )
    {
        case #"hash_8a1772f5f912c880":
        case #"hash_92bbfe494d03d772":
        case #"hash_b107b5547c755d23":
            return 1;
        default:
            return 0;
    }
}

