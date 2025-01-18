extends AnimatedSprite2D

@onready var main = get_tree().get_root().get_node("level1")
@onready var projectile  = load("res://scenes/axe.tscn")
func _process(delta: float) -> void:
	if(Input.is_key_pressed(KEY_J)):
		play("attack", 1.0, false)
		if(Global.direction == 1):
			$"../attackright".disabled = false
			await $".".animation_finished
			$"../attackright".disabled = true
		elif(Global.direction == -1):
			$"../attackleft".disabled = false
			await $".".animation_finished
			$"../attackleft".disabled = true
	elif(Input.is_key_pressed(KEY_K)):
		play("axe throw", 1.0, false)
	if((Input.is_key_pressed(KEY_D) || Input.is_key_pressed(KEY_A)) && Input.is_key_pressed(KEY_SHIFT)):
		if(animation.begins_with("w") || animation.begins_with("i")):
			play("running", 1.0, false)
		await $".".animation_finished
		play("running", 1.0, false)
	elif(Input.is_key_pressed(KEY_D) || Input.is_key_pressed(KEY_A)):
		if(animation.begins_with("r") || animation.begins_with("i")):
			play("walking", 1.0, false)
		await $".".animation_finished
		play("walking", 1.0, false)
	else:
		if(animation.begins_with("w") || animation.begins_with("r")):
			play("idle", 1.0, false)
		await $".".animation_finished
		play("idle", 1.0, false)


func shoot():
	var instance = projectile.instantiate()
	instance.dir = rotation
	instance.spawnPos = global_position
	main.add_child.call_deferred(instance)
	


func _on_animation_finished() -> void:
	if(animation.begins_with("ax")):
		var instance = projectile.instantiate()
		instance.spawnPos = global_position + Vector2(Global.direction*200,20)
		main.add_child.call_deferred(instance)
