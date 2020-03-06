//	Draw black bar
draw_set_alpha(.5)
draw_set_color(c_black)

var yy = display_get_gui_height()-180
draw_rectangle(0,yy,display_get_gui_width(),display_get_gui_height(),false)

draw_set_alpha(1)

//	Draw Name
draw_set_color(c_yellow)
var nameX = 240
var nameY = yy + 64
draw_set_halign(fa_left)
draw_text(nameX,nameY,character.name)

//	Draw dialogue
if dialogue.dialogue_current != "" {
	draw_set_color(c_white)
	
	var dialogueX = nameX+100
	var dialogueY = yy+90
	
	draw_text(dialogueX,dialogueY,dialogue.dialogue_current)
	
}

var button_width = 92
var button_height = 64
var buttonX = display_get_gui_width()/2+100
var buttonY = yy+70

var outline = 3
draw_set_color(c_black)
draw_roundrect(buttonX-outline,buttonY-outline,buttonX+button_width+outline,buttonY+button_height+outline,false)
if point_in_rectangle(gui_mouse_x,gui_mouse_y,buttonX,buttonY,buttonX+button_width,buttonY+button_height) {
	draw_set_color(c_gray)	
	if input.mouse_left_pressed and dialogue.index == 0 {
		with dialogue {
			index++
			dialogue_current = script[# whose_talking, index]
			character.sprite = sprite0
		}
	} else if input.mouse_left_pressed and dialogue.index == 1 {
		with dialogue {
			index--
			dialogue_current = script[# whose_talking, index]
			character.sprite = sprite1
		}	
	}
} else {
	draw_set_color(c_dkgray)
}
draw_roundrect(buttonX,buttonY,buttonX+button_width,buttonY+button_height,false)

draw_set_color(c_white)
draw_set_halign(fa_center)
draw_text(buttonX+button_width/2,buttonY+button_height/2,"Next")

