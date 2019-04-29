extends Control

func _ready():
	$AudioStreamPlayer.play()

func blood_picked_up(amount):
	global.blood_harvested += amount
	update_label()

func update_label():
	$Label.text = str("Blood Harvested: ", global.blood_harvested, '\nLevel: ', global.level)

func _on_Spawner_level_up():
	update_label()

