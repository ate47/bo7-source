#using scripts\common\callbacks;
#using scripts\common\system;

#namespace namespace_91c762c506fb5dfa;

// Namespace namespace_91c762c506fb5dfa
// Params 0, eflags: 0x5
// Checksum 0xd22246db, Offset: 0xbd
// Size: 0x21
function private autoexec __init__system__()
{
    system::register( #"hash_76d42bd0ac53b1df", #"hash_20b817cb976e5b11", &init, undefined );
}

// Namespace namespace_91c762c506fb5dfa
// Params 0, eflags: 0x4
// Checksum 0xeadf3110, Offset: 0xe6
// Size: 0x4b
function private init()
{
    if ( !level.gametypebundle.var_41729606a9fcbc3a )
    {
        return;
    }
    
    var_6cbef891ee2debfb = hashcat( @"hash_3391fc87273dad01", "Down_But_Not_Out" );
    
    if ( getdvarint( var_6cbef891ee2debfb, 0 ) == 0 )
    {
        function_daaf741180d9d22f();
    }
}

// Namespace namespace_91c762c506fb5dfa
// Params 0, eflags: 0x4
// Checksum 0x91b27979, Offset: 0x139
// Size: 0x1da
function private function_daaf741180d9d22f()
{
    var_68f543069583585c = getscriptbundle( level.gametypebundle.var_41729606a9fcbc3a );
    
    if ( !var_68f543069583585c )
    {
        return;
    }
    
    callback::add( #"hash_73a7857f05c8d05a", &function_2ec737fc9b184f1f );
    callback::add( #"hash_188dc7b9cdd0b6f3", &function_34c9da3c91a55c94 );
    level.var_ddaf8edbbbde658a = -1;
    
    foreach ( schedule in var_68f543069583585c.var_a927e81b58c1064f )
    {
        if ( schedule.label == "Down_But_Not_Out" )
        {
            foreach ( trigger in schedule.triggers )
            {
                if ( trigger.variant_object.triggertype == "ON_EACH_CIRCLE" )
                {
                    level.var_ddaf8edbbbde658a = trigger.variant_object.maxcircle - 1;
                    level.var_9f3e65403fec466 = trigger.variant_object.circleevent;
                    break;
                }
            }
            
            break;
        }
    }
    
    setomnvar( o"ui_br_activity_schedule_down_but_not_out_state", level.var_ddaf8edbbbde658a >= 0 ? 1 : 0 );
}

// Namespace namespace_91c762c506fb5dfa
// Params 1, eflags: 0x4
// Checksum 0x2966df92, Offset: 0x31b
// Size: 0x1a
function private function_2ec737fc9b184f1f( params )
{
    function_b1a2611817748dd8( "CircleSet", params );
}

// Namespace namespace_91c762c506fb5dfa
// Params 1, eflags: 0x4
// Checksum 0x242630ba, Offset: 0x33d
// Size: 0x1a
function private function_34c9da3c91a55c94( params )
{
    function_b1a2611817748dd8( "CircleBeginClose", params );
}

// Namespace namespace_91c762c506fb5dfa
// Params 2, eflags: 0x4
// Checksum 0xbe157a45, Offset: 0x35f
// Size: 0x5e
function private function_b1a2611817748dd8( circleevent, var_1a39cca760ef1480 )
{
    if ( level.var_9f3e65403fec466 == circleevent )
    {
        var_15098feff65ac78d = var_1a39cca760ef1480.circleindex < level.var_ddaf8edbbbde658a;
        setomnvar( o"ui_br_activity_schedule_down_but_not_out_state", var_15098feff65ac78d ? 1 : 0 );
    }
}

