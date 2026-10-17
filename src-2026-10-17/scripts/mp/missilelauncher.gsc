#using script_30a611dc97bb45c;
#using script_3528d80049ffbcc0;
#using scripts\common\utility;

#namespace missilelauncher;

// Namespace missilelauncher
// Params 0, eflags: 0x1
// Checksum 0x14f792a5, Offset: 0x76
// Size: 0x20
function autoexec main()
{
    utility::registersharedfunc( #"missile_launcher", #"stingoffsetsgamemodespecific", &stingtargstruct_getoffsetsmp );
}

// Namespace missilelauncher
// Params 0
// Checksum 0x8cb01870, Offset: 0x9e
// Size: 0x242, Type: bool
function stingtargstruct_getoffsetsmp()
{
    if ( entity::ischoppergunner( self.target ) )
    {
        self.offsets[ self.offsets.size ] = ( 0, 0, -50 );
        self.useoldlosverification = 0;
        return true;
    }
    else if ( entity::issupporthelo( self.target ) )
    {
        self.offsets[ self.offsets.size ] = ( 0, 0, -100 );
        self.useoldlosverification = 0;
        return true;
    }
    else if ( entity::isgunship( self.target ) )
    {
        self.offsets[ self.offsets.size ] = ( 0, 0, 50 );
        self.useoldlosverification = 0;
        return true;
    }
    else if ( entity::isclusterstrike( self.target ) )
    {
        self.offsets[ self.offsets.size ] = ( 0, 0, 40 );
        self.useoldlosverification = 0;
        return true;
    }
    else if ( entity::isturret( self.target ) )
    {
        self.offsets[ self.offsets.size ] = ( 0, 0, 42 );
        self.offsets[ self.offsets.size ] = ( 0, 0, 5 );
        self.useoldlosverification = 0;
        return true;
    }
    else if ( entity::isradardrone( self.target ) )
    {
        self.offsets[ self.offsets.size ] = ( 0, 0, 10 );
        self.useoldlosverification = 0;
        return true;
    }
    else if ( entity::isassaultdrone( self.target ) )
    {
        self.offsets[ self.offsets.size ] = ( 0, 0, 10 );
        self.useoldlosverification = 0;
        return true;
    }
    else if ( entity::isradarhelicopter( self.target ) )
    {
        self.offsets[ self.offsets.size ] = ( 0, 0, -30 );
        self.useoldlosverification = 0;
        return true;
    }
    
    return false;
}

// Namespace missilelauncher
// Params 1
// Checksum 0x24fd3a91, Offset: 0x2e9
// Size: 0x258
function function_3e9fa6cef9029162( jackal )
{
    jackal endon( #"death" );
    spheresize = 50;
    
    while ( true )
    {
        forward = anglestoforward( jackal.angles );
        right = anglestoright( jackal.angles );
        up = anglestoup( jackal.angles );
        origin = jackal.origin;
        centerpos = jackal.origin;
        centerpos += up * getdvarfloat( @"hash_ad918199a0825d3a", 0 );
        frontpos = origin;
        frontpos += forward * getdvarfloat( @"jackal_f", 0 );
        frontpos += up * getdvarfloat( @"jackal_f_up", 0 );
        backpos = origin;
        backpos += -1 * forward * getdvarfloat( @"jackal_b", 0 );
        backpos += up * getdvarfloat( @"jackal_b_up", 0 );
        leftpos = origin;
        leftpos += -1 * right * getdvarfloat( @"jackal_lr", 0 );
        leftpos += -1 * forward * getdvarfloat( @"jackal_lr_back", 0 );
        leftpos += up * getdvarfloat( @"jackal_lr_up", 0 );
        rightpos = origin;
        rightpos += right * getdvarfloat( @"jackal_lr", 0 );
        rightpos += -1 * forward * getdvarfloat( @"jackal_lr_back", 0 );
        rightpos += up * getdvarfloat( @"jackal_lr_up", 0 );
        thread debug::drawsphere( centerpos, spheresize, 0.05, ( 1, 0, 0 ) );
        thread debug::drawsphere( frontpos, spheresize, 0.05, ( 1, 0, 0 ) );
        thread debug::drawsphere( backpos, spheresize, 0.05, ( 1, 0, 0 ) );
        thread debug::drawsphere( leftpos, spheresize, 0.05, ( 1, 0, 0 ) );
        thread debug::drawsphere( rightpos, spheresize, 0.05, ( 1, 0, 0 ) );
        waitframe();
    }
}

// Namespace missilelauncher
// Params 1
// Checksum 0x1a6ba4e4, Offset: 0x549
// Size: 0xd8
function function_b0868ebfa2f14cff( supertrophy )
{
    supertrophy endon( #"death" );
    spheresize = 4;
    
    while ( true )
    {
        up = anglestoup( supertrophy.angles );
        origin = supertrophy.origin;
        toppos = origin;
        toppos += up * getdvarfloat( @"hash_9b2345c5373f7e68", 0 );
        botpos = origin;
        botpos += up * getdvarfloat( @"hash_a6d283ccfd72e0d2", 0 );
        thread debug::drawsphere( toppos, spheresize, 0.05, ( 1, 0, 0 ) );
        thread debug::drawsphere( botpos, spheresize, 0.05, ( 1, 0, 0 ) );
        waitframe();
    }
}

// Namespace missilelauncher
// Params 1
// Checksum 0xce4b33ad, Offset: 0x629
// Size: 0x9b
function function_7f0477b09a9e68da( microturret )
{
    microturret endon( #"death" );
    spheresize = 4;
    
    while ( true )
    {
        up = anglestoup( microturret.angles );
        origin = microturret.origin;
        centerpos = origin;
        centerpos += up * getdvarfloat( @"hash_c3840a33843aa1f2", 0 );
        thread debug::drawsphere( centerpos, spheresize, 0.05, ( 1, 0, 0 ) );
        waitframe();
    }
}

// Namespace missilelauncher
// Params 1
// Checksum 0x7de762e7, Offset: 0x6cc
// Size: 0xd8
function function_76a07c77182c077f( shocksentry )
{
    shocksentry endon( #"death" );
    spheresize = 4;
    
    while ( true )
    {
        up = anglestoup( shocksentry.angles );
        origin = shocksentry.origin;
        toppos = origin;
        toppos += up * getdvarfloat( @"hash_5a2bc3bd648b860c", 0 );
        botpos = origin;
        botpos += up * getdvarfloat( @"hash_9bb2d0feba0e1fde", 0 );
        thread debug::drawsphere( toppos, spheresize, 0.05, ( 1, 0, 0 ) );
        thread debug::drawsphere( botpos, spheresize, 0.05, ( 1, 0, 0 ) );
        waitframe();
    }
}

