Strict

Public

' Imports (Native):
Import "native/windowtest.${TARGET}.${LANG}"

' Extenal bindings:
Extern

' Functions:
Function SetWindowPosition:Void(X:Int, Y:Int)="windowtest::setWindowPosition"
Function GetMonitorCanvas:Void(Output:Int[], MinimumHeight:Bool=False)="windowtest::getMonitorCanvas"
Function GetMonitorCanvas:Int[](MinimumHeight:Bool=False)="windowtest::getMonitorCanvas"

Public