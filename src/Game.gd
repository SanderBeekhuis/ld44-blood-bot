extends Node

var BloodBolt = preload("res://obj/BloodBolt.tscn")
var BloodBane = preload("res://obj/BloodBane.tscn")

func _on_attack(type, direction, location):
	var b
	if type == "BloodBolt":
		b = BloodBolt.instance()
	if type == "BloodBane":
		b = BloodBane.instance()
	add_child(b)
	b.rotation = direction
	b.position = location
	b.velocity = b.velocity.rotated(direction)
