#using script_67bad8bd9685e057;
#using script_7bf46d34c10761a4;
#using script_d74ae0b4aa21186;
#using scripts\common\utility;
#using scripts\mp\bots\bots_gametype_super_shared;
#using scripts\mp\gameobjects;

#namespace capture_flag_gw;

// Namespace capture_flag_gw
// Params 0
// Checksum 0xe420d20e, Offset: 0xb6
// Size: 0xd
function createdecision()
{
    return mind::function_6e220221dd563155( &evaluatescore );
}

// Namespace capture_flag_gw
// Params 1
// Checksum 0x4f8b221b, Offset: 0xcc
// Size: 0x7f
function evaluatescore( bot )
{
    score = capture_flag::evaluatescore( bot );
    
    if ( score == 0 )
    {
        return 0;
    }
    
    flag = self.generatedaction.argument;
    self.generatedaction = mind::createactionbase( "Capture Flag GW", flag, "main", "", &actionprocess, self );
    return self.constants.basescore;
}

// Namespace capture_flag_gw
// Params 1
// Checksum 0x119f49c5, Offset: 0x154
// Size: 0x136
function actionprocess( bot )
{
    assert( isdefined( self.argument ) );
    flag = self.argument;
    self.decision.var_fb665fadc7596915 = flag;
    var_219817d2c232cb2 = 16;
    
    while ( bot.team != flag gameobjects::getownerteam() )
    {
        nodes = capture_hardpoint::function_6c6fc385b1f592f5( flag, 1 );
        
        if ( nodes.size == 0 )
        {
            var_c51987302d7081fa = 200;
            var_930ab58ed49032f7 = 50;
            createnode = spawnstruct();
            createnode.origin = capture_flag::function_f64bc9182083d5ce( flag.curorigin, var_c51987302d7081fa, var_930ab58ed49032f7, var_219817d2c232cb2 );
            nodes[ nodes.size ] = createnode;
        }
        
        randompoint = utility::array_random( nodes );
        bot bots_gametype_super_shared::setscriptgoal( randompoint.origin, var_219817d2c232cb2 );
        result = utility::waittill_any_ents_or_timeout_return( 15, bot, "bad_path", bot, "long_path", bot, "goal" );
        
        if ( result == "goal" )
        {
            wait 1;
        }
    }
}

