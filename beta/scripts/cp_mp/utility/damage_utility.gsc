#namespace damage_utility;

// Namespace damage_utility
// Params 4
// Checksum 0x8cb195f5, Offset: 0x2d6
// Size: 0xde
function adddamagemodifier( id, modifier, additive, ignorefunc )
{
    if ( !isdefined( additive ) )
    {
        additive = 1;
    }
    
    if ( additive )
    {
        if ( !isdefined( self.additivedamagemodifiers ) )
        {
            self.additivedamagemodifiers = [];
        }
        
        self.additivedamagemodifiers[ id ] = modifier;
        
        if ( isdefined( ignorefunc ) )
        {
            if ( !isdefined( self.additivedamagemodifierignorefuncs ) )
            {
                self.additivedamagemodifierignorefuncs = [];
            }
            
            self.additivedamagemodifierignorefuncs[ id ] = ignorefunc;
        }
        
        return;
    }
    
    if ( !isdefined( self.multiplicativedamagemodifiers ) )
    {
        self.multiplicativedamagemodifiers = [];
    }
    
    self.multiplicativedamagemodifiers[ id ] = modifier;
    
    if ( isdefined( ignorefunc ) )
    {
        if ( !isdefined( self.multiplicativedamagemodifierignorefuncs ) )
        {
            self.multiplicativedamagemodifierignorefuncs = [];
        }
        
        self.multiplicativedamagemodifierignorefuncs[ id ] = ignorefunc;
    }
}

// Namespace damage_utility
// Params 2
// Checksum 0xa65b86dd, Offset: 0x3bc
// Size: 0x94
function removedamagemodifier( id, additive )
{
    if ( !isdefined( additive ) )
    {
        additive = 1;
    }
    
    if ( additive )
    {
        if ( !isdefined( self.additivedamagemodifiers ) )
        {
            return;
        }
        
        self.additivedamagemodifiers[ id ] = undefined;
        
        if ( !isdefined( self.additivedamagemodifierignorefuncs ) )
        {
            return;
        }
        
        self.additivedamagemodifierignorefuncs[ id ] = undefined;
        return;
    }
    
    if ( !isdefined( self.multiplicativedamagemodifiers ) )
    {
        return;
    }
    
    self.multiplicativedamagemodifiers[ id ] = undefined;
    
    if ( !isdefined( self.multiplicativedamagemodifierignorefuncs ) )
    {
        return;
    }
    
    self.multiplicativedamagemodifierignorefuncs[ id ] = undefined;
}

// Namespace damage_utility
// Params 7
// Checksum 0x73708b98, Offset: 0x458
// Size: 0x1ca
function getdamagemodifiertotal( inflictor, attacker, victim, damage, meansofdeath, objweapon, hitloc )
{
    additivetotal = 1;
    
    if ( isdefined( self.additivedamagemodifiers ) )
    {
        foreach ( index, modifier in self.additivedamagemodifiers )
        {
            ignoremodifier = 0;
            
            if ( isdefined( self.additivedamagemodifierignorefuncs[ index ] ) )
            {
                ignoremodifier = [[ self.additivedamagemodifierignorefuncs[ index ] ]]( inflictor, attacker, victim, damage, meansofdeath, objweapon, hitloc );
            }
            
            if ( !ignoremodifier )
            {
                additivetotal += modifier - 1;
            }
        }
    }
    
    var_b708aeb049a91d7e = 1;
    
    if ( isdefined( self.multiplicativedamagemodifiers ) )
    {
        foreach ( index, modifier in self.multiplicativedamagemodifiers )
        {
            ignoremodifier = 0;
            
            if ( isdefined( self.multiplicativedamagemodifierignorefuncs[ index ] ) )
            {
                ignoremodifier = [[ self.multiplicativedamagemodifierignorefuncs[ index ] ]]( inflictor, attacker, victim, damage, meansofdeath, objweapon, hitloc );
            }
            
            if ( !ignoremodifier )
            {
                var_b708aeb049a91d7e *= modifier;
            }
        }
    }
    
    return additivetotal * var_b708aeb049a91d7e;
}

// Namespace damage_utility
// Params 0
// Checksum 0xf8692c58, Offset: 0x62b
// Size: 0x2a
function cleardamagemodifiers()
{
    self.additivedamagemodifiers = [];
    self.multiplicativedamagemodifiers = [];
    self.additivedamagemodifierignorefuncs = [];
    self.multiplicativedamagemodifierignorefuncs = [];
}

// Namespace damage_utility
// Params 16
// Checksum 0x34fbe4d8, Offset: 0x65d
// Size: 0x1ab
function packdamagedata( attacker, victim, damage, objweapon, meansofdeath, inflictor, point, direction_vec, modelname, attachtagname, partname, tagname, idflags, eventid, hitloc, lightarmordamage )
{
    struct = { #lightarmordamage:lightarmordamage, #hitloc:hitloc, #eventid:eventid, #damageflags:idflags, #idflags:idflags, #tagname:tagname, #partname:partname, #attachtagname:attachtagname, #modelname:modelname, #direction_vec:direction_vec ?? ( 0, 0, 0 ), #point:point ?? ( 0, 0, 0 ), #inflictor:inflictor, #meansofdeath:meansofdeath ?? "MOD_UNKNOWN", #objweapon:objweapon, #damage:damage, #victim:victim, #attacker:attacker };
    
    if ( isdefined( struct.attacker ) )
    {
        struct.attacker.assistedsuicide = 0;
    }
    
    return struct;
}

// Namespace damage_utility
// Params 3
// Checksum 0xe328afee, Offset: 0x811
// Size: 0x6d, Type: bool
function isstuckdamage( inflictor, meansofdeath, var_deb5f6e1deaf240d )
{
    if ( self.forcestuckdamage )
    {
        return true;
    }
    
    if ( isdefined( self.stuckbygrenade ) )
    {
        if ( inflictor == self.stuckbygrenade )
        {
            if ( var_deb5f6e1deaf240d )
            {
                return true;
            }
            else if ( isexplosivedamagemod( meansofdeath ) || meansofdeath == "MOD_FIRE" )
            {
                return true;
            }
        }
    }
    
    return false;
}

// Namespace damage_utility
// Params 1
// Checksum 0x277277d4, Offset: 0x887
// Size: 0x1d, Type: bool
function iscrossbowdamage( objweapon )
{
    return objweapon.basename == "iw9_dm_crossbow_mp";
}

// Namespace damage_utility
// Params 1
// Checksum 0x57f8679e, Offset: 0x8ad
// Size: 0x2c, Type: bool
function function_607262ae5e772af4( objweapon )
{
    return objweapon.basename == "iw9_dm_crossbow_mp" && objweapon hasattachment( "ammo_bolt_he" );
}

// Namespace damage_utility
// Params 1
// Checksum 0x6ae51231, Offset: 0x8e2
// Size: 0x2c, Type: bool
function function_5d5d34b1df1e383d( objweapon )
{
    return objweapon.basename == "iw9_dm_crossbow_mp" && objweapon hasattachment( "ammo_bolt_db" );
}

// Namespace damage_utility
// Params 1
// Checksum 0xb8203fa6, Offset: 0x917
// Size: 0x13c, Type: bool
function isstuckdamagekill( data )
{
    if ( self.nostuckdamagekill )
    {
        return false;
    }
    
    if ( !isstuckdamage( data.inflictor, data.meansofdeath, 0 ) )
    {
        return false;
    }
    
    if ( data.inflictor.var_b36f1004c0031c91 == 0 )
    {
        return false;
    }
    
    if ( issubstr( data.objweapon.basename, "molotov_mp" ) )
    {
        return false;
    }
    else if ( issubstr( data.objweapon.basename, "thermite_mp" ) )
    {
        return false;
    }
    else if ( issubstr( data.objweapon.basename, "thermite_ap_mp" ) )
    {
        return false;
    }
    else if ( issubstr( data.objweapon.basename, "thermite_av_mp" ) )
    {
        return false;
    }
    else if ( issubstr( data.objweapon.basename, "bunkerbuster_mp" ) )
    {
        return false;
    }
    else if ( issubstr( data.objweapon.basename, "bunkerbuster_burrowed_mp" ) )
    {
        return false;
    }
    
    return true;
}

// Namespace damage_utility
// Params 0
// Checksum 0x46404f15, Offset: 0xa5c
// Size: 0xd
function forcestuckdamage()
{
    self.forcestuckdamage = 1;
}

// Namespace damage_utility
// Params 0
// Checksum 0xff3dac78, Offset: 0xa71
// Size: 0xc
function forcestuckdamageclear()
{
    self.forcestuckdamage = undefined;
}

// Namespace damage_utility
// Params 4
// Checksum 0xe82b52d5, Offset: 0xa85
// Size: 0x60, Type: bool
function isheadshot( shitloc, smeansofdeath, attacker, validshot = validshotcheck( smeansofdeath, attacker ) )
{
    if ( !validshot )
    {
        return false;
    }
    
    if ( smeansofdeath == "MOD_GRENADE" )
    {
        return false;
    }
    
    return shitloc == "head" || shitloc == "helmet";
}

// Namespace damage_utility
// Params 1
// Checksum 0xb23ecf2a, Offset: 0xaee
// Size: 0x56, Type: bool
function function_5d1c04cbc4da6bc4( partname )
{
    switch ( partname ?? #"" )
    {
        case #"j_neck":
        case #"j_head":
        case #"tag_eye":
        case #"j_helmet":
            return true;
    }
    
    return false;
}

// Namespace damage_utility
// Params 2
// Checksum 0xc497e721, Offset: 0xb4d
// Size: 0xa7, Type: bool
function validshotcheck( smeansofdeath, attacker )
{
    if ( isdefined( attacker.owner ) )
    {
        switch ( attacker.code_classname )
        {
            case #"hash_3872eb7d97592cac":
            case #"hash_4af55147c6098215":
            case #"hash_81903cb95a447b8c":
                return false;
        }
    }
    
    switch ( smeansofdeath )
    {
        case #"hash_a5123f4d02745600":
        case #"hash_a911a1880d996edb":
        case #"hash_abb1587cdc6def23":
        case #"hash_b1078ff213fddba6":
        case #"hash_d8646db4e6ee3658":
            return false;
    }
    
    return true;
}

// Namespace damage_utility
// Params 4
// Checksum 0x76b31e77, Offset: 0xbfd
// Size: 0x5b, Type: bool
function istorsoshot( shitloc, smeansofdeath, attacker, validshot = validshotcheck( smeansofdeath, attacker ) )
{
    if ( !validshot )
    {
        return false;
    }
    
    return istorsouppershot( shitloc, smeansofdeath, attacker, validshot ) || function_fa01c95c6c80017a( shitloc, smeansofdeath, attacker, validshot );
}

// Namespace damage_utility
// Params 4
// Checksum 0xc48aeb6c, Offset: 0xc61
// Size: 0x53, Type: bool
function istorsouppershot( shitloc, smeansofdeath, attacker, validshot = validshotcheck( smeansofdeath, attacker ) )
{
    if ( !validshot )
    {
        return false;
    }
    
    return shitloc == "neck" || shitloc == "torso_upper";
}

// Namespace damage_utility
// Params 1
// Checksum 0xe222256c, Offset: 0xcbd
// Size: 0xaa, Type: bool
function function_facff8bb3d8f891b( partname )
{
    switch ( partname ?? #"" )
    {
        case #"j_chest":
        case #"j_spineupper":
        case #"j_clavicle_ri":
        case #"j_clavicle_le":
        case #"j_elbow_ri":
        case #"j_elbow_le":
        case #"j_wrist_ri":
        case #"j_wrist_le":
        case #"j_spine4":
        case #"j_shoulder_ri":
        case #"j_shoulder_le":
            return true;
    }
    
    return false;
}

// Namespace damage_utility
// Params 4
// Checksum 0x38138f38, Offset: 0xd70
// Size: 0x47, Type: bool
function function_fa01c95c6c80017a( shitloc, smeansofdeath, attacker, validshot = validshotcheck( smeansofdeath, attacker ) )
{
    if ( !validshot )
    {
        return false;
    }
    
    return shitloc == "torso_lower";
}

// Namespace damage_utility
// Params 1
// Checksum 0xcf217c70, Offset: 0xdc0
// Size: 0x3e, Type: bool
function function_b2a4878e3ff817a6( partname )
{
    switch ( partname ?? #"" )
    {
        case #"j_spinelower":
        case #"j_spinelower2":
            return true;
    }
    
    return false;
}

// Namespace damage_utility
// Params 3
// Checksum 0x4d7840ad, Offset: 0xe07
// Size: 0x45, Type: bool
function isarmshot( shitloc, smeansofdeath, attacker )
{
    if ( !validshotcheck( smeansofdeath, attacker ) )
    {
        return false;
    }
    
    return isrightarmshot( shitloc, smeansofdeath, attacker ) || isleftarmshot( shitloc, smeansofdeath, attacker );
}

// Namespace damage_utility
// Params 3
// Checksum 0x8a232080, Offset: 0xe55
// Size: 0x45, Type: bool
function isrightarmshot( shitloc, smeansofdeath, attacker )
{
    if ( !validshotcheck( smeansofdeath, attacker ) )
    {
        return false;
    }
    
    return function_b44f28c3d528a4a( shitloc, smeansofdeath, attacker ) || function_462b5d72062e80c1( shitloc, smeansofdeath, attacker );
}

// Namespace damage_utility
// Params 3
// Checksum 0x40571e1e, Offset: 0xea3
// Size: 0x45, Type: bool
function isleftarmshot( shitloc, smeansofdeath, attacker )
{
    if ( !validshotcheck( smeansofdeath, attacker ) )
    {
        return false;
    }
    
    return function_389f8e73c452ef7d( shitloc, smeansofdeath, attacker ) || function_b00a5e646e1b246a( shitloc, smeansofdeath, attacker );
}

// Namespace damage_utility
// Params 3
// Checksum 0x9b5475c5, Offset: 0xef1
// Size: 0x35, Type: bool
function function_b44f28c3d528a4a( shitloc, smeansofdeath, attacker )
{
    if ( !validshotcheck( smeansofdeath, attacker ) )
    {
        return false;
    }
    
    return shitloc == "right_arm_upper";
}

// Namespace damage_utility
// Params 3
// Checksum 0x8d05871, Offset: 0xf2f
// Size: 0x35, Type: bool
function function_389f8e73c452ef7d( shitloc, smeansofdeath, attacker )
{
    if ( !validshotcheck( smeansofdeath, attacker ) )
    {
        return false;
    }
    
    return shitloc == "left_arm_upper";
}

// Namespace damage_utility
// Params 3
// Checksum 0x49f11dcb, Offset: 0xf6d
// Size: 0x41, Type: bool
function function_462b5d72062e80c1( shitloc, smeansofdeath, attacker )
{
    if ( !validshotcheck( smeansofdeath, attacker ) )
    {
        return false;
    }
    
    return shitloc == "right_arm_lower" || shitloc == "right_hand";
}

// Namespace damage_utility
// Params 3
// Checksum 0xda7532b9, Offset: 0xfb7
// Size: 0x41, Type: bool
function function_b00a5e646e1b246a( shitloc, smeansofdeath, attacker )
{
    if ( !validshotcheck( smeansofdeath, attacker ) )
    {
        return false;
    }
    
    return shitloc == "left_arm_lower" || shitloc == "left_hand";
}

// Namespace damage_utility
// Params 3
// Checksum 0x78cc1d8f, Offset: 0x1001
// Size: 0x45, Type: bool
function islegshot( shitloc, smeansofdeath, attacker )
{
    if ( !validshotcheck( smeansofdeath, attacker ) )
    {
        return false;
    }
    
    return isrightlegshot( shitloc, smeansofdeath, attacker ) || isleftlegshot( shitloc, smeansofdeath, attacker );
}

// Namespace damage_utility
// Params 3
// Checksum 0xbf977c92, Offset: 0x104f
// Size: 0x45, Type: bool
function isrightlegshot( shitloc, smeansofdeath, attacker )
{
    if ( !validshotcheck( smeansofdeath, attacker ) )
    {
        return false;
    }
    
    return function_695b99288411f6a4( shitloc, smeansofdeath, attacker ) || function_5e3362cb238c2583( shitloc, smeansofdeath, attacker );
}

// Namespace damage_utility
// Params 3
// Checksum 0x75e35306, Offset: 0x109d
// Size: 0x45, Type: bool
function isleftlegshot( shitloc, smeansofdeath, attacker )
{
    if ( !validshotcheck( smeansofdeath, attacker ) )
    {
        return false;
    }
    
    return function_461caa7e312a3f2f( shitloc, smeansofdeath, attacker ) || function_9ba0500b00234c4( shitloc, smeansofdeath, attacker );
}

// Namespace damage_utility
// Params 3
// Checksum 0xaee02bc6, Offset: 0x10eb
// Size: 0x35, Type: bool
function function_695b99288411f6a4( shitloc, smeansofdeath, attacker )
{
    if ( !validshotcheck( smeansofdeath, attacker ) )
    {
        return false;
    }
    
    return shitloc == "right_leg_upper";
}

// Namespace damage_utility
// Params 3
// Checksum 0x3d6409b6, Offset: 0x1129
// Size: 0x35, Type: bool
function function_461caa7e312a3f2f( shitloc, smeansofdeath, attacker )
{
    if ( !validshotcheck( smeansofdeath, attacker ) )
    {
        return false;
    }
    
    return shitloc == "left_leg_upper";
}

// Namespace damage_utility
// Params 3
// Checksum 0x7c454953, Offset: 0x1167
// Size: 0x41, Type: bool
function function_5e3362cb238c2583( shitloc, smeansofdeath, attacker )
{
    if ( !validshotcheck( smeansofdeath, attacker ) )
    {
        return false;
    }
    
    return shitloc == "right_leg_lower" || shitloc == "right_foot";
}

// Namespace damage_utility
// Params 3
// Checksum 0xefc16ac9, Offset: 0x11b1
// Size: 0x41, Type: bool
function function_9ba0500b00234c4( shitloc, smeansofdeath, attacker )
{
    if ( !validshotcheck( smeansofdeath, attacker ) )
    {
        return false;
    }
    
    return shitloc == "left_leg_lower" || shitloc == "left_foot";
}

// Namespace damage_utility
// Params 3
// Checksum 0x383b0f81, Offset: 0x11fb
// Size: 0x65, Type: bool
function islefthandshot( shitloc, smeansofdeath, attacker )
{
    if ( !validshotcheck( smeansofdeath, attacker ) )
    {
        return false;
    }
    
    return shitloc == "right_hand" || shitloc == "left_hand" || shitloc == "right_arm_lower" || shitloc == "left_arm_lower" || shitloc == "gun";
}

// Namespace damage_utility
// Params 3
// Checksum 0x16457624, Offset: 0x1269
// Size: 0x65, Type: bool
function function_7fd412252b766245( shitloc, smeansofdeath, attacker )
{
    if ( !validshotcheck( smeansofdeath, attacker ) )
    {
        return false;
    }
    
    return shitloc == "right_hand" || shitloc == "left_hand" || shitloc == "right_arm_lower" || shitloc == "left_arm_lower" || shitloc == "gun";
}

// Namespace damage_utility
// Params 3
// Checksum 0xae3f8798, Offset: 0x12d7
// Size: 0x65, Type: bool
function ishandshot( shitloc, smeansofdeath, attacker )
{
    if ( !validshotcheck( smeansofdeath, attacker ) )
    {
        return false;
    }
    
    return shitloc == "right_hand" || shitloc == "left_hand" || shitloc == "right_arm_lower" || shitloc == "left_arm_lower" || shitloc == "gun";
}

// Namespace damage_utility
// Params 3
// Checksum 0xf84c4aa6, Offset: 0x1345
// Size: 0x35, Type: bool
function function_89505f1535b03678( shitloc, smeansofdeath, attacker )
{
    if ( !validshotcheck( smeansofdeath, attacker ) )
    {
        return false;
    }
    
    return shitloc == "right_foot";
}

// Namespace damage_utility
// Params 3
// Checksum 0xd6323cef, Offset: 0x1383
// Size: 0x35, Type: bool
function function_24e8c4f79eab4f63( shitloc, smeansofdeath, attacker )
{
    if ( !validshotcheck( smeansofdeath, attacker ) )
    {
        return false;
    }
    
    return shitloc == "left_foot";
}

// Namespace damage_utility
// Params 3
// Checksum 0xdcf037f3, Offset: 0x13c1
// Size: 0x41, Type: bool
function isfootshot( shitloc, smeansofdeath, attacker )
{
    if ( !validshotcheck( smeansofdeath, attacker ) )
    {
        return false;
    }
    
    return shitloc == "right_foot" || shitloc == "left_foot";
}

// Namespace damage_utility
// Params 3
// Checksum 0xa2d13f77, Offset: 0x140b
// Size: 0x35, Type: bool
function isneckshot( shitloc, smeansofdeath, attacker )
{
    if ( !validshotcheck( smeansofdeath, attacker ) )
    {
        return false;
    }
    
    return shitloc == "neck";
}

// Namespace damage_utility
// Params 3
// Checksum 0x3baabc9, Offset: 0x1449
// Size: 0xbf, Type: bool
function isupperbodyshot( shitloc, smeansofdeath, attacker )
{
    if ( !validshotcheck( smeansofdeath, attacker ) )
    {
        return false;
    }
    
    switch ( shitloc )
    {
        case #"hash_da51cc36a471058":
        case #"hash_1cbc508a2fe01b79":
        case #"hash_51d5d0b9add9cc5a":
        case #"hash_5d5aac570f6fd382":
        case #"hash_810a7426c8bac3ac":
        case #"hash_92bbfe494d03d772":
        case #"hash_a7980c387477e7bb":
        case #"hash_b275b50677dcf6cb":
        case #"hash_d42e71cd9f1e822f":
        case #"hash_da2f35145aa58933":
        case #"hash_fbb61fc356f3c75e":
            return true;
    }
    
    return false;
}

// Namespace damage_utility
// Params 3
// Checksum 0x679f4c8b, Offset: 0x1511
// Size: 0x83, Type: bool
function islowerbodyshot( shitloc, smeansofdeath, attacker )
{
    if ( !validshotcheck( smeansofdeath, attacker ) )
    {
        return false;
    }
    
    switch ( shitloc )
    {
        case #"hash_168c74e879f0ba11":
        case #"hash_1cbc508a2fe01b79":
        case #"hash_7b36142458a6c2d5":
        case #"hash_810a7426c8bac3ac":
        case #"hash_9536712388e65bce":
        case #"hash_a638fec9040cfcf4":
            return true;
    }
    
    return false;
}

// Namespace damage_utility
// Params 3
// Checksum 0xe605b046, Offset: 0x159d
// Size: 0x7c
function function_7c59274be5208560( attacker_angles, target_angles, threshold_angle )
{
    attacker_forward = vectornormalize( anglestoforward( attacker_angles ) );
    target_forward = vectornormalize( anglestoforward( target_angles ) );
    var_9d592b3c8ebdee3b = vectordot( attacker_forward, target_forward );
    threshold = cos( threshold_angle ) * -1;
    var_6b36a7cb674fe419 = var_9d592b3c8ebdee3b >= threshold;
    return var_6b36a7cb674fe419;
}

// Namespace damage_utility
// Params 1
// Checksum 0x22055571, Offset: 0x1622
// Size: 0x24, Type: bool
function function_9144ab79884c5758( objweapon )
{
    return isdefined( objweapon ) && objweapon.basename == "danger_circle_br";
}

// Namespace damage_utility
// Params 1
// Checksum 0xa48cb063, Offset: 0x164f
// Size: 0x3b
function register_vehicle_damage_callback( func )
{
    if ( !isdefined( level.var_6c2fb896a2ebe7d9 ) )
    {
        level.var_6c2fb896a2ebe7d9 = [];
    }
    
    level.var_6c2fb896a2ebe7d9[ level.var_6c2fb896a2ebe7d9.size ] = func;
}

