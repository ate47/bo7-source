#namespace backpack;

// Namespace backpack
// Params 1
// Checksum 0x713e5a11, Offset: 0xa6
// Size: 0xa2
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
    self notify( #"hash_3d0cee7f594f67ed" );
}

// Namespace backpack
// Params 0
// Checksum 0xd536e807, Offset: 0x150
// Size: 0x77
function detachbag()
{
    assert( isplayer( self ), "<dev string:x5f>" );
    
    if ( !level.gametypebundle.showbackpack || !isdefined( self.attached_bag ) )
    {
        return;
    }
    
    self detach( self.attached_bag, "tag_stowed_back3" );
    self.var_93f641b22a146494 = self.attached_bag;
    self.attached_bag = undefined;
    self notify( #"hash_bd51c09475b9c46b" );
}

