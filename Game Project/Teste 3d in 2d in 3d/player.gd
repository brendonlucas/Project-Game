extends KinematicBody

export var MOVE_SPEED = 10
var acelerecao = 3
var desaceleracao = 9

#const GRAVITY = -9.8
var velocity = Vector3()

const H_LOOK_SENS = 0.6
const V_LOOK_SENS = 0.4

var cam
var player


# var controles
var parando
var correndo = false

func _ready():
	player = get_node(".")
	rotation_degrees.y = -180

	#Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	if Input.is_action_pressed("rotate_cam_hack_left"):
		pass
	if Input.is_action_pressed("rotate_cam_hack_right"):
		pass
func _physics_process(delta):
	#cam = get_node("Camera").global_transform
	var dir = Vector3()
	var is_moving = false
	parando = false
	
	if Input.is_action_pressed("frente"):
		dir.z -= 1
		is_moving = true
		
	if Input.is_action_pressed("tras"):
		dir.z += 1
		is_moving = true
		
	if Input.is_action_pressed("direita") :
		dir.x -= 1
		is_moving = true
		
	if Input.is_action_pressed("esquerda"):
		dir.x += 1
		is_moving = true

	dir.y = 0
	dir = dir.normalized()
	
	#velocity.y += delta * GRAVITY
	var hv = velocity
	hv.y = 0
	
	var new_pos = dir * MOVE_SPEED
	var accel = desaceleracao
	
	if (dir.dot(hv) > 0):
		accel = acelerecao
		
	hv = hv.linear_interpolate(new_pos, accel * delta)
	
	velocity.x = hv.x
	velocity.z = hv.z
	
	velocity = move_and_slide(velocity, Vector3(0, 1, 0))

	if is_moving:
		correndo = true
		var angle = atan2(hv.x, hv.z)
		var character_rot = player.get_rotation()
		character_rot.y = angle
		player.set_rotation(character_rot)
	if !is_moving and correndo:
		correndo = false
		
	

func dd(delta):
	cam = get_node("target/Camera").global_transform
	var dir = Vector3()
	var is_moving = false
	
	if Input.is_action_pressed("frente"):
		dir += -cam.basis[2]
		is_moving = true
		
	if Input.is_action_pressed("tras"):
		dir += cam.basis[2]
		is_moving = true
		
	if Input.is_action_pressed("direita") :
		dir += cam.basis[0]
		is_moving = true
		
	if Input.is_action_pressed("esquerda"):
		dir += -cam.basis[0]
		is_moving = true

	dir.y = 0
	dir = dir.normalized()
	
	#velocity.y += delta * GRAVITY
	var hv = velocity
	hv.y = 0
	
	var new_pos = dir * MOVE_SPEED
	var accel = desaceleracao
	
	if (dir.dot(hv) > 0):
		accel = acelerecao
		
	hv = hv.linear_interpolate(new_pos, accel * delta)
	
	velocity.x = hv.x
	velocity.z = hv.z
	
	velocity = move_and_slide(velocity, Vector3(0, 1, 0))

	if is_moving:
		var angle = atan2(hv.x, hv.z)
		var character_rot = player.get_rotation()
		character_rot.y = angle
		player.set_rotation(character_rot)
