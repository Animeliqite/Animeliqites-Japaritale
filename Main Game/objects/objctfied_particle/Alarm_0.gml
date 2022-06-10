repeat (spawnRate) {
	randomize();
	instance_create_depth(partX + random(partXEnd - partX), partY + random(partYEnd - partY), -8000, objectToSpawn);
}
alarm[0] = delay;