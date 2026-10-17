#using script_11083f13727030d8;
#using scripts\common\callbacks;
#using scripts\common\utility;
#using scripts\mp\gametypes\ctdm;
#using scripts\mp\gametypes\dom;

#namespace ctdm_dom;

// Namespace ctdm_dom
// Params 0
// Checksum 0xd66310ac, Offset: 0x99
// Size: 0xf7
function main()
{
    utility::registersharedfunc( #"hash_12eb2ef3dcc95127", #"hash_4adc6144c2cf7283", &function_6c902ba5d9029f93 );
    utility::registersharedfunc( #"hash_12eb2ef3dcc95127", #"hash_f06070ee61d480db", &ctdm::initializematchrules );
    utility::registersharedfunc( #"hash_12eb2ef3dcc95127", #"hash_96b2e1747e0de2c3", &ctdm::onstartgametype );
    utility::registersharedfunc( #"hash_12eb2ef3dcc95127", #"hash_af791a0f7c476717", &ctdm::updategametypedvars );
    utility::registersharedfunc( #"hash_12eb2ef3dcc95127", #"hash_786092b78d9f50d0", &onplayerconnect );
    utility::registersharedfunc( #"hash_12eb2ef3dcc95127", #"hash_3200ef47334796e2", &function_b6356122cddd611b );
    level.var_74e022d392216526 = getdvarint( @"hash_fba5dd110bd9ab46", 0 );
    level.var_38fbee7174a3ef13 = getdvarint( @"hash_567d3ed41ea14b3", 1 );
    level.var_8a8634aee437d120 = 1;
    dom::main();
}

// Namespace ctdm_dom
// Params 0
// Checksum 0x12b4a706, Offset: 0x198
// Size: 0x5b
function function_6c902ba5d9029f93()
{
    level.onnormaldeath = &ctdm::onnormaldeath;
    level callback::add( #"hash_fa7263897b3164e", &ctdm::scoreeventcallback );
    ctdm::function_3160c3f47051cdc3();
    level.onsuicidedeath = &ctdm::onsuicidedeath;
    level.modeonspawnplayer = &ctdm::onspawnplayer;
    level.objectivehinttext = &"hash_56f05af5182bb750";
}

// Namespace ctdm_dom
// Params 1
// Checksum 0x91d3855c, Offset: 0x1fb
// Size: 0x5f
function onplayerconnect( player )
{
    player.combohighscore = 0;
    player stats::setextrascore4( player.pers[ "combo_score" ] ?? 0, "combo_score" );
    player stats::function_fe615555f60e88b9( player.pers[ "combo_high_score" ] ?? 0, "combo_high_score" );
}

// Namespace ctdm_dom
// Params 0
// Checksum 0x4437ef1e, Offset: 0x262
// Size: 0x5c
function function_b6356122cddd611b()
{
    level.var_f21454a57f19fe63[ level.var_f21454a57f19fe63.size ] = #"mode_dom_secure";
    level.var_f21454a57f19fe63[ level.var_f21454a57f19fe63.size ] = #"mode_dom_secure_neutral";
    level.var_f21454a57f19fe63[ level.var_f21454a57f19fe63.size ] = #"mode_dom_secure_b";
}

