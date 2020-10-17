extends Spatial

var ativo
var vida = 10000
var vida_maxima = 10000
var defesa = 10

func _ready():
	pass

func hit_damage(damage):
	if ativo:
		vida -= damage
		get_tree().get_root().get_node_or_null("Map/hp_enemy").set_values(vida, vida_maxima)
		if vida <= 0:
			Gamestate.set_checkpoint()
			PlayerStatus.add_exp(1000)
			get_tree().get_root().get_node_or_null("Map/hp_enemy").hide()
			get_tree().get_root().get_node_or_null("Map/hp_enemy/pilar_hp").hide()
			get_tree().get_root().get_node("Map/ST_Tower/escudo/AnimationRemove").play("drop")
			get_tree().get_root().get_node("Map/pilar_enemys/cube_enemy").queue_free()
			
func reset():
	if vida > 0:
		vida = 10000
