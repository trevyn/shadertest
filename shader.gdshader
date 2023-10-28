shader_type canvas_item;

uniform float blue = 1.0;
uniform float timescale = 2.0;

void vertex() {
	// Called for every vertex the material is visible on.
}

vec3 palette( float t ) {
    vec3 a = vec3(0., 0., 0.);
    vec3 b = vec3(0.2, 0.2, 0.5);
    vec3 c = vec3(blue, 1.0, 1.0);
    vec3 d = vec3(0.23,0.56,0.57);

    return a+ b*cos( 38.28318*(c*t+d) );
}

void fragment() {
	vec3 iResolution = vec3(1.0, 1.0, 0.0);
    vec2 uv = (UV * 2.0 - iResolution.xy * 1.4) / iResolution.y;
    vec2 uv0 = uv;
    vec3 finalColor = vec3(0.0);
	float iTime = TIME * timescale;
    
    for (float i = 91.0; i < 100.0; i++) {
        uv = fract(uv * .2) - 0.9;

        float d = length(uv) * exp(-length(uv0)) *0.9;

        vec3 col = palette(length(uv0) + i*1. + iTime*.21);

        d = sin(d*0.3 + iTime)/50.;
        d = abs(d);

        d = pow(0.5 / d, 1.);

        finalColor += col * d *0.05;
    }
        
    COLOR = vec4(finalColor, 1.0);

}

void light() {
	// Called for every pixel for every light affecting the CanvasItem.
}
