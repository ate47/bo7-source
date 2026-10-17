#using scripts\common\callbacks;

#namespace specialist_wz;

// Namespace specialist_wz
// Params 0, eflags: 0x1
// Checksum 0xb782e3f8, Offset: 0x9b
// Size: 0x2d
function autoexec preinit()
{
    if ( isbrgamemode() )
    {
        level callback::add( #"register_perk", &function_655cba009501c5fb );
        level.var_d846c03ec30479ec = "specialty_specialist";
    }
}

// Namespace specialist_wz
// Params 1
// Checksum 0xeb42947b, Offset: 0xd0
// Size: 0x76
function function_655cba009501c5fb( params )
{
    bundle = level.perkbundles[ "specialty_specialist" ];
    
    if ( !isdefined( bundle ) )
    {
        return;
    }
    
    level.specialistperks = getspecialistperks( bundle );
    
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_specialist", &setspecialist, &unsetspecialist, level.specialistperks );
    }
}

// Namespace specialist_wz
// Params 1
// Checksum 0x75bff17a, Offset: 0x14e
// Size: 0x26a
function getspecialistperks( bundle )
{
    if ( bundle.var_d0bdcf2e6c13b0f7 )
    {
        return function_199c0fa5bc87a981( bundle );
    }
    
    assert( bundle.specialistperks.size > 0, "<dev string:x24>" + "<dev string:x38>" );
    specialistperks = [];
    str_list = level.gametypebundle.perk_list ?? level.gamemodebundle.perk_list;
    assert( isdefined( str_list ), "<dev string:x24>" + "<dev string:x71>" );
    var_c741d5499c5302ce = getscriptbundle( "perklist:" + str_list );
    assert( isdefined( var_c741d5499c5302ce ) && isdefined( var_c741d5499c5302ce.perk_list ) && var_c741d5499c5302ce.perk_list.size > 0, "<dev string:x24>" + "<dev string:xbc>" + str_list + "<dev string:xd0>" );
    var_268bcb01a72d8698 = [];
    var_268bcb01a72d8698 = [];
    
    foreach ( var_e21f9eb0a8bbe316 in var_c741d5499c5302ce.perk_list )
    {
        if ( !var_e21f9eb0a8bbe316.bundle )
        {
            continue;
        }
        
        var_268bcb01a72d8698[ var_e21f9eb0a8bbe316.bundle ] = var_e21f9eb0a8bbe316.ref;
    }
    
    foreach ( perkbundlestruct in bundle.specialistperks )
    {
        var_e79dfc710db51b3 = perkbundlestruct.bundle;
        
        if ( !var_e79dfc710db51b3 )
        {
            continue;
        }
        
        perkref = var_268bcb01a72d8698[ var_e79dfc710db51b3 ];
        
        if ( isdefined( perkref ) )
        {
            specialistperks[ specialistperks.size ] = perkref;
            continue;
        }
        
        assertmsg( "<dev string:x24>" + "<dev string:x10b>" + getxhashsourcename( var_e79dfc710db51b3 ) + "<dev string:x13f>" );
    }
    
    return specialistperks;
}

// Namespace specialist_wz
// Params 1
// Checksum 0x955bd554, Offset: 0x3c1
// Size: 0x100
function function_199c0fa5bc87a981( bundle )
{
    specialistlist = getscriptbundle( bundle.specialistlist );
    assert( specialistlist, "<dev string:x24>" + "<dev string:x141>" );
    assert( specialistlist.perk_list.size > 0, "<dev string:x24>" + "<dev string:x38>" );
    perkrefs = [];
    
    foreach ( entry in specialistlist.perk_list )
    {
        if ( !arraycontains( perkrefs, entry.ref ) )
        {
            perkrefs[ perkrefs.size ] = entry.ref;
        }
    }
    
    return perkrefs;
}

// Namespace specialist_wz
// Params 0
// Checksum 0x85ad3e58, Offset: 0x4ca
// Size: 0xd
function setspecialist()
{
    self.hasspecialist = 1;
}

// Namespace specialist_wz
// Params 0
// Checksum 0x2f97c589, Offset: 0x4df
// Size: 0xc
function unsetspecialist()
{
    self.hasspecialist = undefined;
}

