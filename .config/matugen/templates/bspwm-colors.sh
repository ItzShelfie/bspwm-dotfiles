# Generated from wallpaper via Matugen. Do not edit directly.
if command -v bspc >/dev/null 2>&1; then
  # Outer border: dark terminal-theme color; the shader draws the Matugen accent inside it.
  bspc config normal_border_color "{{colors.on_primary_fixed.dark.hex}}"
  bspc config active_border_color "{{colors.on_primary_fixed.dark.hex}}"
  bspc config focused_border_color "{{colors.on_primary_fixed.dark.hex}}"
  bspc config presel_feedback_color "{{colors.tertiary.dark.hex}}"
fi
