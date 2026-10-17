#using script_2b51dca51198db31;
#using scripts\common\callbacks;

#namespace specialty_heal_on_headshot;

// Namespace specialty_heal_on_headshot
// Params 0, eflags: 0x1
// Checksum 0x100f095c, Offset: 0x94
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_heal_on_headshot
// Params 1
// Checksum 0x296dbfac, Offset: 0xb4
// Size: 0x4b
function registerspecialty( params )
{
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_heal_on_headshot", undefined, &function_de390c85dc1d972a );
        level callback::add( #"on_ai_killed", &healonkill );
    }
}

// Namespace specialty_heal_on_headshot
// Params 0, eflags: 0x4
// Checksum 0xb6221c7e, Offset: 0x107
// Size: 0x16
function private function_de390c85dc1d972a()
{
    if ( isplayer( self ) )
    {
        self notify( #"hash_509a7fa94d2da64a" );
    }
}

// Namespace specialty_heal_on_headshot
// Params 1, eflags: 0x4
// Checksum 0x1372fdd1, Offset: 0x125
// Size: 0x154
function private healonkill( params )
{
    if ( isplayer( params.eattacker ) && isdefined( params.eattacker.perks[ "specialty_heal_on_headshot" ] ) )
    {
        params.eattacker endon( #"death" );
        params.eattacker endon( #"hash_509a7fa94d2da64a" );
        
        if ( damage_utility::isheadshot( params.shitloc, params.smeansofdeath, params.eattacker ) )
        {
            healvalue = level.perkbundles[ "specialty_heal_on_headshot" ].var_8a90bc8fa03c2587;
            healthdif = params.eattacker.maxhealth - params.eattacker.health;
            
            if ( healthdif < healvalue )
            {
                params.eattacker.health += healthdif;
                return;
            }
            
            params.eattacker.health += healvalue;
        }
    }
}

