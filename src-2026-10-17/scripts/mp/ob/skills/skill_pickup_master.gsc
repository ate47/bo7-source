#using script_2fe74ee229c972c3;
#using scripts\common\callbacks;
#using scripts\common\utility;
#using scripts\mp\ammopouch;
#using scripts\mp\armor;

#namespace skill_pickup_master;

// Namespace skill_pickup_master
// Params 0, eflags: 0x1
// Checksum 0x1617ea02, Offset: 0x89
// Size: 0x17
function autoexec main()
{
    shared_skills::function_b667da63ece9b966( #"pickup_master", &init );
}

// Namespace skill_pickup_master
// Params 0
// Checksum 0x2d0db9bf, Offset: 0xa8
// Size: 0x3e
function init()
{
    utility::registersharedfunc( #"pickup_master", #"ongiveskill", &on_give_skill );
    utility::registersharedfunc( #"pickup_master", #"hash_4aa03f4559ac50a5", &function_c51f1692ecb73bfe );
}

// Namespace skill_pickup_master
// Params 1, eflags: 0x4
// Checksum 0x8eb8a098, Offset: 0xee
// Size: 0x98, Type: bool
function private on_give_skill( skill_bundle )
{
    self.var_4070bb0225f6675d = { #bundle:skill_bundle };
    
    if ( skill_bundle.var_a131d1e8da57e12b )
    {
        assert( !callback::exists( #"player_item_pickup", &on_item_pickup ) );
        callback::add( #"player_item_pickup", &on_item_pickup );
    }
    else
    {
        assert( !callback::exists( #"give_armor_plates", &on_give_armor_plates ) );
        callback::add( #"give_armor_plates", &on_give_armor_plates );
    }
    
    return true;
}

// Namespace skill_pickup_master
// Params 1, eflags: 0x4
// Checksum 0xe976542e, Offset: 0x18f
// Size: 0x9f
function private function_c51f1692ecb73bfe( skill_bundle )
{
    /#
        InvalidOpCode( 0x5e, callback::exists( #"give_armor_plates", &on_give_armor_plates ), callback::exists( #"player_item_pickup", &on_item_pickup ) );
        // Unknown operator ( 0x5e, t11, PC )
    #/
    
    if ( callback::exists( #"player_item_pickup", &on_item_pickup ) )
    {
        callback::remove( #"player_item_pickup", &on_item_pickup );
    }
    
    if ( callback::exists( #"give_armor_plates", &on_give_armor_plates ) )
    {
        callback::remove( #"give_armor_plates", &on_give_armor_plates );
    }
    
    self.var_4070bb0225f6675d = undefined;
}

// Namespace skill_pickup_master
// Params 1, eflags: 0x4
// Checksum 0x14922b28, Offset: 0x236
// Size: 0x77
function private on_item_pickup( params )
{
    if ( level.var_c29d903007598945.ammopouchitem )
    {
        var_5e755c77bdad2f94 = "itemspawnentry:" + level.var_c29d903007598945.ammopouchitem;
        var_4cf8a9a5437c6516 = ammopouch::function_34cbf8d5ef381377();
        
        if ( var_5e755c77bdad2f94 == params.itembundlename && var_4cf8a9a5437c6516 )
        {
            auto_apply_plates( var_4cf8a9a5437c6516 );
        }
    }
}

// Namespace skill_pickup_master
// Params 1, eflags: 0x4
// Checksum 0xd04ab605, Offset: 0x2b5
// Size: 0x31
function private on_give_armor_plates( params )
{
    assert( params.var_a020da1150a5423e );
    auto_apply_plates( params.var_a020da1150a5423e );
}

// Namespace skill_pickup_master
// Params 1, eflags: 0x4
// Checksum 0xeb1e33cd, Offset: 0x2ee
// Size: 0xb4
function private auto_apply_plates( amount )
{
    bundle = self.var_4070bb0225f6675d.bundle;
    var_204029995c005e55 = bundle.var_1e9703bc542d4c9a ? o"ui_skill_pick_up_master_feedback" : undefined;
    armor::function_d6afc5a95480993d( amount, var_204029995c005e55 );
    
    if ( bundle.var_c4081f370a4f33bd )
    {
        self playsound( bundle.var_c4081f370a4f33bd );
    }
    
    if ( bundle.var_4bb3a1aa3c044964 && bundle.var_d3837cf5b1c6c5d7 )
    {
        self setscriptablepartstate( bundle.var_4bb3a1aa3c044964, bundle.var_d3837cf5b1c6c5d7, 1 );
    }
}

