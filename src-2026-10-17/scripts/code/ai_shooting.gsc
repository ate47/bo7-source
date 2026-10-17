#namespace ai_shooting;

// Namespace ai_shooting
// Params 0
// Checksum 0x6afe1d00, Offset: 0x7c
// Size: 0xc0
function decidenumshotsformg()
{
    turret = undefined;
    
    if ( isdefined( self.fngetusedturret ) )
    {
        turret = [[ self.fngetusedturret ]]();
    }
    
    usingturret = isdefined( turret );
    
    if ( usingturret && isdefined( turret.script_burst_min ) )
    {
        bursttime = turret.script_burst_min;
    }
    else
    {
        bursttime = 0.5;
    }
    
    if ( usingturret && isdefined( turret.script_burst_max ) )
    {
        burstrange = turret.script_burst_max - bursttime;
    }
    else
    {
        burstrange = 1.5;
    }
    
    burst_length = bursttime + randomfloat( burstrange );
    return int( burst_length * 10 );
}

// Namespace ai_shooting
// Params 0
// Checksum 0xda333fbd, Offset: 0x145
// Size: 0x8a
function decidenumshotsforfull()
{
    numshots = self.bulletsinclip;
    weapclass = weaponclass( self.weapon );
    
    if ( weaponclass( self.weapon ) == "mg" )
    {
        choice = randomfloat( 10 );
        
        if ( choice < 3 )
        {
            numshots = randomintrange( 2, 6 );
        }
        else if ( choice < 8 )
        {
            numshots = randomintrange( 6, 12 );
        }
        else
        {
            numshots = randomintrange( 12, 20 );
        }
    }
    
    return numshots;
}

// Namespace ai_shooting
// Params 1
// Checksum 0x64d693d9, Offset: 0x1d8
// Size: 0xb3
function decidenumshotsforburst( distancetoenemysquared )
{
    maxburst = 5;
    fixedburstcount = weaponburstcount( self.weapon );
    
    if ( fixedburstcount )
    {
        numshots = fixedburstcount;
    }
    else
    {
        numshots = reduceshotcountbydistance( maxburst, distancetoenemysquared );
        numshots += randomintrange( -2, 3 );
        numshots = int( max( numshots, 1 ) );
    }
    
    if ( numshots <= self.bulletsinclip )
    {
        return numshots;
    }
    
    assert( self.bulletsinclip >= 0, self.bulletsinclip );
    
    if ( self.bulletsinclip <= 0 )
    {
        return 1;
    }
    
    return self.bulletsinclip;
}

// Namespace ai_shooting
// Params 2
// Checksum 0xf0149136, Offset: 0x294
// Size: 0xf8
function reduceshotcountbydistance( var_1169135bfa156363, distancetoenemysquared )
{
    fullautorangesq = 62500;
    var_b79c0ebbba9c208c = 810000;
    var_82d112d336630b7c = 1562500;
    singleshotrangesq = 2560000;
    alldistances = [ fullautorangesq, var_b79c0ebbba9c208c, var_82d112d336630b7c, singleshotrangesq ];
    assert( var_1169135bfa156363 > alldistances.size );
    
    foreach ( currentdistance in alldistances )
    {
        if ( distancetoenemysquared > currentdistance )
        {
            var_1169135bfa156363 -= 1;
        }
    }
    
    return var_1169135bfa156363;
}

