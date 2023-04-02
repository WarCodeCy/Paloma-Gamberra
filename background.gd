extends Node

export (PackedScene) var Objeto
var Score

func _ready():
	randomize()
	
func nuevo_juego():
	Score = 0
	$Player.inicio($"pos inicio".position) #posicion de inicio
	$iniciotimer.start()
	$interfaz.mostrar_mensaje("Espabila!")
	$interfaz.update_score(Score)
	$Musica.play()

func game_over():
	$scoretimer.stop()
	$objetotimer.stop()
	$interfaz.game_over()
	$AudioMuerte.play()
	$Musica.stop()
	


func _on_iniciotimer_timeout():
	$objetotimer.start()
	$scoretimer.start()
	


func _on_scoretimer_timeout():
	Score += 1
	$interfaz.update_score(Score)
	

func _on_objetotimer_timeout():
	$camino/objetopos.set_offset(randi())
	var O = Objeto.instance()
	add_child(O)
	
	# selecionar direcicon
	var d = $camino/objetopos.rotation + PI / 2
	
	O.position = $camino/objetopos.position
	
	d += rand_range(-PI / 4, PI / 4)
	O.rotation = d
	O.set_linear_velocity(Vector2(rand_range(O.velocidad_min, O.velocidad_max), 0).rotated(d))
	
	
