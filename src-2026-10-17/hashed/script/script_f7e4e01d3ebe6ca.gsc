#using scripts\sp\lights;

#namespace namespace_cc2cbcd57ab8205e;

/#

    // Namespace namespace_cc2cbcd57ab8205e
    // Params 0
    // Checksum 0x570c5cb8, Offset: 0x76
    // Size: 0x2c, Type: dev
    function function_416d8df6134ec90a()
    {
        if ( isofflinetoolrun( 3 ) )
        {
            lights::init();
            println( "<dev string:x24>" );
            level waittill( #"eternity" );
        }
    }

#/
