extends KinematicBody

export var speed = 1.5

var space_state
var target

var timer_attack
var target_attack
var animation

var life = 8000
var life_maxima = 8000
var defesa = 50
var dano_arma = 70
var dano_base = 170

var active_moves = true
var target_movel = true



func block_moviments(option):
	if option == true:
		active_moves = option
	elif option == false:
		active_moves = option
		$AnimationPlayer.play("hack")
		
var finalizou = false
func hit_damage(damage):
	life -= damage
	get_tree().get_root().get_node("Map/hp_enemy").set_values(life, life_maxima)
	if life <= 2000 and !finalizou:
		get_tree().get_root().get_node("Map/Animation_hack").active_animate()
		finalizou = true
		
func _ready():
	animation = $AnimationPlayer.current_animation
	space_state = get_world().direct_space_state
	timer_attack = get_node("Area_attack/Timer_attack")
	print(space_state)
	
func _process(delta):
	
#	if Input.is_action_just_pressed("lanterna"):
#		hit_damage(20000)
		
	if target_attack and timer_attack.time_left == 0 and active_moves :
		if target_attack.is_in_group("Player_v4"):
			atacar()
			timer_attack.start()
			
	if active_moves and target and $AnimationPlayer.current_animation != "attack1" and $AnimationPlayer.current_animation != "attack2":
		var result = space_state.intersect_ray(global_transform.origin, target.global_transform.origin)
		if target.is_in_group("Player_v4"):
			var olhar = target.global_transform.origin
			look_at(olhar, Vector3.UP)
			if !target_attack:
				move_to_target(delta)
				$AnimationPlayer.play("walk")
				
		elif target.name == "Position_nija_saida":
			move_to_target(delta)
			$AnimationPlayer.play("walk")
			
	elif !target and active_moves:
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
	if body.is_in_group("Player_v4") and target_movel:
		target_attack = body


func _on_Area_attack_body_exited(body):
	if body.is_in_group("Player_v4") and target_movel:
		target_attack = null
		#print("saiu da area de ataque")

func move_to_target(delta):
	var direction = (target.transform.origin - transform.origin).normalized()
	move_and_slide(direction * speed, Vector3.UP)

func set_pos_target(alvo):
	target = alvo
	target_movel = false
	
func _on_Area_target_body_entered(body):
	if body.is_in_group("Player_v4") and target_movel:
		target = body
		Gamestate.set_music_battle("res://audio/bg_battle_2.ogg")
		get_tree().get_root().get_node("Map/hp_enemy").set_values(life, life_maxima)
		get_tree().get_root().get_node("Map/hp_enemy").show()
		#print(body.name + " entered")

func _on_Area_target_body_exited(body):
	if body.is_in_group("Player_v4") and target_movel:
		target = null
		get_tree().get_root().get_node("Map/hp_enemy").hide()
		#print(body.name + " exited")
#res://audio/bg_battle_2.ogg
#res://audio/bg_base.ogg
func randomNumber():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var my_random_number = rng.randi_range(1, 2)
	return my_random_number

func reset():
	life = 8000
	translation = get_parent().get_node("spawn_nija").translation
