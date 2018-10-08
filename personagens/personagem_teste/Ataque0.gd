extends Node

func start():
	owner.mudar_animacao("Ataque0",1,0.2)
	owner.mudar_mobilidade_e_gravidade("desabilitar","normal")

func update(delta):
	if !owner.is_on_floor():
		exit("Caindo")

	if owner.direcao != 0:
		exit("Andando")

func exit(state):
	owner.mudar_estado(state)