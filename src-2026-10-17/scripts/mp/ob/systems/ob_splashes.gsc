#using scripts\common\devgui;
#using scripts\mp\hud_message;

#namespace ob_splashes;

/#

    // Namespace ob_splashes
    // Params 0
    // Checksum 0x763ab018, Offset: 0x76
    // Size: 0x10c, Type: dev
    function init()
    {
        splashlist = function_359ed87eadfb6858( level.gamemodebundle.splashlist );
        
        if ( isdefined( splashlist ) )
        {
            devgui::function_9082edeb5db93280( "<dev string:x24>" );
            var_3e40408104a8e270 = getxhashsourcename( level.gamemodebundle.splashlist );
            
            foreach ( splash in splashlist.splash_list )
            {
                splashname = getxhashsourcename( splash.ref );
                devgui::function_cd4e263c1f3018ae( splashname, "<dev string:x31>" + splashname + "<dev string:x39>" + var_3e40408104a8e270, &devgui_show_splash );
            }
            
            devgui::function_77df7fe7dd273e10();
        }
    }

    // Namespace ob_splashes
    // Params 1, eflags: 0x4
    // Checksum 0x26cc8ff1, Offset: 0x18a
    // Size: 0x2f, Type: dev
    function private function_359ed87eadfb6858( var_80756932878fc697 )
    {
        if ( !isxhashasset( var_80756932878fc697 ) )
        {
            return;
        }
        
        splashlist = getscriptbundle( var_80756932878fc697 );
        return splashlist;
    }

    // Namespace ob_splashes
    // Params 1, eflags: 0x4
    // Checksum 0x8b511e4c, Offset: 0x1c1
    // Size: 0xb9, Type: dev
    function private devgui_show_splash( params )
    {
        splashref = params[ 0 ];
        splashlist = params[ 1 ];
        
        if ( !( isdefined( splashref ) && isdefined( splashlist ) ) )
        {
            return;
        }
        
        foreach ( player in level.players )
        {
            if ( isdefined( player ) )
            {
                player hud_message::function_78fedf6f526825f4( splashref, splashlist );
            }
        }
    }

#/
