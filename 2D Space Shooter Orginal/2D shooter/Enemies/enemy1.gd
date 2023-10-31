extends CharacterBody2D

const speed = 20
const max_speed = 40
var random_rotate = randf_range(-0.5, 0.5)
@onready var earth = get_node("../Earth")
const particle = preload("res://Enemies/particle.tscn")

func _physics_process(delta):
	rotate(random_rotate)
	velocity += (earth.position-position).normalized() * speed * delta
	velocity = velocity.limit_length(max_speed)
	move_and_slide()

func _on_area_2d_body_entered(body):
	if (body.is_in_group("Bullet")):
		Global.score += 1
		var particle1 = particle.instantiate()
		var particle2 = particle.instantiate()
		var particle3 = particle.instantiate()
		get_parent().add_child(particle1)
		get_parent().add_child(particle2)
		get_parent().add_child(particle3)
		particle1.position = position
		particle2.position = position
		particle3.position = position
		self.queue_free()

	if (body.is_in_group("Earth")):
		for i in 3:
			var particle1 = particle.instantiate()
			get_parent().add_child(particle1)
			particle1.position = position
		Global.lives -= 1
		self.queue_free()
