#using scripts\common\utility;

#namespace popsmoke;

// Namespace popsmoke
// Params 1
// Checksum 0x1aaded0d, Offset: 0xa7
// Size: 0xf7
function popsmoke_deploy( smoketags = [ "tag_origin" ] )
{
    if ( !isarray( smoketags ) )
    {
        smoketags = [ smoketags ];
    }
    
    owner = self.owner;
    
    foreach ( tag in smoketags )
    {
        utility::function_7c10ea82c1e305b8( tag, "popsmoke" );
        grenade = magicgrenademanual( "popsmoke_grenade_mp", self gettagorigin( tag ), anglestoup( self gettagangles( tag ) ) * 300 );
        grenade.owner = owner;
        wait 0.25;
    }
}

