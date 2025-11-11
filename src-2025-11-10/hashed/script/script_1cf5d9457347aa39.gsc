#using script_53651341190c5aab;
#using scripts\engine\utility;

#namespace squad_movement;

// Namespace squad_movement
// Params 1
// Checksum 0xc30ab2a9, Offset: 0xbc
// Size: 0x42
function getfunction( funcid )
{
    switch ( funcid )
    {
        case #"hash_dab0d83df51da4d":
            return &onuserinit;
        case #"hash_722d767fd6d40f56":
            return &onuserterminate;
    }
    
    return interaction_common::function_d4be89b1cf3d4993( funcid );
}

// Namespace squad_movement
// Params 1
// Checksum 0xfdf66650, Offset: 0x107
// Size: 0xc
function onuserinit( interactionid )
{
    
}

// Namespace squad_movement
// Params 1
// Checksum 0xfd73c43e, Offset: 0x11b
// Size: 0x59
function onuserterminate( interactionid )
{
    var_1c4b32ab1bec160c = utility::is_dead_or_dying( self );
    tag = self function_2e50bdd9495d2b8c();
    var_8ddb810836e488a1 = tag == "leader";
    
    if ( var_8ddb810836e488a1 && var_1c4b32ab1bec160c )
    {
        function_dd518df9ee8d217c( interactionid, "leader_death", 1 );
    }
}

