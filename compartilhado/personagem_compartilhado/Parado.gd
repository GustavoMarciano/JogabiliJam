extends Node

export(float) var velocidade_animacao

func start():
	owner.mudar_animacao("Parado",velocidade_animacao,0.2)
	owner.mudar_mobilidade_e_gravidade("desabilitar","normal")

func update(delta):
	var estado = owner.esta()
	if estado != "Parado":
		owner.mudar_estado(estado)