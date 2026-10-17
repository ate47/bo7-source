#using script_16ea1b94f0f381b3;
#using scripts\common\callbacks;
#using scripts\common\utility;

#namespace zombie_abom_crawler_deploy;

// Namespace zombie_abom_crawler_deploy
// Params 2
// Checksum 0xc2b8cbbf, Offset: 0xee
// Size: 0x64
function ZombieAbomShouldCrawlerDeploy( taskid, params )
{
    if ( self function_c607805e62ad17af() < 2000 )
    {
        return anim.failure;
    }
    
    self.abom_crawlers = function_46f9072493651dc9( self.abom_crawlers );
    
    if ( self.abom_crawlers.size < 5 )
    {
        return anim.success;
    }
    
    return anim.failure;
}

// Namespace zombie_abom_crawler_deploy
// Params 2
// Checksum 0x7b2a97f5, Offset: 0x15b
// Size: 0x97
function function_75ca857f74ffa83f( taskid, params )
{
    if ( !self.var_ef590d4074c114 )
    {
        return anim.failure;
    }
    
    if ( self.var_208dd1687f1032bd && gettime() - self.var_208dd1687f1032bd < self.var_ef590d4074c114 )
    {
        return anim.failure;
    }
    
    self.abom_crawlers = function_46f9072493651dc9( self.abom_crawlers );
    
    if ( self.abom_crawlers.size < 5 )
    {
        return anim.success;
    }
    
    return anim.failure;
}

// Namespace zombie_abom_crawler_deploy
// Params 0
// Checksum 0x9fd93eca, Offset: 0x1fb
// Size: 0x13
function init_zombie_abom_crawler_deploy()
{
    self.abom_crawlers = [];
    thread function_ef893f4fcdd967ca();
}

// Namespace zombie_abom_crawler_deploy
// Params 0, eflags: 0x4
// Checksum 0x8581f0be, Offset: 0x216
// Size: 0x46
function private function_ef893f4fcdd967ca()
{
    self endon( #"death" );
    
    while ( true )
    {
        self waittill( #"start_crawler_deploy" );
        
        if ( isdefined( self.enemy ) )
        {
            self getenemyinfo( self.enemy );
        }
        
        thread function_5749898cbd01c557();
    }
}

// Namespace zombie_abom_crawler_deploy
// Params 0, eflags: 0x4
// Checksum 0xe347b111, Offset: 0x264
// Size: 0x47
function private function_5749898cbd01c557()
{
    self endon( #"death" );
    self endon( #"start_crawler_deploy" );
    
    while ( true )
    {
        self waittill( #"spawn_crawler" );
        
        if ( self.abom_crawlers.size < 5 )
        {
            abom_spawn_crawler();
        }
        
        waitframe();
    }
}

// Namespace zombie_abom_crawler_deploy
// Params 0, eflags: 0x4
// Checksum 0xae5e1c54, Offset: 0x2b3
// Size: 0x1c2
function private abom_spawn_crawler()
{
    aitypes = namespace_9d8e359c3b1041e5::get_aitype_by_subclass_sharedfunc( self.zombieaisettings.var_d3de1a9faac42deb.crawlersubclass );
    assert( aitypes.size > 0 );
    base_aitype = undefined;
    
    foreach ( aitype in aitypes )
    {
        strlen = aitype.size;
        
        if ( !isdefined( base_aitype ) || base_aitype.size > strlen )
        {
            base_aitype = aitype;
        }
    }
    
    crawler_aitype = base_aitype;
    crawler = namespace_9d8e359c3b1041e5::spawnnewaitype_sharedfunc( crawler_aitype, self.origin, self.angles, self.team );
    
    if ( isdefined( crawler ) )
    {
        crawler thread namespace_9d8e359c3b1041e5::animscripted_sharedfunc( "spawn_abom_crawler", "spawn_end", undefined, undefined, "spawn_animating" );
        crawler.abom_parent = self;
        params = spawnstruct();
        params.zombie = crawler;
        crawler callback::callback( "on_abom_crawler_spawned", params );
        self.abom_crawlers[ self.abom_crawlers.size ] = crawler;
        
        if ( utility::flag( "level_stealth_initialized" ) && isdefined( self.enemy ) )
        {
            crawler aieventlistenerevent( "attack", self.enemy, self.enemy.origin );
        }
    }
}

