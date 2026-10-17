#namespace killstreak;

// Namespace killstreak
// Params 1
// Checksum 0x11433263, Offset: 0x76
// Size: 0xa5
function function_85b2d8e857ab4898( streakname )
{
    globals = level.streakglobals;
    
    if ( level.var_ac98e7cc4b10cb11 )
    {
        streakbundlename = self.pers[ #"hash_5358b5a919fe00a6" ][ streakname ];
        
        if ( streakbundlename )
        {
            bundle = globals.var_91bdb7de5b47da10[ streakbundlename ];
        }
    }
    
    if ( !isdefined( bundle ) )
    {
        bundle = globals.streakbundles[ streakname ];
    }
    
    /#
        if ( !isdefined( bundle ) && isdefined( streakname ) )
        {
            iprintln( "<dev string:x24>" + streakname + "<dev string:x41>" );
        }
    #/
    
    return bundle;
}

