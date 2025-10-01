#using script_1adabd4beb172de7;
#using scripts\common\ai;
#using scripts\common\callbacks;
#using scripts\common\utility;
#using scripts\cp_mp\equipment;
#using scripts\cp_mp\utility\weapon_utility;
#using scripts\engine\utility;
#using scripts\mp\equipment;
#using scripts\mp\gamelogic;
#using scripts\mp\utility\player;
#using scripts\mp\weapons;

#namespace semtex;

// Namespace semtex
// Params 0, eflags: 0x5
// Checksum 0xa5f5ad6c, Offset: 0x195
// Size: 0x14
function private autoexec function_2e156f7b4a6033d3()
{
    level callback::add( "init_grenade", &init );
}

// Namespace semtex
// Params 1, eflags: 0x4
// Checksum 0x951040c6, Offset: 0x1b1
// Size: 0x2e
function private init( params )
{
    weapons::registerusedcallback( "semtex", &semtex_used );
    weapons::function_2cd25260a11d5e40( "semtex", &semtex_pullback );
}

// Namespace semtex
// Params 1
// Checksum 0xdaccd42, Offset: 0x1e7
// Size: 0x3f7
function semtex_used( grenade )
{
    self endon( "disconnect" );
    grenade endon( "death" );
    bundle = equipment::getequipmenttableinfo( "equip_semtex" ).bundle;
    
    if ( bundle.var_e36b84555e7df1d3 && grenade.weapon_object hasattachmenthash( bundle.var_e36b84555e7df1d3 ) )
    {
        foreach ( ent in self.var_e23d1c0d0e07a617 )
        {
            if ( ent getlinkedparent() == self )
            {
                ent unlink();
                ent linkto( grenade, "tag_origin", ( 0, 0, 0 ), ( 0, 0, 0 ) );
                grenade.soundent = ent;
                grenade thread function_84ce07fc48f059();
                break;
            }
        }
        
        grenade setscriptablepartstate( #"state", #"warning_without_sound", 0 );
    }
    
    grenade.bundle = equipment::getEquipmentBundleFromWeaponName( grenade.weapon_name );
    grenade thread weapons::delayshow( 0.05 );
    stuckinfo = grenade weapons::function_f38c6bdea2fb97f3( 1, grenade.bundle.var_21c82f0c7a81799c );
    
    if ( stuckinfo )
    {
        if ( stuckinfo.msg == "missile_stuck" )
        {
            stuckto = stuckinfo.param1;
        }
    }
    
    if ( !( bundle.var_e36b84555e7df1d3 && grenade.weapon_object hasattachmenthash( bundle.var_e36b84555e7df1d3 ) ) )
    {
        grenade setscriptablepartstate( #"state", #"warning", 0 );
    }
    
    if ( isplayer( stuckto ) || isagent( stuckto ) )
    {
        thread namespace_2c42f1b7d9a6dd72::threadedsetweaponstatbyname( grenade.weapon_object, 1, "special_hits" );
        var_7f3fdce4d25dd061 = weapon_utility::function_7f3fdce4d25dd061( grenade );
        
        if ( !( bundle.var_e36b84555e7df1d3 && grenade.weapon_object hasattachmenthash( bundle.var_e36b84555e7df1d3 ) ) )
        {
            stuckto playlocalsound( grenade.bundle.var_a65332982b86adce ?? #"hash_d0bafe992c88665d" );
        }
        
        weapons::grenadestuckto( grenade, stuckto, 0, var_7f3fdce4d25dd061 );
        
        if ( isagent( stuckto ) )
        {
            if ( level.battlechatter )
            {
                function_98ae1f41148cc661( stuckto, undefined, "semtex_stuck" );
            }
            else
            {
                stuckto setbattlechatterflag( "semtex_stuck", 3 );
            }
        }
        
        if ( isagent( stuckto ) && !stuckto.var_2f7b28254901f8d6 )
        {
            if ( !stuckto.var_f424a6135c1dd01f )
            {
                stuckto.var_f424a6135c1dd01f = [];
            }
            else
            {
                stuckto.var_f424a6135c1dd01f = function_46f9072493651dc9( stuckto.var_f424a6135c1dd01f );
            }
            
            stuckto.var_f424a6135c1dd01f[ stuckto.var_f424a6135c1dd01f.size ] = grenade;
            assert( stuckto.health > 0, "<dev string:x24>" );
            ai::function_9b5d55d642edff87( grenade, stuckto );
        }
    }
    
    if ( level.var_ff28e0c14ba90179 )
    {
        foreach ( var_13edf91f5c68cd04 in level.var_ff28e0c14ba90179 )
        {
            var_13edf91f5c68cd04 thread utility::function_f6d2b1924fca249( grenade );
        }
    }
}

// Namespace semtex
// Params 0, eflags: 0xc
// Checksum 0x21fd2748, Offset: 0x5e6
// Size: 0x47
function private function_84ce07fc48f059()
{
    self notify( "fe112a3a8cb03b97" );
    self endon( "fe112a3a8cb03b97" );
    level endon( "game_ended" );
    utility::waittill_any( "death", "explode" );
    
    if ( self.soundent )
    {
        self.soundent thread function_7d673aebc25b92b3();
    }
}

// Namespace semtex
// Params 1
// Checksum 0xffc59c07, Offset: 0x635
// Size: 0x156
function semtex_pullback( params )
{
    bundle = equipment::getequipmenttableinfo( "equip_semtex" ).bundle;
    
    if ( bundle.var_e36b84555e7df1d3 && equipment_mp::function_e6b75548c2c3c6cf( "equip_semtex", bundle.var_e36b84555e7df1d3 ) )
    {
        if ( !isdefined( self.var_e23d1c0d0e07a617 ) )
        {
            self.var_e23d1c0d0e07a617 = [];
        }
        
        semtexsoundent = spawn( "script_model", self.origin );
        semtexsoundent.owner = self;
        semtexsoundent linkto( self, "tag_weapon_right", ( 0, 0, 0 ), ( 0, 0, 0 ) );
        self.var_e23d1c0d0e07a617[ semtexsoundent.entnum ?? utility::function_6ed37478a8ad7320( semtexsoundent ) ] = semtexsoundent;
        thread function_85734e18b130499( semtexsoundent );
        wait 1.5;
        
        if ( self && player::isreallyalive( self ) )
        {
            if ( semtexsoundent )
            {
                soundalias = bundle.var_a65332982b86adce ?? #"hash_d0bafe992c88665d";
                semtexsoundent playsoundonmovingent( soundalias );
                semtexsoundent thread function_7d673aebc25b92b3( ( lookupsoundlength( soundalias ) ?? 1000 ) * 0.001 );
            }
            
            return;
        }
        
        if ( semtexsoundent )
        {
            semtexsoundent thread function_7d673aebc25b92b3();
        }
    }
}

// Namespace semtex
// Params 1, eflags: 0x4
// Checksum 0x54e71c36, Offset: 0x793
// Size: 0x32
function private function_85734e18b130499( soundent )
{
    level endon( "game_ended" );
    self endon( "grenade_fire", "offhand_fired" );
    self waittill( "offhand_end" );
    soundent thread function_7d673aebc25b92b3();
}

// Namespace semtex
// Params 1, eflags: 0xc
// Checksum 0x49f890d8, Offset: 0x7cd
// Size: 0x6c
function private function_7d673aebc25b92b3( time )
{
    self notify( "98e039e70293274f" );
    self endon( "98e039e70293274f" );
    
    if ( time )
    {
        wait time;
    }
    
    if ( self )
    {
        self stopsounds();
        waitframe();
        
        if ( self )
        {
            if ( self.owner )
            {
                self.owner.var_e23d1c0d0e07a617[ self.entnum ?? utility::function_6ed37478a8ad7320( self ) ] = undefined;
            }
            
            self delete();
        }
    }
}

