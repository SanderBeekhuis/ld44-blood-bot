extends Node2D

var BloodDrop = preload("res://obj/BloodDrop.tscn")
var hp = 1

func hit(damage):
	hp -= damage
	if hp <= 0:
		die()

func die():
	# Spawn blood drop
	var drop = BloodDrop.instance()
	drop.position =  position
	get_parent().add_child(drop)

	# Get rid of enemy
	hide()
	queue_free()

