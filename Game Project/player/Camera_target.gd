extends Spatial

var player
var change_rot_active = false

export(float, -90, 0) var min_pitch : float = -70
export(float, 0, 90) var max_pitch : float = 50


#variaveis de controle
var cam_active = true

func _ready():
	pass
	
func _input(event):
	var is_moving = false
	var mouse_sensitivity = Gamestate.camera_sensibilidade
	
	if Input.is_action_pressed("frente") and cam_active:
		is_moving = true
		
	if Input.is_action_pressed("tras") and cam_active:
		is_moving = true
		
	if Input.is_action_pressed("esquerda") and cam_active:
		is_moving = true
	
	if Input.is_action_pressed("direita") and cam_active:
		is_moving = true
	
	if Input.is_action_pressed("zoom_in") and cam_active:
		print(mouse_sensitivity)
		var anterior = $CameraBoom.get_length()
		if anterior >= 1:
			var novo = anterior - 0.1
			$CameraBoom.set_length(novo)
		
	if Input.is_action_pressed("zoom_out") and cam_active:
		var anterior = $CameraBoom.get_length()
		if anterior <= 7:
			var novo = anterior + 0.1
			$CameraBoom.set_length(novo)
		
	if event is InputEventMouseMotion and is_moving and cam_active:
		rotation_degrees.y -= event.relative.x * mouse_sensitivity
		$".".rotation_degrees.x -= event.relative.y * mouse_sensitivity
		$".".rotation_degrees.x = clamp($".".rotation_degrees.x, min_pitch, max_pitch)
	
		
	if event is InputEventMouseMotion and !is_moving and cam_active:
		change_rot_active = true
		$".".rotation_degrees.y -= event.relative.x * mouse_sensitivity
		$".".rotation_degrees.x -= event.relative.y * mouse_sensitivity
		$".".rotation_degrees.x = clamp($".".rotation_degrees.x, min_pitch, max_pitch)
	
	
func _process(delta):
	#player4 = get_tree().root.get_node("map_teste/Player_v4")
	#translation = player4.translation
	#player = get_tree().root.get_node("map_teste/Player_v4")
	player = get_tree().root.get_node("Map/Player_v4")
	translation = player.translation
	translation.y = player.translation.y + 1.8

	
	
	


func block_cam(option):
	if option == true:
		cam_active = option
	elif option == false:
		cam_active = option
