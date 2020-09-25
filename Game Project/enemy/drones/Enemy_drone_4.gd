extends KinematicBody
var life = 15000
var morreu = false

var ativo
var timer
func _ready():
	timer = $gun/Timer
	
func _process(delta):
	if life <= 0 and !morreu:
		morreu = true
		get_parent().get_parent().get_node("Controler_map1").set_enemys_kill()
		get_parent().get_node("AnimationPlayer").play("kill")
		
	if timer.time_left == 0 and ativo:
		ataque()
		timer.start()
		
func hit_damage(BULLET_DAMAGE):
	life -= BULLET_DAMAGE
	print("dano", life)

func remove():
	queue_free()
	
func ataque():
	$gun.fire_weapon()
	$gun2.fire_weapon()
	
func set_active():
	ativo = true
