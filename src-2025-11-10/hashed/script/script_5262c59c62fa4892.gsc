#using scripts\asm\asm;

#namespace cap_ai_revival;

// Namespace cap_ai_revival
// Params 3
// Checksum 0xe361b030, Offset: 0x19b
// Size: 0x5e, Type: bool
function needtoturninplace( asmname, statename, params )
{
    angletodyingguy = absangleclamp180( self.revivetargetangles[ 1 ] - self.angles[ 1 ] );
    turnthresh = 45;
    
    if ( angletodyingguy > turnthresh )
    {
        return true;
    }
    
    return false;
}

// Namespace cap_ai_revival
// Params 3
// Checksum 0x5bfc349, Offset: 0x202
// Size: 0x6e
function capchooseturnanim( asmname, statename, params )
{
    angletodyingguy = angleclamp180( self.revivetargetangles[ 1 ] - self.angles[ 1 ] );
    animindex = asm::yawdiffto2468( angletodyingguy );
    turnanim = asm::asm_lookupanimfromalias( statename, animindex );
    return turnanim;
}

// Namespace cap_ai_revival
// Params 3
// Checksum 0x671b7dd, Offset: 0x279
// Size: 0x8b
function function_509d9a38242217b5( asmname, statename, params )
{
    dyingguy = getdyingguy();
    self.var_13951377932b459f = 6;
    self.damagedirsuffix = "_back";
    
    if ( isdefined( dyingguy ) )
    {
        self.var_13951377932b459f = function_a7df89d3e427d246( dyingguy, self );
        self.damagedirsuffix = dyingguy getdamagedirectionsuffix();
    }
    
    self notify( "reviving_intro_starts" );
    return asm::asm_lookupanimfromalias( statename, self.var_13951377932b459f );
}

// Namespace cap_ai_revival
// Params 3
// Checksum 0xa5c36a9b, Offset: 0x30d
// Size: 0x39
function function_440b92f86231cd2f( asmname, statename, params )
{
    return asm::asm_lookupanimfromalias( statename, self.var_13951377932b459f + self.damagedirsuffix );
}

// Namespace cap_ai_revival
// Params 3
// Checksum 0x472d5eba, Offset: 0x34f
// Size: 0x39
function function_6f436a1fac816907( asmname, statename, params )
{
    return asm::asm_lookupanimfromalias( statename, self.var_13951377932b459f + self.damagedirsuffix );
}

// Namespace cap_ai_revival
// Params 3
// Checksum 0xd7ed1468, Offset: 0x391
// Size: 0x7d
function function_5311b1152330585a( asmname, statename, params )
{
    helper = function_b213471c2682646b();
    self.var_13951377932b459f = 6;
    
    if ( isdefined( helper ) )
    {
        self.var_13951377932b459f = function_a7df89d3e427d246( self, helper );
    }
    
    self.damagedirsuffix = getdamagedirectionsuffix();
    return asm::asm_lookupanimfromalias( statename, self.var_13951377932b459f + self.damagedirsuffix );
}

// Namespace cap_ai_revival
// Params 3
// Checksum 0x7705f937, Offset: 0x417
// Size: 0x39
function function_73a09405b4c2d93e( asmname, statename, params )
{
    return asm::asm_lookupanimfromalias( statename, self.var_13951377932b459f + self.damagedirsuffix );
}

// Namespace cap_ai_revival
// Params 3
// Checksum 0x4ab83d9e, Offset: 0x459
// Size: 0x39
function function_7cfa5771ae890efe( asmname, statename, params )
{
    return asm::asm_lookupanimfromalias( statename, self.var_13951377932b459f + self.damagedirsuffix );
}

// Namespace cap_ai_revival
// Params 2
// Checksum 0xa814bff8, Offset: 0x49b
// Size: 0x5b
function stimnotehandler( note, params )
{
    scriptablepart = "revival_helper_stim";
    
    if ( self isscriptable() && self getscriptablehaspart( scriptablepart ) )
    {
        statename = self asmgetcurrentstate( self.asmname );
        notehandler_stim( note, statename );
    }
}

// Namespace cap_ai_revival
// Params 3
// Checksum 0x766c8ab0, Offset: 0x4fe
// Size: 0xcd
function function_64f1f71682790b2d( asmname, statename, params )
{
    self.var_13951377932b459f = 8;
    
    if ( isdefined( self.revivetarget ) )
    {
        totarget = self.revivetarget.origin - self.origin;
        angletodyingguy = angleclamp180( vectortoyaw( totarget ) - self.angles[ 1 ] );
        self.var_13951377932b459f = asm::yawdiffto2468( angletodyingguy );
    }
    
    stance = "";
    
    if ( self.currentpose == "crouch" )
    {
        stance = "_crouch";
    }
    
    return asm::asm_lookupanimfromalias( statename, self.var_13951377932b459f + stance );
}

// Namespace cap_ai_revival
// Params 3
// Checksum 0xfabd47a3, Offset: 0x5d4
// Size: 0x53
function function_f3e13d02d401c4f9( asmname, statename, params )
{
    self.var_13951377932b459f = 6;
    self.damagedirsuffix = getdamagedirectionsuffix();
    return asm::asm_lookupanimfromalias( statename, self.var_13951377932b459f + self.damagedirsuffix );
}

// Namespace cap_ai_revival
// Params 2
// Checksum 0xd58c78cd, Offset: 0x630
// Size: 0x5d
function remoterevivenotehandler( note, params )
{
    switch ( note )
    {
        case #"hash_2c1d80fc22d55f17":
            self shoot( 100, self.revivetarget );
            self.var_3724cf9bb3ac6bf7 = gettime();
            self.revivetarget notify( "shot_by_revive_pistol" );
            return;
    }
}

// Namespace cap_ai_revival
// Params 2
// Checksum 0x58aec77f, Offset: 0x695
// Size: 0x43
function function_a7df89d3e427d246( from, to )
{
    angle = getangle( from, to );
    index = 6;
    
    if ( angle >= 0 )
    {
        index = 4;
    }
    
    return index;
}

// Namespace cap_ai_revival
// Params 0
// Checksum 0x966b5d7a, Offset: 0x6e1
// Size: 0x95
function getdamagedirectionsuffix()
{
    forcedsuffix = function_d1e3731d257b871d();
    
    if ( isdefined( forcedsuffix ) )
    {
        return forcedsuffix;
    }
    
    if ( self.longdeathanims_shootenabled )
    {
        return "";
    }
    
    if ( !isdefined( self.damageyaw ) )
    {
        return "_back";
    }
    
    yawabs = abs( self.damageyaw );
    
    if ( yawabs > 135 )
    {
        return "_belly";
    }
    else if ( yawabs < 45 )
    {
        return "_back";
    }
    else if ( self.damageyaw < 0 )
    {
        return "_r";
    }
    
    return "_l";
}

// Namespace cap_ai_revival
// Params 2, eflags: 0x4
// Checksum 0xf6f887e3, Offset: 0x77f
// Size: 0x8d
function private notehandler_stim( note, statename )
{
    self endon( "death" );
    self endon( statename + "_finished" );
    scriptablepart = "revival_helper_stim";
    
    if ( isstartstr( note, "stim_attach" ) )
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
    
    if ( isstartstr( note, "stim_detach" ) )
    {
        self setscriptablepartstate( scriptablepart, "default" );
    }
}

// Namespace cap_ai_revival
// Params 1, eflags: 0x4
// Checksum 0xd28f9bb7, Offset: 0x814
// Size: 0x3c
function private isrighthand( note )
{
    res = 1;
    hand = getsubstr( note, 12 );
    
    if ( hand == "left" )
    {
        res = 0;
    }
    
    return res;
}

// Namespace cap_ai_revival
// Params 0, eflags: 0x4
// Checksum 0xeae87382, Offset: 0x859
// Size: 0x2b
function private function_b213471c2682646b()
{
    id = self getinteractionid();
    users = getbsequserswithtag( id, "reviving_guy" );
    return users[ 0 ];
}

// Namespace cap_ai_revival
// Params 0, eflags: 0x4
// Checksum 0xc9b272c4, Offset: 0x88d
// Size: 0x2b
function private getdyingguy()
{
    id = self getinteractionid();
    users = getbsequserswithtag( id, "dying_guy" );
    return users[ 0 ];
}

// Namespace cap_ai_revival
// Params 2, eflags: 0x4
// Checksum 0x9a1419b4, Offset: 0x8c1
// Size: 0x76
function private getangle( guy, otherguy )
{
    if ( isdefined( guy ) && isdefined( otherguy ) )
    {
        pos = guy.origin;
        otherpos = otherguy.origin;
        var_e96569cd1898b64a = vectortoyaw( otherpos - pos );
        return angleclamp180( var_e96569cd1898b64a - guy.angles[ 1 ] );
    }
    
    return 0;
}

// Namespace cap_ai_revival
// Params 0, eflags: 0x4
// Checksum 0x67e3b49b, Offset: 0x940
// Size: 0xd2
function private function_d1e3731d257b871d()
{
    if ( !isdefined( self.forcelongdeath ) )
    {
        return undefined;
    }
    
    switch ( self.forcelongdeath )
    {
        case 37:
        case 38:
        case 47:
        case 48:
            return "";
        case 39:
        case 40:
            return "_back";
        case 41:
        case 42:
            return "_belly";
        case 43:
        case 45:
            return "_l";
        case 44:
        case 46:
            return "_r";
    }
    
    return undefined;
}

