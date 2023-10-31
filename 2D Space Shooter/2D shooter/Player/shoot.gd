extends  CharacterBody2D

const speed = 200
var timer = 0
# Called when the node enters the scene tree for the first time.
@onready var player = get_node("../Player")
#@onready var direction = Vector2(sin(player.rotation_degrees/180 * 3.14), -cos(player.rotation_degrees/180 * 3.14))
@onready var direction = Vector2(sin(player.rotation), -cos(player.rotation))
	

func shoot(delta):
	#var collide = move_and_collide(direction * speed * delta)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	shoot(delta)
	timer += delta
	if (timer > 3):
		self.queue_free()
	
	velocity = direction * speed
	move_and_slide()
	pass
