// Author:
// Title:

#ifdef GL_ES
precision highp float;
#endif

#define PI 3.14159

uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

vec2 xy2rad(vec2 st){
	vec2 ar;
    ar.x = atan(st.y,st.x);
    ar.y = sqrt(pow(st.x,2.0)+pow(st.y,2.0));
    
    return ar;
}

void main() {
	vec2 st = gl_FragCoord.xy/u_resolution.xy;
	st.x *= u_resolution.x/u_resolution.y;
    
	vec2 st2 = st + vec2(-0.5);
	vec2 ar  = xy2rad(st2);
	vec2 ar2;
	ar2.x = ar.x+u_time*PI;
	ar2.x/= 2.0*PI;
	ar2.x = fract(ar2.x);
    
	gl_FragColor = vec4(ar2.x,0.0,0.0,1.0);
}