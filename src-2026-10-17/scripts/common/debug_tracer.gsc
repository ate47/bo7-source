#namespace debug_tracer;

/#

    // Namespace debug_tracer
    // Params 4
    // Checksum 0x2bf612a4, Offset: 0x76
    // Size: 0x86, Type: dev
    function function_ab40bff5a101e3fc( value, name, entity, color )
    {
        if ( !isdefined( name ) )
        {
            name = undefined;
        }
        
        if ( !isdefined( entity ) )
        {
            entity = undefined;
        }
        
        if ( !isdefined( color ) )
        {
            color = "<dev string:x24>";
        }
        
        function_f8c1e9a15f89fccc( { #name:name, #string:value, #color:color, #type:"<dev string:x2a>", #entity:entity } );
    }

    // Namespace debug_tracer
    // Params 4
    // Checksum 0xbe0723af, Offset: 0x104
    // Size: 0x82, Type: dev
    function function_2068fe436db0d204( value, name, entity, color )
    {
        if ( !isdefined( entity ) )
        {
            entity = undefined;
        }
        
        if ( !isdefined( color ) )
        {
            color = "<dev string:x24>";
        }
        
        function_f8c1e9a15f89fccc( { #name:name, #value_int:int( value ), #color:color, #type:"<dev string:x30>", #entity:entity } );
    }

    // Namespace debug_tracer
    // Params 4
    // Checksum 0x7c119854, Offset: 0x18e
    // Size: 0x7e, Type: dev
    function function_4f2668e195a9053f( value, name, entity, color )
    {
        if ( !isdefined( entity ) )
        {
            entity = undefined;
        }
        
        if ( !isdefined( color ) )
        {
            color = "<dev string:x24>";
        }
        
        function_f8c1e9a15f89fccc( { #name:name, #value_float:value, #color:color, #type:"<dev string:x34>", #entity:entity } );
    }

    // Namespace debug_tracer
    // Params 4
    // Checksum 0x45fc8383, Offset: 0x214
    // Size: 0x8e, Type: dev
    function function_e849e1f042ceb70f( value, name, entity, color )
    {
        if ( !isdefined( entity ) )
        {
            entity = undefined;
        }
        
        if ( !isdefined( color ) )
        {
            color = "<dev string:x24>";
        }
        
        function_f8c1e9a15f89fccc( { #name:name, #string:value ? "<dev string:x3a>" : "<dev string:x3f>", #color:color, #type:"<dev string:x2a>", #entity:entity } );
    }

    // Namespace debug_tracer
    // Params 5
    // Checksum 0xd9a6ef63, Offset: 0x2aa
    // Size: 0x92, Type: dev
    function function_a1203e50425de387( pos, size, name, entity, color )
    {
        if ( !isdefined( entity ) )
        {
            entity = undefined;
        }
        
        if ( !isdefined( color ) )
        {
            color = "<dev string:x24>";
        }
        
        function_f8c1e9a15f89fccc( { #name:name, #size:size, #pos:pos, #color:color, #type:"<dev string:x45>", #entity:entity } );
    }

#/
