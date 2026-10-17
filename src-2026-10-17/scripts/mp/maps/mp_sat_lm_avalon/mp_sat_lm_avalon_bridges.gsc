#using scripts\common\utility;

#namespace mp_sat_lm_avalon_bridges;

// Namespace mp_sat_lm_avalon_bridges
// Params 0, eflags: 0x1
// Checksum 0xe647afb9, Offset: 0x101
// Size: 0x17
function autoexec function_5afa246ac7081c85()
{
    level.draw_bridges = spawnstruct();
    level thread setup_bridges();
}

// Namespace mp_sat_lm_avalon_bridges
// Params 0
// Checksum 0x9c1a3313, Offset: 0x120
// Size: 0x417
function setup_bridges()
{
    level waittill( #"player_spawned" );
    level.draw_bridges.bridge_roots = getentarray( "drawbridge_root", #script_noteworthy );
    
    if ( !level.draw_bridges.bridge_roots.size )
    {
        return;
    }
    
    foreach ( bridge_root in level.draw_bridges.bridge_roots )
    {
        bridge_root setmoverantilagged( 1 );
        bridge_root setmoveroptimized( 1 );
        bridge_root.bridge_pieces = [];
        bridge_root.bridge_pieces = getentarray( bridge_root.targetname, #target );
        
        if ( !bridge_root.bridge_pieces.size )
        {
            return;
        }
        
        foreach ( bridge_piece in bridge_root.bridge_pieces )
        {
            if ( bridge_piece.script_label == bridge_root.script_label )
            {
                bridge_piece linkto( bridge_root );
                bridge_piece forcenetfieldhighlod( 1 );
                bridge_piece.moverdoesnotkill = 1;
                bridge_piece setmoverantilagged( 1 );
                bridge_piece setmoveroptimized( 1 );
                
                if ( bridge_piece.script_noteworthy == "bridge_clip_road" )
                {
                    bridge_root.clip_road = bridge_piece;
                    bridge_root.clip_road.nav_island = 1;
                    bridge_root.clip_road dockmovingplatform( undefined );
                    bridge_root.clip_road.docked = 1;
                    waitframe();
                }
                
                continue;
            }
            
            bridge_root.bridge_pieces = arrayremove( bridge_root.bridge_pieces, bridge_piece );
        }
        
        if ( bridge_root.angles[ 0 ] > -5 )
        {
            bridge_root.bridgedirection = #"down";
        }
        else
        {
            bridge_root.bridgedirection = #"up";
        }
        
        bridge_root.bridge_switches = getentitylessscriptablearray( bridge_root.targetname, #target );
        
        foreach ( bridge_switch in bridge_root.bridge_switches )
        {
            bridge_switch setscriptablepartstate( #"health_listener", #"disabled_no_notify" );
        }
        
        if ( utility::issharedfuncdefined( #"airdrop_scriptbundle", #"hash_8145eea3e9d095c" ) )
        {
            utility::callsharedfunc( #"airdrop_scriptbundle", #"hash_8145eea3e9d095c", bridge_root );
            
            foreach ( bridge_piece in bridge_root.bridge_pieces )
            {
                utility::callsharedfunc( #"airdrop_scriptbundle", #"hash_8145eea3e9d095c", bridge_piece );
            }
        }
        
        bridge_root thread function_b9a48dacecc9c657();
    }
    
    level utility::flag_set( "flag_bridge_setup_complete" );
}

// Namespace mp_sat_lm_avalon_bridges
// Params 0, eflags: 0x4
// Checksum 0x6afa3aaf, Offset: 0x53f
// Size: 0x99
function private function_b9a48dacecc9c657()
{
    level endon( #"game_ended" );
    self endon( #"death" );
    
    while ( true )
    {
        self waittill( #"activate", bridge_switch, e_user );
        
        if ( bridge_switch && self.var_8e46bb141b3990d6 )
        {
            if ( bridge_switch getscriptablepartstate( #"arcwire_transmitter", undefined, 1 ) != #"blocked" )
            {
                bridge_switch setscriptablepartstate( #"arcwire_transmitter", #"blocked" );
            }
            
            continue;
        }
        
        function_bb6fb59d56a7129a();
    }
}

// Namespace mp_sat_lm_avalon_bridges
// Params 0, eflags: 0x4
// Checksum 0xbc6798db, Offset: 0x5e0
// Size: 0x2b1
function private function_bb6fb59d56a7129a()
{
    self endon( #"death" );
    
    foreach ( bridge_switch in self.bridge_switches )
    {
        bridge_switch setscriptablepartstate( #"arcwire_transmitter", #"activate" );
    }
    
    self.var_8e46bb141b3990d6 = 1;
    
    if ( self.clip_road.docked )
    {
        self.clip_road undockmovingplatform( 0 );
        self.clip_road.docked = 0;
    }
    
    if ( self.bridgedirection == #"up" )
    {
        playsoundatpos( self.origin + ( 0, 0, 12 ), "emt_sat_avalon_drawbridge_lower" );
        
        while ( self.angles[ 0 ] <= 0 )
        {
            self.angles += ( 0.2, 0, 0 );
            waitframe();
        }
        
        self.bridgedirection = #"down";
    }
    else if ( self.bridgedirection == #"down" )
    {
        playsoundatpos( self.origin + ( 0, 0, 12 ), "emt_sat_avalon_drawbridge_raise" );
        self.origin_angles = self.angles;
        
        while ( self.angles[ 0 ] >= -25 )
        {
            self.angles += ( -0.2, 0, 0 );
            waitframe();
        }
        
        self.bridgedirection = #"up";
    }
    
    if ( !self.clip_road.docked )
    {
        self.clip_road dockmovingplatform( undefined );
        self.clip_road.docked = 1;
    }
    
    self.var_8e46bb141b3990d6 = undefined;
    
    foreach ( bridge_switch in self.bridge_switches )
    {
        bridge_switch setscriptablepartstate( #"arcwire_transmitter", #"standby" );
    }
}

