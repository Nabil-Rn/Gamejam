extends CharacterBody2D

@export var SPEED = 1000

var spawnPos : Vector2
var rot = 0.1

func _ready() -> void:
	global_position = spawnPos
	if (Global.direction == -1):
		SPEED = -1000
		rotation = -0.1
	else:
		SPEED = 1000
		rotation = 0.1
	$Timer.start()


func _physics_process(delta: float) -> void:
	velocity = Vector2(SPEED,0)
	rotate(rot)
	move_and_slide()


func _on_timer_timeout() -> void:
	queue_free()
