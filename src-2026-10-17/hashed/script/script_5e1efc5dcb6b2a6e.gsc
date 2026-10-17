#using script_11f1c46396d1b9f;
#using script_5a8c477067090fe4;
#using scripts\common\elevators;
#using scripts\mp\emp_debuff;
#using scripts\mp\ent_manager;
#using scripts\mp\equipment_interact;
#using scripts\mp\sentientpoolmanager;
#using scripts\mp\weapons;

#namespace agent_claymore;

// Namespace agent_claymore
// Params 0
// Checksum 0x9e6ebdef, Offset: 0xd6
// Size: 0x13
function agentclaymore_init()
{
    weapons::registeragentusedcallback( "claymore", &function_769f095bb74bb9ad );
}

// Namespace agent_claymore
// Params 1
// Checksum 0xbb91d4bf, Offset: 0xf1
// Size: 0x15
function function_769f095bb74bb9ad( grenade )
{
    grenade agentclaymore_plant();
}

// Namespace agent_claymore
// Params 0
// Checksum 0xd1b7d819, Offset: 0x10e
// Size: 0x1a4
function agentclaymore_plant()
{
    self endon( #"mine_triggered" );
    self endon( #"mine_destroyed" );
    self endon( #"death" );
    owner = self.owner;
    ent_manager::registerspawn( 1, &claymore::sweepclaymore );
    sentientpoolmanager::registersentient( "Lethal_Static", owner, 1 );
    owner weapons::onequipmentplanted( self, "equip_claymore", &claymore::claymore_delete );
    self missilethermal();
    self missileoutline();
    self setentityowner( owner );
    self setotherent( owner );
    self setnodeploy( 1 );
    thread weapons::minedamagemonitor();
    thread claymore::claymore_explodeonnotify();
    emp_debuff::set_apply_emp_callback( &claymore::claymore_empapplied );
    haywire::function_7f69a1eb3d590f76( &claymore::function_a0bd3217832fded7 );
    claymore::function_a4ebfb83ec0621b9( &claymore::claymore_destroy );
    
    if ( isdefined( level.elevators ) )
    {
        foreach ( elevators in level.elevators )
        {
            elevators thread elevators::isentitytouchingdoortrigger( self );
        }
    }
    
    claymore::claymore_updatedangerzone();
    self setscriptablepartstate( "plant", "active", 0 );
    owner setscriptablepartstate( "equipClaymoreFXView", "plant", 0 );
    thread claymore::claymore_forceclampangles();
    wait 1;
    self setscriptablepartstate( "arm", "active", 0 );
    thread claymore::claymore_watchfortrigger();
    thread equipment_interact::remoteinteractsetup( &claymore::claymore_trigger, 1, 1 );
}

