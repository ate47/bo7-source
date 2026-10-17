#using script_5925e714a9b193a8;
#using script_d74ae0b4aa21186;
#using scripts\common\utility;
#using scripts\mp\bots\bots_gametype_super_shared;

#namespace combat_action;

// Namespace combat_action
// Params 1
// Checksum 0x49fdd7c3, Offset: 0x104
// Size: 0x5a
function createaction( target )
{
    assert( isent( target ) );
    targetname = bots_gametype_super_shared::getentityname( target );
    return mind::createactionbase( "combat", target, "main", targetname + "/" + target getentitynumber(), &actionprocess, self, &function_c8f48c8481f42dcb );
}

// Namespace combat_action
// Params 1
// Checksum 0xb3b34a8a, Offset: 0x167
// Size: 0x256
function actionprocess( bot )
{
    assert( isplayer( self.argument ) || isagent( self.argument ) );
    target = self.argument;
    target endon( #"death_or_disconnect" );
    meleechargedist = bot botgetdifficultysetting( "meleeChargeDist" );
    meleechargedistsquared = meleechargedist * meleechargedist;
    var_d550a5989dce86b9 = 0;
    modifyinaccuracy( bot );
    
    while ( true )
    {
        if ( !bot bots_gametype_super_shared::isvalidtarget( target ) )
        {
            return "Invalid target";
        }
        
        bot bots_gametype_super_shared::setenemy( target );
        bot botclearscriptgoal();
        var_a254a5286685c14c = distancesquared( bot.origin, target.origin ) <= meleechargedistsquared;
        
        if ( var_d550a5989dce86b9 != var_a254a5286685c14c )
        {
            var_d550a5989dce86b9 = var_a254a5286685c14c;
            var_d85445174d978e98 = var_a254a5286685c14c && randomfloat( 1 ) < 0.5 && bot botcanseeentity( target );
            bot botsetflag( "prefer_melee", var_d85445174d978e98 );
        }
        
        msg = bot utility::waittill_any_in_array_or_timeout( [ "bad_path", "long_path" ], 1 );
        
        if ( !bot bots_gametype_super_shared::isvalidtarget( target ) )
        {
            return "Invalid target";
        }
        
        if ( msg != "timeout" && !bot botcanseeentity( target ) )
        {
            if ( msg == "bad_path" )
            {
                bot bots_gametype_super_shared::setenemy( undefined );
                
                /#
                    mind::function_fce0e7ad88c9e106( "<dev string:x24>" );
                #/
                
                point = br_circle::getrandompointincircle( bot.origin, 200, 0.5, 1, 1, 1 );
                reachable_point = bot getclosestreachablepointonnavmesh( point );
                bot bots_gametype_super_shared::setscriptgoal( reachable_point, 32 );
                bot utility::waittill_any_in_array_or_timeout( [ "goal", "bad_path" ], 2 );
                
                if ( !bot bots_gametype_super_shared::isvalidtarget( target ) )
                {
                    return "Invalid target";
                }
                
                /#
                    mind::function_fce0e7ad88c9e106( "<dev string:x33>" );
                #/
            }
            else if ( msg == "long_path" )
            {
                return msg;
            }
        }
        
        if ( self.decision.constants.extragrenadethrow )
        {
            bot bots_gametype_super_shared::function_d38100c0f2e7a5de( target );
        }
    }
}

// Namespace combat_action
// Params 1
// Checksum 0x4d02f0b1, Offset: 0x3c5
// Size: 0x8d
function modifyinaccuracy( bot )
{
    inaccuracymultiplier = self.decision.constants.var_16662f71dca8c856;
    
    if ( isdefined( inaccuracymultiplier ) && inaccuracymultiplier != 0 && !isbot( self.argument ) )
    {
        self.var_dfe397a1342c2438 = bot botgetdifficultysetting( "hitInaccuracyScale" );
        var_616b564a03bf7dff = self.var_dfe397a1342c2438 * inaccuracymultiplier;
        bot botsetdifficultysetting( "hitInaccuracyScale", var_616b564a03bf7dff );
    }
}

// Namespace combat_action
// Params 1
// Checksum 0x8c00a6f6, Offset: 0x45a
// Size: 0x46
function function_c8f48c8481f42dcb( action )
{
    if ( mind::function_c47a284545576f7a() )
    {
        self botsetflag( "prefer_melee", 0 );
        
        if ( isdefined( action.var_dfe397a1342c2438 ) )
        {
            self botsetdifficultysetting( "hitInaccuracyScale", action.var_dfe397a1342c2438 );
        }
    }
}

