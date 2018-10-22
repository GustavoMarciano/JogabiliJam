extends Node

onready var habilidade0 = owner.get_node("Estados/Habilidade0")
onready var habilidade1 = owner.get_node("Estados/Habilidade1")


func _process(delta):
	owner.direcao = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
		
	if Input.is_action_pressed("ui_ataque0") && habilidade0.em_cd == false && habilidade0 != null:
		owner.mudar_estado("Habilidade0")
	elif Input.is_action_pressed("ui_ataque1") && habilidade1.em_cd == false && habilidade1 != null:
		owner.mudar_estado("Habilidade1")