extends "res://src/Enemy.gd"

export var SPEED = 250
export var HEALTH = 20
export var HEALTH_PER_LEVEL = 1
export var DAMAGE = 10
export var RELOAD = 1.2

var target = null
onready var sprite = $Sprite
var reload = 0

func _ready():
	hp = HEALTH + global.level * HEALTH_PER_LEVEL

func _physics_process(delta):
	reload -= delta

	look_at(get_node("../Player").position)
	var collision = move_and_collide(Vector2(SPEED * delta, 0).rotated(rotation))
	if collision and target and reload < 0:
		sprite.play()
		reload = RELOAD


func _on_Sprite_animation_finished():
	sprite.set_frame(0)
	sprite.stop()
	$AudioStreamPlayer2D.play()

	# If we have a target in our attack colider we deal damage
	if target:
		target.hit(DAMAGE)


func _on_Attack_body_entered(body):
	target = body


func _on_Attack_body_exited(body):
	target = null

