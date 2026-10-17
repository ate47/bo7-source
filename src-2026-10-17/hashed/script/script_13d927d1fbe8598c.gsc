#using scripts\common\callbacks;
#using scripts\common\utility;

#namespace namespace_de55c573adee23bd;

// Namespace namespace_de55c573adee23bd
// Params 0
// Checksum 0x51459cab, Offset: 0xe1
// Size: 0x13
function init_zombie_abom_melee()
{
    callback::add( "zombie_melee", &function_c3194a5c73cfdbc );
}

// Namespace namespace_de55c573adee23bd
// Params 1, eflags: 0x4
// Checksum 0xbf06f06c, Offset: 0xfc
// Size: 0x1cb
function private function_c3194a5c73cfdbc( params )
{
    if ( isplayer( params.meleehitent ) )
    {
        player = params.meleehitent;
        is_tail_whip = self asmgetcurrentstate( self.asmname ) == "tail_whip";
        
        if ( is_tail_whip )
        {
            player utility::knockback_flat( player.origin - self.origin, self.zombieaisettings.var_d3de1a9faac42deb.var_4b21328d748b4f09 );
            return;
        }
        
        utility::function_32b24db3127bff40( "melee", "melee" );
        player utility::function_32b24db3127bff40( "abomBiteVFX", "vfx_start" );
        player utility::knockback_flat( player.origin - self.origin, self.zombieaisettings.var_d3de1a9faac42deb.var_a49c21ad20f88853 );
        currtime = gettime();
        
        if ( self.var_68170d90ad1f853d != player || !isdefined( self.var_a43f5b8beade6401 ) || currtime - self.var_a43f5b8beade6401 > 2000 )
        {
            self.biteentcount = 0;
        }
        
        self.biteentcount++;
        self.var_a43f5b8beade6401 = currtime;
        self.var_68170d90ad1f853d = player;
        
        if ( self.biteentcount >= 3 || params.meleehitent.health <= 0 || params.meleehitent.inlaststand )
        {
            self.biteentcount = 0;
            self function_786bb6aa1b76c7ee( "roar_end_time", 1000 );
            self function_786bb6aa1b76c7ee( "multi_bite_roar_time", currtime + 3000 );
        }
    }
}

