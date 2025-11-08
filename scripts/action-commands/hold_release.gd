extends ActionCommand


func _ready() -> void:
	super._ready()


func _process(delta: float) -> void:
	super._process(delta)
	$Stick.position = Vector3(l_stick_position.x, l_stick_position.y, 0)


func _physics_process(delta: float) -> void:
	super._physics_process(delta)
