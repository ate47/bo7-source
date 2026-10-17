#using script_4f9ce8d249a99f4a;
#using scripts\common\callbacks;
#using scripts\mp\gametypes\common;
#using scripts\mp\weapons;

#namespace specialty_plateless_speed;

// Namespace specialty_plateless_speed
// Params 0, eflags: 0x1
// Checksum 0xfa6e17e5, Offset: 0xa8
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_plateless_speed
// Params 1
// Checksum 0x3226260a, Offset: 0xc8
// Size: 0x3a
function registerspecialty( params )
{
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_plateless_speed", &function_4a3b60d6dff35432, &function_47b8d37fdb73c56f, [] );
    }
}

// Namespace specialty_plateless_speed
// Params 0
// Checksum 0x9810405c, Offset: 0x10a
// Size: 0x9
function function_4a3b60d6dff35432()
{
    thread function_4a1b92af6c9ef6ca();
}

// Namespace specialty_plateless_speed
// Params 0
// Checksum 0x7787b3b3, Offset: 0x11b
// Size: 0xe
function function_47b8d37fdb73c56f()
{
    self notify( #"specialty_plateless_speed_end" );
}

// Namespace specialty_plateless_speed
// Params 0
// Checksum 0xe6e97c1f, Offset: 0x131
// Size: 0x9a
function platelessspeedboost()
{
    var_6d7cd151fbd9a9c0 = self.armorhealth >= self.maxarmorhealth;
    speedmod = getdvarfloat( @"scr_plateless_speed_mod", 0.1 );
    playeralive = player::isreallyalive( self );
    
    if ( !var_6d7cd151fbd9a9c0 )
    {
        if ( !common::function_8ff835bf23198a0( "platelessSpeedMod" ) )
        {
            common::function_ac4bf3256b2545e3( "platelessSpeedMod", speedmod );
        }
    }
    else if ( common::function_8ff835bf23198a0( "platelessSpeedMod" ) )
    {
        common::function_d85a92c557ea5a52( "platelessSpeedMod" );
    }
    
    if ( playeralive )
    {
        weapons::updatemovespeedscale();
    }
}

// Namespace specialty_plateless_speed
// Params 0
// Checksum 0xceb8c0a6, Offset: 0x1d3
// Size: 0x42
function function_4a1b92af6c9ef6ca()
{
    level endon( #"game_ended" );
    self endon( #"disconnect" );
    self endon( #"specialty_plateless_speed_end" );
    
    while ( true )
    {
        platelessspeedboost();
        self waittill( #"armor_health_update" );
    }
}

