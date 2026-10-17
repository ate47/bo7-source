#using script_4f9ce8d249a99f4a;
#using scripts\common\trace;
#using scripts\common\utility;

#namespace mini_missile;

// Namespace mini_missile
// Params 1
// Checksum 0xce630a67, Offset: 0x1a5
// Size: 0x51
function function_f86bb4a3d9295e09( missile )
{
    level endon( #"game_ended" );
    self endon( #"disconnect" );
    missile endon( #"explode" );
    missile endon( #"death" );
    missile thread function_724a5c6690a9a66a();
    missile thread function_76f954b17a1db37f( self );
}

// Namespace mini_missile
// Params 0
// Checksum 0xfa4ce5c7, Offset: 0x1fe
// Size: 0x40
function function_724a5c6690a9a66a()
{
    level endon( #"game_ended" );
    self endon( #"explode" );
    self.owner utility::waittill_any( "disconnect", "joined_team", "joined_spectators" );
    thread function_4ea09cb291b6a09e();
}

// Namespace mini_missile
// Params 1
// Checksum 0x213bbb7c, Offset: 0x246
// Size: 0x5a
function function_4ea09cb291b6a09e( immediate )
{
    level endon( #"game_ended" );
    self endon( #"death" );
    self notify( #"explode" );
    
    if ( self.exploding )
    {
        return;
    }
    
    self.exploding = 1;
    self delete();
    self notify( #"death" );
}

// Namespace mini_missile
// Params 3
// Checksum 0x614c4b1c, Offset: 0x2a8
// Size: 0xdf
function function_fa7dde050311c4b4( player, playereye, playerfwd )
{
    endpos = playereye + playerfwd * 65536;
    contents = physics_createcontents( [ "physicscontents_characterproxy", "physicscontents_clipshot", "physicscontents_water", "physicscontents_vehicle", "physicscontents_item", "physicscontents_playernosight" ] );
    ignoreents = [ player, self ];
    trace = trace::ray_trace_detail( playereye, endpos, ignoreents, contents, 1, 1 );
    foundhit = trace[ "hittype" ] != "hittype_none" && trace[ "fraction" ] < 1;
    
    if ( foundhit )
    {
        return trace[ "position" ];
    }
    
    return;
}

// Namespace mini_missile
// Params 1
// Checksum 0x2720db62, Offset: 0x38f
// Size: 0x104
function function_76f954b17a1db37f( player )
{
    level endon( #"game_ended" );
    player endon( #"disconnect" );
    self endon( #"death" );
    self endon( #"explode" );
    
    while ( true )
    {
        waitframe();
        currentweapon = player getcurrentweapon();
        targetpos = undefined;
        var_44c64f143a2565ae = isdefined( currentweapon.underbarrel ) && getweaponhasperk( currentweapon, "specialty_ub_guided_missile" ) && currentweapon.isalternate;
        var_57803627e94a825f = var_44c64f143a2565ae && player player::isplayerads();
        
        if ( !var_57803627e94a825f )
        {
            self missile_cleartarget();
            continue;
        }
        
        playereye = player geteye();
        playerviewangles = player getplayerangles();
        playerfwd = anglestoforward( playerviewangles );
        targetpos = function_fa7dde050311c4b4( player, playereye, playerfwd );
        self function_308ee1e5aa6daaa9( playereye, playerfwd, targetpos );
    }
}

