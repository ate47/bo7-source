#using script_1aae2eb1ef28b239;
#using script_4a2005cdcbf64b88;
#using script_73a03aaf11b641f5;
#using script_f01501ac138f999;
#using scripts\common\utility;

#namespace namespace_49c2d747a467dc5f;

// Namespace namespace_49c2d747a467dc5f
// Params 2
// Checksum 0x6977f730, Offset: 0xcb
// Size: 0xdd
function function_87f86c330140a1ee( activityinstance, activitymoment )
{
    if ( istrue( activityinstance.var_2c769a213204c445.var_e50c170eb4ea5213 ) )
    {
        type = namespace_9085ae059032a84f::function_48c2921599efd7a7( activityinstance );
        spawnmoment = namespace_9085ae059032a84f::function_63b3e35daebe550e( activityinstance );
        destroymoment = namespace_9085ae059032a84f::function_48f55085337a366f( activityinstance );
        
        if ( spawnmoment == activitymoment )
        {
            if ( type == "Scriptable" )
            {
                function_781dae1420a6b622( activityinstance );
            }
            else
            {
                utility::callsharedfunc( #"hash_61266e374b6a4978", #"hash_cfba68776eb6b6d1", activityinstance );
            }
            
            activity_instance_common::announceactivitymoment( activityinstance, "ObjectiveMarkerSpawned" );
            return;
        }
        
        if ( destroymoment == activitymoment )
        {
            if ( type == "GSCScript" )
            {
                utility::callsharedfunc( #"hash_61266e374b6a4978", #"hash_82d433365dffce54", activityinstance );
            }
        }
    }
}

// Namespace namespace_49c2d747a467dc5f
// Params 1
// Checksum 0xb455b030, Offset: 0x1b0
// Size: 0x17
function function_1dafaa12626eed2b( activityinstance )
{
    return activityinstance.var_e7b6adbe385c7c18;
}

// Namespace namespace_49c2d747a467dc5f
// Params 2
// Checksum 0x34ff4f4d, Offset: 0x1d0
// Size: 0x5f
function function_238da7a43b91b2b6( var_f3260707d02e2cd0, var_cd0daf425b585f9b )
{
    var_e7b6adbe385c7c18 = spawnstruct();
    var_e7b6adbe385c7c18.objectivemarkertype = var_f3260707d02e2cd0;
    
    if ( var_f3260707d02e2cd0 == "Scriptable" )
    {
        var_e7b6adbe385c7c18.scriptable = var_cd0daf425b585f9b;
    }
    else
    {
        var_e7b6adbe385c7c18.objectivemarkerid = var_cd0daf425b585f9b;
    }
    
    return var_e7b6adbe385c7c18;
}

// Namespace namespace_49c2d747a467dc5f
// Params 1
// Checksum 0xf1635142, Offset: 0x238
// Size: 0x27
function function_12b8e5d644d86f4e( player )
{
    utility::callsharedfunc( #"hash_61266e374b6a4978", #"hash_2c771489de24ca63", player );
}

// Namespace namespace_49c2d747a467dc5f
// Params 1
// Checksum 0xdf37a879, Offset: 0x267
// Size: 0x27
function function_4438b88dbb95b69d( player )
{
    utility::callsharedfunc( #"hash_61266e374b6a4978", #"hash_a9dac899f49dbbe", player );
}

// Namespace namespace_49c2d747a467dc5f
// Params 0
// Checksum 0xb242cea9, Offset: 0x296
// Size: 0x1b
function function_149cc4ac5d1f2479()
{
    utility::callsharedfunc( #"hash_61266e374b6a4978", #"hash_32b413eabeba80ce" );
}

// Namespace namespace_49c2d747a467dc5f
// Params 1, eflags: 0x4
// Checksum 0xd925d7ec, Offset: 0x2b9
// Size: 0x9e
function private function_781dae1420a6b622( activityinstance )
{
    var_1376e209398b4f33 = namespace_9085ae059032a84f::function_9461b89496773d9( activityinstance );
    origin = activity_instance_common::function_776ee11e7acc64a5( activityinstance );
    destroymoment = namespace_9085ae059032a84f::function_48f55085337a366f( activityinstance );
    
    if ( spatial_zone_container::function_3819f09eefb741e2( activityinstance, "Objective_Marker_Center_Zone" ) )
    {
        origin = spatial_zone_container::function_46a131256b075dc1( activityinstance, "Objective_Marker_Center_Zone" );
    }
    
    scriptable = activity_scriptables::function_e54570745bff582e( activityinstance, var_1376e209398b4f33, origin, destroymoment );
    var_e7b6adbe385c7c18 = function_238da7a43b91b2b6( "Scriptable", scriptable );
    activityinstance.var_e7b6adbe385c7c18 = var_e7b6adbe385c7c18;
}

