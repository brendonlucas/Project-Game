extends Spatial

var BULLET_SPEED = 10
var BULLET_DAMAGE = 30

const KILL_TIMER = 4
var timer = 0
var hit_something = false

func _ready():
	$Area.connect("body_entered", self, "collided")
	

func _physics_process(delta):
	var forward_dir = -global_transform.basis.z.normalized()
	global_translate(forward_dir * BULLET_SPEED * delta)
	
	timer += delta
	if timer >= KILL_TIMER:
		queue_free()


func collided(body):
	if hit_something == false:
		if body.has_method("bullet_hit"):
			body.bullet_hit(BULLET_DAMAGE, self.global_transform.origin)
			
	hit_something = true
	if body.is_in_group("Player_v4") or body.is_in_group("Player_hack"):
		body.hit_damage(BULLET_DAMAGE)
		print("bateu doido")
		queue_free()
		
	elif !body.is_in_group("enemy") and body.name != "limite":
		#print("apaga")
		queue_free()

func remove():
	queue_free()
