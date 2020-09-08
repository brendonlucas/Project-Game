extends KinematicBody

var MOVE_SPEED = 2
const GRAVITY = 0.98
const MAX_FALL_SPEED = 30
var y_velo = 0
var velocity = Vector3()
const H_LOOK_SENS = 0.4
const V_LOOK_SENS = 0.2
var aceleracao = 1
const JUMP_FORCE = 15
#nodes
onready var cam = $target/Camera
var lanterna

#cards
export var card_red = false
export var card_blue = false
export var card_green = false
export var card_yellow = false
export var card_black = false
export var card_saida = false

export var active_lanterna = false
export var take_lanterna = false

var animete_player
var active_moves = true

func _ready():
	pass
	#Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	
func mostrar_mouse():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
func ocultar_mouse():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func _input(event):
	if event is InputEventMouseMotion and active_moves:
		cam.rotation_degrees.x -= event.relative.y * V_LOOK_SENS
		cam.rotation_degrees.x = clamp(cam.rotation_degrees.x, -90, 90)
		rotation_degrees.y -= event.relative.x * H_LOOK_SENS
 

func _physics_process(delta):
	var is_moving = false
	MOVE_SPEED = 4
	var just_jumped = false
	var move_vec = Vector3()
	
	#print(cam.rotation)
	if Input.is_action_pressed("frente") and active_moves:
		move_vec.z -= 1
		is_moving = true
	if Input.is_action_pressed("tras") and active_moves:
		move_vec.z += 1
		is_moving = true
	if Input.is_action_pressed("direita") and active_moves:
		move_vec.x += 1
		is_moving = true
	if Input.is_action_pressed("esquerda") and active_moves:
		move_vec.x -= 1
		is_moving = true
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		is_moving = false
		just_jumped = true
		y_velo = JUMP_FORCE
		
			
	var grounded = is_on_floor()
	move_vec = move_vec.normalized()
	move_vec = move_vec.rotated(Vector3(0, 1, 0), rotation.y)
	move_vec *= MOVE_SPEED
	move_vec.y = y_velo
	move_vec = move_and_slide(move_vec, Vector3.UP)
	y_velo -= GRAVITY

	if grounded and y_velo <= 0:
		y_velo = -0.1
	if y_velo < -MAX_FALL_SPEED:
		y_velo = -MAX_FALL_SPEED
	#velocity = velocity.linear_interpolate(move_vec * MOVE_SPEED, aceleracao* delta)
	
func get_card(card):
	if card == "red":
		return card_red
	if card == "green":
		return card_green
	if card == "blue":
		return card_blue
	if card == "yellow":
		return card_yellow
	if card == "black":
		return card_black
	if card == "saida":
		return card_saida
		
func set_pegou_card(card):
	if card == "card_red":
		card_red = true
	elif card == "card_yellow":
		card_yellow = true
	elif card == "card_blue":
		card_blue = true
	elif card == "card_green":
		card_green = true
	elif card == "card_preto":
		card_black = true
	elif card == "computador":
		card_saida = true

func set_lanterna(valor):
	take_lanterna = valor
	
func set_moviments(valor):
	active_moves = valor
	if valor == true:
		ocultar_mouse()
	elif valor == false:
		mostrar_mouse()
		
func play_aimate_end():
	cam.rotation.x = 0
	rotation.y = 3.136576
	translation = Vector3(23, 7.435619, -32)
	animete_player.play("end_animate")
