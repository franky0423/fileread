
#include <AutoItConstants.au3>
#include <MsgBoxConstants.au3>

HotKeySet("{ESC}", "break1")

While 1
        Sleep(100)
		mouse()
WEnd


Func mouse()
;~ 	MouseClick("",976, 254)
;~ 	MouseClick("right",1259, 271)
	Global $aPos = MouseGetPos()
 
;~ 	MouseMove(	1884, 1059)
;~ 	MouseClick("",1884, 1059)
;~ 	Sleep(1000)
;~ 	MouseMove(	1884, 1059)
		
		MouseMove(	$aPos[0]+1000, $aPos[1])
		MouseMove(	$aPos[0], $aPos[1])	
		MouseClick("",923, 589)
	
	
;~ 	Send("^")
	Sleep(20000)


EndFunc

Func break1()
	
	MsgBox($MB_SYSTEMMODAL,"Mouse x, y:", $aPos[0] & ", " & $aPos[1]))
	Exit
EndFunc	

