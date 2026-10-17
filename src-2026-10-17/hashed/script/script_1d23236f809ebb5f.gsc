#using script_4f9ce8d249a99f4a;
#using scripts\common\utility;

#namespace perk_mark_targets;

// Namespace perk_mark_targets
// Params 0
// Checksum 0x54cd1c7b, Offset: 0x76
// Size: 0x2
function marktarget_init()
{
    
}

// Namespace perk_mark_targets
// Params 3
// Checksum 0x8f23aa8a, Offset: 0x80
// Size: 0x78
function marktarget_run( victim, objweapon, smeansofdeath )
{
    if ( utility::isbulletdamage( smeansofdeath ) && isplayer( victim ) && player::isreallyalive( victim ) && victim.team != self.team && isdefined( objweapon ) && !objweapon.isalternate )
    {
        thread marktarget_execute( victim );
    }
}

// Namespace perk_mark_targets
// Params 1
// Checksum 0x6da7b115, Offset: 0x100
// Size: 0x4c
function marktarget_execute( target )
{
    target notify( #"delayhealing_started" );
    target endon( #"delayhealing_started" );
    target.healthregendisabled = 1;
    tagmarkedplayer( target );
    
    if ( isdefined( target ) )
    {
        target removemarkfromtarget();
    }
}

// Namespace perk_mark_targets
// Params 1
// Checksum 0x7cbfc811, Offset: 0x154
// Size: 0x74
function tagmarkedplayer( target )
{
    self endon( #"death_or_disconnect" );
    target endon( #"death_or_disconnect" );
    var_928612c5ea399b56 = utility::callsharedfunc( #"specialty_frangible_resist", #"hash_e03a171fd81a1b93" ) ?? 1;
    timemarked = gettime() + 3500 * var_928612c5ea399b56;
    
    while ( gettime() < timemarked )
    {
        waitframe();
    }
}

// Namespace perk_mark_targets
// Params 0
// Checksum 0x39181499, Offset: 0x1d0
// Size: 0xc
function removemarkfromtarget()
{
    self.healthregendisabled = undefined;
}

