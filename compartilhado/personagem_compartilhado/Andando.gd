extends Node

func start():
	owner.mudar_animacao("Andando",1,0.2)
	owner.mudar_mobilidade_e_gravidade("normal","normal")

func update(delta):
	if owner.direcao == 0 && owner.is_on_floor():
		exit("Parado")

	if  !owner.is_on_floor():
		exit("Caindo")

func exit(estado):
	owner.mudar_estado(estado)