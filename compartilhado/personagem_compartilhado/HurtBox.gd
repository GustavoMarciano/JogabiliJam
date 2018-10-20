extends Area2D

const DamageSource = preload("res://compartilhado/hitbox/HitBox.gd")

func _on_HurtBox_area_entered(area):
	if not area is DamageSource || area.lista["Owner"] == owner || owner.dead:
		return

	owner.last_hit = area.lista["Owner"]

	if area.lista.has("Critico"):
		if area.lista["Critico"] == true:
			owner.tomar_dano(area.lista["Dano"] * 2)
		else:
			owner.tomar_dano(area.lista["Dano"])
	else:
		owner.tomar_dano(area.lista["Dano"])

	if area.lista.has("Knock"):
		var knock = area.lista["Knock"].values()
		owner.tempo_knock_back = knock[0]
		owner.movimento.x = knock[1]
		owner.movimento.y = knock[2]
		owner.mudar_estado("Knock")

	if area.lista.has("Atordoado"):
		var knock = area.lista["Atordoado"].values()
		owner.tempo_atordoamento = knock[0]
		owner.mudar_estado("Knock")