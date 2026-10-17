#using script_1a6a1f7bdb57d7ff;
#using script_6c2f6a14fa53759e;

#namespace zombie_hellhound_knockdown;

// Namespace zombie_hellhound_knockdown
// Params 0
// Checksum 0xe6590af7, Offset: 0x76
// Size: 0x26
function init_knockdown()
{
    zombie_utils::function_dfae6a5bd222c586( &on_damaged );
    self.knockdowndamagethreshold = self.health * 0.01;
}

// Namespace zombie_hellhound_knockdown
// Params 1, eflags: 0x4
// Checksum 0xd88f3790, Offset: 0xa4
// Size: 0x7e
function private on_damaged( params )
{
    if ( isexplosivedamagemod( params.smeansofdeath ) && ( !isdefined( params.einflictor ) || !params.einflictor.prevent_knockdown ) )
    {
        if ( params.idamage > self.knockdowndamagethreshold )
        {
            zombie_knockdown::knockdown_ai( params.vpoint );
        }
    }
    
    return params.idamage;
}

