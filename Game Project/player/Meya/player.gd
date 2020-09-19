extends KinematicBody

export var MOVE_SPEED = 2
var acelerecao = 5
var desaceleracao = 10
export var max_terminal_velocity : float = 54
export var jump_power : float = 5
export var force_gravity : float = 0.98

var GRAVITY = 0.98
var y_velocity : float
var velocity = Vector3()



var cam
var player
var animation

# var controles
var parando
var correndo
var caminhando
var moviments_active

var y_velo = 0
const MAX_FALL_SPEED = 40

var cc = 0

# var atekes
var timer_1
var timer_reset_atak
var n_1 = int(0)
var atacks = int(0)
var resetado = true
var ultimo_atake

var atacando
var luz 

var jumped = false
	
func _ready():
	luz = get_parent().get_node("Sol")
	timer_1 = get_node("Timer")
	timer_reset_atak = get_node("Timer fim")
	player = get_node(".")
	animation = get_node("AnimationPlayer")
	player.rotation_degrees.y = 180
	moviments_active = true
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func add_atake():
	atacks += 1
	
func _physics_process(delta):
	#$Armature.translation = translation
	movimentos(delta)
	ataque(delta)
	
	
func ataque(delta):
	if timer_reset_atak.time_left == 0 and !resetado:
			resetado = true
			atacks = 0
			
	if Input.is_action_just_pressed("atacar") and timer_1.time_left == 0 and moviments_active:
		timer_reset_atak.start()
		timer_1.start()
		resetado = false
		if atacks == 0:
			animation.play("attack1", 0.1)
			atacks += 1
			atacando = true
		elif atacks == 1:
			animation.play("attack2", 0.1)
			atacks += 1
			atacando = true
		elif atacks == 2:
			animation.play("attack3", 0.1)
			atacks = 0
			atacando = true
		if atacks == 3:
			atacks = 0
			
	if Input.is_action_just_pressed("ataque_pesado") and moviments_active:
		#animation.play("dying", 0.2)
		animation.play("attack_charge_1", 0.2)
		atacks = 0
		atacando = true

func movimentos(delta):
	cam = get_parent().get_node("target").global_transform
	var dir = Vector3()
	var is_moving = false
	var correndo = false
	caminhando = false
	GRAVITY = 9.8
	MOVE_SPEED = 5
	var grounded = is_on_floor()
	
	if Input.is_action_pressed("frente") and moviments_active and !atacando:
		dir += -cam.basis[2]
		is_moving = true
	if Input.is_action_pressed("tras") and moviments_active and !atacando:
		dir += cam.basis[2]
		is_moving = true
	if Input.is_action_pressed("direita") and moviments_active and !atacando:
		dir += +cam.basis[0]
		is_moving = true
	if Input.is_action_pressed("esquerda") and moviments_active and !atacando:
		dir += -cam.basis[0]
		is_moving = true
	if Input.is_action_pressed("sprint") and moviments_active and is_moving :
		correndo = true
		MOVE_SPEED = 10
		atacando = false
	if Input.is_action_pressed("caminhando") and moviments_active and is_moving :
		caminhando = true
		MOVE_SPEED = 2
		atacando = false
	
	if cc == 0 and !is_moving:
		cc = 0.1
	elif is_moving:
		cc = 0
		
	if is_moving and !correndo and resetado and !caminhando:
		$AnimationPlayer.play("run1", 0.1)
		parando = true
	elif is_moving and !correndo and resetado and caminhando:
		$AnimationPlayer.play("walk",0.1)
	elif !is_moving and !correndo and !atacando and !caminhando:
		animation.play("idle", 0.2)

	elif correndo and resetado and is_moving:
		var ii
		if parando == true:
			ii = 0.1
		elif parando == false:
			ii = 0
		animation.play("run2", ii)
		parando = false
	
	dir.y = 0
	dir = dir.normalized()
	velocity.y += delta * y_velo
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
	y_velo -= GRAVITY
	
	if grounded and y_velo <= 0:
		y_velo = -0.1
	if y_velo < -MAX_FALL_SPEED:
		y_velo = -MAX_FALL_SPEED
		
	if is_moving:
		var angle = atan2(hv.x, hv.z)
		var character_rot = player.get_rotation()
		character_rot.y = angle
		player.set_rotation(character_rot)
	
	
	
	
	
func block_moviments(option):
	if option == true:
		moviments_active = option
	elif option == false:
		moviments_active = option
		
func active_moves_ataque(option):
	if option == true:
		atacando = option
	elif option == false:
		atacando = option
		
	
	
	
func change_ataque(option):
	pass
			
		
