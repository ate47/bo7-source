#using scripts\common\utility;

#namespace ftue_gulag;

// Namespace ftue_gulag
// Params 1
// Checksum 0x9d01de7a, Offset: 0xa1
// Size: 0x45
function function_f7131f34eebc5cf1( var_aba35c1eee309fbe )
{
    self endon( #"disconnect" );
    self endon( #"pull_out_of_gulag" );
    self waittill( #"gulag_start", var_c9b0d6a83e847963 );
    self [[ var_aba35c1eee309fbe ]]( var_c9b0d6a83e847963 );
}

// Namespace ftue_gulag
// Params 1
// Checksum 0x651f8ea5, Offset: 0xee
// Size: 0x45
function function_4e6646ecea1f7a18( var_d4a30b585e84847f )
{
    self endon( #"disconnect" );
    self endon( #"pull_out_of_gulag" );
    self waittill( #"enter_gulag", var_c9b0d6a83e847963 );
    self [[ var_d4a30b585e84847f ]]( var_c9b0d6a83e847963 );
}

// Namespace ftue_gulag
// Params 1
// Checksum 0x998f91e6, Offset: 0x13b
// Size: 0x37
function function_725d6f11db45df9( var_1bba91f337ed654e )
{
    self endon( #"disconnect" );
    self endon( #"pull_out_of_gulag" );
    self waittill( #"beginnewfight" );
    self [[ var_1bba91f337ed654e ]]();
}

// Namespace ftue_gulag
// Params 1
// Checksum 0xef7ec0af, Offset: 0x17a
// Size: 0x53
function function_a271dc26dac2b2e8( var_6f6ae6e988f857ef )
{
    self endon( #"disconnect" );
    msg = utility::waittill_any_return( "gulag_end", "pull_out_of_gulag", "death" );
    self [[ var_6f6ae6e988f857ef ]]( msg == "gulag_end" || msg == "pull_out_of_gulag" );
}

// Namespace ftue_gulag
// Params 1
// Checksum 0x3e2f9af3, Offset: 0x1d5
// Size: 0x3b
function function_a93c0bea46dddcec( var_37e97321f9fc3acb )
{
    self endon( #"disconnect" );
    self endon( #"beginnewfight" );
    utility::waittill_any_return( "gulag_end", "pull_out_of_gulag" );
    self [[ var_37e97321f9fc3acb ]]();
}

