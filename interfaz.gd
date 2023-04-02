extends CanvasLayer

signal iniciar_juego

func mostrar_mensaje(texto):
	$Mensaje.text = texto
	$Mensaje.show()
	$mensajetimer.start()
	
func game_over():
	mostrar_mensaje("Game Over")
	yield($mensajetimer, "timeout")
	$Button.show()
	$Mensaje.text = "Paloma Gamberra"
	$Mensaje.show()
	
func update_score(Puntos):
	$ScoreLabel.text = str(Puntos)

func _on_mensajetimer_timeout():
	$Mensaje.hide()

func _on_Button_pressed():
	$Button.hide()
	emit_signal("iniciar_juego")
	
