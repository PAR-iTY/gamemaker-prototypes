//
//
//          create triangle strips for each line segment
//
// arguments  (path id)()
{
PI = 3.14159265359;
depth=-1;

path = argument[0];


if(!path_exists(path)) show_error("path not identified", false) else 
{
    //for loop to itemize all the path points
    var points;
    for(d=1; d>-1; d--) 
    {
        for(i=path_get_number(path)-1;i > -1 ; i-- ) 
        {
          if(d<1)points[d, i] = path_get_point_x(path, i) else  points[d,i] = path_get_point_y(path, i);
        } 
    }
    //show_message(points);
    //extend from the points either side, perpendicular to the fore + aft points to find vertex points
    // if its start or end its 90degs off the next/previous points vector
    //draw_primitive_begin(pr_trianglestrip);
    
    //vertex01[1] = ;
    //vertex02[1] = ;
    
    var length = 25;
    var vertexCount = (array_length_2d(points,0)*2)-1;
    vCount = vertexCount;
    vertexArray[1, vertexCount] = 0;
   
    
    for(var pts = array_length_2d(points, 0)-1;pts>-1;pts-- )
    {
    
        if(pts==array_length_2d(points,0)-1) 
        {
            thispt[0] = points[0,pts];
            thispt[1] = points[1,pts];
            nextpt[0] = points[0,pts-1];
            nextpt[1] = points[1,pts-1];
            
            nextpt_angle = point_direction(thispt[0],thispt[1], nextpt[0], nextpt[1]);
            proj_angle = 90 + nextpt_angle;
            newpt[0] = length*cos(degtorad(-proj_angle))+thispt[0];
            newpt[1] = length*sin(degtorad(-proj_angle))+thispt[1];
            newpt2[0] = -length*cos(degtorad(-proj_angle))+thispt[0];
            newpt2[1] = -length*sin(degtorad(-proj_angle))+thispt[1];
            
            vertexArray[0,vertexCount] = newpt[0];
            vertexArray[1,vertexCount] = newpt[1];
            vertexCount--;
            vertexArray[0,vertexCount] = newpt2[0];
            vertexArray[1,vertexCount] = newpt2[1];
            if(vertexCount>0) vertexCount--;
            
            draw_set_colour(c_white);
            draw_line(thispt[0],thispt[1], nextpt[0],nextpt[1]);
            draw_set_colour(c_red);
            draw_circle(thispt[0],thispt[1],3 , false);
              
            draw_line_colour(newpt[0],newpt[1], thispt[0],thispt[1],c_white,c_gray);
            draw_line_colour(newpt2[0],newpt2[1], thispt[0],thispt[1],c_white,c_gray);
            draw_set_colour(c_blue);
            draw_circle(newpt[0],newpt[1], 1.5, false);
            draw_circle(newpt2[0],newpt2[1], 1.5, false);
            
            
        }
        else if(pts==0)
        {
            thispt[0] = points[0,pts];
            thispt[1] = points[1,pts];
            prevpt[0] = points[0,pts+1];
            prevpt[1] = points[1,pts+1];
            
            prevpt_angle = point_direction(thispt[0],thispt[1], prevpt[0], prevpt[1]);
            proj_angle = 90 + prevpt_angle;
            newpt[0] = length*cos(degtorad(-proj_angle))+thispt[0];
            newpt[1] = length*sin(degtorad(-proj_angle))+thispt[1];
            newpt2[0] = -length*cos(degtorad(-proj_angle))+thispt[0];
            newpt2[1] = -length*sin(degtorad(-proj_angle))+thispt[1];
            
            vertexArray[0,vertexCount] = newpt[0];
            vertexArray[1,vertexCount] = newpt[1];
            vertexCount--;
            vertexArray[0,vertexCount] = newpt2[0];
            vertexArray[1,vertexCount] = newpt2[1];
            
            draw_set_colour(c_white);
            draw_line(thispt[0],thispt[1], nextpt[0],nextpt[1]);
            draw_set_colour(c_red);
            draw_circle(thispt[0],thispt[1],3 , false);
              
            draw_line_colour(newpt[0],newpt[1], thispt[0],thispt[1],c_white,c_gray);
            draw_line_colour(newpt2[0],newpt2[1], thispt[0],thispt[1],c_white,c_gray);
            draw_set_colour(c_blue);
            draw_circle(newpt[0],newpt[1], 1.5, false);
            draw_circle(newpt2[0],newpt2[1], 1.5, false);
        }
        else
        { 
        
             //set up the points to work with. this point, one up the chain and one down
             thispt[0] = points[0,pts];
             thispt[1] = points[1,pts];
             nextpt[0] = points[0, pts-1];
             nextpt[1] = points[1, pts-1];
             prevpt[0] = points[0, pts+1];
             prevpt[1] = points[1, pts+1];
             
             
             prevpt_angle = point_direction(thispt[0],thispt[1], prevpt[0],prevpt[1]);
             nextpt_angle = point_direction(thispt[0],thispt[1], nextpt[0],nextpt[1]);
             
             
             
             proj_angle = (prevpt_angle + nextpt_angle)/2;
             newpt[0] = length*cos(degtorad(-proj_angle))+thispt[0];
             newpt[1] = length*sin(degtorad(-proj_angle))+thispt[1];
             
             newpt2[0] = -length*cos(degtorad(-proj_angle))+thispt[0];
             newpt2[1] = -length*sin(degtorad(-proj_angle))+thispt[1];
             
             vertexArray[0,vertexCount] = newpt[0];
             vertexArray[1,vertexCount] = newpt[1];
             vertexCount--;
             vertexArray[0,vertexCount] = newpt2[0];
             vertexArray[1,vertexCount] = newpt2[1];
             if(vertexCount>0) vertexCount--;
             
              draw_set_colour(c_white);
              draw_line(thispt[0],thispt[1], nextpt[0],nextpt[1]);
              draw_set_colour(c_red);
              draw_circle(thispt[0],thispt[1],3 , false);
              
              draw_line_colour(newpt[0],newpt[1], thispt[0],thispt[1],c_white,c_gray);
              draw_line_colour(newpt2[0],newpt2[1], thispt[0],thispt[1],c_white,c_gray);
              draw_set_colour(c_blue);
              draw_circle(newpt[0],newpt[1], 1.5, false);
              draw_circle(newpt2[0],newpt2[1], 1.5, false);
          }
    }
    //show_message(string(vertexArray));
    draw_primitive_begin(pr_trianglestrip);
    draw_set_alpha(0.5);
    while(vCount>1) //redo to make discrete 4 vertex polygon, so reusing overlapping points
    {
        for(var i =0; i<4;i++)
        {
            draw_vertex(vertexArray[0,vCount-i],vertexArray[1,vCount-i]);
        }
        
        vCount=vCount-2;
    }
    draw_primitive_end();
}


}
