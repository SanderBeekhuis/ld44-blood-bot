extends KinematicBody2D

const SPEED = 700
const DAMAGE = 0
var velocity =  Vector2(SPEED, 0)

signal attack

func _ready():
	connect("attack", get_parent(), '_on_attack')

func _physics_process(delta):
	var collision = move_and_collide(velocity*delta)
	if collision:
		hide()
		queue_free()
		if collision.collider.has_method("hit"):
			collision.collider.hit(DAMAGE)
		for i in range(0, 16):
			emit_signal("attack", "BloodBolt", rotation + i* PI/8, position)