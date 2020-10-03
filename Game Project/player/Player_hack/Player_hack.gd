extends KinematicBody

var life = 3

var MOVE_SPEED = 20
var acelerecao = 3
var desaceleracao = 9
var velocity = Vector3()

var cam
var player
var timer_bullet

# var controles
var parando
var correndo = false

onready var cursor = $Cursor
var ray_origin = Vector3()
var ray_target = Vector3()

func _ready():
	player = get_node(".")
	#rotation_degrees.y = -180
	timer_bullet = get_node("gun/Timer")
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

		
func look_at_cursor():
	var camera = get_parent().get_node("target/Camera")
	var player_pos = translation
	var drop_plane = Plane(Vector3(0,1,0), player_pos.y)
	
	var ray_length = 10000
	
	var mouse_pos = get_parent().get_viewport().get_mouse_position()
	var from = camera.project_ray_origin(mouse_pos)
	var to = from + camera.project_ray_normal(mouse_pos) * ray_length
	var cursor_pos = drop_plane.intersects_ray(from, to)
	cursor.global_transform.origin = cursor_pos + Vector3(0,0,0)
	look_at(cursor_pos, Vector3.UP)
	
	

func _physics_process(delta):
	if life <= 0:
		pass
		#queue_free()
		
	look_at_cursor()
	cam = get_parent().get_node("target").global_transform
	var dir = Vector3()
	var is_moving = false
	
	if Input.is_action_pressed("frente"):
		dir.z += 1
		is_moving = true
		
	if Input.is_action_pressed("tras"):
		dir.z -= 1
		is_moving = true
		
	if Input.is_action_pressed("direita") :
		dir.x -= 1
		is_moving = true
		
	if Input.is_action_pressed("esquerda"):
		dir.x += 1
		is_moving = true
		
	if Input.is_action_pressed("sprint") and timer_bullet.time_left == 0:
		$gun.fire_weapon()
		timer_bullet.start()
		
	dir.y = 0
	dir = dir.normalized()
	var hv = velocity
	hv.y = 0
	var new_pos = dir * MOVE_SPEED
	var accel = desaceleracao
	if (dir.dot(hv) > 0):
		accel = acelerecao
	hv = hv.linear_interpolate(new_pos, accel * delta)
	velocity.x = hv.x
	velocity.z = hv.z
	velocity.y -= 1
	velocity = move_and_slide(velocity, Vector3.UP)

func hit_damage(damage):
	life -= 1
