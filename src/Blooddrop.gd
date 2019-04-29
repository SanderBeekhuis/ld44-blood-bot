extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
signal blood_pick_up(amount)

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	$Area2D.connect("body_entered", self, "pick_up")
	connect("blood_pick_up", get_node("../Player"), "blood_picked_up")
	connect("blood_pick_up", get_node("../GUI"), "blood_picked_up")





func pick_up(player):
	emit_signal("blood_pick_up", 10)
	queue_free()



func _on_Timer_timeout():
	$AnimationPlayer.play("FadeOut")

func anim_complete():
	queue_free()
