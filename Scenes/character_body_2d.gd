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
		velocity.y = JUMP_VELOCITY * 1.7
	if is_on_ceiling():
		velocity.y = -JUMP_VELOCITY
	if velocity.y > JUMP_VELOCITY and is_on_floor() :
		velocity.y *= -1
		
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	if is_on_wall():
		X *= -1
	
	if Input.is_action_just_pressed("ui_accept") and not is_on_floor() and is_on_wall():
	
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
			
	get_child(0).rotation += X * delta * 0.011
	position.x += X * delta
	move_and_slide()
	#this movement took me 3 hours


func _on_area_2d_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://Scenes/Level2.tscn")
