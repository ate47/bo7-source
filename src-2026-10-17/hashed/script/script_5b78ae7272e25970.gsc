#using script_353e34c229ca1589;
#using scripts\mp\objidpoolmanager;

#namespace namespace_1cdb218d68ef13f6;

// Namespace namespace_1cdb218d68ef13f6
// Params 0
// Checksum 0xaf5070e7, Offset: 0x76
// Size: 0x592
function init()
{
    if ( isdefined( level.objective_icon_states ) )
    {
        return;
    }
    
    var_17ba03caa89d0fe7 = game_utility_mp::function_4b7180ed8c2e9742( #"hash_327dacd467b9a77b" );
    
    if ( !isdefined( var_17ba03caa89d0fe7 ) )
    {
        return;
    }
    
    foreach ( objective_icon_state in var_17ba03caa89d0fe7.list )
    {
        state = {};
        state.neutral_label = objective_icon_state.neutrallabel;
        state.friendly_label = objective_icon_state.friendlylabel;
        state.enemy_label = objective_icon_state.enemylabel;
        state.background_type = objective_icon_state.backgroundtype == #"default" ? 0 : objective_icon_state.backgroundtype == #"hash_248355f1dc846e66" ? 1 : objective_icon_state.backgroundtype == #"hash_664804980c2ce4c7" ? 2 : objective_icon_state.backgroundtype == #"mission" ? 3 : objective_icon_state.backgroundtype == #"hash_c16e7a4787e42feb" ? 4 : objective_icon_state.backgroundtype == #"poi" ? 5 : objective_icon_state.backgroundtype == #"circle" ? 6 : objective_icon_state.backgroundtype == #"diamond" ? 7 : objective_icon_state.backgroundtype == #"stronghold" ? 8 : objective_icon_state.backgroundtype == #"hash_7bcf0214de40210a" ? 9 : undefined;
        state.icon_image = objective_icon_state.iconimage;
        state.z_offset = objective_icon_state.zoffset;
        state.pulse = objective_icon_state.pulse;
        state.waypoint_identifier = objective_icon_state.waypointidentifier == #"waypoint_none" ? 0 : objective_icon_state.waypointidentifier == #"waypoint_zone" ? 1 : objective_icon_state.waypointidentifier == #"hash_973be223e3753cb8" ? 2 : objective_icon_state.waypointidentifier == #"waypoint_zone_a" ? 3 : objective_icon_state.waypointidentifier == #"hash_f0a5c06897c2dd62" ? 4 : objective_icon_state.waypointidentifier == #"waypoint_zone_b" ? 5 : objective_icon_state.waypointidentifier == #"hash_f8bbf014395455d7" ? 6 : objective_icon_state.waypointidentifier == #"hash_88b7638abfa7b3af" ? 7 : objective_icon_state.waypointidentifier == #"hash_88b7608abfa7ae96" ? 8 : objective_icon_state.waypointidentifier == #"hash_88b7618abfa7b049" ? 9 : objective_icon_state.waypointidentifier == #"waypoint_bomb" ? 10 : objective_icon_state.waypointidentifier == #"hash_1e3be9b83317096d" ? 11 : objective_icon_state.waypointidentifier == #"waypoint_flag" ? 12 : objective_icon_state.waypointidentifier == #"waypoint_flag_zone" ? 13 : objective_icon_state.waypointidentifier == #"hash_92babcafbe2a7f3a" ? 14 : objective_icon_state.waypointidentifier == #"hash_7a159a7aa7edc65b" ? 15 : objective_icon_state.waypointidentifier == #"waypoint_weapon_case" ? 16 : objective_icon_state.waypointidentifier == #"waypoint_stronghold" ? 17 : objective_icon_state.waypointidentifier == #"waypoint_blacksite" ? 18 : objective_icon_state.waypointidentifier == #"hash_eb3dad07c56887e5" ? 19 : objective_icon_state.waypointidentifier == #"waypoint_circle_a" ? 20 : objective_icon_state.waypointidentifier == #"waypoint_circle_b" ? 21 : objective_icon_state.waypointidentifier == #"waypoint_circle_c" ? 22 : objective_icon_state.waypointidentifier == #"waypoint_circle_d" ? 23 : objective_icon_state.waypointidentifier == #"waypoint_loadout_crate" ? 24 : objective_icon_state.waypointidentifier == #"hash_88b75e8abfa7ab30" ? 25 : undefined;
        
        if ( !isdefined( level.objective_icon_states ) )
        {
            level.objective_icon_states = [];
        }
        
        level.objective_icon_states[ objective_icon_state.key ] = state;
    }
}

// Namespace namespace_1cdb218d68ef13f6
// Params 3
// Checksum 0x571b97aa, Offset: 0x610
// Size: 0x113
function set_objective_icon_state( objective_id, key_hash, var_57d7851ec9e7dab2 = undefined )
{
    if ( !isxhash( key_hash ) )
    {
        key_hash = getxhash( key_hash );
    }
    
    state = level.objective_icon_states[ key_hash ];
    
    if ( !isdefined( state ) )
    {
        assertmsg( "<dev string:x24>" + key_hash + "<dev string:x62>" );
        return;
    }
    
    objidpoolmanager::update_objective_setneutrallabel( objective_id, state.neutral_label );
    objidpoolmanager::update_objective_setfriendlylabel( objective_id, state.friendly_label );
    objidpoolmanager::update_objective_setenemylabel( objective_id, state.enemy_label );
    objidpoolmanager::update_objective_setbackground( objective_id, state.background_type );
    objidpoolmanager::update_objective_icon( objective_id, state.icon_image );
    objidpoolmanager::update_objective_setzoffset( objective_id, state.z_offset );
    objidpoolmanager::objective_set_pulsate( objective_id, state.pulse );
    objidpoolmanager::update_objective_objectiveid( objective_id, var_57d7851ec9e7dab2 ?? state.waypoint_identifier );
}

// Namespace namespace_1cdb218d68ef13f6
// Params 2
// Checksum 0xec051f92, Offset: 0x72b
// Size: 0x5f
function get_objective_icon_state( objective_id, key_hash )
{
    if ( !isxhash( key_hash ) )
    {
        key_hash = getxhash( key_hash );
    }
    
    state = level.objective_icon_states[ key_hash ];
    
    if ( !isdefined( state ) )
    {
        assertmsg( "<dev string:x24>" + key_hash + "<dev string:x62>" );
        return;
    }
    
    return state;
}

