#using scripts\asm\asm;
#using scripts\common\callbacks;

#namespace namespace_9f5c84ee2daca21b;

// Namespace namespace_9f5c84ee2daca21b
// Params 0
// Checksum 0xa674b2e0, Offset: 0xa4
// Size: 0x22
function init_idle_global()
{
    callback::get_template( self.animsetname ) callback::add( "on_is_crawling_changed", &idle_on_is_crawling_changed );
}

// Namespace namespace_9f5c84ee2daca21b
// Params 1, eflags: 0x4
// Checksum 0x46a0ab31, Offset: 0xce
// Size: 0x21
function private idle_on_is_crawling_changed( params )
{
    asm::asm_fireevent_internal( self.asmname, "loop_reroll_anim" );
}

