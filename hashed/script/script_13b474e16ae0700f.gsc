#namespace struct;

// Namespace struct/bootstrap
// Params 0, eflags: 0x24
// Checksum 0x9e8dff2f, Offset: 0x112
// Size: 0x3d
function private event_handler[bootstrap] bootstrap()
{
    level.struct_class_names = [ "script_agent_noteworthy":[], "variantname":[], "script_vehicleref":[], "script_linkname":[], "script_noteworthy":[], "targetname":[], "target":[] ];
}

// Namespace struct/spawnstruct
// Params 1, eflags: 0x24
// Checksum 0xa846e3fb, Offset: 0x157
// Size: 0x8d
function private event_handler[spawnstruct] spawn_struct( struct )
{
    if ( struct.var_cadb121fd1be05b0 || struct.targetname == "delete_on_load" )
    {
        return;
    }
    
    if ( level.create_script && struct.var_a55b0b7889573538 )
    {
        return;
    }
    
    if ( level.var_e1654b94c5dba8ab && ![[ level.var_e1654b94c5dba8ab ]]( struct ) )
    {
        return;
    }
    
    if ( level.struct_filter && ![[ level.struct_filter ]]( struct ) )
    {
        return;
    }
}

