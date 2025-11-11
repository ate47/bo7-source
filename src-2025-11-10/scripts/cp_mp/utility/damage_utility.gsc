#using scripts\common\turret;

#namespace damage_utility;

// Namespace damage_utility
// Params 4
// Checksum 0x6983357d, Offset: 0x2d8
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
// Checksum 0xa65b89ca, Offset: 0x3be
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
// Checksum 0x73708513, Offset: 0x45a
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
// Checksum 0x1d5b8888, Offset: 0x62d
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
// Checksum 0x8c2e6600, Offset: 0x65f
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
// Checksum 0x35f5f251, Offset: 0x813
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
// Checksum 0xe95bd97, Offset: 0x889
// Size: 0x1d, Type: bool
function iscrossbowdamage( objweapon )
{
    return objweapon.basename == "iw9_dm_crossbow_mp";
}

// Namespace damage_utility
// Params 1
// Checksum 0x4eaa0638, Offset: 0x8af
// Size: 0x2c, Type: bool
function function_607262ae5e772af4( objweapon )
{
    return objweapon.basename == "iw9_dm_crossbow_mp" && objweapon hasattachment( "ammo_bolt_he" );
}

// Namespace damage_utility
// Params 1
// Checksum 0x4166a8ec, Offset: 0x8e4
// Size: 0x2c, Type: bool
function function_5d5d34b1df1e383d( objweapon )
{
    return objweapon.basename == "iw9_dm_crossbow_mp" && objweapon hasattachment( "ammo_bolt_db" );
}

// Namespace damage_utility
// Params 1
// Checksum 0x159962a3, Offset: 0x919
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
// Checksum 0x8bdd6301, Offset: 0xa5e
// Size: 0xd
function forcestuckdamage()
{
    self.forcestuckdamage = 1;
}

// Namespace damage_utility
// Params 0
// Checksum 0x32a08050, Offset: 0xa73
// Size: 0xc
function forcestuckdamageclear()
{
    self.forcestuckdamage = undefined;
}

// Namespace damage_utility
// Params 4
// Checksum 0xf2a4f63, Offset: 0xa87
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
// Checksum 0xb23ec2ee, Offset: 0xaf0
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
// Checksum 0xed8805ff, Offset: 0xb4f
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
// Checksum 0xf2ef3f24, Offset: 0xbff
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
// Checksum 0xd1d9e879, Offset: 0xc63
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
// Checksum 0xe2222300, Offset: 0xcbf
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
// Checksum 0x6d94ffc8, Offset: 0xd72
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
// Checksum 0xcf217d28, Offset: 0xdc2
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
// Checksum 0xfda2e26c, Offset: 0xe09
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
// Checksum 0x20431910, Offset: 0xe57
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
// Checksum 0xea37296d, Offset: 0xea5
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
// Checksum 0x65462c2f, Offset: 0xef3
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
// Checksum 0x53be169d, Offset: 0xf31
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
// Checksum 0x7871d3a5, Offset: 0xf6f
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
// Checksum 0xe13bf905, Offset: 0xfb9
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
// Checksum 0xc816a92e, Offset: 0x1003
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
// Checksum 0x15f75252, Offset: 0x1051
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
// Checksum 0xdf83622f, Offset: 0x109f
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
// Checksum 0x73b3e746, Offset: 0x10ed
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
// Checksum 0x454bddf4, Offset: 0x112b
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
// Checksum 0x806963d0, Offset: 0x1169
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
// Checksum 0x19234970, Offset: 0x11b3
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
// Checksum 0x9c6d0c5a, Offset: 0x11fd
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
// Checksum 0xb21375eb, Offset: 0x126b
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
// Checksum 0xa698b87, Offset: 0x12d9
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
// Checksum 0x5df5c481, Offset: 0x1347
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
// Checksum 0xdc39ad22, Offset: 0x1385
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
// Checksum 0x9741f6cf, Offset: 0x13c3
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
// Checksum 0x66c33823, Offset: 0x140d
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
// Checksum 0xada327f0, Offset: 0x144b
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
// Checksum 0x2c2e8728, Offset: 0x1513
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
// Checksum 0x8f6d6e19, Offset: 0x159f
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
// Checksum 0x4a84227c, Offset: 0x1624
// Size: 0x24, Type: bool
function function_9144ab79884c5758( objweapon )
{
    return isdefined( objweapon ) && objweapon.basename == "danger_circle_br";
}

// Namespace damage_utility
// Params 1
// Checksum 0xa48ca2de, Offset: 0x1651
// Size: 0x3b
function register_vehicle_damage_callback( func )
{
    if ( !isdefined( level.var_6c2fb896a2ebe7d9 ) )
    {
        level.var_6c2fb896a2ebe7d9 = [];
    }
    
    level.var_6c2fb896a2ebe7d9[ level.var_6c2fb896a2ebe7d9.size ] = func;
}

// Namespace damage_utility
// Params 2
// Checksum 0xf22ab97d, Offset: 0x1694
// Size: 0x62
function function_f03cc5d85cc9cc1d( ent, team )
{
    if ( team && ent )
    {
        if ( !isdefined( level.var_ae2db33176ad5dec[ team ] ) )
        {
            level.var_ae2db33176ad5dec[ team ] = [];
        }
        
        level.var_ae2db33176ad5dec[ team ][ level.var_ae2db33176ad5dec[ team ].size ] = ent;
        turret::function_6697525b8034338a( ent );
    }
}

// Namespace damage_utility
// Params 1
// Checksum 0x3fd20c99, Offset: 0x16fe
// Size: 0x9c
function function_cf1c753aefa70ea1( team )
{
    a_ents = [];
    
    foreach ( var_5ac08216ddec16f0, ents in level.var_ae2db33176ad5dec )
    {
        if ( var_5ac08216ddec16f0 == team )
        {
            continue;
        }
        
        a_ents = arraycombine( a_ents, ents );
    }
    
    return a_ents;
}

// Namespace damage_utility
// Params 2
// Checksum 0xd09428b2, Offset: 0x17a3
// Size: 0x47
function function_b84e11c8ca9801fe( ent, team )
{
    if ( team && ent )
    {
        level.var_ae2db33176ad5dec[ team ] = arrayremove( level.var_ae2db33176ad5dec[ team ], ent );
        turret::function_c5399067c9aded68( ent );
    }
}

