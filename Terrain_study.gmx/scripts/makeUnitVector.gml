//
//
//          take a vector and make it unit length.
//           takes a vector as float arguments
//
//

{
vec2[0] = argument[0];
vec2[1] = argument[1];

len = sqrt(sqr(vec2[0]) + sqr(vec2[1]));

vec2[0] = vec2[0]/len;
vec2[1] = vec2[1]/len;

return vec2;




}
