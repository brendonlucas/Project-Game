extends Interactable

var dor
var open = false
var status_porta
func _ready():
	dor = get_parent().get_node("AnimationPlayer")

func get_interactable_text():
	return "Usar"
	
func interact():
	if open:
		dor.play("close")
		open = false
			
	elif !open :
		dor.play("open")
		open = true
		
func set_open(option):
	open = option
