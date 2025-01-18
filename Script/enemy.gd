extends CharacterBody2D

var speed_reduce = 50
var player_chase = false
var player = null

func _physics_process(delta: float) -> void:
		if player_chase:
			position += (player.position - position) / speed_reduce

func _on_detection_area_body_entered(body: Node2D) -> void:
	player = body
	player_chase = true
	
