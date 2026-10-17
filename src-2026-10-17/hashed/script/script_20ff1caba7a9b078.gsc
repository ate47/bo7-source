#namespace namespace_71a06ce99f08ed83;

// Namespace namespace_71a06ce99f08ed83
// Params 3
// Checksum 0x5c96f8d7, Offset: 0x94
// Size: 0x9c
function function_a329e534646f2e1f( asmname, statename, params )
{
    self endon( #"death" );
    self endon( #"terminate_idle" );
    
    while ( true )
    {
        has_attractor = isdefined( self._blackboard ) && self._blackboard.zombieattractoristarget;
        
        if ( !has_attractor && isalive( self.enemy ) )
        {
            self orientmode( "face enemy" );
        }
        else
        {
            self orientmode( "face current" );
        }
        
        waitframe();
    }
}

