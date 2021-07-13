
  #ifdef GL_ES
    precision highp float;
  #endif
  uniform float time;
  uniform vec2 resolution;

  vec2 fc(vec2 z, vec2 c) {
    //return vec2(z.x*z.x-z.y*z.y+c.x, z.x*z.y+z.y*z.x+c.y);
    return vec2(abs(z.x*z.x-z.y*z.y+c.x), abs(z.x*z.y+z.y*z.x+c.y));
  }

  void main() {
    float t = time/10.0+1.0;
    float zoom = 2000.0-1000.0*(cos(t/70.0)/2.0+cos(t/16.18)/5.0+sin(t/70.0)/2.0+sin(t/16.18)/5.0);
    vec2 pos = vec2((gl_FragCoord.x-resolution.x/2.0)/zoom-0.5+cos(t/70.0)/2.0+cos(t/16.18)/5.0, (gl_FragCoord.y-resolution.y/2.0)/zoom-0.5+sin(t/70.0)/2.0+sin(t/16.18)/5.0);
    vec2 z = vec2(0.0,0.0);

    for (int j = 0; j < 50; j += 1){
    z = fc(z, pos);
    }
    float c = (z.x < 1.0 && z.y < 1.0) ? z.x: 0.0;
    float c2 = (z.x < 2.0/3.0 && z.y < 2.0/3.0) ? z.y: 0.0;
    float c3 = (z.x < 1.0/3.0 && z.y < 1.0/3.0) ? 1.0: 0.0;
    vec3 color = vec3(c, c2, c3);
    //color = (floor(mod(pos.x,1.0)*mod(pos.y,1.0)*1000.0) == 0.0) ? vec3(1.0,1.0,1.0) : color;
    gl_FragColor = vec4(color.r,color.g,color.b,1.0);
    //gl_FragColor = vec4(cos(gl_FragCoord.x/1000.0+time/9.0)/2.0+0.5,sin(gl_FragCoord.y/1000.0+time/10.0)/2.0+0.5,sin((gl_FragCoord.x-resolution.x/2.0)/(gl_FragCoord.y-resolution.y/2.0)+time/11.0)/2.0+0.5,1.0);
  }
