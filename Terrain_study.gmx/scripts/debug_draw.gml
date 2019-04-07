//
//      do all the debug drawing for vert and path positions 
//

{
thispt = argument0;
nextpt = argument1
var newpt = argument2;
var newpt2 = argument3;
var prev_angle = argument4;
var next_angle = argument5;
var proj = argument6;
var prev_proj = argument7;
var path_len = argument8;
var type = argument9;

draw_set_colour(c_white);
var c = c_black;
var dist = point_distance(thispt[0],thispt[1],  nextpt[0],nextpt[1]);
//draw_line(thispt[0],thispt[1], nextpt[0],nextpt[1]);
/*if(type == 1) 
{
    draw_set_colour(c_red);
    draw_circle(thispt[0],thispt[1],3 , false);
    draw_set_colour(c_black);
    draw_text_ext_transformed(thispt[0]+5, thispt[1]-3, "prev angle "+string(prev_angle),15,1000,0.25,0.25,0);
    //draw_text_ext_transformed(thispt[0]+5, thispt[1]+3, "next angle "+string(next_angle),15,1000,0.4,0.4,0);
    draw_text_ext_transformed(thispt[0]+5, thispt[1]+9, "proj angle "+string(proj_angle),15,1000,0.25,0.25,0);
    draw_text_ext_transformed(thispt[0]+5, thispt[1]+15, "proj diff  "+string(proj_angle-prev_proj),15,1000,0.25,0.25,0);
} 
else if(type == 2)
{
    draw_set_colour(c_teal);
    draw_circle(thispt[0],thispt[1],3 , false);
    draw_set_colour(c_black);
    //draw_text_ext_transformed(thispt[0]+5, thispt[1]-3, "prev angle "+string(prev_angle),15,1000,0.4,0.4,0);
    draw_text_ext_transformed(thispt[0]+5, thispt[1]+3, "next angle "+string(next_angle),15,1000,0.25,0.25,0);
    draw_text_ext_transformed(thispt[0]+5, thispt[1]+9, "proj angle "+string(proj_angle),15,1000,0.25,0.25,0);
    //draw_text_ext_transformed(thispt[0]+5, thispt[1]+15, "proj diff  "+string(proj_angle-prev_proj),15,1000,0.25,0.25,0);
}
else
{
    draw_set_colour(c_white);
    draw_circle(thispt[0], thispt[1], 2.5, false);
    draw_set_colour(c_black);
    draw_text_ext_transformed(thispt[0]+5, thispt[1]-3, "next angle "+string(next_angle),15,1000,0.25,0.25,0);
    draw_text_ext_transformed(thispt[0]+5, thispt[1]+3, "prev angle "+string(prev_angle),15,1000,0.25,0.25,0);
    draw_text_ext_transformed(thispt[0]+5, thispt[1]+9, "proj angle "+string(proj_angle),15,1000,0.25,0.25,0);
    draw_text_ext_transformed(thispt[0]+5, thispt[1]+15, "proj diff  "+string(proj_angle-prev_proj),15,1000,0.25,0.25,0);
    
}**/

draw_line_colour(newpt[0],newpt[1], newpt2[0],newpt2[1],c_white,c_gray);
draw_line_colour(newpt2[0],newpt2[1], thispt[0],thispt[1],c_white,c_gray);
draw_set_colour(c_blue);
//draw_text_ext_transformed(newpt2[0]+6,newpt2[1],string(newpt2[0]-thispt[0])+", "+string(newpt2[1]-thispt[1]),15,1000,0.2,0.2,0);
draw_circle(newpt[0],newpt[1], 1.5, false);
draw_set_colour(c_lime);
//draw_text_ext_transformed(newpt[0]+6,newpt[1],string(newpt[0]-thispt[0])+", "+string(newpt[1]-thispt[1]),15,1000,0.2,0.2,0);
draw_circle(newpt2[0],newpt2[1], 1.5, false);

draw_text_transformed_colour(thispt[0]+3,  thispt[1]+4, string(sum_len_d/path_len),0.4,0.4,0,c,c,c,c,1.0);
sum_len_d+=dist;
//draw_text_transformed_colour(vert_array[0,i-3]+3,  vert_array[1,i-3]+4, string(lerp(0,1, (len_sum+seg_len)/path_length)),0.3,0.3,0,c,c,c,c,1.0);


}
