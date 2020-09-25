extends KinematicBody

var life = 5000
var exp_value = 110

var active_moves =true
var speed = 2
var timer
var target
var morreu = false
var ativo = false
func _ready():
	timer = $gun/Timer

func _physics_process(delta):
	if timer.time_left == 0 and ativo:
		ataque()
		timer.start()
		
	if life <= 0 and !morreu:
		morreu()
		print("morreu")
		PlayerStatus.add_exp(exp_value)
		morreu = true
		# queue_free()
		
func set_target(value):
	target = value
	
func move_to_target(delta):
	if target:
		var direction = (target.transform.origin - transform.origin).normalized()
		move_and_slide(direction * speed, Vector3.UP)
	
func hit_damage(BULLET_DAMAGE):
	if ativo:
		life -= BULLET_DAMAGE
	#print(life)

func movimente():
	if active_moves:
		var velocity = Vector3()
		velocity.z -= 1
		velocity = move_and_slide(velocity, Vector3(0, 1, 0))
		
func morreu():
	ativo = false
	get_parent().get_node(".").mortes()
	$CollisionShape.disabled = true
	hide()
	translation.y = -30
	
func set_ativo():
	ativo = true
	
func ataque():
	$gun.fire_weapon()
	$gun2.fire_weapon()
