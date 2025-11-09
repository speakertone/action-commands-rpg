extends Node3D


@export var display_time = 1.0
@onready var success_sprite = $Success
@onready var failure_sprite = $Failure
@onready var timer = $Timer


func _ready() -> void:
	success_sprite.visible = false
	failure_sprite.visible = false


func _process(delta: float) -> void:
	pass


func _on_command_succeeded() -> void:
	success_sprite.visible = true
	timer.start(display_time)


func _on_command_failed() -> void:
	failure_sprite.visible = true
	timer.start(display_time)


func _on_timer_timeout() -> void:
	success_sprite.visible = false
	failure_sprite.visible = false
