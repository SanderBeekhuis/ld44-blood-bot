extends Path2D

export (PackedScene) var BasicEnemy
export (PackedScene) var GunEnemy

export var BASE_WAIT_TIME = 4

signal level_up

func _on_Timer_timeout():
	#spawn an enemy
	var enemy = null
	if randf() < 0.8:
		enemy = BasicEnemy.instance()
	else:
		enemy = GunEnemy.instance()
	$PathFollow2D.unit_offset = rand_range(0,1)
	enemy.position = $PathFollow2D.position
	get_parent().add_child(enemy)


func _on_LevelUp_timeout():
	emit_signal("level_up")
	global.level += 1
	# Make timer faster
	$Timer.wait_time = max(0.2, BASE_WAIT_TIME * pow(.9, global.level))


