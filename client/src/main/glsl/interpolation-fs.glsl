#version 300 es 
precision highp float;

in vec2 texCoord; // passed from VS

uniform struct {
	sampler2D keyTexture;
	float nNodes;
	float nKeys;
	float animationTime;
	/*iMSc: instance*/	
} mesh;

layout(location = 0) out vec4 fragQ;
layout(location = 1) out vec4 fragT;

void main(){	
  //fragQ = vec4(0, 0, 0, 1);
  //fragT = vec4(0, 0, 0, 0);
  float iNode = (texCoord.y * mesh.nNodes);
  float iKey = mod(floor(mesh.animationTime * 40.0) * 2.0, mesh.nKeys * 2.0);
  fragQ = texture(mesh.keyTexture, vec2(
	  (iKey + 0.5) / mesh.nKeys / 2.0,
	  iNode / mesh.nNodes));
  iKey += 1.0;

  fragT = texture(mesh.keyTexture, vec2(
	  (iKey + 0.5) / mesh.nKeys / 2.0,
	  iNode / mesh.nNodes));
}
