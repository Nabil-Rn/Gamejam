extends CharacterBody2D

var SPEED = 400.0
const JUMP_VELOCITY = -800.0


func _physics_process(delta: float) -> void:
	if (Input.is_key_pressed(KEY_SHIFT)):
		SPEED = 600
	else:
		SPEED = 400
	if not is_on_floor():
		velocity += get_gravity() * delta * 1.5

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if velocity.x < 0:
		Global.direction = -1
		$young.flip_h = 1
		$old.flip_h = 1
		$medium.flip_h = 1
	elif velocity.x > 0:
		Global.direction = 1
		$young.flip_h = 0
		$old.flip_h = 0
		$medium.flip_h = 0
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	body._take_damage(1)


func _on_area_2d_2_body_entered_left(body: Node2D) -> void:
	body._take_damage(1)
