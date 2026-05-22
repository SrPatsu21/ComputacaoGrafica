#version 450

layout(location = 0) in vec2 fragUV;

layout(location = 0) out vec4 outColor;

layout(binding = 1) uniform sampler2D texSampler;

void main() {

    // UV automático do point sprite
    vec2 uv = gl_PointCoord;

    // transforma quadrado em círculo
    vec2 coord = uv * 2.0 - 1.0;

    if(dot(coord, coord) > 1.0)
        discard;

    vec4 tex = texture(texSampler, uv);

    // opcional:
    // descarta transparência
    if(tex.a < 0.1)
        discard;

    outColor = tex;
}