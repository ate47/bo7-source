#using scripts\asm\asm;
#using scripts\asm\asm_bb;
#using scripts\asm\cap;
#using scripts\common\cap;

#namespace call_reinforcements;

// Namespace call_reinforcements
// Params 1
// Checksum 0xe4d1192c, Offset: 0x27c
// Size: 0x5c
function getfunction( funcid )
{
    switch ( funcid )
    {
        case #"hash_dab0d83df51da4d":
            return &onuserinit;
        case #"hash_722d767fd6d40f56":
            return &onuserterminate;
        case #"hash_256644959193a6c7":
            return &callreinforcements;
    }
    
    assertmsg( "<dev string:x24>" + funcid );
}

// Namespace call_reinforcements
// Params 1
// Checksum 0x440cda2d, Offset: 0x2e0
// Size: 0xc
function onuserinit( interactionid )
{
    
}

// Namespace call_reinforcements
// Params 1
// Checksum 0x1a0eac76, Offset: 0x2f4
// Size: 0x1c
function onuserterminate( interactionid )
{
    self clearbtgoal( 1 );
    self notify( "endcallreinforcements" );
}

// Namespace call_reinforcements
// Params 2
// Checksum 0xc88b8336, Offset: 0x318
// Size: 0xb2
function callreinforcements( statename, params )
{
    self endon( "death" );
    self endon( "endcallreinforcements" );
    callreinforcementsbundle = getscriptbundle( "ai_behavior_call_reinforcements:ai_behavior_call_reinforcements_default" );
    
    if ( !isdefined( callreinforcementsbundle ) )
    {
        assertmsg( "<dev string:x45>" );
        return;
    }
    
    self function_461dc0438f85cf1d( 1 );
    self setbtgoalradius( 1, 12 );
    capname = "cap_call_reinforcements";
    
    if ( self.asmname != capname )
    {
        cap::cap_start( capname, "caps/interactions/cap_call_reinforcements" );
    }
    
    self playsound( "dx_br_dbos_dbli_dbtp_bitr" );
    thread function_9bccbee61c4d560d( callreinforcementsbundle.var_45aca519a5278d6 );
    self waittill( "cap_exit_completed" );
}

// Namespace call_reinforcements
// Params 1
// Checksum 0x455f6731, Offset: 0x3d2
// Size: 0x73
function function_9bccbee61c4d560d( calllength )
{
    self endon( "death" );
    self endon( "endcallreinforcements" );
    wait calllength;
    
    if ( isdefined( level.agent_funcs ) )
    {
        spawnreinforcementsfunc = level.agent_funcs[ "spawn_reinforcements" ];
        
        if ( isdefined( spawnreinforcementsfunc ) )
        {
            [[ spawnreinforcementsfunc ]]( self.origin, 0, 1 );
        }
    }
    
    asm::asm_fireevent( self.asmname, "call_reinforcements_loop_end" );
}

// Namespace call_reinforcements
// Params 3
// Checksum 0x9e3edade, Offset: 0x44d
// Size: 0x13c
function callreinforcementschooseanim( asmname, statename, params )
{
    sectionname = params;
    
    if ( !isdefined( sectionname ) )
    {
        assertmsg( "<dev string:xba>" );
        return;
    }
    
    stance = asm_bb::bb_getrequestedstance();
    coverstate = asm_bb::bb_getrequestedcoverstate();
    animname = "call_reinforcements";
    
    if ( coverstate != "exposed" )
    {
        covernode = asm_bb::bb_getcovernode();
        
        if ( isdefined( covernode ) )
        {
            covertype = covernode.type;
            
            switch ( covertype )
            {
                case #"hash_cd3ffe799551db82":
                    animname += "_cover_right_" + stance;
                    break;
                case #"hash_e1d8e1adebed5a61":
                    animname += "_cover_left_" + stance;
                    break;
                case #"hash_c3b74422dec48736":
                    animname += "_cover_crouch";
                    break;
                case #"hash_78b110033ccb68b0":
                    animname += "_cover_stand";
                    break;
            }
        }
    }
    
    animname += "_" + sectionname;
    alternativename = asm_cap::cap_lookupanimfromalias( statename, animname );
    return alternativename;
}

