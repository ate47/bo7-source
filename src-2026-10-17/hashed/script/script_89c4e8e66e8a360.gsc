#using script_4f9ce8d249a99f4a;

#namespace ftue_firing;

// Namespace ftue_firing
// Params 3
// Checksum 0x75d50440, Offset: 0x76
// Size: 0x29
function function_dc79f33e8ed5962e( player, checkads, ondamagedcallback )
{
    thread function_f37fbea0ec6248f2( player, checkads, ondamagedcallback );
}

// Namespace ftue_firing
// Params 3, eflags: 0x4
// Checksum 0x4da25b20, Offset: 0xa7
// Size: 0xe7
function private function_f37fbea0ec6248f2( player, checkads, ondamagedcallback )
{
    self endon( #"entitydeleted" );
    level endon( #"game_ended" );
    player endon( #"disconnect" );
    
    while ( true )
    {
        self waittill( #"damage", damage, attacker, direction_vec, point, type, modelname, tagname, partname, idflags, weapon );
        
        if ( ( !checkads || player player::isplayerads() ) && attacker == player )
        {
            if ( isdefined( ondamagedcallback ) )
            {
                self [[ ondamagedcallback ]]( player );
            }
            
            return;
        }
    }
}

