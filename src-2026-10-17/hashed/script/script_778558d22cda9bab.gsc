#using scripts\common\utility;

#namespace sat_ob_activity_scorpio_removal;

// Namespace sat_ob_activity_scorpio_removal
// Params 0, eflags: 0x1
// Checksum 0x7645d44a, Offset: 0x33b
// Size: 0x35
function autoexec init()
{
    utility::registersharedfunc( #"scorpio", #"remove_ents", &scorpio_remove );
    waittillframeend();
    
    if ( level.var_f101738a21c4e19 )
    {
        return;
    }
    
    scorpio_remove();
}

// Namespace sat_ob_activity_scorpio_removal
// Params 0, eflags: 0x4
// Checksum 0x31adf1ff, Offset: 0x378
// Size: 0xbc
function private function_6ea883a716590a21()
{
    var_6af9eb55dc6272f7 = [ "J_Ankle_LE_Geo_high", "J_Ankle_RI_Geo_high", "J_Elbow_LE_Geo_high", "J_Elbow_RI_Geo_high", "J_Head_Geo_high", "J_Hip_Geo_high", "J_Hip_LE_Geo_high", "J_Hip_RI_Geo_high", "J_Knee_LE_Geo_high", "J_Knee_RI_Geo_high", "J_Leg_Compress_LE_Geo_high", "J_Leg_Compress_RI_Geo_high", "J_Shoulder_LE_Geo_high", "J_Shoulder_RI_Geo_high", "J_Torso_01_Geo_high", "J_Torso_02_Geo_high", "J_Torso_03_Geo_high", "J_Wrist_LE_Geo_high", "J_Wrist_RI_Geo_high" ];
    return var_6af9eb55dc6272f7;
}

// Namespace sat_ob_activity_scorpio_removal
// Params 0, eflags: 0x4
// Checksum 0x6ef1c60b, Offset: 0x43d
// Size: 0xa1
function private get_scorpio_interior_volumes()
{
    scorpio_trigger_volumes = [];
    scorpio_trigger_volumes[ scorpio_trigger_volumes.size ] = getent( "ob_scorpio_interior_plate_01_trigger", #targetname );
    scorpio_trigger_volumes[ scorpio_trigger_volumes.size ] = getent( "ob_scorpio_interior_plate_02_trigger", #targetname );
    scorpio_trigger_volumes[ scorpio_trigger_volumes.size ] = getent( "ob_scorpio_interior_plate_03_trigger", #targetname );
    scorpio_trigger_volumes[ scorpio_trigger_volumes.size ] = getent( "scorpio_interior_portal_head_entrance", #targetname );
    scorpio_trigger_volumes[ scorpio_trigger_volumes.size ] = getent( "scorpio_interior_capacity_trigger", #targetname );
    scorpio_trigger_volumes[ scorpio_trigger_volumes.size ] = getent( "scorpio_interior_entrance_trigger", #targetname );
    return scorpio_trigger_volumes;
}

// Namespace sat_ob_activity_scorpio_removal
// Params 0, eflags: 0x4
// Checksum 0xf8794b31, Offset: 0x4e7
// Size: 0x206
function private scorpio_remove()
{
    var_6af9eb55dc6272f7 = function_6ea883a716590a21();
    
    foreach ( value in var_6af9eb55dc6272f7 )
    {
        clip_ents = getentarray( tolower( value ), #script_noteworthy );
        
        foreach ( clip_ent in clip_ents )
        {
            clip_ent delete();
        }
    }
    
    scorpio_trigger_volumes = get_scorpio_interior_volumes();
    
    foreach ( clean_up in scorpio_trigger_volumes )
    {
        clean_up delete();
    }
    
    var_a0afda31cafd96c4 = getentarray( "scorpio_foot_portal_entrance", #targetname );
    
    foreach ( clean_up in var_a0afda31cafd96c4 )
    {
        clean_up delete();
    }
}

