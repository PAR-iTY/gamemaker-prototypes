//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.	
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// long_shader fragment
//
#define PI 3.14159265359
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    
    vec2 uv = v_vTexcoord;
    uv.y*=30.;
    uv.y = fract(uv.y);
    
   float ramp = 1.*sin(uv.x*(PI));
   //float ramp = uv.x;
   vec4 colour = vec4(ramp, ramp, ramp, 1.);
   colour = vec4(1.0);
    
    
    
    //gl_FragColor = vec4(colour, 1.);
    //gl_FragColor = vec4(0.5,0.5,0.5,1.);
    gl_FragColor = colour * texture2D( gm_BaseTexture, uv );
}

