extends Position2D

export (float) var min_waitTime
export (float) var max_waitTime

var enemies_array = ["res://personagens/inimigo_teste/InimigoTeste.tscn","res://personagens/sniper/InimigoTeste.tscn"]

var visible_spawns = []
var max_inimigos = 18

func _ready():
	randomize()
	$Timer.wait_time = rand_range(min_waitTime,max_waitTime)
	$Timer.start()

func _on_Timer_timeout():
	if Game.inimigos <= max_inimigos: 
		var sort = randi() % visible_spawns.size()-1  #rand_range(0,visible_spawns.size())
		var enemy_sort = randi() %  enemies_array.size()-1

		var new_enemy = Utils.create_object(load(enemies_array[enemy_sort]),self)
		new_enemy.add_xp($"..".enemis_level * 50)

		Game.inimigos += 1 

		var n_position = visible_spawns[sort]
		var enemy_shape = new_enemy.get_node("CollisionShape2D").shape.get_extents().y
		new_enemy.set_position(Vector2(n_position.global_position.x + rand_range(0,n_position.get_rect().size.x * n_position.get_scale().x),n_position.global_position.y - enemy_shape+1))
		$"Timer".set_wait_time(rand_range(min_waitTime,max_waitTime))
		$"Timer".start()