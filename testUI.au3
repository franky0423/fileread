#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>

; 文件路径
Global $configFile = @ScriptDir & "\config.ini"

#Region ### START Koda GUI section ### Form=c:\users\a006143\desktop\form1.kxf
$Form1_1 = GUICreate("Form1", 522, 312, 277, 146)
$Input1 = GUICtrlCreateInput("", 144, 24, 121, 21)
$Input2 = GUICtrlCreateInput("", 144, 61, 121, 21)
$Input3 = GUICtrlCreateInput("", 144, 99, 121, 21)
$Input4 = GUICtrlCreateInput("", 144, 136, 121, 21)
$Input5 = GUICtrlCreateInput("", 144, 173, 121, 21)
$Input6 = GUICtrlCreateInput("", 144, 211, 121, 21)
$Input7 = GUICtrlCreateInput("", 144, 248, 121, 21)
$Label1 = GUICtrlCreateLabel("times", 104, 24, 28, 17)
$Label2 = GUICtrlCreateLabel("program name", 61, 63, 71, 17)
$Label3 = GUICtrlCreateLabel("starting point", 68, 101, 64, 17)
$Label4 = GUICtrlCreateLabel("first vaule", 83, 140, 49, 17)
$Label5 = GUICtrlCreateLabel("last vaule", 83, 179, 49, 17)
$Label6 = GUICtrlCreateLabel("step", 108, 252, 24, 17)
$Label7 = GUICtrlCreateLabel("sweep start vaule", 45, 217, 87, 17)
$OK = GUICtrlCreateButton("OK", 224, 280, 75, 25)
$Edit1 = GUICtrlCreateEdit("", 312, 24, 185, 241)
GUICtrlSetData(-1, "times: 60"&@CRLF _
                            &"program name: F4_CP1_RT_SS_AA050100"&@CRLF _
                            &"starting point: 109"&@CRLF _
                            &"first vaule: Idrain_"&@CRLF _
                            &"last vaule:V"&@CRLF _
                            &"step: +0.1 or -0.1"&@CRLF _
                            &"sweep start vaule:6"&@CRLF _
                            &"result :"&@CRLF _
                            &"Idrain_6V"&@CRLF _    
                            &"Idrain_5.9V"&@CRLF _
                            &"Idrain_5.8V"&@CRLF _
                            &"Idrain_5.7V"&@CRLF _
                        )
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

; 读取配置文件并填充输入框
If FileExists($configFile) Then
    $times = IniRead($configFile, "Config", "times", "")
    $programName = IniRead($configFile, "Config", "programName", "")
    $startingPoint = IniRead($configFile, "Config", "startingPoint", "")
    $firstValue = IniRead($configFile, "Config", "firstValue", "")
    $lastValue = IniRead($configFile, "Config", "lastValue", "")
    $sweepStartValue = IniRead($configFile, "Config", "sweepStartValue", "")
    $step = IniRead($configFile, "Config", "step", "")
    
    GUICtrlSetData($Input1, $times)
    GUICtrlSetData($Input2, $programName)
    GUICtrlSetData($Input3, $startingPoint)
    GUICtrlSetData($Input4, $firstValue)
    GUICtrlSetData($Input5, $lastValue)
    GUICtrlSetData($Input6, $sweepStartValue)
    GUICtrlSetData($Input7, $step)
EndIf

While 1
    $nMsg = GUIGetMsg()
    Switch $nMsg
        Case $OK
            ; 获取输入框中的数据
            $times = GUICtrlRead($Input1)
            $programName = GUICtrlRead($Input2)
            $startingPoint = GUICtrlRead($Input3)
            $firstValue = GUICtrlRead($Input4)
            $lastValue = GUICtrlRead($Input5)
            $sweepStartValue = GUICtrlRead($Input6)
            $step = GUICtrlRead($Input7)
            
            ; 保存数据到配置文件
            IniWrite($configFile, "Config", "times", $times)
            IniWrite($configFile, "Config", "programName", $programName)
            IniWrite($configFile, "Config", "startingPoint", $startingPoint)
            IniWrite($configFile, "Config", "firstValue", $firstValue)
            IniWrite($configFile, "Config", "lastValue", $lastValue)
            IniWrite($configFile, "Config", "sweepStartValue", $sweepStartValue)
            IniWrite($configFile, "Config", "step", $step)
            
            Exit
        Case $GUI_EVENT_CLOSE
            Exit
    EndSwitch
WEnd
