#using scripts\common\callbacks;
#using scripts\common\values;
#using scripts\common\vehicle_compass;
#using scripts\mp\flags;

#namespace specialty_outlinekillstreaks;

// Namespace specialty_outlinekillstreaks
// Params 0, eflags: 0x1
// Checksum 0xfedb4c39, Offset: 0xdf
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_outlinekillstreaks
// Params 1
// Checksum 0xba6347b9, Offset: 0xff
// Size: 0x3a
function registerspecialty( params )
{
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_outlinekillstreaks", &setoutlinekillstreaks, &unsetoutlinekillstreaks, [] );
    }
}

// Namespace specialty_outlinekillstreaks
// Params 0
// Checksum 0xcb521334, Offset: 0x141
// Size: 0x2d
function setoutlinekillstreaks()
{
    self.var_5f38757dd132c921 = self.var_9842326056fd7207.var_5f38757dd132c921 ?? 1000000;
    thread outlinekillstreaks_enablemarksafterprematch();
}

// Namespace specialty_outlinekillstreaks
// Params 0
// Checksum 0xcc49e919, Offset: 0x176
// Size: 0xda
function outlinekillstreaks_enablemarksafterprematch()
{
    self endon( #"hash_32a890261ee15bc6" );
    self endon( #"disconnect" );
    flags::gameflagwait( "prematch_done" );
    dist = self.var_5f38757dd132c921;
    
    if ( isdefined( self ) )
    {
        foreach ( value in [ "entity_mark_killstreak", "entity_mark_air_killstreak" ] )
        {
            val::set( "specialty_outlinekillstreaks", value, dist );
        }
        
        self.perkoutlinekillstreaksset = 1;
        vehicle_compass::function_3e3244741bc2a2ec( self );
    }
}

// Namespace specialty_outlinekillstreaks
// Params 0
// Checksum 0xe00066e6, Offset: 0x258
// Size: 0xb4
function unsetoutlinekillstreaks()
{
    if ( self.perkoutlinekillstreaksset )
    {
        foreach ( value in [ "entity_mark_killstreak", "entity_mark_air_killstreak" ] )
        {
            val::reset( "specialty_outlinekillstreaks", value );
        }
        
        self.perkoutlinekillstreaksset = undefined;
    }
    
    vehicle_compass::function_3e3244741bc2a2ec( self );
    self notify( #"hash_32a890261ee15bc6" );
}

