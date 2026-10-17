#using scripts\common\devgui;
#using scripts\common\scripted_widgets;

#namespace br_upgrade_splash;

// Namespace br_upgrade_splash
// Params 0
// Checksum 0x9d8603cc, Offset: 0xb0
// Size: 0xd
function br_upgrade_splash_is_active()
{
    return scripted_widgets::is_active( "br_upgrade_splash" );
}

// Namespace br_upgrade_splash
// Params 0
// Checksum 0x673e7a20, Offset: 0xc6
// Size: 0x7e
function open_br_upgrade_splash()
{
    assert( !br_upgrade_splash_is_active(), "<dev string:x24>" );
    
    if ( br_upgrade_splash_is_active() )
    {
        return;
    }
    
    self endon( #"death" );
    self endon( #"entitydeleted" );
    self endon( #"deactivate_br_upgrade_splash" );
    self notify( #"activated_br_upgrade_splash" );
    scripted_widgets::create( "br_upgrade_splash", scripted_widgets::function_652736891a41e948( "scripted_widget_br_upgrade_splash" ), {}, 1 );
    scripted_widgets::set_position( "br_upgrade_splash", 0, 0, 3, 3 );
    return 1;
}

// Namespace br_upgrade_splash
// Params 1
// Checksum 0x9d7ca22e, Offset: 0x14d
// Size: 0x29
function close_br_upgrade_splash( val )
{
    if ( !br_upgrade_splash_is_active() )
    {
        return;
    }
    
    scripted_widgets::destroy( "br_upgrade_splash" );
    self disablephysicaldepthoffieldscripting();
}

/#

    // Namespace br_upgrade_splash
    // Params 0
    // Checksum 0x950cbc9b, Offset: 0x17e
    // Size: 0x2e, Type: dev
    function init_br_upgrade_splash_devgui()
    {
        devgui::function_9082edeb5db93280( "<dev string:x4e>" );
        devgui::add_devgui_func( "<dev string:x72>", "<dev string:x86>", &test_br_upgrade_splash );
        devgui::function_77df7fe7dd273e10();
    }

    // Namespace br_upgrade_splash
    // Params 0
    // Checksum 0x7055e63a, Offset: 0x1b4
    // Size: 0x95, Type: dev
    function test_br_upgrade_splash()
    {
        foreach ( player in level.players )
        {
            player open_br_upgrade_splash();
            player waittill( #"upgradesplashhide" );
            player close_br_upgrade_splash();
        }
    }

#/
