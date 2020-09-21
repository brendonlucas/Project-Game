extends RayCast

var current_colider

onready var interact_label = get_parent().get_node("UI/interact_label")


func _ready():
	set_interact_text("")
func _process(delta):
	var colider = get_collider()
	
	if is_colliding() and colider is Interactable:
		if current_colider != colider:
			set_interact_text(colider.get_interactable_text())
			current_colider = colider
		
		if Input.is_action_just_pressed("interact"):
			colider.interact()
			set_interact_text(colider.get_interactable_text())
	elif current_colider:
		current_colider = null
		interact_label.set_text("")

func set_interact_text(text):
	if !text:
		interact_label.set_text("")
		interact_label.set_visible(false)
	else:
		interact_label.set_text("Press E para %s" %text)
		interact_label.set_visible(true)
