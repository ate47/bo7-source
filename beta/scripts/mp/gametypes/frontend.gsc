#namespace frontend;

// Namespace frontend
// Params 0
// Checksum 0xacbd258, Offset: 0x80
// Size: 0xc6
function main()
{
    level.callbackstartgametype = &callback_frontendstartgametype;
    level.callbackplayerconnect = &callback_frontendplayeractive;
    level.callbackplayerconnect = &callback_frontendplayerconnect;
    level.callbackplayerdisconnect = &callback_frontendplayerdisconnect;
    level.callbackplayerdamage = &callback_frontendplayerdamage;
    level.callbackplayerimpaled = &callback_frontendplayerimpaled;
    level.var_8f62eac141f8bdb6 = &callback_frontendplayerlaunched;
    level.callbackplayerkilled = &callback_frontendplayerkilled;
    level.callbackplayerlaststand = &callback_frontendplayerlaststand;
    level.callbackplayermigrated = &callback_frontendplayermigrated;
    level.callbackhostmigration = &callback_frontendhostmigration;
    level.var_4524771918fe585f = &function_2c6a643803a34552;
    level.var_880cfcfec57ca836 = &function_58b6508d68b59f3f;
    level.var_16eab40d8f2ae445 = &function_b69d00f730747014;
}

// Namespace frontend
// Params 0
// Checksum 0x6ac7d6d5, Offset: 0x14e
// Size: 0x2
function callback_frontendstartgametype()
{
    
}

// Namespace frontend
// Params 0
// Checksum 0xc3d59575, Offset: 0x158
// Size: 0x2
function callback_frontendplayeractive()
{
    
}

// Namespace frontend
// Params 0
// Checksum 0xb0a04a94, Offset: 0x162
// Size: 0x2
function callback_frontendplayerconnect()
{
    
}

// Namespace frontend
// Params 1
// Checksum 0xce9c8eb3, Offset: 0x16c
// Size: 0xc
function callback_frontendplayerdisconnect( reason )
{
    
}

// Namespace frontend
// Params 15
// Checksum 0x37700345, Offset: 0x180
// Size: 0x8a
function callback_frontendplayerdamage( einflictor, eattacker, idamage, idflags, smeansofdeath, fdistance, objweapon, vpoint, vdir, shitloc, psoffsettime, modelindex, partname, var_2300d396e46c0fe7, var_cdd29ad5d1362c2 )
{
    
}

// Namespace frontend
// Params 10
// Checksum 0x8992c2c5, Offset: 0x212
// Size: 0x5d
function callback_frontendplayerimpaled( eattacker, objweapon, vpointclient, vpoint, vdir, shitloc, spartname, var_56243ba4fafee4a5, var_ea333e2537a8fa73, var_2e6727b4a3db5100 )
{
    
}

// Namespace frontend
// Params 5
// Checksum 0x2e331164, Offset: 0x277
// Size: 0x30
function callback_frontendplayerlaunched( eattacker, objweapon, vdir, magnitude, shitloc )
{
    
}

// Namespace frontend
// Params 10
// Checksum 0xac0b2252, Offset: 0x2af
// Size: 0x5d
function callback_frontendplayerkilled( einflictor, attacker, idamage, idflags, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration )
{
    
}

// Namespace frontend
// Params 10
// Checksum 0xdf2543f5, Offset: 0x314
// Size: 0x5d
function callback_frontendplayerlaststand( einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, var_61e4f4a3c7e15e02 )
{
    
}

// Namespace frontend
// Params 0
// Checksum 0xcba1c847, Offset: 0x379
// Size: 0xf
function callback_frontendplayermigrated()
{
    assertmsg( "<dev string:x24>" );
}

// Namespace frontend
// Params 0
// Checksum 0x532575c8, Offset: 0x390
// Size: 0xf
function callback_frontendhostmigration()
{
    assertmsg( "<dev string:x24>" );
}

// Namespace frontend
// Params 0
// Checksum 0x82717db8, Offset: 0x3a7
// Size: 0x2
function function_2c6a643803a34552()
{
    
}

// Namespace frontend
// Params 1
// Checksum 0x1231832d, Offset: 0x3b1
// Size: 0xc
function function_58b6508d68b59f3f( reason )
{
    
}

// Namespace frontend
// Params 2
// Checksum 0x58d6f5eb, Offset: 0x3c5
// Size: 0x15
function function_b69d00f730747014( achievementid, progressdata )
{
    
}

