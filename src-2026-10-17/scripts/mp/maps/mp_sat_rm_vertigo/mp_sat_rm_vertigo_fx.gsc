#namespace mp_sat_rm_vertigo_fx;

// Namespace mp_sat_rm_vertigo_fx
// Params 0
// Checksum 0x24c742c3, Offset: 0xb0
// Size: 0xe
function main()
{
    thread sliding_door( "sliding_door" );
}

// Namespace mp_sat_rm_vertigo_fx
// Params 1
// Checksum 0xb234be80, Offset: 0xc6
// Size: 0xb0
function sliding_door( trigname )
{
    level endon( #"game_ended" );
    level waittill( #"matchstarttimer_done" );
    door_triggers = getentarray( trigname, #targetname );
    
    foreach ( trig in door_triggers )
    {
        thread sliding_door_watch( trig );
    }
}

// Namespace mp_sat_rm_vertigo_fx
// Params 1
// Checksum 0x1896eff5, Offset: 0x17e
// Size: 0x13a
function sliding_door_watch( trig )
{
    while ( true )
    {
        if ( !( isdefined( trig.var_4334fce40616abe9 ) && isdefined( trig.var_4334f9e40616a550 ) ) )
        {
            scriptables = getentitylessscriptablearray( "door_scr", #targetname );
            trig.var_4334fce40616abe9 = sortbydistancecullbyradius( scriptables, trig.origin, 128 )[ 0 ];
            trig.var_4334f9e40616a550 = sortbydistancecullbyradius( scriptables, trig.origin, 128 )[ 1 ];
        }
        
        trig waittill( #"trigger" );
        trig.var_4334fce40616abe9 setscriptablepartstate( "door", "opening" );
        
        if ( isdefined( trig.var_4334f9e40616a550 ) )
        {
            trig.var_4334f9e40616a550 setscriptablepartstate( "door", "opening" );
        }
        
        wait 5;
        trig.var_4334fce40616abe9 setscriptablepartstate( "door", "closing" );
        
        if ( isdefined( trig.var_4334f9e40616a550 ) )
        {
            trig.var_4334f9e40616a550 setscriptablepartstate( "door", "closing" );
        }
        
        while ( sliding_door_watch( trig ) )
        {
            waitframe();
        }
    }
}

