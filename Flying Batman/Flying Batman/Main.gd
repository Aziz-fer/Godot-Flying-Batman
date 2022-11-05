extends Node

export (PackedScene) var mob_scene

const SAVE_FILE_PATH = "use://savedata.save"
var score = 0
var highscore = 0 

func _ready():
	randomize()
	"_load_highscore()"


func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()
	$HUD.show_game_over()
	$Music.stop()
	$DeathSound.play()
	


func new_game():
	get_tree().call_group("mobs", "queue_free")
	score = 0
	$DeathSound.stop()
	$Player.start($StartPosition.position)
	$StartTimer.start()
	$HUD.update_score(score)
	$HUD.show_message("Get Ready")
	$Music.play()


func _on_MobTimer_timeout():
	var mob_spawn_location = get_node("MobPath/MobSpawnLocation")
	mob_spawn_location.offset = randi()

	var mob = mob_scene.instance()
	add_child(mob)

	var direction = mob_spawn_location.rotation + PI / 2

	mob.position = mob_spawn_location.position

	direction += rand_range(-PI / 4, PI / 4)
	mob.rotation = direction

	var velocity = Vector2(rand_range(mob.min_speed, mob.max_speed), 0)
	mob.linear_velocity = velocity.rotated(direction)


func _on_ScoreTimer_timeout():
	score += 1
	$HUD.update_score(score)


func _on_StartTimer_timeout():
	$MobTimer.start()
	$ScoreTimer.start()
"""
func _save_highscore():
	var save_data = File.new()
	save_data.open(SAVE_FILE_PATH, File.WRITE)
	save_data.store_var(highscore)
	save_data.close()
func _load_highscore():
	var save_data = File.new() 
	if save_data.file_exists(SAVE_FILE_PATH):
		save_data.open(SAVE_FILE_PATH,File.READ)
		highscore = save_data.get_var()
		save_data.close()"
	"""
	
	
