#using scripts\common\utility;

#namespace namespace_a53b139e84e26e3a;

// Namespace namespace_a53b139e84e26e3a
// Params 0
// Checksum 0xb3eb2ff9, Offset: 0xcd
// Size: 0xc8
function firing_range_target_init()
{
    if ( !isdefined( level.var_904399428c749bf6 ) || isdefined( level.var_904399428c749bf6 ) && !level.var_904399428c749bf6 )
    {
        return;
    }
    
    s_dest = utility::getstruct( self.target, "targetname" );
    var_53f024008686ce5b = spawn( "script_model", self.origin );
    var_53f024008686ce5b.angles = self.angles;
    scr_firing_range_target = spawnscriptable( "t10_machinery_shooting_target_01", self.origin );
    scr_firing_range_target.angles = self.angles;
    scr_firing_range_target scriptablesetparententity( var_53f024008686ce5b );
    
    if ( isdefined( s_dest ) )
    {
        var_53f024008686ce5b thread firing_range_target( s_dest, scr_firing_range_target );
    }
}

// Namespace namespace_a53b139e84e26e3a
// Params 2, eflags: 0x4
// Checksum 0x30f41394, Offset: 0x19d
// Size: 0x105
function private firing_range_target( s_dest, scr_firing_range_target )
{
    v_move_dir = vectornormalize( s_dest.origin - self.origin );
    var_1d1ab4cffa109e01 = 0;
    n_move_time = 8;
    
    if ( !isdefined( s_dest ) )
    {
        return;
    }
    
    var_1d1ab4cffa109e01 = distance( self.origin, s_dest.origin );
    
    if ( isdefined( s_dest.script_parameters ) && 0 )
    {
        n_move_time = float( s_dest.script_parameters );
    }
    
    for ( var_119917d4bedc568d = scr_firing_range_target getscriptablepartstate( "pelvis", 1 ); var_119917d4bedc568d == "visible" ; var_119917d4bedc568d = scr_firing_range_target getscriptablepartstate( "pelvis", 1 ) )
    {
        self moveto( self.origin + v_move_dir * var_1d1ab4cffa109e01, n_move_time, 0, 0 );
        wait n_move_time;
        self moveto( self.origin + v_move_dir * var_1d1ab4cffa109e01 * -1, n_move_time, 0, 0 );
        wait n_move_time;
    }
}

