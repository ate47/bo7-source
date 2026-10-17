#using script_2d110487966779fc;
#using script_5a8c477067090fe4;
#using script_6e1394801a4730cb;
#using scripts\common\elevators;
#using scripts\common\vehicle;
#using scripts\mp\damage;
#using scripts\mp\emp_debuff;
#using scripts\mp\ent_manager;
#using scripts\mp\sentientpoolmanager;
#using scripts\mp\weapons;

#namespace agent_sound_veil;

// Namespace agent_sound_veil
// Params 0
// Checksum 0xca649e0e, Offset: 0xfc
// Size: 0x13
function function_ef57326d0a530409()
{
    weapons::registeragentusedcallback( "sound_veil", &function_28a6a7411a752c06 );
}

// Namespace agent_sound_veil
// Params 1
// Checksum 0x3ce25955, Offset: 0x117
// Size: 0x278
function function_28a6a7411a752c06( grenade )
{
    grenade endon( #"death" );
    
    /#
        print::printgameaction( "<dev string:x24>", self );
    #/
    
    if ( !isdefined( level.soundveiltargets ) )
    {
        level.soundveiltargets = 0;
    }
    
    grenade ent_manager::registerspawn( 1, &sound_veil::soundveil_destroy );
    grenade setscriptablepartstate( "visibility", "show", 0 );
    grenade waittill( #"missile_stuck", stuckto );
    
    if ( isdefined( stuckto ) && stuckto vehicle::is_vehicle() )
    {
        grenade.vehicle_stuck = 1;
    }
    
    if ( isdefined( level.var_59abd25eeb5b2fed ) )
    {
        canplant = grenade [[ level.var_59abd25eeb5b2fed ]]();
        
        if ( !canplant )
        {
            grenade delete();
            return;
        }
    }
    
    grenade setscriptablepartstate( "plant", "active", 0 );
    grenade setotherent( self );
    grenade setnodeploy( 1 );
    grenade setnonstick( 1 );
    grenade.usedcount = 0;
    grenade.deployingplayer = self;
    grenade.activetargets = [];
    trigger = spawn( "trigger_rotatable_radius", grenade.origin, 0, 80, 300 );
    trigger.angles = grenade.angles;
    grenade.trigger = trigger;
    trigger enablelinkto();
    trigger linkto( grenade );
    weapons::onequipmentplanted( grenade, "equip_sound_veil", &sound_veil::soundveil_destroy );
    grenade sentientpoolmanager::registersentient( "Tactical_Static", self );
    maxhealth = 100;
    grenade thread damage::monitordamage( maxhealth, "hitequip", &sound_veil::soundveil_handlefataldamage, &sound_veil::soundveil_handledamage, 0 );
    grenade emp_debuff::set_apply_emp_callback( &sound_veil::soundveil_applyempcallback );
    grenade haywire::function_7f69a1eb3d590f76( &sound_veil::function_6cfe31269400c80a );
    grenade sound_veil::function_a4ebfb83ec0621b9( &sound_veil::soundveil_destroy );
    
    if ( isdefined( level.elevators ) )
    {
        foreach ( elevators in level.elevators )
        {
            elevators thread elevators::isentitytouchingdoortrigger( grenade );
        }
    }
    
    grenade sound_veil::soundveil_enable();
}

