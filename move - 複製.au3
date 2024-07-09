
#include <AutoItConstants.au3>
#include <MsgBoxConstants.au3>

HotKeySet("{ESC}", "break1")


	MsgBox($MB_SYSTEMMODAL,"start","start")
	Run("notepad.exe")
While 1
		
        Sleep(100)
		mouse()
WEnd


Func mouse()
	Global $aPos = MouseGetPos()
; 等待記事本視窗出現
	WinWaitActive("[CLASS:Notepad]")

; 設定視窗的大小和位置
; 參數依次為：X座標, Y座標, 寬度, 高度
	WinMove("[CLASS:Notepad]", "", 100, 100, 800, 600)
	MouseClickDrag($MOUSE_CLICK_LEFT, 831, 698,831, 798)
	MouseClickDrag($MOUSE_CLICK_LEFT, 831, 798,831, 698)

;~ 	MouseClick("",976, 254)
;~ 	MouseClick("right",1259, 271)
;~ 	Global $aPos = MouseGetPos()
 
	MouseMove(	$aPos[0], $aPos[1]+100)
	MouseMove(	$aPos[0], $aPos[1])	
;~ 	
	
;~ 	Send("^")
	Sleep(120000)


EndFunc

Func break1()
	
	MsgBox($MB_SYSTEMMODAL,"Mouse x, y:")
	Exit
EndFunc	

