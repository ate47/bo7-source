#using scripts\mp\compass;
#using scripts\mp\load;
#using scripts\mp\maps\mp_sat_sm_zero\gen\mp_sat_sm_zero_art;
#using scripts\mp\maps\mp_sat_sm_zero\mp_sat_sm_zero_fx;
#using scripts\mp\maps\mp_sat_sm_zero\mp_sat_sm_zero_lighting;

#namespace mp_sat_sm_zero;

// Namespace mp_sat_sm_zero
// Params 0
// Checksum 0x3a19ca97, Offset: 0x140
// Size: 0x9c
function main()
{
    mp_sat_sm_zero_art::main();
    namespace_6bcaaa815bd03afb::main();
    mp_sat_sm_zero_lighting::main();
    load::main();
    level.kill_border_triggers = getentarray( "kill_border_trigger", #targetname );
    level.outofboundstriggers = getentarray( "OutOfBounds", #targetname );
    compass::setupminimap( "compass_map_mp_sat_sm_zero" );
    game[ "attackers" ] = "allies";
    game[ "defenders" ] = "axis";
    game[ "allies_outfit" ] = "urban";
    game[ "axis_outfit" ] = "woodland";
    level thread low_gravity_trigger();
}

// Namespace mp_sat_sm_zero
// Params 0
// Checksum 0xdb6ac291, Offset: 0x1e4
// Size: 0x61
function low_gravity_trigger()
{
    level endon( #"game_ended" );
    level waittill( #"scriptables_ready" );
    level.low_gravity_trigger = getent( "low_gravity_trigger", "targetname" );
    
    if ( !isdefined( level.low_gravity_trigger ) )
    {
        return;
    }
    
    level.low_gravity_trigger thread gravity_watchtriggerenter();
    level.low_gravity_trigger thread gravity_watchtriggerexit();
}

// Namespace mp_sat_sm_zero
// Params 0
// Checksum 0xe67dceea, Offset: 0x24d
// Size: 0x6e
function gravity_watchtriggerenter()
{
    self endon( #"death" );
    
    while ( true )
    {
        self waittill( #"trigger", player );
        
        if ( isplayer( player ) )
        {
            self.playersintrigger[ player getentitynumber() ] = player;
            player.var_f38d118f2e488e27 = 1;
            player setjumpheightscale( 4 );
            player setgravityscale( 0.5 );
        }
    }
}

// Namespace mp_sat_sm_zero
// Params 0
// Checksum 0xf78a1418, Offset: 0x2c3
// Size: 0x103
function gravity_watchtriggerexit()
{
    self endon( #"death" );
    
    while ( true )
    {
        foreach ( id, player in self.playersintrigger )
        {
            if ( !isdefined( player ) )
            {
                self.playersintrigger[ id ] = undefined;
                continue;
            }
            
            if ( !isalive( player ) )
            {
                continue;
            }
            
            if ( player istouching( self ) && level.low_gravity )
            {
                continue;
            }
            
            player setjumpheightscale( 1 );
            player setgravityscale( 1 );
            self.playersintrigger[ id ] = undefined;
            self.playersintrigger[ player getentitynumber() ] = undefined;
            player.var_f38d118f2e488e27 = undefined;
        }
        
        waitframe();
    }
}

