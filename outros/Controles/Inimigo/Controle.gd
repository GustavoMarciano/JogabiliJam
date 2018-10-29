extends Node

var target 
var target_list = []
var random

var ab_range = 90

onready var habilidade0 = owner.get_node("Estados/Habilidade0")

func _process(delta):
		randomize()
		var unity_list = get_tree().get_nodes_in_group("UNITY")
	
		for unity in unity_list:
			if unity.side != owner.side && !target_list.has(unity):
				target_list.append(unity)

		if !target && target_list.size() > 0:
			random = randi() % target_list.size()
			target = target_list[random]
	
		if !is_instance_valid(target) && target_list.size() > 0:
			target_list.remove(random)
			target = null
			return

		if target:
			if target.side == owner.side:
				target_list.remove(random)
				target = null
				return

		if target != null: 
			var colider = $"../Sprite/Position2D/RayCast2D".get_collider() 
			if $"../Sprite/Position2D/RayCast2D".is_colliding():
				if colider && colider.owner == target:
					if habilidade0.em_cd == false && habilidade0 != null && owner.atacando == false:
						owner.mudar_estado("Habilidade0")

			elif target.global_position.x > owner.global_position.x + ab_range:
				owner.direcao = 1
			elif target.global_position.x < owner.global_position.x - ab_range:
				owner.direcao = -1