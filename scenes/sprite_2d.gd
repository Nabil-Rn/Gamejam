extends CharacterBody2D

var SPEED = 400.0
const JUMP_VELOCITY = -800.0


func _physics_process(delta: float) -> void:
	if (Input.is_key_pressed(KEY_SHIFT)):
		SPEED = 600
	else:
		SPEED = 400
		
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()
