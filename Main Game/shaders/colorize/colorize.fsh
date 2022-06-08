// Color Overlay Fragment Shader
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform vec3 colorRange;

void main()
{
    vec4 texColor = texture2D(gm_BaseTexture, v_vTexcoord);
    gl_FragColor = v_vColour * vec4(colorRange.rgb, texColor.a);
}