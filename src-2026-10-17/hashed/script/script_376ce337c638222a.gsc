#using scripts\common\callbacks;
#using scripts\mp\armor;

#namespace perk_regen_aura;

// Namespace perk_regen_aura
// Params 0, eflags: 0x1
// Checksum 0x5fedd9f3, Offset: 0xae
// Size: 0x18
function autoexec main()
{
    level callback::add( #"register_perk", &perk_register );
}

// Namespace perk_regen_aura
// Params 1
// Checksum 0x44adb0b6, Offset: 0xce
// Size: 0x5d
function perk_register( params )
{
    bundle = level.perkbundles[ "specialty_regen_aura" ];
    
    if ( !isdefined( bundle ) )
    {
        return;
    }
    
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_regen_aura", &perk_set, &perk_unset, [] );
    }
}

// Namespace perk_regen_aura
// Params 0
// Checksum 0xd756b725, Offset: 0x133
// Size: 0x1b
function perk_set()
{
    self.var_72be328d494d2003 = 1;
    aura_apply_effect();
    thread aura_watcher();
}

// Namespace perk_regen_aura
// Params 0
// Checksum 0xf329a955, Offset: 0x156
// Size: 0xa2
function perk_unset()
{
    self notify( #"hash_5f7b19367aaf143e" );
    self.var_72be328d494d2003 = undefined;
    function_2bd6419e62f788e6();
    
    foreach ( member in self.var_557465af0cb44903 )
    {
        member function_2bd6419e62f788e6();
    }
    
    self.var_557465af0cb44903 = undefined;
}

// Namespace perk_regen_aura
// Params 0
// Checksum 0x934384aa, Offset: 0x200
// Size: 0x266
function aura_watcher()
{
    self endon( #"hash_5f7b19367aaf143e" );
    self endon( #"death_or_disconnect" );
    self.var_557465af0cb44903 = [];
    
    for ( ;; )
    {
        players_in_range = getplayersinradius( self.origin, 150, 150, 0, [ self ], self.team );
        
        foreach ( number, member in self.var_557465af0cb44903 )
        {
            if ( !arraycontains( players_in_range, member ) )
            {
                member function_2bd6419e62f788e6();
                self.var_557465af0cb44903[ number ] = undefined;
            }
        }
        
        foreach ( player in players_in_range )
        {
            ent_num = player getentitynumber();
            
            if ( !self.var_557465af0cb44903[ ent_num ] )
            {
                self.var_557465af0cb44903[ ent_num ] = player;
                player aura_apply_effect();
            }
        }
        
        /#
            if ( getdvarint( @"hash_999454baf3c5b831", 0 ) )
            {
                sphere( self.origin, 150, ( 0, 1, 0 ), 1, 20 );
                
                foreach ( member in self.var_557465af0cb44903 )
                {
                    line( self.origin + ( 0, 0, 20 ), member.origin + ( 0, 0, 20 ), ( 0, 1, 0 ), 1, 1, 20 );
                }
            }
        #/
        
        wait 1;
    }
}

// Namespace perk_regen_aura
// Params 1
// Checksum 0x266f67ab, Offset: 0x46e
// Size: 0x57
function aura_apply_effect( use_fx = 1 )
{
    if ( !self.var_83e75bc8afc5267f )
    {
        self.var_83e75bc8afc5267f = 1;
        thread function_c8b2458e72165dc0();
        
        if ( use_fx )
        {
            self setscriptablepartstate( "perk_regen_aura", "on", 0 );
        }
        
        return;
    }
    
    self.var_83e75bc8afc5267f++;
}

// Namespace perk_regen_aura
// Params 0
// Checksum 0x79aea4c3, Offset: 0x4cd
// Size: 0x4d
function function_2bd6419e62f788e6()
{
    if ( self.var_83e75bc8afc5267f )
    {
        self.var_83e75bc8afc5267f--;
        
        if ( self.var_83e75bc8afc5267f <= 0 )
        {
            self.var_83e75bc8afc5267f = undefined;
            self notify( #"hash_7668238d27ba9b6d" );
            self setscriptablepartstate( "perk_regen_aura", "off", 0 );
        }
    }
}

// Namespace perk_regen_aura
// Params 0, eflags: 0x4
// Checksum 0xb3246bc7, Offset: 0x522
// Size: 0xcb
function private function_c8b2458e72165dc0()
{
    self endon( #"death_or_disconnect" );
    self endon( #"hash_7668238d27ba9b6d" );
    pulse_percent = getdvarfloat( @"hash_435de911bdb99a29", 0.1 );
    
    /#
        if ( getdvarint( @"hash_999454baf3c5b831", 0 ) )
        {
            thread function_716c2428ce55da55();
        }
    #/
    
    while ( self.var_83e75bc8afc5267f )
    {
        if ( !armor::has_full_armor() )
        {
            armor::repair_armor( self.maxarmorhealth * pulse_percent );
        }
        
        if ( self.health < self.maxhealth )
        {
            self.health = minint( self.health + int( self.maxhealth * pulse_percent ), self.maxhealth );
        }
        
        wait 0.5;
    }
}

/#

    // Namespace perk_regen_aura
    // Params 0
    // Checksum 0x55df84bd, Offset: 0x5f5
    // Size: 0xea, Type: dev
    function function_716c2428ce55da55()
    {
        self endon( #"death_or_disconnect" );
        self endon( #"hash_7668238d27ba9b6d" );
        
        for ( ;; )
        {
            print3d( self.origin + ( 0, 0, 70 ), "<dev string:x24>" + self.health, ( 1, 1, 1 ), 1, 0.25, 1, 1 );
            print3d( self.origin + ( 0, 0, 65 ), "<dev string:x2d>" + self.armorhealth, ( 1, 1, 1 ), 1, 0.25, 1, 1 );
            print3d( self.origin + ( 0, 0, 60 ), "<dev string:x35>" + self.var_83e75bc8afc5267f, ( 1, 1, 1 ), 1, 0.25, 1, 1 );
            waitframe();
        }
    }

#/
