//
//      do all the debug drawing for vert and path positions 
//

{
thispt = argument0;
newpt = argument1;
newpt2 = argument2;
prev_angle = argument3
next_angle = argument4
proj = argument5;
prev_proj = argument6;
type = argument7;

draw_set_colour(c_white);
//draw_line(thispt[0],thispt[1], nextpt[0],nextpt[1]);
if(type == 1) 
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
    
}

draw_line_colour(newpt[0],newpt[1], newpt2[0],newpt2[1],c_white,c_gray);
draw_line_colour(newpt2[0],newpt2[1], thispt[0],thispt[1],c_white,c_gray);
draw_set_colour(c_blue);
//draw_text_ext_transformed(newpt2[0]+6,newpt2[1],string(newpt2[0]-thispt[0])+", "+string(newpt2[1]-thispt[1]),15,1000,0.2,0.2,0);
draw_circle(newpt[0],newpt[1], 1.5, false);
draw_set_colour(c_lime);
//draw_text_ext_transformed(newpt[0]+6,newpt[1],string(newpt[0]-thispt[0])+", "+string(newpt[1]-thispt[1]),15,1000,0.2,0.2,0);
draw_circle(newpt2[0],newpt2[1], 1.5, false);


}
