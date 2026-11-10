Set shell = CreateObject("WScript.Shell")
Set fileSystem = CreateObject("Scripting.FileSystemObject")

scriptPath = fileSystem.BuildPath(fileSystem.GetParentFolderName(WScript.ScriptFullName), "Laucnher ( use if other dossent work ).py")
pythonwPath = shell.ExpandEnvironmentStrings("%LOCALAPPDATA%\Python\bin\pythonw.exe")

If Not fileSystem.FileExists(scriptPath) Then
    MsgBox "Could not find the launcher script:" & vbCrLf & scriptPath, vbCritical, "Launcher not found"
    WScript.Quit 1
End If

If Not fileSystem.FileExists(pythonwPath) Then
    MsgBox "Could not find pythonw.exe:" & vbCrLf & pythonwPath, vbCritical, "Python not found"
    WScript.Quit 1
End If

shell.Run """" & pythonwPath & """ """ & scriptPath & """", 0, False
