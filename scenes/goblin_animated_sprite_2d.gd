extends AnimatedSprite2D

@onready var main = get_tree().get_root().get_node("level1")
@onready var projectile  = load("res://scenes/axe.tscn")
func _process(delta: float) -> void:
	if(5<2):
		play("axe throw", 1.0, false)


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
