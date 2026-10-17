#using script_7b1e082b2533e255;
#using scripts\common\callbacks;
#using scripts\mp\deathicons;

#namespace specialty_kill_report;

// Namespace specialty_kill_report
// Params 0, eflags: 0x1
// Checksum 0x9da0b625, Offset: 0x8f
// Size: 0x20
function autoexec preinit()
{
    if ( isbrgamemode() )
    {
        return;
    }
    
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_kill_report
// Params 1
// Checksum 0xc9ba9e81, Offset: 0xb7
// Size: 0x3f
function registerspecialty( params )
{
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_kill_report", &function_76da050f33e50020, &function_f21481fb7a618579, [], &function_fb4aa7063946685a );
    }
}

// Namespace specialty_kill_report
// Params 0
// Checksum 0x756aa7fa, Offset: 0xfe
// Size: 0x17
function function_fb4aa7063946685a()
{
    callback::add( #"player_death", &function_8e5dd528de869030 );
}

// Namespace specialty_kill_report
// Params 1, eflags: 0x4
// Checksum 0x27548d73, Offset: 0x11d
// Size: 0x11b
function private function_8e5dd528de869030( deathdata )
{
    if ( !isdefined( deathdata.attacker ) )
    {
        return;
    }
    
    var_5b56edff76c94cf6 = [];
    
    if ( isdefined( deathdata.victim ) )
    {
        foreach ( player in level.players )
        {
            if ( isdefined( player.perks[ "specialty_kill_report" ] ) && player_utility::playersareenemies( player, deathdata.victim ) )
            {
                var_5b56edff76c94cf6[ var_5b56edff76c94cf6.size ] = player;
            }
        }
    }
    
    if ( var_5b56edff76c94cf6.size > 0 )
    {
        thread deathicons::addenemydeathicon( deathdata.victim.body, deathdata.victim, var_5b56edff76c94cf6, [], getdvarfloat( @"perk_kill_report_icon_time" ), 1 );
    }
}

// Namespace specialty_kill_report
// Params 0
// Checksum 0x18c299e3, Offset: 0x240
// Size: 0x2
function function_76da050f33e50020()
{
    
}

// Namespace specialty_kill_report
// Params 0
// Checksum 0xb2f86208, Offset: 0x24a
// Size: 0x2
function function_f21481fb7a618579()
{
    
}

