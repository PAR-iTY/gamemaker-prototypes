//
//
//      Draws the lemgthy object.
//      takes an array of vertex postitions
//
//      interpolates the v coord along the entire lemgth
{

vert_array = argument0;
//var path_length = argument1;
uv_array = argument1;
var array_len = array_length_2d(vert_array,0)-1;
var len_sum = 0; 

var uv_i = array_length_1d(uv_array)-1;
var c=c_black;
var tex = sprite_get_texture(c_checker,0);
//shader_set(long_shader);
//draw_set_alpha(1.0);
draw_primitive_begin_texture(pr_trianglestrip,tex);

if(array_len%2==0) show_error("vertex array not even!", false);
for(var i =array_len;i>1;i=i-2)
{

    
    draw_vertex_texture(vert_array[0,i], vert_array[1,i], 0, uv_array[uv_i]  );
    draw_vertex_texture(vert_array[0,i-1], vert_array[1,i-1], 1, uv_array[uv_i] );
    draw_vertex_texture(vert_array[0,i-2], vert_array[1,i-2], 0, uv_array[uv_i-1]);
    draw_vertex_texture(vert_array[0,i-3], vert_array[1,i-3], 1, uv_array[uv_i-1] );

    //draw_text_transformed_colour(vert_array[0,i-1]+3,  vert_array[1,i-1]+4, string(lerp(0,1, (len_sum+seg_len)/path_length)),0.3,0.3,0,c,c,c,c,1.0);
    //draw_text_transformed_colour(vert_array[0,i-3]+3,  vert_array[1,i-3]+4, string(lerp(0,1, (len_sum+seg_len)/path_length)),0.3,0.3,0,c,c,c,c,1.0);
    uv_i--;
}

draw_primitive_end();

//draw_set_alpha(1.0);
//shader_reset();


}
