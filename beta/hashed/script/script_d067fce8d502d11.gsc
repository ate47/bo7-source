#namespace backpack;

// Namespace backpack
// Params 1
// Checksum 0xcef0e984, Offset: 0xdb
// Size: 0x9e
function attachbag( bagmodel )
{
    assert( isplayer( self ), "<dev string:x24>" );
    
    if ( !level.gametypebundle.showbackpack )
    {
        return;
    }
    
    if ( isdefined( self.attached_bag ) )
    {
        detachbag();
    }
    
    self attach( bagmodel, "tag_stowed_back3", 1, 1 );
    
    if ( !isdefined( self.operatorcustomization.body ) )
    {
        if ( self tagexists( "TAG_STOWED_BACKPACK_HIDE" ) )
        {
            self hidepart( "TAG_STOWED_BACKPACK_HIDE" );
        }
    }
    
    self.attached_bag = bagmodel;
    self notify( "backpack_attachbag" );
}

// Namespace backpack
// Params 0
// Checksum 0x2bdc361c, Offset: 0x181
// Size: 0x61
function detachbag()
{
    assert( isplayer( self ), "<dev string:x62>" );
    
    if ( !level.gametypebundle.showbackpack || !isdefined( self.attached_bag ) )
    {
        return;
    }
    
    self detach( self.attached_bag, "tag_stowed_back3" );
    self.attached_bag = undefined;
    self notify( "backpack_detachbag" );
}

