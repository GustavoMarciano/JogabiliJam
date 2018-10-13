extends Node

func _input(event):
	owner.direcao = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	owner.habilidade0 = int(Input.is_action_pressed("ui_ataque0"))
	owner.habilidade1 = int(Input.is_action_pressed("ui_ataque1"))
	owner.habilidade2 = int(Input.is_action_pressed("ui_ataque2"))