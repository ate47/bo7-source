#using scripts\engine\utility;

#namespace struct;

// Namespace struct/bootstrap
// Params 0, eflags: 0x24
// Checksum 0x9e8dff94, Offset: 0x144
// Size: 0x44
function private event_handler[bootstrap] bootstrap()
{
    level.struct_class_names = [ "script_agent_noteworthy":[], "variantname":[], "script_vehicleref":[], "script_linkname":[], "script_noteworthy":[], "targetname":[], "target":[] ];
    init_global_scriptbundles();
}

// Namespace struct/spawnstruct
// Params 1, eflags: 0x24
// Checksum 0x12d43477, Offset: 0x190
// Size: 0xb4
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
    else if ( level.struct_filter && ![[ level.struct_filter ]]( struct ) )
    {
        return;
    }
    
    if ( struct.script_noteworthy == "vfx_ambientwar_node" )
    {
        utility::function_d25424f1ac9f1290( struct );
        return;
    }
    
    utility::addstruct( struct );
}

// Namespace struct
// Params 0, eflags: 0x4
// Checksum 0xd4e7567, Offset: 0x24c
// Size: 0x146
function private init_global_scriptbundles()
{
    level.projectbundle = getprojectscriptbundle();
    level.gamemodebundle = getgamemodescriptbundle();
    level.gametypebundle = getgametypescriptbundle();
    level.var_d2ad35d68057f138 = function_c80cb7c63c523e97();
    
    if ( isdefined( level.gametypebundle.additionalscriptbundles ) )
    {
        level.gametypebundle.var_ae100eea97c7fcc7 = [];
        
        foreach ( bundle in level.gametypebundle.additionalscriptbundles )
        {
            level.gametypebundle.var_ae100eea97c7fcc7[ bundle.var_48cc9bf9fa3db0a ] = getscriptbundle( bundle.var_33ebe182767e4f6e );
        }
    }
    
    utility::flag_set( "init_global_scriptbundles" );
    
    /#
        if ( !isinfrontend() )
        {
            assert( isdefined( level.projectbundle ) );
            assert( isdefined( level.gamemodebundle ) );
        }
    #/
}

// Namespace struct
// Params 0
// Checksum 0x80da4a1b, Offset: 0x39a
// Size: 0x2
function dummy()
{
    
}

