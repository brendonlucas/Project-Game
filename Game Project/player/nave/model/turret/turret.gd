extends Camera

const H_LOOK_SENS = 0.4
const V_LOOK_SENS = 0.2
var timer_gun_bullet
var audio
# Called when the node enters the scene tree for the first time.
func _ready():
	audio = get_node("turret/sonds_fire")
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	timer_gun_bullet = get_node("turret/gun_turret/Timer")
	pass # Replace with function body.
	
func _input(event):
	if event is InputEventMouseMotion:
		rotation_degrees.x -= event.relative.y * V_LOOK_SENS
		rotation_degrees.x = clamp(rotation_degrees.x, -20, 90)
		rotation_degrees.y -= event.relative.x * H_LOOK_SENS
		
func _process(delta):
	var atirando = false
	if Input.is_action_pressed("atacar"):
		atirando = true
	if atirando and !audio.playing:
		audio.play()
	if Input.is_action_pressed("atacar") and timer_gun_bullet.time_left == 0:
		$turret/gun_turret.fire_weapon()
		$turret/AnimationPlayer.play("fire")
		timer_gun_bullet.start()
		#atirando = true
	elif $turret/sonds_fire.playing and !Input.is_action_pressed("atacar"):
		$turret/sonds_fire.stop()
		pass
		
	
