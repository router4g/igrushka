if (armed) {
    armed = false;
    instance_create_layer(x, y, "Instances", anim_bomb);
    obj_player.x = obj_spawn_point.x;
    obj_player.y = obj_spawn_point.y;
    instance_destroy();
}