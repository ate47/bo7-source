#using scripts\common\callbacks;
#using scripts\mp\currency;
#using scripts\mp\zm\zm_utility;

#namespace namespace_959ce9e1202b2f83;

// Namespace namespace_959ce9e1202b2f83
// Params 0
// Checksum 0x5d1cdb66, Offset: 0xb5
// Size: 0x3e
function function_5b060a8b1988fdfa()
{
    if ( !level.gametypebundle.var_31ddb3c45c4638c7 )
    {
        return;
    }
    
    level callback::add( "on_round_end", &function_ad7ad35d507f260 );
    level callback::add( "on_item_cleanup", &function_5f8f3b4f553fdb68 );
}

// Namespace namespace_959ce9e1202b2f83
// Params 1
// Checksum 0x87ee78, Offset: 0xfb
// Size: 0x12b
function function_ad7ad35d507f260( params )
{
    n_round_number = zm_utility::get_round_number();
    
    if ( n_round_number % 5 == 0 && n_round_number > 5 )
    {
        foreach ( player in level.players )
        {
            player function_8bfc4687f3c5dc11( n_round_number );
        }
    }
    
    if ( n_round_number % 10 == 0 && n_round_number >= 10 )
    {
        foreach ( player in level.players )
        {
            player function_3c8aad3c873b7c61();
        }
    }
}

// Namespace namespace_959ce9e1202b2f83
// Params 1
// Checksum 0x23e53225, Offset: 0x22e
// Size: 0x4d
function function_8bfc4687f3c5dc11( n_round_number )
{
    salvage_mod = get_salvage_modifier( n_round_number );
    salvage_amount = salvage_mod * 100;
    salvage_amount = clamp( salvage_amount, 0, 500 );
    currency::add_currency_amount( #"salvage", salvage_amount );
}

// Namespace namespace_959ce9e1202b2f83
// Params 0
// Checksum 0xaf408cc6, Offset: 0x283
// Size: 0x3c
function function_3c8aad3c873b7c61()
{
    salvage_reward = 50 * self.var_de7f96341fb651b * 0.5;
    currency::add_currency_amount( #"salvage", salvage_reward );
    self.var_de7f96341fb651b = 0;
}

// Namespace namespace_959ce9e1202b2f83
// Params 1
// Checksum 0x252cace2, Offset: 0x2c7
// Size: 0x85
function get_salvage_modifier( n_round_number )
{
    salvage_mod = 1;
    
    switch ( n_round_number )
    {
        case 10:
            salvage_mod = 1;
            break;
        case 15:
            salvage_mod = 2;
            break;
        case 20:
            salvage_mod = 3;
            break;
        case 25:
            salvage_mod = 4;
            break;
        default:
            salvage_mod = 5;
            break;
    }
    
    return salvage_mod;
}

// Namespace namespace_959ce9e1202b2f83
// Params 1
// Checksum 0xaffa0575, Offset: 0x355
// Size: 0x72
function get_rare_salvage_modifier( n_round_number )
{
    rare_salvage_mod = 1;
    
    switch ( n_round_number )
    {
        case 10:
            rare_salvage_mod = 2;
            break;
        case 15:
            rare_salvage_mod = 3;
            break;
        case 20:
            rare_salvage_mod = 4;
            break;
        default:
            rare_salvage_mod = 5;
            break;
    }
    
    return rare_salvage_mod;
}

// Namespace namespace_959ce9e1202b2f83
// Params 1
// Checksum 0x88ba2dd8, Offset: 0x3d0
// Size: 0x73
function function_5f8f3b4f553fdb68( params )
{
    if ( params.item.type === "zmloot_salvage_perplayer" && isdefined( params.item.owningplayer ) && params.b_despawn )
    {
        params.item.owningplayer.var_de7f96341fb651b++;
    }
}

