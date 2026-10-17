#using script_78c71390bb3043df;
#using scripts\common\utility;

#namespace ob_activity_protocol_utility;

// Namespace ob_activity_protocol_utility
// Params 1
// Checksum 0x9c7396ac, Offset: 0xb2
// Size: 0xdc
function function_8618ee5905c91177( varianttag )
{
    struct_array = utility::getstructarray( varianttag, "script_noteworthy" );
    
    foreach ( struct in struct_array )
    {
        if ( struct.targetname == "power_core" )
        {
            self.core_struct = struct;
            continue;
        }
        
        if ( issubstr( struct.targetname, "vent_" ) )
        {
            self.var_2fec9671ff3f4cb9[ self.var_2fec9671ff3f4cb9.size ] = struct;
        }
    }
}

// Namespace ob_activity_protocol_utility
// Params 2
// Checksum 0x7c807374, Offset: 0x196
// Size: 0x168
function function_3e12732acab2906a( initial_state = undefined, spawn_callback = undefined )
{
    foreach ( vent_struct in self.var_2fec9671ff3f4cb9 )
    {
        if ( !isdefined( vent_struct.ent_scriptable ) )
        {
            vent_struct.ent_scriptable = ob_resource_manager::activity_spawn_entity( "script_model", vent_struct.origin );
            vent_struct.ent_scriptable setmodel( %"ob_cradle_vent" );
            vent_struct.ent_scriptable.angles = vent_struct.angles;
        }
        
        vent_struct.ent_scriptable.activity_instance = self;
        vent_struct.ent_scriptable.parent = vent_struct;
        
        if ( isdefined( initial_state ) )
        {
            vent_struct.ent_scriptable setscriptablepartstate( #"vent", initial_state );
        }
        
        if ( isdefined( spawn_callback ) )
        {
            [[ spawn_callback ]]( vent_struct.ent_scriptable, self );
        }
    }
}

// Namespace ob_activity_protocol_utility
// Params 0
// Checksum 0x158aceaf, Offset: 0x306
// Size: 0x9c
function function_ee1bdabad1c1cbd2()
{
    foreach ( vent_struct in self.var_2fec9671ff3f4cb9 )
    {
        if ( isdefined( vent_struct.ent_scriptable ) )
        {
            vent_struct.ent_scriptable delete();
            vent_struct.ent_scriptable = undefined;
        }
    }
}

// Namespace ob_activity_protocol_utility
// Params 0
// Checksum 0xcc75ce32, Offset: 0x3aa
// Size: 0x9
function function_c658b31196b794b()
{
    function_ee1bdabad1c1cbd2();
}

