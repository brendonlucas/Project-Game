extends Spatial


var vida = 1000
var vida_maxima = 1000
var defesa = 10

var timer_bullet
var gun_refresh
var ativo
var estado_gun
var desativado = false

func _ready():
	timer_bullet = $esfera/gun/Timer
	gun_refresh = $Timer_reload
	
func hit_damage(damage):
	if vida > 0:
		vida -= damage
		get_tree().get_root().get_node("Map/hp_enemy/pilar_hp").set_values()
	
	
func _process(delta):
	if vida <= 0 and !desativado:
		$esfera.hide()
		desativado = true
		get_parent().get_node(".").pilares_destruidos += 1

	if timer_bullet.time_left == 0 and ativo and estado_gun and !desativado:
		$esfera/gun.fire_weapon()
		timer_bullet.start()
		
	if gun_refresh.time_left == 0 and !desativado:
		estado_gun = !estado_gun
		if estado_gun == true:
			gun_refresh.wait_time = 20
		else:
			gun_refresh.wait_time = 7
		gun_refresh.start()

func reset():
	vida = 1000
	desativado = false
	ativo = false
	$esfera.show()
	get_tree().get_root().get_node("Map/hp_enemy/pilar_hp").set_values()
	

