extends CharacterBody2D
class_name  gnomeEnemy

var speed = 200
var is_gnome_chase = false
var player = null
var health = 2

var dead: bool = false
var damage_to_deal = 1

func _physics_process(delta: float) -> void:		
	if not is_on_floor():
		velocity += get_gravity() * delta * 1.5
	
	if is_gnome_chase:
		var direction = (player.position - position).normalized()
		velocity.x = direction.x * speed
		#$AnimatedSprite2D.play()
	if health == 0:
		dead = true
	move_and_slide()

func _attack():
	Global.loseHealth(damage_to_deal)
	
func take_damage(amount: int) -> void:
	if not dead:
		health -= amount		
		if health <= 0:
			die()

func die():
	dead = true
	queue_free()

func _on_detection_area_body_entered(body: Node2D) -> void:
	player = body
	is_gnome_chase = true


func _on_attack_body_entered(body: Node2D) -> void:
	_attack()
