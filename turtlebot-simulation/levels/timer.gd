extends Panel

var time: float = 0.0
var min: int = 0
var sec: int = 0
var msec: int = 0

func _process(delta) -> void:
	time += delta
	msec = fmod(time, 1) * 100
	sec = fmod(time, 60)
	min = fmod(time, 3600) / 60
	
	$Minutes.text = "%02d:" % min
	$Seconds.text = "%02d." % sec
	$Milliseconds.text = "%02d" % msec

func start() -> void:
	set_process(true)

func stop() -> void:
	set_process(false)

func get_time_formatted() -> String:
	return "%02d:%02d.%03d" % [min, sec, msec]
