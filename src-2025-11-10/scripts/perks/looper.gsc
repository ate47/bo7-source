#using scripts\common\callbacks;

#namespace looper;

// Namespace looper
// Params 0, eflags: 0x1
// Checksum 0x36ab3d4f, Offset: 0x94
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &function_cac16087e3f93b6 );
}

// Namespace looper
// Params 1
// Checksum 0x53a93e1, Offset: 0xb4
// Size: 0x5c
function function_cac16087e3f93b6( params )
{
    bundle = level.perkbundles[ "specialty_looper" ];
    
    if ( !isdefined( bundle ) )
    {
        return;
    }
    
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_looper", &function_117c9c7c7b5ce0fb, &function_e23a039e0e6140ee );
    }
}

// Namespace looper
// Params 0
// Checksum 0x91e2a39d, Offset: 0x118
// Size: 0x76
function function_117c9c7c7b5ce0fb()
{
    bundle = level.perkbundles[ "specialty_looper" ];
    self.var_3954d804557beb55 = bundle.var_1e9d79c3b9584677 ?? 999;
    self.var_bbcb5b8525f16f4b[ 1 ] = 0;
    self.var_bbcb5b8525f16f4b[ 2 ] = 0;
    self.var_bbcb5b8525f16f4b[ 3 ] = 0;
    callback::add( #"killstreak_activated", &function_837c8de566c5a461 );
}

// Namespace looper
// Params 0
// Checksum 0xa9e5dbca, Offset: 0x196
// Size: 0x17
function function_e23a039e0e6140ee()
{
    callback::remove( #"killstreak_activated", &function_837c8de566c5a461 );
}

// Namespace looper
// Params 1, eflags: 0x4
// Checksum 0x6887f176, Offset: 0x1b5
// Size: 0x86
function private function_837c8de566c5a461( params )
{
    if ( !isdefined( self.var_bbcb5b8525f16f4b[ params.var_78fabc4ac526d08 ] ) )
    {
        return;
    }
    
    self.var_bbcb5b8525f16f4b[ params.var_78fabc4ac526d08 ]++;
    
    if ( self.var_bbcb5b8525f16f4b[ params.var_78fabc4ac526d08 ] >= self.var_3954d804557beb55 )
    {
        self setclientomnvar( level.streakglobals.var_4c3d20e7c093163[ params.var_78fabc4ac526d08 ], 1 );
    }
}

