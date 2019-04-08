//
//
//          create triangle strips for each line segment
//
// arguments  (path id)()
{
PI = 3.14159265359;
depth=-1;

path = argument[0];
debug = argument[1];
var uv_array;

if(!path_exists(path)) show_error("path not identified", false) 
else 
{
    var path_length = path_get_length(path);
    var path_length_total = path_length;
    var width = 50; //actually half width. 

      
      

    //for loop to itemize all the path points
    var thispt, nextpt, newpt, newpt1;
    var points;
    path_size = path_get_number(path)-1;
    for(d=1; d>-1; d--) 
    {
        for(i=path_size;i > -1 ; i-- ) 
        {
          if(d<1)points[d, i] = path_get_point_x(path, i) else  points[d,i] = path_get_point_y(path, i);
           
        } 
    }
    // uv_array contains the v coord for each vert pair
    
    for(i=path_size; i>-1;i--)
    {
        uv_array[i] = path_length/path_length_total;
        if(i==0) var pt_dist = 0 else 
        {
        var pt_dist = point_distance(points[0,i], points[1,i], points[0,i-1], points[1,i-1]);
        }
        path_length-=pt_dist;
    }
    //extend from the points either side, perpendicular to the fore + aft points to find vertex points
    // if its start or end its 90degs off the next/previous points vector
    //draw_primitive_begin(pr_trianglestrip);
    
    
    var vertexCount = (array_length_2d(points,0)*2)-1;
    var vCount = vertexCount;
    var vertexArray;
    vertexArray[1, vertexCount] = 0;
    
    draw_set_alpha(1);
    var prev_proj = 0;
    for(var pts = path_size;pts>-1;pts-- )
    {
    
        if(pts==path_size) 
        {
            thispt[0] = points[0,pts];
            thispt[1] = points[1,pts];
            nextpt[0] = points[0,pts-1];
            nextpt[1] = points[1,pts-1];
            
            nextpt_angle = point_direction(nextpt[0], nextpt[1], thispt[0],thispt[1]);
            if(nextpt_angle>180) proj_angle = (nextpt_angle-90) mod 360 
            else proj_angle = (nextpt_angle+90) mod 360;
            
            //if(proj_angle>180) proj_angle-=180;
            newpt[0] = width*cos(degtorad(-proj_angle))+thispt[0];
            newpt[1] = width*sin(degtorad(-proj_angle))+thispt[1];
            newpt2[0] = -width*cos(degtorad(-proj_angle))+thispt[0];
            newpt2[1] = -width*sin(degtorad(-proj_angle))+thispt[1];
            
            vertexArray[0,vertexCount] = newpt[0];
            vertexArray[1,vertexCount] = newpt[1];
            vertexCount--;
            vertexArray[0,vertexCount] = newpt2[0];
            vertexArray[1,vertexCount] = newpt2[1];
            if(vertexCount>0) vertexCount--;
            
            if(debug) script_execute(debug_draw, thispt,nextpt , newpt, newpt2, 0, nextpt_angle, proj_angle, prev_proj,path_length, 2);
            prev_proj = proj_angle;
            
        }
        else if(pts==0)
        {
            thispt[0] = points[0,pts];
            thispt[1] = points[1,pts];
            prevpt[0] = points[0,pts+1];
            prevpt[1] = points[1,pts+1];
            
            prevpt_angle = point_direction(prevpt[0], prevpt[1], thispt[0],thispt[1]);
            proj_angle = (prevpt_angle+90) mod 360;
            //if(abs(proj_angle)>=180) proj_angle=(proj_angle+180) mod 360;
            if(max(proj_angle, prev_proj)-min(proj_angle, prev_proj)>=90 || max(proj_angle, prev_proj)-min(proj_angle, prev_proj)<=-90) proj_angle=(proj_angle+180) mod 360;
            
            newpt[0] = width*cos(degtorad(-proj_angle))+thispt[0];
            newpt[1] = width*sin(degtorad(-proj_angle))+thispt[1];
            newpt2[0] = -width*cos(degtorad(-proj_angle))+thispt[0];
            newpt2[1] = -width*sin(degtorad(-proj_angle))+thispt[1];
            
            vertexArray[0,vertexCount] = newpt[0];
            vertexArray[1,vertexCount] = newpt[1];
            vertexCount--;
            vertexArray[0,vertexCount] = newpt2[0];
            vertexArray[1,vertexCount] = newpt2[1];
            
           
            if(debug) script_execute(debug_draw, thispt, thispt, newpt, newpt2, prevpt_angle, 0, proj_angle, prev_proj,path_length, 1);
            prev_proj = proj_angle;
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
             
             prevpt_angle = point_direction(prevpt[0],prevpt[1], thispt[0],thispt[1]);
             nextpt_angle = point_direction(nextpt[0],nextpt[1], thispt[0],thispt[1]);
             /*
             if(prevpt_angle>180) 
             {
                var a = prevpt_angle;
                prevpt_angle = nextpt_angle;
                nextpt_angle = a;
             }**/
              
             proj_angle = (prevpt_angle/2) + (nextpt_angle/2);
             //if(abs(proj_angle)>=180) proj_angle=(proj_angle+180) mod 360;
             if(max(proj_angle, prev_proj)-min(proj_angle, prev_proj)>=90 || max(proj_angle, prev_proj)-min(proj_angle, prev_proj)<=-90) proj_angle=(proj_angle+180) mod 360;
             
             newpt[0] = width*cos(degtorad(-proj_angle))+thispt[0];
             newpt[1] = width*sin(degtorad(-proj_angle))+thispt[1];
             newpt2[0] = -width*cos(degtorad(-proj_angle))+thispt[0];
             newpt2[1] = -width*sin(degtorad(-proj_angle))+thispt[1];
             
             vertexArray[0,vertexCount] = newpt[0];
             vertexArray[1,vertexCount] = newpt[1];
             vertexCount--;
             vertexArray[0,vertexCount] = newpt2[0];
             vertexArray[1,vertexCount] = newpt2[1];
             if(vertexCount>0) vertexCount--;
             
             if(debug) script_execute(debug_draw, thispt,nextpt, newpt, newpt2, prevpt_angle, nextpt_angle, proj_angle, prev_proj,path_length, 0);
             prev_proj = proj_angle;
          }
    }

    
    //shader uniforms 
    var tile_handle = shader_get_uniform(long_shader, "tile_num");
    var tilenum = path_length_total / (2*width);
    //show_message(string(tilenum));
    shader_set(long_shader);
    texture_set_interpolation(false);
    shader_set_uniform_f(tile_handle, tilenum);
    script_execute(draw_lomg_strip, vertexArray, uv_array);
    shader_reset();
    
    
}


}
