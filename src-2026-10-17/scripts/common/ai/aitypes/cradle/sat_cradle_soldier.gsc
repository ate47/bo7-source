#using scripts\common\callbacks;
#using scripts\common\utility;

#namespace sat_cradle_soldier;

// Namespace sat_cradle_soldier
// Params 2
// Checksum 0xc1ab61e9, Offset: 0x102
// Size: 0x72
function precache( classname, aitypescriptbundle )
{
    if ( isdefined( level.var_38d3d97472904f83 ) )
    {
        return;
    }
    
    level.var_38d3d97472904f83 = 1;
    level._effect[ "sat_cradle_death" ] = loadfxasset( "vfx_sat_wc_ai_cradle_soldier_death_01" );
    level._effect[ "vfx_sat_wc_spark_multi_ch_02" ] = loadfxasset( "vfx_sat_wc_spark_multi_ch_02" );
    level callback::add( "on_agent_spawned", &agent_on_spawned );
}

// Namespace sat_cradle_soldier
// Params 1, eflags: 0x4
// Checksum 0x7de5e120, Offset: 0x17c
// Size: 0x83
function private agent_on_spawned( params )
{
    agent = params.agent;
    
    if ( issubstr( agent.agent_type, "sat_ob_enemy" ) && issubstr( agent.agent_type, "_cradle" ) )
    {
        self.var_7bd2fc702f01b407 = 1;
        self.var_ea900b480a55e803 = &function_e2e17aca73007dfb;
        self.helmetshatterfx = level._effect[ "vfx_sat_wc_spark_multi_ch_02" ];
    }
}

// Namespace sat_cradle_soldier
// Params 1, eflags: 0x4
// Checksum 0xd255f4a6, Offset: 0x207
// Size: 0x59
function private function_e2e17aca73007dfb( corpseent )
{
    corpseent endon( #"death" );
    wait 0.9;
    explosionfx = utility::getfx( "sat_cradle_death" );
    
    if ( explosionfx )
    {
        playfx( explosionfx, corpseent.origin );
    }
    
    if ( corpseent )
    {
        corpseent delete();
    }
}

