extends KinematicBody

var MOVE_SPEED = 50
var acelerecao = 3
var desaceleracao = 9
var velocity = Vector3()

func _ready():
	pass

func _physics_process(delta):
	#cam = get_node("Camera").global_transform
	var dir = Vector3()
	var is_moving = false
	dir = dir.normalized()
	var hv = velocity
	var new_pos = dir * MOVE_SPEED
	var accel = desaceleracao
	if (dir.dot(hv) > 0):
		accel = acelerecao
	hv = hv.linear_interpolate(new_pos, accel * delta)
	#velocity.z = -50
	velocity = move_and_slide(velocity, Vector3(0, 1, 0))


