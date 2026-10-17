#using scripts\common\system;

#namespace zm_sat_locust_rap;

// Namespace zm_sat_locust_rap
// Params 0, eflags: 0x5
// Checksum 0xd3119225, Offset: 0x92
// Size: 0x21
function private autoexec __init__system__()
{
    system::register( #"locust_rap", #"safe_area", undefined, &post_main );
}

// Namespace zm_sat_locust_rap
// Params 0, eflags: 0x4
// Checksum 0x3c30102, Offset: 0xbb
// Size: 0xf7
function private post_main()
{
    /#
        if ( isofflinetoolrun( 31 ) )
        {
            return;
        }
    #/
    
    interactions = [];
    
    foreach ( node in level.safe_area.nodes )
    {
        if ( node.enter.script_flag_set == "foot_rap" || node.enter.script_flag_set == "shoulder_rap" )
        {
            interactions[ interactions.size ] = node.enter;
        }
    }
    
    level.var_db1ca16030498d75 = { #interactions:interactions };
}

