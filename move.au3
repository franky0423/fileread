
#include <AutoItConstants.au3>
#include <MsgBoxConstants.au3>

HotKeySet("{ESC}", "break1")


	MsgBox($MB_SYSTEMMODAL,"start","start")
While 1
        Sleep(100)
		mouse()
WEnd


Func mouse()
;~ 	MouseClick("",976, 254)
;~ 	MouseClick("right",1259, 271)
	Global $aPos = MouseGetPos()
;~  
	MouseMove(	$aPos[0], $aPos[1]+100)
	MouseMove(	$aPos[0], $aPos[1])	
;~ 	
	
;~ 	Send("^")
	Sleep(120000)


EndFunc

Func break1()
	
	MsgBox($MB_SYSTEMMODAL,"Mouse x, y:", $aPos[0] & ", " & $aPos[1]))
	Exit
EndFunc	

