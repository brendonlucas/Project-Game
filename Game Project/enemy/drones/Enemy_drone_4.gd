extends KinematicBody
var life = 100000
var morreu = false

var exp_value = 400
 
var ativo
var timer
var timer_gun_refresh

var estado_gun = true

func _ready():
	timer = $gun/Timer
	timer_gun_refresh = $Timer_entre_disparos
	
func _process(delta):
	if life <= 0 and !morreu:
		PlayerStatus.add_exp(exp_value)
		ativo = false
		morreu = true
		get_parent().get_parent().get_node("Controler_map1").set_enemys_kill()
		get_parent().get_node("AnimationPlayer").play("kill")
		
	if timer.time_left == 0 and ativo and estado_gun:
		ataque()
		timer.start()
	if timer_gun_refresh.time_left == 0:
		estado_gun = !estado_gun
		if estado_gun == true:
			timer_gun_refresh.wait_time = 20
		else:
			timer_gun_refresh.wait_time = 5
		timer_gun_refresh.start()
		
func hit_damage(BULLET_DAMAGE):
	life -= BULLET_DAMAGE
	print("dano", life)

func remove():
	queue_free()
	
func ataque():
	$gun.fire_weapon()
	$gun2.fire_weapon()
	$gun3.fire_weapon()
	$gun4.fire_weapon()
	$gun5.fire_weapon()
	$gun6.fire_weapon()

	
func set_active():
	ativo = true
