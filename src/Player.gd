extends KinematicBody2D
const WALKING_SPEED = 400
export (Color) var blood_color
export (Color) var over_blood_color
const RELOAD_TIME = 0.7
const MIN_RELOAD_TIME = 0.2

signal attack

var blood_level = 20
var reload = 0
var special_reload =0


func _process(delta):
	reload -= delta
	special_reload -= delta
	look_at(get_global_mouse_position())

	if Input.is_action_pressed("attack"):
		if reload < 0 and blood_level >= 2:
			reload = max(RELOAD_TIME * pow(0.95, global.level), MIN_RELOAD_TIME)
			change_blood(-2)
			$BloodBoltAudioStreamPlayer2D.play()
			emit_signal("attack", "BloodBolt", rotation, position)

	if Input.is_action_pressed("special_attack"):
		if special_reload < 0 and blood_level >= 20:
			reload = max(RELOAD_TIME * pow(0.95, global.level), MIN_RELOAD_TIME)
			special_reload = reload
			change_blood(-20)
			$BloodBaneAudioStreamPlayer2D.play()
			emit_signal("attack", 'BloodBane', rotation, position)


func _physics_process(delta):
	var velocity = Vector2()

	if Input.is_action_pressed("move_left"):
		velocity.x += -1
	if Input.is_action_pressed("move_right"):
		velocity.x += 1

	if Input.is_action_pressed("move_up"):
		velocity.y += -1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1

	# We don't need to multiply velocity by delta because "move_and_slide" already takes delta time into account.

	# The second parameter of "move_and_slide" is the normal pointing up.
	move_and_slide(velocity.normalized()*WALKING_SPEED, Vector2(0, 0))

func _draw():
	draw_circle(Vector2(0,0), min(blood_level, 75), blood_color)
	draw_circle(Vector2(0,0), blood_level, over_blood_color)

func blood_picked_up(amount):
	change_blood(amount)

func change_blood(delta):
	blood_level += delta
	if blood_level < 0:
		blood_level = 0
	update() # Redraw blood circle

func hit(damage):
	change_blood(-damage)
	if blood_level <= 0:
		die()

func die():
	get_tree().change_scene("res://GameOver.tscn")
