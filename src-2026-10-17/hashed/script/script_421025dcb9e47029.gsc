#using script_2bf5529af94c9a0;
#using script_31e159e3b40e909e;
#using script_4f9ce8d249a99f4a;
#using scripts\common\callbacks;
#using scripts\common\system;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\common\weapon;
#using scripts\mp\loot\common_item;
#using scripts\mp\loot\common_item_weapon;
#using scripts\mp\zm\zm_utility;

#namespace namespace_a821669669ac920f;

// Namespace namespace_a821669669ac920f
// Params 0, eflags: 0x5
// Checksum 0x7c19535a, Offset: 0xcc
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"hash_36731bb58129611c", undefined, &function_2c1c5e725370bf5c, undefined );
}

// Namespace namespace_a821669669ac920f
// Params 0
// Checksum 0x20208dc, Offset: 0xed
// Size: 0xa
function function_2c1c5e725370bf5c()
{
    level thread function_840aacd7f774a133();
}

// Namespace namespace_a821669669ac920f
// Params 0
// Checksum 0x47ce3b46, Offset: 0xff
// Size: 0x1c
function function_840aacd7f774a133()
{
    zm_relic_challenges::register_relic_challenge_functions( #"hash_39bf11727a9ce582", &function_4247becf44165c0b, &function_d4ea7408e7420c06 );
}

// Namespace namespace_a821669669ac920f
// Params 0
// Checksum 0x3f2347e1, Offset: 0x123
// Size: 0xa9
function function_4247becf44165c0b()
{
    callback::add( #"player_spawned", &on_player_spawned );
    
    foreach ( player in level.players )
    {
        if ( isalive( player ) )
        {
            player thread function_49a79d0559b8364d();
        }
    }
    
    wait 1;
    
    /#
        iprintlnbold( "<dev string:x24>" );
    #/
}

// Namespace namespace_a821669669ac920f
// Params 0
// Checksum 0xa67d4ced, Offset: 0x1d4
// Size: 0xa9
function function_d4ea7408e7420c06()
{
    callback::remove( #"player_spawned", &on_player_spawned );
    
    foreach ( player in level.players )
    {
        if ( isalive( player ) )
        {
            player thread function_2d939e1662c7312e();
        }
    }
    
    wait 1;
    
    /#
        iprintlnbold( "<dev string:x5b>" );
    #/
}

// Namespace namespace_a821669669ac920f
// Params 1, eflags: 0xc
// Checksum 0xf1861ab3, Offset: 0x285
// Size: 0x3d
function private on_player_spawned( params )
{
    self notify( #"hash_efa65cc8a55595f6" );
    self endon( #"hash_efa65cc8a55595f6" );
    self endon( #"death_or_disconnect" );
    wait 0.5;
    thread function_49a79d0559b8364d();
}

// Namespace namespace_a821669669ac920f
// Params 0, eflags: 0xc
// Checksum 0x10752a70, Offset: 0x2ca
// Size: 0x13c
function private function_49a79d0559b8364d()
{
    self notify( #"hash_6c9cfdf55672d798" );
    self endon( #"hash_6c9cfdf55672d798" );
    level endon( #"game_ended" );
    level endon( #"relic_challenge_end" );
    self endon( #"death_or_disconnect" );
    
    if ( player::isinlaststand( self ) )
    {
        self waittill( #"last_stand_exit" );
        wait 1;
    }
    
    self.var_432159241a2f9367 = 1;
    self.var_83480e7607063d3f = 1;
    self.var_73e2de392faa52c6 = 1;
    val::set( "relic_challenge_only_pistol", "weapon_pickup", 0 );
    zm_utility::function_d47920bb0d5fa327( "relicchallenge_onlypaplevel1pistol" );
    zm_utility::function_92275a9d3969d91d();
    pistol_item_name = common_item::items_selectfromlist( %"hash_3c01690ec4a77914", 1 )[ 0 ];
    s_pistol_item = getscriptbundle( pistol_item_name );
    var_6828becb300b1c44 = item_weapon::function_e3101668a21a4237( s_pistol_item );
    w_pistol = weapon::buildweapon( s_pistol_item.baseweapon, var_6828becb300b1c44.attachments );
    inventory_utility::_giveweapon( w_pistol );
    inventory_utility::_switchtoweapon( w_pistol );
    var_1d63258cbafca655 = utility::callsharedfunc( #"pack_a_punch", #"pap_weapon", w_pistol, 0 );
}

// Namespace namespace_a821669669ac920f
// Params 0, eflags: 0xc
// Checksum 0x201c8740, Offset: 0x40e
// Size: 0x50
function private function_2d939e1662c7312e()
{
    self notify( #"hash_d826f96f7d43002c" );
    self endon( #"hash_d826f96f7d43002c" );
    zm_utility::function_663d59490abc834f();
    self.var_432159241a2f9367 = undefined;
    self.var_83480e7607063d3f = undefined;
    self.var_73e2de392faa52c6 = undefined;
    val::reset( "relic_challenge_only_pistol", "weapon_pickup" );
}

