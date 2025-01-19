extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/player.tscn")


func _on_how_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/how.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_credit_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/credit.tscn")
