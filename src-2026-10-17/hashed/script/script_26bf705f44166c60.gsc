#using script_6dfd03280678b65d;
#using scripts\common\callbacks;

#namespace namespace_cea28acaed2cadc3;

// Namespace namespace_cea28acaed2cadc3
// Params 0
// Checksum 0xdaad50b6, Offset: 0x9f
// Size: 0x22
function init_traverse_global()
{
    callback::get_template( self.animsetname ) callback::add( "on_is_crawling_changed", &traverse_on_is_crawling_changed );
}

// Namespace namespace_cea28acaed2cadc3
// Params 0
// Checksum 0x33348142, Offset: 0xc9
// Size: 0x22
function init_traverse()
{
    self.var_6528526395085bc = [];
    self.var_6528526395085bc[ "is_crawling" ] = zombie_base_dismemberment::is_crawling();
}

// Namespace namespace_cea28acaed2cadc3
// Params 1, eflags: 0x4
// Checksum 0x23faca7f, Offset: 0xf3
// Size: 0x26
function private traverse_on_is_crawling_changed( params )
{
    self.var_6528526395085bc[ "is_crawling" ] = int( zombie_base_dismemberment::is_crawling() );
}

