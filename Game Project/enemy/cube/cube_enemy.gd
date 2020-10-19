extends Spatial

var ativo
var vida = 10000
var vida_maxima = 10000
var defesa = 10
var laser = preload("res://enemy/cube/laser.tscn")
var timer_laser

func _ready():
	timer_laser = get_parent().get_parent().get_parent().get_node("Timer_laser")
	
func _process(delta):
	if ativo and timer_laser.time_left == 0:
		instance_laser()
		timer_laser.start()
		
func hit_damage(damage):
	if ativo:
		vida -= damage
		PlayerStatus.energy_generator()
		get_tree().get_root().get_node_or_null("Map/hp_enemy").set_values(vida, vida_maxima)
		if vida <= 0:
			Gamestate.set_checkpoint()
			PlayerStatus.add_exp(1000)
			get_tree().get_root().get_node_or_null("Map/hp_enemy").hide()
			get_tree().get_root().get_node_or_null("Map/hp_enemy/pilar_hp").hide()
			get_tree().get_root().get_node("Map/ST_Tower/escudo/AnimationRemove").play("drop")
			get_tree().get_root().get_node("Map/pilar_enemys/cube_enemy").queue_free()

func instance_laser():
	var clone = laser.instance()
	var scene_root = get_tree().get_root().get_node("Map")
	scene_root.add_child(clone)
	clone.translation = get_tree().get_root().get_node("Map/Player_v4").translation

func reset():
	if vida > 0:
		ativo = false
		vida = 10000
