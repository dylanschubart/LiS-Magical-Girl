extends Node

var dialogue_path: String = ""

var dialog
 
var phraseNum = 0
var finished = true

var dialogue_text_label: RichTextLabel
var dialogue_name_label: Label

func start_dialogue(dialogue_path_string: String):
	if finished:
		dialogue_path = dialogue_path_string
		get_tree().root.get_node("UI").dialogue.show()
		dialogue_text_label = get_tree().root.get_node("UI").dialogue.text_label
		dialogue_name_label = get_tree().root.get_node("UI").dialogue.name_label
		start()

	
func start():
	print_debug("start")
	# var player = get_tree().root.get_node("Player")
	# player.dialogue_finished = false

	phraseNum = 0
	dialog = getDialog()
	assert(dialog, "Dialog not found")
	nextPhrase()
	
# func _process(_delta):
# 	if finished:
		
# 	# else:
# 	# 	dialogue_text_label.visible_characters = len(dialogue_text_label.text)
 
 
func getDialog() -> Array:
	var f = FileAccess.open(dialogue_path,FileAccess.READ)
	assert(FileAccess.file_exists(dialogue_path), "File path does not exist")
	
	var json_object = JSON.new()
	json_object.parse(f.get_as_text())
	var output = json_object.get_data()
	
	if typeof(output) == TYPE_ARRAY:
		return output
	else:
		return []
 
func nextPhrase() -> void:
	
	if phraseNum >= len(dialog):
		# var player = get_tree().root.get_node("Player")
		# player.dialogue_finished = true
		dialogue_text_label.text = ""
		dialogue_name_label.text = ""
		get_tree().root.get_node("UI").dialogue.hide()
		return

	finished = false
	dialogue_name_label.text = dialog[phraseNum]["name"]
	dialogue_text_label.bbcode_text = dialog[phraseNum]["text"]
	
	var audio_stream: AudioStream = load(dialog[phraseNum]["voiceline"])

	var audio_stream_player = SoundSystem.playVoice(audio_stream)
	await audio_stream_player.finished

	finished = true
	phraseNum += 1
	nextPhrase()
	return
