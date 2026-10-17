#using script_d83c56652e0be18;
#using scripts\mp\loot\common_kiosk;

#namespace namespace_fa672be1e28ad75f;

// Namespace namespace_fa672be1e28ad75f
// Params 1
// Checksum 0x4a0a06c8, Offset: 0xba
// Size: 0x153
function function_1b66793cc7e2eab8( taskid )
{
    bot = self;
    var_cef7941117dea2b0 = bot br_plunder::function_3c61b4a05ec0b894();
    bot.armorykioskpurchaseallowed = 1;
    
    if ( common_kiosk::function_5274212108b240d3() )
    {
        channel = undefined;
        var_34b9a019446b3927 = self._blackboard.var_34b9a019446b3927;
        
        switch ( var_34b9a019446b3927 )
        {
            case #"br_item_purchase":
                channel = "br_item_purchase";
                break;
            case #"br_team_revive":
                channel = "br_team_revive";
                break;
            default:
                channel = getxhashhexname( var_34b9a019446b3927 );
                
                /#
                    channel = getxhashsourcename( var_34b9a019446b3927 );
                #/
                
                throw( "Unknown purchase channel: " + channel );
                return anim.failure;
        }
        
        bot common_kiosk::onarmorykioskpurchase( channel, self._blackboard.var_1d0c6a497231d8b3 );
    }
    
    var_b2e21c00a37161a5 = bot br_plunder::function_3c61b4a05ec0b894();
    force_failure = 0;
    
    /#
        force_failure = getdvarint( @"hash_c45e329e7ed4674b", 0 );
    #/
    
    if ( var_b2e21c00a37161a5 >= var_cef7941117dea2b0 || force_failure )
    {
        function_a7d555c3edc7b2de( self._blackboard.botbuystation, bot );
    }
    
    return anim.success;
}

