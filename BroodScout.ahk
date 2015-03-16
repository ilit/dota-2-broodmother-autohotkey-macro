; Script sends one random owned creep to mouse location

; For proper minimap usage add "dota_minimap_misclick_time 0" text line to
; C:\Steam\steamapps\common\dota 2 beta\dota\cfg\autoexec.cfg
; Create file if does not exist

#SingleInstance Force
#IfWinActive, DOTA 2
SetMouseDelay, 1

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
			Click 727, 1062 ; Second page coordinates 

		; Select random creep on page
		Random, xRnd, 673, 879
		Random, yRnd, 959, 1046		
		Click %xRnd%, %yRnd%
	}
	
	; Send selected creep at mouse start restored position
	MouseClick, Right, xStart, yStart
}
