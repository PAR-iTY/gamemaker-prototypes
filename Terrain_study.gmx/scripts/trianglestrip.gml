{
depth=10;
draw_set_colour(c_white);
var tex = background_get_texture(mask01);
var ofst = 10.0;
draw_primitive_begin_texture(pr_trianglestrip, tex);
draw_vertex_texture(ofst, room_width-ofst, 0, 1);
draw_vertex_texture(ofst, ofst, 0, 0);
draw_vertex_texture(room_width-ofst, room_width-ofst, 1, 1);//uses width for all to keep sqr
draw_vertex_texture(room_width-ofst, ofst, 1, 0);
draw_primitive_end();

}

