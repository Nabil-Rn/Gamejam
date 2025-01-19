extends CharacterBody2D
class_name  gnomeEnemy

var speed = 200
var is_gnome_chase = false
var player = null
var health = 80

var dead: bool = false
var taking_damage: bool = false
var damage_to_deal = 20

func _physics_process(delta: float) -> void:		
	if not is_on_floor():
		velocity += get_gravity() * delta * 1.5
	
	if is_gnome_chase:
		var direction = (player.position - position).normalized()
		velocity.x = direction.x * speed
		print("it works")
		#$AnimatedSprite2D.play()
	
	if taking_damage:
		health -= 30
		
	if health == 0:
		dead = true
	move_and_slide()

func _attack():
	print("test")
	

func _on_detection_area_body_entered(body: Node2D) -> void:
	player = body
	is_gnome_chase = true
	
