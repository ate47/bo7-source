#using scripts\anim\battlechatter;

#namespace battlechatter_wrapper;

// Namespace battlechatter_wrapper
// Params 1
// Checksum 0xdabeadc2, Offset: 0x8b
// Size: 0xc
function evaluatemoveevent( wasincover )
{
    
}

// Namespace battlechatter_wrapper
// Params 0
// Checksum 0xf87b361c, Offset: 0x9f
// Size: 0x2
function evaluatereloadevent()
{
    
}

// Namespace battlechatter_wrapper
// Params 2
// Checksum 0xe36486cf, Offset: 0xa9
// Size: 0x2e
function function_47ce4c7d8b61f346( enemytype, enemy )
{
    battlechatter::executeevent( "spotted", [ enemytype, enemy ] );
}

// Namespace battlechatter_wrapper
// Params 1
// Checksum 0xaf93af0, Offset: 0xdf
// Size: 0x1a
function evaluateattackevent( type )
{
    battlechatter::executeevent( "attack", type );
}

