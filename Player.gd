extends Area2D

export (int) var Velocidad
var Movimiento = Vector2()
var limite
signal golpe

func _ready():
	hide() # ocultar el pj
	limite = get_viewport_rect().size

func _process(delta):
	Movimiento = Vector2() # Reinicar el valor de movimiento
	if Input.is_action_pressed("ui_right"):
		Movimiento.x += 1
	if Input.is_action_pressed("ui_left"):
		Movimiento.x -= 1
	if Input.is_action_pressed("ui_down"):
		Movimiento.y += 1
	if Input.is_action_pressed("ui_up"):
		Movimiento.y -= 1
		
	if Movimiento.length() > 0: # Verificar si esta en movimiento
		Movimiento = Movimiento.normalized() * Velocidad # normalizar la velocidad
		
	position += Movimiento * delta # Actulizar los posicion x, y del nodo
	position.x = clamp(position.x, 0, limite.x -20) #limitamos la colision de la pantalla se puede modificar valor
	position.y = clamp(position.y ,0, limite.y -20)
	
	# implementando la animación
	if Movimiento.x != 0:
		$AnimatedSprite.animation = "lado"
		$AnimatedSprite.flip_h = Movimiento.x > 0
		$AnimatedSprite.flip_v = false
	elif Movimiento.y != 0:
		$AnimatedSprite.animation = "espalda"
		$AnimatedSprite.flip_v = Movimiento.y > 0
		
	else:
		$AnimatedSprite.animation = "frente"
		$AnimatedSprite.flip_v = false


func _on_Player_body_entered(body):# cuando hay colision con objeto
	hide()
	emit_signal("golpe")
	$CollisionShape2D.disabled = true

func inicio(pos):
	position = pos
	show() # mostrar pj
	$CollisionShape2D.disabled = false
	
