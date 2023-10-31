extends CharacterBody2D

@export var speed : float = 200.0
@export var jump_valocity : float = -200.0
@export var double_jump_valocity : float = -150.0


@onready var animation_sprite : AnimatedSprite2D = $AnimatedSprite2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var has_double_jumped : bool = false
var animation_locked : bool = false
var direction : Vector2 = Vector2.ZERO
var was_in_air : bool = false

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		was_in_air = true
	else:
		has_double_jumped = false
		if was_in_air == true:
			land()
			
		was_in_air = false
	
	# Handle Jump.
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			jump()
		elif not has_double_jumped:
			double_jump()
			
		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_vector("left", "right","up","down")
	
	if direction.x != 0 && animation_sprite.animation != "Jump_end":
		velocity.x = direction.x * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	
	move_and_slide()
	update_animation()
	update_facing_direction()
	
func update_animation():
	if not animation_locked:
		if not is_on_floor():
			animation_sprite.play("Jump_loop")
		else:
			if direction.x != 0:
				animation_sprite.play("run")
			else:
				animation_sprite.play("Idle")

func update_facing_direction():
	if direction.x > 0:
		animation_sprite.flip_h = false
	elif direction.x < 0:
		animation_sprite.flip_h = true
		
func jump():
	velocity.y = jump_valocity
	animation_sprite.play("Jump_start")
	animation_locked = true
	
func double_jump():
	velocity.y = double_jump_valocity
	animation_sprite.play("Jump_double")
	animation_locked = true
	has_double_jumped = true

func land():
	animation_sprite.play("Jump_end")
	animation_locked = true
	
func _on_animated_sprite_2d_animation_finished():
	if(["Jump_start","Jump_end","Jump_double"].has(animation_sprite.animation)):
		animation_locked = false
