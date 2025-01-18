extends Node


var health = 3
var direction = 1
func loseHealth(healthlost):
	if (health + healthlost > 0):
		health -= healthlost
	elif (health + healthlost < 0):
		health = 0

func gainHealth(healthgain):
	if (health + healthgain < 4):
		health += healthgain
	elif (health < 3):
		health = 3
