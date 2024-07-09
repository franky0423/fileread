#include "wd_helper.au3"
#include "wd_capabilities.au3"
#include "wd_core.au3"

_Example()

Func _Example()
	# REMARK
	#   This is not functional script
	#   It only shows the concept how to use WebDriver UDF

	#Region ; initialize webdriver sesion

	; you should take care about download/update dirver
	If $IDYES = MsgBox($MB_YESNO + $MB_TOPMOST + $MB_ICONQUESTION + $MB_DEFBUTTON1, "Question", _
			"Do you want to download/update driver ?") Then
		_WD_UpdateDriver('chrome')
	EndIf

	; specify driver, port and other options
	_WD_Option('Driver', 'chromedriver.exe')
	_WD_Option('Port', 9515)
	_WD_Option('DriverParams', '--verbose --log-path="' & @ScriptDir & '\chrome.log"')

	; start the driver
	_WD_Startup()
	If @error Then Return SetError(@error, @extended, 0) ; always remember to check and handle error's

	; create capabilites for session
	_WD_CapabilitiesStartup()
	_WD_CapabilitiesAdd('alwaysMatch', 'chrome')
	_WD_CapabilitiesAdd('w3c', True)
	_WD_CapabilitiesAdd('excludeSwitches', 'enable-automation')
	Local $sCapabilities = _WD_CapabilitiesGet()

	; create session with given Capabilities
	Global $sSession = _WD_CreateSession($sCapabilities)
	If @error Then Return SetError(@error, @extended, 0) ; always remember to check and handle error's

	#EndRegion ; initialize webdriver sesion

	#Region ; do your's stuff

	; navigate to some website
	Local $sURL = 'https://deltaflow.corp.ardentec.com/Deltaflow_client/MyPage/index.aspx'
	_WD_Navigate($sSession, $sURL)
	If @error Then Return SetError(@error, @extended, 0) ; always remember to check and handle error's




    _Click('//*[@id="Table2"]/tbody/tr/td[2]/a/img')

	_Click('//*[@id="ul_apply"]/li[5]/ul/li[7]/nobr/span/a')
	_Click('//*[@id="ddlType"]')
;~ 	_WD_LoadWait($sSession, 1000)
;~ 	$sElement = _WD_FindElement($sSession, $_WD_LOCATOR_ByXPath, '//*[@id="ddlType"]')
;~ 	_WD_ElementAction($sSession, $sElement, 'click')
;~ 	_WD_SendKeys($sSession, "Customer")

	
	#EndRegion ; do your's stuff

	#Region ; Clean Up

	; on the end session should be deleted
;~ 	_WD_DeleteSession($sSession)
;~ 	If @error Then Return SetError(@error, @extended, 0) ; always remember to check and handle error's

;~ 	; and driver should be closed
;~ 	_WD_Shutdown()
;~ 	If @error Then Return SetError(@error, @extended, 0) ; always remember to check and handle error's

	#EndRegion ; Clean Up

EndFunc   ;==>_Example

Func _Click(ByRef $sXPath , $var2='click')
	
	_WD_LoadWait($sSession, 1000)
	If @error Then Return SetError(@error, @extended, 0) ; always remember to check and handle err
	Local $sElement = _WD_FindElement($sSession, $_WD_LOCATOR_ByXPath, $sXPath)
	If @error Then Return SetError(@error, @extended, 0) ; always remember to check and handle error's



	; or click the element
	_WD_ElementAction($sSession, $sElement, $var2)
	
	
	
	
	
	
EndFunc