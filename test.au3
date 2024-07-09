#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
HotKeySet("{ENTER}", "testtime")

#Region ### START Koda GUI section ### Form=
$Form1_1 = GUICreate("CP時間計算", 409, 303, 192, 124)
$Input1 = GUICtrlCreateInput("", 128, 32, 121, 21)
$Input2 = GUICtrlCreateInput("", 128, 64, 121, 21)
$Input3 = GUICtrlCreateInput("0", 128, 96, 121, 21)
$Radio1 = GUICtrlCreateRadio("CP1", 128, 120, 113, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
$Radio2 = GUICtrlCreateRadio("CP2", 128, 144, 113, 17)
$Label1 = GUICtrlCreateLabel("程式時間(ms)", 45, 32, 70, 30)
$Label2 = GUICtrlCreateLabel("touchdown(次)", 40, 64, 75, 30)
$Button1 = GUICtrlCreateButton("計算", 264, 32, 113, 57)
$Label3 = GUICtrlCreateLabel("耗時", 32, 176, 28, 17)

$Edit1 = GUICtrlCreateEdit("", 96, 176, 281, 120)
GUICtrlSetData(-1, "")
$Label4 = GUICtrlCreateLabel("prober移動時間(分)", 8, 96, 107, 30)

GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $Button1
			testtime()
			
		Case $GUI_EVENT_CLOSE
			Exit

	EndSwitch
WEnd

Func testtime()
			$times = GUICtrlRead($Input1)
			$touchdown = GUICtrlRead($Input2)
			$probet =GUICtrlRead($Input3)*60*1000
			$nhour = @HOUR
			$nminute = @MIN
			$ALLTime =0
			$ALLmin = 0
			$testt= $times * $touchdown ;ms
			
			$cleansheett =  Int($touchdown/50)*20*1000 ;ms
			
			$preheating =0
			
			If GUICtrlRead($Radio1)=1 Then $SUM = $testt+$probet+$cleansheett
			If GUICtrlRead($Radio2)=1 Then 
				$preheating = Int($touchdown/200)*5*60*1000
				$SUM = $testt+$probet+$cleansheett+$preheating
			EndIf	
			$AT=timechang1($SUM,$ALLTime,$ALLmin)
			

			$sumtime = $nhour + $ALLTime
			$summin = $nminute + $ALLmin
			If $summin >= 60 Then
				$summin=$summin-60
				$sumtime = $sumtime+1
			EndIf
			
			If $sumtime >= 24 Then
				$sumtime=$sumtime-24
				
			EndIf
			GUICtrlSetData($Edit1,$AT & _
			@CRLF &"大約"&$sumtime&"點"&$summin&"分完成"& _
			@CRLF &"備註" & @CRLF & "測試時間         "&timechang($testt)& _
			@CRLF & "probe移動時間"&timechang($probet) & _
			@CRLF & "清針時間         "&timechang($cleansheett)& _
			@CRLF & "preheating時間 "&timechang($preheating))

			

EndFunc

Func timechang1(ByRef $var, ByRef $uhour, ByRef $umin)
	
	$hourvar = ($var)/1e3/60/60
	$uhour = Int($hourvar)
	$umin =Round(Mod($hourvar,1)*60)
	
	Return $uhour&"小時"&$umin&"分鐘"
	
EndFunc

Func timechang(ByRef $var)
	
	$hourvar = ($var)/1e3/60/60
	$uhour = Int($hourvar)
	$umin =Round(Mod($hourvar,1)*60)
	
	Return $uhour&"小時"&$umin&"分鐘"
	
EndFunc



