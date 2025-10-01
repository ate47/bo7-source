#using script_433d8f78f7e5fb;
#using scripts\anim\battlechatter;
#using scripts\anim\battlechatter_events;
#using scripts\asm\asm;
#using scripts\common\utility;
#using scripts\engine\utility;

#namespace battlechatter_ai;

// Namespace battlechatter_ai
// Params 0
// Checksum 0xe4c51522, Offset: 0x1c4
// Size: 0x183
function addtosystem()
{
    if ( !isdefined( level.battlechatter ) )
    {
        return;
    }
    
    self endon( "death" );
    assert( isdefined( self.squad ) );
    
    if ( !isdefined( self.battlechatterallowed ) )
    {
        self.battlechatterallowed = 1;
    }
    
    if ( isplayer( self ) )
    {
        self.battlechatterallowed = 0;
        self.type = "human";
        return;
    }
    
    if ( self.unittype == "dog" || self.unittype == "zombie" && isbrgamemode() || self.unittype == "juggernaut" && getprojectname() != "T10" || self.team == "neutral" )
    {
        self.battlechatterallowed = 0;
        return;
    }
    
    if ( level.var_7fd9a527113d4767 )
    {
        self.battlechatterallowed = 0;
        return;
    }
    
    self.battlechatter.friendlyfire_force = 1;
    self.headknob = asm::asm_getxanim( "knobs", asm::asm_lookupanimfromalias( "knobs", "head" ) );
    self.scriptedtalkingknob = asm::asm_getxanim( "knobs", asm::asm_lookupanimfromalias( "knobs", "scripted_talking" ) );
    self.defaulttalk = asm::asm_getxanim( "knobs", asm::asm_lookupanimfromalias( "knobs", "default_talking" ) );
    setvoice();
    thread aithreadwaiter();
    self.chatinitialized = 1;
}

// Namespace battlechatter_ai
// Params 3
// Checksum 0xa5252386, Offset: 0x34f
// Size: 0x97
function setup_mp_hero( var_9582b5184d9de612, combatmapid, stealthmapid )
{
    var_3caaf1badd796942 = tolower( var_9582b5184d9de612 ?? self.script_friendname );
    self.battlechatter.countryid = var_3caaf1badd796942;
    self.battlechatter.npcid = undefined;
    self.battlechatter.ishero = 1;
    anim.var_4ef5299ac30c33e6[ var_3caaf1badd796942 ] = combatmapid;
    anim.var_c285202ed79ffced[ var_3caaf1badd796942 ] = stealthmapid;
}

/#

    // Namespace battlechatter_ai
    // Params 2
    // Checksum 0xe8de6c1f, Offset: 0x3ee
    // Size: 0x22, Type: dev
    function function_e93e1e260edea53( text, duration )
    {
        thread function_a7f2420b11f54b4d( text, duration );
    }

    // Namespace battlechatter_ai
    // Params 2, eflags: 0x4
    // Checksum 0x2af86f6, Offset: 0x418
    // Size: 0x6b, Type: dev
    function private function_a7f2420b11f54b4d( text, duration )
    {
        self endon( "<dev string:x24>" );
        
        if ( !isdefined( self.var_6d86abb3f23dafe7 ) )
        {
            return;
        }
        
        self.var_6d86abb3f23dafe7[ self.var_6d86abb3f23dafe7.size ] = text;
        
        if ( !isdefined( duration ) )
        {
            return;
        }
        
        wait duration;
        self.var_6d86abb3f23dafe7 = utility::function_d751969553a4bddd( self.var_6d86abb3f23dafe7, text );
    }

    // Namespace battlechatter_ai
    // Params 0, eflags: 0x4
    // Checksum 0x8ab322af, Offset: 0x48b
    // Size: 0xcd, Type: dev
    function private function_9512d99877628e15()
    {
        self endon( "<dev string:x24>" );
        self.var_6d86abb3f23dafe7 = [];
        
        for ( ;; )
        {
            height = 30;
            
            foreach ( debugln in self.var_6d86abb3f23dafe7 )
            {
                print3d( self gettagorigin( "<dev string:x2d>" ) + ( 0, 0, height ), debugln, ( 1, 1, 1 ), 1, 0.5, 1, 1 );
                height += 10;
            }
            
            waitframe();
        }
    }

#/

// Namespace battlechatter_ai
// Params 0
// Checksum 0x115a5e35, Offset: 0x560
// Size: 0xe4
function clearvoice()
{
    if ( isdefined( self.battlechatter.npcid ) && isdefined( self.voice ) )
    {
        foreach ( usedid in anim.usedids[ self.voice ] )
        {
            if ( usedid.npcid == self.battlechatter.npcid )
            {
                usedid.count--;
                break;
            }
        }
    }
    
    self.battlechatter.npcid = undefined;
}

// Namespace battlechatter_ai
// Params 1
// Checksum 0x1d09513a, Offset: 0x64c
// Size: 0x9e
function setvoice( voice )
{
    if ( isdefined( voice ) )
    {
        self.voice = voice;
    }
    
    if ( !isdefined( self.voice ) )
    {
        return;
    }
    
    if ( isdefined( self.battlechatter ) && isdefined( self.battlechatter.npcid ) )
    {
        clearvoice();
    }
    
    self.battlechatter.countryid = anim.countryids[ self.voice ];
    
    if ( !isdefined( self.battlechatter.countryid ) )
    {
        return;
    }
    
    namespace_326cae52b2158981::assign_npcid();
}

// Namespace battlechatter_ai
// Params 0
// Checksum 0x48bd2040, Offset: 0x6f2
// Size: 0x10
function reassignvoiceid()
{
    clearvoice();
    namespace_326cae52b2158981::assign_npcid();
}

// Namespace battlechatter_ai
// Params 1
// Checksum 0x37166f9a, Offset: 0x70a
// Size: 0x19d
function removefromsystem( squad )
{
    if ( !( isdefined( level.battlechatter ) && isdefined( self ) ) )
    {
        return;
    }
    
    if ( !isalive( self ) && isdefined( self.attacker ) && squad.team != self.attacker.team && squad.team != "neutral" )
    {
        if ( isscriptedai( self.attacker ) )
        {
            self.attacker setbattlechatterflag( "KilledTarget", 1 );
        }
        
        self.attacker thread battlechatter_events::killfirmevent( self, self.attacker.team );
        thread battlechatter_events::casualtyevent( squad.team );
    }
    
    if ( isdefined( self.battlechatter.npcid ) && isdefined( self.battlechatter ) && isdefined( self.voice ) )
    {
        clearvoice();
        
        if ( isdefined( level.stealth ) && isdefined( level.var_ed9f17bb0f80706e ) )
        {
            thread function_ad67c3e8d22e9eda( squad.team, self.battlechatter.countryid, self.battlechatter.npcid, self.battlechatter.name );
        }
    }
    else if ( isdefined( self.var_8d4f5e01dc1af2e8 ) )
    {
        self.var_8d4f5e01dc1af2e8 notify( "death" );
        self.var_8d4f5e01dc1af2e8 delete();
    }
    
    self notify( "removed from battleChatter" );
}

// Namespace battlechatter_ai
// Params 4
// Checksum 0x9f61b35b, Offset: 0x8af
// Size: 0x1c0
function function_ad67c3e8d22e9eda( team, countryid, npcid, name )
{
    if ( level.var_c500168c9dd66126 )
    {
        return;
    }
    
    origin = self.origin;
    voice = self.voice;
    
    if ( !utility::issp() )
    {
        function_72df09bab3ab3355();
        return;
    }
    
    entnum = self getentitynumber();
    corpse = undefined;
    
    while ( !isdefined( corpse ) )
    {
        array = [[ level.var_ed9f17bb0f80706e ]]( level.bcs_neardist );
        
        foreach ( corpseent in array )
        {
            if ( corpseent getentitynumber() == entnum )
            {
                corpse = corpseent;
            }
        }
        
        waitframe();
    }
    
    corpse.team = team;
    corpse.voice = voice;
    corpse.battlechatter = spawnstruct();
    corpse.battlechatter.countryid = countryid;
    corpse.battlechatter.npcid = npcid;
    corpse.battlechatter.name = name;
    corpse.battlechatterallowed = 1;
    
    if ( isdefined( level.stealth ) )
    {
        corpse thread corpseloop();
    }
}

// Namespace battlechatter_ai
// Params 0
// Checksum 0x31574756, Offset: 0xa77
// Size: 0x2
function function_72df09bab3ab3355()
{
    
}

// Namespace battlechatter_ai
// Params 0
// Checksum 0xb0fadc0f, Offset: 0xa81
// Size: 0x2
function corpseloop()
{
    
}

// Namespace battlechatter_ai
// Params 0
// Checksum 0x6ca17a1, Offset: 0xa8b
// Size: 0xf0
function setnpcid()
{
    assert( !isdefined( self.battlechatter.npcid ) );
    usedids = anim.usedids[ self.voice ];
    numids = usedids.size;
    startindex = randomint( numids );
    lowestid = startindex;
    
    for ( index = 0; index <= numids ; index++ )
    {
        if ( usedids[ ( startindex + index ) % numids ].count < usedids[ lowestid ].count )
        {
            lowestid = ( startindex + index ) % numids;
        }
    }
    
    anim.usedids[ self.voice ][ lowestid ].count++;
    self.battlechatter.npcid = usedids[ lowestid ].npcid;
}

// Namespace battlechatter_ai
// Params 1
// Checksum 0x65ef7282, Offset: 0xb83
// Size: 0x15
function evaluateattackevent( weapon )
{
    battlechatter_events::useevent( weapon );
}

// Namespace battlechatter_ai
// Params 0
// Checksum 0x931e13b, Offset: 0xba0
// Size: 0x45
function aithreadwaiter()
{
    self endon( "death" );
    self endon( "removed from battleChatter" );
    self notify( "aiThreadWaiter" );
    self endon( "aiThreadWaiter" );
    childthread waittill_missile_fire();
    childthread waittill_grenade_fire();
    childthread function_6b9942ef26b91aa2();
    childthread waittill_move();
    childthread function_3545c97b03e07929();
}

// Namespace battlechatter_ai
// Params 0
// Checksum 0xca547ce2, Offset: 0xbed
// Size: 0x4e
function waittill_missile_fire()
{
    while ( true )
    {
        self waittill( "missile_fire", missile, objweapon );
        bcs_subcategory = battlechatter_events::function_e08b029c30762ab3( objweapon );
        
        if ( isdefined( bcs_subcategory ) )
        {
            function_98ae1f41148cc661( self, undefined, "use", bcs_subcategory );
        }
    }
}

// Namespace battlechatter_ai
// Params 0
// Checksum 0x7cf940f9, Offset: 0xc43
// Size: 0x68
function waittill_grenade_fire()
{
    while ( true )
    {
        self waittill( "grenade_fire", grenade );
        
        if ( isdefined( grenade ) && isdefined( grenade.weapon_object ) )
        {
            bcs_subcategory = battlechatter_events::function_e08b029c30762ab3( grenade.weapon_object );
            
            if ( battlechatter::function_1d3591529c0364a9( bcs_subcategory ) )
            {
                function_98ae1f41148cc661( self, grenade, "grenade_danger", bcs_subcategory );
            }
        }
    }
}

// Namespace battlechatter_ai
// Params 0
// Checksum 0x49b0e8f9, Offset: 0xcb3
// Size: 0x1e
function function_6b9942ef26b91aa2()
{
    while ( true )
    {
        self waittill( "weapon_fired" );
        function_98ae1f41148cc661( self, undefined, "attack" );
    }
}

// Namespace battlechatter_ai
// Params 0
// Checksum 0x9ee72c7d, Offset: 0xcd9
// Size: 0x3b
function waittill_move()
{
    while ( true )
    {
        self waittill( "goal_changed" );
        
        if ( distance2dsquared( self.origin, self.goalpos ) > 10000 )
        {
            function_98ae1f41148cc661( self, undefined, "move" );
        }
    }
}

// Namespace battlechatter_ai
// Params 0
// Checksum 0xe92695a, Offset: 0xd1c
// Size: 0x38
function function_3545c97b03e07929()
{
    var_c17f4750045f3e9e = 0;
    
    while ( true )
    {
        if ( var_c17f4750045f3e9e != function_d4da00c745e88c18() )
        {
            var_c17f4750045f3e9e = !var_c17f4750045f3e9e;
            
            if ( var_c17f4750045f3e9e )
            {
                function_98ae1f41148cc661( self, undefined, "red_alert" );
            }
        }
        
        waitframe();
    }
}

// Namespace battlechatter_ai
// Params 0
// Checksum 0x88276c7d, Offset: 0xd5c
// Size: 0x2
function aivehiclekillwaiter()
{
    
}

// Namespace battlechatter_ai
// Params 6
// Checksum 0xd1dac657, Offset: 0xd66
// Size: 0x48
function custom_battlechatter_internal( phrase, sequence, priority, timeout, cooldown, endons )
{
    battlechatter::function_b63bed8df8e4202a( phrase, phrase, priority, timeout, cooldown, endons );
}

