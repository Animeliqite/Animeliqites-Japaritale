draw_sprite_ext(sprite_index, image_index, camera.x + (camera.width / camera.scale_x / 2) + camera._shake_pos_x, camera.y + (camera.height / camera.scale_y / 2) + camera._shake_pos_y, 640 / (camera.width * camera.scale_y), 480 / (camera.height * camera.scale_y), -(camera.angle), c_white, image_alpha);