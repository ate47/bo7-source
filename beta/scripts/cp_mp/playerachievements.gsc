#namespace playerachievements;

// Namespace playerachievements
// Params 2, eflags: 0x4
// Checksum 0x96988c50, Offset: 0xb6
// Size: 0x65
function private initachievement( player, achievementid )
{
    if ( !isdefined( player.achievements ) )
    {
        player.achievements = [];
    }
    
    if ( !isdefined( player.achievements[ achievementid ] ) )
    {
        player.achievements[ achievementid ] = { #progressvalues:[], #dataready:0 };
    }
}

// Namespace playerachievements
// Params 2
// Checksum 0x5730dccc, Offset: 0x123
// Size: 0x53
function getstate( player, achievementid )
{
    println( "<dev string:x24>" + player.name + "<dev string:x45>" + achievementid );
    
    if ( player iscodcaster() )
    {
        return;
    }
    
    initachievement( player, achievementid );
    player function_fdf029c4be6546a3( achievementid );
}

// Namespace playerachievements
// Params 1
// Checksum 0xa04454bb, Offset: 0x17e
// Size: 0x65
function function_a550b9c75bcbee5e( progressname )
{
    if ( !isdefined( level.var_ff13eadad931c15a ) )
    {
        level.var_ff13eadad931c15a = [];
    }
    
    progressid = level.var_ff13eadad931c15a[ progressname ];
    
    if ( !isdefined( progressid ) )
    {
        progressid = int( tablelookup( "ae/ae_progress_target_ids.csv", 0, progressname, 1 ) );
        level.var_ff13eadad931c15a[ progressname ] = progressid;
    }
    
    return progressid;
}

// Namespace playerachievements
// Params 1
// Checksum 0xaa723b7d, Offset: 0x1ec
// Size: 0x1a
function function_6c2806c796cd19b2( progressid )
{
    return tablelookup( "ae/ae_progress_target_ids.csv", 1, progressid, 0 );
}

// Namespace playerachievements
// Params 4
// Checksum 0xb3870a7f, Offset: 0x20f
// Size: 0x47
function function_ce48098d17912e1f( player, achievementid, progressname, defaultvalue )
{
    progressid = function_a550b9c75bcbee5e( progressname );
    return function_1792b9eb4905bb29( player, achievementid, progressid, defaultvalue );
}

// Namespace playerachievements
// Params 4
// Checksum 0x498eae9d, Offset: 0x25f
// Size: 0x7b
function function_1792b9eb4905bb29( player, achievementid, progressid, defaultvalue )
{
    initachievement( player, achievementid );
    progressvalue = defaultvalue;
    
    if ( isdefined( player.achievements[ achievementid ].progressvalues[ progressid ] ) )
    {
        progressvalue = player.achievements[ achievementid ].progressvalues[ progressid ];
    }
    
    return progressvalue;
}

// Namespace playerachievements
// Params 3
// Checksum 0x1f85d4f5, Offset: 0x2e3
// Size: 0xda
function challenge_progress( player, achievementid, progression )
{
    println( "<dev string:x66>" + player.name + "<dev string:x91>" + achievementid );
    initachievement( player, achievementid );
    
    for ( index = 0; index < progression.progress_values.size ; index++ )
    {
        progress_id = progression.progress_values[ index ].progress_id;
        progress_value = progression.progress_values[ index ].progress;
        player.achievements[ achievementid ].progressvalues[ progress_id ] = progress_value;
    }
    
    player notify( "challengeProgress", achievementid );
}

