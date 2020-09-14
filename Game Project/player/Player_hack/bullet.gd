extends Spatial

var BULLET_SPEED = 50
var BULLET_DAMAGE = 100

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
	if body.is_in_group("enemy") or body.is_in_group("block_broken"):
		body.hit_damage(BULLET_DAMAGE)
		queue_free()
		
	if body.name != "Player_hack":
		queue_free()
	
