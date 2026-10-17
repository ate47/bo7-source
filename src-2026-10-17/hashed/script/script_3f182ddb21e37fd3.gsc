#namespace namespace_3637061638c5e37a;

// Namespace namespace_3637061638c5e37a/event_7771f42d9af6f501
// Params 1, eflags: 0x20
// Checksum 0xea73626a, Offset: 0x121
// Size: 0x148
function event_handler[event_7771f42d9af6f501] rpc( var_c302f492e874f708 )
{
    if ( !isdefined( var_c302f492e874f708.func_name ) || var_c302f492e874f708.func_name == "" )
    {
        function_612027041bb19b92( var_c302f492e874f708.id, 11, "No RPC function specified in the request, make sure the request has the func attribute" );
        return;
    }
    
    key = tolower( var_c302f492e874f708.func_name );
    function_index = function_d55ddfb245d0337e( key );
    
    if ( !isdefined( function_index ) )
    {
        function_612027041bb19b92( var_c302f492e874f708.id, 12, "Requested function -->" + var_c302f492e874f708.func_name + "<-- is not found in the registered list" );
        return;
    }
    
    func = level.rpc.var_1399aeb981021899[ function_index ];
    
    if ( var_c302f492e874f708.nargs == 0 )
    {
        res = [[ func ]]();
    }
    else
    {
        res = [[ func ]]( var_c302f492e874f708 );
    }
    
    if ( !isdefined( res ) )
    {
        res = "";
    }
    
    if ( isstruct( res ) && isdefined( res.error ) )
    {
        function_8f0d9d60a5d9f985( var_c302f492e874f708.id, res.error );
        return;
    }
    
    function_452481af837a3feb( var_c302f492e874f708.id, res );
}

// Namespace namespace_3637061638c5e37a
// Params 3
// Checksum 0xe80e0f4b, Offset: 0x271
// Size: 0x10f
function function_6b8b68fa6ee6a023( function_name, function_pointer, function_category = "core" )
{
    if ( !level.rpc )
    {
        level.rpc = { #function_categories:[], #var_1399aeb981021899:[], #function_names:[] };
    }
    
    func_name = tolower( function_name );
    function_index = function_d55ddfb245d0337e( func_name );
    
    if ( !isdefined( function_index ) )
    {
        level.rpc.function_names[ level.rpc.function_names.size ] = func_name;
        level.rpc.var_1399aeb981021899[ level.rpc.var_1399aeb981021899.size ] = function_pointer;
        level.rpc.function_categories[ level.rpc.function_categories.size ] = tolower( function_category );
    }
}

// Namespace namespace_3637061638c5e37a
// Params 1, eflags: 0x4
// Checksum 0x5b179d89, Offset: 0x388
// Size: 0x90
function private function_d55ddfb245d0337e( function_name )
{
    foreach ( index, registered_function in level.rpc.function_names )
    {
        if ( registered_function == function_name )
        {
            return index;
        }
    }
}

// Namespace namespace_3637061638c5e37a
// Params 2
// Checksum 0x91db4675, Offset: 0x420
// Size: 0x3c
function function_8ecfff37b1877ba2( error_id, error_message )
{
    res = spawnstruct();
    res.error = function_8cf0344f785bb62f( error_id, error_message );
    return res;
}

// Namespace namespace_3637061638c5e37a
// Params 2, eflags: 0x4
// Checksum 0x2dc6e958, Offset: 0x465
// Size: 0x43
function private function_8cf0344f785bb62f( error_id, error_message )
{
    error_struct = spawnstruct();
    error_struct.error_id = error_id;
    error_struct.message = error_message;
    return error_struct;
}

// Namespace namespace_3637061638c5e37a
// Params 3, eflags: 0x4
// Checksum 0xfc463be5, Offset: 0x4b1
// Size: 0x46
function private function_612027041bb19b92( id, error_id, error_message )
{
    assert( 0, error_message );
    error_res = function_8cf0344f785bb62f( error_id, error_message );
    function_8f0d9d60a5d9f985( id, error_res );
}

