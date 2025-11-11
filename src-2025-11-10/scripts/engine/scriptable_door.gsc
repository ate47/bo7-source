#namespace scriptable_door;

// Namespace scriptable_door
// Params 0
// Checksum 0x258e2196, Offset: 0x86
// Size: 0x1b
function system_init()
{
    if ( isdefined( level.scriptable_door_initialized ) )
    {
        return;
    }
    
    level.scriptable_door_initialized = 1;
}

// Namespace scriptable_door
// Params 1
// Checksum 0xf6dbf90f, Offset: 0xa9
// Size: 0x17
function function_25c67271e41d8eee( var_67522cf358185ea )
{
    level.var_bbccd45f89372404 = var_67522cf358185ea;
}

// Namespace scriptable_door
// Params 1
// Checksum 0x947f9017, Offset: 0xc8
// Size: 0x17
function function_b5d32f7fadb9b184( var_41709000f9757468 )
{
    level.var_1ce8a257d35d7d02 = var_41709000f9757468;
}

// Namespace scriptable_door
// Params 1
// Checksum 0xaa27f470, Offset: 0xe7
// Size: 0x17
function function_a152092746ef29b0( var_665db4eeecbac78c )
{
    level.var_352a82622fcefd6e = var_665db4eeecbac78c;
}

// Namespace scriptable_door
// Params 1
// Checksum 0x2feebe0c, Offset: 0x106
// Size: 0x17
function function_c0049536af4b1117( canunlockcallback )
{
    level.var_25a1b0883ae0f2c8 = canunlockcallback;
}

// Namespace scriptable_door
// Params 1
// Checksum 0xb62a2a23, Offset: 0x125
// Size: 0x17
function function_369c460bb0ed0820( unlockedcallback )
{
    level.door_unlocked = unlockedcallback;
}

// Namespace scriptable_door
// Params 2
// Checksum 0xd3cdd879, Offset: 0x144
// Size: 0x3a
function function_ca3d8a38c027141( instance, player )
{
    if ( isdefined( level.var_bbccd45f89372404 ) )
    {
        return [[ level.var_bbccd45f89372404 ]]( instance, player );
    }
    
    return &"";
}

// Namespace scriptable_door
// Params 2
// Checksum 0xa1aafe15, Offset: 0x187
// Size: 0x3a
function function_71b8ebf388a66887( instance, player )
{
    if ( isdefined( level.var_1ce8a257d35d7d02 ) )
    {
        return [[ level.var_1ce8a257d35d7d02 ]]( instance, player );
    }
    
    return &"";
}

// Namespace scriptable_door
// Params 2
// Checksum 0x359f21ee, Offset: 0x1ca
// Size: 0x3a
function function_657d18ac1a0fb2fb( instance, player )
{
    if ( isdefined( level.var_352a82622fcefd6e ) )
    {
        return [[ level.var_352a82622fcefd6e ]]( instance, player );
    }
    
    return &"";
}

// Namespace scriptable_door
// Params 3
// Checksum 0x1a4189ec, Offset: 0x20d
// Size: 0x3c
function function_dc8c68480632f4dc( instance, player, var_867f7d84083437ee )
{
    if ( isdefined( level.var_25a1b0883ae0f2c8 ) )
    {
        return [[ level.var_25a1b0883ae0f2c8 ]]( instance, player, var_867f7d84083437ee );
    }
    
    return 0;
}

// Namespace scriptable_door/event_e276f139d4313ca7
// Params 2, eflags: 0x20
// Checksum 0x4b1c4746, Offset: 0x252
// Size: 0x31
function event_handler[event_e276f139d4313ca7] function_e276f139d4313ca7( instance, player )
{
    if ( isdefined( level.door_unlocked ) )
    {
        [[ level.door_unlocked ]]( instance, player );
    }
}

// Namespace scriptable_door
// Params 1
// Checksum 0x23edf96a, Offset: 0x28b
// Size: 0x3c
function isscriptabledoor( door )
{
    if ( isent( door ) && door isscriptable() || !isent( door ) && door isscriptableinstance() )
    {
        return door scriptableisdoor();
    }
    
    return 0;
}

// Namespace scriptable_door
// Params 2
// Checksum 0x84cd6294, Offset: 0x2d0
// Size: 0xd7
function function_d0c2c4928d4ff5c2( door, t )
{
    door scriptabledooropen( "away", self.origin );
    
    if ( door scriptabledoorisdouble() )
    {
        doorlist = getentitylessscriptablearray( undefined, undefined, door.origin, 64 );
        
        foreach ( otherdoor in doorlist )
        {
            if ( otherdoor scriptabledoorisdouble() )
            {
                otherdoor scriptabledooropen( "away", self.origin );
            }
        }
    }
}

// Namespace scriptable_door
// Params 1
// Checksum 0x8d2522d8, Offset: 0x3af
// Size: 0x13
function function_34403af078fbe066( door )
{
    door scriptabledoorclose();
}

// Namespace scriptable_door
// Params 1
// Checksum 0xb82c55b5, Offset: 0x3ca
// Size: 0x19, Type: bool
function function_ebc4f081a7104b46( door )
{
    return abs( door scriptabledoorangle() ) > 60;
}

