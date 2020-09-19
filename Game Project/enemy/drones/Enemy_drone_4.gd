extends KinematicBody
var life = 15000
var morreu = false
func _ready():
	pass
	
func _process(delta):
	if life <= 0 and !morreu:
		morreu = true
		get_parent().get_parent().get_node("Controler_map1").set_enemys_kill()
		get_parent().get_node("AnimationPlayer").play("kill")
		
func hit_damage(BULLET_DAMAGE):
	life -= BULLET_DAMAGE
	print("dano", life)

func remove():
	queue_free()
