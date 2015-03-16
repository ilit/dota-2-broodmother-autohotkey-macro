; Script sends one random owned creep to mouse location

; For proper minimap usage add "dota_minimap_misclick_time 0" text line to
; C:\Steam\steamapps\common\dota 2 beta\dota\cfg\autoexec.cfg
; Create file if does not exist

#SingleInstance Force
#IfWinActive, DOTA 2
SetMouseDelay, 1

; Creeps list corner for 1920 x 1080 resolution
LIST_CORNER_X := 673
LIST_CORNER_Y := 959

; Creeps list corner for 1366 x 768 resolution
;LIST_CORNER_X := 479
;LIST_CORNER_Y := 681

; Creeps list corner for 1280 x 1024 resolution
;LIST_CORNER_X := 432
;LIST_CORNER_Y := 918

; Creeps list corner for 1600 x 900 resolution
;LIST_CORNER_X := 562
;LIST_CORNER_Y := 799

; Creeps list corner for 1440 x 900 resolution
;LIST_CORNER_X := 475
;LIST_CORNER_Y := 799

g:: ; Assign key here
{
	; Select all creeps
	Send {F2}

	; Save mouse pos
	MouseGetPos, xStart, yStart
	
	; 5 random clicks in hope that some will select creep
	Loop 4
	{
		; Page walker
		Random, pageWalk, 0, 1
		if (pageWalk = 1)
			Click LIST_CORNER_X + 54, LIST_CORNER_Y + 103 ; Second page coordinates 

		; Select random creep on page
		Random, xRnd, LIST_CORNER_X, LIST_CORNER_X + 206
		Random, yRnd, LIST_CORNER_Y, LIST_CORNER_Y + 87
		Click %xRnd%, %yRnd%
	}
	
	; Send selected creep at mouse start restored position
	MouseClick, Right, xStart, yStart
}
