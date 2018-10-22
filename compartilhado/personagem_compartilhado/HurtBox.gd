extends Area2D

signal dano_normal(value1)
signal dano_critico(value)

var disable = false
const DamageSource = preload("res://compartilhado/hitbox/HitBox.gd")

func _on_HurtBox_area_entered(area):
	if not area is DamageSource || disable || area.lista["Owner"] == owner || owner.dead || owner.side == area.lista["Side"]:
		return

	owner.last_hit = area.lista["Owner"]

	if area.lista.has("Critico"):
		if area.lista["Critico"] == true:
			owner.tomar_dano(area.lista["Dano"] * 2)
			emit_signal("dano_critico", area.lista["Dano"] * 2)
		else:
			owner.tomar_dano(area.lista["Dano"])
			emit_signal("dano_normal", area.lista["Dano"])
	else:
		owner.tomar_dano(area.lista["Dano"])
		emit_signal("dano_normal", area.lista["Dano"])

	if area.lista.has("Knock") && owner.atacando == false:
		var knock = area.lista["Knock"].values()
		owner.tempo_knock_back = knock[0]
		owner.movimento.x = knock[1]
		owner.movimento.y = knock[2]
		owner.mudar_estado("Knock")

	if area.lista.has("Atordoado"):
		var knock = area.lista["Atordoado"].values()
		owner.tempo_atordoamento = knock[0]
		owner.mudar_estado("Knock")