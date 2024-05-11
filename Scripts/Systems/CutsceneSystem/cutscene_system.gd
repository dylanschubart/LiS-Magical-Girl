extends Node

@onready var cutscene_player = $AnimationPlayer
@onready var cutscene_camera = $Camera3D

func _ready():
    # play_animation("Test Cutscene")
    pass


func play_animation(animation_name: String):
    var player = get_tree().get_first_node_in_group("Player")
    player.player_camera.current = false
    cutscene_camera.current = true
    cutscene_player.play(animation_name)

    await cutscene_player.animation_finished
    player.player_camera.current = true
    cutscene_camera.current = false


func play_dialogue(dialogue_path: String):
    dialogue.start_dialogue(dialogue_path)