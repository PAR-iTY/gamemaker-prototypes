
//create a chain fixture;  iterate over the given path adding to the fixture
path = argument0;
p_size = path_get_number(path);

var fix = physics_fixture_create(); 
var inst;
physics_fixture_set_chain_shape(fix, false);

//p_x[0] = path_get_point_x(path, 0);
//p_y[0] = path_get_point_y(path, 0);

for(var i = 0; i < p_size; i++) {
   
    p_x = path_get_point_x(path, i);
    p_y = path_get_point_y(path, i);
    physics_fixture_add_point(fix, p_x, p_y);
}
physics_fixture_set_density(fix, 0);
physics_fixture_set_collision_group(fix, 0);
physics_fixture_set_awake(fix, true);
inst = instance_create(x, y, static_obj);
physics_fixture_bind(fix, inst);
physics_fixture_delete(fix);


