#using script_3ceee332bf1eaf4b;
#using script_4f9ce8d249a99f4a;
#using script_5ad24b30e5045cbe;
#using scripts\common\callbacks;
#using scripts\common\utility;
#using scripts\common\vehicle;
#using scripts\mp\killcam;

#namespace area_swap;

// Namespace area_swap
// Params 0, eflags: 0x1
// Checksum 0x1a4d1bb6, Offset: 0xf0
// Size: 0x46
function autoexec init()
{
    utility::create_func_ref( "area_swap_begin", &area_swap_begin );
    utility::create_func_ref( "delete_entity_in_swap", &delete_entity_in_swap );
    utility::create_func_ref( "delete_scriptable_in_swap", &delete_scriptable_in_swap );
    utility::create_func_ref( "area_swap_complete", &area_swap_complete );
}

// Namespace area_swap
// Params 3
// Checksum 0x87c288b1, Offset: 0x13e
// Size: 0x94
function area_swap_begin( swapname, swapstate, hintduration )
{
    swaptime = gettime() + 1000 * hintduration;
    level thread killcam::function_98bc702d573f2159( swaptime );
    var_b7aa92c3b872e5e0 = spawnstruct();
    var_b7aa92c3b872e5e0.swapname = swapname;
    var_b7aa92c3b872e5e0.swapstate = swapstate;
    var_b7aa92c3b872e5e0.hintduration = hintduration;
    var_b7aa92c3b872e5e0.swaptime = swaptime;
    level callback::callback( "area_swap_begin", var_b7aa92c3b872e5e0 );
}

// Namespace area_swap
// Params 2
// Checksum 0x1d7a3ff9, Offset: 0x1da
// Size: 0x50
function area_swap_complete( swapname, swapstate )
{
    var_37ba139d4ed3a8cc = spawnstruct();
    var_37ba139d4ed3a8cc.swapname = swapname;
    var_37ba139d4ed3a8cc.swapstate = swapstate;
    level callback::callback( "area_swap_complete", var_37ba139d4ed3a8cc );
}

// Namespace area_swap
// Params 0
// Checksum 0x9d203fd8, Offset: 0x232
// Size: 0x124
function delete_entity_in_swap()
{
    if ( !isdefined( self ) )
    {
        return;
    }
    
    /#
        if ( 0 && isdefined( self.origin ) )
        {
            sphere( self.origin, 100, ( 1, 0, 0 ), 0, 10000 );
        }
    #/
    
    if ( isdefined( self.var_145494368702fcf2 ) )
    {
        shoulddelete = self [[ self.var_145494368702fcf2 ]]();
        
        if ( !shoulddelete )
        {
            return;
        }
    }
    
    if ( isdefined( self.streakinfo ) || self.isequipment )
    {
        utility::callsharedfunc( #"killstreak", #"dodamagetokillstreak", 10000, undefined, undefined, undefined, undefined, "MOD_EXPLOSIVE" );
        return;
    }
    
    if ( vehicle::is_vehicle() )
    {
        self.dontspawnhusk = 1;
        
        if ( self.var_9dcda86f922283e3 )
        {
            vehicle::death( self );
        }
        else
        {
            vehicle::explode();
        }
        
        return;
    }
    
    if ( isplayer( self ) )
    {
        if ( player::isreallyalive() )
        {
            self.var_a44f233822a610bf = 1;
            damage::_suicide( undefined, 1 );
        }
        
        return;
    }
    
    if ( isagent( self ) )
    {
        self.skipdeathcount = 1;
        self kill();
    }
}

// Namespace area_swap
// Params 0
// Checksum 0x1ca695e0, Offset: 0x35e
// Size: 0x95
function delete_scriptable_in_swap()
{
    if ( !isdefined( self ) )
    {
        return;
    }
    
    /#
        if ( 0 && isdefined( self.origin ) )
        {
            sphere( self.origin, 100, ( 1, 0, 1 ), 0, 10000 );
        }
    #/
    
    if ( isdefined( self.var_145494368702fcf2 ) )
    {
        shoulddelete = self [[ self.var_145494368702fcf2 ]]();
        
        if ( !shoulddelete )
        {
            return;
        }
    }
    
    if ( self getscriptableisreserved() )
    {
        pickups::function_11fce5fab2ff7791();
        self freescriptable();
        return;
    }
    
    self setscriptablepartstate( self function_84ad2f70189ee7c3(), "hidden", 1 );
}

