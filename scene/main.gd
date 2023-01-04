extends Node2D

func _ready():
	home()
	pass

func home():
	var homeResource = preload("res://scene/home.tscn")
	var home = homeResource.instantiate()
	add_child(home)
	print(get_node_or_null("Home"))
	$Home/Control/Start.connect("pressed",Callable(self,"startGame"))
	$swoosh.play()
	if (get_node_or_null("Over") != null):
		$Over.queue_free()
	pass
	

func startGame():
	var gameResoure = preload("res://scene/game.tscn")
	var game = gameResoure.instantiate()
	add_child(game)
	
	game.end_game.connect(endGame)
	
	$Home.queue_free()
	
	$swoosh.play()
	pass

func endGame(point: int):
	var overResource = preload("res://scene/over.tscn")
	var over = overResource.instantiate()
	add_child(over)
	$Over/Control/Score.text = String.num_int64(point)
	$Over/Control/Menu.connect("pressed", Callable(self, "home"))
	$Game.queue_free()
	
	$die.play()
	pass
