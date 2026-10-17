#using script_1aae2eb1ef28b239;
#using scripts\common\omnvar_utility;

#namespace activity_ui;

// Namespace activity_ui
// Params 1
// Checksum 0x8f935ce9, Offset: 0x76
// Size: 0x8f
function function_14f2860d96cf2c0f( players )
{
    if ( !players )
    {
        players = self.playerparticipants;
    }
    
    foreach ( player in players )
    {
        function_ebdfc6d4c5e71e5f( player );
    }
}

// Namespace activity_ui
// Params 1, eflags: 0x4
// Checksum 0x8d3514df, Offset: 0x10d
// Size: 0xaa
function private function_ebdfc6d4c5e71e5f( player )
{
    var_7c698b8c97c7c92c = self.var_7c698b8c97c7c92c ?? [];
    
    foreach ( var_becab4b3dbe49e57 in var_7c698b8c97c7c92c )
    {
        storedomnvarvalue = activity_instance_common::function_cbd9eccae7248167( self, var_becab4b3dbe49e57 );
        player omnvar_utility::setcachedclientomnvar( var_becab4b3dbe49e57, storedomnvarvalue );
    }
}

// Namespace activity_ui
// Params 1
// Checksum 0x412f5dec, Offset: 0x1bf
// Size: 0x8f
function function_9b636510b59558bf( players )
{
    if ( !players )
    {
        players = self.playerparticipants;
    }
    
    foreach ( player in players )
    {
        thread function_dc29190b90001ec1( player );
    }
}

// Namespace activity_ui
// Params 1, eflags: 0x4
// Checksum 0xe34539c4, Offset: 0x256
// Size: 0xb0
function private function_dc29190b90001ec1( player )
{
    var_7c698b8c97c7c92c = self.var_7c698b8c97c7c92c ?? [];
    
    foreach ( var_becab4b3dbe49e57 in var_7c698b8c97c7c92c )
    {
        var_765c01d406239902 = activity_instance_common::function_36c2913457195db6( self, var_becab4b3dbe49e57 );
        
        if ( isdefined( var_765c01d406239902 ) )
        {
            player omnvar_utility::setcachedclientomnvar( var_becab4b3dbe49e57, var_765c01d406239902 );
        }
    }
}

