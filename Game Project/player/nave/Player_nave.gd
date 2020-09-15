extends KinematicBody

var MOVE_SPEED = 50
var acelerecao = 3
var desaceleracao = 9
var velocity = Vector3()
var cam
var player

var play_som_jet = true

# var controles
var parando
var correndo = false
onready var weapon_gun = get_parent().get_node("Player_nave/gun_1")
var timer_gun_bullet

var ativado = false


func _ready():
	player = get_node(".")
	timer_gun_bullet = get_node("gun_1/Timer")
	
	#rotation_degrees.y = -180
	#Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func ativar_moves(option):
	if option == true:
		ativado = true
	elif option == false:
		ativado = false
		
func _physics_process(delta):
	#cam = get_node("Camera").global_transform
	var dir = Vector3()
	var is_moving = false
	parando = false
	rotation_degrees.z = 0
	
	if play_som_jet and !$jet_audio.playing and ativado:
		$jet_audio.play()
		
	if Input.is_action_pressed("frente") and ativado :
		dir.y += 1
		is_moving = true
		
	if Input.is_action_pressed("tras") and ativado:
		dir.y -= 1
		is_moving = true
		
	if Input.is_action_pressed("direita") and ativado:
		dir.x += 1
		is_moving = true
		rotation_degrees.z = -20
		
	if Input.is_action_pressed("esquerda")  and ativado:
		dir.x -= 1
		is_moving = true
		rotation_degrees.z = 20
		
	if Input.is_action_pressed("atacar") and timer_gun_bullet.time_left == 0:
		timer_gun_bullet.start()
		weapon_gun.fire_weapon()
		$gun_2.fire_weapon()
		
	
		
	dir = dir.normalized()
	var hv = velocity
	var new_pos = dir * MOVE_SPEED
	var accel = desaceleracao
	if (dir.dot(hv) > 0):
		accel = acelerecao
	hv = hv.linear_interpolate(new_pos, accel * delta)
	velocity.y = hv.y
	velocity.x = hv.x
	#velocity.z = -50
	velocity = move_and_slide(velocity, Vector3(0, 1, 0))



