extends Position2D

func _on_HurtBox_dano_critico(value):
	var particula = Utils.create_object(load("res://outros/particulas/Vida/Critico.tscn"),owner)
	particula.position = self.position
	particula.start(value)

func _on_HurtBox_dano_normal(value1):
	var particula = Utils.create_object(load("res://outros/particulas/Vida/ParticulaHP.tscn"),owner)
	particula.position = self.position
	particula.start(value1)