#using script_762e73cd6088bff;
#using scripts\common\utility;
#using scripts\mp\stealth\utility;

#namespace manager_mp;

// Namespace manager_mp
// Params 0
// Checksum 0xbca99183, Offset: 0x9a
// Size: 0x2
function init()
{
    
}

// Namespace manager_mp
// Params 0
// Checksum 0xc954ad01, Offset: 0xa4
// Size: 0x3c
function init_player()
{
    self waittill( #"giveloadout" );
    
    if ( isdefined( level.stealth.fnsixthsense ) )
    {
        [[ level.stealth.fnsixthsense ]]();
    }
}

// Namespace manager_mp
// Params 0
// Checksum 0x8b63fea9, Offset: 0xe8
// Size: 0x4f
function sixthsense_init()
{
    self endon( #"death" );
    self.sixthsense = spawnstruct();
    self.sixthsense.active = 1;
    
    /#
        setdvarifuninitialized( @"hash_3a87475a75de0350", 0 );
    #/
    
    perk::giveperk( "specialty_ai_stealth_sixth_sense" );
}

// Namespace manager_mp
// Params 0
// Checksum 0xd1f8de08, Offset: 0x13f
// Size: 0x2b
function dropaiaccuracy()
{
    if ( !utility::level_supports_ai() )
    {
        return;
    }
    
    assert( isplayer( self ), "<dev string:x24>" );
    utility::setattackeraccuracy( 0.1 );
}

// Namespace manager_mp
// Params 0
// Checksum 0x948d8a9b, Offset: 0x172
// Size: 0x28
function revertaiaccuracy()
{
    if ( !utility::level_supports_ai() )
    {
        return;
    }
    
    assert( isplayer( self ), "<dev string:x24>" );
    utility::setattackeraccuracy( 1 );
}

