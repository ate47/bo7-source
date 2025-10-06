#using scripts\common\callbacks;
#using scripts\cp_mp\utility\player_utility;
#using scripts\engine\utility;
#using scripts\mp\equipment;
#using scripts\mp\utility\perk;
#using scripts\mp\utility\player;
#using scripts\mp\utility\points;

#namespace namespace_34a92e38d48a5cd;

// Namespace namespace_34a92e38d48a5cd
// Params 0, eflags: 0x1
// Checksum 0x59bd7cd8, Offset: 0xa8
// Size: 0x18
function autoexec main()
{
    level callback::add( #"register_perk", &registerperk );
}

// Namespace namespace_34a92e38d48a5cd
// Params 1
// Checksum 0xc2c7e8fc, Offset: 0xc8
// Size: 0xfe
function registerperk( params )
{
    bundle = level.perkbundles[ "specialty_damage_radar" ];
    
    if ( !isdefined( bundle ) )
    {
        return;
    }
    
    specialties = [];
    
    if ( isdefined( bundle.specialties ) )
    {
        foreach ( specialty in bundle.specialties )
        {
            specialties[ specialties.size ] = specialty.bundle;
        }
    }
    
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_damage_radar", &function_1fcd4e4255326665, &function_8e3be796ca0219de, specialties, &function_1c7fc389520dbe37 );
    }
}

// Namespace namespace_34a92e38d48a5cd
// Params 0
// Checksum 0x914b7c78, Offset: 0x1ce
// Size: 0x1d
function function_1c7fc389520dbe37()
{
    bundle = level.perkbundles[ "specialty_damage_radar" ];
}

// Namespace namespace_34a92e38d48a5cd
// Params 0, eflags: 0x4
// Checksum 0xfab836b1, Offset: 0x1f3
// Size: 0x172
function private function_1fcd4e4255326665()
{
    bundle = level.perkbundles[ "specialty_damage_radar" ];
    
    if ( !bundle )
    {
        return;
    }
    
    self.var_c36269996253c559 = { #var_84f1289ab8e8b033:bundle.var_d283a32fb018ed4c ?? #"self", #var_1e2805287bfef690:bundle.var_1e2805287bfef690 ?? 0, #var_4e19a63d008c835b:bundle.var_4e19a63d008c835b ?? 0, #var_c4edaf982d93da33:bundle.var_c4edaf982d93da33 ?? 0, #var_89b066062ed2af10:bundle.var_d5bad0c2aa357009 ?? 1, #var_e8586dda0c8912a1:bundle.var_6095c743f5a1703e ?? 5, #var_11a45d4b82e41038:&function_b7a140fa61cb82fe, #var_4e0caacb60f9e217:&function_a310a421089135 };
    
    if ( isdefined( bundle.specialties ) )
    {
        foreach ( specialty in bundle.specialties )
        {
            perk::giveperk( specialty );
        }
    }
}

// Namespace namespace_34a92e38d48a5cd
// Params 0, eflags: 0x4
// Checksum 0xc3944f07, Offset: 0x36d
// Size: 0xb6
function private function_8e3be796ca0219de()
{
    bundle = level.perkbundles[ "specialty_damage_radar" ];
    
    if ( !bundle )
    {
        return;
    }
    
    self.var_c36269996253c559 = undefined;
    
    if ( isdefined( bundle.specialties ) )
    {
        foreach ( specialty in bundle.specialties )
        {
            perk::removeperk( specialty );
        }
    }
}

// Namespace namespace_34a92e38d48a5cd
// Params 4
// Checksum 0x7fd114a5, Offset: 0x42b
// Size: 0x193, Type: bool
function function_a310a421089135( weaponobj, attacker, meansofdeath, damage )
{
    victim = self;
    
    if ( !player_utility::playersareenemies( victim, attacker ) )
    {
        return false;
    }
    
    if ( attacker.var_c36269996253c559.var_1e2805287bfef690 && ( !player::isreallyalive( self ) || damage >= self.health ) )
    {
        return false;
    }
    
    var_42d28022726a799f = attacker.var_c36269996253c559.var_c4edaf982d93da33 && isexplosivedamagemod( meansofdeath );
    
    if ( !var_42d28022726a799f )
    {
        return false;
    }
    
    var_479df90b918cb380 = victim.var_b96a2725710c9481.var_479df90b918cb380 ?? -1;
    
    if ( var_479df90b918cb380 > 0 )
    {
        var_80af201340498a0f = gettime() / 1000 - var_479df90b918cb380;
        
        if ( var_80af201340498a0f < attacker.var_c36269996253c559.var_89b066062ed2af10 )
        {
            return false;
        }
    }
    
    var_ef52274dc1fa3e5 = utility::getsharedfunc( #"hash_d8976e21a6adafba", #"hash_f3a152be2dbc14b9" );
    
    if ( isdefined( var_ef52274dc1fa3e5 ) && victim [[ var_ef52274dc1fa3e5 ]]() )
    {
        return false;
    }
    
    if ( victim function_80c37c715fc1f432() )
    {
        return false;
    }
    
    if ( attacker.var_c36269996253c559.var_4e19a63d008c835b && equipment_mp::function_65ff545a795c7f55( weaponobj ) )
    {
        equipmentname = equipment_mp::getequipmentreffromweapon( weaponobj );
        
        if ( equipment_mp::isequipmenttactical( equipmentname ) )
        {
            return false;
        }
    }
    
    return true;
}

// Namespace namespace_34a92e38d48a5cd
// Params 2
// Checksum 0xd234ab1e, Offset: 0x5c7
// Size: 0x1a4
function function_b7a140fa61cb82fe( attacker, inflictor )
{
    if ( !isdefined( attacker.var_c36269996253c559 ) )
    {
        return;
    }
    
    victim = self;
    victim endon( "disconnect" );
    
    if ( !isdefined( victim.var_b96a2725710c9481 ) )
    {
        victim.var_b96a2725710c9481 = {};
    }
    
    victim.var_b96a2725710c9481.var_479df90b918cb380 = gettime() / 1000;
    attacker callback::callback( #"hash_bdda5c524eb0eb00" );
    
    if ( isdefined( inflictor ) )
    {
        if ( !isdefined( inflictor.var_3642ac04db718b4d ) )
        {
            inflictor.var_3642ac04db718b4d = {};
        }
        
        if ( !inflictor.var_3642ac04db718b4d.var_ea0abd26665f4c64 )
        {
            inflictor.var_3642ac04db718b4d.var_ea0abd26665f4c64 = 1;
            attacker thread points::doscoreevent( #"hash_1a3f021e21caf186" );
        }
    }
    
    var_7763d3aacb9d7d40 = int( attacker.var_c36269996253c559.var_e8586dda0c8912a1 * 1000 );
    
    switch ( attacker.var_c36269996253c559.var_84f1289ab8e8b033 )
    {
        case #"self":
            function_367ca543df797e71( victim, attacker, 0, var_7763d3aacb9d7d40 );
            break;
        case #"hash_4e8e1551cf0ffa0b":
            if ( level.teambased )
            {
                function_367ca543df797e71( victim, attacker, 1, var_7763d3aacb9d7d40 );
            }
            else
            {
                function_367ca543df797e71( victim, attacker, 0, var_7763d3aacb9d7d40 );
            }
            
            break;
    }
    
    victim.var_4395a821533743e7[ attacker.team ] = gettime();
}

// Namespace namespace_34a92e38d48a5cd
// Params 4
// Checksum 0x1173ed0d, Offset: 0x773
// Size: 0xa5
function function_367ca543df797e71( victim, attacker, var_709ac30a7320fb20, var_7763d3aacb9d7d40 )
{
    if ( var_709ac30a7320fb20 )
    {
        attacker function_7b4f73a93178f87d( 5, [ attacker.team ], victim, 1 );
        waitframe();
        victim function_71c7c5be98d11198( [ attacker.team ], var_7763d3aacb9d7d40 );
        attacker function_7b4f73a93178f87d( 5, [ attacker.team ], victim, 0 );
        return;
    }
    
    attacker function_ecd2f14bbbea51ae( 5, victim, 1 );
    waitframe();
    victim function_c28b1028e7b04db3( attacker, var_7763d3aacb9d7d40 );
    attacker function_ecd2f14bbbea51ae( 5, victim, 0 );
}

