///create_fixture_from_path(path)
path = argument0;                                                   //get the path from argument

var p_size = path_get_number(path);                                 //get the total amount of points in our fixture

p_x[0]=path_get_point_x(path, 0);                                   //set the first one to the first X point
p_y[0]=path_get_point_y(path, 0);                                   //set the first one to the first Y point
    
    for ( var i = 1; i < p_size; i ++ ) {
        var fix = physics_fixture_create();                         //Create the fixture
        
        p_x[i] = path_get_point_x(path, i);                         //find the current path X point
        p_y[i] = path_get_point_y(path, i);                         //find the current path Y point
        
        var dir = 1;                                                //This variable will determine what orientation the fixture 
        if ( p_x[i-1]<p_x[i] ) {                                    //points are consecutively read and will keep the points read in clock-wise
                dir = .0001;                                        //order. This code makes sure to set the third point down meaning
            }                                                       //that the current point and the previous point are moving LEFT.
            else 
            {
                dir = -.0001;                                       //and this makes sure to place the third point up meaning our points are moving RIGHT.
            }                                                       //we used .0001 to get as close to creating a fixture 'line' 
                                                                    //as possible for our concave shape.
                                                                    
        physics_fixture_set_polygon_shape(fix);                     //start making our fixture
            physics_fixture_add_point(fix, p_x[i-1], p_y[i-1]);     //point 1
            physics_fixture_add_point(fix, p_x[i], p_y[i]);         //point 2
            physics_fixture_add_point(fix, p_x[i], p_y[i]+dir);     //and point 3. point 3 must be at a coordinate that 
                                                                    //keeps the fixture clockwise
            
        physics_fixture_set_density(fix, 0);                        //make it static
        physics_fixture_bind(fix, self);                            //bind it to our "land" object
        
        physics_fixture_delete(fix);                                //Wa-la! done!
    }

