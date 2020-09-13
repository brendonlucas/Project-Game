extends Area

var BULLET_DAMAGE = 100

var hit_something = false

func _ready():
	$".".connect("body_entered", self, "collided")


func collided(body):
	print(body)
	if hit_something == false:
		if body.has_method("bullet_hit"):
			body.bullet_hit(BULLET_DAMAGE, self.global_transform.origin)
			
	hit_something = true
	if body.is_in_group("Enemies"):
		print("hitooooooooooootot")
		#body.hit_damage(BULLET_DAMAGE)
		
	if body.name != "Player_v4":
		print()
		#queue_free()
