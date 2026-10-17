#using scripts\mp\compass;
#using scripts\mp\load;
#using scripts\mp\maps\mp_sat_sm_liminal\gen\mp_sat_sm_liminal_art;
#using scripts\mp\maps\mp_sat_sm_liminal\mp_sat_sm_liminal_fx;
#using scripts\mp\maps\mp_sat_sm_liminal\mp_sat_sm_liminal_lighting;

#namespace mp_sat_sm_liminal;

// Namespace mp_sat_sm_liminal
// Params 0
// Checksum 0xcee060f5, Offset: 0x157
// Size: 0x7c
function main()
{
    mp_sat_sm_liminal_art::main();
    namespace_ffd2cc6af1912e45::main();
    namespace_5e5a63bc62a43913::main();
    load::main();
    level.outofboundstriggers = getentarray( "OutOfBounds", "targetname" );
    compass::setupminimap( "compass_map_mp_sat_sm_liminal" );
    game[ "attackers" ] = "allies";
    game[ "defenders" ] = "axis";
    game[ "allies_outfit" ] = "urban";
    game[ "axis_outfit" ] = "woodland";
    thread function_5bf968bd18c75093();
}

// Namespace mp_sat_sm_liminal
// Params 0
// Checksum 0x623682ef, Offset: 0x1db
// Size: 0xbb
function function_5bf968bd18c75093()
{
    level endon( #"game_ended" );
    level waittill( #"prematch_done" );
    var_a8a61fbc954b8087 = getdvarint( @"hash_230ea6a64978bd5d" );
    
    if ( !isdefined( var_a8a61fbc954b8087 ) || var_a8a61fbc954b8087 <= 0 )
    {
        var_a8a61fbc954b8087 = randomintrange( 1, 4 );
        setdvar( @"hash_230ea6a64978bd5d", var_a8a61fbc954b8087 );
    }
    
    if ( var_a8a61fbc954b8087 == 1 )
    {
        level.layout = "version1";
    }
    
    if ( var_a8a61fbc954b8087 == 2 )
    {
        level.layout = "version2";
    }
    
    if ( var_a8a61fbc954b8087 == 3 )
    {
        level.layout = "version3";
    }
    
    setareaswapstate( "mp_sat_sm_liminal_areaswap", level.layout );
    thread function_1c228b9e723eb064( var_a8a61fbc954b8087 );
}

// Namespace mp_sat_sm_liminal
// Params 1
// Checksum 0x68634990, Offset: 0x29e
// Size: 0xaa
function function_1c228b9e723eb064( var_a8a61fbc954b8087 )
{
    level endon( #"game_ended" );
    var_452b8949a709d954 = var_a8a61fbc954b8087;
    
    while ( !isdvardefined( @"hash_230ea6a64978bd5d" ) )
    {
        waitframe();
    }
    
    while ( true )
    {
        while ( var_452b8949a709d954 == getdvarint( @"hash_230ea6a64978bd5d" ) )
        {
            waitframe();
        }
        
        var_452b8949a709d954 = getdvarint( @"hash_230ea6a64978bd5d" );
        
        if ( var_452b8949a709d954 == 1 )
        {
            layout = "version1";
        }
        
        if ( var_452b8949a709d954 == 2 )
        {
            layout = "version2";
        }
        
        if ( var_452b8949a709d954 == 3 )
        {
            layout = "version3";
        }
        
        setareaswapstate( "mp_sat_sm_liminal_areaswap", layout );
    }
}

