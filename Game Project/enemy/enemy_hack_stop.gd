extends KinematicBody

var timer_attack
var target_attack

var life = 500

func _ready():
	
	timer_attack = get_node("guns/gun/Timer")
func _process(delta):
	if life <= 0:
		queue_free()
		
	if $guns/gun/Timer.time_left == 0:
		atacar()
		$guns/gun/Timer.start()
		
func atacar():
	$guns/gun.fire_weapon()
	$guns/gun2.fire_weapon()
	$guns/gun3.fire_weapon()
	$guns/gun4.fire_weapon()

func hit_damage(BULLET_DAMAGE):
	life -= BULLET_DAMAGE
