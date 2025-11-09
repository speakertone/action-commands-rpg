extends ActionCommand


@export var hold_time = 3.0
@export var release_threshold = 0.25
@onready var timer = $Timer
@onready var timer_bar = $TimerBar


func _ready() -> void:
	super._ready()


func _process(delta: float) -> void:
	super._process(delta)
	timer_bar.scale.x = roundf((timer.time_left / hold_time) * 5.0)
	if (l_stick_position.x < -0.5 and timer.is_stopped()):
		timer.start(hold_time)
	if (l_stick_position.x > -0.5 and not timer.is_stopped()):
		if (timer.time_left <= release_threshold):
			command_succeeded.emit()
		else:
			command_failed.emit()
		timer.stop()


func _physics_process(delta: float) -> void:
	super._physics_process(delta)
