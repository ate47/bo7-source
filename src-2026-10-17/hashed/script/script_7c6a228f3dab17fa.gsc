#using script_11b1dfcd25787e62;
#using script_2fe74ee229c972c3;
#using scripts\common\callbacks;
#using scripts\common\utility;

#namespace skill_guild_bot_upgrade;

// Namespace skill_guild_bot_upgrade
// Params 0, eflags: 0x1
// Checksum 0xe1c54dcf, Offset: 0x8e
// Size: 0x17
function autoexec main()
{
    shared_skills::function_b667da63ece9b966( #"guild_bot_upgrade", &init );
}

// Namespace skill_guild_bot_upgrade
// Params 0
// Checksum 0x1c2b98b3, Offset: 0xad
// Size: 0x5c
function init()
{
    utility::registersharedfunc( #"guild_bot_upgrade", #"ongiveskill", &on_give_skill );
    utility::registersharedfunc( #"guild_bot_upgrade", #"hash_4aa03f4559ac50a5", &function_c51f1692ecb73bfe );
    utility::registersharedfunc( #"super_guild_bot", #"hash_ffc1151316e7ea15", &get_guild_bot_damage_multiplier );
}

// Namespace skill_guild_bot_upgrade
// Params 1, eflags: 0x4
// Checksum 0x3762930f, Offset: 0x111
// Size: 0xbf, Type: bool
function private on_give_skill( skill_bundle )
{
    self.var_a23228c454979a3a = { #bundle:skill_bundle };
    assert( !callback::exists( "<dev string:x24>", &function_45c2760ca93edac8 ) );
    callback::add( "spawn_ally_guild_bot", &function_45c2760ca93edac8 );
    
    if ( skill_bundle.var_d5f64bf7d72d251e )
    {
        assert( !callback::exists( #"on_ping", &ob_ally_guild_bot::on_player_pinged ) );
        assert( !callback::exists( #"on_ping_removed", &ob_ally_guild_bot::function_81d22b5715e4cb21 ) );
        callback::add( #"on_ping", &ob_ally_guild_bot::on_player_pinged );
        callback::add( #"on_ping_removed", &ob_ally_guild_bot::function_81d22b5715e4cb21 );
    }
    
    return true;
}

// Namespace skill_guild_bot_upgrade
// Params 1, eflags: 0x4
// Checksum 0x1083511, Offset: 0x1d9
// Size: 0xaf
function private function_c51f1692ecb73bfe( skill_bundle )
{
    self.var_a23228c454979a3a = undefined;
    assert( callback::exists( "<dev string:x24>", &function_45c2760ca93edac8 ) );
    callback::remove( "spawn_ally_guild_bot", &function_45c2760ca93edac8 );
    
    if ( skill_bundle.var_d5f64bf7d72d251e )
    {
        assert( callback::exists( #"on_ping", &ob_ally_guild_bot::on_player_pinged ) );
        callback::remove( #"on_ping", &ob_ally_guild_bot::on_player_pinged );
        assert( callback::exists( #"on_ping_removed", &ob_ally_guild_bot::function_81d22b5715e4cb21 ) );
        callback::remove( #"on_ping_removed", &ob_ally_guild_bot::function_81d22b5715e4cb21 );
    }
}

// Namespace skill_guild_bot_upgrade
// Params 1
// Checksum 0xd4fdabe9, Offset: 0x290
// Size: 0xfa
function function_45c2760ca93edac8( data )
{
    bundle = self.var_a23228c454979a3a.bundle;
    
    if ( !bundle.var_d9372cad5c6a79aa )
    {
        return;
    }
    
    assert( bundle.var_90a741bd2c5e992e, "<dev string:x39>" );
    newweapon = [[ level.fnbuildweapon ]]( bundle.var_90a741bd2c5e992e, [] );
    
    if ( bundle.var_1d7098d848e7ed66 )
    {
        newweapon = newweapon withcamo( bundle.var_1d7098d848e7ed66 );
    }
    
    if ( bundle.var_ad2c1b53210fbf1e )
    {
        var_4a99f78349485fec = getscriptbundle( bundle.var_ad2c1b53210fbf1e ).ammomodname;
        utility::callsharedfunc( #"ammo_mod", #"add_ammo_mod_to_weapon", newweapon, var_4a99f78349485fec );
    }
    
    data.guild_bot.weapon = newweapon;
}

// Namespace skill_guild_bot_upgrade
// Params 0, eflags: 0x4
// Checksum 0x5e961c3b, Offset: 0x392
// Size: 0x1f
function private get_guild_bot_damage_multiplier()
{
    return self.var_a23228c454979a3a.bundle.var_1057ed04e252a242;
}

