#using scripts\common\system;
#using scripts\common\utility;

#namespace br_sidequest_wine_bottle;

// Namespace br_sidequest_wine_bottle
// Params 0, eflags: 0x5
// Checksum 0xafccc5b0, Offset: 0xcf
// Size: 0x21
function private autoexec __init__system__()
{
    system::register( #"hash_a3a60f6514909f18", #"br_interact_sidequest", &pre_main, undefined );
}

// Namespace br_sidequest_wine_bottle
// Params 0
// Checksum 0xd3213698, Offset: 0xf8
// Size: 0x44
function pre_main()
{
    utility::registersharedfunc( #"interact_sidequest", getxhash( "wine_bottle" + "_on_infil" ), &on_infil );
    utility::registersharedfunc( #"interact_sidequest", getxhash( "wine_bottle" ), &on_complete );
}

// Namespace br_sidequest_wine_bottle
// Params 0
// Checksum 0x545b42f5, Offset: 0x144
// Size: 0x4c
function on_infil()
{
    interact_scriptable = spawnscriptable( "quest_wz_wine_bottle", self.interactlocations[ 0 ].origin, self.interactlocations[ 0 ].angles );
    self.interact_scriptable = interact_scriptable;
}

// Namespace br_sidequest_wine_bottle
// Params 1
// Checksum 0x46f9d6b2, Offset: 0x198
// Size: 0x3d
function on_complete( player )
{
    utility::exploder( "ee_winebottle" );
    
    if ( isdefined( self.interact_scriptable ) )
    {
        self.interact_scriptable setscriptablepartstate( "base", "interact" );
    }
}

