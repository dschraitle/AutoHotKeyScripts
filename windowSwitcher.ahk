SetTitleMatchMode, RegEx
WindowTitle = ""
WindowList = ""

^!Tab::
tempo=
Gosub getWindows
Gui, +AlwaysOnTop
Gui, Add, Text, vWindowList h200 w600, %r%
Gui, Add, Edit, vWindowTitle gupdateList
GuiControl, Focus, vWindowTitle
Gui, Add, Button, default, OK  
Gui, Show
return

ButtonOK:
Gui, Submit
Gui, Destroy
If WinExist( "i)" . WindowTitle) 
{
}
else
  MsgBox Nope

WinActivate % "i)". WindowTitle

GuiEscape:
Gui, Cancel
Gui, Destroy
return

updateList:
GuiControlGet, tempo,, WindowTitle
Gosub, getWindows

GuiControl, Text, WindowList, %r%
return

getWindows:
WinGet windows, List, i)%tempo%
r = 
Loop %windows%
{
	id := windows%A_Index%
	WinGetTitle wt, ahk_id %id%
	r .= wt . "`n"
}
return

$Esc::
IfWinActive ahk_class IMWindowClass
{
  MsgBox, 1,, Do you want to hit escape?
  IfMsgBox, OK
  {}
  else
    return
}
Send {Esc}
return
