extends CharacterBody2D

var X = 0
var SPEED = 300.0
var JUMP_VELOCITY = -400.0
const WALL_JUMP_FORCE = 350

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	if is_on_floor():
		velocity.y = JUMP_VELOCITY
	if is_on_floor() and Input.is_action_pressed("ui_accept"):
		velocity.y = JUMP_VELOCITY * 2
	if is_on_ceiling():
		velocity.y = -JUMP_VELOCITY
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	if is_on_wall():
		X * (-1)
	
	if Input.is_action_just_pressed("ui_accept") and not is_on_floor() and is_on_wall():
		var X = 0
		var wall_normal = get_wall_normal()
		velocity.y = JUMP_VELOCITY
		velocity.x = wall_normal.x * WALL_JUMP_FORCE
	
	if Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right"):
		if Input.is_action_pressed("ui_left"):
			X -= 10
		if Input.is_action_pressed("ui_right"):
			X += 10
		if X < -400:
			X = -400
		elif X > 400:
			X = 400
	else:
		if X < 0 :
			X += 5
		elif X > 0 :
			X -= 5
		
			
	position.x += X * delta
	move_and_slide()
	#this movement took me 3 hours
