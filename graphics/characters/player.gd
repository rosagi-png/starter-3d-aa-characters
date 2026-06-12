extends Character

func _physics_process(delta: float) -> void:
	move_logic(delta)
	move_and_slide()
	
@export var acceleration: float = 8
@export var deceleration: float = 4

func move_logic(delta):
	movement_input = Input.get_vector("move_left", "move_right", "move_forward", "move
	_backward")
	var vel_2d = Vector2(velocity.x, velocity.z)

	if movement_input != Vector2.ZERO:
		vel_2d += movement_input * base_speed * delta * acceleration
		vel_2d = vel_2d.limit_length(base_speed)
		velocity.x = vel_2d.x
		velocity.z = vel_2d.y
	else:
		vel_2d = vel_2d.move_toward(Vector2.ZERO, base_speed * delta * deceleration)
		velocity.x = vel_2d.x
		velocity.z = vel_2d.y
