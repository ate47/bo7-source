#using script_2b51dca51198db31;
#using scripts\mp\agents\common_agent_damage;

#namespace agent_juggernaut;

// Namespace agent_juggernaut
// Params 0
// Checksum 0x4c2b0680, Offset: 0x22d
// Size: 0x32
function function_6d9c127281e3a16b()
{
    level.var_9790db6f259ff42c = getdvarint( @"hash_86c85cfc843c0b68", 1 );
    level.var_2a6012bfba95f75b = getdvarint( @"hash_a433661e4f79e427", 100 );
}

// Namespace agent_juggernaut
// Params 0
// Checksum 0x73a8b741, Offset: 0x267
// Size: 0x176
function function_c997dc026d42c7df()
{
    juggcontext = spawnstruct();
    juggcontext.partshealth = [];
    juggcontext.partshealth[ "head_health" ] = 100;
    juggcontext.partshealth[ "damaged_helmet_health" ] = 100;
    juggcontext.partshealth[ "torso_upper_health" ] = 100;
    juggcontext.partshealth[ "torso_lower_health" ] = 100;
    juggcontext.partshealth[ "right_upper_arm_health" ] = 100;
    juggcontext.partshealth[ "right_lower_arm_health" ] = 100;
    juggcontext.partshealth[ "left_upper_arm_health" ] = 100;
    juggcontext.partshealth[ "left_lower_arm_health" ] = 100;
    juggcontext.partshealth[ "right_leg_health" ] = 100;
    juggcontext.partshealth[ "left_leg_health" ] = 100;
    juggcontext.var_5bd2193fb4972677 = &function_2d5ead52036d6b38;
    juggcontext.lastpaintime = 0;
    juggcontext.paindamage = 0;
    juggcontext.var_17d6bfdbfca7e7bd = 1000;
    juggcontext.paincooldown = 5000;
    juggcontext.paindecay = 10;
    juggcontext.paindecaytime = 0.1;
    juggcontext.lastdamagedtime = 0;
    juggcontext.var_84756ab51a4bf8f = 1000;
    self.juggcontext = juggcontext;
}

// Namespace agent_juggernaut
// Params 2
// Checksum 0x3a15576b, Offset: 0x3e5
// Size: 0xd7
function function_2d5ead52036d6b38( part, damage )
{
    if ( part == "head_health" && !isdefined( self.juggcontext.partshealth[ part ] ) )
    {
        if ( isdefined( self.juggcontext.partshealth[ "damaged_helmet_health" ] ) )
        {
            self.juggcontext.partshealth[ "damaged_helmet_health" ] = self.juggcontext.partshealth[ "damaged_helmet_health" ] - damage;
            
            if ( self.juggcontext.partshealth[ "damaged_helmet_health" ] <= 0 )
            {
                self.juggcontext.partshealth[ "damaged_helmet_health" ] = undefined;
                function_17baa7ab5b8fc432( "head_health", "destroyed" );
            }
        }
    }
}

// Namespace agent_juggernaut
// Params 2
// Checksum 0xfd67a2c0, Offset: 0x4c4
// Size: 0xf3
function function_17baa7ab5b8fc432( parts, state )
{
    if ( self.var_d27be7cccf1f7c74 )
    {
        return;
    }
    
    if ( !isdefined( state ) )
    {
        assertmsg( "<dev string:x24>" );
        return;
    }
    
    partstoset = [];
    
    if ( isarray( parts ) )
    {
        partstoset = arraycombine( partstoset, parts );
    }
    else
    {
        partstoset[ partstoset.size ] = parts;
    }
    
    foreach ( part in partstoset )
    {
        self setscriptablepartstate( part, state, 0 );
        
        /#
            iprintln( "<dev string:x49>" + part + "<dev string:x52>" + state + "<dev string:x5e>" );
        #/
    }
}

// Namespace agent_juggernaut
// Params 1
// Checksum 0x42c5230d, Offset: 0x5bf
// Size: 0x14f
function function_f8400804ad5435ab( subtype )
{
    weapon = undefined;
    function_c997dc026d42c7df();
    thread function_ed78eb9bbd875ae();
    
    if ( !isdefined( level.var_c136dbcee5b9ac85 ) )
    {
        level.var_c136dbcee5b9ac85 = [ "pristine", "damaged" ];
    }
    
    if ( !isdefined( level.var_f3f8f12f590587b7 ) )
    {
        level.var_f3f8f12f590587b7 = [ "helmet", "neckguard", "backpack", "shoulderpad_l", "shoulderpad_r", "forearmpad_l", "forearmpad_r", "qamis", "thighpad_l", "thighpad_r" ];
    }
    
    if ( subtype == "merc" )
    {
        partslist = [ "neckguard", "backpack", "shoulderpad_l", "shoulderpad_r", "forearmpad_l", "forearmpad_r", "qamis", "thighpad_l", "thighpad_r" ];
    }
    else
    {
        partslist = level.var_f3f8f12f590587b7;
    }
    
    function_17baa7ab5b8fc432( partslist, "pristine" );
    self setperk( "specialty_melee_invulnerable", 1 );
}

// Namespace agent_juggernaut
// Params 14
// Checksum 0xf55bcf45, Offset: 0x716
// Size: 0x2af
function function_627f8022f4c1c67b( einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, objweapon, poisedamage )
{
    if ( isdefined( level.var_2a6012bfba95f75b ) )
    {
        if ( level.var_9790db6f259ff42c == 1 )
        {
            overflow = idamage - level.var_2a6012bfba95f75b;
            
            if ( overflow > 0 )
            {
                idamage = int( level.var_2a6012bfba95f75b + sqrt( overflow ) );
            }
        }
        else
        {
            idamage = int( min( idamage, level.var_2a6012bfba95f75b ) );
        }
    }
    
    dam_store = idamage;
    
    if ( isdefined( self.agent_damage_callback ) )
    {
        idamage = self [[ self.agent_damage_callback ]]( einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, objweapon, poisedamage );
    }
    
    if ( !idamage )
    {
        idamage = dam_store;
    }
    
    remaininghealth = self.health - idamage;
    
    if ( remaininghealth <= 0 )
    {
        if ( isdefined( self.var_4dc6e2279b8c85a4 ) )
        {
            self notify( self.var_4dc6e2279b8c85a4 );
        }
    }
    
    if ( isdefined( self.juggcontext ) && !self.juggcontext.ignorepain )
    {
        self.juggcontext.lastdamagedtime = gettime();
        
        if ( self.juggcontext.lastpaintime < gettime() )
        {
            if ( self.allowpain == 0 )
            {
                self.allowpain = 1;
            }
            
            self.juggcontext.paindamage += idamage;
        }
        
        if ( self.juggcontext.paindamage > self.juggcontext.var_17d6bfdbfca7e7bd )
        {
            self.juggcontext.lastpaintime = gettime() + self.juggcontext.paincooldown;
            self.juggcontext.paindamage = 0;
            self asmevalpaintransition( self.asmname );
            self.allowpain = 0;
        }
        
        function_ba72653d8e686a8d( idamage, shitloc, smeansofdeath, eattacker );
    }
    
    namespace_3d78262d89dbe647::common_callbacksoldieragentdamaged( einflictor, eattacker, int( idamage ), idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, timeoffset, modelindex, partname, objweapon, poisedamage );
}

// Namespace agent_juggernaut
// Params 0
// Checksum 0xcc63aba8, Offset: 0x9cd
// Size: 0x99
function function_ed78eb9bbd875ae()
{
    self endon( #"death" );
    
    while ( true )
    {
        if ( gettime() - self.juggcontext.lastdamagedtime > self.juggcontext.var_84756ab51a4bf8f )
        {
            self.juggcontext.paindamage = max( self.juggcontext.paindamage - self.juggcontext.paindecay, 0 );
        }
        
        wait self.juggcontext.paindecaytime;
    }
}

// Namespace agent_juggernaut
// Params 4
// Checksum 0xf110498a, Offset: 0xa6e
// Size: 0x71
function function_ba72653d8e686a8d( damage, shitloc, smeansofdeath, attacker )
{
    parttodamage = function_8c0aff960ae4974b( shitloc, smeansofdeath, attacker );
    
    if ( !isdefined( parttodamage ) )
    {
        /#
            if ( isdefined( shitloc ) && isplayer( attacker ) )
            {
                attacker iprintln( "<dev string:x60>" + shitloc );
            }
        #/
        
        return;
    }
    
    function_846ded033d4c17a1( parttodamage, damage );
}

// Namespace agent_juggernaut
// Params 3
// Checksum 0x402cb991, Offset: 0xae7
// Size: 0x120
function function_8c0aff960ae4974b( shitloc, smeansofdeath, attacker )
{
    parttodamage = undefined;
    
    if ( damage_utility::isheadshot( shitloc, smeansofdeath, attacker ) )
    {
        parttodamage = "head_health";
    }
    else if ( damage_utility::istorsouppershot( shitloc, smeansofdeath, attacker ) )
    {
        parttodamage = "torso_upper_health";
    }
    else if ( damage_utility::function_fa01c95c6c80017a( shitloc, smeansofdeath, attacker ) )
    {
        parttodamage = "torso_lower_health";
    }
    else if ( damage_utility::function_b44f28c3d528a4a( shitloc, smeansofdeath, attacker ) )
    {
        parttodamage = "right_upper_arm_health";
    }
    else if ( damage_utility::function_462b5d72062e80c1( shitloc, smeansofdeath, attacker ) )
    {
        parttodamage = "right_lower_arm_health";
    }
    else if ( damage_utility::function_389f8e73c452ef7d( shitloc, smeansofdeath, attacker ) )
    {
        parttodamage = "left_upper_arm_health";
    }
    else if ( damage_utility::function_b00a5e646e1b246a( shitloc, smeansofdeath, attacker ) )
    {
        parttodamage = "left_lower_arm_health";
    }
    else if ( damage_utility::isrightlegshot( shitloc, smeansofdeath, attacker ) )
    {
        parttodamage = "right_leg_health";
    }
    else if ( damage_utility::isleftlegshot( shitloc, smeansofdeath, attacker ) )
    {
        parttodamage = "left_leg_health";
    }
    
    /#
        if ( 0 && isdefined( shitloc ) && isplayer( attacker ) )
        {
            attacker iprintlnbold( "<dev string:xa6>" + shitloc );
        }
    #/
    
    return parttodamage;
}

// Namespace agent_juggernaut
// Params 2
// Checksum 0x29b0e3bf, Offset: 0xc10
// Size: 0x215
function function_846ded033d4c17a1( part, damage )
{
    if ( isdefined( self.juggcontext.var_5bd2193fb4972677 ) )
    {
        self [[ self.juggcontext.var_5bd2193fb4972677 ]]( part, damage );
    }
    
    if ( isdefined( self.juggcontext.partshealth[ part ] ) )
    {
        if ( part == "head_health" )
        {
            if ( isdefined( self.helmethealth ) && self.maxhelmethealth > 0 )
            {
                self.juggcontext.partshealth[ part ] = self.helmethealth / self.maxhelmethealth * 10;
            }
            else
            {
                self.juggcontext.partshealth[ part ] -= damage;
            }
            
            if ( self.juggcontext.partshealth[ part ] <= 0 )
            {
                self.juggcontext.partshealth[ part ] = undefined;
                
                if ( issubstr( self.agent_type, "merc" ) )
                {
                    namespace_3d78262d89dbe647::function_3384dd53b83c8bf( self );
                }
                else
                {
                    function_17baa7ab5b8fc432( part, "destroyed" );
                }
            }
            else if ( self.juggcontext.partshealth[ part ] <= 50 )
            {
                if ( issubstr( self.agent_type, "merc" ) )
                {
                }
                else
                {
                    function_17baa7ab5b8fc432( part, "damaged" );
                }
            }
            
            return;
        }
        
        self.juggcontext.partshealth[ part ] -= damage;
        
        if ( self.juggcontext.partshealth[ part ] <= 0 )
        {
            self.juggcontext.partshealth[ part ] = undefined;
            
            if ( issubstr( self.agent_type, "merc" ) )
            {
                return;
            }
            
            function_17baa7ab5b8fc432( part, "damaged" );
        }
    }
}

