Attribute VB_Name = "Module1"
Sub GenerateTypescriptConstants()
    Dim sheet As Worksheet
    Set sheet = ActiveSheet
    
    Dim constantName As String
    Dim constantValue As String
    
    Dim output As String
    output = "export const Constants = {" & vbCrLf
    
    Dim row As Integer
    For row = 2 To sheet.UsedRange.Rows.Count
        constantName = sheet.Cells(row, 1).Value
        constantValue = sheet.Cells(row, 2).Value
        
        output = output & "  " & constantName & ": """ & constantValue & """," & vbCrLf
    Next row
    
    output = output & "};"
    
    Dim newSheet As Worksheet
    Set newSheet = Sheets.Add(After:=sheet)
    newSheet.Name = "Typescript Constants"
    
    newSheet.Range("A1").Value = output
    newSheet.Columns("A").AutoFit
    
    MsgBox "Typescript constants generated successfully.", vbInformation, "Success"
End Sub

