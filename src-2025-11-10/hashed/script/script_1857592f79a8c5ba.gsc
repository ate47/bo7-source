#using scripts\asm\asm_bb;
#using scripts\asm\cap;
#using scripts\engine\utility;

#namespace cap_use_armor_plate_solo;

// Namespace cap_use_armor_plate_solo
// Params 3
// Checksum 0xee3b5804, Offset: 0x17c
// Size: 0x10f
function function_dc4deb370b43479a( asmname, statename, params )
{
    stance = asm_bb::bb_getrequestedstance();
    coverstate = asm_bb::bb_getrequestedcoverstate();
    animname = "default";
    
    if ( coverstate == "exposed" )
    {
        animname = "exposed_" + stance;
    }
    else
    {
        covernode = asm_bb::bb_getcovernode();
        
        if ( isdefined( covernode ) )
        {
            covertype = covernode.type;
            
            switch ( covertype )
            {
                case #"hash_cd3ffe799551db82":
                    animname = "cover_right_" + stance;
                    break;
                case #"hash_e1d8e1adebed5a61":
                    animname = "cover_left_" + stance;
                    break;
                case #"hash_c3b74422dec48736":
                    animname = "cover_crouch";
                    break;
                case #"hash_78b110033ccb68b0":
                    animname = "cover_stand";
                    break;
            }
        }
    }
    
    armoranim = asm_cap::cap_lookupanimfromalias( statename, animname );
    return armoranim;
}

// Namespace cap_use_armor_plate_solo
// Params 3
// Checksum 0xf5202914, Offset: 0x294
// Size: 0x55
function function_936e13c95e00bf94( asmname, statename, params )
{
    /#
        utility::issharedfuncdefined( #"ai", #"onusedarmorplate", 1 );
    #/
    
    utility::callsharedfunc( #"ai", #"onusedarmorplate" );
}

// Namespace cap_use_armor_plate_solo
// Params 1, eflags: 0x4
// Checksum 0xaecc2554, Offset: 0x2f1
// Size: 0x3c
function private isrighthand( note )
{
    res = 1;
    hand = getsubstr( note, 7 );
    
    if ( hand == "left" )
    {
        res = 0;
    }
    
    return res;
}

// Namespace cap_use_armor_plate_solo
// Params 2, eflags: 0x4
// Checksum 0x67f0a7c2, Offset: 0x336
// Size: 0x8d
function private notehandler_armorplate( note, statename )
{
    self endon( "death" );
    self endon( statename + "_finished" );
    scriptablepart = "armor_plate";
    
    if ( isstartstr( note, "attach" ) )
    {
        if ( isrighthand( note ) )
        {
            self setscriptablepartstate( scriptablepart, "active_right" );
        }
        else
        {
            self setscriptablepartstate( scriptablepart, "active_left" );
        }
        
        return;
    }
    
    if ( isstartstr( note, "detach" ) )
    {
        self setscriptablepartstate( scriptablepart, "default" );
    }
}

// Namespace cap_use_armor_plate_solo
// Params 2
// Checksum 0x8f5ec30e, Offset: 0x3cb
// Size: 0x5b
function armorplatenotehandler( note, params )
{
    scriptablepart = "armor_plate";
    
    if ( self isscriptable() && self getscriptablehaspart( scriptablepart ) )
    {
        statename = self asmgetcurrentstate( self.asmname );
        notehandler_armorplate( note, statename );
    }
}

