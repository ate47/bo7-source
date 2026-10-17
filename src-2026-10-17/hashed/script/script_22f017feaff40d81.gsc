#using script_cb233a7d6343014;
#using scripts\common\system;
#using scripts\common\utility;

#namespace threat_sight_rumble;

// Namespace threat_sight_rumble
// Params 0, eflags: 0x5
// Checksum 0xaba78fb2, Offset: 0xac
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"threat_sight_rumble", undefined, undefined, &post_main );
}

// Namespace threat_sight_rumble
// Params 0, eflags: 0x4
// Checksum 0x264181a6, Offset: 0xcd
// Size: 0x1b
function private post_main()
{
    /#
        setdvarifuninitialized( @"scr_debug_stealth_rumble", 0 );
    #/
    
    thread function_b8a61851e35dfd7b();
}

// Namespace threat_sight_rumble
// Params 0, eflags: 0x4
// Checksum 0x4c83ad78, Offset: 0xf0
// Size: 0xe7
function private function_b8a61851e35dfd7b()
{
    if ( !( isdefined( level.gamemodebundle ) && isdefined( level.gamemodebundle.stealthbundle ) ) )
    {
        return;
    }
    
    stealthbundle = getscriptbundle( level.gamemodebundle.stealthbundle );
    
    if ( !isdefined( stealthbundle ) )
    {
        return;
    }
    
    level.var_714a3a88037afca2 = stealthbundle.var_714a3a88037afca2;
    level.var_6a0d42b756d9f731 = stealthbundle.var_6a0d42b756d9f731;
    level.var_cb4ff070198cb06f = stealthbundle.var_cb4ff070198cb06f;
    utility::flag_wait( "stealth_enabled" );
    
    if ( isdefined( level.stealth ) )
    {
        level.stealth.var_ae213a088f33e772 = &threat_sight_player_sight_rumble;
        level.stealth.var_808af9e51b9c548a = &function_20918bc0487a3915;
        level utility::flag_set( "threat_sight_rumble_enabled" );
    }
}

// Namespace threat_sight_rumble
// Params 2, eflags: 0x4
// Checksum 0x86a4291b, Offset: 0x1df
// Size: 0x165
function private threat_sight_player_sight_rumble( anycansee, maxthreat )
{
    assert( isplayer( self ) );
    player = self;
    
    if ( !( isdefined( player.stealth ) && isdefined( level.var_714a3a88037afca2 ) && isdefined( level.var_cb4ff070198cb06f ) ) )
    {
        return;
    }
    
    if ( player stealth_manager::anyone_in_combat() )
    {
        player function_fc17d149bafe7054( undefined );
        
        if ( player.stealth.previousmaxthreat > 0 )
        {
            player playrumbleonentity( level.var_cb4ff070198cb06f );
        }
        
        maxthreat = 0;
    }
    else if ( ( !isdefined( player.stealth.previousmaxthreat ) || player.stealth.previousmaxthreat < 1 ) && maxthreat >= 1 )
    {
        player function_fc17d149bafe7054( undefined );
        player playrumbleonentity( level.var_cb4ff070198cb06f );
    }
    else if ( maxthreat >= 0.6 )
    {
        player function_fc17d149bafe7054( level.var_6a0d42b756d9f731 ?? level.var_714a3a88037afca2 );
    }
    else if ( maxthreat > 0 )
    {
        player function_fc17d149bafe7054( level.var_714a3a88037afca2 );
    }
    else
    {
        player function_fc17d149bafe7054( undefined );
    }
    
    player.stealth.previousmaxthreat = maxthreat;
}

// Namespace threat_sight_rumble
// Params 1, eflags: 0x4
// Checksum 0x638bee85, Offset: 0x34c
// Size: 0x1de
function private function_fc17d149bafe7054( rumble )
{
    assert( isplayer( self ) );
    player = self;
    
    if ( ( rumble ?? "" ) != ( player.stealth.var_c9ae4c8cdd5ce9df ?? "" ) )
    {
        if ( isdefined( player.stealth.var_c9ae4c8cdd5ce9df ) )
        {
            player stoprumble( player.stealth.var_c9ae4c8cdd5ce9df );
        }
        
        if ( isdefined( rumble ) )
        {
            player playrumblelooponentity( rumble );
        }
        
        player.stealth.var_c9ae4c8cdd5ce9df = rumble;
        
        /#
            if ( getdvarint( @"scr_debug_stealth_rumble", 0 ) && !isdefined( player.stealth.var_b8a1ee7dae4460ec ) )
            {
                hudelem = newclienthudelem( player );
                hudelem.alignx = "<dev string:x24>";
                hudelem.aligny = "<dev string:x2b>";
                hudelem.x = 320;
                hudelem.y = 300;
                hudelem.foreground = 1;
                hudelem.color = ( 1, 1, 1 );
                hudelem.fontscale = 2;
                player.stealth.var_b8a1ee7dae4460ec = hudelem;
            }
            
            if ( isdefined( player.stealth.var_b8a1ee7dae4460ec ) )
            {
                if ( isdefined( rumble ) )
                {
                    player.stealth.var_b8a1ee7dae4460ec setdevtext( "<dev string:x32>" + rumble );
                    return;
                }
                
                player.stealth.var_b8a1ee7dae4460ec setdevtext( "<dev string:x43>" );
            }
        #/
    }
}

// Namespace threat_sight_rumble
// Params 0, eflags: 0x4
// Checksum 0xc5520dec, Offset: 0x532
// Size: 0x17
function private function_20918bc0487a3915()
{
    assert( isplayer( self ) );
    function_fc17d149bafe7054( undefined );
}

