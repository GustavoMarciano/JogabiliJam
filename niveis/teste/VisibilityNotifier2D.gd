extends VisibilityNotifier2D

onready var spawner = $".."

func _ready():
	spawner.visible_spawns.append(self)

func _on_VisibilityNotifier2D_screen_entered():
	spawner.visible_spawns.remove(spawner.visible_spawns.find(self))

func _on_VisibilityNotifier2D_screen_exited():
	spawner.visible_spawns.append(self)