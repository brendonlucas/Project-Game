extends KinematicBody

export var speed = 1.5

var space_state
var target

var timer_attack
var target_attack
var animation
var life = 1000

func hit_damage(damage):
	life -= damage
	
func _ready():
	animation = $AnimationPlayer.current_animation
	space_state = get_world().direct_space_state
	timer_attack = get_node("Area_attack/Timer_attack")
	print(space_state)
	
func _process(delta):
	if target_attack and timer_attack.time_left == 0:
		if target_attack.is_in_group("Player_v4"):
			atacar()
			timer_attack.start()
	
			
	if target and $AnimationPlayer.current_animation != "attack1" and $AnimationPlayer.current_animation != "attack2":
		var result = space_state.intersect_ray(global_transform.origin, target.global_transform.origin)
		if target.is_in_group("Player_v4"):
			var olhar = target.global_transform.origin
			look_at(olhar, Vector3.UP)
			if !target_attack:
				move_to_target(delta)
				$AnimationPlayer.play("walk")
			
	elif !target:
		$AnimationPlayer.play("idle", 0.2)
			
	var velocity = Vector3()
	velocity.y -= 0.98
	rotation_degrees.x = 0
	velocity = move_and_slide(velocity, Vector3(0, 1, 0))
	
			
func atacar():
	var nun_attack = randomNumber()
	if nun_attack == 1:
		$AnimationPlayer.play("attack1")
	elif nun_attack == 2:
		$AnimationPlayer.play("attack2")
		
func _on_Area_attack_body_entered(body):
	if body.is_in_group("Player_v4"):
		target_attack = body


func _on_Area_attack_body_exited(body):
	if body.is_in_group("Player_v4"):
		target_attack = null
		#print("saiu da area de ataque")

func move_to_target(delta):
	var direction = (target.transform.origin - transform.origin).normalized()
	move_and_slide(direction * speed, Vector3.UP)
	

func _on_Area_target_body_entered(body):
	if body.is_in_group("Player_v4"):
		target = body
		#print(body.name + " entered")

func _on_Area_target_body_exited(body):
	if body.is_in_group("Player_v4"):
		target = null
		#print(body.name + " exited")

func randomNumber():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var my_random_number = rng.randi_range(1, 2)
	return my_random_number

