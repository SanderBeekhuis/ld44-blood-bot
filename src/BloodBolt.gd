extends KinematicBody2D

const SPEED = 700
const DAMAGE = 15
var velocity =  Vector2(SPEED, 0)

func _physics_process(delta):
	var collision = move_and_collide(velocity*delta)
	if collision:
		hide()
		queue_free()
		if collision.collider.has_method("hit"):
			collision.collider.hit(DAMAGE)