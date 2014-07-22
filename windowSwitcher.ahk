SetTitleMatchMode, RegEx
WindowTitle = ""

^!Tab::
Gui, +AlwaysOnTop
Gui, Add, ComboBox, vWindowTitle
GuiControl, Focus, vWindowTitle
Gui, Add, Button, default, OK  
Gui, Show
return

ButtonOK:
Gui, Submit
Gui, Destroy
If WinExist( "i)" . WindowTitle) 
{
;  MsgBox % TheWindow . ":". WinExist( "i)" . TheWindow)
}
else
  MsgBox Nope

WinActivate % "i)". WindowTitle

GuiEscape:
Gui, Cancel
