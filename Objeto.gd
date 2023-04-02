extends RigidBody2D

export (int) var velocidad_min
export (int) var velocidad_max
var tipo_objeto = ["grande"]

func _ready():
	$AnimatedSprite.animation = tipo_objeto[randi() % tipo_objeto.size()]


func _on_VisibilityNotifier2D_screen_exited():
	queue_free() # elimina el objeto
