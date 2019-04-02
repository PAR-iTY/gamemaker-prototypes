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
// terrain blending SHADER v2
//
#define PI 3.14159265359

varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float u_time;

uniform vec4 terrain_uvs;
uniform lowp sampler2D terrain_sample;

float _heightblendfactor = 0.04;


float lerp(float v1, float v2, float t)
{
    t = clamp(t, 0.0, 1.0);
    return v1 + ((v2 - v1) * t);  
}




vec4 heightblend(vec4 tex1, float height1, vec4 tex2, float height2) 
{
    float height_start = max(height1, height2) -_heightblendfactor;
    float level1 = max(height1 - height_start, 0.);
    float level2 = max(height2 - height_start, 0.);
    return ((tex1 * level1) + (tex2 * level2)) / (level1 + level2);
}

vec4 heightlerp(vec4 tex1, float height1, vec4 tex2, float height2, float t)
{
    t = clamp(t, 0.,1.0);
    return heightblend(tex1, height1*(1.-t), tex2, height2 * t);
}


void main()
{
    vec2 uv = v_vTexcoord;
    uv*=16.;
    uv = fract(uv);
    
    uv/=2.;
    uv.x += terrain_uvs.x;
    uv.y += terrain_uvs.y;

    
    vec4 mask = texture2D( gm_BaseTexture, v_vTexcoord);
    vec4 tex1 = texture2D( terrain_sample, uv+vec2(0.5 ,0.0) );
    vec4 tex1_mask = texture2D( terrain_sample, uv+vec2(0.5, 0.5) );
    vec4 tex2 = texture2D( terrain_sample, uv);
    vec4 tex2_mask = texture2D( terrain_sample, uv+vec2(0.0, 0.5) );
    
    
    //if(mask.x > 0.9)  mask.x = mask.x+tex1_mask.x;
    //if(mask.x < 0.5)  mask.x = mask.x-tex2_mask.x;
    //mask.x > 0.5 ? mask.x *= tex2_mask.x : mask.x*= tex1_mask.x; 
    //tex1_mask.y < tex2_mask.y ? mask += tex1_mask*0.5 : mask += -tex2_mask*0.5;
    
    gl_FragColor = heightlerp(tex1, tex1_mask.x, tex2, tex2_mask.x, mask.x);
    //gl_FragColor = mix(tex1, tex2, mask.x);
    //gl_FragColor = tex1;
    
}

