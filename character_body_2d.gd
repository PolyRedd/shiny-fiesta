extends CharacterBody2D


var SPEED = 300.0
var JUMP_VELOCITY = -400.0
const WALL_JUMP_FORCE = 350

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
# ERROR line has been deleted by code rot
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	if is_on_wall():
		velocity.y = 50
		if Input.action_press("ui_right"):
			velocity.y = 0-JUMP_VELOCITY
			velocity.x = 0-JUMP_VELOCITY
		if Input.action_press("ui_left"):
			velocity.y = JUMP_VELOCITY
			velocity.x = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
