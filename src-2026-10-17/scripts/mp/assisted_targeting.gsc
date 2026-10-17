#using scripts\common\utility;

#namespace assisted_targeting_internal;

// Namespace assisted_targeting_internal
// Params 0, eflags: 0x1
// Checksum 0xa7fe3eff, Offset: 0x76
// Size: 0x3e
function autoexec main()
{
    utility::registersharedfunc( #"assisted_targeting", #"applydisabled", &applydisabled );
    utility::registersharedfunc( #"assisted_targeting", #"removedisabled", &removedisabled );
}

// Namespace assisted_targeting_internal
// Params 0, eflags: 0x4
// Checksum 0x361cfa55, Offset: 0xbc
// Size: 0x2f
function private applydisabled()
{
    if ( !self )
    {
        return;
    }
    
    if ( !isdefined( self.var_418616ac3196a5a ) )
    {
        self.var_418616ac3196a5a = 0;
    }
    
    self.var_418616ac3196a5a++;
    self function_ee1c16d57db89f98( 0 );
}

// Namespace assisted_targeting_internal
// Params 0, eflags: 0x4
// Checksum 0xcb0f9b36, Offset: 0xf3
// Size: 0x34
function private removedisabled()
{
    if ( !self )
    {
        return;
    }
    
    if ( self.var_418616ac3196a5a > 1 )
    {
        self.var_418616ac3196a5a--;
        return;
    }
    
    self.var_418616ac3196a5a = undefined;
    self function_ee1c16d57db89f98( 1 );
}

