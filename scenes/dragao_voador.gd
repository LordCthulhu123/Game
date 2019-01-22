extends KinematicBody2D

var motion = Vector2()
var pre_tiro = preload("res://scenes/tiro_dragao.tscn")
######################
var timer = 0.0####### var para medir cooldown de disparo de dragao
const time_max = 5.0##
######################
onready var current_anim = get_node("anim").current_animation

func _ready():
	set_process(true)
	pass

func _process(delta):
	motion1(delta)
	time(delta)
	
	pass


func motion1(delta):
	print(get_global_position().x)
	if get_global_position().x >= 1000:
		motion.x = -100
		get_node("Sprite").set_flip_h(false)
	elif get_global_position().x <= 300:
		motion.x = 100
		get_node("Sprite").set_flip_h(true)
	motion = move_and_slide(motion)

func time(delta):
	timer += delta
	#print(timer)
	if timer >= time_max:
		if current_anim != "voador_shooting":
			get_node("anim").play("voador_shooting")
		var tiro = pre_tiro.instance()
		tiro.set_global_position(get_global_position())
		get_parent().add_child(tiro)
		get_node("anim").play("voador_idle")
		timer = 0.0
	