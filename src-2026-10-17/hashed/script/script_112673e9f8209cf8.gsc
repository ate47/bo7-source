#namespace bt_util;

// Namespace bt_util
// Params 0
// Checksum 0xce5c2f6a, Offset: 0x76
// Size: 0x50
function init()
{
    if ( isdefined( level._btactions ) )
    {
        return;
    }
    
    level._btactions = [];
    anim.failure = 0;
    anim.success = 1;
    anim.running = 2;
    anim.skip = 3;
    anim.invalid = 4;
}

// Namespace bt_util
// Params 0
// Checksum 0x50a15e45, Offset: 0xce
// Size: 0x53
function bt_init()
{
    assert( !isdefined( self.bt ) );
    self.bt = spawnstruct();
    
    if ( isdefined( self.behaviortreeasset ) )
    {
        self btregistertreeinstance( self.behaviortreeasset );
    }
    
    self.bt.instancedata = [];
}

// Namespace bt_util
// Params 1
// Checksum 0x58fa0124, Offset: 0x129
// Size: 0x32
function bt_terminateandreplace( var_4dbe9811ad117b11 )
{
    self btterminatetreeinstance();
    
    if ( isdefined( var_4dbe9811ad117b11 ) )
    {
        self.behaviortreeasset = var_4dbe9811ad117b11;
        self btregistertreeinstance( self.behaviortreeasset );
    }
}

