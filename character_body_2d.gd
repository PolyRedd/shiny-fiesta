extends CharacterBody2D


var SPEED = 300.0
var JUMP_VELOCITY = -400.0
const WALL_JUMP_FORCE = 350

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		if is_on_wall():
			velocity += get_gravity() * delta * 0.1
		else: 
			velocity += get_gravity() * delta
		
		if is_on_wall() and Input
# ERROR line has been deleted by code rot
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	if Input.is_action_just_pressed("ui_accept") and not is_on_floor() and is_on_wall():
		var wall_normal = get_wall_normal()
		velocity.y = JUMP_VELOCITY
		velocity.x = wall_normal.x * WALL_JUMP_FORCE

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	
