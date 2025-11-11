#namespace bounding_overwatch;

// Namespace bounding_overwatch
// Params 1
// Checksum 0x40c69e74, Offset: 0xff
// Size: 0x92
function getfunction( funcid )
{
    switch ( funcid )
    {
        case #"hash_dab0d83df51da4d":
            return &onuserinit;
        case #"hash_722d767fd6d40f56":
            return &onuserterminate;
        case #"hash_a05c4b59049a1b76":
            return &holdcurrentground;
        case #"hash_b7e113799080c8":
            return &requestadvanceontarget;
        case #"hash_713dc5b1c250d91c":
            return &coveringfire;
        case #"hash_a3836dc7307ecb50":
            return &coveringfirecleanup;
    }
    
    assertmsg( "<dev string:x24>" + funcid );
}

// Namespace bounding_overwatch
// Params 1
// Checksum 0x309c853c, Offset: 0x199
// Size: 0xc
function onuserinit( interactionid )
{
    
}

// Namespace bounding_overwatch
// Params 1
// Checksum 0x2134ff11, Offset: 0x1ad
// Size: 0xc
function onuserterminate( interactionid )
{
    
}

// Namespace bounding_overwatch
// Params 2
// Checksum 0xdec2a5f6, Offset: 0x1c1
// Size: 0x1b
function requestadvanceontarget( statename, params )
{
    self function_cedf61b0dfaffb1e();
}

// Namespace bounding_overwatch
// Params 2
// Checksum 0x7711e39b, Offset: 0x1e4
// Size: 0x33
function holdcurrentground( statename, params )
{
    if ( params[ 0 ] )
    {
        self.var_35542af41640c932 = 1;
        return;
    }
    
    self.var_35542af41640c932 = 0;
}

// Namespace bounding_overwatch
// Params 2
// Checksum 0x96d5ba9c, Offset: 0x21f
// Size: 0x8e
function coveringfire( statename, params )
{
    self.maxfaceenemydistcache = self.maxfaceenemydist;
    self.maxfaceenemydist = 2048;
    var_689157bc40450e50 = 3000;
    var_819551943d7cf102 = gettime() + 10000;
    self.balwayscoverexposed = 1;
    self.providecoveringfire = 1;
    self.bulletsinclip = weaponclipsize( self.weapon );
    self.shootstyleoverride = "full";
}

// Namespace bounding_overwatch
// Params 2
// Checksum 0xb8dfeb24, Offset: 0x2b5
// Size: 0x4f
function coveringfirecleanup( statename, params )
{
    self.maxfaceenemydist = self.maxfaceenemydistcache;
    self.maxfaceenemydistcache = undefined;
    self.balwayscoverexposed = 0;
    self.providecoveringfire = 0;
    self.shootstyleoverride = undefined;
}

