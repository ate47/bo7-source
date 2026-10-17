#using scripts\common\callbacks;
#using scripts\common\values;
#using scripts\mp\flags;

#namespace specialty_engineer;

// Namespace specialty_engineer
// Params 0, eflags: 0x1
// Checksum 0x2ef971b9, Offset: 0xd6
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_engineer
// Params 1
// Checksum 0x998aaafc, Offset: 0xf6
// Size: 0x43
function registerspecialty( params )
{
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_engineer", &setengineer, &unsetengineer, [ "specialty_outlinekillstreaks" ] );
    }
}

// Namespace specialty_engineer
// Params 0
// Checksum 0x922ca0b6, Offset: 0x141
// Size: 0x2d
function setengineer()
{
    self.var_ee14101bfc5363a7 = self.var_9842326056fd7207.var_ee14101bfc5363a7 ?? 1000000;
    thread engineer_enablemarksafterprematch();
}

// Namespace specialty_engineer
// Params 0
// Checksum 0xe41a6aab, Offset: 0x176
// Size: 0x76
function engineer_enablemarksafterprematch()
{
    self notify( #"hash_82947cdd049e2f1f" );
    self endon( #"hash_82947cdd049e2f1f" );
    self endon( #"unsetengineer" );
    self endon( #"disconnect" );
    flags::gameflagwait( "prematch_done" );
    dist = self.var_ee14101bfc5363a7;
    
    if ( isdefined( self ) )
    {
        val::set( "specialty_engineer", "entity_mark_equipment", dist );
        self.perkengineerset = 1;
    }
}

// Namespace specialty_engineer
// Params 0
// Checksum 0xda384e1d, Offset: 0x1f4
// Size: 0x35
function unsetengineer()
{
    if ( self.perkengineerset )
    {
        val::reset( "specialty_engineer", "entity_mark_equipment" );
        self.perkengineerset = undefined;
    }
    
    self notify( #"unsetengineer" );
}

