#using scripts\common\utility;

#namespace gameskill;

// Namespace gameskill
// Params 1
// Checksum 0x39c91a8c, Offset: 0xdb
// Size: 0x28
function get_skill_from_index( index )
{
    if ( utility::issp() )
    {
        index += 1;
    }
    
    return level.difficultytype[ index ];
}

// Namespace gameskill
// Params 1
// Checksum 0x393cc443, Offset: 0x10c
// Size: 0x55
function apply_difficulty_settings_shared( current_frac )
{
    assert( isplayer( self ) );
    self.gameskillmisstimeconstant = get_difficultysetting_frac( "missTimeConstant", current_frac );
    self.gameskillmisstimedistancefactor = get_difficultysetting_frac( "missTimeDistanceFactor", current_frac );
    function_32b1d2ad61212ad6( get_difficultysetting( "double_grenades_allowed" ) );
}

// Namespace gameskill
// Params 2
// Checksum 0xe2305422, Offset: 0x169
// Size: 0x2d
function get_difficultysetting_frac( setting, frac )
{
    value = get_difficultysetting( setting );
    return value * frac;
}

// Namespace gameskill
// Params 2
// Checksum 0x31ce9d40, Offset: 0x19f
// Size: 0x3c
function get_difficultysetting( setting, gameskill )
{
    if ( !isdefined( gameskill ) )
    {
        gameskill = self.gameskill;
    }
    
    return level.difficultysettings[ setting ][ get_skill_from_index( gameskill ) ];
}

// Namespace gameskill
// Params 1
// Checksum 0xd34069d5, Offset: 0x1e4
// Size: 0x28
function get_difficultysetting_global( setting )
{
    return level.difficultysettings[ setting ][ get_skill_from_index( level.gameskill ) ];
}

// Namespace gameskill
// Params 0
// Checksum 0x653cccab, Offset: 0x215
// Size: 0x3, Type: bool
function always_pain()
{
    return false;
}

// Namespace gameskill
// Params 0
// Checksum 0x5a20a0fd, Offset: 0x221
// Size: 0x17, Type: bool
function pain_protection()
{
    if ( !pain_protection_check() )
    {
        return false;
    }
    
    return randomint( 100 ) > 25;
}

// Namespace gameskill
// Params 0
// Checksum 0xb60c68d7, Offset: 0x241
// Size: 0xa2, Type: bool
function pain_protection_check()
{
    if ( !isalive( self.enemy ) )
    {
        return false;
    }
    
    if ( !isplayer( self.enemy ) )
    {
        return false;
    }
    
    if ( !isalive( level.painai ) || level.painai.script != "pain" )
    {
        level.painai = self;
    }
    
    if ( self == level.painai )
    {
        return false;
    }
    
    objweapon = self.damageweapon;
    
    if ( !isnullweapon( objweapon ) && objweapon.isbolt )
    {
        return false;
    }
    
    return true;
}

// Namespace gameskill
// Params 0
// Checksum 0x3c9988b9, Offset: 0x2ec
// Size: 0x9d
function set_accuracy_based_on_situation()
{
    if ( self aiissniper() && isalive( self.enemy ) )
    {
        self function_d19c98808093b502();
        return;
    }
    
    if ( isplayer( self.enemy ) )
    {
        resetmissdebouncetime();
        
        if ( self.misstime > gettime() )
        {
            self.accuracy = 0;
            return;
        }
    }
    
    self.accuracy = self.baseaccuracy;
    
    if ( isdefined( self.isrambo ) && isdefined( self.ramboaccuracymult ) )
    {
        self.accuracy *= self.ramboaccuracymult;
    }
}

// Namespace gameskill
// Params 0
// Checksum 0xedb0db11, Offset: 0x391
// Size: 0xc
function didsomethingotherthanshooting()
{
    self.misstimedebounce = 0;
}

// Namespace gameskill
// Params 0
// Checksum 0xf8d4d18b, Offset: 0x3a5
// Size: 0x13
function resetmissdebouncetime()
{
    self.misstimedebounce = gettime() + 3000;
}

// Namespace gameskill
// Params 0
// Checksum 0x27ae3660, Offset: 0x3c0
// Size: 0x58
function default_door_node_flashbang_frequency()
{
    if ( self.team == "allies" )
    {
        self.doorflashchance = 0.6;
    }
    
    if ( self isbadguy() )
    {
        if ( level.gameskill >= 2 )
        {
            self.doorflashchance = 0.8;
            return;
        }
        
        self.doorflashchance = 0.6;
    }
}

// Namespace gameskill
// Params 0
// Checksum 0x72075381, Offset: 0x420
// Size: 0x52
function grenadeawareness()
{
    if ( self.team == "allies" )
    {
        self.grenadeawareness = 0.9;
        self.grenadereturnthrowchance = 0.9;
        return;
    }
    
    if ( self isbadguy() )
    {
        self.grenadeawareness = 1;
        self.grenadereturnthrowchance = 0.2;
    }
}

// Namespace gameskill
// Params 0
// Checksum 0x5f4272ce, Offset: 0x47a
// Size: 0x4c
function map_is_early_in_the_game()
{
    if ( !isdefined( level.early_level ) )
    {
        print( "<dev string:x24>" );
        return 1;
    }
    
    if ( isdefined( level.early_level[ level.script ] ) )
    {
        return level.early_level[ level.script ];
    }
    
    return 0;
}

// Namespace gameskill
// Params 0
// Checksum 0x390ac169, Offset: 0x4cf
// Size: 0xc
function set_early_level()
{
    level.early_level = [];
}

