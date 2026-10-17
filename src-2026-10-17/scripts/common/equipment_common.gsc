#namespace equipment;

// Namespace equipment
// Params 1
// Checksum 0x75e5c9ee, Offset: 0x76
// Size: 0xca
function function_3637cad9a44ab42( equipname )
{
    globals = level.equipment;
    
    if ( level.var_47dc93bc4166ba18 )
    {
        var_ee34c6cdb3cf5497 = self.pers[ #"hash_ddf4800634d16ffd" ];
        
        if ( isdefined( var_ee34c6cdb3cf5497 ) )
        {
            var_c6e6e5892ffb8f71 = var_ee34c6cdb3cf5497[ equipname ];
            
            if ( var_c6e6e5892ffb8f71 )
            {
                bundle = globals.protable[ var_c6e6e5892ffb8f71 ].bundle;
            }
        }
    }
    
    if ( !isdefined( bundle ) )
    {
        bundle = globals.table[ equipname ].bundle;
    }
    
    /#
        if ( !isdefined( bundle ) && isdefined( equipname ) )
        {
            iprintln( "<dev string:x24>" + equipname + "<dev string:x40>" );
        }
    #/
    
    return bundle;
}

// Namespace equipment
// Params 1
// Checksum 0x9a196b5a, Offset: 0x149
// Size: 0x2f, Type: bool
function function_c080e0b0ab2d9784( bundle )
{
    if ( !getdvarint( @"scr_altdetonationenabled", 0 ) && !function_c78dec2190b10b97( bundle ) )
    {
        return false;
    }
    
    return true;
}

// Namespace equipment
// Params 1
// Checksum 0x10178da4, Offset: 0x181
// Size: 0x46, Type: bool
function function_c78dec2190b10b97( bundle )
{
    if ( !bundle.var_73c1e67728a7b727 )
    {
        return false;
    }
    
    if ( function_4042d2fbe6237835( #"hash_5f94731cce68431c" ) )
    {
        return false;
    }
    
    if ( !getdvarint( @"hash_8bde38d1046f0599", 1 ) )
    {
        return false;
    }
    
    return true;
}

