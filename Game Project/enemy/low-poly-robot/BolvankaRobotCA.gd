extends KinematicBody

export var speed = 1.5

var space_state
var target
var caido = false
var desabilitado = false

var destruido = false

var timer_attack
var target_attack

var vida = 5000
var defesa = 70

func _ready():
	space_state = get_world().direct_space_state
	timer_attack = $guns/Timer_recarga
	
func hit_damage(damage):
	if vida > 0 and PlayerStatus.vida_atual > 0:
		print(vida)
		vida -= damage
		if vida <= 0:
			get_tree().get_root().get_node("Map/Controler_map").kill_sentinela()
			$AnimationPlayer.play("kill")
			$Timer_caido.start()
			caido = true
			destruido = true
			PlayerStatus.add_exp(2000)
			Gamestate.set_checkpoint()
	
	
func _process(delta):
	if Input.is_action_just_pressed("lanterna"):
		hit_damage(20000)
	if target_attack and timer_attack.time_left == 0 and !caido:
		if target_attack.is_in_group("Player_v4"):
			$AnimationPlayer.play("Bolvanka|Shoot")
			timer_attack.start()
			
	if target and $AnimationPlayer.current_animation != "Bolvanka|Shoot" and !caido:
		var result = space_state.intersect_ray(global_transform.origin, target.global_transform.origin)
		if target.is_in_group("Player_v4"):
			var olhar = target.global_transform.origin
			look_at(olhar, Vector3.UP)
			self.rotate_object_local(Vector3(0,1,0), 3.14)
			if !target_attack or target_attack and timer_attack.time_left != 0:
				move_to_target(delta)
				$AnimationPlayer.play("Bolvanka|Walk")
			
	elif !target:
		$AnimationPlayer.play("Bolvanka|Idle.001", 0.2)
	
	if vida <= 500 and !caido and !desabilitado:
		caido()
		desabilitado = true
		
	if $Timer_caido.time_left == 0 and caido and desabilitado:
		caido = false
	
	var velocity = Vector3()
	velocity.y -= 1
	rotation_degrees.x = 0
	velocity = move_and_slide(velocity, Vector3(0, 1, 0))
	
func caido():
	$AnimationPlayer.play("Bolvanka|Fall")
	$Timer_caido.start()
	caido = true
	
func _on_Area_target_body_entered(body):
	if body.is_in_group("Player_v4"):
		target = body
		Gamestate.set_music_battle()
		#print(body.name + " entered")


func _on_Area_target_body_exited(body):
	if body.is_in_group("Player_v4"):
		target = null
		Gamestate.set_music_map()
		#print(body.name + " exited")

func move_to_target(delta):
	var direction = (target.transform.origin - transform.origin).normalized()
	move_and_slide(direction * speed, Vector3.UP)
	

func shot_bullets():
	$guns/gun.fire_weapon()
	$guns/gun2.fire_weapon()
	
func get_target_local():
	$guns/gun.set_target(target.translation)
	$guns/gun2.set_target(target.translation)
	
	
func _on_target_attack_body_entered(body):
	if body.is_in_group("Player_v4"):
		target_attack = body


func _on_target_attack_body_exited(body):
	if body.is_in_group("Player_v4"):
		target_attack = null

func reset():
	if vida > 0:
		translation = get_parent().get_node("spawn_sentinela").translation
		vida = 5000
		caido = false
		desabilitado = false
		destruido = false

