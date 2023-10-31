extends Sprite2D

var timer = 0
var speed = randf_range(20, 30)
var r1 = randf_range(-1, 1)
var r2 = randf_range(0.5, 1.5)
var r3 = randf_range(0, 1)
var r4 = randf_range(0, 1)
var r5 = randf_range(0, 1)
@onready var player = get_node("../Player")
@onready var direction = player.velocity.normalized() + Vector2(randf_range(-1, 1), randf_range(-1, 1))
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	rotate(r1 * delta)
	position -= direction * speed * delta
	
	modulate.a -= r2 * delta
	modulate.r -= 0.4 * delta
	modulate.g -= 0.2 * delta
	modulate.b -= 0.7 * delta
	
	timer += delta
	if (timer > 5):
		timer = 0
		self.queue_free()
