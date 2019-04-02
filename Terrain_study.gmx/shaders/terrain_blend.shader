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
// terrain blending SHADER
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float u_time;

uniform vec4 terrain_uvs;
uniform mediump sampler2D terrain_sample;


void main()
{
    vec2 uv = v_vTexcoord;
    uv*=13.;
    uv = fract(uv);
    
   

    
    vec4 mask = texture2D( gm_BaseTexture, v_vTexcoord);
    vec4 tex1 = texture2D( terrain_sample, (uv/2.)+terrain_uvs.xy+vec2(0.5 ,0.0) );
    vec4 tex2 = texture2D( terrain_sample, (uv/2.)+terrain_uvs.xy);
    gl_FragColor = mix(tex1, tex2, mask);
}

