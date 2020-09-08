extends KinematicBody

export var speed : float = 15
export var acceleration : float = 15
export var air_acceleration : float = 5
export var gravity : float = 0.98
export var max_terminal_velocity : float = 54
export var jump_power : float = 20

export(float, 0.1, 1) var mouse_sensitivity : float = 0.3
export(float, -90, 0) var min_pitch : float = -90
export(float, 0, 90) var max_pitch : float = 90

var velocity : Vector3
var y_velocity : float

onready var camera_pivot = get_parent().get_node("target")
onready var camera = get_parent().get_node("target/CameraBoom/Camera")

var change_rot_active = false

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

		
func _input(event):
	var is_moving = false
	
	if Input.is_action_pressed("frente"):
		is_moving = true
		
	if Input.is_action_pressed("tras"):
		is_moving = true
		
	if Input.is_action_pressed("esquerda"):
		is_moving = true
	
	if Input.is_action_pressed("direita"):
		is_moving = true
	
	if change_rot_active and is_moving:
			print("resetou")
			rotation_degrees.y = camera_pivot.rotation_degrees.y
			
			change_rot_active = false
			
	if event is InputEventMouseMotion and is_moving:
		rotation_degrees.y -= event.relative.x * mouse_sensitivity
		
		
	if event is InputEventMouseMotion and !is_moving:
		change_rot_active = true
	
		
		
func _physics_process(delta):
	handle_movement(delta)
	
func handle_movement(delta):
	var direction = Vector3()
	
	if Input.is_action_pressed("frente"):
		direction -= transform.basis.z
	
	if Input.is_action_pressed("tras"):
		direction += transform.basis.z
		
	if Input.is_action_pressed("esquerda"):
		direction -= transform.basis.x
	
	if Input.is_action_pressed("direita"):
		direction += transform.basis.x
	
	direction = direction.normalized()
	
	var accel = acceleration if is_on_floor() else air_acceleration
	velocity = velocity.linear_interpolate(direction * speed, accel * delta)
	
	if is_on_floor():
		y_velocity = -0.001
	else:
		y_velocity = clamp(y_velocity - gravity, -max_terminal_velocity, max_terminal_velocity)
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		y_velocity = jump_power
	
	velocity.y = y_velocity
	velocity = move_and_slide(velocity, Vector3.UP)
