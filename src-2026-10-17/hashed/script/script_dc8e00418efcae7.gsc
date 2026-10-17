#using scripts\common\trace;

#namespace damage_range_indicator;

// Namespace damage_range_indicator
// Params 0
// Checksum 0x16a57519, Offset: 0x8c
// Size: 0x1a2
function function_f0076932d98e2191()
{
    self endon( #"death" );
    self endon( #"hash_b5fcbc77ee7be0ee" );
    currentpart = #"off";
    
    while ( true )
    {
        currentweapon = self getcurrentweapon();
        
        if ( !isdefined( currentweapon ) )
        {
            wait 0.1;
            continue;
        }
        
        weaponranges = function_cc6d8e547793427a( currentweapon );
        start = self geteye();
        tracerange = 99999;
        trace = trace::ray_trace( start, start + anglestoforward( self getgunangles() ) * tracerange );
        
        if ( isdefined( trace[ "entity" ] ) )
        {
            end = trace[ "position" ];
            scriptablepart = #"mindamagerange";
            distance = length( start - end );
            
            if ( distance <= weaponranges[ 0 ] )
            {
                scriptablepart = #"maxdamagerange";
            }
            else if ( distance <= weaponranges[ 1 ] )
            {
                scriptablepart = #"mid1damagerange";
            }
            else if ( distance <= weaponranges[ 2 ] )
            {
                scriptablepart = #"mid2damagerange";
            }
            else if ( distance <= weaponranges[ 3 ] )
            {
                scriptablepart = #"mid3damagerange";
            }
            
            if ( self isscriptable() && currentpart != scriptablepart )
            {
                self setscriptablepartstate( #"reactive_damage_range", scriptablepart );
                currentpart = scriptablepart;
            }
        }
        else if ( currentpart != #"off" )
        {
            self setscriptablepartstate( #"reactive_damage_range", #"off" );
            currentpart = #"off";
        }
        
        wait 0.1;
    }
}

