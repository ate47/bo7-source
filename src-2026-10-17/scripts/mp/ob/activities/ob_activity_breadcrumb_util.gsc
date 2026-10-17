#using script_194f8050b4a6d3a1;
#using script_60cd1c57e94be8d7;
#using scripts\mp\objidpoolmanager;

#namespace ob_activity_breadcrumb_util;

// Namespace ob_activity_breadcrumb_util
// Params 3
// Checksum 0x7532a9fd, Offset: 0x9d
// Size: 0x79
function activatebreadcrumb( icon, player, location )
{
    level endon( #"game_ended" );
    
    if ( !isdefined( icon ) )
    {
        icon = "sat_ob_objectivemarker_supply_chain";
    }
    
    if ( !self.objidnum )
    {
        function_c36ddf321e5bdc33( icon, player.team, location + ( 0, 0, 60 ) );
        self.breadcrumbloc = location;
        thread function_ced6b91e2e07a4c();
    }
}

// Namespace ob_activity_breadcrumb_util
// Params 3, eflags: 0x4
// Checksum 0xee02dddc, Offset: 0x11e
// Size: 0x103
function private function_c36ddf321e5bdc33( icon, teamname, location )
{
    level endon( #"game_ended" );
    self.objidnum = namespace_d7fa4530141146a5::function_de87bf7072515cd3( icon, 0, 1 );
    waitframe();
    objidpoolmanager::update_objective_position( self.objidnum, location );
    objidpoolmanager::objective_set_play_intro( self.objidnum, 1 );
    squad = teams::getsquadmates( self.team );
    
    foreach ( player in squad )
    {
        objective_addclienttomask( self.objidnum, player );
        objective_showtoplayersinmask( self.objidnum );
    }
}

// Namespace ob_activity_breadcrumb_util
// Params 0, eflags: 0x4
// Checksum 0xd76b8181, Offset: 0x229
// Size: 0x47
function private function_ced6b91e2e07a4c()
{
    level endon( #"game_ended" );
    self endon( #"death_or_disconnect" );
    
    while ( distance2dsquared( self.origin, self.breadcrumbloc ) > 968753 )
    {
        wait 1;
    }
    
    function_8d182246694531fb( self );
}

// Namespace ob_activity_breadcrumb_util
// Params 1, eflags: 0x4
// Checksum 0xd709f4e2, Offset: 0x278
// Size: 0x20
function private function_8d182246694531fb( objectiveowner )
{
    objectiveowner namespace_d7fa4530141146a5::function_501e44ea1cb9219d( objectiveowner.objidnum );
}

