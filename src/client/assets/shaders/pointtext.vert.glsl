#version 450

layout(location = 0) in vec3 inPosition;
layout(location = 1) in float inSize;
layout(location = 2) in vec2 inTexCoord;

layout(location = 0) out vec2 fragUV;

layout(binding = 0) uniform UniformBufferObject {
    mat4 model[100];
    mat4 view;
    mat4 proj;
} ubo;

void main() {

    vec4 viewPos = ubo.view * vec4(inPosition, 1.0);

    gl_Position = ubo.proj * viewPos;

    float dist = length(viewPos.xyz);

    gl_PointSize = inSize * (1.0 / dist) * 100.0;

    // não precisa realmente
    // mas deixamos compatível
    fragUV = inTexCoord;
}