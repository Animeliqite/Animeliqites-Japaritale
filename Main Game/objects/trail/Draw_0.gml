shader_set(colorize);
shader_set_uniform_f_array(uniColor, color);
draw_self();
shader_reset();