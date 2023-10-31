extends Sprite2D

var time = 0
var speed = randf_range(15, 25)
var r = randf_range(1, -1)
@onready var earth = get_node("../Earth")
@onready var direction = (earth.position-position).normalized() + Vector2(randf_range(-3, 3), randf_range(-3, 3))
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position -= direction * speed * delta
	time += delta 
	rotate(r * delta)
	modulate.a -= randf_range(0, 1) * delta
	modulate.r -= randf_range(0, 1) * delta
	modulate.g -= randf_range(0, 1) * delta
	modulate.b -= randf_range(0, 1) * delta
	if (time > 4):
		time = 0
		self.queue_free()
	pass
 
