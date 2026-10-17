#namespace damage;

// Namespace damage
// Params 12
// Checksum 0x857f7cf8, Offset: 0x76
// Size: 0x85
function callback_playerdamagescore( einflictor, eattacker, idamage, idflags, smeansofdeath, fdistance, objweapon, vpoint, vdir, shitloc, lightarmordamage, heavyarmordamage )
{
    return scoredamage( einflictor, eattacker, idamage, idflags, smeansofdeath, fdistance, objweapon, vpoint, vdir, shitloc, lightarmordamage, heavyarmordamage );
}

// Namespace damage
// Params 12
// Checksum 0xa4f626f4, Offset: 0x104
// Size: 0x89
function scoredamage( einflictor, eattacker, idamage, idflags, smeansofdeath, fdistance, objweapon, vpoint, vdir, shitloc, lightarmordamage, heavyarmordamage )
{
    if ( idamage >= 50 )
    {
        return 2;
    }
    else if ( idamage >= 16 )
    {
        return 1;
    }
    
    return 0;
}

