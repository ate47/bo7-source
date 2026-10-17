#using script_4ca4a30b15eb95bb;
#using scripts\common\callbacks;

#namespace specialty_hard_shell;

// Namespace specialty_hard_shell
// Params 0, eflags: 0x1
// Checksum 0x6f6d7805, Offset: 0x8e
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_hard_shell
// Params 1
// Checksum 0x3cd73303, Offset: 0xae
// Size: 0x3a
function registerspecialty( params )
{
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_bf34439fc0ca3cec ]]( "specialty_hard_shell", &sethardshell, &unsethardshell, [] );
    }
}

// Namespace specialty_hard_shell
// Params 0
// Checksum 0x53a5376c, Offset: 0xf0
// Size: 0x32
function sethardshell()
{
    perks::function_70e4256c5fb41ada( "specialty_hard_shell" );
    self.shellshockreduction = self.var_9842326056fd7207.shellshockreduction ?? 0.25;
}

// Namespace specialty_hard_shell
// Params 0
// Checksum 0x230a1ca6, Offset: 0x12a
// Size: 0xc
function unsethardshell()
{
    self.shellshockreduction = undefined;
}

