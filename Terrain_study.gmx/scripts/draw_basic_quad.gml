//
//
//      Makes a quad polygon.  takes the four vertex's positions.
//      
//

{
var vert0 = argument0;  //verts are 1d arrays containing x and y
var vert1 = argument1;
var vert2 = argument2;
var vert3 = argument3;

draw_primitive_begin(pr_trianglestrip);
draw_vertex(vert0[0],vert0[1]);
draw_vertex(vert1[0],vert1[1]);
draw_vertex(vert2[0],vert2[1]);
draw_vertex(vert3[0],vert3[1]);
draw_primitive_end();


}

