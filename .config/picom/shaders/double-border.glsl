// Generated from wallpaper via Matugen. Do not edit directly.
// Draws the Matugen accent line just inside bspwm's dark outer border.
#version 330

in vec2 texcoord;
uniform sampler2D tex;
uniform float opacity;
uniform float dim;
uniform float corner_radius;
uniform float border_width;
uniform bool invert_color;

vec4 default_post_processing(vec4 c);

const vec4 BORDER_COLOR = vec4(
    float(200)/255.0,
    float(199)/255.0,
    float(199)/255.0,
    1.0
);

vec4 window_shader() {
    vec2 size = textureSize(tex, 0);
    vec4 c = texture(tex, texcoord / size, 0);

    // Pixel distance to the nearest edge of the client area.
    float d = min(min(texcoord.x, size.x - texcoord.x),
                  min(texcoord.y, size.y - texcoord.y));

    // The texture includes bspwm's 3px dark border, so d=0..3 is that line.
    // Matugen accent right after it: d=3..5 (2px).
    if (d >= 3.0 && d < 5.0) {
        c = BORDER_COLOR;
    }

    return default_post_processing(c);
}
