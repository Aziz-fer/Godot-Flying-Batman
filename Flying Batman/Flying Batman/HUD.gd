extends CanvasLayer

signal start_game
signal exit_game

func show_message(text):
	$MessageLabel.text = text
	$MessageLabel.show()
	$MessageTimer.start()


func show_game_over():
	show_message("Game Over :(")
	yield($MessageTimer, "timeout")
	$MessageLabel.text = "Don't Give Up\nTry Again"
	$MessageLabel.show()
	yield(get_tree().create_timer(1), "timeout")
	
	$StartButton.show()
	$ExitButton.show()
"""
 func init_game_over_menu(score,highscore):
	score_label.text = "SCORE:" + str(score)
	high_score_label.text = "BEST:" + str(highscore)
"""

func update_score(score):
	$ScoreLabel.text = str(score)


func _on_StartButton_pressed():
	$StartButton.hide()
	$ExitButton.hide() 
	emit_signal("start_game")
func _on_ExitButton_pressed():
	$StartButton.hide()
	$ExitButton.hide() 
	emit_signal("exit_game")

func _on_MessageTimer_timeout():
	$MessageLabel.hide()


func exit_pressed():
	pass # Replace with function body.
