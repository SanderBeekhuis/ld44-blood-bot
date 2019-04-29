extends Control


func _ready():
	$CenterContainer/VBoxContainer/ScoreLabel.text = str("You harvested ", global.blood_harvested,  " units of blood and reached level ", global.level)


func _process(delta):
	if Input.is_action_pressed("restart"):
		get_tree().change_scene("res://Game.tscn")
		global.blood_harvested = 0