extends Position2D


func _on_PersonagemCompartilhado_mudar_nivel(valor):
	var particula = Utils.create_object(load("res://outros/particulas/XP/LevelUp.tscn"),owner)
	particula.position = self.position