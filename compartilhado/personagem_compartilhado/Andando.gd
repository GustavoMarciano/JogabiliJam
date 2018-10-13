extends Node

func start():
	owner.mudar_animacao("Andando",1.5,0.2)
	owner.mudar_mobilidade_e_gravidade("normal","normal")

func update(delta):
	owner.mudar_escala_sprite(owner.direcao,1)
	if owner.direcao == 0 && owner.is_on_floor():
		exit("Parado")

	if  !owner.is_on_floor():
		exit("Caindo")

	if owner.habilidade0 != 0:
		 exit("Habilidade0")
	if owner.habilidade1 != 0:
		 exit("Habilidade1")
	if owner.habilidade2 != 0:
		 exit("Habilidade2")

func exit(estado):
	owner.mudar_estado(estado)