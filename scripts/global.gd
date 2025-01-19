extends Node


var health = 1
var direction = 1
func loseHealth(healthlost):
	if (health - healthlost > 0):
		health -= healthlost
	elif (health - healthlost <= 0):
		get_tree().change_scene_to_file("res://scenes/death.tscn")

func gainHealth(healthgain):
	if (health + healthgain < 4):
		health += healthgain
	elif (health > 3):
		health = 3
