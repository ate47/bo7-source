#using script_16ea1b94f0f381b3;
#using scripts\common\callbacks;

#namespace zombie_mimic_medal;

// Namespace zombie_mimic_medal
// Params 0
// Checksum 0x2f8647, Offset: 0x97
// Size: 0x2
function function_57b2d1bc4e78117f()
{
    
}

// Namespace zombie_mimic_medal
// Params 0
// Checksum 0xec940cac, Offset: 0xa1
// Size: 0x13
function function_cb6aaffca1a53fd8()
{
    callback::add( "on_entity_revealed", &function_13122efd6e20aabc );
}

// Namespace zombie_mimic_medal
// Params 0
// Checksum 0x44897c27, Offset: 0xbc
// Size: 0x13
function function_eebb37610fa6d82f()
{
    callback::remove( "on_entity_revealed", &function_13122efd6e20aabc );
}

// Namespace zombie_mimic_medal
// Params 1, eflags: 0x4
// Checksum 0x65bcfd59, Offset: 0xd7
// Size: 0x68
function private function_13122efd6e20aabc( params )
{
    var_d43828c0548aa2ee = params.activators[ 0 ];
    activation_info = params.activation_info;
    
    if ( isplayer( var_d43828c0548aa2ee ) && activation_info === "damaged" )
    {
        var_d43828c0548aa2ee namespace_9d8e359c3b1041e5::doscoreeventsharedfunc( #"medal_prophunt" );
        function_eebb37610fa6d82f();
    }
}

