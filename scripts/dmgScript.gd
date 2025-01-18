extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass 


func _process(delta: float) -> void:
	if (Global.health == 0):
		$"../old".visible = false
		$"../medium".visible = false
		$"../young".visible = true
		$"../1x1".disabled = false
		$"../1x2".disabled = true
	if (Global.health == 1):
		$"../old".visible = false
		$"../medium".visible = false
		$"../young".visible = true
		$"../1x1".disabled = false
		$"../1x2".disabled = true
	if (Global.health == 2):
		$"../old".visible = false
		$"../medium".visible = true
		$"../young".visible = false
		$"../1x1".disabled = true
		$"../1x2".disabled = false
	if (Global.health == 3):
		$"../old".visible = true
		$"../medium".visible = false
		$"../young".visible = false
		$"../1x1".disabled = true
		$"../1x2".disabled = false
