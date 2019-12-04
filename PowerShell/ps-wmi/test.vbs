Pic  = GetWinPic()
Path = GetRunPath()+"\snap.jpg"
If WriteFile(Path,Pic) Then
	MsgBox "success!!!"
End If

