extends CharacterBody2D

const bulletPreload = preload('res://Player/bullet.tscn')
const jetPreload = preload('res://Player/jet.tscn')

const max_speed = 80
const accel = 150
const friction = 75
const rotation_speed = 0.08
#const rotation_speed = 0.2

#var velocity = Vector2.ZERO
var input = Vector2.ZERO
var time = 0

func _ready():
	$Sprite2D.modulate.a = 255
	get_node('../Earth/Sprite2D').modulate.a = 255

func movement(delta):
	input.x = int(Input.is_action_pressed("ui_right"))
	input.x -= int(Input.is_action_pressed("ui_left"))
	
	input.y = int(Input.is_action_pressed("ui_down"))
	input.y -= int(Input.is_action_pressed("ui_up"))
	
	input = input.normalized()
	if (input.length() == 0):
		if (velocity.length() > (friction * delta)):
			velocity -= velocity.normalized() * friction * delta
		else:
			velocity = Vector2.ZERO
	else:
		velocity += (input * accel * delta)

func rotating(delta):
	var angle = -transform.y.angle_to(input)
	#if (Input.is_action_pressed("ui_down")):
	#	rotation += 3 * delta
	rotate(sign(angle) * min(delta * rotation_speed * velocity.length(), abs(angle) * velocity.length()))
	
	#if (int(delta) % 100 == 0):
	#	print(input)

func teleport():
	if (position.x < -5):
		position.x = 325
	if (position.x > 325):
		position.x = -5

	if (position.y < -5):
		position.y = 186
	if (position.y > 186):
		position.y = -5

func shooting():
	var bullet = bulletPreload.instantiate()
	get_parent().add_child(bullet) 
	bullet.position = position
	#bullet.position += 12 * Vector2(sin(rotation_degrees/180 * 3.14), -cos(rotation_degrees/180 * 3.14))
	bullet.position += 12 * Vector2(sin(rotation), -cos(rotation))
	
	velocity -= 12 * Vector2(sin(rotation), -cos(rotation))

func shoot_jet():
	var jet = jetPreload.instantiate()
	get_parent().add_child(jet)
	jet.position = position - (velocity.normalized() * 5 )

func _physics_process(delta):
	if (Global.alive):
		rotating(delta)
		movement(delta)
		teleport()
		time += delta * 4
		if (Input.is_action_just_pressed("ui_accept") or (Input.is_action_pressed("ui_accept") && time > 0.8)):
			shooting()
			time = 0
		if (Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_down") or Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right")):
			shoot_jet()
		velocity = velocity.limit_length(max_speed)
		move_and_slide()


