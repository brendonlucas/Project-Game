extends Interactable

var dor
var ativo = false
var status_porta

func _ready():
	pass
	#dor = get_parent().get_node("AnimationPlayer")

func get_interactable_text():
	return "Hack painel"
		
func set_active(option):
	ativo = option

func interact():
	if !ativo :
		Gamestate.instancia_game("torre_1")
		get_tree().get_root().get_node("Map/Player_v4/UI/interact_label").set_visible(false)
		# instanciar minigame
		ativo = true
