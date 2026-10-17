#using scripts\common\callbacks;

#namespace gearhead;

// Namespace gearhead
// Params 0, eflags: 0x1
// Checksum 0x8dbd56d6, Offset: 0xe7
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &register_gearhead_perk );
}

// Namespace gearhead
// Params 1
// Checksum 0x3ef6c9ae, Offset: 0x107
// Size: 0xb7
function register_gearhead_perk( params )
{
    bundle = level.perkbundles[ "specialty_gearhead" ];
    
    if ( !isdefined( bundle ) )
    {
        return;
    }
    
    subperks = [];
    
    if ( !bundle.var_75c23be56964e043 )
    {
        subperks[ subperks.size ] = "specialty_hack";
    }
    
    if ( !bundle.var_fc68b2c2c344da0d )
    {
        subperks[ subperks.size ] = "specialty_overcharge_field_upgrade";
    }
    
    if ( !bundle.var_382b98f8acdb9e69 )
    {
        subperks[ subperks.size ] = "specialty_carepackage_boobytrap";
    }
    
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_gearhead", &set_gearhead, &unset_gearhead, subperks );
    }
}

// Namespace gearhead
// Params 0
// Checksum 0xed16c07e, Offset: 0x1c6
// Size: 0xca
function set_gearhead()
{
    if ( !isdefined( level.perkbundles ) )
    {
        return;
    }
    
    gearheadbundle = level.perkbundles[ "specialty_gearhead" ];
    
    if ( !isstruct( gearheadbundle ) )
    {
        return;
    }
    
    perk_faster_field_upgrade_rate = gearheadbundle.perk_faster_field_upgrade_rate;
    
    if ( isnumber( perk_faster_field_upgrade_rate ) )
    {
        if ( !isdefined( self.perktunables ) )
        {
            self.perktunables = spawnstruct();
        }
        
        self.perktunables.perk_faster_field_upgrade_rate = perk_faster_field_upgrade_rate;
    }
    
    if ( hasomnvar( o"ui_show_super_charge_count" ) )
    {
        self setclientomnvar( o"ui_show_super_charge_count", 1 );
    }
    
    callback::callback( #"perk_set_gearhead", { #disablehacking:gearheadbundle.var_75c23be56964e043 } );
}

// Namespace gearhead
// Params 0
// Checksum 0x466a46ee, Offset: 0x298
// Size: 0x5b
function unset_gearhead()
{
    if ( !isdefined( self.perktunables ) )
    {
        return;
    }
    
    if ( isdefined( self.perktunables.perk_faster_field_upgrade_rate ) )
    {
        self.perktunables.perk_faster_field_upgrade_rate = undefined;
    }
    
    if ( hasomnvar( o"ui_show_super_charge_count" ) )
    {
        self setclientomnvar( o"ui_show_super_charge_count", 0 );
    }
}

