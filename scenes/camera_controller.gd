extends SpringArm3D
#camera ranges
@export var min_limit_x: float = -0.8
@export var max_limit_x: float = -0.2
@export var horizontal_acceleration: float = 2
@export var vertical_acceleration: float = 1
@export var mouse_acceleration: float = 0.005

#input vector from player controller -input map
#func _process(delta: float) -> void:
#	var joy_dir = Input.get_vector("pan_left", "pan_right", "pan_up", "pan_down")
#	var joy_dir_accelerated = joy_dir * delta * Vector2(horizontal_acceleration, vertical_acceleration)
#	rotate_from_vector(joy_dir_accelerated)

#prevents mouse capture beyond window
func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		var mouse_dir_accelerated = event.relative * mouse_acceleration
		rotate_from_vector(mouse_dir_accelerated)
		#if ESC is pressed, then quit
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()

func rotate_from_vector(v: Vector2): 
	if v.length() == 0 : return
	rotation.y -= v.x #only rotates side/side?
	rotation.x -= v.y #adds vertical pan/rotate?
	rotation.x = clamp(rotation.x, min_limit_x, max_limit_x)
