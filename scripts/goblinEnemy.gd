extends CharacterBody2D
class_name  goblinEnemy

var speed = 200
var is_goblin_detect = false
var player = null
var health = 80

var dead: bool = false
var taking_damage: bool = false
var damage_to_deal = 20

func _physics_process(delta: float) -> void:		
	#if is_goblin_detect:
		#$AnimatedSprite2D.play()
	
	if taking_damage:
		health -= 30
		
	if health == 0:
		dead = true

func _attack():
	Global.loseHealth(1)
	

func _on_detection_area_body_entered(body: Node2D) -> void:
	player = body
	is_goblin_detect = true
	
