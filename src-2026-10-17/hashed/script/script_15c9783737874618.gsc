#using script_6c2f6a14fa53759e;
#using scripts\common\callbacks;
#using scripts\common\devgui;
#using scripts\common\math;
#using scripts\common\status_effects\effect_wound;
#using scripts\common\utility;
#using scripts\common\vehicle;

#namespace zombie_callisto_wound;

/#

    // Namespace zombie_callisto_wound
    // Params 0
    // Checksum 0xe106cb24, Offset: 0x9f
    // Size: 0xc, Type: dev
    function function_b845eaef22236e9()
    {
        setup_wound_devgui();
    }

#/

// Namespace zombie_callisto_wound
// Params 0
// Checksum 0x7d252674, Offset: 0xb3
// Size: 0x13
function init_zombie_callisto_wound()
{
    callback::add( "zombie_melee", &on_callisto_melee );
}

// Namespace zombie_callisto_wound
// Params 1
// Checksum 0xbb334b1, Offset: 0xce
// Size: 0x15d
function apply_wound( target )
{
    if ( isalive( target ) && !target vehicle::is_vehicle() )
    {
        has_quick_revive = isplayer( target ) && target utility::callsharedfunc( #"zombie_perks", #"has_zombie_perk", "specialty_quickrevive" );
        duration = has_quick_revive ? self.zombieaisettings.var_d3de1a9faac42deb.var_35c67171e96fa06d : self.zombieaisettings.var_d3de1a9faac42deb.woundduration;
        target effect_wound::wound( duration, self.zombieaisettings.var_d3de1a9faac42deb.var_5164dd88e96d2b7d, self.zombieaisettings.var_d3de1a9faac42deb.var_665d6700a6efc4c1, self.zombieaisettings.var_d3de1a9faac42deb.woundgraceperiod, self.zombieaisettings.var_d3de1a9faac42deb.wounddamage, self.zombieaisettings.var_d3de1a9faac42deb.var_9ba66c4bd3c676b1, self, self, self.zombieaisettings.var_d3de1a9faac42deb.var_6be3c5a4cf98c430 );
    }
}

// Namespace zombie_callisto_wound
// Params 1, eflags: 0x4
// Checksum 0xfe0dbc58, Offset: 0x233
// Size: 0x170
function private on_callisto_melee( params )
{
    target = params.meleehitent;
    
    if ( !isplayer( target ) && !( target && target vehicle::is_vehicle() ) )
    {
        thread function_e5cfdb64bf2cbc8a();
    }
    
    if ( !target || !self )
    {
        return;
    }
    
    if ( target.team != self.team )
    {
        if ( !target vehicle::is_vehicle() )
        {
            self setscriptablepartstate( #"bitevfx", #"on", 0 );
            apply_wound( target );
        }
        else
        {
            self setscriptablepartstate( #"bitevfx", #"on_veh", 0 );
            function_afb37cb1e8cf8ab8( params.damagepoint, target );
        }
    }
    
    center = self getcentroid() + anglestoforward( self.angles ) * 100;
    ai_array = getaiarrayinradius( center, 50 );
    
    foreach ( ai in ai_array )
    {
        ai notify( #"hash_a0c8fe3d0fbe8d85" );
    }
}

// Namespace zombie_callisto_wound
// Params 2
// Checksum 0x1f28cc05, Offset: 0x3ab
// Size: 0x100
function function_afb37cb1e8cf8ab8( world_pos, target )
{
    forcevec = anglestoforward( self.angles );
    strength = getdvarint( @"hash_310d28c35979b32f", 200000 );
    forcevec *= strength;
    hit_pos = world_pos;
    end = coordtransformtranspose( hit_pos + forcevec, target.origin, target.angles );
    boundsmid = target getboundsmidpoint();
    boundssize = target getboundshalfsize();
    hit_pos = coordtransformtranspose( hit_pos, target.origin, target.angles );
    hit_pos = math::function_1243a6cc6a030f2a( hit_pos, boundsmid, boundssize, target.angles );
    start = hit_pos * 0.4 + ( 0, 0, boundssize[ 2 ] );
    target vehphys_force( end - start, start, 0 );
}

// Namespace zombie_callisto_wound
// Params 0, eflags: 0xc
// Checksum 0x1a02ef38, Offset: 0x4b3
// Size: 0x85
function private function_e5cfdb64bf2cbc8a()
{
    self notify( #"hash_6b07137ba413310a" );
    self endon( #"hash_6b07137ba413310a" );
    self endon( #"death" );
    oldthreshold = self._blackboard.var_4f59295d1d34e1a9;
    self._blackboard.var_4f59295d1d34e1a9 = -1;
    self waittill( #"bmeleeended" );
    
    if ( self )
    {
        self._blackboard.var_4f59295d1d34e1a9 = oldthreshold;
    }
}

/#

    // Namespace zombie_callisto_wound
    // Params 0
    // Checksum 0x54381dbd, Offset: 0x540
    // Size: 0x2e, Type: dev
    function setup_wound_devgui()
    {
        devgui::function_9082edeb5db93280( "<dev string:x24>" );
        devgui::add_devgui_func( "<dev string:x3e>", "<dev string:x54>", &force_wound );
        devgui::function_77df7fe7dd273e10();
    }

    // Namespace zombie_callisto_wound
    // Params 0, eflags: 0x4
    // Checksum 0x306b35f3, Offset: 0x576
    // Size: 0x56, Type: dev
    function private force_wound()
    {
        callisto = zombie_utils::get_closest_zombie( level.players[ 0 ].origin, undefined, "<dev string:x69>" );
        
        if ( isdefined( callisto ) )
        {
            callisto on_callisto_melee( { #meleehitent:level.players[ 0 ] } );
        }
    }

#/
