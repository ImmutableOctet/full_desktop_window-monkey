Strict

Public

' Preprocessor related:
#If GLFW_VERSION < 3 Or TARGET <> "glfw" Or LANG <> "cpp"
	#Error "This example only works using GLFW3."
#End

' Configuration:
#GLFW_WINDOW_TITLE = "Invisible"
#GLFW_WINDOW_WIDTH = 0
#GLFW_WINDOW_HEIGHT = 0
#GLFW_WINDOW_SAMPLES = 0
#GLFW_WINDOW_RESIZABLE = False
#GLFW_WINDOW_DECORATED = False
#GLFW_WINDOW_FLOATING = False
#GLFW_WINDOW_FULLSCREEN = False

'#GLFW_SWAP_INTERVAL=-1

' Imports:
Import mojo

Import windowtest

' Classes:
Class Application Extends App Final
	' Constructor(s):
	Method OnCreate:Int()
		SetUpdateRate(0) ' 60
		
		Local Desktop:= windowtest.GetMonitorCanvas()
		
		SetDeviceWindow(Desktop[2], Desktop[3], 0)
		
		windowtest.SetWindowPosition(Desktop[0], Desktop[1])
		
		' Return the default response.
		Return 0
	End
	
	' Methods:
	Method OnUpdate:Int()
		If (KeyHit(KEY_ESCAPE)) Then
			OnClose()
			
			Return 0
		Endif
		
		Color = (Sin(Float(Millisecs()/10)) * 255.0)
		
		' Return the default response.
		Return 0
	End
	
	Method OnRender:Int()
		Cls(Color, 0.0, 0.0)
		
		' Return the default response.
		Return 0
	End
	
	' Fields:
	Field Color:Float
End

' Functions:
Function Main:Int()
	New Application()
	
	' Return the default response.
	Return 0
End