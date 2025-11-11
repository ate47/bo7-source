#namespace scriptable;

// Namespace scriptable
// Params 1
// Checksum 0x61de5da, Offset: 0xd6
// Size: 0x39
function scriptable_setinitcallback( initcallback )
{
    if ( !isdefined( level.scriptable_init ) )
    {
        level.scriptable_init = [];
    }
    
    level.scriptable_init[ level.scriptable_init.size ] = initcallback;
}

// Namespace scriptable
// Params 0
// Checksum 0x8b67e7db, Offset: 0x117
// Size: 0x84
function scriptable_engineinitialize()
{
    if ( isdefined( level.scriptable_init ) )
    {
        foreach ( init_func in level.scriptable_init )
        {
            [[ init_func ]]();
        }
    }
}

// Namespace scriptable
// Params 1
// Checksum 0x3f028699, Offset: 0x1a3
// Size: 0x39
function scriptable_addpostinitcallback( callback )
{
    if ( !isdefined( level.scriptable_postinit ) )
    {
        level.scriptable_postinit = [];
    }
    
    level.scriptable_postinit[ level.scriptable_postinit.size ] = callback;
}

// Namespace scriptable
// Params 0
// Checksum 0x3e3f4b63, Offset: 0x1e4
// Size: 0x84
function scriptable_enginepostinitialize()
{
    if ( isdefined( level.scriptable_postinit ) )
    {
        foreach ( func in level.scriptable_postinit )
        {
            [[ func ]]();
        }
    }
}

// Namespace scriptable
// Params 1
// Checksum 0x2cabbc3b, Offset: 0x270
// Size: 0x39
function scriptable_addusedcallback( usedcallback )
{
    if ( !isdefined( level.scriptable_used_funcs ) )
    {
        level.scriptable_used_funcs = [];
    }
    
    level.scriptable_used_funcs[ level.scriptable_used_funcs.size ] = usedcallback;
}

// Namespace scriptable
// Params 1
// Checksum 0x1d5260fe, Offset: 0x2b1
// Size: 0x33
function function_ecfda6e42bbe0ddc( usedcallback )
{
    if ( !isdefined( level.scriptable_used_funcs ) )
    {
        return;
    }
    
    level.scriptable_used_funcs = arrayremove( level.scriptable_used_funcs, usedcallback );
}

// Namespace scriptable
// Params 2
// Checksum 0x7d93a5f5, Offset: 0x2ec
// Size: 0x64
function scriptable_addusedcallbackbypart( part, usedcallback )
{
    if ( !isdefined( level.scriptable_used_by_part_funcs ) )
    {
        level.scriptable_used_by_part_funcs = [];
    }
    
    if ( !isdefined( level.scriptable_used_by_part_funcs[ part ] ) )
    {
        level.scriptable_used_by_part_funcs[ part ] = [];
    }
    
    level.scriptable_used_by_part_funcs[ part ][ level.scriptable_used_by_part_funcs[ part ].size ] = usedcallback;
}

// Namespace scriptable
// Params 2
// Checksum 0x8db25863, Offset: 0x358
// Size: 0x54
function function_369a834929711390( part, usedcallback )
{
    if ( !isdefined( level.scriptable_used_by_part_funcs ) )
    {
        return;
    }
    
    if ( !isdefined( level.scriptable_used_by_part_funcs[ part ] ) )
    {
        return;
    }
    
    level.scriptable_used_by_part_funcs[ part ] = arrayremove( level.scriptable_used_by_part_funcs[ part ], usedcallback );
}

// Namespace scriptable
// Params 1
// Checksum 0xf33c5524, Offset: 0x3b4
// Size: 0x39
function scriptable_addautousecallback( usecallback )
{
    if ( !isdefined( level.scriptable_autouse_funcs ) )
    {
        level.scriptable_autouse_funcs = [];
    }
    
    level.scriptable_autouse_funcs[ level.scriptable_autouse_funcs.size ] = usecallback;
}

// Namespace scriptable
// Params 1
// Checksum 0x897a575e, Offset: 0x3f5
// Size: 0x33
function function_5afb9c6312cfcc47( usecallback )
{
    if ( !isdefined( level.scriptable_autouse_funcs ) )
    {
        return;
    }
    
    level.scriptable_autouse_funcs = arrayremove( level.scriptable_autouse_funcs, usecallback );
}

// Namespace scriptable
// Params 1
// Checksum 0xecf02304, Offset: 0x430
// Size: 0x39
function function_956535bbfd32b7d6( var_18ebde099939503b )
{
    if ( !isdefined( level.var_c600434e0043e180 ) )
    {
        level.var_c600434e0043e180 = [];
    }
    
    level.var_c600434e0043e180[ level.var_c600434e0043e180.size ] = var_18ebde099939503b;
}

// Namespace scriptable
// Params 1
// Checksum 0xe2aecbc9, Offset: 0x471
// Size: 0x33
function function_e72d5d504ed90c6f( var_18ebde099939503b )
{
    if ( !isdefined( level.var_c600434e0043e180 ) )
    {
        return;
    }
    
    level.var_c600434e0043e180 = arrayremove( level.var_c600434e0043e180, var_18ebde099939503b );
}

// Namespace scriptable
// Params 6
// Checksum 0x77fb50eb, Offset: 0x4ac
// Size: 0x1e0
function scriptable_engineused( instance, part, state, player, bautouse, usestring )
{
    if ( bautouse )
    {
        if ( isdefined( level.scriptable_autouse_funcs ) )
        {
            foreach ( used_func in level.scriptable_autouse_funcs )
            {
                [[ used_func ]]( instance, part, state, player, 1, usestring );
            }
        }
        
        return;
    }
    
    if ( isdefined( level.scriptable_used_funcs ) )
    {
        foreach ( used_func in level.scriptable_used_funcs )
        {
            [[ used_func ]]( instance, part, state, player, 0, usestring );
        }
    }
    
    if ( isdefined( level.scriptable_used_by_part_funcs ) && isdefined( level.scriptable_used_by_part_funcs[ part ] ) )
    {
        foreach ( used_func in level.scriptable_used_by_part_funcs[ part ] )
        {
            [[ used_func ]]( instance, part, state, player, 1, usestring );
        }
    }
}

// Namespace scriptable
// Params 4
// Checksum 0xbdc0645a, Offset: 0x694
// Size: 0xc3
function function_904787b1a7ed4f61( instance, part, state, player )
{
    result = 1;
    
    if ( isdefined( level.var_c600434e0043e180 ) )
    {
        foreach ( var_2ce9a48a48414e2b in level.var_c600434e0043e180 )
        {
            result = result && [[ var_2ce9a48a48414e2b ]]( instance, part, state, player );
        }
    }
    
    return result;
}

// Namespace scriptable
// Params 5
// Checksum 0x92e95b79, Offset: 0x760
// Size: 0x149
function function_190abcbcb4f3a47c( instance, part, state, player, useduration )
{
    if ( isdefined( level.var_dc7848b4278e9d43 ) )
    {
        foreach ( func in level.var_dc7848b4278e9d43 )
        {
            [[ func ]]( instance, part, state, player, useduration );
        }
    }
    
    if ( isdefined( level.var_4e9ab6c139c9bf3b ) && isdefined( level.var_4e9ab6c139c9bf3b[ part ] ) )
    {
        foreach ( func in level.var_4e9ab6c139c9bf3b[ part ] )
        {
            [[ func ]]( instance, part, state, player, useduration );
        }
    }
}

// Namespace scriptable
// Params 2
// Checksum 0x4ddb1100, Offset: 0x8b1
// Size: 0x64
function function_b49bec4b67c1221e( part, usedcallback )
{
    if ( !isdefined( level.var_4e9ab6c139c9bf3b ) )
    {
        level.var_4e9ab6c139c9bf3b = [];
    }
    
    if ( !isdefined( level.var_4e9ab6c139c9bf3b[ part ] ) )
    {
        level.var_4e9ab6c139c9bf3b[ part ] = [];
    }
    
    level.var_4e9ab6c139c9bf3b[ part ][ level.var_4e9ab6c139c9bf3b[ part ].size ] = usedcallback;
}

// Namespace scriptable
// Params 1
// Checksum 0x4d25096b, Offset: 0x91d
// Size: 0x39
function function_9a667ada3074523a( callback )
{
    if ( !isdefined( level.var_dc7848b4278e9d43 ) )
    {
        level.var_dc7848b4278e9d43 = [];
    }
    
    level.var_dc7848b4278e9d43[ level.var_dc7848b4278e9d43.size ] = callback;
}

// Namespace scriptable
// Params 2
// Checksum 0x5cce9ac9, Offset: 0x95e
// Size: 0x41
function function_1e33a4f0f19aa3a( instance, player )
{
    result = 0;
    
    if ( isdefined( level.var_2f0a93f86990f4d4 ) )
    {
        result = [[ level.var_2f0a93f86990f4d4 ]]( instance, player );
    }
    
    return result;
}

// Namespace scriptable
// Params 1
// Checksum 0xe36c5cc0, Offset: 0x9a8
// Size: 0x39
function scriptable_addtouchedcallback( touchedcallback )
{
    if ( !isdefined( level.scriptable_touched_funcs ) )
    {
        level.scriptable_touched_funcs = [];
    }
    
    level.scriptable_touched_funcs[ level.scriptable_touched_funcs.size ] = touchedcallback;
}

// Namespace scriptable
// Params 1
// Checksum 0x1cb0f8c8, Offset: 0x9e9
// Size: 0x39
function function_c1b772bddb62be66( var_1be521526c5ef145 )
{
    if ( !isdefined( level.var_27e161a3bcab8269 ) )
    {
        level.var_27e161a3bcab8269 = [];
    }
    
    level.var_27e161a3bcab8269[ level.var_27e161a3bcab8269.size ] = var_1be521526c5ef145;
}

// Namespace scriptable
// Params 1
// Checksum 0x84cbabfb, Offset: 0xa2a
// Size: 0x39
function function_be440da6d723d8e8( var_56e0bbdb3bc87831 )
{
    if ( !isdefined( level.var_2f3d3eb6b16bc8b2 ) )
    {
        level.var_2f3d3eb6b16bc8b2 = [];
    }
    
    level.var_2f3d3eb6b16bc8b2[ level.var_2f3d3eb6b16bc8b2.size ] = var_56e0bbdb3bc87831;
}

// Namespace scriptable
// Params 4
// Checksum 0x60ac887, Offset: 0xa6b
// Size: 0xae
function scriptable_enginetouched( instance, part, state, player )
{
    if ( isdefined( level.scriptable_touched_funcs ) )
    {
        foreach ( touched_func in level.scriptable_touched_funcs )
        {
            [[ touched_func ]]( instance, part, state, player );
        }
    }
}

// Namespace scriptable
// Params 2
// Checksum 0xd6b99efc, Offset: 0xb21
// Size: 0x99
function function_ce0492ba57130ca4( id, scriptables )
{
    if ( isdefined( level.var_27e161a3bcab8269 ) )
    {
        foreach ( var_974f3119d659d374 in level.var_27e161a3bcab8269 )
        {
            [[ var_974f3119d659d374 ]]( id, scriptables );
        }
    }
}

// Namespace scriptable
// Params 2
// Checksum 0xecdaab2d, Offset: 0xbc2
// Size: 0x99
function function_f9851d1984d0205c( event, scriptables )
{
    if ( isdefined( level.var_2f3d3eb6b16bc8b2 ) )
    {
        foreach ( var_729fa13d338b2289 in level.var_2f3d3eb6b16bc8b2 )
        {
            [[ var_729fa13d338b2289 ]]( event, scriptables );
        }
    }
}

// Namespace scriptable
// Params 1
// Checksum 0x6f1dc647, Offset: 0xc63
// Size: 0x39
function scriptable_adddamagedcallback( damagedcallback )
{
    if ( !isdefined( level.scriptable_damaged_funcs ) )
    {
        level.scriptable_damaged_funcs = [];
    }
    
    level.scriptable_damaged_funcs[ level.scriptable_damaged_funcs.size ] = damagedcallback;
}

// Namespace scriptable
// Params 1
// Checksum 0x155bc43d, Offset: 0xca4
// Size: 0x33
function function_dc174fecebb79952( damagedcallback )
{
    if ( !isdefined( level.scriptable_damaged_funcs ) )
    {
        return;
    }
    
    level.scriptable_damaged_funcs = arrayremove( level.scriptable_damaged_funcs, damagedcallback );
}

// Namespace scriptable
// Params 11
// Checksum 0x45b9d12a, Offset: 0xcdf
// Size: 0x140
function scriptable_enginedamaged( einflictor, eattacker, instance, idamage, idflags, smeansofdeath, objweapon, vdir, shitloc, modelindex, partname )
{
    if ( isdefined( level.scriptable_damaged_funcs ) )
    {
        if ( function_f9c7d74d26bf4d0f() && level.var_e6d6d55c30c55761 )
        {
            idamage = [[ level.var_e6d6d55c30c55761 ]]( einflictor, eattacker, instance, idamage, idflags, smeansofdeath, objweapon, vdir, shitloc, modelindex, partname );
        }
        
        foreach ( used_func in level.scriptable_damaged_funcs )
        {
            [[ used_func ]]( einflictor, eattacker, instance, idamage, idflags, smeansofdeath, objweapon, vdir, shitloc, modelindex, partname );
        }
    }
    
    instance notify( "scriptable_engine_damaged", einflictor, eattacker, instance, idamage, idflags, smeansofdeath, objweapon, vdir, shitloc, modelindex, partname );
}

// Namespace scriptable
// Params 0
// Checksum 0xdcc33078, Offset: 0xe27
// Size: 0x15
function function_f9c7d74d26bf4d0f()
{
    return level.gamemodebundle.var_92fbf9f74ca4163d;
}

// Namespace scriptable
// Params 2
// Checksum 0x1c6308f4, Offset: 0xe45
// Size: 0x64
function scriptable_addnotifycallback( funckey, func )
{
    if ( !isdefined( level.scriptable_notify_callback_funcs ) )
    {
        level.scriptable_notify_callback_funcs = [];
    }
    
    if ( !isdefined( level.scriptable_notify_callback_funcs[ funckey ] ) )
    {
        level.scriptable_notify_callback_funcs[ funckey ] = [];
    }
    
    level.scriptable_notify_callback_funcs[ funckey ][ level.scriptable_notify_callback_funcs[ funckey ].size ] = func;
}

// Namespace scriptable
// Params 2
// Checksum 0xda7e163, Offset: 0xeb1
// Size: 0x45
function function_65c9f35ffd4310f8( funckey, func )
{
    if ( !isdefined( level.scriptable_notify_callback_funcs[ funckey ] ) )
    {
        return;
    }
    
    level.scriptable_notify_callback_funcs[ funckey ] = arrayremove( level.scriptable_notify_callback_funcs[ funckey ], func );
}

// Namespace scriptable
// Params 5
// Checksum 0xf3634126, Offset: 0xefe
// Size: 0xef
function scriptable_enginenotifycallback( instance, note, param, ent, var_64ffacba090c91be )
{
    if ( !isdefined( level.scriptable_notify_callback_funcs ) )
    {
        return;
    }
    
    funcarray = level.scriptable_notify_callback_funcs[ note ];
    
    if ( !isdefined( funcarray ) || funcarray.size == 0 )
    {
        return;
    }
    
    foreach ( func in funcarray )
    {
        if ( isdefined( ent ) )
        {
            ent [[ func ]]( instance, note, param, var_64ffacba090c91be );
            continue;
        }
        
        level [[ func ]]( instance, note, param, var_64ffacba090c91be );
    }
}

