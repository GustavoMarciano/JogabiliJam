extends Node

export(float,0.5,2) var cd_time = 1
var poder
var em_cd = false
var obj = load("res://outros/Habilidades/tipo_0/habilidade_test/Animacao/Animacao.tscn")

func start():
	owner.mudar_animacao("Ataque",1,0.2)
	owner.mudar_mobilidade_e_gravidade("desabilitar","normal")

	poder = Utils.create_object(obj,owner)
	poder.set_scale(owner.sprite.get_scale())
	poder.get_node("AnimationPlayer").playback_speed = 1

	owner.row_crit()
	em_cd = true

	var status = {
		"Owner":owner,
		"Dano": 5 + owner.dano_base,
		"Critico": owner.critico 
		}

	status["Knock"] = {"timer":.3,"x":100 * poder.get_scale().x,"y":0}

	poder.get_node("Position2D/HitBox").lista(status)

	cd_time = cd_time - owner.reducao_cd_base
	cd_time = max(0.5,cd_time) 
	$Timer.wait_time = cd_time
	$Timer.start()

func update(delta):
	if !is_instance_valid(poder):
		owner.mudar_estado(owner.esta())

func _on_Timer_timeout():
	em_cd = false