extends Node2D

const particlePre = preload("res://Enemies/particle.tscn")
var timer = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.lives = 3
	

func death():
	Global.alive = false
	for i in 3:
		var particle1 = particlePre.instantiate()
		get_parent().add_child(particle1)
		particle1.modulate = Color(randf_range(0.8, 1), randf_range(0.8, 1), randf_range(0.8, 1))
		particle1.position = get_node("../Player").position
	for i in 3:
		var particle2 = particlePre.instantiate()
		get_parent().add_child(particle2)
		particle2.modulate = Color(randf_range(0.8, 1), randf_range(0.8, 1), randf_range(0.8, 1))
		particle2.position = get_node("../Earth").position
		get_node("../Player/Sprite2D").modulate.a = 0
		get_node("../Earth/Sprite2D").modulate.a = 0
	#get_node("../Enemy1/Sprite2D").modulate.a = 0

func _physics_process(delta):
	if (Global.alive == false):
		timer += delta
	match Global.lives:
		3:
			$Life1.set_frame(8)
			$Life2.set_frame(8)
			$Life3.set_frame(8)
		2:
			$Life1.set_frame(8)
			$Life2.set_frame(8)
			$Life3.set_frame(9)
		1:
			$Life1.set_frame(8)
			$Life2.set_frame(9)
			$Life3.set_frame(9)
		0:
			$Life1.set_frame(9)
			$Life2.set_frame(9)
			$Life3.set_frame(9)
			death()

	if (timer > 2):
		Global.lives = -1
	if (timer > 3):
		get_node('../score_keeping').modulate.a = 0
		get_node('../play').modulate.a = 255
		get_node('../last_score').modulate.a = 255
		if(Input.is_action_just_pressed("ui_accept")):
			Global.alive = true
			Global.score = 0
			Global.lives = 3
			get_tree().reload_current_scene()

