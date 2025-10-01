#using scripts\common\callbacks;

#namespace looper;

// Namespace looper
// Params 0, eflags: 0x1
// Checksum 0x44cc87b4, Offset: 0x93
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &function_cac16087e3f93b6 );
}

// Namespace looper
// Params 1
// Checksum 0x7c9b6246, Offset: 0xb3
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
// Checksum 0x2837c27a, Offset: 0x117
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
// Checksum 0xe5e2af1c, Offset: 0x195
// Size: 0x17
function function_e23a039e0e6140ee()
{
    callback::remove( #"killstreak_activated", &function_837c8de566c5a461 );
}

// Namespace looper
// Params 1, eflags: 0x4
// Checksum 0xefa2193c, Offset: 0x1b4
// Size: 0x6b
function private function_837c8de566c5a461( params )
{
    self.var_bbcb5b8525f16f4b[ params.var_78fabc4ac526d08 ]++;
    
    if ( self.var_bbcb5b8525f16f4b[ params.var_78fabc4ac526d08 ] >= self.var_3954d804557beb55 )
    {
        self setclientomnvar( level.streakglobals.var_4c3d20e7c093163[ params.var_78fabc4ac526d08 ], 1 );
    }
}

