extends MeshInstance


func _ready():
	pass


func reset():
	show()
	$StaticBody/CollisionShape.disabled = false
