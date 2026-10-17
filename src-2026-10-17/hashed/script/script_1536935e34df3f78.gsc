#using scripts\common\callbacks;
#using scripts\mp\gamelogic;

#namespace specialty_supersprint_enhanced;

// Namespace specialty_supersprint_enhanced
// Params 0, eflags: 0x1
// Checksum 0xe80e3521, Offset: 0x98
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_supersprint_enhanced
// Params 1
// Checksum 0x25f515f7, Offset: 0xb8
// Size: 0x3a
function registerspecialty( params )
{
    if ( isdefined( params.var_a2358848c4408242 ) )
    {
        level [[ params.var_a2358848c4408242 ]]( "specialty_supersprint_enhanced", &setsupersprintenhanced, &unsetsupersprintenhanced, [] );
    }
}

// Namespace specialty_supersprint_enhanced
// Params 0
// Checksum 0x1cb23a62, Offset: 0xfa
// Size: 0x4c
function setsupersprintenhanced()
{
    self.supersprintduration = self.var_9842326056fd7207.supersprintduration ?? 2000;
    self.var_a1333e0889be8729 = self.var_9842326056fd7207.var_a1333e0889be8729 ?? 1;
    thread watchforsupersprintenhancedused();
}

// Namespace specialty_supersprint_enhanced
// Params 0
// Checksum 0x30e8424c, Offset: 0x14e
// Size: 0xe
function unsetsupersprintenhanced()
{
    self notify( #"unsetsupersprintenhanced" );
}

// Namespace specialty_supersprint_enhanced
// Params 0
// Checksum 0xd6572941, Offset: 0x164
// Size: 0x71
function watchforsupersprintenhancedused()
{
    self endon( #"unsetsupersprintenhanced" );
    self endon( #"disconnect" );
    var_712cdbcf2abf339b = 0;
    
    while ( self.supersprintduration > var_712cdbcf2abf339b )
    {
        waitframe();
        
        if ( self issupersprinting() )
        {
            deltatime = level.frameduration;
            var_712cdbcf2abf339b += deltatime;
        }
    }
    
    if ( self.var_a1333e0889be8729 )
    {
        gamelogic_mp::sethasdonecombat( self, 1 );
    }
}

