extends Spatial
const mouse_sensitivity = 0.6
var change_rot_active = false
const V_LOOK_SENS = 0.4
export(float, -90, 0) var min_pitch : float = -70
export(float, 0, 90) var max_pitch : float = 50

var player
onready var cam = $"."

func _ready():
	pass # Replace with function body.
func _input(event):
	var is_moving = false
	
	if Input.is_action_pressed("rotate_cam_hack_left"):
		print("entrou")
		rotation_degrees.y -= event.relative.x * mouse_sensitivity
		$".".rotation_degrees.x -= event.relative.y * mouse_sensitivity
		$".".rotation_degrees.x = clamp($".".rotation_degrees.x, min_pitch, max_pitch)
	
		
	if event is InputEventMouseMotion and !is_moving:
		change_rot_active = true
		$".".rotation_degrees.y -= event.relative.x * mouse_sensitivity
		$".".rotation_degrees.x -= event.relative.y * mouse_sensitivity
		$".".rotation_degrees.x = clamp($".".rotation_degrees.x, min_pitch, max_pitch)

func _process(delta):
	if Input.is_action_pressed("rotate_cam_hack_left"):
		print("entrou")
	player = get_parent().get_node("Player")
	translation = player.translation
	
	
