extends KinematicBody

var life = 5000
var active_moves =true
var speed = 2

func _ready():
	pass 

func _physics_process(delta):
	movimente()
	if life <= 0:
		print("morreu")
		queue_free()
	
	
func hit_damage(BULLET_DAMAGE):
	print("g")
	life -= BULLET_DAMAGE
	#print(life)

func movimente():
	if active_moves:
		var velocity = Vector3()
		velocity.z -= 1
		velocity = move_and_slide(velocity, Vector3(0, 1, 0))
