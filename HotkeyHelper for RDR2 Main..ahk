#NoEnv
#Include Create_AHKHelperGui_png.ahk ; change the name to what you need
SetBatchLines, -1
T := A_TickCount
HBITMAP := Create_AHKHelperGui_png() ; change the name to what you need
H := Bitmap_GetHeight(HBITMAP)
W := Bitmap_GetWidth(HBITMAP)
; msgbox %W%x%H%
; ----------------------------------------------------------------------------------------------------------------------
Gui, Margin, 0, 0
Gui, Add, Text, x0 y0 w%W% h%H% hwndHPic1
Bitmap_SetImage(HPic1, HBITMAP)
T := A_TickCount - T
Gui, Show, , Included Image - %T% ms
Gui, Add, Text, x0 y0 w%W% h%H% hwndHPic1
Bitmap_SetImage(HPic1, HBITMAP)
T := A_TickCount - T
Gui, Show, , Included Image - %T% ms

Gui, Add, Edit, x332 y40 w150 h180 , Hotkeys use NumberPad.  NumPad+  to HideGui Ctrl-Alt-Shift-R to Refresh.  Hold (T) for TriggerBot  Defensive mode(7)    Suicide/Respawn(8)     ChangeAppearance(9)     Moonshine/Health(4)     CocaineGum/Stamina(5)    SnakeOilII/Deadeye(6)    LargeMeal(1)               SmallMeal(2)         Cigarettes(3)                                       WARNING: Triggerbot is legit ass, Use it with Rolling Block for best results. Triggerbot must be in windowed/borderless mode. 
Gui, Add, Edit, x332 y262 w150 h100 , Simple Hotkey Menu for RDR2 Online written in AutoHotKey  .                     I made this for Legit play . Access items I use the most , Quickly Go Defensive mode and Change appearance menu and Sewerslide/Respawn to shit on griefers!    Buy all the items listed on the Hotkeys or                  RESULTS MAY VARY !  Hotkeys go to wrong items? Tap "L" Then tap "Esc" to reset inventory curser and try again.   Made by : Plumbwicked @ unknowncheats.me

; Generated using SmartGUI Creator 4.0
Gui, Show, x293 y265 h414 w480, AHKHelper for RDR2 Online
Return


; ----------------------------------------------------------------------------------------------------------------------
GuiClose:
GuiEscape:
ExitApp
; ----------------------------------------------------------------------------------------------------------------------
; Returns the width of a bitmap.
; ----------------------------------------------------------------------------------------------------------------------
Bitmap_GetWidth(hBitmap) {
   Ptr := A_PtrSize ? "Ptr" : "UInt"
   PtrSize := A_PtrSize ? A_PtrSize : 4
   Size := (4 * 5) + PtrSize + (PtrSize - 4)
   VarSetCapacity(BITMAP, Size, 0)
   DllCall("Gdi32.dll\GetObject", Ptr, hBitmap, "Int", Size, Ptr, &BITMAP, "Int")
   Return NumGet(BITMAP, 4, "Int")
}
; ----------------------------------------------------------------------------------------------------------------------
; Returns the height of a bitmap.
; ----------------------------------------------------------------------------------------------------------------------
Bitmap_GetHeight(hBitmap) {
   Ptr := A_PtrSize ? "Ptr" : "UInt"
   PtrSize := A_PtrSize ? A_PtrSize : 4
   Size := (4 * 5) + PtrSize + (PtrSize - 4)
   VarSetCapacity(BITMAP, Size, 0)
   DllCall("Gdi32.dll\GetObject", Ptr, hBitmap, "Int", Size, Ptr, &BITMAP, "Int")
   Return NumGet(BITMAP, 8, "Int")
}
; ----------------------------------------------------------------------------------------------------------------------
; Associates a new bitmap with a static control.
; Parameters:     hCtrl    -  Handle to the GUI control (Pic or Text).
;                 hBitmap  -  Handle to the bitmap to associate with the GUI control.
; Return value:   Handle to the image previously associated with the GUI control, if any; otherwise, NULL.
; ----------------------------------------------------------------------------------------------------------------------
Bitmap_SetImage(hCtrl, hBitmap) {
   ; STM_SETIMAGE = 0x172, IMAGE_BITMAP = 0x00, SS_BITMAP = 0x0E
   WinSet, Style, +0x0E, ahk_id %hCtrl%
   SendMessage, 0x172, 0x00, %hBitmap%, , ahk_id %hCtrl%
   Return ErrorLevel
}

; ----------------------------------------------------------------------------------------------------------------------
; Associates a new bitmap with Gui, Show, Hide





;-----------------------------------------NumberPad Add toggles gui


NumPadAdd::

	Toggle := !Toggle

	If Toggle

		Gui, Show, Hide

	else

		Gui, Show

Return
;================================================triggerbot ? more like tRiG3rdoOt=========================================================================
;Just a CSGO triggerbot ,Works like Rapid Fire in RDR2,  is bound to "T" , Change "T","t",  in script to whatever you want to use. 


    Threshold = 20
    ;
    *~$t::
    MouseGetPos, MouseX, MouseY
    PixelGetColor, Color1, (MouseX+2), (MouseY+2)
    StringSplit, Colorz, Color1
    Color1B = 0x%Colorz3%%Colorz4%
    Color1G = 0x%Colorz5%%Colorz6%
    Color1R = 0x%Colorz7%%Colorz8%
    Color1B += 0
    Color1G += 0
    Color1R += 0
     
    while (GetKeyState("t", "P"))
        {
            BlockInput, MouseMove
            sleep 1
            MouseGetPos, MouseX, MouseY
            PixelGetColor, Color2, (MouseX+2), (MouseY+2)
            StringSplit, Colorz, Color2
            Color2B = 0x%Colorz3%%Colorz4%
            Color2G = 0x%Colorz5%%Colorz6%
            Color2R = 0x%Colorz7%%Colorz8%
            Color2B += 0
            Color2G += 0
            Color2R += 0
            if (Color1R > (Color2R + Threshold)) or (Color1R < (Color2R - Threshold)) or (Color1G > (Color2G + Threshold)) or (Color1G < (Color2G - Threshold)) or (Color1B > (Color2B + Threshold)) or (Color1B < (Color2B - Threshold))
                {
                    send {LButton}
                }
        }
    BlockInput, MouseMoveOff
    Return
     
	

;-----------------------------------------------------hOTKEYS

; RDR2 Online macros to apply armor, eat a snack or toggle passive.

; Basic settings and such for AHK



#SingleInstance force
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode, 2 ; Necessary to match on the name of the window instead of window class in IfWinActive.

; shift+control+alt+r becomes a hotkey to reload this script. For me it is necessary to
; reload it after starting the game - with the hotkey I can do it without ever going to 
; the desktop. Please note if you have any other program that uses this particular long
; key combo this will replace it througout your Windows.

+^!r::Reload ; Assign Shift-Ctrl-Alt-R as a hotkey to restart the script.
	Sleep 1000 ; If successful, the reload will close this instance during the Sleep, so the line below will never be reached. 
	MsgBox, 4,, The script could not be reloaded. Would you like to open it for editing? 
	IfMsgBox, Yes, Edit 
return

; Red Dead Redemption 2 / Online specific macros begin here. Everything below the IfWinActive statement
; only happens if the RDR window is open and on top.

#IfWinActive Red Dead Redemption 2 

; Why all these manual pauses and explicitly specifying both button press and button release,
; when I could be using SetKeyDelay? Because I couldn't get SetKeyDelay to work reliably in
; RDR2O. This may be ugly, but if it's ugly and works perfectly its good enough for me. 

; I made the steps into gosubs, just to make the actual macros below more readable and easy
; to edit. If your computer can handle even faster menu interaction, change the 60 in the 
; Sleep statements to 50 or less. You'll probably start seeing lower reliability.

Left:
	Send {Left down}
	Sleep, 100
	Send {Left up}
	Sleep, 100
Return     

Right:
	Send {Right down}
	Sleep, 100
	Send {Right up}
	Sleep, 100
Return     
l:
	Send {l down}
	Sleep, 100
	Send {l up}
	Sleep, 100
        
Return     

q:
	Send {q down}
	Sleep, 100
	Send {q up}
	Sleep, 100
Return     
e:
	Send {e down}
	Sleep, 100
	Send {e up}
	Sleep, 100
Return     


Down:
	Send {Down down}
	Sleep, 100
	Send {Down up}
	Sleep, 100
Return

Up:
	Send {Up down}
	Sleep, 100
	Send {Up up}
	Sleep, 100
Return

Enter:
	Send {Enter down}
	Sleep, 100
	Send {Enter up}
	Sleep, 100
Return



Esc:
	Send {Esc down}
	Sleep, 100
	Send {Esc up}
	Sleep, 100
        Send {Esc down}
	Sleep, 100
	Send {Esc up}
	Sleep, 100
Return



Menu:
	Send {b down}
	Sleep, 1000
	Send {b up}
Return

; I use the 0 key on the numpad, the dot on the numpad and the + on the numpad to 
; activate these macros. see https://www.autohotkey.com/docs/KeyList.htm if you need
; to find other keys. Also note that these don't work inside apartments or in any situation
; where the menu changes, like when you become a VIP.


Numpad4:: ; Moonshine
	Gosub, Menu
	Sleep, 250		; Extra long sleep just to make sure the menu has time to appear properly.
	Gosub, e
	Gosub, e
	Gosub, Down
	Gosub, Right
        Gosub, Right
        Gosub, Right
	Gosub, Enter
	Gosub, Menu
return

Numpad5:: ; Cocaine Gum
	Gosub, Menu
	Sleep, 250		; Extra long sleep just to make sure the menu has time to appear properly.
	Gosub, e
	Gosub, e
	Gosub, Down
	Gosub, Down
	Gosub, Down
        Gosub, Right
	Gosub, Enter
	Gosub, Menu
return
Numpad6:: ; Tonic Snake oil II
	Gosub, Menu
	Sleep, 250		; Extra long sleep just to make sure the menu has time to appear properly.
	Gosub, e
	Gosub, e
	Gosub, Down
	Gosub, Down
	Gosub, Down
        Gosub, Down
	Gosub, Enter
	Gosub, Menu
return

Numpad1:: ; Meal Plain Venison
	Gosub, Menu
	Sleep, 250
	Gosub, e
	Gosub, Right
	Gosub, Enter
	Gosub, Down
	Gosub, Down
	Gosub, Enter
return
Numpad2:: ; Cigs
	Gosub, Menu
	Sleep, 250
	Gosub, e
	Gosub, Up
	Gosub, Left
	
	Gosub, Enter
return
Numpad3:: ; Meal Plain 
	Gosub, Menu
	Sleep, 250
	Gosub, e
	
	Gosub, Down
	Gosub, Enter
Gosub, Enter
return
Numpad7:: ; Defensive mode
	Gosub, l
	Sleep, 250
	Gosub, Up
	Gosub, Enter
        Gosub, Up
        Gosub, Up
        Gosub, Up
Gosub, Up
Gosub, Right
    Sleep, 250
        Sleep, 250
        Gosub, Esc
        Gosub, Esc
return

Numpad8:: ; Respawn
	Gosub, l
	Sleep, 250		; Extra long sleep just to make sure the menu has time to appear properly.
	Gosub, Up
	Gosub, Enter
        Sleep, 350
        Gosub, Enter
	Send {Enter down}
	Sleep, 3000
	Send {Enter up}
        Send {LButton down}
	Sleep, 1000
	Send {LButton up}
	
return

Numpad9:: ; Change apperance menu
	Gosub, l
	Sleep, 250
	Gosub, Up
	Gosub, Enter
        Sleep, 250
        Gosub, Up
	Send {Enter down}
	Sleep, 3000
	Send {Enter up}
        Gosub, Enter
        Send {Enter down}
	Sleep, 3000
	Send {Enter up}
	
	
return





#IfWinActive



















