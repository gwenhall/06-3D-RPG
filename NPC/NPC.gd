extends KinematicBody

onready var Dialogue = get_node("/root/Game/UI/Dialogue")

var dialogue = [
	"Welcome to the range! (Press E to contrinue)"
	,"I know it might sound strange, but...Your life depends on your speed and accuracy!"
	, "Shoot those 5 targets and defeat the drone before you run out of time! (What a weird script the manager gave me...)"
	, "Kind of strange to be at a shooting range with an actual gun...but whatever floats your goat."
	, "The challenge starts as soon as you press E. Ready?"
]

func _ready():
	$AnimationPlayer.play("Idle")
	Dialogue.connect("finished_dialogue", self, "finished")


func _on_Area_body_entered(body):
	Dialogue.start_dialogue(dialogue)


func _on_Area_body_exited(body):
	Dialogue.hide_dialogue()


func finished():
	get_node("/root/Game/Target_container").show()
	Global.timer = 120
	Global.update_time()
	get_node("root/Game/UI/Timer").start()
