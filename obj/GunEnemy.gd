extends "res://src/Enemy.gd"

export var SPEED = 150
export var HEALTH = 40
export var HEALTH_PER_LEVEL = 3
export var DPS = 40
export var FIRST_TIME_WALK_TIME = 2
export var WALK_TIME = 2

var WALK_STATE = 10
var CHARGE_STATE = 11
var PREPARE_FIRE_STATE = 12
var FIRE_STATE = 13

var state = WALK_STATE
var walk_time = 1
var targets = []

onready var player = get_node("../Player")
onready var sprite = $Sprite

func _ready():
	hp = HEALTH + global.level* HEALTH_PER_LEVEL
	walk_time = FIRST_TIME_WALK_TIME

func _process(delta):
	walk_time -= delta

	if state == WALK_STATE and walk_time <= 0:
		state = CHARGE_STATE
		$AnimationPlayer.play("Attack")
	if state == FIRE_STATE:
		for target in targets:
			target.hit(DPS * delta)


func _physics_process(delta):
	if state == WALK_STATE:
		look_at(player.position)
		move_and_collide(Vector2(SPEED * delta, 0).rotated(rotation))
	elif state == CHARGE_STATE:
		look_at(player.position)


func anim_charged():
	state = PREPARE_FIRE_STATE
	$AudioStreamPlayer2D.play()

func anim_fire():
	state = FIRE_STATE
	$Attack.animate()


func anim_done():
	state = WALK_STATE
	walk_time = WALK_TIME
	sprite.frame = 0

func _on_AttackArea2D_body_entered(body):
	targets.append(body)

func _on_AttackArea2D_body_exited(body):
	targets.erase(body)
