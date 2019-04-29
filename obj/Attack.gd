extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var frame1 = preload('res://res/gun_enemy/gun_enemy_projectile0000.png')
var frame2 = preload('res://res/gun_enemy/gun_enemy_projectile0001.png')
var frame3 = preload('res://res/gun_enemy/gun_enemy_projectile0002.png')
var frame4 = preload('res://res/gun_enemy/gun_enemy_projectile0003.png')
var frame5 = preload('res://res/gun_enemy/gun_enemy_projectile0004.png')
var frame6 = preload('res://res/gun_enemy/gun_enemy_projectile0005.png')
var frame7 = preload('res://res/gun_enemy/gun_enemy_projectile0006.png')
var frame8 = preload('res://res/gun_enemy/gun_enemy_projectile0007.png')
var frame9 = preload('res://res/gun_enemy/gun_enemy_projectile0008.png')
var frame10 = preload('res://res/gun_enemy/gun_enemy_projectile0009.png')
var frame11 = preload('res://res/gun_enemy/gun_enemy_projectile0010.png')
var frame12 = preload('res://res/gun_enemy/gun_enemy_projectile0011.png')
var frames = [frame1, frame2, frame3, frame4, frame5, frame6, frame7, frame8, frame9, frame10, frame11, frame12]


var i = 0


func animate():
	show()
	$SpriteTimer.start()
	$RenderTimer.start()

func _on_RenderTimer_timeout():
	hide()
	i = 0
	texture = frames[0]
	$SpriteTimer.stop()


func _on_SpriteTimer_timeout():
	i = (i+1)% 12
	texture = frames[i]
	update()

