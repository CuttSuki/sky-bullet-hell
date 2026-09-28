extends Node2D
class_name AudioManagerGlobal




func play_sfx(sfx: String):
	var audio_stream_player: AudioStreamPlayer2D = AudioStreamPlayer2D.new()
	add_child(audio_stream_player)
	audio_stream_player.stream = load(sfx)
	audio_stream_player.play()
	audio_stream_player.volume_db = -30
	await audio_stream_player.finished
	audio_stream_player.queue_free()
	 
