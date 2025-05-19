shader_type canvas_item;

uniform int numDivisions = 96;

void vertex() {

	// Called for every vertex the material is visible on.
}

void fragment() {
	vec2 st = (vec2(ivec2( UV * float(numDivisions) ))+0.5)/float(numDivisions);
	COLOR = vec4(0.2, 0.4, 1.0, 1.0);
	COLOR += 0.3 * (1.0 - st.y);
	COLOR *= 1.0 + 0.04 * sin(cos(TIME * 2.0) + st.x * 20.0 + st.y * 10.0) ;
	//+ sin(cos(TIME * 3.0) * 2.0 / (st.y * 10.0) );
	//COLOR.b += 0.1 * (sin((st.x * 10.0 + sin(st.y * 4.0 + TIME * 0.1) + TIME * 0.02) * 30.0 + TIME * 1.0)
		//+ 0.05 * cos((st.x * .6 * sin(TIME)- st.y * .2) * 30.0 + TIME * 2.0));
}


//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
