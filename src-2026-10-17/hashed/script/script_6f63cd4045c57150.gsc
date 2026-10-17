#using script_493b50b7b643c1cb;
#using scripts\common\utility;

#namespace br_anims;

// Namespace br_anims
// Params 0, eflags: 0x5
// Checksum 0x9d68adf, Offset: 0x76
// Size: 0x20
function private autoexec function_ed01b1192a45ba0d()
{
    utility::registersharedfunc( #"br", #"animsinit", &init );
}

// Namespace br_anims
// Params 0
// Checksum 0x6a4836d1, Offset: 0x9e
// Size: 0x17
function init()
{
    level.var_d98e7957aed6acf1 = &function_faccffe15b0719f9;
    fulton::fulton_initanims();
}

// Namespace br_anims
// Params 1
// Checksum 0xa2b076d6, Offset: 0xbd
// Size: 0x2f
function function_faccffe15b0719f9( animname )
{
    if ( !isdefined( level.br_anim[ animname ] ) )
    {
        return 0;
    }
    
    return getanimlength( level.br_anim[ animname ] );
}

