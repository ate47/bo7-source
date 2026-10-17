#using scripts\common\callbacks;

#namespace specialty_expanded_minimap;

// Namespace specialty_expanded_minimap
// Params 0, eflags: 0x1
// Checksum 0x9fd4715, Offset: 0xeb
// Size: 0x18
function autoexec preinit()
{
    level callback::add( #"register_perk", &registerspecialty );
}

// Namespace specialty_expanded_minimap
// Params 1
// Checksum 0x2ffdc6f8, Offset: 0x10b
// Size: 0x3a
function registerspecialty( params )
{
    if ( isdefined( params.var_bf34439fc0ca3cec ) )
    {
        level [[ params.var_a2358848c4408242 ]]( "specialty_expanded_minimap", &setspecialty, &unsetspecialty, [] );
    }
}

// Namespace specialty_expanded_minimap
// Params 0
// Checksum 0x419dd432, Offset: 0x14d
// Size: 0x72
function setspecialty()
{
    self.var_96fbcffb1397c172 = self.var_9842326056fd7207.var_96fbcffb1397c172 ?? 1;
    self.var_aaad5cd4d2512022 = self.var_9842326056fd7207.var_aaad5cd4d2512022 ?? 1;
    self setclientomnvar( "ui_specialty_expanded_minimap_map_scale", self.var_96fbcffb1397c172 );
    self setclientomnvar( "ui_specialty_expanded_minimap_icon_scale", self.var_aaad5cd4d2512022 );
}

// Namespace specialty_expanded_minimap
// Params 0
// Checksum 0x8a9ee54e, Offset: 0x1c7
// Size: 0x46
function unsetspecialty()
{
    self.var_96fbcffb1397c172 = 1;
    self.var_aaad5cd4d2512022 = 1;
    self setclientomnvar( "ui_specialty_expanded_minimap_map_scale", self.var_96fbcffb1397c172 );
    self setclientomnvar( "ui_specialty_expanded_minimap_icon_scale", self.var_aaad5cd4d2512022 );
}

