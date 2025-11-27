extends Node2D

@onready var score_manager = %ScoreManager

func _on_body_entered(body: Node2D) -> void:
	score_manager.add_score()
	queue_free()
