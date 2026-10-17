#using script_1aae2eb1ef28b239;
#using script_2a9058c1321cd25d;
#using scripts\common\activity_nexus\activity_common;
#using scripts\common\ai\ai_spawn_director;
#using scripts\mp\ob\systems\region_difficulty_manager;

#namespace ob_difficulty_manager;

// Namespace ob_difficulty_manager
// Params 0
// Checksum 0x9b3d46ff, Offset: 0x1ea
// Size: 0x719
function function_4c3bd700506293e0()
{
    if ( getdvarint( @"hash_e0a808f0c05b7ec2", 0 ) )
    {
        return;
    }
    
    s_bundle = getscriptbundle( "obdifficultymanager:ob_difficulty_manager_base" );
    
    if ( !isdefined( s_bundle ) )
    {
        assertmsg( "<dev string:x24>" );
        return;
    }
    
    level.ob_difficulty_manager = spawnstruct();
    level.ob_difficulty_manager.updatecooldown = s_bundle.updatecooldown ?? 1;
    level.ob_difficulty_manager.var_63fc9d92535b6c44 = s_bundle.var_63fc9d92535b6c44 ?? 8;
    level.ob_difficulty_manager.var_73984d317d86e822 = s_bundle.var_73984d317d86e822 ?? 2;
    level.ob_difficulty_manager.var_cb03e0a6a1cc5a26 = s_bundle.var_cb03e0a6a1cc5a26 ?? 1;
    level.ob_difficulty_manager.var_45b9bc35935b8f8c = s_bundle.var_45b9bc35935b8f8c ?? 2;
    level.ob_difficulty_manager.var_14ec711ccd29c5ef = s_bundle.var_14ec711ccd29c5ef ?? 3;
    level.ob_difficulty_manager.var_30ea75e535bf2fd = s_bundle.var_30ea75e535bf2fd ?? 6;
    level.ob_difficulty_manager.var_29856c6bbb60d0e1 = s_bundle.var_29856c6bbb60d0e1 ?? 7;
    level.ob_difficulty_manager.var_703cde2efd2f1788 = s_bundle.var_703cde2efd2f1788 ?? 2;
    level.ob_difficulty_manager.var_8c0f024cdaeda761 = s_bundle.var_8c0f024cdaeda761 ?? 4;
    level.ob_difficulty_manager.var_68f2c81e400289c3 = s_bundle.var_68f2c81e400289c3 ?? 4;
    level.ob_difficulty_manager.var_fc4a4cb62363d558 = s_bundle.var_fc4a4cb62363d558 ?? 6;
    level.ob_difficulty_manager.var_18ef8d1414769590 = s_bundle.var_18ef8d1414769590 ?? 6;
    level.ob_difficulty_manager.var_4667142513630ac5 = s_bundle.var_4667142513630ac5 ?? 0.8;
    level.ob_difficulty_manager.var_703a0f85dec4227a = s_bundle.var_703a0f85dec4227a ?? 2;
    level.ob_difficulty_manager.var_52829cb7b2eda9f[ "zombie_hellhound" ] = 1;
    level.ob_difficulty_manager.var_52829cb7b2eda9f[ "zombie_base" ] = 2;
    level.ob_difficulty_manager.var_52829cb7b2eda9f[ "zombie_base_armored_heavy" ] = 3;
    level.ob_difficulty_manager.var_52829cb7b2eda9f[ "zombie_mangler" ] = 10;
    level.ob_difficulty_manager.spawnevents = [];
    level.ob_difficulty_manager.var_adf18ea39427107b = [];
    spawnevents = s_bundle.spawneventlist;
    var_603ef34f57ab1318 = s_bundle.var_b433569b527aa4be;
    
    if ( isdefined( spawnevents ) )
    {
        foreach ( event in spawnevents )
        {
            eventcolor = event.var_63268b9c6518a756 ?? "difficulty_easy";
            eventdifficulty = event.var_694db219c6fdb726 ?? "easy";
            
            if ( !isdefined( level.ob_difficulty_manager.spawnevents[ event.var_63268b9c6518a756 ] ) )
            {
                level.ob_difficulty_manager.spawnevents[ eventcolor ] = spawnstruct();
                level.ob_difficulty_manager.spawnevents[ eventcolor ].easy = [];
                level.ob_difficulty_manager.spawnevents[ eventcolor ].medium = [];
                level.ob_difficulty_manager.spawnevents[ eventcolor ].hard = [];
            }
            
            easysize = level.ob_difficulty_manager.spawnevents[ eventcolor ].easy.size;
            mediumsize = level.ob_difficulty_manager.spawnevents[ eventcolor ].medium.size;
            hardsize = level.ob_difficulty_manager.spawnevents[ eventcolor ].hard.size;
            
            if ( eventdifficulty == "easy" )
            {
                level.ob_difficulty_manager.spawnevents[ eventcolor ].easy[ easysize ] = spawnstruct();
                level.ob_difficulty_manager.spawnevents[ eventcolor ].easy[ easysize ].var_3ff9ff3ef6019b = event.var_3ff9ff3ef6019b ?? 0;
                level.ob_difficulty_manager.spawnevents[ eventcolor ].easy[ easysize ].var_a1a0c1e4ca788806 = event.var_a1a0c1e4ca788806 ?? "ai_encounter:ai_encounter_spawn_event_easy_green_1";
                continue;
            }
            
            if ( eventdifficulty == "medium" )
            {
                level.ob_difficulty_manager.spawnevents[ eventcolor ].medium[ mediumsize ] = spawnstruct();
                level.ob_difficulty_manager.spawnevents[ eventcolor ].medium[ mediumsize ].var_3ff9ff3ef6019b = event.var_3ff9ff3ef6019b ?? 0;
                level.ob_difficulty_manager.spawnevents[ eventcolor ].medium[ mediumsize ].var_a1a0c1e4ca788806 = event.var_a1a0c1e4ca788806 ?? "ai_encounter:ai_encounter_spawn_event_easy_green_1";
                continue;
            }
            
            if ( eventdifficulty == "hard" )
            {
                level.ob_difficulty_manager.spawnevents[ eventcolor ].hard[ hardsize ] = spawnstruct();
                level.ob_difficulty_manager.spawnevents[ eventcolor ].hard[ hardsize ].var_3ff9ff3ef6019b = event.var_3ff9ff3ef6019b ?? 0;
                level.ob_difficulty_manager.spawnevents[ eventcolor ].hard[ hardsize ].var_a1a0c1e4ca788806 = event.var_a1a0c1e4ca788806 ?? "ai_encounter:ai_encounter_spawn_event_easy_green_1";
            }
        }
    }
    
    level thread function_5443a432bd7cf1aa();
    
    /#
    #/
}

// Namespace ob_difficulty_manager
// Params 0
// Checksum 0x25040a4f, Offset: 0x90b
// Size: 0x1cf
function function_3db94790db78ccd()
{
    n_players = self.playerparticipants.size;
    var_183e83af30fba9bb = 0;
    
    switch ( self.difficulty )
    {
        case #"hash_7bb2cd766703d463":
            var_183e83af30fba9bb = n_players - level.ob_difficulty_manager.var_703cde2efd2f1788;
            break;
        case #"hash_af83e47edfa8900a":
            var_183e83af30fba9bb = n_players - level.ob_difficulty_manager.var_8c0f024cdaeda761;
            break;
        case #"hash_5343b465e56ec9a4":
            var_183e83af30fba9bb = n_players - level.ob_difficulty_manager.var_68f2c81e400289c3;
            break;
        case #"hash_651f76c0ad6741ec":
        case #"hash_c0250ffc2e87f2ff":
        case #"hash_c02510fc2e87f492":
            var_183e83af30fba9bb = n_players - level.ob_difficulty_manager.var_fc4a4cb62363d558;
            break;
    }
    
    if ( var_183e83af30fba9bb >= level.ob_difficulty_manager.var_cb03e0a6a1cc5a26 && var_183e83af30fba9bb <= level.ob_difficulty_manager.var_45b9bc35935b8f8c )
    {
        self.var_9ea004d7ec3cc62d = "easy";
        self.var_183e83af30fba9bb = var_183e83af30fba9bb;
        return;
    }
    
    if ( var_183e83af30fba9bb >= level.ob_difficulty_manager.var_14ec711ccd29c5ef && var_183e83af30fba9bb <= level.ob_difficulty_manager.var_30ea75e535bf2fd )
    {
        self.var_9ea004d7ec3cc62d = "medium";
        self.var_183e83af30fba9bb = var_183e83af30fba9bb;
        return;
    }
    
    if ( var_183e83af30fba9bb >= level.ob_difficulty_manager.var_29856c6bbb60d0e1 )
    {
        self.var_9ea004d7ec3cc62d = "hard";
        self.var_183e83af30fba9bb = var_183e83af30fba9bb;
        return;
    }
    
    self.var_9ea004d7ec3cc62d = undefined;
    self.var_183e83af30fba9bb = undefined;
}

// Namespace ob_difficulty_manager
// Params 1
// Checksum 0xb94dd8fb, Offset: 0xae2
// Size: 0x138
function function_1e43f891714fced1( relevant_info_struct )
{
    obproperties = undefined;
    
    if ( obproperties.var_9149d54e22a931cc )
    {
        self.var_3acd61e6f1debfb0 = 1;
        
        if ( !isdefined( self.difficulty ) )
        {
            point = activity_instance_common::function_776ee11e7acc64a5( self );
            difficulty = region_difficulty_manager::get_region_difficulty( point );
            self.difficulty = difficulty;
        }
        
        self.var_d50c53e0b22f9f29 = obproperties.var_2701b606bc061818.var_463edd3181df69bf;
        self.var_15211f2accd16de6 = obproperties.var_2701b606bc061818.var_4a30727fd7100be8;
        self.var_b1aab63f31f2fb4 = obproperties.var_2701b606bc061818.var_596ccbde5fa42b8a;
        self.var_bae1361a6bede532 = obproperties.var_2701b606bc061818.var_32bc0021f67a1494;
        self.var_7ceffb65c95a1edb = obproperties.var_2701b606bc061818.var_6ca8734b4d82c4c4;
        activity_common::function_2dd4f07fa5c3e911( "PlayerJoin", &function_1bf0b0326ca6eaa0, self.type );
        activity_common::function_2dd4f07fa5c3e911( "PlayerLeave", &function_ea487424512f4eef, self.type );
    }
}

// Namespace ob_difficulty_manager
// Params 1
// Checksum 0x58a0cf66, Offset: 0xc22
// Size: 0xd4
function function_1bf0b0326ca6eaa0( relevant_info_struct )
{
    if ( self.var_3acd61e6f1debfb0 )
    {
        player_list = relevant_info_struct.playerlist;
        
        foreach ( player in player_list )
        {
            if ( isplayer( player ) )
            {
                if ( !isdefined( self.difficulty ) )
                {
                    difficulty = player.region_difficulty;
                    self.difficulty = difficulty;
                }
            }
        }
        
        function_3db94790db78ccd();
    }
}

// Namespace ob_difficulty_manager
// Params 1
// Checksum 0xe2c20664, Offset: 0xcfe
// Size: 0x1f
function function_ea487424512f4eef( relevant_info_struct )
{
    if ( self.var_3acd61e6f1debfb0 )
    {
        function_3db94790db78ccd();
    }
}

// Namespace ob_difficulty_manager
// Params 0
// Checksum 0x5004ce02, Offset: 0xd25
// Size: 0x149
function function_5443a432bd7cf1aa()
{
    level endon( #"game_ended" );
    
    while ( true )
    {
        foreach ( activity in level.activities.instances )
        {
            if ( !isdefined( activity ) )
            {
                continue;
            }
            
            activitystate = activity_instance_common::getactivitystate( activity );
            
            if ( activity.var_3acd61e6f1debfb0 )
            {
                /#
                    var_33253100d76951b0 = getdvarint( @"hash_e7cee129b1a5b6f1", 0 );
                    var_b990a294c1e74025 = getdvar( @"hash_469e8ee29337b850", "<dev string:x4c>" );
                    
                    if ( var_33253100d76951b0 > 0 )
                    {
                        activity.var_183e83af30fba9bb = var_33253100d76951b0;
                        activity.var_9ea004d7ec3cc62d = var_b990a294c1e74025;
                    }
                #/
                
                if ( isdefined( activity.var_9ea004d7ec3cc62d ) )
                {
                    activity function_fc149e50d3f3f715();
                    activity function_70a051403bc39e6f();
                }
            }
        }
        
        wait level.ob_difficulty_manager.updatecooldown;
    }
}

// Namespace ob_difficulty_manager
// Params 0
// Checksum 0xbf32f936, Offset: 0xe76
// Size: 0x568
function function_fc149e50d3f3f715()
{
    time = gettime();
    
    if ( !isdefined( self.var_c3249016c9b2d44b ) )
    {
        self.var_c3249016c9b2d44b = time;
    }
    
    if ( ( time - self.var_c3249016c9b2d44b ) / 1000 < level.ob_difficulty_manager.var_73984d317d86e822 )
    {
        return;
    }
    
    if ( !isdefined( self.var_9ea004d7ec3cc62d ) )
    {
        return;
    }
    
    if ( self.var_9ea004d7ec3cc62d == "easy" && self.var_d50c53e0b22f9f29 )
    {
        return;
    }
    else if ( self.var_9ea004d7ec3cc62d == "medium" && self.var_15211f2accd16de6 )
    {
        return;
    }
    else if ( self.var_9ea004d7ec3cc62d == "hard" && self.var_b1aab63f31f2fb4 )
    {
        return;
    }
    else if ( self.var_d50c53e0b22f9f29 && self.var_15211f2accd16de6 && self.var_b1aab63f31f2fb4 )
    {
        return;
    }
    
    self.var_c3249016c9b2d44b = time;
    
    if ( !isdefined( self.var_79f116698215747f ) )
    {
        self.var_79f116698215747f = [];
    }
    
    var_f23a552993faa9cc = 0;
    
    foreach ( zombie in self.var_79f116698215747f )
    {
        if ( isalive( zombie ) )
        {
            points = 0;
            
            if ( isdefined( level.ob_difficulty_manager.var_52829cb7b2eda9f[ zombie.subclass ] ) )
            {
                points = level.ob_difficulty_manager.var_52829cb7b2eda9f[ zombie.subclass ];
            }
            
            var_f23a552993faa9cc += points;
            continue;
        }
        
        self.var_79f116698215747f = arrayremove( self.var_79f116698215747f, zombie );
    }
    
    var_183e83af30fba9bb = self.var_183e83af30fba9bb;
    
    /#
        var_33253100d76951b0 = getdvarint( @"hash_e7cee129b1a5b6f1", 0 );
        
        if ( var_33253100d76951b0 > 0 )
        {
            var_183e83af30fba9bb = var_33253100d76951b0;
        }
    #/
    
    var_8c24088d099bba7e = var_183e83af30fba9bb * level.ob_difficulty_manager.var_63fc9d92535b6c44;
    
    if ( isdefined( level.ob_difficulty_manager.spawnevents[ self.difficulty ] ) )
    {
        eventchoices = [];
        
        if ( self.var_9ea004d7ec3cc62d == "easy" )
        {
            eventchoices = level.ob_difficulty_manager.spawnevents[ self.difficulty ].easy;
        }
        else if ( self.var_9ea004d7ec3cc62d == "medium" )
        {
            eventchoices = level.ob_difficulty_manager.spawnevents[ self.difficulty ].medium;
        }
        else if ( self.var_9ea004d7ec3cc62d == "hard" )
        {
            eventchoices = level.ob_difficulty_manager.spawnevents[ self.difficulty ].hard;
        }
    }
    else
    {
        return;
    }
    
    var_1ce31878e4ed7d16 = var_8c24088d099bba7e - var_f23a552993faa9cc;
    validevents = [];
    
    foreach ( event in eventchoices )
    {
        if ( event.var_3ff9ff3ef6019b <= var_1ce31878e4ed7d16 )
        {
            validevents[ validevents.size ] = event;
        }
    }
    
    if ( validevents.size > 0 )
    {
        randomindex = randomintrange( 0, validevents.size );
        spawnevent = validevents[ randomindex ];
        spawnpoints = [];
        
        if ( isdefined( self.var_cfaead52cdd5c4ec ) )
        {
            foreach ( point in self.var_cfaead52cdd5c4ec )
            {
                spawnpoints[ spawnpoints.size ] = point.origin;
            }
        }
        else
        {
            spawnpoints[ 0 ] = activity_instance_common::function_776ee11e7acc64a5( self );
            
            foreach ( player in self.playerparticipants )
            {
                spawnpoints[ spawnpoints.size ] = player.origin;
            }
        }
        
        randompointindex = randomintrange( 0, spawnpoints.size );
        randompoint = spawnpoints[ randompointindex ];
        spawn_event( "ai_encounter:" + spawnevent.var_a1a0c1e4ca788806, randompoint, 256 );
        return;
    }
    
    return;
}

// Namespace ob_difficulty_manager
// Params 3
// Checksum 0x7208eb7e, Offset: 0x13e6
// Size: 0x4a
function spawn_event( ai_encounter, origin, radius )
{
    requestid = activity_ai_encounters::function_eb8506829193f5eb( ai_encounter, origin, radius, 1, 0, 1, 1 );
    ai_spawn_director::function_71b3c575c1426546( requestid, &function_13806b888a0ef6a0, self );
}

// Namespace ob_difficulty_manager
// Params 4
// Checksum 0xb5b2d6a8, Offset: 0x1438
// Size: 0x51
function function_13806b888a0ef6a0( requestid, instance, agent, ai_data )
{
    if ( isdefined( instance.var_79f116698215747f ) )
    {
        instance.var_79f116698215747f[ instance.var_79f116698215747f.size ] = agent;
    }
}

// Namespace ob_difficulty_manager
// Params 0
// Checksum 0x5b6b7cdd, Offset: 0x1491
// Size: 0x124
function function_70a051403bc39e6f()
{
    time = gettime();
    
    if ( !isdefined( self.var_df3ebb562e12c2f3 ) )
    {
        self.var_df3ebb562e12c2f3 = time;
    }
    
    var_183e83af30fba9bb = self.var_183e83af30fba9bb ?? 1;
    
    /#
        var_33253100d76951b0 = getdvarint( @"hash_e7cee129b1a5b6f1", 0 );
        
        if ( var_33253100d76951b0 > 0 )
        {
            var_183e83af30fba9bb = var_33253100d76951b0;
        }
    #/
    
    var_44da36a784f5d411 = level.ob_difficulty_manager.var_18ef8d1414769590 * var_183e83af30fba9bb * level.ob_difficulty_manager.var_4667142513630ac5;
    
    if ( var_44da36a784f5d411 < level.ob_difficulty_manager.var_703a0f85dec4227a )
    {
        var_44da36a784f5d411 = level.ob_difficulty_manager.var_703a0f85dec4227a;
    }
    
    if ( !isdefined( self.var_c3249016c9b2d44b ) )
    {
        self.var_c3249016c9b2d44b = time;
    }
    
    if ( ( time - self.var_df3ebb562e12c2f3 ) / 1000 < var_44da36a784f5d411 )
    {
        return;
    }
    
    if ( self.var_bae1361a6bede532 )
    {
        return;
    }
    
    var_26de051f5c2a5eb4 = self.var_7ceffb65c95a1edb;
    
    /#
        iprintlnbold( "<dev string:x51>" );
    #/
}

