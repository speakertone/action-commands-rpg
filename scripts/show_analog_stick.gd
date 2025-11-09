extends ActionCommand


@export var show_2d = true
@export var show_3d = true
@onready var stick_2d = $"2D/Stick"
@onready var stick_3d = $"3D/Pivot"


func _ready() -> void:
	super._ready()
	$"2D".visible = show_2d
	$"3D".visible = show_3d


func _process(delta: float) -> void:
	super._process(delta)


func _physics_process(delta: float) -> void:
	super._physics_process(delta)
	stick_2d.position = Vector3(l_stick_position.x, l_stick_position.y, 0)
	stick_3d.rotation = Vector3(-l_stick_position.y, l_stick_position.x, 0)
