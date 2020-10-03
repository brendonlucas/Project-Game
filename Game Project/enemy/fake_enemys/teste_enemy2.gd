extends StaticBody

var vida = 10000
var defesa = 30

func _ready():
	pass

func hit_damage(damage):
	vida -= damage
	print(vida)
	if vida <= 0:
		kill()

func kill():
	get_tree().get_root().get_node("Map/ST_Tower2/escudo/AnimationRemove").play("drop")
	
	queue_free()
