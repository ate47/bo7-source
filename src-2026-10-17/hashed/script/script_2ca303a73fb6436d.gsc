#using script_d74ae0b4aa21186;
#using scripts\common\utility;
#using scripts\mp\bots\bots_gametype_super_shared;

#namespace namespace_cfbf3e363210f7ae;

// Namespace namespace_cfbf3e363210f7ae
// Params 0
// Checksum 0xec9ec4e7, Offset: 0xa6
// Size: 0x12
function createdecision()
{
    return mind::function_6e220221dd563155( &evaluatescore, &createaction );
}

// Namespace namespace_cfbf3e363210f7ae
// Params 1
// Checksum 0xde3ebdbf, Offset: 0xc1
// Size: 0xe, Type: bool
function evaluatescore( bot )
{
    return true;
}

// Namespace namespace_cfbf3e363210f7ae
// Params 1
// Checksum 0xbc6e28bc, Offset: 0xd8
// Size: 0x28
function createaction( bot )
{
    return mind::createactionbase( "Auto Run Map", undefined, "main", "", &actionprocess, self );
}

// Namespace namespace_cfbf3e363210f7ae
// Params 1
// Checksum 0xfc6d5242, Offset: 0x109
// Size: 0xd3
function actionprocess( bot )
{
    while ( true )
    {
        if ( getdvarint( @"hash_5749a8474f4dab7d" ) == 1 )
        {
            setdvar( @"hash_57e665aef01b95a9", 0 );
            run_target = getdvarvector( @"hash_747a3d0ee28ac5a8", ( 0, 0, 0 ) );
            bot bots_gametype_super_shared::setscriptgoal( run_target, 20 );
            result = bot utility::waittill_any_in_array_return( [ "goal", "bad_path" ] );
            
            if ( result == "goal" )
            {
                setdvar( @"hash_57e665aef01b95a9", 1 );
            }
            else
            {
                setdvar( @"hash_57e665aef01b95a9", 2 );
            }
            
            setdvar( @"hash_5749a8474f4dab7d", 0 );
            continue;
        }
        
        wait 0.5;
    }
}

