#using script_4eb10b8076cd40c;
#using scripts\asm\asm_bb;

#namespace civilian_logic;

// Namespace civilian_logic
// Params 1
// Checksum 0x84214a57, Offset: 0xe8
// Size: 0x110
function initcivilian( taskid )
{
    if ( isdefined( self.bt.initiated ) )
    {
        return anim.success;
    }
    
    self setcanusecover( 0, "entity" );
    asm_bb::bb_civilianrequestspeed( 170 );
    self.ignoresuppression = 1;
    self.disableplayeradsloscheck = 1;
    self.ignoreplayersuppressionlines = 1;
    self.nextlookforcovertime = 9999999;
    
    if ( !( isdefined( self.animplaybackrate ) && isdefined( self.moveplaybackrate ) ) )
    {
        self.animplaybackrate = 0.97 + randomfloat( 0.13 );
        self.movetransitionrate = 0.97 + randomfloat( 0.13 );
        self.moveplaybackrate = self.movetransitionrate;
        self.sidesteprate = 1.35;
    }
    
    stealth::initstealthfunctions();
    self.fnsetstealthstate = &setstealthstate_neutral;
    self.bt.initiated = 1;
    return anim.success;
}

// Namespace civilian_logic
// Params 2
// Checksum 0x2932686d, Offset: 0x201
// Size: 0x30
function setstealthstate_neutral( statename, e )
{
    if ( statename != "combat" )
    {
        statename = "idle";
    }
    
    return stealth::scrsetstealthstate( statename, e );
}

// Namespace civilian_logic
// Params 1
// Checksum 0x8692ce77, Offset: 0x23a
// Size: 0x2c
function function_df6e746bd5efd6ba( taskid )
{
    initcivilian( taskid );
    self registerciv();
    self function_8dea53a2dfc74f94( 1 );
    return anim.success;
}

// Namespace civilian_logic
// Params 1
// Checksum 0x37561d86, Offset: 0x26f
// Size: 0x70
function civgetbsmstate( taskid )
{
    state = asm_bb::bb_getcivilianstate();
    
    switch ( state )
    {
        case #"hash_fec408e3f7407354":
            return "InPanic";
        case #"hash_bdb1547441050414":
            return "InAlert";
        case #"hash_46fdaf04e9be63e4":
            return "InIdle";
        default:
            return "InIdle";
    }
}

// Namespace civilian_logic
// Params 1
// Checksum 0x59f58320, Offset: 0x2e7
// Size: 0x16
function interactioncleanup( taskid )
{
    iprintlnbold( "Terminating Interaction" );
}

// Namespace civilian_logic
// Params 1
// Checksum 0xabc348b0, Offset: 0x305
// Size: 0x21
function Civilian_StopPatrol( taskid )
{
    self notify( #"stop_going_to_node" );
    return anim.success;
}

