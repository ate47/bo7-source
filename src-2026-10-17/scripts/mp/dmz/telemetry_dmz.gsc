#namespace telemetry_dmz;

// Namespace telemetry_dmz
// Params 0
// Checksum 0xc11d55ec, Offset: 0x76
// Size: 0x100
function function_3ae64a84c6590538()
{
    lpconlevel = #"undefined";
    
    if ( isdefined( level.lpconmanager ) && isdefined( level.lpconmanager.currentalertlevel ) )
    {
        var_fcab7b9f89e38ad5 = level.lpconmanager.currentalertlevel;
        
        switch ( var_fcab7b9f89e38ad5 )
        {
            case 0:
                lpconlevel = #"hash_c6851a6deebc5413";
                break;
            case 1:
                lpconlevel = #"hash_7d305d057fa7b947";
                break;
            case 2:
                lpconlevel = #"hash_c63664e808c01db2";
                break;
            case 3:
                lpconlevel = #"hash_3c2f470545de38d3";
                break;
            case 4:
                lpconlevel = #"hash_69645756fbedb0a2";
                break;
            case 5:
                lpconlevel = #"hash_b75819a959589344";
                break;
        }
    }
    
    return lpconlevel;
}

