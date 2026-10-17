#using script_6802bb17a0c535f3;
#using scripts\common\callbacks;

#namespace medals;

// Namespace medals
// Params 0, eflags: 0x1
// Checksum 0x758e7ec4, Offset: 0x76
// Size: 0x25
function autoexec register_init()
{
    aar_tracking::function_e32d863f90d794a1( #"medals", &init_medal_tracking );
    level.var_705cfa989075904f = &function_392096d2b50a12d0;
}

// Namespace medals
// Params 1, eflags: 0x4
// Checksum 0xafffd0f5, Offset: 0xa3
// Size: 0x4c
function private init_medal_tracking( aar_tracking_ref )
{
    if ( level.aartracking.trackmedals )
    {
        callback::add( #"medal_earned", &track_medal );
        callback::add( #"player_connect", &on_player_connect );
    }
}

// Namespace medals
// Params 2, eflags: 0x4
// Checksum 0x5d82bb92, Offset: 0xf7
// Size: 0x5b
function private function_392096d2b50a12d0( ref, splashbundle )
{
    if ( !level.aartracking.trackmedals )
    {
        level.var_705cfa989075904f = undefined;
        return;
    }
    
    if ( !isdefined( level.var_61098ea01390d8f4 ) )
    {
        level.var_61098ea01390d8f4 = [];
    }
    
    level.var_61098ea01390d8f4[ ref ] = splashbundle;
}

// Namespace medals
// Params 1, eflags: 0x4
// Checksum 0x7cb38909, Offset: 0x15a
// Size: 0x13
function private on_player_connect( params )
{
    function_81fb7aaf48f3b593();
}

// Namespace medals
// Params 0, eflags: 0x4
// Checksum 0x9d9658d0, Offset: 0x175
// Size: 0x7a
function private function_81fb7aaf48f3b593()
{
    if ( getdvarint( @"hash_10d3948a554a7839", 0 ) )
    {
        return;
    }
    
    if ( self.pers[ #"hash_11255497043fc174" ] )
    {
        return;
    }
    
    self.pers[ #"hash_11255497043fc174" ] = 1;
    progressiongroup = level.progressiongroup;
    self setplayerdata( progressiongroup, #"aardata", #"medalcount", 0 );
    thread function_51011926b305318f( progressiongroup );
}

// Namespace medals
// Params 1, eflags: 0x4
// Checksum 0x34048332, Offset: 0x1f7
// Size: 0xbe
function private function_51011926b305318f( progressiongroup )
{
    self endon( #"disconnect" );
    var_4b93648b95dd83b0 = getdvarint( @"hash_2611841fb194ec3e", 16 );
    
    if ( var_4b93648b95dd83b0 <= 0 )
    {
        var_4b93648b95dd83b0 = 16;
    }
    
    for ( medalindex = 0; medalindex < 512 ; medalindex++ )
    {
        if ( medalindex % var_4b93648b95dd83b0 == 0 && medalindex >= var_4b93648b95dd83b0 )
        {
            waitframe();
        }
        
        self setplayerdata( progressiongroup, #"aardata", #"medals", medalindex, #"medalref", %"" );
        self setplayerdata( progressiongroup, #"aardata", #"medals", medalindex, #"count", 0 );
    }
}

// Namespace medals
// Params 1, eflags: 0x4
// Checksum 0xb0a5af94, Offset: 0x2bd
// Size: 0x1a5
function private track_medal( params )
{
    medalref = params.ref;
    splashbundle = level.var_61098ea01390d8f4[ medalref ];
    
    if ( !isdefined( splashbundle ) )
    {
        return;
    }
    
    progressiongroup = level.progressiongroup;
    aarmedalinfo = self.pers[ #"aarmedalinfo" ];
    
    if ( !isdefined( aarmedalinfo ) )
    {
        aarmedalinfo = {};
        self.pers[ #"aarmedalinfo" ] = aarmedalinfo;
    }
    
    if ( !isdefined( aarmedalinfo.var_246109ef9290fdca ) )
    {
        aarmedalinfo.var_246109ef9290fdca = [];
    }
    
    medalindex = aarmedalinfo.var_246109ef9290fdca[ medalref ];
    
    if ( !isdefined( medalindex ) )
    {
        medalindex = self getplayerdata( progressiongroup, #"aardata", #"medalcount" );
        
        if ( medalindex >= 512 )
        {
            return;
        }
        
        aarmedalinfo.var_246109ef9290fdca[ medalref ] = medalindex;
        self setplayerdata( progressiongroup, #"aardata", #"medalcount", medalindex + 1 );
    }
    
    medalcount = self getplayerdata( progressiongroup, #"aardata", #"medals", medalindex, #"count" );
    
    if ( medalcount == 0 )
    {
        self setplayerdata( progressiongroup, #"aardata", #"medals", medalindex, #"medalref", splashbundle );
    }
    
    self setplayerdata( progressiongroup, #"aardata", #"medals", medalindex, #"count", medalcount + 1 );
}

