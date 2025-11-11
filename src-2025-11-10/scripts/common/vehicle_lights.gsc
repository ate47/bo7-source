#using scripts\common\utility;
#using scripts\common\vehicle;
#using scripts\engine\utility;

#namespace vehicle_lights;

// Namespace vehicle_lights
// Params 2
// Checksum 0xa4b20ece, Offset: 0xfa
// Size: 0x3c
function lights_on( group, classname )
{
    groups = strtok( group, " " );
    utility::array_levelthread( groups, &lights_on_internal, classname );
}

// Namespace vehicle_lights
// Params 3
// Checksum 0xf65b794d, Offset: 0x13e
// Size: 0x1ca
function group_light( model, name, group )
{
    if ( !isdefined( level.vehicle.templates.vehicle_lights_group ) )
    {
        level.vehicle.templates.vehicle_lights_group = [];
    }
    
    if ( !isdefined( level.vehicle.templates.vehicle_lights_group[ model ] ) )
    {
        level.vehicle.templates.vehicle_lights_group[ model ] = [];
    }
    
    if ( !isdefined( level.vehicle.templates.vehicle_lights_group[ model ][ group ] ) )
    {
        level.vehicle.templates.vehicle_lights_group[ model ][ group ] = [];
    }
    
    foreach ( var_9503b421fb8ed25d in level.vehicle.templates.vehicle_lights_group[ model ][ group ] )
    {
        if ( name == var_9503b421fb8ed25d )
        {
            return;
        }
    }
    
    level.vehicle.templates.vehicle_lights_group[ model ][ group ][ level.vehicle.templates.vehicle_lights_group[ model ][ group ].size ] = name;
}

// Namespace vehicle_lights
// Params 0
// Checksum 0x282cd228, Offset: 0x310
// Size: 0x74
function lights_delayfxforframe()
{
    level notify( "new_lights_delayfxforframe" );
    level endon( "new_lights_delayfxforframe" );
    
    if ( !isdefined( level.fxdelay ) )
    {
        level.fxdelay = 0;
    }
    
    level.fxdelay += randomfloatrange( 0.2, 0.4 );
    
    if ( level.fxdelay > 2 )
    {
        level.fxdelay = 0;
    }
    
    wait 0.05;
    level.fxdelay = undefined;
}

// Namespace vehicle_lights
// Params 3
// Checksum 0xc2e0fbbe, Offset: 0x38c
// Size: 0x252
function lights_off_internal( group, model, classname )
{
    self notify( "lights_off" );
    
    if ( isdefined( classname ) )
    {
        model = classname;
    }
    else if ( !isdefined( model ) )
    {
        model = self.classname_mp ?? self.classname;
    }
    
    if ( !isdefined( group ) )
    {
        group = "all";
    }
    
    if ( !isdefined( self.lights ) )
    {
        return;
    }
    
    if ( !isdefined( level.vehicle.templates.vehicle_lights_group[ model ][ group ] ) )
    {
        /#
            println( "<dev string:x24>" + self.vehicletype );
            println( "<dev string:x35>" + self.classname );
            println( "<dev string:x44>" + group );
        #/
        
        assertmsg( "<dev string:x55>" );
        return;
    }
    
    lights = level.vehicle.templates.vehicle_lights_group[ model ][ group ];
    count = 0;
    maxlightstopsperframe = 2;
    
    if ( isdefined( self.maxlightstopsperframe ) )
    {
        maxlightstopsperframe = self.maxlightstopsperframe;
    }
    
    foreach ( light in lights )
    {
        template = level.vehicle.templates.vehicle_lights[ model ][ light ];
        
        if ( template.isscriptable )
        {
            utility::function_7c10ea82c1e305b8( template.part, "off" );
        }
        else if ( utility::hastag( self.model, template.tag ) )
        {
            stopfxontag( template.effect, self, template.tag );
            count++;
            
            if ( count >= maxlightstopsperframe )
            {
                count = 0;
                wait 0.05;
            }
        }
        
        if ( !isdefined( self ) )
        {
            return;
        }
        
        self.lights[ light ] = undefined;
    }
}

// Namespace vehicle_lights
// Params 2
// Checksum 0xecc947e8, Offset: 0x5e6
// Size: 0x30f
function lights_on_internal( group, model )
{
    level.lastlighttime = gettime();
    self endon( "lights_off" );
    self endon( "death" );
    
    if ( !isdefined( group ) )
    {
        group = "all";
    }
    
    if ( !isdefined( model ) )
    {
        model = self.classname_mp ?? self.classname;
    }
    
    if ( !isdefined( level.vehicle.templates.vehicle_lights_group ) )
    {
        return;
    }
    
    if ( !( isdefined( level.vehicle.templates.vehicle_lights_group[ model ] ) && isdefined( level.vehicle.templates.vehicle_lights_group[ model ][ group ] ) ) )
    {
        return;
    }
    
    thread lights_delayfxforframe();
    
    if ( !isdefined( self.lights ) )
    {
        self.lights = [];
    }
    
    lights = level.vehicle.templates.vehicle_lights_group[ model ][ group ];
    count = 0;
    var_6004cbf2423b4969 = [];
    
    foreach ( light in lights )
    {
        if ( isdefined( self.lights[ light ] ) )
        {
            continue;
        }
        
        template = level.vehicle.templates.vehicle_lights[ model ][ light ];
        
        if ( isdefined( template.delay ) )
        {
            delay = template.delay;
        }
        else
        {
            delay = 0;
        }
        
        delay += level.fxdelay;
        
        while ( isdefined( var_6004cbf2423b4969[ string( delay ) ] ) )
        {
            delay += 0.05;
        }
        
        var_6004cbf2423b4969[ string( delay ) ] = 1;
        
        if ( template.isscriptable )
        {
            if ( vehicle::function_dfa3d2eee203d2d3( template.part ) )
            {
                if ( group == "brakelights" )
                {
                    utility::delaythread( delay, &utility::function_7c10ea82c1e305b8, template.part, "brake" );
                }
                else if ( group == "daylights" )
                {
                    utility::delaythread( delay, &utility::function_7c10ea82c1e305b8, template.part, "day" );
                }
                else
                {
                    utility::delaythread( delay, &utility::function_7c10ea82c1e305b8, template.part, "on" );
                }
            }
        }
        else
        {
            childthread function_ef6384b76b1f62c6( delay, template.effect, self, template.tag );
        }
        
        self.lights[ light ] = 1;
        
        if ( !isdefined( self ) )
        {
            break;
        }
    }
    
    level.fxdelay = 0;
}

// Namespace vehicle_lights
// Params 4, eflags: 0x4
// Checksum 0xee85f02a, Offset: 0x8fd
// Size: 0x33
function private function_ef6384b76b1f62c6( timer, effect, entity, tag )
{
    wait timer;
    playfxontag( effect, entity, tag );
}

// Namespace vehicle_lights
// Params 3
// Checksum 0xefc74f63, Offset: 0x938
// Size: 0x48
function lights_off( group, model, classname )
{
    groups = strtok( group, " ", model );
    utility::array_levelthread( groups, &lights_off_internal, model, classname );
}

