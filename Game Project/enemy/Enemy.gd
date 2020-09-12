extends KinematicBody

export var speed = 100
var space_state
var target

var timer_attack
var target_attack

func _ready():
	
	space_state = get_world().direct_space_state
	timer_attack = get_node("Area_attack/Timer_attack")
	print(space_state)
func _process(delta):
	
	
	if target:
		var result = space_state.intersect_ray(global_transform.origin, target.global_transform.origin)
		if target.is_in_group("Player_v4"):
			var olhar = target.global_transform.origin
			#olhar.y = 1
			#look_at_from_position(translation, olhar, Vector3.UP)
			look_at(olhar, Vector3.UP)
			set_color_red()
			if !target_attack:
				move_to_target(delta)
		else:
			set_color_green()
			
	var velocity = Vector3()
	velocity.y -= 0.98
	rotation_degrees.x = 0
	velocity = move_and_slide(velocity, Vector3(0, 1, 0))
	
	if target_attack and timer_attack.time_left == 0:
		if target_attack.is_in_group("Player_v4"):
			atacar()
			timer_attack.start()

			
func atacar():
	print("atacou e animou ")
	$gun_enemy.fire_weapon()
		
func _on_Area_attack_body_entered(body):
	if body.is_in_group("Player_v4"):
		target_attack = body


func _on_Area_attack_body_exited(body):
	if body.is_in_group("Player_v4"):
		target_attack = null
		print("saiu da area de ataque")

func _on_Area_body_entered(body):
	if body.is_in_group("Player_v4"):
		target = body
		print(body.name + " entered")
		set_color_red()

func _on_Area_body_exited(body):
	if body.is_in_group("Player_v4"):
		target = null
		print(body.name + " exited")
		set_color_green()

func move_to_target(delta):
	var direction = (target.transform.origin - transform.origin).normalized()
	
	move_and_slide(direction * speed * delta, Vector3.UP)
	
func set_color_red():
	$MeshInstance.get_surface_material(0).set_albedo(Color(1, 0, 0))

func set_color_green():
	$MeshInstance.get_surface_material(0).set_albedo(Color(0, 1, 0))


