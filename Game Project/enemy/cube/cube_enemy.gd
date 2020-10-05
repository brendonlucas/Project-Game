extends Spatial

var ativo
var vida = 10000
var defesa = 10

func _ready():
	pass

func hit_damage(damage):
	if ativo:
		vida -= damage
		print("- " + str(vida))
		if vida <= 0:
			get_tree().get_root().get_node("Map/ST_Tower/escudo/AnimationRemove").play("drop")
			get_parent().get_node(".").queue_free()
