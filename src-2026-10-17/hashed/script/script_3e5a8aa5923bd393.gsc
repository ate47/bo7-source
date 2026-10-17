#using script_173ce52127e2f80d;
#using script_239a365a92ee4476;
#using script_32d93a194074fa6a;
#using script_44102c05f33e9b1e;
#using script_45e6947be98e16e3;
#using script_5693b37bfb748170;
#using script_5dfa1fb6b030bdcb;
#using script_6981400abfcd765c;
#using script_782ed84671b152fb;
#using scripts\common\system;

#namespace ftue_br;

// Namespace ftue_br
// Params 0, eflags: 0x5
// Checksum 0x8b51a9f7, Offset: 0x8e
// Size: 0x19
function private autoexec __init__system__()
{
    system::register( #"br_ftue", undefined, undefined, &init );
}

// Namespace ftue_br
// Params 0
// Checksum 0xab78525, Offset: 0xaf
// Size: 0x73
function init()
{
    function_7d3ce1ebdb60c4fb();
    namespace_70ebaadbdb24c64d::init();
    namespace_727c07157c884ff5::init();
    
    if ( ftue_progress::ftue_enabled() )
    {
        ftue_tip::ftue_tip_init( level.gametypebundle.ftuetiplist );
        ftue_telemetry::function_4613112d313d82ad( "JUP_BR" );
        ftue_objectives::function_50101ec1259fbc62();
        thread namespace_44e8cefed76aa88e::init( &namespace_70ebaadbdb24c64d::function_69d58ce278635296, undefined, &namespace_70ebaadbdb24c64d::function_2a1ffa928d6acd27, &namespace_44e68768d1d1a5d6::playertriggercallback );
        
        /#
            br_dev::registerhandlecommand( &handledevcommand_ftue_br );
        #/
    }
}

// Namespace ftue_br
// Params 0, eflags: 0x4
// Checksum 0xe07b067e, Offset: 0x12a
// Size: 0x10
function private function_7d3ce1ebdb60c4fb()
{
    level.var_eacaa7f6211fe730 = "ftueDataWZ";
}

// Namespace ftue_br
// Params 0, eflags: 0x4
// Checksum 0x10540b0e, Offset: 0x142
// Size: 0x2
function private function_d40c86f220099742()
{
    
}

/#

    // Namespace ftue_br
    // Params 2
    // Checksum 0xe75b02ce, Offset: 0x14c
    // Size: 0x11f, Type: dev
    function handledevcommand_ftue_br( command, args )
    {
        switch ( command )
        {
            case #"hash_b5a6af7cf5041e12":
                namespace_44e8cefed76aa88e::function_4030773d862a10c6( args[ 0 ] );
                break;
            case #"hash_a68a5252e80fe0a7":
                if ( !isdefined( args ) || args.size == 0 )
                {
                    tooltipscompleted = 0;
                }
                else
                {
                    tooltipscompleted = ftue_progress::function_1e3f556a985cf18c();
                    
                    foreach ( tipref in args )
                    {
                        tipid = namespace_44e8cefed76aa88e::function_5ac7a56ac91c3eb( tipref );
                        
                        if ( isdefined( tipid ) )
                        {
                            mask = 1 << tipid;
                            tooltipscompleted &= ~mask;
                        }
                    }
                }
                
                ftue_progress::function_d00c0941d634466b( tooltipscompleted );
                break;
            default:
                break;
        }
    }

#/
