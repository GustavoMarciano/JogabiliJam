extends Node

func start():
	owner.mudar_animacao("Knock",1,0)
	owner.mudar_mobilidade_e_gravidade("knock","knock")
	owner.controle.set_process(false)
	$"KnockTimer".wait_time = owner.tempo_knock_back 
	$"KnockTimer".start()

func update(delta):
	pass

func _on_Timer_timeout():
	owner.controle.set_process(true)
	owner.mudar_estado(owner.esta())