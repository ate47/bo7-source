#using scripts\common\callbacks;
#using scripts\common\utility;

#namespace shroud_wz;

// Namespace shroud_wz
// Params 0, eflags: 0x1
// Checksum 0x98d1d02d, Offset: 0xa2
// Size: 0x3d
function autoexec preinit()
{
    if ( isbrgamemode() )
    {
        level callback::add( #"register_perk", &function_46d2f1af6be6e4af );
        utility::registersharedfunc( #"perks", #"dropsmoke", &function_e525360fa92f178b );
    }
}

// Namespace shroud_wz
// Params 1
// Checksum 0x65d2ec64, Offset: 0xe7
// Size: 0x5e
function function_46d2f1af6be6e4af( params )
{
    bundle = level.perkbundles[ "specialty_shroud" ];
    
    if ( !isdefined( bundle ) )
    {
        return;
    }
    
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_shroud", &function_da766eff0e06d3b6, &function_8b1bb3c7cfe08283, undefined, undefined );
    }
}

// Namespace shroud_wz
// Params 0
// Checksum 0x8ceacaa0, Offset: 0x14d
// Size: 0xd
function function_da766eff0e06d3b6()
{
    self.var_6798be769a21cff4 = 1;
}

// Namespace shroud_wz
// Params 0
// Checksum 0x8ea14d75, Offset: 0x162
// Size: 0xc
function function_8b1bb3c7cfe08283()
{
    self.var_6798be769a21cff4 = undefined;
}

// Namespace shroud_wz
// Params 2
// Checksum 0x8958949d, Offset: 0x176
// Size: 0x1d3
function function_e525360fa92f178b( mindistoverride, maxdistoverride )
{
    bundle = level.perkbundles[ "specialty_shroud" ];
    mindist = mindistoverride ?? bundle.var_a3422e2f26a2255d ?? 0;
    maxdist = maxdistoverride ?? bundle.var_f1e6e8ebb423835f ?? 24;
    droporigin = self.origin;
    
    if ( mindist != maxdist )
    {
        originoffsetdist = randomfloatrange( mindist, maxdist );
    }
    else
    {
        originoffsetdist = maxdist;
    }
    
    velocity = ( 0, 0, 0 );
    
    if ( originoffsetdist != 0 )
    {
        originoffsetdir = anglestoforward( ( 0, randomfloat( 359 ), 0 ) );
        targetposition = droporigin + originoffsetdir * originoffsetdist;
        gravity = ( 0, 0, getdvarfloat( @"bg_gravity" ) * -1 );
        velocity = trajectorycalculateinitialvelocity( droporigin, targetposition, gravity, 0.5 );
    }
    
    grenade = self launchgrenade( bundle.shroudgrenadeweapon ?? "t10_smoke_grenade_mp", droporigin, velocity, 0.5 );
    
    /#
        if ( getdvarint( @"hash_21a13d02148f35f5", 0 ) )
        {
            grenade waittill( #"explode", position );
            thread utility::draw_line_for_time( droporigin, position, 1, 0, 0, 10 );
            frameduration = int( 10000 / level.frameduration + 0.5 );
            print3d( position + ( 0, 0, 20 ), string( distance2d( droporigin, position ) ) + "<dev string:x24>", ( 1, 0, 0 ), 1, 1, frameduration, 1 );
        }
    #/
}

