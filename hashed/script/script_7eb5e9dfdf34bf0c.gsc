#namespace namespace_cd032f2f1df7414;

// Namespace namespace_cd032f2f1df7414
// Params 0
// Checksum 0x4ef7b96f, Offset: 0xb8
// Size: 0x2
function main()
{
    
}

// Namespace namespace_cd032f2f1df7414
// Params 0
// Checksum 0x7d8cf0a2, Offset: 0xc2
// Size: 0x100
function function_d38a01950fd7d9b5()
{
    ceilinglights = getentarray( "gunsmith_ceiling_square_01", #targetname );
    
    foreach ( light in ceilinglights )
    {
        light.original_intensity = light getlightintensity();
    }
    
    foreach ( light in ceilinglights )
    {
        light setlightintensity( 0 );
    }
}

// Namespace namespace_cd032f2f1df7414
// Params 0
// Checksum 0xbcac6be1, Offset: 0x1ca
// Size: 0xa8
function function_816538d08541ca79()
{
    ceilinglights = getentarray( "gunsmith_ceiling_square_01", #targetname );
    
    foreach ( light in ceilinglights )
    {
        if ( isdefined( light.original_intensity ) )
        {
            light setlightintensity( light.original_intensity );
        }
    }
}

// Namespace namespace_cd032f2f1df7414
// Params 0
// Checksum 0xe0d5a63b, Offset: 0x27a
// Size: 0x42
function function_2dc1ae88b7014cc9()
{
    setdvar( @"hash_5d66c2ef5a9612e0", 1 );
    setdvar( @"hash_f9190cd77b0b2463", 4 );
    setdvar( @"hash_dacffbfd52c2fdc5", 16 );
    setdvar( @"hash_ea4c44a08cd23d5d", 3 );
}

// Namespace namespace_cd032f2f1df7414
// Params 0
// Checksum 0xe7f1b4db, Offset: 0x2c4
// Size: 0x61
function function_5bb771346af1d9d3()
{
    setdvar( @"hash_5d66c2ef5a9612e0", 0 );
    setdvar( @"hash_eca4b727b01fd254", 8 );
    setdvar( @"hash_f9190cd77b0b2463", 1 );
    setdvar( @"hash_dacffbfd52c2fdc5", 32 );
    setdvar( @"hash_ea4c44a08cd23d5d", 1 );
    setdvar( @"hash_e918bd4613339eeb", 2 );
}

// Namespace namespace_cd032f2f1df7414
// Params 0
// Checksum 0xb371e738, Offset: 0x32d
// Size: 0x100
function function_f1bc4aed1032ba22()
{
    ceilinglights = getentarray( "operator_ceiling_light", #targetname );
    
    foreach ( light in ceilinglights )
    {
        light.original_intensity = light getlightintensity();
    }
    
    foreach ( light in ceilinglights )
    {
        light setlightintensity( 0 );
    }
}

// Namespace namespace_cd032f2f1df7414
// Params 0
// Checksum 0x9adbee19, Offset: 0x435
// Size: 0xa8
function function_a8d269be08ab20c8()
{
    ceilinglights = getentarray( "operator_ceiling_light", #targetname );
    
    foreach ( light in ceilinglights )
    {
        if ( isdefined( light.original_intensity ) )
        {
            light setlightintensity( light.original_intensity );
        }
    }
}

// Namespace namespace_cd032f2f1df7414
// Params 0
// Checksum 0x5f77a0c0, Offset: 0x4e5
// Size: 0x11
function function_a02aeaf6a41a0a14()
{
    setdvar( @"hash_e918bd4613339eeb", 0 );
}

// Namespace namespace_cd032f2f1df7414
// Params 0
// Checksum 0xdf64ac9e, Offset: 0x4fe
// Size: 0x12
function function_5bb770346af1d7a0()
{
    setdvar( @"hash_e918bd4613339eeb", 2 );
}

