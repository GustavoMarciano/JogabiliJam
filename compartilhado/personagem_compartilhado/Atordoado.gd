extends Node

func start():
	owner.atacando = false
	owner.mudar_animacao("Atordoado",1,0)
	owner.mudar_mobilidade_e_gravidade("desabilitar","desabilitar")
	$"AtordoamentoTimer".wait_time = owner.tempo_atordoamento
	$"AtordoamentoTimer".start()

func update(delta):
	pass

func _on_Timer_timeout():
	owner.mudar_estado(owner.esta())