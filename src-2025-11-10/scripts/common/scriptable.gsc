#using scripts\engine\scriptable;

#namespace scriptable;

// Namespace scriptable/scriptable_init
// Params 0, eflags: 0x20
// Checksum 0x59034803, Offset: 0x80
// Size: 0x9
function event_handler[scriptable_init] scriptable_initialize()
{
    scriptable_engineinitialize();
}

// Namespace scriptable/scriptable_postinit
// Params 0, eflags: 0x20
// Checksum 0x79f7b69e, Offset: 0x91
// Size: 0x9
function event_handler[scriptable_postinit] scriptable_post_initialize()
{
    scriptable_enginepostinitialize();
}

// Namespace scriptable/scriptable_used
// Params 6, eflags: 0x20
// Checksum 0x5c1ce20c, Offset: 0xa2
// Size: 0x48
function event_handler[scriptable_used] scriptable_used( instance, part, state, player, bautouse, usestring )
{
    scriptable_engineused( instance, part, state, player, bautouse, usestring );
}

// Namespace scriptable/event_29dd481f3803ceb8
// Params 4, eflags: 0x20
// Checksum 0x3254b919, Offset: 0xf2
// Size: 0x33
function event_handler[event_29dd481f3803ceb8] function_9e50a452d3f2500c( instance, part, state, player )
{
    return function_904787b1a7ed4f61( instance, part, state, player );
}

// Namespace scriptable/event_750d33ea094cd662
// Params 5, eflags: 0x20
// Checksum 0x34eaf2d4, Offset: 0x12e
// Size: 0x3e
function event_handler[event_750d33ea094cd662] function_3f1e5be32aa9e0e3( instance, part, state, player, useduration )
{
    function_190abcbcb4f3a47c( instance, part, state, player, useduration );
}

// Namespace scriptable/event_fab19dbfa32508bc
// Params 2, eflags: 0x20
// Checksum 0xb344b9b9, Offset: 0x174
// Size: 0x1e
function event_handler[event_fab19dbfa32508bc] function_fab19dbfa32508bc( instance, player )
{
    return function_1e33a4f0f19aa3a( instance, player );
}

// Namespace scriptable/scriptable_damage
// Params 13, eflags: 0x20
// Checksum 0x1c5d8b56, Offset: 0x19b
// Size: 0x8e
function event_handler[scriptable_damage] function_dc8eae0479686591( note, param, einflictor, eattacker, instance, idamage, idflags, smeansofdeath, objweapon, vdir, shitloc, modelindex, partname )
{
    scriptable_enginedamaged( einflictor, eattacker, instance, idamage, idflags, smeansofdeath, objweapon, vdir, shitloc, modelindex, partname );
}

// Namespace scriptable
// Params 13
// Checksum 0x5151d8a1, Offset: 0x231
// Size: 0x8e
function riotshield_damaged( note, param, einflictor, eattacker, instance, idamage, idflags, smeansofdeath, objweapon, vdir, shitloc, modelindex, partname )
{
    scriptable_enginedamaged( einflictor, eattacker, instance, idamage, idflags, smeansofdeath, objweapon, vdir, shitloc, modelindex, partname );
}

// Namespace scriptable/scriptable_touched
// Params 4, eflags: 0x20
// Checksum 0xdaf9ebd5, Offset: 0x2c7
// Size: 0x34
function event_handler[scriptable_touched] scriptable_touched( instance, part, state, player )
{
    scriptable_enginetouched( instance, part, state, player );
}

// Namespace scriptable/event_90b3dac3d776d2f6
// Params 2, eflags: 0x20
// Checksum 0x8d5f398a, Offset: 0x303
// Size: 0x1f
function event_handler[event_90b3dac3d776d2f6] function_b4f2f1e43208be2d( id, scriptables )
{
    function_ce0492ba57130ca4( id, scriptables );
}

// Namespace scriptable/event_c26bb161f32a8f79
// Params 2, eflags: 0x20
// Checksum 0x634c30e8, Offset: 0x32a
// Size: 0x1f
function event_handler[event_c26bb161f32a8f79] function_e238758bb6d06ce2( event, scriptables )
{
    function_f9851d1984d0205c( event, scriptables );
}

// Namespace scriptable/scriptable_notify
// Params 5, eflags: 0x20
// Checksum 0x41b3e772, Offset: 0x351
// Size: 0x3e
function event_handler[scriptable_notify] scriptable_notify_callback( instance, note, param, ent, var_64ffacba090c91be )
{
    scriptable_enginenotifycallback( instance, note, param, ent, var_64ffacba090c91be );
}

