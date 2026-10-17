#using script_2fe74ee229c972c3;
#using scripts\common\callbacks;
#using scripts\common\utility;

#namespace skill_heal_faster;

// Namespace skill_heal_faster
// Params 0, eflags: 0x1
// Checksum 0x89365f78, Offset: 0x76
// Size: 0x17
function autoexec main()
{
    shared_skills::function_b667da63ece9b966( #"heal_faster", &init );
}

// Namespace skill_heal_faster
// Params 0
// Checksum 0x65d7c183, Offset: 0x95
// Size: 0x3e
function init()
{
    utility::registersharedfunc( #"heal_faster", #"ongiveskill", &function_fcbe0a248afcdb76 );
    utility::registersharedfunc( #"heal_faster", #"hash_4aa03f4559ac50a5", &function_b572c791e3588669 );
}

// Namespace skill_heal_faster
// Params 1
// Checksum 0xcdc2982d, Offset: 0xdb
// Size: 0x50, Type: bool
function function_fcbe0a248afcdb76( skill_bundle )
{
    self.var_ff6fdb8f310ca2bc = { #bundle:skill_bundle };
    
    if ( !callback::exists( #"hash_6a8a551945faab9", &function_98aeb207057c1d96 ) )
    {
        callback::add( #"hash_6a8a551945faab9", &function_98aeb207057c1d96 );
    }
    
    return true;
}

// Namespace skill_heal_faster
// Params 1
// Checksum 0xfdf3d20f, Offset: 0x134
// Size: 0x2b
function function_b572c791e3588669( skill_bundle )
{
    self.var_ff6fdb8f310ca2bc = undefined;
    callback::remove( #"hash_6a8a551945faab9", &function_98aeb207057c1d96 );
}

// Namespace skill_heal_faster
// Params 1
// Checksum 0x9307ad84, Offset: 0x167
// Size: 0x53
function function_98aeb207057c1d96( params )
{
    skill_data = self.var_ff6fdb8f310ca2bc;
    
    if ( skill_data )
    {
        params.var_2b32a8de075bfd54 *= skill_data.bundle.var_a1a8cdc11c5e8b81;
    }
}

