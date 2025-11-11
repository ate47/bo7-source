#using scripts\anim\shared;
#using scripts\asm\asm_bb;
#using scripts\common\anim;
#using scripts\common\callbacks;
#using scripts\common\devgui;
#using scripts\common\dof;
#using scripts\common\values;
#using scripts\common\vehicle;
#using scripts\common\vehicle_code;
#using scripts\common\vehicle_paths;
#using scripts\engine\flags;
#using scripts\engine\math;
#using scripts\engine\trace;
#using scripts\engine\utility;

#namespace utility;

// Namespace utility
// Params 0
// Checksum 0xbd1249fd, Offset: 0xf1a
// Size: 0x86
function issp()
{
    if ( !isdefined( level.issp ) )
    {
        mapname = getdvar( @"g_mapname" );
        substring = "";
        
        for ( i = 0; i < min( mapname.size, 3 ) ; i++ )
        {
            substring += mapname[ i ];
        }
        
        level.issp = substring != "mp_" && substring != "zm_";
    }
    
    return level.issp;
}

// Namespace utility
// Params 0
// Checksum 0xa2680c9, Offset: 0xfa9
// Size: 0x3c, Type: bool
function ismp()
{
    return isstartstr( getdvar( @"g_mapname" ), "mp_" ) || isdefined( level.mapname ) && isstartstr( level.mapname, "mp_" );
}

// Namespace utility
// Params 0
// Checksum 0x6ca36886, Offset: 0xfee
// Size: 0x3c, Type: bool
function iszm()
{
    return isstartstr( getdvar( @"g_mapname" ), "zm_" ) || isdefined( level.mapname ) && isstartstr( level.mapname, "zm_" );
}

// Namespace utility
// Params 1
// Checksum 0x53f47f4c, Offset: 0x1033
// Size: 0x26, Type: bool
function function_c88d082fda96f51b( ent )
{
    if ( level.var_222eeb7fbf311452[ ent getentitynumber() ] === ent )
    {
        return true;
    }
    
    return false;
}

// Namespace utility
// Params 1
// Checksum 0x1ccdd4a0, Offset: 0x1062
// Size: 0x42
function function_68d5b3e37629956a( ent )
{
    if ( !isent( ent ) )
    {
        return;
    }
    
    if ( !isdefined( level.var_222eeb7fbf311452 ) )
    {
        level.var_222eeb7fbf311452 = [];
    }
    
    level.var_222eeb7fbf311452[ ent getentitynumber() ] = ent;
}

// Namespace utility
// Params 4
// Checksum 0xff9e5aba, Offset: 0x10ac
// Size: 0x34f
function make_weapon_model( basename, attachments, viewmodel, precache )
{
    if ( !isdefined( attachments ) )
    {
        attachments = [];
    }
    
    if ( !isdefined( viewmodel ) )
    {
        viewmodel = 0;
    }
    
    if ( isdefined( level.fnbuildweaponspecial ) && isdefined( [[ level.fnbuildweaponspecial ]]( basename ) ) )
    {
        weapon = [[ level.fnbuildweaponspecial ]]( basename );
    }
    else
    {
        weapon = [[ level.fnbuildweapon ]]( basename, attachments );
    }
    
    if ( isent( self ) && !isdefined( precache ) )
    {
        self setmodel( getweaponmodel( weapon ) );
    }
    
    attachmentmodels = getweaponattachmentworldmodels( weapon );
    
    foreach ( model in attachmentmodels )
    {
        if ( viewmodel )
        {
            array = strtok( model, "_" );
            
            foreach ( i, tok in array )
            {
                if ( i == 0 )
                {
                    model = tok;
                    continue;
                }
                
                if ( tok == "wm" )
                {
                    model += "_vm";
                    continue;
                }
                
                model = model + "_" + tok;
            }
        }
        
        if ( precache )
        {
            precachemodel( model );
            continue;
        }
        
        self attach( model );
    }
    
    if ( !precache )
    {
        switch ( basename )
        {
            case #"hash_bf2d3ffce9ef56d1":
                self hidepart( "j_b_loader" );
                self hidepart( "j_b_loader_01" );
                self hidepart( "j_b_loader_02" );
                self hidepart( "j_b_loader_03" );
                self hidepart( "j_b_loader_04" );
                self hidepart( "j_b_loader_05" );
                self hidepart( "j_b_loader_06" );
                break;
            case #"hash_9703d13dcfc6b555":
                self hidepart( "j_shell" );
                self hidepart( "j_shell_fired" );
                break;
        }
        
        foreach ( model in attachmentmodels )
        {
            part = "tag_sight_on";
            
            if ( has_part( model, part ) )
            {
                if ( issubstr( model, "reflex" ) )
                {
                    self hidepart( part );
                    continue;
                }
                
                if ( issubstr( model, "holo" ) )
                {
                    self hidepart( part );
                    continue;
                }
                
                if ( issubstr( model, "acog" ) )
                {
                    self hidepart( part );
                    continue;
                }
                
                if ( issubstr( model, "scope" ) )
                {
                    self hidepart( part );
                }
            }
        }
    }
}

// Namespace utility
// Params 2, eflags: 0x4
// Checksum 0x6746dafa, Offset: 0x1403
// Size: 0x50, Type: bool
function private has_part( model, part )
{
    numparts = getnumparts( model );
    
    for ( i = 0; i < numparts ; i++ )
    {
        if ( part == getpartname( model, i ) )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace utility
// Params 5
// Checksum 0xde483f1b, Offset: 0x145c
// Size: 0x3c4
function make_weapon_and_attach( basename, attachments, tagname, viewmodel, precache )
{
    if ( !precache )
    {
        isvalid = 0;
        
        if ( isent( self ) || isai( self ) )
        {
            isvalid = 1;
        }
        
        assert( isvalid, "<dev string:x24>" );
    }
    
    if ( !isdefined( attachments ) )
    {
        attachments = [];
    }
    
    if ( !isdefined( viewmodel ) )
    {
        viewmodel = 0;
    }
    
    if ( isdefined( level.fnbuildweaponspecial ) && isdefined( [[ level.fnbuildweaponspecial ]]( basename ) ) )
    {
        weapon = [[ level.fnbuildweaponspecial ]]( basename );
    }
    else
    {
        weapon = [[ level.fnbuildweapon ]]( basename, attachments );
    }
    
    if ( !precache )
    {
        if ( isdefined( tagname ) )
        {
            self attach( getweaponmodel( basename ), tagname );
        }
        else
        {
            self attach( getweaponmodel( basename ) );
        }
    }
    
    self.attachedweaponmodels[ 0 ] = basename;
    attachmentmodels = getweaponattachmentworldmodels( weapon );
    lasermodelindex = undefined;
    var_ecce528020dacdb0 = undefined;
    
    for ( i = 0; i < attachmentmodels.size ; i++ )
    {
        if ( var_ecce528020dacdb0 )
        {
            model = attachmentmodels[ lasermodelindex ];
        }
        else
        {
            model = attachmentmodels[ i ];
        }
        
        if ( !isdefined( var_ecce528020dacdb0 ) && isstartstr( model, "att_wm_laser" ) )
        {
            lasermodelindex = i;
            continue;
        }
        
        if ( viewmodel )
        {
            array = strtok( model, "_" );
            
            foreach ( i, tok in array )
            {
                if ( i == 0 )
                {
                    model = tok;
                    continue;
                }
                
                if ( tok == "wm" )
                {
                    model += "_vm";
                    continue;
                }
                
                model = model + "_" + tok;
            }
        }
        
        if ( precache )
        {
            precachemodel( model );
        }
        else
        {
            self attach( model );
            self.attachedweaponmodels[ self.attachedweaponmodels.size ] = model;
        }
        
        if ( !isdefined( var_ecce528020dacdb0 ) && isdefined( lasermodelindex ) && i == attachmentmodels.size - 1 )
        {
            i -= 1;
            var_ecce528020dacdb0 = 1;
        }
    }
    
    if ( !precache )
    {
        switch ( basename )
        {
            case #"hash_bf2d3ffce9ef56d1":
                self hidepart( "j_b_loader" );
                self hidepart( "j_b_loader_01" );
                self hidepart( "j_b_loader_02" );
                self hidepart( "j_b_loader_03" );
                self hidepart( "j_b_loader_04" );
                self hidepart( "j_b_loader_05" );
                self hidepart( "j_b_loader_06" );
                break;
            case #"hash_9703d13dcfc6b555":
                self hidepart( "j_shell" );
                self hidepart( "j_shell_fired" );
                break;
        }
        
        foreach ( model in attachmentmodels )
        {
            part = "tag_sight_on";
            
            if ( has_part( model, part ) )
            {
                if ( issubstr( model, "reflex" ) )
                {
                    self hidepart( part );
                    continue;
                }
                
                if ( issubstr( model, "holo" ) )
                {
                    self hidepart( part );
                    continue;
                }
                
                if ( issubstr( model, "acog" ) )
                {
                    self hidepart( part );
                }
            }
        }
    }
}

// Namespace utility
// Params 5
// Checksum 0xc36363d9, Offset: 0x1828
// Size: 0x46e
function make_weapon_random( weaponname, var_d829bc3fd4695a45, attachment_combos, camos, randomizereticle )
{
    attachments = get_random_attachments( var_d829bc3fd4695a45, attachment_combos );
    weapon = [[ level.fnbuildweapon ]]( weaponname, attachments );
    
    /#
        if ( getdvarint( @"hash_45281f93550798" ) )
        {
            if ( !isdefined( weapon ) )
            {
                complete_weapon = weaponname;
                
                foreach ( attachment in attachments )
                {
                    complete_weapon += "<dev string:x63>" + attachment;
                }
                
                iprintlnbold( complete_weapon + "<dev string:x68>" );
                return [[ level.fnbuildweapon ]]( weaponname );
            }
            
            var_54c65bcdffc05dbc = undefined;
            attachment_models = getweaponattachmentworldmodels( weapon );
            
            foreach ( attachment_model in attachment_models )
            {
                part_num = getnumparts( attachment_model );
                
                for ( i = 0; i < part_num ; i++ )
                {
                    if ( getpartname( attachment_model, i ) == "<dev string:x7c>" )
                    {
                        var_54c65bcdffc05dbc = 1;
                        break;
                    }
                }
            }
            
            if ( !isdefined( var_54c65bcdffc05dbc ) && !issubstr( weaponname, "<dev string:x88>" ) && !issubstr( weaponname, "<dev string:x90>" ) && !issubstr( weaponname, "<dev string:x98>" ) )
            {
                iprintlnbold( getcompleteweaponname( weapon ) + "<dev string:xa0>" );
            }
            
            var_ac46e6a0a5ae17d6 = 1;
            
            foreach ( possibility in var_d829bc3fd4695a45 )
            {
                probability_100 = 0;
                
                if ( isint( possibility[ 0 ] ) && possibility[ 0 ] == 100 )
                {
                    probability_100 = -1;
                }
                
                var_ac46e6a0a5ae17d6 *= possibility.size + probability_100;
            }
            
            println( "<dev string:xbb>" + weaponname + "<dev string:xca>" + var_ac46e6a0a5ae17d6 );
        }
    #/
    
    if ( camos.size > 0 && cointoss() )
    {
        weapon = weapon withcamo( camos[ randomint( camos.size ) ] );
    }
    
    if ( randomizereticle )
    {
        foreach ( attachment in attachments )
        {
            if ( isstartstr( attachment, "acog" ) )
            {
                weapon = weapon withreticle( randomint( 8 ) );
                continue;
            }
            
            if ( isstartstr( attachment, "hybrid_west" ) )
            {
                weapon = weapon withreticle( randomint( 8 ) );
                continue;
            }
            
            if ( isstartstr( attachment, "thermalsnpr" ) )
            {
                weapon = weapon withreticle( randomint( 8 ) );
                continue;
            }
            
            if ( isstartstr( attachment, "thermal" ) )
            {
                weapon = weapon withreticle( randomint( 8 ) );
                continue;
            }
            
            if ( isstartstr( attachment, "holo" ) )
            {
                weapon = weapon withreticle( randomint( 11 ) );
                continue;
            }
            
            if ( isstartstr( attachment, "reflex" ) )
            {
                weapon = weapon withreticle( randomint( 12 ) );
                continue;
            }
            
            if ( isstartstr( attachment, "minireddot" ) )
            {
                weapon = weapon withreticle( randomint( 10 ) );
                continue;
            }
            
            if ( isstartstr( attachment, "snprscope" ) )
            {
                weapon = weapon withreticle( randomint( 13 ) );
                continue;
            }
            
            if ( isstartstr( attachment, "vzscope" ) )
            {
                weapon = weapon withreticle( randomint( 13 ) );
            }
        }
    }
    
    return weapon;
}

// Namespace utility
// Params 2
// Checksum 0xae4f9e8c, Offset: 0x1c9f
// Size: 0x2c5
function get_random_attachments( var_d829bc3fd4695a45, attachment_combos )
{
    assert( isdefined( var_d829bc3fd4695a45 ), "<dev string:xdd>" );
    
    if ( attachment_combos.size > 0 )
    {
        if ( var_d829bc3fd4695a45.size < 1 )
        {
            return attachment_combos[ randomint( attachment_combos.size ) ];
        }
        
        if ( randomint( 4 ) == 0 )
        {
            return attachment_combos[ randomint( attachment_combos.size ) ];
        }
    }
    
    attachments = [];
    
    if ( var_d829bc3fd4695a45.size < 1 )
    {
        return attachments;
    }
    
    foreach ( i, type in var_d829bc3fd4695a45 )
    {
        if ( isint( var_d829bc3fd4695a45[ i ][ 0 ] ) )
        {
            if ( randomint( 100 ) < var_d829bc3fd4695a45[ i ][ 0 ] )
            {
                if ( level.script == "nightwar" && i == "scopes" )
                {
                    newtype = [];
                    
                    foreach ( s, scope in type )
                    {
                        if ( !issubstr( type[ s ], "therm" ) && !issubstr( type[ s ], "nvg" ) )
                        {
                            newtype[ newtype.size ] = scope;
                        }
                    }
                    
                    type = newtype;
                }
                
                if ( type.size > 1 )
                {
                    attachments[ attachments.size ] = type[ randomint( type.size - 1 ) + 1 ];
                }
            }
            
            continue;
        }
        
        return attachments;
    }
    
    ub_entry = undefined;
    grip_entry = undefined;
    
    foreach ( i, attachment in attachments )
    {
        if ( isstartstr( attachment, "grip" ) )
        {
            grip_entry = i;
            continue;
        }
        
        if ( issubstr( attachment, "ub_" ) || issubstr( attachment, "glmini" ) )
        {
            ub_entry = i;
        }
    }
    
    if ( isdefined( ub_entry ) && isdefined( grip_entry ) )
    {
        if ( randomint( 3 ) == 0 )
        {
            attachments[ ub_entry ] = undefined;
            
            if ( isint( ub_entry ) )
            {
                function_cdc669dbc8ea2101( attachments );
            }
        }
        else
        {
            attachments[ grip_entry ] = undefined;
            
            if ( isint( grip_entry ) )
            {
                function_cdc669dbc8ea2101( attachments );
            }
        }
    }
    
    return attachments;
}

// Namespace utility
// Params 2
// Checksum 0x880db69d, Offset: 0x1f6d
// Size: 0x311
function get_weapon_weighted( weapons, definedprobabilities )
{
    probabilities = [];
    keys = getarraykeys( definedprobabilities );
    
    foreach ( i, weapon in weapons )
    {
        index = function_f02c63b99c9614c9( keys, weapon );
        
        if ( isdefined( index ) )
        {
            probabilities[ probabilities.size ] = definedprobabilities[ keys[ index ] ];
            continue;
        }
        
        probabilities[ probabilities.size ] = 0;
    }
    
    probability_total = 0;
    
    foreach ( probability in probabilities )
    {
        probability_total += probability;
    }
    
    /#
        if ( probability_total > 100 )
        {
            println( "<dev string:x10e>" + probability_total );
        }
    #/
    
    if ( probability_total < 100 )
    {
        remaining = 100 - probability_total;
        empty_entries = 0;
        
        foreach ( probability in probabilities )
        {
            if ( probability == 0 )
            {
                empty_entries += 1;
            }
        }
        
        if ( empty_entries > 0 )
        {
            split_probability = remaining / empty_entries;
            
            foreach ( i, probability in probabilities )
            {
                if ( probability == 0 )
                {
                    probabilities[ i ] = split_probability;
                }
            }
        }
    }
    
    diceroll = randomint( 100 );
    
    foreach ( i, probability in probabilities )
    {
        if ( i > 0 )
        {
            probabilities[ i ] = probability + probabilities[ i - 1 ];
        }
        
        if ( diceroll < probabilities[ i ] )
        {
            return weapons[ i ];
        }
    }
    
    /#
        if ( getdvarint( @"hash_45281f93550798" ) )
        {
            if ( weapons.size > 1 )
            {
                println( "<dev string:x149>" );
            }
        }
    #/
    
    return weapons[ 0 ];
}

// Namespace utility
// Params 0
// Checksum 0x7f405228, Offset: 0x2287
// Size: 0x34, Type: bool
function shouldskipfirstraise()
{
    if ( !isdefined( level.skipfirstraise ) )
    {
        level.skipfirstraise = getdvarint( @"scr_game_weapon_skip_first_raise", 0 ) == 1;
    }
    
    return istrue( level.skipfirstraise );
}

// Namespace utility
// Params 3
// Checksum 0xb52d302e, Offset: 0x22c4
// Size: 0x9d6
function removeconflictingattachments( attachments, defaults, var_49f3b0ed11297428 )
{
    if ( issp() )
    {
        if ( isdefined( var_49f3b0ed11297428 ) )
        {
            if ( !issubstr( var_49f3b0ed11297428, "iw9_" ) || issubstr( var_49f3b0ed11297428, "iw9_" ) && !getdvarint( @"hash_23a1118f1a92bcdd", 0 ) )
            {
                return removeconflictingdefaultattachment_new( attachments, defaults, var_49f3b0ed11297428 );
            }
        }
        
        defaults = removeconflictingdefaultattachment( attachments, defaults );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "bar", "front_" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "barlong", "slide_" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "barcust", "guard_" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "stock", "back_" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "cal", "mag_" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "drums", "mag_" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "xmag", "mag_" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "xmags", "mag_" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "rack", "mag_" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "mmags", "mag_" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "box_", "mag_" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "xmagslrg", "xmags_" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "mag_", "xmags_" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "rack", "ammo_" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "thermal", "snprscope" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "acog", "snprscope" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "reflex", "snprscope" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "holo", "snprscope" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "hybrid", "snprscope" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "vzscope", "snprscope" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "minireddot", "snprscope" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "thermal", "ironsdefault_" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "acog", "ironsdefault_" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "reflex", "ironsdefault_" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "holo", "ironsdefault_" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "hybrid", "ironsdefault_" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "vzscope", "ironsdefault_" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "minireddot", "ironsdefault_" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "scope", "ironsdefault_" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "snprscope", "ironsdefault_" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "irons", "ironsdefault_" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "wounded_", "grip" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "grip", "gripcust_" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "griprail", "grip_" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "ironsdefault_", "snprscope" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "thermal", "iw8_ironsdefault_" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "acog", "iw8_ironsdefault_" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "reflex", "iw8_ironsdefault_" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "holo", "iw8_ironsdefault_" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "hybrid", "iw8_ironsdefault_" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "vzscope", "iw8_ironsdefault_" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "minireddot", "iw8_ironsdefault_" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "scope", "iw8_ironsdefault_" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "snprscope", "iw8_ironsdefault_" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "irons", "iw8_ironsdefault_" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "bar", "iw8_front_" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "stock", "iw8_back_" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "barlong", "iw8_slide_" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "cal", "iw8_mag_" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "drums", "iw8_mag_" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "xmags", "iw8_mag_" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "rack", "iw8_mag_" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "mmags", "iw8_mag_" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "box_", "iw8_mag_" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "barsil", "bar_" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "barbrake", "bar_" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "barcomp", "bar_" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "bartube", "bar_" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "bar", "barsil_" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "ub", "select" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "ub", "iw9_select" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "ub", "grip" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "glmini", "select" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "glmini", "iw9_select" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "stockno", "stock" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "stock", "stockr" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "stockr", "stock" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "stockp", "stockno_" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "fourx", "ironsdefault" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "snscope", "ironsdefault" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "iw9_minireddot", "ironsdefault" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "pgolf1_scope", "ironsdefault" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "mike24_scope", "ironsdefault" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "shscope", "ironsdefault" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "arscope", "ironsdefault" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "dmscope", "ironsdefault" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "hybrid", "ironsdefault" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "fourx", "iw9_ironsdefault" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "holo", "iw9_ironsdefault" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "hybrid", "iw9_ironsdefault" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "reflex", "iw9_ironsdefault" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "thermal", "iw9_ironsdefault" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "arscope", "iw9_ironsdefault" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "iw9_minireddot", "iw9_ironsdefault" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "piscope", "iw9_ironsdefault" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "dmscope", "iw9_ironsdefault" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "vzscope", "iw9_ironsdefault" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "drum_", "mag_" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "mag_", "mag_" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "belt_", "mag_" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "mag_", "belt_" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "mag_", "drum_" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "magheligrip_", "magheli_" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "grip", "magheligrip_" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "ballistics", "ammo_" );
    }
    else
    {
        if ( isdefined( var_49f3b0ed11297428 ) )
        {
            if ( !issubstr( var_49f3b0ed11297428, "iw9_" ) || issubstr( var_49f3b0ed11297428, "iw9_" ) && !getdvarint( @"hash_23a1118f1a92bcdd", 0 ) )
            {
                return removeconflictingdefaultattachment_new( attachments, defaults, var_49f3b0ed11297428 );
            }
        }
        
        defaults = removeconflictingdefaultattachment( attachments, defaults, "bar", "front_" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "barlong", "slide_" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "barcust", "guard_" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "stock", "back_" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "cal", "mag_" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "drums", "mag_" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "xmags", "mag_" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "rack", "mag_" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "rack", "ammo_" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "thermal", "scope" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "acog", "scope" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "reflex", "scope" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "holo", "scope" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "grip", "grip_" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "rec_", "rec_" );
        defaults = removeconflictingdefaultattachment( attachments, defaults, "toprail_", "toprail_" );
    }
    
    return defaults;
}

// Namespace utility
// Params 4
// Checksum 0x532a3a39, Offset: 0x2ca3
// Size: 0x34b
function removeconflictingdefaultattachment_new( attachment_array, default_array, var_49f3b0ed11297428, var_872c3c3b9442921a = 1 )
{
    defaults_filtered = default_array;
    attach_1 = undefined;
    var_21ca68c81ef4b7cc = undefined;
    var_43a66262e08982f8 = undefined;
    attach_2 = undefined;
    var_cb10d512983d5c6b = undefined;
    var_cee1879c8c5375f = undefined;
    var_283db49f3d7bf4fb = undefined;
    var_e12ac324cb87db7f = undefined;
    weap = makeweaponfromstring( var_49f3b0ed11297428 );
    final_attachments = defaults_filtered;
    
    if ( var_872c3c3b9442921a )
    {
        for ( i = 0; i < default_array.size - 1 ; i++ )
        {
            attach_1 = default_array[ i ];
            var_21ca68c81ef4b7cc = getattachmentslot( weap, attach_1 );
            
            for ( j = i + 1; j < default_array.size ; j++ )
            {
                attach_2 = default_array[ j ];
                
                if ( attach_1 == attach_2 )
                {
                    continue;
                }
                
                var_cb10d512983d5c6b = getattachmentslot( weap, attach_2 );
                
                if ( var_21ca68c81ef4b7cc == var_cb10d512983d5c6b && var_21ca68c81ef4b7cc != "other" )
                {
                    var_43a66262e08982f8 = getattachmentslotpriority( weap, attach_1 );
                    var_cee1879c8c5375f = getattachmentslotpriority( weap, attach_2 );
                    
                    if ( var_43a66262e08982f8 >= var_cee1879c8c5375f )
                    {
                        final_attachments = arrayremove( final_attachments, attach_2 );
                    }
                }
                
                var_283db49f3d7bf4fb = _attachmentblocks( weap, attach_1, attach_2 );
                var_e12ac324cb87db7f = _attachmentblocks( weap, attach_2, attach_1 );
                
                if ( var_283db49f3d7bf4fb && var_e12ac324cb87db7f )
                {
                    defaults_filtered = arrayremove( defaults_filtered, attach_2 );
                    continue;
                }
                
                if ( var_283db49f3d7bf4fb )
                {
                    defaults_filtered = arrayremove( defaults_filtered, attach_2 );
                    continue;
                }
                
                if ( var_e12ac324cb87db7f )
                {
                    defaults_filtered = arrayremove( defaults_filtered, attach_1 );
                }
            }
        }
    }
    
    attach_1 = undefined;
    var_21ca68c81ef4b7cc = undefined;
    var_43a66262e08982f8 = undefined;
    attach_2 = undefined;
    var_cb10d512983d5c6b = undefined;
    var_cee1879c8c5375f = undefined;
    var_283db49f3d7bf4fb = undefined;
    var_e12ac324cb87db7f = undefined;
    final_attachments = defaults_filtered;
    
    foreach ( attach_1 in attachment_array )
    {
        if ( issubstr( attach_1, "|" ) )
        {
            [ attach_1 ] = strtok( attach_1, "|" );
        }
        
        var_21ca68c81ef4b7cc = getattachmentslot( weap, attach_1 );
        
        foreach ( attach_2 in defaults_filtered )
        {
            if ( issubstr( attach_2, "|" ) )
            {
                [ attach_2 ] = strtok( attach_2, "|" );
            }
            
            var_cb10d512983d5c6b = getattachmentslot( weap, attach_2 );
            
            if ( var_21ca68c81ef4b7cc == var_cb10d512983d5c6b && var_21ca68c81ef4b7cc != "other" )
            {
                var_43a66262e08982f8 = getattachmentslotpriority( weap, attach_1 );
                var_cee1879c8c5375f = getattachmentslotpriority( weap, attach_2 );
                
                if ( var_43a66262e08982f8 >= var_cee1879c8c5375f )
                {
                    final_attachments = arrayremove( final_attachments, attach_2 );
                }
            }
            
            var_283db49f3d7bf4fb = _attachmentblocks( weap, attach_1, attach_2 );
            var_e12ac324cb87db7f = _attachmentblocks( weap, attach_2, attach_1 );
            
            if ( var_283db49f3d7bf4fb && var_e12ac324cb87db7f )
            {
                final_attachments = arrayremove( final_attachments, attach_2 );
                continue;
            }
            
            if ( var_283db49f3d7bf4fb )
            {
                final_attachments = arrayremove( final_attachments, attach_2 );
            }
        }
    }
    
    return final_attachments;
}

// Namespace utility
// Params 4
// Checksum 0xa8e1ba1, Offset: 0x2ff7
// Size: 0x315
function removeconflictingdefaultattachment( attachment_array, default_array, attachment_string, default_string )
{
    if ( !isdefined( attachment_string ) )
    {
        foreach ( attachment in attachment_array )
        {
            tok = strtok( attachment, "_" )[ 0 ];
            
            if ( tok == "iw8" || tok == "iw9" || tok == "jup" )
            {
                tok = strtok( attachment, "_" )[ 1 ];
                
                foreach ( def in default_array )
                {
                    if ( !isdefined( strtok( def, "_" )[ 1 ] ) )
                    {
                        continue;
                    }
                    
                    if ( tok == strtok( def, "_" )[ 1 ] )
                    {
                        default_array = arrayremove( default_array, def );
                        continue;
                    }
                    
                    if ( issubstr( attachment, "scope" ) && issubstr( def, "scope" ) )
                    {
                        default_array = arrayremove( default_array, def );
                    }
                }
                
                continue;
            }
            
            foreach ( def in default_array )
            {
                if ( tok == strtok( def, "_" )[ 0 ] )
                {
                    default_array = arrayremove( default_array, def );
                    continue;
                }
                
                if ( issubstr( attachment, "scope" ) && issubstr( def, "scope" ) )
                {
                    default_array = arrayremove( default_array, def );
                }
            }
        }
        
        return default_array;
    }
    
    var_6865dc953df4293c = undefined;
    
    foreach ( attachment in attachment_array )
    {
        if ( issubstr( attachment, default_string ) )
        {
            var_6865dc953df4293c = 1;
        }
        
        if ( isstartstr( attachment, attachment_string ) || var_6865dc953df4293c )
        {
            for ( i = 0; i < default_array.size ; i++ )
            {
                if ( issubstr( default_array[ i ], default_string ) )
                {
                    default_array[ i ] = undefined;
                    
                    if ( isint( i ) )
                    {
                        function_cdc669dbc8ea2101( default_array );
                    }
                    
                    return default_array;
                }
            }
        }
    }
    
    return default_array;
}

// Namespace utility
// Params 3, eflags: 0x4
// Checksum 0xbf0ff4a, Offset: 0x3315
// Size: 0xdb, Type: bool
function private _attachmentblocks( weaponasset, attachment1, attachment2 )
{
    var_69f2176c89fcc134 = getattachmentbasetypesblocked( weaponasset, attachment1 );
    
    if ( var_69f2176c89fcc134.size > 0 && arraycontains( var_69f2176c89fcc134, getattachmentbasetype( weaponasset, attachment2 ) ) )
    {
        return true;
    }
    
    attachment1slot = getattachmentslot( weaponasset, attachment1 );
    attachment2slot = getattachmentslot( weaponasset, attachment2 );
    
    if ( attachment1slot == attachment2slot )
    {
        if ( attachment1slot != "other" || attachment1 == attachment2 )
        {
            return true;
        }
    }
    
    slotsblocked = getattachmentslotsblocked( weaponasset, attachment1 );
    
    if ( slotsblocked.size > 0 && arraycontains( slotsblocked, attachment2slot ) )
    {
        return true;
    }
    
    attachmentsblocked = getattachmentsblocked( weaponasset, attachment1 );
    
    if ( attachmentsblocked.size > 0 && arraycontains( attachmentsblocked, attachment2 ) )
    {
        return true;
    }
    
    return false;
}

// Namespace utility
// Params 6
// Checksum 0xc6f96dc3, Offset: 0x33f9
// Size: 0x1a1
function function_a0b2f814bf08507f( weaponname, origin, weaponattachments, angles = ( 0, 0, 0 ), spawnflags = 0, camoid )
{
    assert( isdefined( origin ), "<dev string:x176>" );
    
    if ( getdvarint( @"hash_4589562a903db3e0" ) && isstartstr( weaponname, "iw8_" ) )
    {
        print( "<dev string:x1a8>" + weaponname );
    }
    
    weaponattachments = weaponattachments ?? [];
    defaults = getweapondefaultattachments( weaponname );
    defaults = removeconflictingattachments( weaponattachments, defaults, weaponname );
    weaponattachments = arraycombine( defaults, weaponattachments );
    attachmentstring = "";
    
    foreach ( attachment in weaponattachments )
    {
        attachmentstring = attachmentstring + "+" + attachment;
    }
    
    if ( isdefined( camoid ) )
    {
        attachmentstring += "+camo|" + camoid;
    }
    
    weapon = spawn( "weapon_" + weaponname + attachmentstring, origin, spawnflags );
    weapon.angles = angles;
    level thread callsharedfunc( #"loot", #"dropWeaponPost", weapon );
    return weapon;
}

// Namespace utility
// Params 1, eflags: 0x4
// Checksum 0x2940c7d, Offset: 0x35a3
// Size: 0xa1
function private function_295d140a604847b8( weapon )
{
    struct = spawnstruct();
    struct.origin = weapon.origin;
    struct.angles = weapon.angles;
    struct.targetname = weapon.targetname;
    struct.bulletweapon = function_41bec0232e24ee41( weapon.classname, "weapon_" );
    struct.spawnflags = weapon.spawnflags;
    addstruct( struct );
}

// Namespace utility
// Params 0
// Checksum 0xe3566b7c, Offset: 0x364c
// Size: 0x449
function fixplacedweapons()
{
    /#
        level.placedweapons = [];
    #/
    
    weapons = [];
    entities = getentarray();
    
    foreach ( ent in entities )
    {
        if ( !isdefined( ent.classname ) )
        {
            continue;
        }
        
        if ( isstartstr( ent.classname, "weapon_" ) )
        {
            weapons[ weapons.size ] = ent;
        }
    }
    
    foreach ( weapon in weapons )
    {
        if ( isent( weapon ) && weapon.spawnflags & 32 )
        {
            function_295d140a604847b8( weapon );
            weapon delete();
            continue;
        }
        
        weaponattachments = strtok( weapon.classname, "+" );
        weaponname = getsubstr( weaponattachments[ 0 ], 7, weaponattachments[ 0 ].size );
        weaponattachments[ 0 ] = undefined;
        
        if ( isint( 0 ) )
        {
            function_cdc669dbc8ea2101( weaponattachments );
        }
        
        weaponcamoid = weapon.script_camo;
        
        if ( isdefined( level.var_78443cb099dedf63 ) )
        {
            weaponfixed = [[ level.var_78443cb099dedf63 ]]( weaponname, weapon.origin, weaponattachments, weapon.angles, weapon.spawnflags, weaponcamoid );
        }
        else
        {
            weaponfixed = function_a0b2f814bf08507f( weaponname, weapon.origin, weaponattachments, weapon.angles, weapon.spawnflags, weaponcamoid );
        }
        
        if ( isdefined( weapon.targetname ) )
        {
            weaponfixed.targetname = weapon.targetname;
        }
        
        if ( isdefined( weapon.script_noteworthy ) )
        {
            weaponfixed.script_noteworthy = weapon.script_noteworthy;
        }
        
        if ( isdefined( weapon.script_namenumber ) )
        {
            weaponfixed.script_namenumber = weapon.script_namenumber;
        }
        
        if ( isdefined( weapon.script_parameters ) )
        {
            weaponfixed.script_parameters = weapon.script_parameters;
        }
        
        if ( isdefined( weapon.script_label ) )
        {
            weaponfixed.script_label = weapon.script_label;
        }
        
        if ( isdefined( weapon.script_ammo_alt_clip ) )
        {
            weaponfixed.script_ammo_alt_clip = weapon.script_ammo_alt_clip;
        }
        
        if ( isdefined( weapon.script_ammo_alt_extra ) )
        {
            weaponfixed.script_ammo_alt_extra = weapon.script_ammo_alt_extra;
        }
        
        if ( isdefined( weapon.script_ammo_clip ) )
        {
            weaponfixed.script_ammo_clip = weapon.script_ammo_clip;
        }
        
        if ( isdefined( weapon.script_ammo_extra ) )
        {
            weaponfixed.script_ammo_extra = weapon.script_ammo_extra;
        }
        else if ( isdefined( weapon.script_ammo_clip ) )
        {
            weaponfixed.script_ammo_extra = 0;
        }
        
        if ( isdefined( weapon.script_ammo_max ) )
        {
            weaponfixed.script_ammo_max = weapon.script_ammo_max;
        }
        
        if ( isdefined( weapon.var_d61fe0ab5f896da5 ) )
        {
            weaponfixed.var_d61fe0ab5f896da5 = weapon.var_d61fe0ab5f896da5;
        }
        
        hasub = function_9955d5b2a1d97c43( weapon );
        weaponfixed shared::setscriptammo( weaponname, weapon, hasub );
        thread callsharedfunc( #"loot", #"dropWeaponPost", weaponfixed );
        
        /#
            level.placedweapons[ level.placedweapons.size ] = weaponfixed;
        #/
        
        weapon delete();
    }
}

// Namespace utility
// Params 5
// Checksum 0x24f870a, Offset: 0x3a9d
// Size: 0x186
function function_5ffdb4fa47e909b4( parentent, model, offsetorigin, offsetangles, tag )
{
    assert( isent( parentent ) );
    assert( isdefined( model ) );
    
    if ( !isdefined( offsetorigin ) )
    {
        offsetorigin = ( 0, 0, 0 );
    }
    
    if ( !isdefined( offsetangles ) )
    {
        offsetangles = ( 0, 0, 0 );
    }
    
    damageproxy = spawn( "script_model", coordtransform( offsetorigin, parentent.origin, parentent.angles ) );
    
    if ( !isdefined( damageproxy ) )
    {
        /#
            iprintln( "<dev string:x1ef>" + parentent.origin[ 0 ] + "<dev string:x20f>" + parentent.origin[ 1 ] + "<dev string:x20f>" + parentent.origin[ 2 ] + "<dev string:x215>" );
        #/
        
        return undefined;
    }
    
    damageproxy.angles = combineangles( parentent.angles, offsetangles );
    damageproxy setmodel( model );
    damageproxy.health = 999999;
    damageproxy.takedamage = 1;
    damageproxy hide();
    damageproxy function_f721683d9ae86377( 1 );
    damageproxy setcandamage( 1 );
    
    if ( isdefined( tag ) )
    {
        damageproxy linkto( parentent, tag, offsetorigin, offsetangles );
    }
    else
    {
        damageproxy linkto( parentent );
    }
    
    parentent thread function_ce98599bab51086f( damageproxy );
    damageproxy thread function_9e0058b45819027c( parentent );
    return damageproxy;
}

// Namespace utility
// Params 1, eflags: 0x4
// Checksum 0x8e21d98a, Offset: 0x3c2c
// Size: 0xf0
function private function_9e0058b45819027c( owner )
{
    self endon( "death_or_disconnect" );
    owner endon( "death_or_disconnect" );
    
    while ( true )
    {
        self waittill( "damage", amount, attacker, direction_vec, damageloc, meansofdeath, modelname, attachtagname, partname, dflags, objweapon, origin, angles, normal, inflictor, time );
        owner notify( "damage", amount, attacker, direction_vec, damageloc, meansofdeath, modelname, attachtagname, partname, dflags, objweapon, origin, angles, normal, inflictor, time );
        self.health = 999999;
    }
}

// Namespace utility
// Params 1, eflags: 0x4
// Checksum 0x3ad382b1, Offset: 0x3d24
// Size: 0x21
function private function_ce98599bab51086f( linked )
{
    self waittill( "death_or_disconnect" );
    
    if ( isdefined( linked ) )
    {
        linked delete();
    }
}

// Namespace utility
// Params 2
// Checksum 0x92ac785c, Offset: 0x3d4d
// Size: 0x65
function lookatentity( ent, intensity )
{
    actual_intensity = 1;
    
    if ( isdefined( intensity ) )
    {
        actual_intensity = intensity;
    }
    
    self.entitylookingat = ent;
    
    if ( isdefined( ent ) )
    {
        self.lookingatent = 1;
        self setlookatentity( ent, actual_intensity );
        return;
    }
    
    self.lookingatent = 0;
    self setlookatentity();
}

// Namespace utility
// Params 1
// Checksum 0x88525b1b, Offset: 0x3dba
// Size: 0x63
function civ_glancedownpath( duration )
{
    if ( !isdefined( self.pathgoalpos ) )
    {
        return;
    }
    
    self.internal_entitytolookat = self.entitylookingat;
    lookatentity();
    internal_civglancedownpath( gettime(), duration );
    lookatentity( self.internal_entitytolookat );
    self.internal_entitytolookat = undefined;
    self notify( "glance_finished" );
}

// Namespace utility
// Params 2, eflags: 0x4
// Checksum 0xfd27375d, Offset: 0x3e25
// Size: 0x95
function private internal_civglancedownpath( starttime, duration )
{
    var_9d04c47cb9bb461 = 2500;
    lookdownpathdist = self.lookdownpathdist ?? 75;
    
    while ( starttime + duration > gettime() )
    {
        glanceatpos = self getposonpath( lookdownpathdist );
        glanceatpos += ( 0, 0, 60 );
        
        if ( distancesquared( self.origin, glanceatpos ) < var_9d04c47cb9bb461 )
        {
            break;
        }
        
        self setlookat( glanceatpos );
        waitframe();
    }
    
    self stoplookat();
}

// Namespace utility
// Params 0
// Checksum 0xd8c2ffa5, Offset: 0x3ec2
// Size: 0x8
function glancestop()
{
    self stoplookat();
}

// Namespace utility
// Params 2
// Checksum 0xded6e8b5, Offset: 0x3ed2
// Size: 0x41
function lookatpos( pos, intensity )
{
    self notify( "newLookAt" );
    
    if ( !isdefined( intensity ) )
    {
        intensity = 1;
    }
    
    if ( !isdefined( pos ) )
    {
        self stoplookat();
        return;
    }
    
    self setlookat( pos, intensity );
}

// Namespace utility
// Params 1
// Checksum 0x1b8db504, Offset: 0x3f1b
// Size: 0xa0, Type: bool
function isweaponepic( weapon )
{
    attachments = getweaponattachments( weapon );
    
    if ( !isdefined( attachments ) )
    {
        return false;
    }
    
    foreach ( attachment in attachments )
    {
        if ( issubstr( attachment, "epic" ) )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace utility
// Params 1
// Checksum 0xb04a8d0e, Offset: 0x3fc4
// Size: 0x4e, Type: bool
function isdamageweapon( weapon )
{
    objweapon = self.damageweapon;
    
    if ( !isdefined( objweapon ) )
    {
        return false;
    }
    
    if ( isnullweapon( objweapon ) )
    {
        return false;
    }
    
    if ( objweapon.basename != getweaponbasename( weapon ) )
    {
        return false;
    }
    
    return true;
}

// Namespace utility
// Params 2
// Checksum 0xba2677ae, Offset: 0x401b
// Size: 0xb8
function setrecoilscale( scaler, scaleoverride )
{
    if ( !isdefined( scaler ) )
    {
        scaler = 0;
    }
    
    if ( !isdefined( self.recoilscale ) )
    {
        self.recoilscale = scaler;
    }
    else
    {
        self.recoilscale += scaler;
    }
    
    if ( isdefined( scaleoverride ) )
    {
        if ( scaleoverride < self.recoilscale )
        {
            scaleoverride = self.recoilscale;
        }
        
        scale = 100 - scaleoverride;
    }
    else
    {
        scale = 100 - self.recoilscale;
    }
    
    scale = int( clamp( scale, 0, 255 ) );
    
    if ( scale == 100 )
    {
        self player_recoilscaleoff();
        return;
    }
    
    self player_recoilscaleon( scale );
}

// Namespace utility
// Params 0
// Checksum 0xf6ce82a6, Offset: 0x40db
// Size: 0x7f, Type: bool
function meleegrab_ksweapon_used()
{
    assert( isplayer( self ) );
    killstreak_weaps = [ "mars_killstreak", "iw7_jackal_support_designator" ];
    currentweapon = self getcurrentweapon();
    
    if ( arraycontains( killstreak_weaps, currentweapon.basename ) )
    {
        return true;
    }
    
    if ( self isdroppingweapon() )
    {
        return true;
    }
    
    if ( self israisingweapon() )
    {
        if ( arraycontains( killstreak_weaps, currentweapon.basename ) )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace utility
// Params 0
// Checksum 0x91b36fef, Offset: 0x4163
// Size: 0x4b, Type: bool
function wasdamagedbyoffhandshield()
{
    if ( self.damagemod != "MOD_MELEE" )
    {
        return false;
    }
    
    objweapon = self.damageweapon;
    
    if ( !isdefined( objweapon ) || objweapon.type != "shield" )
    {
        return false;
    }
    
    return true;
}

// Namespace utility
// Params 1
// Checksum 0x96347e96, Offset: 0x41b7
// Size: 0x5c, Type: bool
function shouldburnfromdamage( damageweapon )
{
    if ( issubstr( damageweapon.basename, "molotov" ) || damageweapon.isdragonsbreath || self.var_30465dead0b9fadb || self.shouldburnfromdamage || function_51251d8c19498b74( damageweapon ) )
    {
        return true;
    }
    
    return false;
}

// Namespace utility
// Params 1
// Checksum 0x688dc50c, Offset: 0x421c
// Size: 0x51, Type: bool
function function_51251d8c19498b74( damageweapon )
{
    weaponmetadata = level.weaponmetadata[ getxhashasset( damageweapon.basename ) ];
    return weaponmetadata.elementdamagetype == "fire" && weaponmetadata.var_e02edeb9004f44ac;
}

// Namespace utility
// Params 0
// Checksum 0xb6e077a1, Offset: 0x4276
// Size: 0x138, Type: bool
function wasdamagedbyexplosive()
{
    if ( isdefined( self.damagemod ) )
    {
        if ( isexplosivedamagemod( self.damagemod ) )
        {
            return true;
        }
        
        if ( isdefined( self.damageweapon ) && shouldburnfromdamage( self.damageweapon ) && !self.var_30465dead0b9fadb )
        {
            return true;
        }
        
        if ( wasdamagedbyoffhandshield() )
        {
            return true;
        }
        
        if ( isdefined( self.attacker ) && self.damagemod == "MOD_MELEE" && self.attacker.unittype == "c8" )
        {
            return true;
        }
    }
    
    if ( gettime() - anim.lastcarexplosiontime <= 50 )
    {
        rangesq = anim.lastcarexplosionrange * anim.lastcarexplosionrange * 1.2 * 1.2;
        
        if ( distancesquared( self.origin, anim.lastcarexplosiondamagelocation ) < rangesq )
        {
            var_abf45e9f7b58c8e1 = rangesq * 0.5 * 0.5;
            self.maydoupwardsdeath = distancesquared( self.origin, anim.lastcarexplosionlocation ) < var_abf45e9f7b58c8e1;
            return true;
        }
    }
    
    return false;
}

// Namespace utility
// Params 1
// Checksum 0x6a541a06, Offset: 0x43b7
// Size: 0x101
function getdamagetype( smeansofdeath )
{
    if ( !isdefined( smeansofdeath ) )
    {
        return #"unknown";
    }
    
    switch ( smeansofdeath )
    {
        case #"hash_5f1054c48d66fd1c":
        case #"hash_966768b3f0c94767":
            return #"bullet";
        case #"hash_a5123f4d02745600":
        case #"hash_abb1587cdc6def23":
            return #"melee";
        case #"hash_3c20f39c73a1422b":
        case #"hash_571e46e17a3cf2e3":
        case #"hash_66cb246f3e55fbe2":
        case #"hash_a86d8c43482948a4":
        case #"hash_a911a1880d996edb":
        case #"hash_c22b13f81bed11f0":
            return #"splash";
        case #"hash_b1078ff213fddba6":
            return #"impact";
        case #"hash_1b5395c651f95456":
        case #"hash_61e42661ac27b9f2":
        default:
            return #"unknown";
    }
}

// Namespace utility
// Params 1
// Checksum 0x8ffc4464, Offset: 0x44c0
// Size: 0xaa, Type: bool
function isprotectedbyriotshield( enemy )
{
    if ( enemy.hasriotshield )
    {
        enemytome = self.origin - enemy.origin;
        metoenemy = vectornormalize( ( enemytome[ 0 ], enemytome[ 1 ], 0 ) );
        enemyfacing = anglestoforward( enemy.angles );
        angletome = vectordot( enemyfacing, enemytome );
        
        if ( enemy.hasriotshieldequipped )
        {
            if ( angletome > 0.766 )
            {
                return true;
            }
        }
        else if ( angletome < -0.766 )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace utility
// Params 1
// Checksum 0xbfabd9dc, Offset: 0x4573
// Size: 0x137
function isprotectedbyaxeblock( source )
{
    enemy_blocked = 0;
    currentweapon = self getcurrentweapon();
    var_dc29c4f465152879 = self adsbuttonpressed();
    var_64806f54df46cf90 = 0;
    var_f898877a51638b9c = 0;
    var_6af90177149d6506 = 0;
    playerforwardvector = anglestoforward( self.angles );
    playertoenemyvector = vectornormalize( source.origin - self.origin );
    dotproduct = vectordot( playertoenemyvector, playerforwardvector );
    
    if ( dotproduct > 0.5 )
    {
        var_64806f54df46cf90 = 1;
    }
    
    if ( currentweapon.basename == "iw6_axe_mp" || currentweapon.basename == "iw7_axe_zm" )
    {
        var_6af90177149d6506 = self getcurrentweaponclipammo();
        var_f898877a51638b9c = 1;
    }
    
    if ( var_f898877a51638b9c && var_dc29c4f465152879 && var_64806f54df46cf90 && var_6af90177149d6506 > 0 )
    {
        self setweaponammoclip( currentweapon, var_6af90177149d6506 - 1 );
        self playsound( "crate_impact" );
        earthquake( 0.75, 0.5, self.origin, 100 );
        enemy_blocked = 1;
    }
    
    return enemy_blocked;
}

// Namespace utility
// Params 1
// Checksum 0x650ee283, Offset: 0x46b3
// Size: 0x6f
function isairdropmarker( weaponname )
{
    switch ( weaponname )
    {
        case #"hash_2f9061ae7f4b0174":
        case #"hash_6b6ba32b55308fd1":
        case #"hash_73258c6de50c988a":
        case #"hash_abb7a2d7e9d5a6ff":
        case #"hash_e64f015026a52907":
        case #"hash_e861ccef0beefbbb":
            return 1;
        default:
            return 0;
    }
}

// Namespace utility
// Params 1
// Checksum 0x344b7035, Offset: 0x472a
// Size: 0x60, Type: bool
function isdestructibleweapon( weapon )
{
    if ( !isdefined( weapon ) )
    {
        assertmsg( "<dev string:x21b>" );
        return false;
    }
    
    switch ( weapon )
    {
        case #"hash_5e7c026ffa426ef2":
        case #"hash_a2f8ba701e9cf4d4":
        case #"hash_b6aeb2ab5add627b":
        case #"hash_e06c18584a141cef":
            return true;
    }
    
    return false;
}

// Namespace utility
// Params 0
// Checksum 0xcec0ad95, Offset: 0x4793
// Size: 0x9
function enable_teamflashbangimmunity()
{
    thread enable_teamflashbangimmunity_proc();
}

// Namespace utility
// Params 0, eflags: 0x4
// Checksum 0xa7000839, Offset: 0x47a4
// Size: 0x23
function private enable_teamflashbangimmunity_proc()
{
    self endon( "death" );
    
    while ( true )
    {
        self.teamflashbangimmunity = 1;
        wait 0.05;
    }
}

// Namespace utility
// Params 0
// Checksum 0xe7cb3c20, Offset: 0x47cf
// Size: 0xc
function disable_teamflashbangimmunity()
{
    self.teamflashbangimmunity = undefined;
}

// Namespace utility
// Params 1
// Checksum 0x96b5e702, Offset: 0x47e3
// Size: 0x17
function setflashbangimmunity( immune )
{
    self.flashbangimmunity = immune;
}

// Namespace utility
// Params 1
// Checksum 0xfbc74b84, Offset: 0x4802
// Size: 0x5f
function getcamotablecolumnindex( columnname )
{
    switch ( columnname )
    {
        case #"hash_34b6339587dcb48b":
            return 0;
        case #"hash_1a71dd59b555167":
            return 1;
        case #"hash_f545dd6e3ce1266f":
            return 2;
        case #"hash_7398d228375ae0d1":
            return 3;
        default:
            return undefined;
    }
}

// Namespace utility
// Params 0
// Checksum 0x3b9e5825, Offset: 0x4869
// Size: 0x58
function getdifficulty()
{
    assert( isdefined( level.gameskill ) );
    
    if ( level.gameskill < 1 )
    {
        return "easy";
    }
    
    if ( level.gameskill < 2 )
    {
        return "medium";
    }
    
    if ( level.gameskill < 3 )
    {
        return "hard";
    }
    
    return "fu";
}

// Namespace utility
// Params 0
// Checksum 0x96dc1c01, Offset: 0x48ca
// Size: 0x8
function clear_movement_speed()
{
    self aiclearscriptdesiredspeed();
}

// Namespace utility
// Params 0
// Checksum 0x2b843331, Offset: 0x48da
// Size: 0xc
function flashbangstop()
{
    self.flashendtime = undefined;
}

// Namespace utility
// Params 1
// Checksum 0xbb98c51b, Offset: 0x48ee
// Size: 0x4b
function enable_cqbwalk( autoenabled )
{
    if ( self.type == "dog" )
    {
        return;
    }
    
    if ( !isdefined( autoenabled ) )
    {
        self.cqbenabled = 1;
    }
    
    self.turnrate = 0.2;
    demeanor_override( "cqb" );
}

// Namespace utility
// Params 0
// Checksum 0x20d94b38, Offset: 0x4941
// Size: 0x5d
function disable_cqbwalk()
{
    if ( self.type == "dog" )
    {
        return;
    }
    
    self.cqbenabled = undefined;
    self.turnrate = 0.3;
    
    if ( isdefined( self.cqb_point_of_interest ) )
    {
        self.cqb_point_of_interest = undefined;
        self function_e885c7bb61b04474( 0 );
    }
    
    /#
        self notify( "<dev string:x25a>" );
    #/
    
    clear_demeanor_override();
}

// Namespace utility
// Params 1
// Checksum 0xc13d3d4b, Offset: 0x49a6
// Size: 0x5f
function demeanor_override( demeanor )
{
    self clearoverridearchetype( "demeanor", 0, 0 );
    basearchetype = self getbasearchetype();
    var_ddffabaae0fa011c = basearchetype + "_" + demeanor;
    
    if ( archetypeassetloaded( var_ddffabaae0fa011c ) )
    {
        self setoverridearchetype( "demeanor", var_ddffabaae0fa011c, 1 );
    }
    
    self demeanoroverride( demeanor );
}

// Namespace utility
// Params 0
// Checksum 0x4970fefa, Offset: 0x4a0d
// Size: 0x16
function clear_demeanor_override()
{
    self clearoverridearchetype( "demeanor", 0, 1 );
    self cleardemeanoroverride();
}

// Namespace utility
// Params 1
// Checksum 0x656a600d, Offset: 0x4a2b
// Size: 0x39, Type: bool
function isweaponinitialized( objweapon )
{
    assert( isweapon( objweapon ) );
    weaponname = getcompleteweaponname( objweapon );
    return isdefined( self.weaponinfo[ weaponname ] );
}

// Namespace utility
// Params 1
// Checksum 0x8e40767b, Offset: 0x4a6d
// Size: 0xb3
function initweapon( objweapon )
{
    assert( isweapon( objweapon ) );
    weaponname = getcompleteweaponname( objweapon );
    self.weaponinfo[ weaponname ] = spawnstruct();
    self.weaponinfo[ weaponname ].position = "none";
    self.weaponinfo[ weaponname ].hasclip = 1;
    
    if ( issp() )
    {
        self.weaponinfo[ weaponname ].useclip = objweapon function_d4b37be81fe8abbf();
        return;
    }
    
    self.weaponinfo[ weaponname ].useclip = 0;
}

// Namespace utility
// Params 0
// Checksum 0x46b40d05, Offset: 0x4b28
// Size: 0x20
function get_doublejumpenergy()
{
    if ( !isdefined( self.doublejumpenergy ) )
    {
        return self energy_getenergy( 0 );
    }
    
    return self.doublejumpenergy;
}

// Namespace utility
// Params 1
// Checksum 0x4c4063b, Offset: 0x4b51
// Size: 0x31
function set_doublejumpenergy( value )
{
    if ( !isdefined( self.doublejumpenergy ) )
    {
        self energy_setenergy( 0, value );
        return;
    }
    
    self.doublejumpenergy = value;
}

// Namespace utility
// Params 0
// Checksum 0xff558acc, Offset: 0x4b8a
// Size: 0x20
function get_doublejumpenergyrestorerate()
{
    if ( !isdefined( self.doublejumpenergyrestorerate ) )
    {
        return self energy_getrestorerate( 0 );
    }
    
    return self.doublejumpenergyrestorerate;
}

// Namespace utility
// Params 1
// Checksum 0x48dd4fd0, Offset: 0x4bb3
// Size: 0x31
function set_doublejumpenergyrestorerate( value )
{
    if ( !isdefined( self.doublejumpenergyrestorerate ) )
    {
        self energy_setrestorerate( 0, value );
        return;
    }
    
    self.doublejumpenergyrestorerate = value;
}

// Namespace utility
// Params 0
// Checksum 0xcde65c77, Offset: 0x4bec
// Size: 0xf
function playerarmorenabled()
{
    return getdvarint( @"hash_bfa6bedc37206c58" );
}

// Namespace utility
// Params 0
// Checksum 0xdf7c03ab, Offset: 0x4c04
// Size: 0xf
function playerhelmetenabled()
{
    return getdvarint( @"hash_425e93b8de8f141c" );
}

// Namespace utility
// Params 2
// Checksum 0x12d45e2a, Offset: 0x4c1c
// Size: 0x25
function groundpos( origin, up )
{
    return drop_to_ground( origin, 0, -100000, up );
}

// Namespace utility
// Params 0
// Checksum 0xc4ddb34a, Offset: 0x4c4a
// Size: 0x9
function vehicle_detachfrompath()
{
    vehicle_code::vehicle_pathdetach();
}

// Namespace utility
// Params 0
// Checksum 0xa3ba9b9, Offset: 0x4c5b
// Size: 0x9
function vehicle_resumepath()
{
    thread vehicle_paths::vehicle_resumepathvehicle();
}

// Namespace utility
// Params 2
// Checksum 0x34772ae6, Offset: 0x4c6c
// Size: 0x1f
function vehicle_dynamicpath( node, var_847b4b4977c8450 )
{
    vehicle::vehicle_paths( node, var_847b4b4977c8450 );
}

// Namespace utility
// Params 3
// Checksum 0x21180363, Offset: 0x4c93
// Size: 0x4a
function getvehiclespawner( value, key, allowundefined )
{
    spawners = getvehiclespawnerarray( value, key );
    
    if ( !allowundefined )
    {
        assert( spawners.size == 1 );
    }
    
    return spawners[ 0 ];
}

// Namespace utility
// Params 2
// Checksum 0xdd4e4d6a, Offset: 0x4ce6
// Size: 0x1e
function getvehiclespawnerarray( value, key )
{
    return vehicle_code::_getvehiclespawnerarray( value, key );
}

// Namespace utility
// Params 9
// Checksum 0x39939d05, Offset: 0x4d0d
// Size: 0x277
function function_d0e6aed2d8648374( start_pos, vel, accel, contentoverride, ignoreents, max_time = 8, delta_time = 0.15, debug_color, var_afe7fa4c43ea8c61 = 0 )
{
    level endon( "game_ended" );
    
    /#
        debug_render = getdvarint( @"hash_f6e0be2a1a634e44", 0 );
        
        if ( debug_render )
        {
            var_a2c53294c2aa8041 = getdvarint( @"hash_d69378863f107ad1", 1 );
            debug_radius = getdvarfloat( @"hash_67b9f0ba27a83e72", 0 );
            
            if ( !isdefined( debug_color ) )
            {
                debug_color = ( 1, 0.65, 0 );
            }
        }
    #/
    
    if ( !isdefined( accel ) )
    {
        accel = ( 0, 0, -1 * getdvarfloat( @"bg_gravity", 800 ) );
    }
    
    position = start_pos;
    position_prev = start_pos;
    t = 0;
    var_9b21fd8bac1a558a = max_time / delta_time;
    b_hit = 0;
    v = undefined;
    
    for ( i = 0; i <= var_9b21fd8bac1a558a ; i++ )
    {
        t += delta_time;
        position = start_pos + vel * t + accel * 0.5 * t * t;
        trace = trace::ray_trace( position_prev, position, ignoreents, contentoverride );
        
        if ( isdefined( trace[ "position" ] ) && trace[ "position" ] != position )
        {
            b_hit = 1;
            position = trace[ "position" ];
        }
        
        /#
            if ( debug_render )
            {
                if ( debug_radius > 0 )
                {
                    cylinder( position, position_prev, debug_radius, debug_color, 0, var_a2c53294c2aa8041 );
                }
                else
                {
                    line( position, position_prev, debug_color, 1, 1, var_a2c53294c2aa8041 );
                }
            }
        #/
        
        position_prev = position;
        
        if ( b_hit )
        {
            break;
        }
    }
    
    v = vel + accel * t;
    
    /#
        if ( b_hit && var_afe7fa4c43ea8c61 > 0 )
        {
            thread draw_circle( position, var_afe7fa4c43ea8c61, debug_color, 1, 1, var_a2c53294c2aa8041 );
        }
    #/
    
    result = spawnstruct();
    result.position = position;
    result.travel_time = t;
    result.velocity = v;
    result.b_hit = b_hit;
    result.trace = trace;
    return result;
}

// Namespace utility
// Params 0
// Checksum 0xe50bb70a, Offset: 0x4f8d
// Size: 0x36, Type: bool
function is_map_using_locales_only()
{
    mapname = getdvar( @"g_mapname" );
    
    if ( mapname == "mp_donesk" || mapname == "mp_locale_test" )
    {
        return true;
    }
    
    return false;
}

// Namespace utility
// Params 0
// Checksum 0xdb5795a4, Offset: 0x4fcc
// Size: 0x30
function iswegameplatform()
{
    if ( !isdefined( level.iswegameplatform ) )
    {
        level.iswegameplatform = getdvarint( @"hash_4d1e25100e19b858", 0 ) > 0;
    }
    
    return level.iswegameplatform;
}

// Namespace utility
// Params 1
// Checksum 0xd02d1885, Offset: 0x5005
// Size: 0x3f
function function_6ed37478a8ad7320( ent )
{
    if ( !ent )
    {
        return undefined;
    }
    
    if ( !isdefined( ent.entnum ) )
    {
        ent.entnum = ent getentitynumber();
    }
    
    return ent.entnum;
}

// Namespace utility
// Params 2
// Checksum 0x16da1508, Offset: 0x504d
// Size: 0x3c
function function_3a444812a9926ec( source, target )
{
    distanceinches = distance( source, target );
    distancemeters = distanceinches * 0.0254;
    return distancemeters;
}

// Namespace utility
// Params 3
// Checksum 0x41af75af, Offset: 0x5092
// Size: 0x54, Type: bool
function playerwithindistance( player, point, distance )
{
    actualdistancesquared = distancesquared( player.origin, point );
    maxdistancesquared = distance * distance;
    
    if ( actualdistancesquared <= maxdistancesquared )
    {
        return true;
    }
    
    return false;
}

// Namespace utility
// Params 3
// Checksum 0x2c3376f9, Offset: 0x50ef
// Size: 0x54, Type: bool
function function_92fc197c20834b39( player, point, distance )
{
    actualdistancesquared = distance2dsquared( player.origin, point );
    maxdistancesquared = distance * distance;
    
    if ( actualdistancesquared <= maxdistancesquared )
    {
        return true;
    }
    
    return false;
}

// Namespace utility
// Params 3
// Checksum 0x4bcbbf2e, Offset: 0x514c
// Size: 0x46, Type: bool
function function_db36b3921345bdf4( player, point, distancesquared )
{
    actualdistancesquared = distancesquared( player.origin, point );
    
    if ( actualdistancesquared <= distancesquared )
    {
        return true;
    }
    
    return false;
}

// Namespace utility
// Params 2
// Checksum 0x16f2c374, Offset: 0x519b
// Size: 0x20
function playersnear( point, distance )
{
    return charactersnear( point, distance, 1 );
}

// Namespace utility
// Params 2
// Checksum 0x197329a5, Offset: 0x51c4
// Size: 0x1f
function agentsnear( point, distance )
{
    return charactersnear( point, distance, 0 );
}

// Namespace utility
// Params 3
// Checksum 0xf21f5599, Offset: 0x51ec
// Size: 0x107
function charactersnear( point, distance, playersonly )
{
    playercontents = physics_createcontents( [ "physicscontents_characterproxy" ] );
    radiusvector = ( distance, distance, distance );
    aabbmin = point - radiusvector;
    aabbmax = point + radiusvector;
    hits = physics_aabbbroadphasequery( aabbmin, aabbmax, playercontents, [] );
    
    if ( !isdefined( playersonly ) )
    {
        return hits;
    }
    
    filteredhits = [];
    
    foreach ( hit in hits )
    {
        if ( isplayer( hit ) == playersonly )
        {
            filteredhits[ filteredhits.size ] = hit;
        }
    }
    
    return filteredhits;
}

// Namespace utility
// Params 6
// Checksum 0x2ab12102, Offset: 0x52fc
// Size: 0x4f
function playersincylinder( point, radius, var_39608ff9f170fda3, halfheightoverride = 1000, var_7d41775d8f6afcf3, ignorelaststand )
{
    return function_d63fe6a4c08ba6f5( point, radius, halfheightoverride, ignorelaststand, var_39608ff9f170fda3, var_7d41775d8f6afcf3 );
}

// Namespace utility
// Params 5
// Checksum 0xa4c3ea20, Offset: 0x5354
// Size: 0x56
function function_f754506ecfae9afb( point, radius, var_8925d7e90df06109, cylinderhalfheight = 1000, includeplayers )
{
    ignoreplayers = includeplayers === 0;
    return function_51b8ce76eb43aed5( point, radius, cylinderhalfheight, undefined, ignoreplayers, var_8925d7e90df06109 );
}

// Namespace utility
// Params 3
// Checksum 0xa9480d90, Offset: 0x53b3
// Size: 0x29
function playersinsphere( point, radius, excludedplayers )
{
    return getplayersinradius( point, radius, undefined, undefined, excludedplayers );
}

// Namespace utility
// Params 3
// Checksum 0x4da330f6, Offset: 0x53e5
// Size: 0x34
function function_1b1340a94b43b874( point, radius, includeplayers )
{
    if ( includeplayers === 0 )
    {
        return getaiarrayinradius( point, radius );
    }
    
    return getplayersandaiarrayinradius( point, radius );
}

// Namespace utility
// Params 3, eflags: 0x40 variadic
// Checksum 0x3d099e1b, Offset: 0x5422
// Size: 0x2e
function trycall( functionpointer, ... )
{
    if ( !isdefined( functionpointer ) )
    {
        return;
    }
    
    return [[ functionpointer ]]( flat_args( vararg, varargcount ) );
}

// Namespace utility
// Params 0
// Checksum 0x2330732d, Offset: 0x5459
// Size: 0x193
function spawncorpsehider()
{
    if ( !( level.var_ce11fa8b9f14341d ?? iswegameplatform() ) )
    {
        return;
    }
    
    corpsetable_index = 0;
    corpsetable_mapname = 1;
    corpsetable_model = 2;
    corpsetable_loc = 3;
    corpsetable_rot = 4;
    corpsetable_collision = 5;
    corpsetablename = "sp/hideCorpseTable.csv";
    curmapname = tolower( getdvar( @"g_mapname" ) );
    var_d374f94865e7eef9 = tablelookupgetnumrows( corpsetablename );
    
    for ( i = 0; i < var_d374f94865e7eef9 ; i++ )
    {
        if ( curmapname == tolower( tablelookupbyrow( corpsetablename, i, corpsetable_mapname ) ) )
        {
            modelname = tablelookupbyrow( corpsetablename, i, corpsetable_model );
            arrloc = strtok( tablelookupbyrow( corpsetablename, i, corpsetable_loc ), "_" );
            arrrot = strtok( tablelookupbyrow( corpsetablename, i, corpsetable_rot ), "_" );
            icollision = int( tablelookupbyrow( corpsetablename, i, corpsetable_collision ) );
            model = spawn( "script_model", ( float( arrloc[ 0 ] ), float( arrloc[ 1 ] ), float( arrloc[ 2 ] ) ) );
            model setmodel( modelname );
            model.angles = ( float( arrrot[ 0 ] ), float( arrrot[ 1 ] ), float( arrrot[ 2 ] ) );
            
            if ( icollision > 0 )
            {
                model solid();
                continue;
            }
            
            model notsolid();
        }
    }
}

// Namespace utility
// Params 0
// Checksum 0x138a6975, Offset: 0x55f4
// Size: 0x3e, Type: bool
function function_de1f80d93273abf5()
{
    if ( isstruct( self ) || !isdefined( self ) )
    {
        return false;
    }
    
    if ( isent( self ) && !self isscriptable() )
    {
        return false;
    }
    
    if ( !isent( self ) && !self isscriptableinstance() )
    {
        return false;
    }
    
    return true;
}

// Namespace utility
// Params 2
// Checksum 0x9491505c, Offset: 0x563b
// Size: 0xc9, Type: bool
function function_9f2c41c1dcc8c94( part, state )
{
    if ( isent( self ) && self isscriptable() || !isent( self ) && self isscriptableinstance() )
    {
        if ( self getscriptablehaspart( part ) )
        {
            if ( !state )
            {
                error_msg = "Error: Get Scriptable part: " + part + " of an undefined state on scriptable classname: " + ( self.classname ?? "none" ) + " model: " + ( self.model ?? "none" );
                println( error_msg );
                logstring( error_msg );
                return false;
            }
            
            if ( self getscriptableparthasstate( part, state ) )
            {
                curstate = self getscriptablepartstate( part, 1 );
                
                if ( curstate == state )
                {
                    return true;
                }
            }
        }
    }
    
    return false;
}

// Namespace utility
// Params 2
// Checksum 0xb33d255c, Offset: 0x570d
// Size: 0x66
function function_30dbabe3200518b( name, key )
{
    var_b8ebf0322b4c95e2 = getentitylessscriptablearray( name, key );
    assert( var_b8ebf0322b4c95e2.size < 2, "<dev string:x26b>" + name + "<dev string:x298>" + getxhashsourcename( key ) + "<dev string:x2a6>" );
    
    if ( var_b8ebf0322b4c95e2.size == 1 )
    {
        return var_b8ebf0322b4c95e2[ 0 ];
    }
    
    return undefined;
}

// Namespace utility
// Params 2
// Checksum 0xd77585e5, Offset: 0x577b
// Size: 0x66
function function_b3fc2f9ce7786d99( name, key )
{
    var_b8ebf0322b4c95e2 = getscriptablearray( name, key );
    assert( var_b8ebf0322b4c95e2.size < 2, "<dev string:x26b>" + name + "<dev string:x298>" + getxhashsourcename( key ) + "<dev string:x2a6>" );
    
    if ( var_b8ebf0322b4c95e2.size == 1 )
    {
        return var_b8ebf0322b4c95e2[ 0 ];
    }
    
    return undefined;
}

// Namespace utility
// Params 2
// Checksum 0x93c221b7, Offset: 0x57e9
// Size: 0x5d, Type: bool
function function_7c10ea82c1e305b8( part, state )
{
    if ( isent( self ) && self isscriptable() || !isent( self ) && self isscriptableinstance() )
    {
        if ( self getscriptablehaspart( part ) )
        {
            if ( self getscriptableparthasstate( part, state ) )
            {
                self setscriptablepartstate( part, state, 1 );
                return true;
            }
        }
    }
    
    return false;
}

// Namespace utility
// Params 3
// Checksum 0xdf29d4f3, Offset: 0x584f
// Size: 0xe3
function scriptable_setparententity( parent, offset, angles )
{
    assert( isdefined( self ) && self isscriptableinstance() );
    assert( isent( parent ) );
    
    if ( isdefined( offset ) && isdefined( angles ) )
    {
        self scriptablesetparententity( parent, offset, angles );
    }
    else if ( isdefined( offset ) )
    {
        self scriptablesetparententity( parent, offset );
    }
    else
    {
        self scriptablesetparententity( parent );
    }
    
    self.linkedparent = parent;
    
    if ( !isdefined( parent.linkedchildren ) )
    {
        parent.linkedchildren = [];
    }
    
    parent.linkedchildren[ parent.linkedchildren.size ] = self;
    
    if ( parent.linkedchildren.size % 10 == 0 )
    {
        parent.linkedchildren = function_5713d46873b29625( parent.linkedchildren );
    }
}

// Namespace utility
// Params 0
// Checksum 0x13c0019d, Offset: 0x593a
// Size: 0x89
function scriptable_clearparententity()
{
    assert( isdefined( self ) && self isscriptableinstance() );
    self scriptableclearparententity();
    parent = self.linkedparent;
    
    if ( !( isdefined( parent ) && isdefined( parent.linkedchildren ) ) )
    {
        return;
    }
    
    parent.linkedchildren = arrayremove( parent.linkedchildren, self );
    
    if ( parent.linkedchildren.size == 0 )
    {
        parent.linkedchildren = undefined;
    }
    
    self.linkedparent = undefined;
}

// Namespace utility
// Params 1
// Checksum 0x4687c968, Offset: 0x59cb
// Size: 0xad
function function_b6cf35b57ecf329c( part )
{
    var_5619be43a25599e3 = 0;
    
    foreach ( player in level.players )
    {
        if ( !player isscriptable() )
        {
            continue;
        }
        
        var_5619be43a25599e3 = 1;
        
        if ( player getscriptablehaspart( part ) )
        {
            return 1;
        }
    }
    
    if ( var_5619be43a25599e3 )
    {
        return 0;
    }
    
    return undefined;
}

// Namespace utility
// Params 2
// Checksum 0x7ce18b1d, Offset: 0x5a81
// Size: 0x6b, Type: bool
function function_32b24db3127bff40( part, state )
{
    if ( isent( self ) && self isscriptable() || !isent( self ) && self isscriptableinstance() )
    {
        if ( self getscriptablehaspart( part ) )
        {
            if ( self getscriptableparthasstate( part, state ) && self getscriptablepartstate( part ) != state )
            {
                self setscriptablepartstate( part, state, 1 );
                return true;
            }
        }
    }
    
    return false;
}

// Namespace utility
// Params 6
// Checksum 0xb91fa6e2, Offset: 0x5af5
// Size: 0xb1
function function_38add6d321fde077( scriptabledefname, startpos, landingpos, part, state, parentent )
{
    payload = calcscriptablepayloadgravityarc( startpos, landingpos );
    updatedyaw = vectortoyaw( landingpos - startpos );
    landingangles = ( 0, updatedyaw, 0 );
    assert( landingpos[ 2 ] < startpos[ 2 ], "<dev string:x2d3>" );
    scriptable = spawnscriptable( scriptabledefname, startpos, landingangles, parentent, payload );
    
    if ( isdefined( part ) && isdefined( state ) )
    {
        scriptable function_7c10ea82c1e305b8( part, state );
    }
    
    return scriptable;
}

// Namespace utility
// Params 1
// Checksum 0x9e94baef, Offset: 0x5baf
// Size: 0x2a
function function_51a662d7927dccc7( scriptable )
{
    scriptable endon( "death" );
    self waittill( "death" );
    
    if ( isdefined( scriptable ) )
    {
        scriptable freescriptable();
    }
}

// Namespace utility
// Params 1
// Checksum 0x86f4a7b3, Offset: 0x5be1
// Size: 0x7c
function function_bec4b0106dbd9c47( bool )
{
    assert( isdefined( bool ) );
    
    if ( bool && isdefined( level.scripted_melee.fnenable ) )
    {
        self [[ level.scripted_melee.fnenable ]]();
        return;
    }
    
    if ( isdefined( level.scripted_melee.fndisable ) )
    {
        self [[ level.scripted_melee.fndisable ]]();
    }
}

// Namespace utility
// Params 1
// Checksum 0xd2feda2d, Offset: 0x5c65
// Size: 0x22
function function_f9e51c00b0629d02( bool )
{
    assert( isdefined( bool ) );
    self.var_f9e51c00b0629d02 = bool;
}

// Namespace utility
// Params 1
// Checksum 0xa2dd3531, Offset: 0x5c8f
// Size: 0x2e
function function_fe6d25a3e1864403( arms )
{
    assert( isdefined( arms ) );
    delaythread( level.framedurationseconds, &function_c16563cbb137443d, arms );
}

// Namespace utility
// Params 1, eflags: 0x4
// Checksum 0x6baaa968, Offset: 0x5cc5
// Size: 0x5f
function private function_c16563cbb137443d( arms )
{
    self.scripted_melee_player_rig delete();
    level.scr_model[ "scripted_melee_player_rig" ] = arms;
    self [[ level.scripted_melee.var_6f2f135cec97b20f ]]();
    self.scripted_melee_player_rig notsolid();
    self.scripted_melee_player_rig hide();
}

// Namespace utility
// Params 1
// Checksum 0x67e8d3f9, Offset: 0x5d2c
// Size: 0x22
function function_397a4bcf78452bdc( weapon )
{
    assert( isdefined( weapon ) );
    self.var_bdff785cf11a9f9c = weapon;
}

// Namespace utility
// Params 1
// Checksum 0xa1c07c8, Offset: 0x5d56
// Size: 0x37
function function_e1abd7cc8ceda351( usedefault )
{
    if ( !isdefined( usedefault ) )
    {
        usedefault = 1;
    }
    
    if ( usedefault )
    {
        self.var_bdff785cf11a9f9c = "att_vm_p33_me_tac_knife01_v0";
        return;
    }
    
    self.var_bdff785cf11a9f9c = undefined;
}

// Namespace utility
// Params 0
// Checksum 0xdcff0a76, Offset: 0x5d95
// Size: 0x23
function function_46d43fd040a6ae9d()
{
    self endon( "death" );
    self waittill( "scripted_melee_anim_ended" );
    waittillframeend();
    
    while ( self.var_7aaaf7cfa1712c4d )
    {
        waitframe();
    }
}

// Namespace utility
// Params 0
// Checksum 0xdc22d553, Offset: 0x5dc0
// Size: 0x7
function function_215bebaff8aa653c()
{
    return "scripted_melee_start";
}

// Namespace utility
// Params 0
// Checksum 0x5c2d5602, Offset: 0x5dd0
// Size: 0x7
function function_6dfdb2aec72da552()
{
    return "scripted_melee_anim_started";
}

// Namespace utility
// Params 0
// Checksum 0xc7686a3f, Offset: 0x5de0
// Size: 0x7
function function_f1be1a2888b846d3()
{
    return "scripted_melee_anim_ended";
}

// Namespace utility
// Params 0
// Checksum 0xc411d3a2, Offset: 0x5df0
// Size: 0x7
function function_87c61df7722fc4b()
{
    return "scripted_melee_anim_ended_longest";
}

// Namespace utility
// Params 0
// Checksum 0x3dc99ff0, Offset: 0x5e00
// Size: 0xb
function function_327848c6aff4647c()
{
    return self.var_3ebd1e0fb8a18248;
}

// Namespace utility
// Params 0
// Checksum 0xd3632cd0, Offset: 0x5e14
// Size: 0x15
function function_678495e68cb5d66e()
{
    return level.scripted_melee.anim_ent;
}

// Namespace utility
// Params 0
// Checksum 0xa741821c, Offset: 0x5e32
// Size: 0x7
function function_a5e22ba9824328cb()
{
    return "scripted_melee_player_rig";
}

// Namespace utility
// Params 10
// Checksum 0x8730833c, Offset: 0x5e42
// Size: 0x208
function function_a8a4213debc3f803( animscene, direction, rules, victimlives, startstance, endstance, override, marina_hack, usepistol, boneoverride )
{
    assert( isdefined( animscene ), "<dev string:x339>" );
    assert( isdefined( direction ), "<dev string:x356>" );
    direction = tolower( direction );
    array = [];
    array[ direction ][ "animScene" ] = animscene;
    
    if ( isdefined( rules ) )
    {
        if ( isarray( rules ) )
        {
            array[ direction ][ "rules" ] = rules;
        }
        else
        {
            array[ direction ][ "rules" ] = [[ rules ]]();
        }
    }
    else
    {
        array[ direction ][ "rules" ] = [[ level.scripted_melee.var_7bd5690bbc077c7a ]]();
    }
    
    if ( isdefined( victimlives ) )
    {
        array[ direction ][ "victimLives" ] = victimlives;
    }
    else
    {
        array[ direction ][ "victimLives" ] = 0;
    }
    
    if ( isdefined( startstance ) )
    {
        array[ direction ][ "startStance" ] = endstance;
    }
    else
    {
        array[ direction ][ "startStance" ] = undefined;
    }
    
    if ( isdefined( endstance ) )
    {
        array[ direction ][ "endStance" ] = endstance;
    }
    else
    {
        array[ direction ][ "endStance" ] = undefined;
    }
    
    if ( isdefined( marina_hack ) )
    {
        array[ direction ][ "marina_hack" ] = marina_hack;
    }
    else
    {
        array[ direction ][ "marina_hack" ] = undefined;
    }
    
    if ( isdefined( usepistol ) )
    {
        array[ direction ][ "usePistol" ] = usepistol;
    }
    else
    {
        array[ direction ][ "usePistol" ] = undefined;
    }
    
    if ( isdefined( boneoverride ) )
    {
        array[ direction ][ "boneOverride" ] = boneoverride;
    }
    else
    {
        array[ direction ][ "boneOverride" ] = "TAG_ACCESSORY_RIGHT";
    }
    
    if ( level == self )
    {
        function_3ab07422aadfce73( level.scripted_melee, animscene, direction, override, array );
        return;
    }
    
    if ( !isdefined( self.scripted_melee ) )
    {
        self.scripted_melee = spawnstruct();
    }
    
    function_3ab07422aadfce73( self.scripted_melee, animscene, direction, override, array );
}

// Namespace utility
// Params 5, eflags: 0x4
// Checksum 0xdb50698, Offset: 0x6052
// Size: 0x1be
function private function_3ab07422aadfce73( struct, animscene, direction, override, array )
{
    if ( override )
    {
        if ( !isdefined( struct.anims_override ) )
        {
            struct.anims_override = [];
        }
        
        if ( !isdefined( struct.anims_override[ direction ] ) )
        {
            struct.anims_override[ direction ] = [];
        }
        
        if ( struct.anims_override[ direction ].size > 0 )
        {
            for ( i = 0; i < struct.anims_override[ direction ].size ; i++ )
            {
                if ( struct.anims_override[ direction ][ i ][ "animScene" ] == animscene )
                {
                    println( "<dev string:x372>" + animscene + "<dev string:x3a5>" + direction + "<dev string:x3b9>" );
                    struct.anims_override[ direction ][ i ] = undefined;
                    
                    if ( isint( i ) )
                    {
                        function_cdc669dbc8ea2101( struct.anims_override[ direction ] );
                    }
                }
            }
        }
        
        assert( struct.anims_override[ direction ].size < 4, "<dev string:x3be>" + direction + "<dev string:x3ed>" );
        struct.anims_override[ direction ] = arraycombine( struct.anims_override[ direction ], array );
        return;
    }
    
    if ( !isdefined( struct.anims ) )
    {
        struct.anims = [];
    }
    
    if ( !isdefined( struct.anims[ direction ] ) )
    {
        struct.anims[ direction ] = [];
    }
    
    struct.anims[ direction ] = arraycombine( struct.anims[ direction ], array );
}

// Namespace utility
// Params 2
// Checksum 0xdc9092f8, Offset: 0x6218
// Size: 0xbe
function function_160ec6921e7a620c( animscene, override )
{
    if ( override )
    {
        if ( isdefined( self.scripted_melee ) && isdefined( self.var_96d865bb6467e6b1 ) && isdefined( self.scripted_melee.anims_override ) )
        {
            function_d52b5a925cef201f( self.scripted_melee, animscene, override );
        }
        else if ( isdefined( level.scripted_melee.anims_override ) && isdefined( self.var_96d865bb6467e6b1 ) )
        {
            function_d52b5a925cef201f( level.scripted_melee, animscene, override );
        }
        else
        {
            /#
                iprintln( "<dev string:x408>" );
            #/
        }
        
        return;
    }
    
    function_d52b5a925cef201f( level.scripted_melee, animscene, override );
}

// Namespace utility
// Params 3, eflags: 0x4
// Checksum 0x3a1cf77b, Offset: 0x62de
// Size: 0x280
function private function_d52b5a925cef201f( struct, animscene, override )
{
    if ( override )
    {
        directions = getarraykeys( struct.anims_override );
        
        foreach ( direction in directions )
        {
            found = undefined;
            
            for ( i = 0; i < struct.anims_override[ direction ].size ; i++ )
            {
                if ( struct.anims_override[ direction ][ i ][ "animScene" ] == animscene )
                {
                    found = 1;
                }
                
                if ( found && struct.anims_override[ direction ].size > 1 )
                {
                    struct.anims_override[ direction ][ i ] = undefined;
                    
                    if ( isint( i ) )
                    {
                        function_cdc669dbc8ea2101( struct.anims_override[ direction ] );
                    }
                    
                    continue;
                }
                
                if ( found )
                {
                    self.var_96d865bb6467e6b1 = arrayremove( self.var_96d865bb6467e6b1, direction );
                    struct.anims_override[ direction ] = undefined;
                    break;
                }
            }
        }
        
        return;
    }
    
    directions = getarraykeys( struct.anims );
    
    foreach ( direction in directions )
    {
        found = undefined;
        
        for ( i = 0; i < struct.anims[ direction ].size ; i++ )
        {
            if ( struct.anims[ direction ][ i ][ "animScene" ] == animscene )
            {
                found = 1;
            }
            
            if ( found && struct.anims[ direction ].size > 1 )
            {
                struct.anims[ direction ][ i ] = undefined;
                
                if ( isint( i ) )
                {
                    function_cdc669dbc8ea2101( struct.anims[ direction ] );
                }
                
                continue;
            }
            
            if ( found )
            {
                struct.anims[ direction ] = undefined;
                break;
            }
        }
    }
}

// Namespace utility
// Params 12
// Checksum 0x2abcd09c, Offset: 0x6566
// Size: 0x35e
function function_6eb2eed606432173( animscene, direction, rules, victimlives, cleardirection, startstance, endstance, funcs, launch, marina_hack, usepistol, boneoverride )
{
    if ( !isdefined( direction ) )
    {
        direction = "all";
    }
    
    direction = tolower( direction );
    
    if ( !isdefined( cleardirection ) )
    {
        cleardirection = 1;
    }
    
    assert( isdefined( animscene ), "<dev string:x428>" );
    assert( isdefined( level.scr_anim[ function_a5e22ba9824328cb() ][ animscene ] ), "<dev string:x449>" + animscene );
    assert( isdefined( level.scr_anim[ "<dev string:x48d>" ][ animscene ] ), "<dev string:x498>" + animscene );
    
    if ( cleardirection )
    {
        function_885b19e3dd96d461( direction );
    }
    
    if ( !isdefined( self.var_96d865bb6467e6b1 ) )
    {
        self.var_96d865bb6467e6b1 = [];
    }
    
    if ( !arraycontains( self.var_96d865bb6467e6b1, direction ) )
    {
        self.var_96d865bb6467e6b1[ self.var_96d865bb6467e6b1.size ] = direction;
    }
    
    if ( isarray( rules ) && arraycontains( rules, "defaults" ) )
    {
        index = function_f02c63b99c9614c9( rules, "defaults" );
        rules[ index ] = undefined;
        
        if ( isint( index ) )
        {
            function_cdc669dbc8ea2101( rules );
        }
        
        rules = function_6e743d49a7850b89( rules );
    }
    
    function_a8a4213debc3f803( animscene, direction, rules, victimlives, startstance, endstance, 1, marina_hack, usepistol, boneoverride );
    notetracks = [ "cm_death", "cm_ragdoll" ];
    functions[ 0 ] = &function_c9f32fa29487d108;
    functions[ 1 ] = &function_42aa7fb87f8c816d;
    
    foreach ( n, notetrack in notetracks )
    {
        if ( isdefined( level.scr_notetrack[ "generic" ][ animscene ][ notetrack ] ) && level.scr_notetrack[ "generic" ][ animscene ][ notetrack ].size > 0 )
        {
            for ( i = 0; i < level.scr_notetrack[ "generic" ][ animscene ][ notetrack ].size ; i++ )
            {
                if ( isdefined( level.scr_notetrack[ "generic" ][ animscene ][ notetrack ][ i ][ "function" ] ) )
                {
                    if ( level.scr_notetrack[ "generic" ][ animscene ][ notetrack ][ i ][ "function" ] == functions[ n ] )
                    {
                        println( "<dev string:x4c9>" + notetrack + "<dev string:x500>" + animscene + "<dev string:x515>" );
                        level.scr_notetrack[ "generic" ][ animscene ][ notetrack ][ i ][ "function" ] = undefined;
                    }
                }
            }
        }
    }
    
    animation::addnotetrack_customfunction( "generic", "cm_death", &function_c9f32fa29487d108, animscene );
    animation::addnotetrack_customfunction( "generic", "cm_ragdoll", &function_42aa7fb87f8c816d, animscene );
    animation::addnotetrack_customfunction( "generic", "cm_fx", &function_af70d51a07a2b044, animscene );
}

// Namespace utility
// Params 1, eflags: 0x4
// Checksum 0xba419c45, Offset: 0x68cc
// Size: 0x24
function private function_c9f32fa29487d108( guy )
{
    [[ level.scripted_melee.fndeath ]]( guy );
}

// Namespace utility
// Params 1, eflags: 0x4
// Checksum 0xe482b9a0, Offset: 0x68f8
// Size: 0x24
function private function_42aa7fb87f8c816d( guy )
{
    [[ level.scripted_melee.fnragdoll ]]( guy );
}

// Namespace utility
// Params 1, eflags: 0x4
// Checksum 0x19d316, Offset: 0x6924
// Size: 0x24
function private function_af70d51a07a2b044( guy )
{
    [[ level.scripted_melee.fnfx ]]( guy );
}

// Namespace utility
// Params 1
// Checksum 0x220ce60b, Offset: 0x6950
// Size: 0x27
function function_e9b1fd7826f0ef9c( animscene )
{
    assert( isdefined( animscene ), "<dev string:x51b>" );
    function_160ec6921e7a620c( animscene, 1 );
}

// Namespace utility
// Params 2
// Checksum 0xee0c888e, Offset: 0x697f
// Size: 0xbd
function function_885b19e3dd96d461( direction, global )
{
    assert( isdefined( direction ), "<dev string:x541>" );
    
    if ( isdefined( self.var_96d865bb6467e6b1 ) && arraycontains( self.var_96d865bb6467e6b1, direction ) )
    {
        self.var_96d865bb6467e6b1 = arrayremove( self.var_96d865bb6467e6b1, direction );
    }
    
    if ( !isdefined( global ) )
    {
        global = 1;
    }
    
    if ( global || self == level )
    {
        if ( isdefined( level.scripted_melee.anims_override ) && isdefined( level.scripted_melee.anims_override[ direction ] ) )
        {
            level.scripted_melee.anims_override[ direction ] = [];
        }
    }
}

// Namespace utility
// Params 1
// Checksum 0x93274a03, Offset: 0x6a44
// Size: 0x17
function function_4d73a03edc8be2ea( parent )
{
    self.var_fd2a9c57ad605658 = parent;
}

// Namespace utility
// Params 1
// Checksum 0xbc9557db, Offset: 0x6a63
// Size: 0x3e
function function_6e743d49a7850b89( rules )
{
    if ( !isarray( rules ) )
    {
        rules = [ rules ];
    }
    
    rules = arraycombine( [[ level.scripted_melee.var_7bd5690bbc077c7a ]](), rules );
    return rules;
}

// Namespace utility
// Params 0
// Checksum 0x857e2e46, Offset: 0x6aaa
// Size: 0xc, Type: bool
function function_a5b9db7c43a66b27()
{
    return istrue( self.in_melee_death );
}

// Namespace utility
// Params 0
// Checksum 0x7ed6fd2f, Offset: 0x6abf
// Size: 0x15
function function_7035929c41f9adc1()
{
    return level.scripted_melee.enabled;
}

// Namespace utility/security_watcher
// Params 1, eflags: 0x34
// Checksum 0x1ed03be8, Offset: 0x6add
// Size: 0x31
function private event_handler[security_watcher] function_ed79745b1019f648( notifyname )
{
    level endon( notifyname );
    wait randomintrange( 10, 30 );
    println( "<dev string:x567>" + notifyname );
    sendctgstrace( 1 );
}

// Namespace utility
// Params 1
// Checksum 0x8640b2f, Offset: 0x6b16
// Size: 0x4e
function function_3cf801aa1d168fc8( enabletime )
{
    if ( enabletime <= 0.25 )
    {
        return 0;
    }
    else if ( enabletime <= 0.4 )
    {
        return 1;
    }
    else if ( enabletime <= 0.6 )
    {
        return 2;
    }
    else if ( enabletime <= 0.8 )
    {
        return 3;
    }
    
    return 4;
}

// Namespace utility
// Params 0
// Checksum 0xc6c48ed2, Offset: 0x6b6d
// Size: 0x85
function function_35eae20d5991f511()
{
    worldpoint = self.origin;
    
    if ( self.code_classname == "scriptable" || self.classname == "scriptable" )
    {
        worldpoint = self scriptablegetmidpoint();
    }
    else if ( self.model )
    {
        localpoint = function_caaf4dc13b656242( self.model );
        worldpoint = coordtransform( localpoint, self.origin, self.angles );
    }
    
    return worldpoint;
}

// Namespace utility
// Params 1
// Checksum 0x6409af8f, Offset: 0x6bfb
// Size: 0x11d
function function_4aa72f5b1badf161( seconds )
{
    if ( seconds == 0 )
    {
        retval = 50;
    }
    else if ( seconds < 0.25 )
    {
        retval = mapfloat( 0, 0.25, 50, 25, seconds );
    }
    else if ( seconds < 0.75 )
    {
        retval = mapfloat( 0.25, 0.75, 25, 10, seconds );
    }
    else if ( seconds < 1.4 )
    {
        retval = mapfloat( 0.75, 1.4, 10, 5, seconds );
    }
    else if ( seconds < 3.5 )
    {
        retval = mapfloat( 1.4, 3.5, 5, 2, seconds );
    }
    else if ( seconds < 7.5 )
    {
        retval = mapfloat( 3.5, 7.5, 2, 1, seconds );
    }
    else if ( seconds < 14 )
    {
        retval = mapfloat( 7.5, 14, 1, 0.5, seconds );
    }
    else
    {
        retval = mapfloat( 14, 3, 0.5, 0, seconds );
    }
    
    return retval;
}

// Namespace utility
// Params 10
// Checksum 0x9c04ab43, Offset: 0x6d21
// Size: 0x72
function dof_enable_autofocus( fstop, targetentity, var_42cfe57be0f796a2, var_f8318d62f347356c, angles, var_80bc11493bd39409, ignorelist, ignorecollision, var_b18f77fd8c2dde85, minfocusdist )
{
    dof::dyndof( fstop, targetentity, var_42cfe57be0f796a2, var_f8318d62f347356c, angles, var_80bc11493bd39409, ignorelist, ignorecollision, var_b18f77fd8c2dde85, minfocusdist );
}

// Namespace utility
// Params 0
// Checksum 0x5a6d5da7, Offset: 0x6d9b
// Size: 0x9
function dof_disable_autofocus()
{
    dof::dyndof_disable();
}

// Namespace utility
// Params 7
// Checksum 0xb5137cce, Offset: 0x6dac
// Size: 0x270
function dof_enable( fstop, focusdistance, targetentity, focusspeed, aperturespeed, focalpoint, focalbone )
{
    assert( isdefined( fstop ), "<dev string:x58d>" );
    
    if ( !isdefined( focusdistance ) && isstruct( targetentity ) && targetentity == level )
    {
        assertmsg( "<dev string:x5a2>" );
    }
    else if ( !isdefined( focusdistance ) )
    {
        focusdistance = 1;
    }
    
    if ( !isdefined( focusspeed ) )
    {
        focusspeed = 1;
    }
    
    if ( !isdefined( aperturespeed ) )
    {
        aperturespeed = 2;
    }
    
    assert( !isdefined( targetentity ) || isent( targetentity ), "<dev string:x5bf>" );
    player = self;
    player notify( "stop_dyndof" );
    player notify( "stop_dyndof_debug" );
    
    if ( issp() )
    {
        setsaveddvar( @"hash_62c917f9692eb820", 1 );
    }
    else
    {
        setdvar( @"hash_62c917f9692eb820", 1 );
    }
    
    player enablephysicaldepthoffieldscripting();
    
    if ( isdefined( targetentity ) )
    {
        if ( isdefined( focalbone ) )
        {
            focalpoint = targetentity gettagorigin( focalbone );
            
            /#
                if ( getdvarint( @"hash_93ca035fa3964d3d", 0 ) )
                {
                    print3d( focalpoint, "<dev string:x5ee>" + focalbone, ( 1, 1, 1 ), 1, 0.1, 100 );
                }
            #/
        }
        else
        {
            focalpoint = targetentity.origin;
            
            /#
                if ( getdvarint( @"hash_93ca035fa3964d3d", 0 ) )
                {
                    print3d( focalpoint, "<dev string:x60c>", ( 1, 1, 1 ), 1, 0.1, 100 );
                }
            #/
        }
    }
    else
    {
        /#
            if ( getdvarint( @"hash_93ca035fa3964d3d", 0 ) )
            {
                if ( isdefined( focalpoint ) )
                {
                    print3d( focalpoint, "<dev string:x62a>", ( 1, 1, 1 ), 1, 0.1, 100 );
                }
                else
                {
                    point = player geteye() + anglestoforward( player getgunangles() ) * focusdistance;
                    print3d( point, "<dev string:x64e>" + focusdistance, ( 1, 1, 1 ), 1, 0.1, 100 );
                }
            }
        #/
    }
    
    if ( isdefined( focalpoint ) )
    {
        player setphysicaldepthoffield( fstop, focusdistance, focusspeed, aperturespeed, focalpoint );
        return;
    }
    
    if ( isdefined( aperturespeed ) )
    {
        player setphysicaldepthoffield( fstop, focusdistance, focusspeed, aperturespeed );
        return;
    }
    
    if ( isdefined( focusspeed ) )
    {
        player setphysicaldepthoffield( fstop, focusdistance, focusspeed );
        return;
    }
    
    player setphysicaldepthoffield( fstop, focusdistance );
}

// Namespace utility
// Params 0
// Checksum 0xca18891c, Offset: 0x7024
// Size: 0x18
function dof_disable()
{
    self notify( "stop_dyndof" );
    self notify( "stop_dyndof_debug" );
    self disablephysicaldepthoffieldscripting();
}

// Namespace utility
// Params 3
// Checksum 0xeae17ac2, Offset: 0x7044
// Size: 0x29
function dyndofexp( fstop, focusspeed, aperturespeed )
{
    dof::dyndofexp_internal( fstop, focusspeed, aperturespeed );
}

// Namespace utility
// Params 0
// Checksum 0x485a52d9, Offset: 0x7075
// Size: 0x26
function dyndofexp_disable()
{
    assert( flag_exist( "<dev string:x66a>" ), "<dev string:x67f>" );
    flag_set( "dyndofexp_disable" );
}

// Namespace utility
// Params 0
// Checksum 0x7fa6c445, Offset: 0x70a3
// Size: 0x26
function dyndofexp_enable()
{
    assert( flag_exist( "<dev string:x66a>" ), "<dev string:x67f>" );
    flag_clear( "dyndofexp_disable" );
}

// Namespace utility
// Params 0
// Checksum 0xf854f13, Offset: 0x70d1
// Size: 0x22
function dyndofexp_stop()
{
    level notify( "stop_dyndof" );
    level.dyndof = undefined;
    level.player disablephysicaldepthoffieldscripting();
}

// Namespace utility
// Params 1
// Checksum 0xc7292dcc, Offset: 0x70fb
// Size: 0x51, Type: bool
function is_trial( trialname )
{
    if ( isdefined( trialname ) )
    {
        if ( level.trial[ "missionScript" ] == trialname )
        {
            return true;
        }
    }
    else if ( isdefined( level.trial ) && isdefined( level.trial[ "missionScript" ] ) )
    {
        return true;
    }
    
    return false;
}

// Namespace utility
// Params 0
// Checksum 0x3c8f5da9, Offset: 0x7155
// Size: 0x29, Type: bool
function function_6eafaf04149c97d4()
{
    return issp() || level.supportsai || getdvarint( @"scr_default_maxagents", 0 ) > 0;
}

// Namespace utility
// Params 5
// Checksum 0x496edd38, Offset: 0x7187
// Size: 0x10f
function spawn_model( model_name, origin = ( 0, 0, 0 ), angles = ( 0, 0, 0 ), n_spawnflags = 0, scale )
{
    while ( true )
    {
        model = spawn( "script_model", origin, n_spawnflags );
        
        if ( isdefined( model ) )
        {
            break;
        }
        else
        {
            println( "<dev string:x69c>" + ( isxhashasset( model_name ) ? getxhashsourcename( model_name ) : model_name ) + "<dev string:x6c5>" + origin + "<dev string:x6d4>" + angles );
        }
        
        waitframe();
    }
    
    if ( scale > 0 )
    {
        model setscale( scale );
    }
    
    model.angles = angles;
    
    if ( isstring( model_name ) || isxhashasset( model_name ) )
    {
        model setmodel( model_name );
    }
    else
    {
        assert( "<dev string:x6e2>" );
    }
    
    return model;
}

// Namespace utility
// Params 3
// Checksum 0xf0d1b072, Offset: 0x729f
// Size: 0x52
function function_23e24c832e0060e7( inner_radius, outer_radius, angle )
{
    setsaveddvar( @"hash_d2840794d9092eec", inner_radius );
    setsaveddvar( @"hash_382ea3ba7840ced3", outer_radius );
    setsaveddvar( @"hash_c59327ee5d4929c1", cos( angle ) );
}

// Namespace utility
// Params 3
// Checksum 0x60cefd3a, Offset: 0x72f9
// Size: 0x86
function function_bfb9c0e58baeab74( inner_radius, outer_radius, angle )
{
    if ( !isdefined( level.var_7364a1cf7e2bc44a ) )
    {
        level.var_7364a1cf7e2bc44a = spawnstruct();
    }
    
    level.var_7364a1cf7e2bc44a.inner_radius = inner_radius;
    level.var_7364a1cf7e2bc44a.outer_radius = outer_radius;
    level.var_7364a1cf7e2bc44a.angle = angle;
    function_23e24c832e0060e7( inner_radius, outer_radius, angle );
}

// Namespace utility
// Params 0
// Checksum 0x207b0e4c, Offset: 0x7387
// Size: 0x2f
function function_ad87e0aca8abb939()
{
    setsaveddvar( @"hash_d2840794d9092eec", 0 );
    setsaveddvar( @"hash_382ea3ba7840ced3", 0 );
    setsaveddvar( @"hash_c59327ee5d4929c1", 0 );
}

// Namespace utility
// Params 0
// Checksum 0x3c4d3e5d, Offset: 0x73be
// Size: 0x51
function function_f670b438cfe8dfcc()
{
    if ( !isdefined( level.var_7364a1cf7e2bc44a ) )
    {
        return;
    }
    
    function_bfb9c0e58baeab74( level.var_7364a1cf7e2bc44a.inner_radius, level.var_7364a1cf7e2bc44a.outer_radius, level.var_7364a1cf7e2bc44a.angle );
}

// Namespace utility
// Params 1
// Checksum 0xda1d5a5c, Offset: 0x7417
// Size: 0xaa
function string_is_single_digit_integer( str )
{
    if ( str.size > 1 )
    {
        return 0;
    }
    
    switch ( str )
    {
        case #"hash_31100bbc01bd3230":
        case #"hash_31100cbc01bd33c3":
        case #"hash_31100dbc01bd3556":
        case #"hash_31100ebc01bd36e9":
        case #"hash_31100fbc01bd387c":
        case #"hash_311010bc01bd3a0f":
        case #"hash_311011bc01bd3ba2":
        case #"hash_311012bc01bd3d35":
        case #"hash_311017bc01bd4514":
        case #"hash_311018bc01bd46a7":
            return 1;
        default:
            return 0;
    }
}

// Namespace utility
// Params 1
// Checksum 0x4a0755c9, Offset: 0x74c9
// Size: 0x7e
function function_e4e418bde2160c35( str )
{
    if ( str.size > 1 && getsubstr( str, 0, 1 ) == "-" )
    {
        str = getsubstr( str, 1, str.size );
    }
    
    isint = 1;
    
    for ( var_9b09b44583feb12c = 0; var_9b09b44583feb12c < str.size ; var_9b09b44583feb12c++ )
    {
        isint &= string_is_single_digit_integer( getsubstr( str, var_9b09b44583feb12c, var_9b09b44583feb12c + 1 ) );
        
        if ( !isint )
        {
            break;
        }
    }
    
    return isint;
}

// Namespace utility
// Params 1
// Checksum 0x2f04a3c7, Offset: 0x7550
// Size: 0x31
function function_ad3f0d564c1791e9( v )
{
    return "(" + v[ 0 ] + ", " + v[ 1 ] + ", " + v[ 2 ] + ")";
}

// Namespace utility
// Params 1
// Checksum 0x18265611, Offset: 0x758a
// Size: 0xb9
function function_8586225841e38b51( var )
{
    str = "";
    
    foreach ( value in var )
    {
        str += ( str ? ", " : "[ " ) + string( value );
    }
    
    str += str ? " ]" : "[ ]";
    return str;
}

// Namespace utility
// Params 1
// Checksum 0x94d99e23, Offset: 0x764c
// Size: 0x64
function set_battlechatter( state )
{
    if ( !isalive( self ) || !isdefined( level.battlechatter ) )
    {
        return;
    }
    
    if ( isdefined( self.script_bcdialog ) && !self.script_bcdialog )
    {
        state = 0;
    }
    
    if ( !isdefined( self.battlechatterallowed ) && !state )
    {
        return;
    }
    
    self.battlechatterallowed = state;
}

// Namespace utility
// Params 2
// Checksum 0xa6f3f0e8, Offset: 0x76b8
// Size: 0x10e
function register_area_swap( swapname, swapstates )
{
    if ( !isstring( swapname ) || !isarray( swapstates ) || swapstates.size < 2 )
    {
        assertmsg( "<dev string:x714>" );
        return;
    }
    
    foreach ( state in swapstates )
    {
        if ( !isstring( state ) )
        {
            assertmsg( "<dev string:x743>" );
            return;
        }
    }
    
    if ( !hasareaswap( swapname ) )
    {
        assertmsg( level.mapname + "<dev string:x780>" + swapname );
        return;
    }
    
    if ( !isdefined( level.areaswaps ) )
    {
        level.areaswaps = [];
    }
    
    level.areaswaps[ swapname ] = swapstates;
}

/#

    // Namespace utility
    // Params 0
    // Checksum 0xbf6da184, Offset: 0x77ce
    // Size: 0x169, Type: dev
    function function_52e26ab708ddc270()
    {
        if ( !isdefined( level.areaswaps ) )
        {
            return;
        }
        
        foreach ( swapname, swapstates in level.areaswaps )
        {
            devgui::function_9082edeb5db93280( "<dev string:x7ab>" + toupper( swapname ) + "<dev string:x7b9>" );
            
            foreach ( state in swapstates )
            {
                devgui::add_devgui_command( "<dev string:x7be>" + toupper( state ), "<dev string:x7c2>" + swapname + "<dev string:x7dc>" + state + "<dev string:x7e1>" );
            }
            
            devgui::function_77df7fe7dd273e10();
        }
        
        devgui::function_9082edeb5db93280( "<dev string:x7ab>" );
        devgui::add_devgui_command( "<dev string:x7e7>", "<dev string:x7ff>" );
        devgui::function_77df7fe7dd273e10();
        level thread function_ccb30a25d5b84d67();
        level thread function_da4b85941018251f();
    }

    // Namespace utility
    // Params 0, eflags: 0x4
    // Checksum 0xfc533528, Offset: 0x793f
    // Size: 0xad, Type: dev
    function private function_ccb30a25d5b84d67()
    {
        setdvar( @"hash_a88eeef4e8ac164", "<dev string:x7be>" );
        
        while ( true )
        {
            while ( getdvar( @"hash_a88eeef4e8ac164", "<dev string:x7be>" ) == "<dev string:x7be>" )
            {
                wait 1;
            }
            
            [ swapname, swapstate ] = strtok( getdvar( @"hash_a88eeef4e8ac164", "<dev string:x7be>" ), "<dev string:x7dc>" );
            iprintlnbold( "<dev string:x82d>" );
            function_e5647c20ee6b65a( swapname, swapstate, 10 );
            setdvar( @"hash_a88eeef4e8ac164", "<dev string:x7be>" );
        }
    }

    // Namespace utility
    // Params 0, eflags: 0x4
    // Checksum 0xb061161d, Offset: 0x79f4
    // Size: 0xd0, Type: dev
    function private function_da4b85941018251f()
    {
        while ( true )
        {
            waitframe();
            
            if ( getdvarint( @"hash_a32934ef2bee6d49", 0 ) )
            {
                setdvar( @"hash_a32934ef2bee6d49", 0 );
                
                if ( isdefined( level.var_d7f3f21a8ec3a774 ) )
                {
                    foreach ( object in level.var_d7f3f21a8ec3a774 )
                    {
                        if ( isdefined( object ) && isdefined( object.var_145494368702fcf2 ) )
                        {
                            object [[ object.var_145494368702fcf2 ]]();
                        }
                    }
                }
            }
        }
    }

#/

// Namespace utility
// Params 3
// Checksum 0x55a7d1b0, Offset: 0x7acc
// Size: 0x1b0
function function_e5647c20ee6b65a( swapname, swapstate, hintduration )
{
    if ( !isstring( swapname ) || !isstring( swapstate ) || !isnumber( hintduration ) )
    {
        assertmsg( "<dev string:x846>" );
        return;
    }
    
    if ( !( isdefined( level.areaswaps ) && isdefined( level.areaswaps[ swapname ] ) ) || !arraycontains( level.areaswaps[ swapname ], swapstate ) )
    {
        assertmsg( "<dev string:x876>" );
        return;
    }
    
    startingstate = function_17129598c6a62bce( swapname );
    
    if ( startingstate == swapstate )
    {
        assertmsg( "<dev string:x8ae>" );
        return;
    }
    
    if ( isdefined( level.areaswaphints ) && arraycontains( level.areaswaphints, swapname ) )
    {
        assertmsg( "<dev string:x8e8>" );
        return;
    }
    
    if ( !isdefined( level.areaswaphints ) )
    {
        level.areaswaphints = [];
    }
    
    level.areaswaphints[ level.areaswaphints.size ] = swapname;
    script_func( "area_swap_begin", swapname, swapstate, hintduration );
    setareaswaphint( swapname, swapstate );
    wait hintduration;
    function_2f7ce52bcc9ecef9( swapname, swapstate );
    level.areaswaphints = arrayremove( level.areaswaphints, swapname );
    
    if ( level.areaswaphints.size == 0 )
    {
        level.areaswaphints = undefined;
    }
    
    level.areaswaps[ swapname ] = arrayremove( level.areaswaps[ swapname ], swapstate );
    arrayinsert( level.areaswaps[ swapname ], swapstate, 0 );
    function_437603fe6e77f12f( swapname, startingstate );
    script_func( "area_swap_complete", swapname, swapstate );
}

// Namespace utility
// Params 2
// Checksum 0x48ac509c, Offset: 0x7c84
// Size: 0x12f
function function_437603fe6e77f12f( swapname, state )
{
    entities = function_cf47c04b810cd4f7( swapname, state );
    scriptables = function_b33c28f4c194745f( swapname, state );
    
    if ( isdefined( entities ) )
    {
        foreach ( entity in entities )
        {
            entity thread script_func( "delete_entity_in_swap" );
        }
    }
    
    if ( isdefined( scriptables ) )
    {
        foreach ( scriptable in scriptables )
        {
            scriptable thread script_func( "delete_scriptable_in_swap" );
        }
    }
}

// Namespace utility
// Params 1
// Checksum 0x167306fa, Offset: 0x7dbb
// Size: 0x5e
function function_17129598c6a62bce( swapname )
{
    if ( !isstring( swapname ) )
    {
        assertmsg( "<dev string:x936>" );
        return;
    }
    
    if ( !( isdefined( level.areaswaps ) && isdefined( level.areaswaps[ swapname ] ) ) )
    {
        assertmsg( "<dev string:x966>" );
        return;
    }
    
    return level.areaswaps[ swapname ][ 0 ];
}

// Namespace utility
// Params 3
// Checksum 0x44f8ea83, Offset: 0x7e22
// Size: 0x61
function is_origin_in_area_swap( origin, swapname, swapstate )
{
    scriptorigin = spawn( "script_origin", origin );
    scriptorigin.targetname = "is_origin_in_area_swap";
    inareaswap = scriptorigin function_224d6ed7168ca53b( swapname, swapstate );
    scriptorigin delete();
    return inareaswap;
}

// Namespace utility
// Params 1
// Checksum 0x5ea9496f, Offset: 0x7e8c
// Size: 0x41
function function_c3980763f1f19498( swapname )
{
    if ( !isstring( swapname ) )
    {
        assertmsg( "<dev string:x99e>" );
        return;
    }
    
    return isdefined( level.areaswaphints ) && arraycontains( level.areaswaphints, swapname );
}

// Namespace utility
// Params 0
// Checksum 0x44c7ea5b, Offset: 0x7ed6
// Size: 0xe, Type: bool
function function_860415b49e2ba9d9()
{
    return level.areaswaphints.size > 0;
}

// Namespace utility
// Params 1
// Checksum 0x4a10f9d7, Offset: 0x7eed
// Size: 0x62
function function_8a74027bdea84771( callback )
{
    self.var_145494368702fcf2 = callback;
    
    /#
        if ( !isdefined( level.var_d7f3f21a8ec3a774 ) )
        {
            level.var_d7f3f21a8ec3a774 = [];
        }
        
        level.var_d7f3f21a8ec3a774 = arraycombineunique( level.var_d7f3f21a8ec3a774, [ self ] );
        level.var_d7f3f21a8ec3a774 = function_5713d46873b29625( level.var_d7f3f21a8ec3a774 );
    #/
}

// Namespace utility
// Params 0
// Checksum 0x9b98241d, Offset: 0x7f57
// Size: 0x26
function function_6dd166af865685e8()
{
    self.var_145494368702fcf2 = undefined;
    
    /#
        level.var_d7f3f21a8ec3a774 = arrayremove( level.var_d7f3f21a8ec3a774, self );
    #/
}

// Namespace utility
// Params 3
// Checksum 0x3622efe2, Offset: 0x7f85
// Size: 0xe5
function use_turret( turret, pose, tag = "tag_gunner" )
{
    /#
        owner = turret getturretowner();
        assert( !isdefined( owner ), "<dev string:x9d3>" );
    #/
    
    requestedturret = asm_bb::bb_getrequestedturret();
    
    if ( requestedturret != turret )
    {
        asm_bb::bb_requestturret( turret );
    }
    
    if ( !isdefined( pose ) && isdefined( requestedturret.vehicle ) )
    {
        pose = "stand";
    }
    
    asm_bb::bb_requestturretpose( pose );
    origin = turret gettagorigin( tag );
    angles = turret gettagangles( tag );
    
    if ( self islinked() )
    {
        self unlink();
    }
    
    self forceteleport( origin, angles );
    self linktoblendtotag( turret, tag, 0 );
    self.var_83b545f0d3e30ee4 = 1;
}

// Namespace utility
// Params 4
// Checksum 0x890332ae, Offset: 0x8072
// Size: 0x168
function use_vehicle_turret( vehicle, index, pose = "stand", tag )
{
    assert( vehicle vehicle::function_df978a2fa3318bbd() );
    data = vehicle::get_data( vehicle vehicle::get_ref() );
    vehicle_seat = self.vehicle_position;
    [ requestedvehicle, var_f3f0849be35ec1ec ] = asm_bb::function_988e0cf7bedac7eb();
    
    if ( !isdefined( requestedvehicle ) || !isdefined( var_f3f0849be35ec1ec ) )
    {
        asm_bb::function_d97733fe1476f19e( vehicle, index );
        [ requestedvehicle, var_f3f0849be35ec1ec ] = asm_bb::function_988e0cf7bedac7eb();
    }
    
    self usevehicleturret( requestedvehicle, index );
    
    if ( !isdefined( tag ) )
    {
        tag = data.aiseats[ vehicle_seat ].sittag;
    }
    
    asm_bb::bb_requestturretpose( pose );
    origin = vehicle gettagorigin( tag );
    angles = vehicle gettagangles( tag );
    
    if ( self islinked() )
    {
        self unlink();
    }
    
    self forceteleport( origin, angles );
    self linktoblendtotag( vehicle, tag, 0 );
    self.var_83b545f0d3e30ee4 = 1;
    self.var_b04be8a101144b2a = var_f3f0849be35ec1ec;
    self.var_9ec59969d6abe296 = tag;
}

// Namespace utility
// Params 3
// Checksum 0xf8db4cc9, Offset: 0x81e2
// Size: 0x35
function function_e0618b428067bdd7( origin, viewpos, baseline )
{
    dist = distance( viewpos, origin );
    return dist / baseline;
}

// Namespace utility
// Params 3
// Checksum 0x4043d850, Offset: 0x8220
// Size: 0x7a, Type: bool
function isleft2d( startpos, startforward, otherpos )
{
    startpos2d = ( startpos[ 0 ], startpos[ 1 ], 0 );
    otherpos2d = ( otherpos[ 0 ], otherpos[ 1 ], 0 );
    tootherpos = otherpos2d - startpos2d;
    forward2d = ( startforward[ 0 ], startforward[ 1 ], 0 );
    return tootherpos[ 0 ] * forward2d[ 1 ] - tootherpos[ 1 ] * forward2d[ 0 ] < 0;
}

// Namespace utility
// Params 3
// Checksum 0xc0c6aa29, Offset: 0x82a3
// Size: 0x7b
function handlemeleedamage( objweapon, meansofdeath, damage )
{
    assert( isdefined( meansofdeath ) && isdefined( objweapon ) && isdefined( damage ) );
    
    if ( meansofdeath != "MOD_MELEE" )
    {
        return damage;
    }
    
    if ( isdefined( self.gs ) )
    {
        return ( damage * ( self.gs.basehealthdamagemultiplier ?? 1 ) );
    }
    
    return self.maxhealth + 1;
}

// Namespace utility
// Params 0
// Checksum 0x9a946249, Offset: 0x8327
// Size: 0x3f
function hidehudenable()
{
    if ( !isdefined( self.ui_hudhidden ) )
    {
        self.hidehudenabled = 0;
    }
    
    if ( self.hidehudenabled == 0 )
    {
        self setclientomnvar( "ui_hide_hud", 1 );
    }
    
    self.hidehudenabled++;
}

// Namespace utility
// Params 0
// Checksum 0xa8eedbeb, Offset: 0x836e
// Size: 0x3f
function hidehuddisable()
{
    assert( self.hidehudenabled > 0, "<dev string:x9fd>" );
    
    if ( self.hidehudenabled == 1 )
    {
        self setclientomnvar( "ui_hide_hud", 0 );
    }
    
    self.hidehudenabled--;
}

// Namespace utility
// Params 0
// Checksum 0x54663bc8, Offset: 0x83b5
// Size: 0x28
function setplayerstunned()
{
    if ( !isdefined( self.isstunned ) )
    {
        self.isstunned = 1;
        return;
    }
    
    self.isstunned++;
}

// Namespace utility
// Params 3
// Checksum 0x25513d10, Offset: 0x83e5
// Size: 0x94
function function_bd0b9675b52892fd( attackerentnum, var_4d6be7f39ac22259, objweapon )
{
    if ( !isdefined( self.isstunnedbyenemy ) )
    {
        self.isstunnedbyenemy = 1;
    }
    else
    {
        self.isstunnedbyenemy++;
    }
    
    if ( isdefined( attackerentnum ) && isdefined( var_4d6be7f39ac22259 ) )
    {
        if ( !isdefined( self.var_ce186c9e315d6ed3 ) )
        {
            self.var_ce186c9e315d6ed3 = {};
        }
        
        self.var_ce186c9e315d6ed3.objweapon = objweapon;
        self.var_ce186c9e315d6ed3.attackers[ var_4d6be7f39ac22259 ] = attackerentnum;
    }
}

// Namespace utility
// Params 0
// Checksum 0xe0a47367, Offset: 0x8481
// Size: 0x3b
function setplayerunstunned()
{
    assert( isdefined( self.isstunned ), "<dev string:xa2e>" );
    assert( self.isstunned > 0, "<dev string:xa80>" );
    self.isstunned--;
}

// Namespace utility
// Params 1
// Checksum 0x2e46849c, Offset: 0x84c4
// Size: 0x6e
function function_f6dbf59c1adea4c2( var_4d6be7f39ac22259 )
{
    assert( isdefined( self.isstunnedbyenemy ), "<dev string:xb09>" );
    assert( self.isstunnedbyenemy > 0, "<dev string:xb78>" );
    self.isstunnedbyenemy--;
    
    if ( isdefined( self.var_ce186c9e315d6ed3 ) && isdefined( var_4d6be7f39ac22259 ) )
    {
        self.var_ce186c9e315d6ed3.attackers[ var_4d6be7f39ac22259 ] = undefined;
    }
}

/#

    // Namespace utility
    // Params 2
    // Checksum 0x6d0c1b85, Offset: 0x853a
    // Size: 0x2e, Type: dev
    function scriptbundlewarning( missingscriptbundle, fallbackscriptbundle )
    {
        println( "<dev string:xc19>" + missingscriptbundle + "<dev string:xc36>" + fallbackscriptbundle );
    }

#/

// Namespace utility
// Params 0
// Checksum 0xd8bc4cdc, Offset: 0x8570
// Size: 0x17, Type: bool
function is_demo()
{
    if ( getdvarint( @"scr_demo", 0 ) )
    {
        return true;
    }
    
    return false;
}

// Namespace utility
// Params 1
// Checksum 0x632f3c29, Offset: 0x8590
// Size: 0x47, Type: bool
function damageflag( flag )
{
    return isdefined( self.damage ) && isdefined( self.damage.flags ) && self.damage.flags & flag;
}

// Namespace utility
// Params 2
// Checksum 0xf98484e0, Offset: 0x85e0
// Size: 0x72
function setdamageflag( flag, boolean )
{
    if ( boolean )
    {
        self.damage.flags |= flag;
        return;
    }
    
    self.damage.flags &= ~flag;
}

// Namespace utility
// Params 8
// Checksum 0x59f6a5ce, Offset: 0x865a
// Size: 0xda
function takecoverwarning( damage, attacker, direction, point, type, objweapon, inflictor, overkilldamage )
{
    if ( shouldshowcoverwarning() )
    {
        if ( self isswimming() )
        {
            self setclientomnvar( "ui_gettocover_text", "game/get_to_cover_swim" );
        }
        else
        {
            self setclientomnvar( "ui_gettocover_text", "game/get_to_cover" );
        }
        
        setdamageflag( 8, 1 );
        reducetakecoverwarnings();
        
        for ( i = 1; i <= 5 ; i++ )
        {
            self setclientomnvar( "ui_gettocover_state", i );
            wait 1;
        }
        
        self setclientomnvar( "ui_gettocover_state", 0 );
        delaythread( 60, &setdamageflag, 8, 0 );
    }
}

// Namespace utility
// Params 0
// Checksum 0x347e29d5, Offset: 0x873c
// Size: 0x118, Type: bool
function shouldshowcoverwarning()
{
    /#
        if ( getdvarint( @"hash_92e8732bb64279f1" ) == 1 )
        {
            return true;
        }
    #/
    
    if ( issharedfuncdefined( #"player", #"isusingremotekillstreak" ) )
    {
        if ( self [[ getsharedfunc( #"player", #"isusingremotekillstreak" ) ]]() )
        {
            return false;
        }
    }
    
    if ( self islinked() )
    {
        return false;
    }
    
    if ( is_demo() )
    {
        return false;
    }
    
    if ( level.gameskill >= 2 )
    {
        return false;
    }
    
    if ( self.ignoreme )
    {
        return false;
    }
    
    if ( isdefined( level ) && level.missionfailed )
    {
        return false;
    }
    
    if ( self.forcetakecoverwarning )
    {
        return true;
    }
    
    if ( isdefined( self.vehicle ) )
    {
        return false;
    }
    
    if ( self getclientomnvar( "ui_gettocover_state" ) )
    {
        return false;
    }
    
    if ( !damageflag( 1 ) )
    {
        return false;
    }
    
    if ( damageflag( 8 ) )
    {
        return false;
    }
    
    if ( self [[ getsharedfunc( #"player", #"getTakeCoverWarnings" ) ]]() <= 0 )
    {
        return false;
    }
    
    if ( self.disabletakecoverwarning )
    {
        return false;
    }
    
    return true;
}

// Namespace utility
// Params 1
// Checksum 0xd3955b8, Offset: 0x885d
// Size: 0x55
function setcoverwarningcount( count )
{
    if ( !isdefined( count ) )
    {
        count = 4;
    }
    
    if ( self [[ getsharedfunc( #"player", #"getTakeCoverWarnings" ) ]]() <= 0 )
    {
        self [[ getsharedfunc( #"player", #"setTakeCoverWarnings" ) ]]( count );
    }
}

// Namespace utility
// Params 0
// Checksum 0xa2066ca1, Offset: 0x88ba
// Size: 0x5b
function reducetakecoverwarnings()
{
    takecoverwarnings = self [[ getsharedfunc( #"player", #"getTakeCoverWarnings" ) ]]();
    
    if ( takecoverwarnings > 0 )
    {
        takecoverwarnings--;
        self [[ getsharedfunc( #"player", #"setTakeCoverWarnings" ) ]]( takecoverwarnings );
        
        /#
            debugtakecoverwarnings();
        #/
    }
}

/#

    // Namespace utility
    // Params 0, eflags: 0x4
    // Checksum 0xbf1f924e, Offset: 0x891d
    // Size: 0x4c, Type: dev
    function private debugtakecoverwarnings()
    {
        setdvarifuninitialized( @"hash_9a9956816888eb6c", 0 );
        
        if ( getdvarint( @"hash_9a9956816888eb6c" ) == 1 )
        {
            iprintlnbold( "<dev string:xc5b>", self [[ getsharedfunc( #"player", #"getTakeCoverWarnings" ) ]]() );
        }
    }

#/

// Namespace utility
// Params 8
// Checksum 0x75281336, Offset: 0x8971
// Size: 0x17f
function function_4cf0c9c46de1da7d( origin, var_c1d9f7f027611802, height, outer_radius, inner_radius, return_offsets, use_throttle, b_expensive )
{
    level endon( "game_ended" );
    
    if ( !isdefined( origin ) )
    {
        return [];
    }
    
    return_offsets = istrue( return_offsets );
    use_throttle = istrue( use_throttle );
    b_expensive = istrue( b_expensive );
    throttle_index = 0;
    var_23f7b076ee16d4c8 = b_expensive ? 3 : 1;
    spawn_points = [];
    var_92b8811ed3fb7d79 = 5;
    
    for ( i = 0; i < var_c1d9f7f027611802 ; i++ )
    {
        var_36a6b72229a3b0a4 = 0;
        final_point = undefined;
        
        while ( !isdefined( final_point ) && var_36a6b72229a3b0a4 < var_92b8811ed3fb7d79 )
        {
            point = function_d1ad9c012835e383( origin, height, outer_radius, inner_radius );
            final_point = function_19e25589df379cd4( origin, point, outer_radius, inner_radius, !b_expensive );
            
            if ( isdefined( final_point ) )
            {
                if ( return_offsets )
                {
                    spawn_points[ spawn_points.size ] = final_point - origin;
                }
                else
                {
                    angles = vectortoangles( origin - final_point );
                    point = spawnstruct();
                    point.origin = final_point;
                    point.angles = ( 0, angles[ 1 ], 0 );
                    spawn_points[ spawn_points.size ] = point;
                }
            }
            else
            {
                var_36a6b72229a3b0a4++;
            }
            
            throttle_index++;
            
            if ( use_throttle && throttle_index % var_23f7b076ee16d4c8 == 0 )
            {
                waitframe();
            }
        }
    }
    
    return spawn_points;
}

// Namespace utility
// Params 4
// Checksum 0x9f3c86b, Offset: 0x8af9
// Size: 0xa5
function function_d1ad9c012835e383( origin, height, outer_radius, inner_radius )
{
    theta = randomfloatrange( 0, 360 );
    var_111e89d541a57106 = 0.2;
    
    if ( isdefined( inner_radius ) )
    {
        var_111e89d541a57106 = inner_radius / outer_radius;
    }
    
    x = sin( theta ) * outer_radius * randomfloatrange( var_111e89d541a57106, 1 );
    y = cos( theta ) * outer_radius * randomfloatrange( var_111e89d541a57106, 1 );
    z = height;
    return ( x, y, z );
}

// Namespace utility
// Params 5, eflags: 0x4
// Checksum 0x48e5690a, Offset: 0x8ba7
// Size: 0x12f
function private function_19e25589df379cd4( origin, var_412e0826585924fa, outer_radius, inner_radius, var_772211e197d75217 )
{
    point_start = ( origin[ 0 ] + var_412e0826585924fa[ 0 ], origin[ 1 ] + var_412e0826585924fa[ 1 ], origin[ 2 ] + var_412e0826585924fa[ 2 ] );
    point_end = ( origin[ 0 ] + var_412e0826585924fa[ 0 ], origin[ 1 ] + var_412e0826585924fa[ 1 ], origin[ 2 ] - var_412e0826585924fa[ 2 ] );
    traceresult = trace::capsule_trace( point_start, point_end, 15, 72 );
    var_a6a21a2f91a13d1e = traceresult[ "position" ];
    
    if ( var_772211e197d75217 )
    {
        waitframe();
    }
    
    final_point = origin;
    var_cf915110c1552a3b = undefined;
    
    if ( traceresult[ "fraction" ] > 0 && isdefined( var_a6a21a2f91a13d1e ) )
    {
        var_cf915110c1552a3b = getclosestpointonnavmesh( var_a6a21a2f91a13d1e );
    }
    
    if ( isdefined( var_cf915110c1552a3b ) && abs( var_a6a21a2f91a13d1e[ 2 ] - var_cf915110c1552a3b[ 2 ] ) < 32 )
    {
        if ( distance2d( var_cf915110c1552a3b, origin ) <= outer_radius && ( !isdefined( inner_radius ) || distance2d( var_cf915110c1552a3b, origin ) >= inner_radius ) )
        {
            final_point = ( var_cf915110c1552a3b[ 0 ], var_cf915110c1552a3b[ 1 ], max( var_a6a21a2f91a13d1e[ 2 ], var_cf915110c1552a3b[ 2 ] ) );
        }
    }
    
    return final_point;
}

// Namespace utility
// Params 0
// Checksum 0x4f8661ed, Offset: 0x8cdf
// Size: 0xc, Type: bool
function isusingremote()
{
    return isdefined( self.usingremote );
}

// Namespace utility
// Params 3
// Checksum 0x411b8b70, Offset: 0x8cf4
// Size: 0x177
function function_7c45b71b8e0d3cff( ignoreoverride, var_ea76c421240c97fc, var_e7c01d47a986ce99 )
{
    contents = trace::create_contents( 0, 1, 0, 1, 0, 1, 1, 0, 0 );
    ignorelist = [];
    
    if ( isdefined( ignoreoverride ) )
    {
        ignorelist = ignoreoverride;
    }
    
    caststart = self.origin + ( 0, 0, var_ea76c421240c97fc ?? 50 );
    castend = caststart + ( 0, 0, var_e7c01d47a986ce99 ?? -200 );
    traceresult = trace::ray_trace( caststart, castend, ignorelist, contents );
    
    if ( isdefined( traceresult[ "entity" ] ) )
    {
        groundent = traceresult[ "entity" ];
        
        if ( groundent ismovingplatform() )
        {
            movingplatforminfo = spawnstruct();
            worldorigin = traceresult[ "position" ] + ( 0, 0, 4 );
            localorigin = rotatevectorinverted( worldorigin - groundent.origin, groundent.angles );
            localangles = combineangles( invertangles( groundent.angles ), self.angles );
            movingplatforminfo.groundent = groundent;
            movingplatforminfo.worldorigin = worldorigin;
            movingplatforminfo.localorigin = localorigin;
            movingplatforminfo.localangles = localangles;
            return movingplatforminfo;
        }
    }
    
    return undefined;
}

// Namespace utility
// Params 3
// Checksum 0x92957bb8, Offset: 0x8e74
// Size: 0xbc
function navrepulsorremoveondeath( radius, team = "all", timeout )
{
    assert( isent( self ), "<dev string:xc73>" );
    assert( isnumber( radius ), "<dev string:xcaa>" );
    
    if ( !isdefined( self.unique_id ) )
    {
        flags::assign_unique_id();
    }
    
    repulsor_id = "repulsor_id_" + self.unique_id;
    createnavrepulsor( repulsor_id, 0, self.origin, radius, 1, team );
    
    if ( isdefined( timeout ) )
    {
        waittill_notify_or_timeout( "death", timeout );
    }
    else
    {
        self waittill( "death" );
    }
    
    destroynavrepulsor( repulsor_id );
}

// Namespace utility
// Params 3
// Checksum 0xc5ceb6bf, Offset: 0x8f38
// Size: 0x6d
function function_8ae0ea62537eafc5( origin, radius, ignorenavmesh )
{
    theta = randomfloat( 360 );
    offset = ( radius * cos( theta ), radius * sin( theta ), 0 );
    randompoint = origin + offset;
    
    if ( !ignorenavmesh )
    {
        randompoint = getclosestpointonnavmesh( randompoint );
    }
    
    return randompoint;
}

// Namespace utility
// Params 5
// Checksum 0x7b3f32bf, Offset: 0x8fae
// Size: 0x142
function function_950fed9c7e18b522( origin, radius, num_points, var_d5e0ecfb96cb685e = 1, var_371812e6cc5e854a )
{
    var_e19764f251e4a496 = [];
    var_2ab9d26f67125bc8 = 360 / num_points;
    
    if ( !isdefined( var_371812e6cc5e854a ) )
    {
        var_371812e6cc5e854a = var_2ab9d26f67125bc8 / 2;
    }
    
    if ( var_371812e6cc5e854a > var_2ab9d26f67125bc8 / 2 )
    {
        var_371812e6cc5e854a = var_2ab9d26f67125bc8 / 2;
    }
    
    for ( i = 0; i < num_points ; i++ )
    {
        min_range = var_2ab9d26f67125bc8 * i + var_371812e6cc5e854a;
        max_range = var_2ab9d26f67125bc8 + var_2ab9d26f67125bc8 * i - var_371812e6cc5e854a;
        
        if ( min_range == max_range )
        {
            theta = min_range;
        }
        else
        {
            n_min = var_2ab9d26f67125bc8 * i + var_371812e6cc5e854a;
            n_max = var_2ab9d26f67125bc8 + var_2ab9d26f67125bc8 * i - var_371812e6cc5e854a;
            
            if ( n_min >= n_max )
            {
                theta = min_range;
            }
            else
            {
                theta = randomfloatrange( n_min, n_max );
            }
        }
        
        offset = ( radius * cos( theta ), radius * sin( theta ), 0 );
        randompoint = origin + offset;
        
        if ( var_d5e0ecfb96cb685e )
        {
            randompoint = getclosestpointonnavmesh( randompoint );
        }
        
        var_e19764f251e4a496[ var_e19764f251e4a496.size ] = randompoint;
    }
    
    return var_e19764f251e4a496;
}

// Namespace utility
// Params 2
// Checksum 0x39997314, Offset: 0x90f9
// Size: 0x90
function getrandompointincircle( origin, radius )
{
    loopcount = 0;
    offset = ( randomfloatrange( radius * -1, radius ), randomfloatrange( radius * -1, radius ), 0 );
    randompoint = origin + offset;
    
    while ( distance2dsquared( origin, randompoint ) > radius * radius )
    {
        loopcount++;
        offset = ( randomfloatrange( radius * -1, radius ), randomfloatrange( radius * -1, radius ), 0 );
        randompoint = origin + offset;
        
        if ( loopcount > 10 )
        {
            return origin;
        }
    }
    
    return randompoint;
}

// Namespace utility
// Params 2
// Checksum 0xdc25ecf0, Offset: 0x9192
// Size: 0xa4
function function_525aae2440cc299f( origin, radius )
{
    loopcount = 0;
    offset = ( randomfloatrange( radius * -1, radius ), randomfloatrange( radius * -1, radius ), 0 );
    randompoint = getclosestpointonnavmesh( origin + offset );
    radiussquared = radius * radius;
    
    while ( distance2dsquared( origin, randompoint ) > radiussquared )
    {
        loopcount++;
        offset = ( randomfloatrange( radius * -1, radius ), randomfloatrange( radius * -1, radius ), 0 );
        randompoint = getclosestpointonnavmesh( origin + offset );
        
        if ( loopcount > 10 )
        {
            return origin;
        }
    }
    
    return randompoint;
}

// Namespace utility
// Params 5
// Checksum 0xad50faae, Offset: 0x923f
// Size: 0x123
function function_724309a65022770f( origin, radius, angle, referenceyaw, refobj )
{
    loopcount = 0;
    randomangle = randomfloatrange( referenceyaw - angle * 0.5, referenceyaw + angle * 0.5 );
    randomradius = randomfloatrange( 0, radius );
    randompoint = ( origin[ 0 ] + randomradius * cos( randomangle ), origin[ 1 ] + randomradius * sin( randomangle ), origin[ 2 ] );
    navmeshpoint = getclosestpointonnavmesh( randompoint, refobj );
    
    while ( distance2dsquared( origin, navmeshpoint ) > radius * radius )
    {
        loopcount++;
        randomangle = math::degrees_to_radians( randomfloatrange( 0, angle ) );
        randomradius = randomfloatrange( 0, radius );
        randompoint = ( origin[ 0 ] + randomradius * cos( randomangle ), origin[ 1 ] + randomradius * sin( randomangle ), origin[ 2 ] );
        navmeshpoint = getclosestpointonnavmesh( randompoint, refobj );
        
        if ( loopcount > 10 )
        {
            return origin;
        }
    }
    
    point = drop_to_ground( navmeshpoint, 0 );
    return point;
}

// Namespace utility
// Params 5
// Checksum 0xe9bb3423, Offset: 0x936b
// Size: 0x1c9
function function_c801237e8eb2a51a( point, circle_origin, radius, angle, referenceyaw )
{
    var_121f54926e9910f7 = point - circle_origin;
    withinradius = distance2dsquared( point, circle_origin ) <= radius * radius;
    var_716511500a992abe = math::scalar_projection( var_121f54926e9910f7, ( cos( referenceyaw * 0.5 ), sin( referenceyaw * 0.5 ), 0 ) ) >= 0;
    var_3bf3a6486d5b4b74 = math::scalar_projection( var_121f54926e9910f7, ( cos( referenceyaw * 0.5 + angle ), sin( referenceyaw * 0.5 + angle ), 0 ) ) <= 0;
    
    /#
        var_f4559f052aa6ed4d = ( cos( referenceyaw * 0.5 ), sin( referenceyaw * 0.5 ), 0 );
        var_c396f1c953e0c8fb = ( cos( referenceyaw * 0.5 + angle ), sin( referenceyaw * 0.5 + angle ), 0 );
        circle( circle_origin, radius, ( 1, 1, 0 ) );
        line( circle_origin, circle_origin + var_f4559f052aa6ed4d * radius, ( 0, 0, 1 ) );
        line( circle_origin, circle_origin + var_c396f1c953e0c8fb * radius, ( 0, 0, 1 ) );
        line( circle_origin, circle_origin + vectornormalize( var_121f54926e9910f7 ) * length( var_121f54926e9910f7 ), var_716511500a992abe && var_3bf3a6486d5b4b74 && withinradius ? ( 0, 1, 0 ) : ( 1, 0, 0 ) );
    #/
    
    if ( var_716511500a992abe && var_3bf3a6486d5b4b74 && withinradius )
    {
        return 0;
    }
    
    if ( !var_716511500a992abe && var_3bf3a6486d5b4b74 )
    {
        return -1;
    }
    
    if ( var_716511500a992abe && !var_3bf3a6486d5b4b74 )
    {
        return 1;
    }
    
    return undefined;
}

// Namespace utility
// Params 1
// Checksum 0x101a7e5, Offset: 0x953d
// Size: 0xb4
function igc_camera( bool )
{
    player = self;
    registered = "igc";
    
    if ( bool )
    {
        player setstance( "stand", 1, 1, 1 );
        player val::set( registered, "freezecontrols", 1 );
        player val::set( registered, "cinematic_motion", 0 );
        player val::set( registered, "weapon", 0 );
        player val::set( registered, "damage", 0 );
        player val::set( registered, "breath_system", 0 );
        player val::set( registered, "show_hud", 0 );
        player cleardamageindicators();
        return;
    }
    
    player val::reset_all( registered );
}

// Namespace utility
// Params 2
// Checksum 0xa5e89d27, Offset: 0x95f9
// Size: 0xb3
function letterbox_enable( bool, time )
{
    player = self;
    
    if ( !isdefined( time ) )
    {
        time = 2;
    }
    
    wasenabled = player ent_flag_exist( "letterbox_enabled" ) && player ent_flag( "letterbox_enabled" );
    
    if ( bool && !wasenabled )
    {
        player ent_flag_set( "letterbox_enabled" );
        player lerpfovscalefactor( 0, time );
        showcinematicletterboxing( time, 0, player );
        return;
    }
    
    if ( !bool && wasenabled )
    {
        player ent_flag_clear( "letterbox_enabled" );
        player lerpfovscalefactor( 1, time );
        hidecinematicletterboxing( time, 0, player );
    }
}

// Namespace utility
// Params 3
// Checksum 0x9e9c0a09, Offset: 0x96b4
// Size: 0xad
function function_c645601b82788c91( enable, duration, flag )
{
    level endon( "game_ended" );
    
    foreach ( player in level.players )
    {
        player letterbox_enable( enable, duration );
    }
    
    wait duration;
    flag_set( flag );
}

// Namespace utility
// Params 2
// Checksum 0x98d2bd95, Offset: 0x9769
// Size: 0x3f
function giveachievement_wrapper( achievement, notused )
{
    if ( is_demo() )
    {
        return;
    }
    
    level.player giveachievement( achievement );
    println( "<dev string:xcf4>" + achievement );
}

// Namespace utility
// Params 2
// Checksum 0xa5242d6d, Offset: 0x97b0
// Size: 0x45, Type: bool
function function_92f6c5dd7f8b6166( equipment, attackerteam )
{
    if ( self.team == attackerteam )
    {
        if ( isdefined( self.var_1a61fee8c309f5f3 ) && self.var_1a61fee8c309f5f3[ equipment ] )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace utility
// Params 0
// Checksum 0x2d9540d1, Offset: 0x97fe
// Size: 0x8d
function function_68061c3d21a6d57a()
{
    if ( self getstance() == "crouch" )
    {
        center = self.origin + 0.5 * ( 0, 0, 48 );
    }
    else if ( self getstance() == "prone" )
    {
        center = self.origin + 0.5 * ( 0, 0, 20 );
    }
    else
    {
        center = self.origin + 0.5 * ( 0, 0, 64 );
    }
    
    return center;
}

// Namespace utility
// Params 1
// Checksum 0xfe236c76, Offset: 0x9894
// Size: 0x98
function function_f02ebab438642e16( stanceoverride )
{
    curstance = self getstance();
    
    if ( isdefined( stanceoverride ) )
    {
        curstance = stanceoverride;
    }
    
    if ( curstance == "crouch" )
    {
        top = self.origin + ( 0, 0, 48 );
    }
    else if ( curstance == "prone" )
    {
        top = self.origin + ( 0, 0, 20 );
    }
    else
    {
        top = self.origin + ( 0, 0, 64 );
    }
    
    return top;
}

// Namespace utility
// Params 1
// Checksum 0x3f89704, Offset: 0x9935
// Size: 0x2f
function isweaponthrowingknife( weapon )
{
    if ( isdefined( weapon ) && weapon.classname == "throwingknife" )
    {
        return 1;
    }
    
    return 0;
}

// Namespace utility
// Params 2
// Checksum 0xd939819b, Offset: 0x996c
// Size: 0xad
function knockback_flat( knockback_direction, knockback_magnitude )
{
    if ( !isdefined( self getgroundentity() ) )
    {
        knockback_magnitude *= 0.5;
        knockback_direction = ( knockback_direction[ 0 ], knockback_direction[ 1 ], 0 );
        
        if ( lengthsquared( knockback_direction ) > 0 )
        {
            knockback_direction = vectornormalize( knockback_direction );
            knockback_direction = ( knockback_direction[ 0 ], knockback_direction[ 1 ], 0.1 );
            self knockback( knockback_direction, knockback_magnitude );
        }
        
        return;
    }
    
    knockback_direction = ( knockback_direction[ 0 ], knockback_direction[ 1 ], max( knockback_direction[ 2 ], 0 ) );
    
    if ( lengthsquared( knockback_direction ) > 0 )
    {
        knockback_direction = vectornormalize( knockback_direction );
        
        if ( knockback_direction[ 2 ] < 0.1 )
        {
            knockback_direction = ( knockback_direction[ 0 ], knockback_direction[ 1 ], 0.1 );
        }
        
        self knockback( knockback_direction, knockback_magnitude );
    }
}

// Namespace utility
// Params 4
// Checksum 0x4c52283, Offset: 0x9a21
// Size: 0x115
function function_31522db4303bffeb( notename, endonnotify, custom_func, flagname )
{
    self endon( "death" );
    
    if ( isdefined( endonnotify ) )
    {
        self endon( endonnotify );
    }
    
    if ( !isdefined( flagname ) )
    {
        flagname = self asmgetcurrentstate( self.asmname );
    }
    
    while ( true )
    {
        self waittill( flagname, notetracks );
        b_ended = 0;
        
        if ( isarray( notetracks ) )
        {
            foreach ( note in notetracks )
            {
                if ( notename == note )
                {
                    if ( isdefined( custom_func ) )
                    {
                        self [[ custom_func ]]();
                    }
                    else
                    {
                        return 1;
                    }
                }
                
                if ( note == "end" )
                {
                    b_ended = 1;
                }
            }
        }
        
        if ( b_ended )
        {
            return 1;
        }
    }
}

// Namespace utility
// Params 7
// Checksum 0x3131f6e3, Offset: 0x9b3e
// Size: 0x20b
function function_8001268940441423( start_pos, end_pos, control_pos, time, var_64b5d34a4c778083 = 0, var_1f8d817fb854c814 = 0, path_percent = 1 )
{
    self endon( "death" );
    self endon( "off_bezier_curve" );
    
    if ( !isdefined( var_64b5d34a4c778083 ) )
    {
        var_64b5d34a4c778083 = 0;
    }
    
    start_point = start_pos;
    end_point = end_pos;
    var_1f8d817fb854c814 = path_percent >= 1 ? var_1f8d817fb854c814 : 1;
    control_point = control_pos;
    t = 0;
    move_start = gettime();
    self notify( "on_bezier_curve" );
    
    while ( true )
    {
        if ( !isdefined( self ) )
        {
            return;
        }
        
        t = ( gettime() - move_start ) / 1000 / time;
        
        if ( t <= path_percent )
        {
            /#
                oldpos = self.origin;
            #/
            
            op1 = pow( 1 - t, 2 );
            op2 = 2 * ( 1 - t ) * t;
            op3 = pow( t, 2 );
            xdest = op1 * start_point[ 0 ] + op2 * control_point[ 0 ] + op3 * end_point[ 0 ];
            ydest = op1 * start_point[ 1 ] + op2 * control_point[ 1 ] + op3 * end_point[ 1 ];
            zdest = op1 * start_point[ 2 ] + op2 * control_point[ 2 ] + op3 * end_point[ 2 ];
            self.origin = ( xdest, ydest, zdest );
            
            /#
                if ( var_64b5d34a4c778083 )
                {
                    thread draw_line_for_time( self.origin, oldpos, 1, 1, 1, time * 10 );
                }
            #/
        }
        else if ( !var_1f8d817fb854c814 )
        {
            self moveto( end_point, 0.25 );
            wait 0.25;
            break;
        }
        else
        {
            break;
        }
        
        waitframe();
    }
    
    if ( isdefined( self ) )
    {
        self notify( "off_bezier_curve" );
    }
}

// Namespace utility
// Params 8
// Checksum 0xaf31a04b, Offset: 0x9d51
// Size: 0x287
function function_2159dd4196ff4b81( path_array, time_s, var_64d7cc0c0b4ec7ed = 0, var_360d3f0890420a2 = 0, var_dde09f95e982c945 = 0, var_ae5be1a2238765f3 = 0.5, path_accuracy = 0.5, var_64b5d34a4c778083 = 0 )
{
    self endon( "death" );
    self endon( "stop_curve" );
    
    if ( path_array.size < 4 )
    {
        if ( var_dde09f95e982c945 )
        {
            if ( path_array.size == 3 )
            {
                function_8001268940441423( path_array[ 0 ], path_array[ 2 ], path_array[ 1 ], time_s, var_64b5d34a4c778083, 1 );
            }
            else if ( path_array.size == 2 )
            {
                function_8001268940441423( path_array[ 0 ], path_array[ 1 ], averagepoint( path_array ), time_s, var_64b5d34a4c778083, 1 );
            }
        }
        
        assert( var_dde09f95e982c945, "<dev string:xd05>" + path_array.size + "<dev string:xd4d>" );
        return;
    }
    
    total_dist = 0;
    point_i = 1;
    
    while ( point_i < path_array.size )
    {
        total_dist += distance( path_array[ point_i - 1 ], path_array[ point_i ] );
        point_i += 1;
    }
    
    times = [];
    point_i = 1;
    
    while ( point_i < path_array.size )
    {
        times[ times.size ] = distance( path_array[ point_i - 1 ], path_array[ point_i ] ) / total_dist * time_s;
        point_i += 1;
    }
    
    times[ times.size ] = level.framedurationseconds;
    tension = clamp( 1 - var_ae5be1a2238765f3, 0.01, 1 );
    alpha = clamp( path_accuracy, 0, 1 );
    splineid = function_53253e8ea222ed60( path_array, times, 0, tension, alpha, 1 );
    total_dist = function_176ae9ba12543764( splineid );
    var_c6b13c5ef8b9d064 = total_dist / time_s * level.framedurationseconds;
    thread function_8f5da7eab375e74a( splineid );
    
    if ( var_64b5d34a4c778083 )
    {
        childthread function_9f777c9a7fffb9fc( splineid, time_s, "stop_curve" );
    }
    
    self notify( "catmull_rom_spline_info", times );
    current_time = 0;
    
    while ( current_time < time_s )
    {
        self.origin = function_2bf2352736fc6ac8( splineid, current_time );
        
        if ( var_64d7cc0c0b4ec7ed )
        {
            self.angles = function_7062a9ae37ef4c8b( splineid, current_time );
        }
        
        if ( !var_360d3f0890420a2 )
        {
            delta = function_b9f720559b798d98( splineid, current_time, var_c6b13c5ef8b9d064 );
            current_time += delta;
        }
        else
        {
            current_time += level.framedurationseconds;
        }
        
        waitframe();
    }
    
    self notify( "stop_curve" );
}

// Namespace utility
// Params 1, eflags: 0x4
// Checksum 0xdf89b2b1, Offset: 0x9fe0
// Size: 0x24
function private function_8f5da7eab375e74a( splineid )
{
    waittill_any( "stop_curve", "death" );
    spline_destroy( splineid );
}

// Namespace utility
// Params 10
// Checksum 0xf961b496, Offset: 0xa00c
// Size: 0x2d2
function function_ea19c4309fe23331( var_84d4e3233dc4d3dc, var_ee859cd2501622a5, v_direction, var_173cd3809239740b, time, var_7c60f7c96ad6d35f, n_circles = 1, var_d9c29a33943ff7f4, var_ecefb6159af316b1, var_dd6a0bb33e7b5b39 )
{
    level endon( "game_ended" );
    self endon( "death" );
    self endon( "interrupt_spiral_move" );
    assert( time > 0, "<dev string:xd8b>" );
    assert( isdefined( var_7c60f7c96ad6d35f ), "<dev string:xda6>" );
    
    if ( var_d9c29a33943ff7f4 )
    {
        var_3149dd17ad5bfa89 = var_84d4e3233dc4d3dc >= 0 && var_ee859cd2501622a5 >= 0 || var_84d4e3233dc4d3dc <= 0 && var_ee859cd2501622a5 <= 0;
        assert( var_3149dd17ad5bfa89, "<dev string:xdca>" );
        var_84d4e3233dc4d3dc *= -1;
        var_ee859cd2501622a5 *= -1;
    }
    
    t = 0;
    
    if ( !isdefined( var_ee859cd2501622a5 ) )
    {
        var_ee859cd2501622a5 = var_84d4e3233dc4d3dc;
    }
    
    var_29a1a1dc7e9b5adb = 45;
    move_start = gettime() / 1000;
    start_origin = self.origin;
    
    if ( !var_dd6a0bb33e7b5b39 )
    {
        self notify( "on_spiral_move" );
    }
    
    radius = var_84d4e3233dc4d3dc;
    new_origin = start_origin;
    
    if ( !isvector( var_7c60f7c96ad6d35f ) )
    {
        var_7c60f7c96ad6d35f endon( "death" );
        center = var_7c60f7c96ad6d35f.origin;
        var_84d3d4a079c414ef = 1;
    }
    else
    {
        center = var_7c60f7c96ad6d35f;
    }
    
    if ( !isdefined( var_ecefb6159af316b1 ) )
    {
        var_ecefb6159af316b1 = vectortoangles( self.origin - center )[ 1 ];
    }
    else
    {
        self dontinterpolate();
    }
    
    t = 0;
    
    while ( t < 1 )
    {
        if ( !isdefined( var_7c60f7c96ad6d35f ) )
        {
            break;
        }
        
        if ( var_84d3d4a079c414ef )
        {
            center = var_7c60f7c96ad6d35f.origin;
        }
        
        current_time = gettime() / 1000;
        
        if ( var_dd6a0bb33e7b5b39 )
        {
            current_time = gettime() + getframeduration();
            current_time /= 1000;
        }
        
        t = ( current_time - move_start ) / time;
        theta = n_circles * 360 * t + var_ecefb6159af316b1;
        radius = ( var_ee859cd2501622a5 - var_84d4e3233dc4d3dc ) * t + var_84d4e3233dc4d3dc;
        var_b228e090daf9f66c = var_173cd3809239740b * t;
        xdest = center[ 0 ] + cos( theta ) * radius;
        ydest = center[ 1 ] + sin( theta ) * radius;
        new_origin = ( xdest, ydest, start_origin[ 2 ] ) + v_direction * var_b228e090daf9f66c;
        
        if ( var_dd6a0bb33e7b5b39 )
        {
            return { #start_angles:( 0, vectortoyaw( center - new_origin ), 0 ), #start_origin:new_origin };
        }
        
        self.origin = new_origin;
        self.angles = ( 0, vectortoyaw( center - new_origin ), 0 );
        waitframe();
    }
    
    if ( isdefined( self ) )
    {
        self notify( "off_spiral_move" );
    }
}

// Namespace utility
// Params 9
// Checksum 0x1a03a981, Offset: 0xa2e6
// Size: 0x71
function function_77b600fb391fda42( var_84d4e3233dc4d3dc, var_ee859cd2501622a5, v_direction, var_173cd3809239740b, time, var_7c60f7c96ad6d35f, n_circles = 1, var_d9c29a33943ff7f4, var_ecefb6159af316b1 )
{
    return function_ea19c4309fe23331( var_84d4e3233dc4d3dc, var_ee859cd2501622a5, v_direction, var_173cd3809239740b, time, var_7c60f7c96ad6d35f, n_circles, var_d9c29a33943ff7f4, var_ecefb6159af316b1, 1 );
}

// Namespace utility
// Params 7
// Checksum 0x4330a32, Offset: 0xa360
// Size: 0x1d2
function follow_circle( radius, time, var_7c60f7c96ad6d35f, n_circles = 1, angle_rotation = undefined, var_8d646c1f4f65dece = 0, var_fb04fc8180642f34 = ( 0, 0, 0 ) )
{
    self endon( "death" );
    self endon( "interrupt_circle_move" );
    assert( isdefined( var_7c60f7c96ad6d35f ), "<dev string:xda6>" );
    t = 0;
    move_start = gettime();
    new_origin = self.origin;
    self notify( "on_circle_move" );
    
    if ( !isvector( var_7c60f7c96ad6d35f ) )
    {
        var_7c60f7c96ad6d35f endon( "death" );
        center = var_7c60f7c96ad6d35f.origin;
        var_84d3d4a079c414ef = 1;
    }
    else
    {
        center = var_7c60f7c96ad6d35f;
    }
    
    while ( true )
    {
        t = ( gettime() - move_start ) / 1000 / time;
        
        if ( t <= 1 )
        {
            theta = n_circles * 360 * t;
            
            if ( !isdefined( var_7c60f7c96ad6d35f ) )
            {
                break;
            }
            
            if ( var_84d3d4a079c414ef )
            {
                center = var_7c60f7c96ad6d35f.origin;
            }
            
            xdest = center[ 0 ] + cos( theta ) * radius;
            ydest = center[ 1 ] + sin( theta ) * radius;
            new_origin = ( xdest, ydest, center[ 2 ] );
            
            if ( isdefined( angle_rotation ) )
            {
                offset_horizontal = new_origin - center;
                new_origin = coordtransform( offset_horizontal, center, angle_rotation );
            }
            
            if ( var_8d646c1f4f65dece )
            {
                new_origin = getgroundposition( new_origin, 1 ) + var_fb04fc8180642f34;
            }
            
            self.origin = new_origin;
        }
        else
        {
            break;
        }
        
        waitframe();
    }
    
    self notify( "off_circle_move" );
}

// Namespace utility
// Params 1
// Checksum 0x72d534bf, Offset: 0xa53a
// Size: 0x1e
function function_bed40b09860f8227( enabled )
{
    function_d5a54acde3e473ca( enabled );
    function_232160414793eaa0( enabled );
}

// Namespace utility
// Params 1
// Checksum 0x59896c78, Offset: 0xa560
// Size: 0x30
function function_d5a54acde3e473ca( enabled )
{
    self allowmovement( !enabled );
    self allowprone( !enabled );
    self allowjump( !enabled );
    self allowmelee( !enabled );
}

// Namespace utility
// Params 1
// Checksum 0xc9f1db91, Offset: 0xa598
// Size: 0x33
function function_c13d09bc414864cb( enabled )
{
    self allowfire( !enabled );
    self allowads( !enabled );
    
    if ( !enabled )
    {
        self enableoffhandweapons();
        return;
    }
    
    self disableoffhandweapons();
}

// Namespace utility
// Params 1
// Checksum 0x9c35b025, Offset: 0xa5d3
// Size: 0x1c
function function_232160414793eaa0( enabled )
{
    self freezecontrols( enabled );
    self freezelookcontrols( enabled );
}

// Namespace utility
// Params 2
// Checksum 0x9f2d2bc7, Offset: 0xa5f7
// Size: 0x33
function function_926999a67bc153f8( expected_string, compare )
{
    if ( isdefined( compare ) && isdefined( expected_string ) )
    {
        if ( issubstr( compare, expected_string ) )
        {
            return removesubstr( compare, expected_string );
        }
    }
}

// Namespace utility
// Params 1
// Checksum 0x65b2d89f, Offset: 0xa632
// Size: 0xc3
function function_d0cb6b33aff40a94( basenamehash )
{
    if ( !isdefined( level.var_363840efc0e8a5a0 ) )
    {
        if ( isdefined( level.gamemodebundle ) )
        {
            bundlename = level.gamemodebundle.var_3a0206d545998851;
            assert( isdefined( bundlename ) );
            bundle = getscriptbundle( bundlename );
            level.var_363840efc0e8a5a0 = bundle.var_3a0206d545998851;
        }
    }
    
    if ( issharedfuncdefined( basenamehash, #"overrideweaponname" ) )
    {
        overrideweaponname = callsharedfunc( basenamehash, #"overrideweaponname" );
        
        if ( isdefined( overrideweaponname ) )
        {
            return overrideweaponname;
        }
    }
    
    return level.var_363840efc0e8a5a0[ basenamehash ].weaponref;
}

// Namespace utility
// Params 2
// Checksum 0x57f55b7f, Offset: 0xa6fe
// Size: 0xaf, Type: bool
function function_73b3c68eaac7c8ff( string, a_substr )
{
    if ( !( isdefined( string ) && isdefined( a_substr ) ) )
    {
        return false;
    }
    
    if ( !isarray( a_substr ) )
    {
        a_substr = [ a_substr ];
    }
    
    foreach ( substr in a_substr )
    {
        if ( !issubstr( string, substr ) )
        {
            return false;
        }
    }
    
    return true;
}

// Namespace utility
// Params 2
// Checksum 0xb5578c2b, Offset: 0xa7b6
// Size: 0xae, Type: bool
function function_630b286cb07bd032( string, a_substr )
{
    if ( !( isdefined( string ) && isdefined( a_substr ) ) )
    {
        return false;
    }
    
    if ( !isarray( a_substr ) )
    {
        a_substr = [ a_substr ];
    }
    
    foreach ( substr in a_substr )
    {
        if ( issubstr( string, substr ) )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace utility
// Params 3
// Checksum 0x29f24b4e, Offset: 0xa86d
// Size: 0x78, Type: bool
function function_af749a6c1f8241f0( ent, lookatpoint, anglethreshold = 90 )
{
    entforward = anglestoforward( ent.angles );
    enttopoint = lookatpoint - ent.origin;
    anglediff = math::anglebetweenvectors( entforward, enttopoint );
    
    if ( anglediff <= anglethreshold )
    {
        return true;
    }
    
    return false;
}

// Namespace utility
// Params 5
// Checksum 0x5da3645, Offset: 0xa8ee
// Size: 0xa3, Type: bool
function function_476c996eed246db( ent, lookatpoint, duration, anglethreshold = 90, waitinterval = 0.5 )
{
    level endon( "game_ended" );
    ent endon( "death" );
    numloops = floor( duration / waitinterval );
    
    for ( i = 0; i < numloops ; i++ )
    {
        lookingatpoint = function_af749a6c1f8241f0( ent, lookatpoint, anglethreshold );
        
        if ( !lookingatpoint )
        {
            return false;
        }
        
        wait waitinterval;
    }
    
    return true;
}

// Namespace utility
// Params 0
// Checksum 0x6e45fde, Offset: 0xa99a
// Size: 0x4d
function function_7158911332c109bb()
{
    groundlocation = getgroundposition( self.origin, 1 );
    waterheight = getwaterheightatlocation( groundlocation );
    
    if ( groundlocation[ 2 ] < waterheight )
    {
        groundposition = ( groundlocation[ 0 ], groundlocation[ 1 ], waterheight );
    }
    
    return groundlocation;
}

// Namespace utility
// Params 1
// Checksum 0x9ae1d969, Offset: 0xa9f0
// Size: 0x87
function function_c5d9978d36c9459e( hdrcolor )
{
    var_76a96cf84b1772ad = strtok( hdrcolor, " " );
    assert( var_76a96cf84b1772ad.size == 4 || var_76a96cf84b1772ad.size == 3, "<dev string:xe19>" + hdrcolor + "<dev string:xe27>" );
    rgbcolor = [];
    
    for ( i = 0; i < 3 ; i++ )
    {
        rgbcolor[ i ] = int( ceil( float( var_76a96cf84b1772ad[ i ] ) * 255 ) );
    }
    
    return rgbcolor;
}

// Namespace utility
// Params 3
// Checksum 0x7b85350f, Offset: 0xaa80
// Size: 0x36
function delay_notify( n_delay, str_notify, str_endon )
{
    if ( isdefined( str_endon ) )
    {
        self endon( str_endon );
    }
    
    wait n_delay;
    
    if ( isdefined( self ) )
    {
        self notify( str_notify );
    }
}

/#

    // Namespace utility
    // Params 5
    // Checksum 0x509eb495, Offset: 0xaabe
    // Size: 0xa2, Type: dev
    function debugprinttoscreen( message, time, coordx, coordy, color )
    {
        if ( !isdefined( time ) )
        {
            time = 2;
        }
        
        if ( !isdefined( coordx ) )
        {
            coordx = 10;
        }
        
        if ( !isdefined( coordy ) )
        {
            coordy = 200;
        }
        
        if ( !isdefined( color ) )
        {
            color = ( 1, 1, 1 );
        }
        
        if ( isdefined( message ) )
        {
            starttime = gettime();
            
            while ( gettime() - starttime <= time * 1000 )
            {
                printtoscreen2d( coordx, coordy, message, color, 2 );
                waitframe();
            }
        }
    }

    // Namespace utility
    // Params 5
    // Checksum 0x9f28ba8a, Offset: 0xab68
    // Size: 0xff, Type: dev
    function function_72ef0ebf3a428eb9( message, time, coordx, coordy, color )
    {
        if ( !isdefined( level.debugmessages ) )
        {
            thread function_3011e0b88a32d9f();
        }
        
        if ( isdefined( message ) )
        {
            if ( !isdefined( time ) )
            {
                time = 2;
            }
            
            if ( !isdefined( coordx ) )
            {
                coordx = 10;
            }
            
            if ( !isdefined( coordy ) )
            {
                coordy = 200;
            }
            
            if ( !isdefined( color ) )
            {
                color = ( 1, 1, 1 );
            }
            
            debugmessage = spawnstruct();
            debugmessage.message = message;
            debugmessage.coordx = coordx;
            debugmessage.coordy = coordy;
            debugmessage.color = color;
            level.debugmessages[ level.debugmessages.size ] = debugmessage;
            wait time;
            level.debugmessages = arrayremove( level.debugmessages, debugmessage );
        }
    }

    // Namespace utility
    // Params 0, eflags: 0x4
    // Checksum 0xc6d77c60, Offset: 0xac6f
    // Size: 0xda, Type: dev
    function private function_3011e0b88a32d9f()
    {
        level.debugmessages = [];
        
        while ( true )
        {
            for ( i = 0; i < level.debugmessages.size ; i++ )
            {
                message = level.debugmessages[ i ].message;
                coordx = level.debugmessages[ i ].coordx;
                coordy = level.debugmessages[ i ].coordy;
                color = level.debugmessages[ i ].color;
                offsety = i * 20;
                printtoscreen2d( coordx, coordy + offsety, message, color, 2 );
            }
            
            waitframe();
        }
    }

#/

// Namespace utility
// Params 0
// Checksum 0x1ba309a3, Offset: 0xad51
// Size: 0x9c
function function_e00e472b5a03f8f1()
{
    mapinfo = level.var_d2ad35d68057f138;
    
    if ( !isdefined( mapinfo ) )
    {
        mapinfo = getmapscriptbundle();
    }
    
    if ( isdefined( mapinfo ) )
    {
        level.isnightmap = istrue( mapinfo.nightmap );
        
        if ( level.isnightmap )
        {
            visionsetkillcamthirdpersonnight( "killcam_night" );
        }
        
        level.var_e54aa9fc8f17d734 = istrue( mapinfo.usenvgs );
        return;
    }
    
    println( "<dev string:xe58>" + getdvar( @"g_mapname" ) );
    level.isnightmap = 0;
    level.var_e54aa9fc8f17d734 = 0;
}

// Namespace utility
// Params 0
// Checksum 0xc9fba060, Offset: 0xadf5
// Size: 0x21, Type: bool
function isnightmap()
{
    if ( !isdefined( level.isnightmap ) )
    {
        function_e00e472b5a03f8f1();
    }
    
    return istrue( level.isnightmap );
}

// Namespace utility
// Params 0
// Checksum 0x1b9c219, Offset: 0xae1f
// Size: 0x21, Type: bool
function function_2a082dafe6f4bd5b()
{
    if ( !isdefined( level.var_e54aa9fc8f17d734 ) )
    {
        function_e00e472b5a03f8f1();
    }
    
    return istrue( level.var_e54aa9fc8f17d734 );
}

// Namespace utility
// Params 1
// Checksum 0x5dbadc0c, Offset: 0xae49
// Size: 0x12a
function function_21371fd45f8bcf8a( guid )
{
    if ( !isdefined( level.playerguidmap ) )
    {
        level.playerguidmap = [];
        
        if ( isdefined( level.player ) )
        {
            playerarray = [ level.player ];
        }
        else
        {
            playerarray = level.players;
        }
        
        foreach ( player in playerarray )
        {
            playerguid = callsharedfunc( #"player", #"getPlayerGuid", player );
            level.playerguidmap[ playerguid ] = player;
        }
        
        level callback::add( #"player_connect", &function_e75f63af976d85c2 );
        level callback::add( #"player_disconnect", &function_263891ca905d979e );
    }
    
    return level.playerguidmap[ guid ];
}

// Namespace utility
// Params 1, eflags: 0x4
// Checksum 0x98887ac, Offset: 0xaf7c
// Size: 0x4b
function private function_e75f63af976d85c2( params )
{
    player = self;
    playerguid = callsharedfunc( #"player", #"getPlayerGuid", player );
    level.playerguidmap[ playerguid ] = player;
}

// Namespace utility
// Params 1, eflags: 0x4
// Checksum 0x94a55182, Offset: 0xafcf
// Size: 0x49
function private function_263891ca905d979e( params )
{
    player = self;
    playerguid = callsharedfunc( #"player", #"getPlayerGuid", player );
    level.playerguidmap[ playerguid ] = undefined;
}

// Namespace utility
// Params 3
// Checksum 0x84438c44, Offset: 0xb020
// Size: 0x58
function function_ce86ddbb7d60e9bd( position, shockwaveref, owner )
{
    if ( function_4042d2fbe6237835( #"hash_78be90a4a130ca3" ) )
    {
        return;
    }
    
    if ( !isdefined( shockwaveref ) )
    {
        return;
    }
    
    newshockwave = spawnshockwave( position, shockwaveref );
    
    if ( isdefined( owner ) )
    {
        newshockwave setentityowner( owner );
    }
}

// Namespace utility
// Params 3
// Checksum 0xf5c43b77, Offset: 0xb080
// Size: 0x227
function function_54fdde0a73217354( a_ents, var_7fdb5e6b2d9f73ec = 1, var_e4980e9f328c26c1 = 0 )
{
    var_ceca05bdac98ef87 = ( 0, 0, 0 );
    
    if ( !isarray( a_ents ) || a_ents.size == 0 )
    {
        assertmsg( "<dev string:xe77>" );
        return undefined;
    }
    
    foreach ( ent in a_ents )
    {
        if ( !isdefined( ent.origin ) )
        {
            assertmsg( ent + "<dev string:xea0>" );
            return undefined;
        }
    }
    
    if ( a_ents.size == 1 )
    {
        key = getfirstarraykey( a_ents );
        origin = a_ents[ key ].origin;
        var_ceca05bdac98ef87 = var_e4980e9f328c26c1 ? origin : ( origin[ 0 ], origin[ 1 ], 0 );
    }
    else
    {
        var_cd3cf2cf3b927430 = int( floor( a_ents.size / 2 ) );
        var_3a67fb50b33f1198 = arraysort( a_ents, undefined, &function_4655f27e948750f );
        var_876dbb769104e061 = arraysort( a_ents, undefined, &function_738731a22093b89e );
        var_49c5e579cf6c93c4 = var_3a67fb50b33f1198[ var_cd3cf2cf3b927430 ].origin[ 0 ];
        var_49c5e679cf6c95f7 = var_876dbb769104e061[ var_cd3cf2cf3b927430 ].origin[ 1 ];
        var_49c5e779cf6c982a = 0;
        
        if ( var_e4980e9f328c26c1 )
        {
            var_d0ad176824cdaa5e = arraysort( a_ents, undefined, &function_6796b0d93dde2c29 );
            var_49c5e779cf6c982a = var_d0ad176824cdaa5e[ var_cd3cf2cf3b927430 ].origin[ 2 ];
        }
        
        var_ceca05bdac98ef87 = ( var_49c5e579cf6c93c4, var_49c5e679cf6c95f7, var_49c5e779cf6c982a );
        
        if ( a_ents.size % 2 == 0 && var_7fdb5e6b2d9f73ec )
        {
            var_ceca05bdac98ef87 += a_ents[ var_cd3cf2cf3b927430 + 1 ].origin;
            var_ceca05bdac98ef87 *= 0.5;
        }
    }
    
    return var_ceca05bdac98ef87;
}

// Namespace utility
// Params 2
// Checksum 0x34a6e690, Offset: 0xb2b0
// Size: 0x167
function function_11a2ebb045201379( a_ents, var_e4980e9f328c26c1 = 0 )
{
    averageposition = ( 0, 0, 0 );
    
    if ( !isarray( a_ents ) || a_ents.size == 0 )
    {
        assertmsg( "<dev string:xe77>" );
        return undefined;
    }
    
    if ( a_ents.size == 1 )
    {
        key = getfirstarraykey( a_ents );
        origin = a_ents[ key ].origin;
        averageposition = var_e4980e9f328c26c1 ? origin : ( origin[ 0 ], origin[ 1 ], 0 );
    }
    else
    {
        foreach ( ent in a_ents )
        {
            if ( !isdefined( ent.origin ) )
            {
                assertmsg( ent + "<dev string:xea0>" );
                return undefined;
            }
            
            averageposition += ent.origin;
        }
    }
    
    z_val = var_e4980e9f328c26c1 ? averageposition[ 2 ] / a_ents.size : 0;
    return ( averageposition[ 0 ] / a_ents.size, averageposition[ 1 ] / a_ents.size, z_val );
}

// Namespace utility
// Params 2, eflags: 0x4
// Checksum 0x64f7d1e4, Offset: 0xb420
// Size: 0x30, Type: bool
function private function_4655f27e948750f( ent1, ent2 )
{
    return ent1.origin[ 0 ] > ent2.origin[ 0 ];
}

// Namespace utility
// Params 2, eflags: 0x4
// Checksum 0xca9f4075, Offset: 0xb459
// Size: 0x32, Type: bool
function private function_738731a22093b89e( ent1, ent2 )
{
    return ent1.origin[ 1 ] > ent2.origin[ 1 ];
}

// Namespace utility
// Params 2, eflags: 0x4
// Checksum 0xe357f487, Offset: 0xb494
// Size: 0x32, Type: bool
function private function_6796b0d93dde2c29( ent1, ent2 )
{
    return ent1.origin[ 2 ] > ent2.origin[ 2 ];
}

// Namespace utility
// Params 1
// Checksum 0x560afadc, Offset: 0xb4cf
// Size: 0x5e, Type: bool
function function_f825237e0eda5adf( fallbacksuit = "t10_defaultsuit_mp" )
{
    suitoverride = getdvar( @"hash_b89aa3fa4a8b1e2b", "" );
    return level.gamemodebundle.playerdefaultsuit ?? ( suitoverride != "" ? suitoverride : fallbacksuit );
}

// Namespace utility
// Params 0
// Checksum 0xe825d517, Offset: 0xb536
// Size: 0x34, Type: bool
function function_e02da4fab371fbcf()
{
    return level.var_d5254adc8b328315 ?? ( isdvardefined( @"hash_23522f85d648456d" ) ? getdvar( @"hash_23522f85d648456d" ) : function_f825237e0eda5adf() );
}

// Namespace utility
// Params 2
// Checksum 0x6091b968, Offset: 0xb573
// Size: 0x69
function function_a4de202cfe48379( weapon, var_9242df1bd50fa5f6 = 0 )
{
    if ( level.gamemodebundle.var_1976506fada1193b )
    {
        if ( var_9242df1bd50fa5f6 )
        {
            max_stock_ammo = weaponmaxammo( weapon );
            return max_stock_ammo;
        }
        else
        {
            max_stock_ammo = weaponstartammo( weapon );
            return max_stock_ammo;
        }
        
        return;
    }
    
    max_stock_ammo = weaponmaxammo( weapon );
    return max_stock_ammo;
}

// Namespace utility
// Params 1
// Checksum 0xdd508190, Offset: 0xb5e4
// Size: 0x2e
function function_b73ecb08dfaa1bc5( structvector )
{
    return ( structvector.x, structvector.y, structvector.z );
}

// Namespace utility
// Params 1
// Checksum 0xc3336e17, Offset: 0xb61b
// Size: 0x3d
function function_3910ea89b328f77e( var_25d99aafdc05f3ba )
{
    variantids = strtok( var_25d99aafdc05f3ba, " ", 1 );
    
    if ( variantids.size > 0 )
    {
        return int( variantids[ randomint( variantids.size ) ] );
    }
    
    return -1;
}

// Namespace utility
// Params 2
// Checksum 0xdc5bcada, Offset: 0xb661
// Size: 0xd2
function function_eecfd867c5d343ba( patharray, var_6197e3bd24981847 )
{
    assert( patharray.size > 0, "<dev string:xec3>" );
    
    if ( !isdefined( patharray ) || patharray.size == 0 )
    {
        return undefined;
    }
    
    remainingdistance = var_6197e3bd24981847;
    var_ccecacbfba397018 = patharray[ 0 ];
    
    for ( i = 1; i < patharray.size ; i++ )
    {
        nextnodeorigin = patharray[ i ];
        var_ae10f81cd6e347b5 = distance( var_ccecacbfba397018, nextnodeorigin );
        
        if ( remainingdistance < var_ae10f81cd6e347b5 )
        {
            targetnode = vectorlerp( var_ccecacbfba397018, nextnodeorigin, remainingdistance / var_ae10f81cd6e347b5 );
            return [ targetnode, i ];
        }
        
        remainingdistance -= var_ae10f81cd6e347b5;
        var_ccecacbfba397018 = nextnodeorigin;
    }
    
    return [ var_ccecacbfba397018, patharray.size - 1 ];
}

// Namespace utility
// Params 2
// Checksum 0xa8093cb9, Offset: 0xb73c
// Size: 0x4d
function function_969f9f5596dba07a( ent, callbackfunction )
{
    if ( isdefined( level.var_ff28e0c14ba90179 ) )
    {
        [[ getsharedfunc( #"game", #"registerentincrushzones" ) ]]( ent );
        ent.var_a21f47f6f7811618 = callbackfunction;
    }
}

// Namespace utility
// Params 1
// Checksum 0x55cec61b, Offset: 0xb791
// Size: 0x5d
function function_a605d1fb62b31e70( ent )
{
    if ( isdefined( level.var_ff28e0c14ba90179 ) )
    {
        if ( issharedfuncdefined( #"game", #"unregisterentfromcrushzones", 0 ) )
        {
            [[ getsharedfunc( #"game", #"unregisterentfromcrushzones" ) ]]( ent );
        }
        
        ent.var_a21f47f6f7811618 = undefined;
    }
}

// Namespace utility
// Params 2
// Checksum 0xb78f28c5, Offset: 0xb7f6
// Size: 0x250
function function_1b1f0962c505f82f( players, var_e2c2d28710fbe79c = 0 )
{
    if ( !isarray( players ) )
    {
        players = [ players ];
    }
    
    var_ce2bfbb5558fa190 = 0;
    starttime = gettime();
    var_bdc7257788ff886a = [];
    
    while ( !var_ce2bfbb5558fa190 )
    {
        now = gettime();
        var_ce2bfbb5558fa190 = 1;
        
        foreach ( player in players )
        {
            if ( !isplayer( player ) )
            {
                continue;
            }
            
            if ( player.sessionstate != "playing" )
            {
                continue;
            }
            
            playerkey = player.guid;
            var_4ac3be8ede222857 = starttime + player function_8088d408510470b8();
            
            if ( !isdefined( var_bdc7257788ff886a[ playerkey ] ) || distancesquared( var_bdc7257788ff886a[ playerkey ], player.origin ) > 400 )
            {
                player ent_flag_set( "player_additional_stream_pos_waiting" );
                player setadditionalstreamposuntilcleared( player.origin );
                var_bdc7257788ff886a[ playerkey ] = player.origin;
            }
            
            if ( !player isadditionalstreamposready() && now < var_4ac3be8ede222857 )
            {
                var_ce2bfbb5558fa190 = 0;
                continue;
            }
            
            player ent_flag_clear( "player_additional_stream_pos_waiting", 1 );
        }
        
        if ( var_ce2bfbb5558fa190 )
        {
            break;
        }
        
        wait 0.25;
    }
    
    foreach ( player in players )
    {
        if ( !isplayer( player ) )
        {
            continue;
        }
        
        player clearadditionalstreampos();
    }
    
    totaltimesec = ( gettime() - starttime ) / 1000;
    var_99d58402e9064bbb = var_e2c2d28710fbe79c - totaltimesec;
    
    if ( var_99d58402e9064bbb > 0 )
    {
        wait var_99d58402e9064bbb;
    }
}

// Namespace utility
// Params 0
// Checksum 0xbf793e3c, Offset: 0xba4e
// Size: 0x24, Type: bool
function function_9a642b48e5d7a5af()
{
    assert( isplayer( self ) );
    
    if ( self isps4player() || self isxb3player() )
    {
        return true;
    }
    
    return false;
}

// Namespace utility
// Params 0
// Checksum 0x98763674, Offset: 0xba7b
// Size: 0x31
function function_8088d408510470b8()
{
    assert( isplayer( self ) );
    
    if ( function_9a642b48e5d7a5af() )
    {
        timeout = 30000;
    }
    else
    {
        timeout = 7000;
    }
    
    return timeout;
}

// Namespace utility
// Params 0, eflags: 0x4
// Checksum 0xb1a7c79e, Offset: 0xbab5
// Size: 0xc, Type: bool
function private function_f322c0f9fb3b8580()
{
    return istrue( self.var_3948c60099a64112 );
}

// Namespace utility
// Params 5
// Checksum 0x5ed6b7f8, Offset: 0xbaca
// Size: 0x179
function fadeToBlackForPlayerKeepUI( player, fadetoblack, fadetime, var_a8c80c8156ac9bef, var_99a624d3834b9ef5 = "fadeToBlackForPlayerKeepUI" )
{
    if ( getdvarint( @"hash_19e3006228036170", 0 ) )
    {
        return;
    }
    
    if ( player function_f322c0f9fb3b8580() )
    {
        return;
    }
    
    player notify( "start_fade_to_black_keep_ui_" + var_99a624d3834b9ef5 );
    player endon( "start_fade_to_black_keep_ui_" + var_99a624d3834b9ef5 );
    player endon( "disconnect" );
    level endon( "game_ended" );
    
    if ( var_a8c80c8156ac9bef )
    {
        player endon( "last_stand_exit" );
    }
    
    assert( !isdefined( fadetime ) || fadetime >= 0, "<dev string:xee9>" );
    fadealpha = 0;
    
    if ( fadetoblack )
    {
        fadealpha = 1;
    }
    
    if ( !isdefined( fadetime ) || fadetime == 0 )
    {
        player val::set( var_99a624d3834b9ef5, "world_fade", fadealpha );
        return;
    }
    
    finalalpha = fadealpha;
    fadealpha = 0;
    fadetimecounter = int( fadetime / level.framedurationseconds );
    fadechange = 1 / fadetimecounter;
    
    if ( !fadetoblack )
    {
        fadechange *= -1;
        fadealpha = 1;
    }
    
    while ( fadetimecounter > 0 )
    {
        fadealpha += fadechange;
        player val::set( var_99a624d3834b9ef5, "world_fade", fadealpha );
        fadetimecounter--;
        waitframe();
    }
    
    if ( finalalpha > 0 )
    {
        player val::set( var_99a624d3834b9ef5, "world_fade", finalalpha );
        return;
    }
    
    player val::reset( var_99a624d3834b9ef5, "world_fade" );
}

// Namespace utility
// Params 6
// Checksum 0xc8e2fe21, Offset: 0xbc4b
// Size: 0x1ac
function fadetoblackforplayer( player, fadetoblack, fadetime, var_951f14d75c38443d, var_a8c80c8156ac9bef, var_99a624d3834b9ef5 = "fadeToBlackForPlayer" )
{
    if ( getdvarint( @"hash_19e3006228036170", 0 ) )
    {
        return;
    }
    
    if ( player function_f322c0f9fb3b8580() )
    {
        return;
    }
    
    player notify( "start_fade_to_black_" + var_99a624d3834b9ef5 );
    player endon( "start_fade_to_black_" + var_99a624d3834b9ef5 );
    player endon( "disconnect" );
    
    if ( !var_951f14d75c38443d )
    {
        level endon( "game_ended" );
    }
    
    if ( var_a8c80c8156ac9bef )
    {
        player endon( "last_stand_exit" );
    }
    
    assert( !isdefined( fadetime ) || fadetime >= 0, "<dev string:xf26>" );
    fadealpha = 0;
    
    if ( fadetoblack )
    {
        fadealpha = 1;
    }
    
    if ( !isdefined( fadetime ) || fadetime == 0 )
    {
        player val::set( var_99a624d3834b9ef5, "total_fade", fadealpha );
        return;
    }
    
    finalalpha = fadealpha;
    fadealpha = 0;
    fadetimecounter = int( fadetime / level.framedurationseconds );
    fadechange = 1 / fadetimecounter;
    
    if ( !fadetoblack )
    {
        fadechange *= -1;
        fadealpha = 1;
    }
    
    while ( fadetimecounter > 0 )
    {
        fadealpha += fadechange;
        
        if ( !isdefined( player ) || !player isconnected() )
        {
            return;
        }
        
        player val::set( var_99a624d3834b9ef5, "total_fade", fadealpha );
        fadetimecounter--;
        waitframe();
    }
    
    if ( !isdefined( player ) )
    {
        return;
    }
    
    if ( finalalpha > 0 )
    {
        player val::set( var_99a624d3834b9ef5, "total_fade", finalalpha );
    }
    else
    {
        player val::reset( var_99a624d3834b9ef5, "total_fade" );
    }
    
    player notify( "finish_fade_to_black" );
}

