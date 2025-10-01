#using scripts\common\callbacks;
#using scripts\cp_mp\playerhealth;
#using scripts\engine\utility;

#namespace hand_to_hand;

// Namespace hand_to_hand
// Params 0, eflags: 0x1
// Checksum 0xa6151814, Offset: 0x11a
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &function_712a64a2016b7eaa );
}

// Namespace hand_to_hand
// Params 1
// Checksum 0xab8c08, Offset: 0x13a
// Size: 0x91
function function_712a64a2016b7eaa( params )
{
    bundle = level.perkbundles[ "specialty_hand_to_hand" ];
    
    if ( !isdefined( bundle ) )
    {
        return;
    }
    
    if ( !function_c28ff33f9f675615() )
    {
        function_79901b4637c83c86( #"hash_1779d0de0ef7bd78" );
        return;
    }
    
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_hand_to_hand", &function_441c7b7b4c7730bb, &function_aded2011611e464a, undefined, &function_623a606e7d416be1 );
    }
    
    callback::add( #"hash_6a8a551945faab9", &function_5b96bda9101c3941 );
}

// Namespace hand_to_hand
// Params 0
// Checksum 0x8874172d, Offset: 0x1d3
// Size: 0x17
function function_623a606e7d416be1()
{
    callback::add( #"player_death", &function_178e145db29b0fb2 );
}

// Namespace hand_to_hand
// Params 0
// Checksum 0xec009030, Offset: 0x1f2
// Size: 0xd
function function_441c7b7b4c7730bb()
{
    self.var_ab4d7cd5a6a3ee1b = 1;
}

// Namespace hand_to_hand
// Params 0
// Checksum 0x463a6bd9, Offset: 0x207
// Size: 0xc
function function_aded2011611e464a()
{
    self.var_ab4d7cd5a6a3ee1b = undefined;
}

// Namespace hand_to_hand
// Params 1
// Checksum 0x1334041, Offset: 0x21b
// Size: 0x2f
function function_178e145db29b0fb2( deathdata )
{
    if ( !deathdata.attacker.var_ab4d7cd5a6a3ee1b )
    {
        return;
    }
    
    function_a567900bd87dc30e( deathdata );
}

// Namespace hand_to_hand
// Params 1, eflags: 0x4
// Checksum 0xb2246393, Offset: 0x252
// Size: 0x190
function private function_a567900bd87dc30e( deathdata )
{
    attacker = deathdata.attacker;
    
    if ( !isplayer( attacker ) )
    {
        return;
    }
    
    victim = deathdata.victim;
    
    if ( !isplayer( victim ) )
    {
        return;
    }
    
    if ( victim == attacker )
    {
        return;
    }
    
    var_d205f49d427d864a = deathdata.meansofdeath === "MOD_MELEE";
    var_e2279129d3144144 = deathdata.meansofdeath === "MOD_EXECUTION";
    var_89a54915eae3f274 = deathdata.meansofdeath === "MOD_MEATSHIELD";
    var_db7a13eedede38ef = var_d205f49d427d864a || var_e2279129d3144144 || var_89a54915eae3f274;
    
    if ( !var_db7a13eedede38ef )
    {
        var_db7a13eedede38ef = istrue( deathdata.inflictor.bundle.var_edee58adb6e07c4f );
    }
    
    if ( !var_db7a13eedede38ef )
    {
        return;
    }
    
    bundle = level.perkbundles[ "specialty_hand_to_hand" ];
    
    if ( var_d205f49d427d864a && !bundle.var_c77bbf515b649026 && !deathdata.objweapon.ismelee )
    {
        return;
    }
    
    if ( isxhash( bundle.var_d1a12be7d311c2b7 ) )
    {
        var_dbd43a8b925f566f = level.sharedfuncs[ #"player" ][ #"doScoreEvent" ];
        
        if ( isdefined( var_dbd43a8b925f566f ) )
        {
            attacker thread [[ var_dbd43a8b925f566f ]]( bundle.var_d1a12be7d311c2b7 );
        }
    }
    
    attacker thread function_7b318b509ba9c0a7();
}

// Namespace hand_to_hand
// Params 0
// Checksum 0x92c1cf9a, Offset: 0x3ea
// Size: 0x95
function function_7b318b509ba9c0a7()
{
    self notify( "hand_to_hand_buff" );
    self endon( "hand_to_hand_buff" );
    self.var_2c28af7805c1ac38 = 1;
    bundle = level.perkbundles[ "specialty_hand_to_hand" ];
    playerhealth::function_fd91e6d94cab77e7( "handToHand_regenDelay", bundle.var_817edf22d8121745 ?? 0 );
    result = utility::waittill_notify_or_timeout_return( "death", bundle.var_68f9448610af10da );
    playerhealth::function_b1fb4d148779580e( "handToHand_regenDelay" );
    self.var_2c28af7805c1ac38 = undefined;
    self notify( "hand_to_hand_expired" );
}

// Namespace hand_to_hand
// Params 1
// Checksum 0x5e02294a, Offset: 0x487
// Size: 0x86
function function_5b96bda9101c3941( params )
{
    if ( !self.var_63490a14ef1618a3 && !self.var_7d107b7503b87ff5 && self.var_2c28af7805c1ac38 )
    {
        bundle = level.perkbundles[ "specialty_hand_to_hand" ];
        var_dbeba8214a6e15df = bundle.var_132c2b0ed28e4542 ?? 1.5;
        params.var_2b32a8de075bfd54 *= var_dbeba8214a6e15df;
    }
}

