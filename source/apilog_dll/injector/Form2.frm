VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Begin VB.Form Form2 
   Caption         =   "ApiLogger"
   ClientHeight    =   7665
   ClientLeft      =   165
   ClientTop       =   450
   ClientWidth     =   10335
   Icon            =   "Form2.frx":0000
   LinkTopic       =   "Form2"
   ScaleHeight     =   7665
   ScaleWidth      =   10335
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdBrowse 
      Caption         =   "..."
      Height          =   315
      Index           =   1
      Left            =   6240
      TabIndex        =   36
      Top             =   720
      Width           =   615
   End
   Begin VB.CommandButton cmdParse 
      Caption         =   "Parse"
      Height          =   375
      Left            =   2400
      TabIndex        =   35
      Top             =   3720
      Width           =   1005
   End
   Begin MSComctlLib.ListView lvProc 
      Height          =   1365
      Left            =   3240
      TabIndex        =   31
      Top             =   1950
      Width           =   4125
      _ExtentX        =   7276
      _ExtentY        =   2408
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      FullRowSelect   =   -1  'True
      GridLines       =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   4
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "pid"
         Object.Width           =   1235
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "Process"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Text            =   "Status"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   3
         Key             =   "reconfig"
         Text            =   "Config Handler"
         Object.Width           =   2540
      EndProperty
   End
   Begin VB.ListBox List2 
      Height          =   1425
      Left            =   120
      TabIndex        =   34
      Top             =   2160
      Width           =   7335
   End
   Begin MSComctlLib.TabStrip TabStrip1 
      Height          =   1875
      Left            =   30
      TabIndex        =   33
      Top             =   1830
      Width           =   7515
      _ExtentX        =   13256
      _ExtentY        =   3307
      _Version        =   393216
      BeginProperty Tabs {1EFB6598-857C-11D1-B16A-00C0F0283628} 
         NumTabs         =   2
         BeginProperty Tab1 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Processes"
            ImageVarType    =   2
         EndProperty
         BeginProperty Tab2 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
            Caption         =   "Log"
            ImageVarType    =   2
         EndProperty
      EndProperty
   End
   Begin VB.CommandButton cmdSave 
      Caption         =   "Save"
      Height          =   375
      Left            =   4950
      TabIndex        =   32
      Top             =   3720
      Width           =   1335
   End
   Begin MSComctlLib.ListView lv 
      Height          =   3585
      Left            =   90
      TabIndex        =   30
      Top             =   4140
      Width           =   10185
      _ExtentX        =   17965
      _ExtentY        =   6324
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      FullRowSelect   =   -1  'True
      GridLines       =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   3
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "pid"
         Object.Width           =   1235
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "msg"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Text            =   "Count"
         Object.Width           =   2540
      EndProperty
   End
   Begin VB.CommandButton cmdFind 
      Caption         =   "Find"
      Height          =   375
      Left            =   3510
      TabIndex        =   29
      Top             =   3720
      Width           =   1305
   End
   Begin VB.CommandButton cmdClear 
      Caption         =   "Clear"
      Height          =   375
      Left            =   6420
      TabIndex        =   27
      Top             =   3720
      Width           =   1215
   End
   Begin VB.CommandButton cmdBrowse 
      Caption         =   "..."
      Height          =   315
      Index           =   0
      Left            =   4980
      TabIndex        =   25
      Top             =   30
      Width           =   615
   End
   Begin VB.CommandButton cmdSelectProcess 
      Caption         =   "PID"
      Height          =   315
      Left            =   5640
      TabIndex        =   24
      Top             =   30
      Width           =   555
   End
   Begin VB.CommandButton Command4 
      Caption         =   "Re-Apply"
      Height          =   315
      Left            =   6240
      TabIndex        =   16
      Top             =   1440
      Width           =   1305
   End
   Begin VB.Frame Frame1 
      Caption         =   " Api Startup Logging Options "
      Height          =   4065
      Left            =   7650
      TabIndex        =   14
      Top             =   60
      Width           =   2565
      Begin VB.CheckBox chkIgnoreExitProcess 
         Caption         =   "Ignore ExitProcess"
         Height          =   315
         Left            =   180
         TabIndex        =   28
         Top             =   3540
         Width           =   2055
      End
      Begin VB.CheckBox chkBlockDebugControl 
         Caption         =   "Block NtSystemDebugCtl"
         Height          =   285
         Left            =   180
         TabIndex        =   26
         Top             =   3210
         Width           =   2085
      End
      Begin VB.CheckBox Check3 
         Caption         =   "Capture UrlDownload*"
         Enabled         =   0   'False
         Height          =   285
         Left            =   180
         TabIndex        =   23
         Top             =   2880
         Width           =   1965
      End
      Begin VB.CheckBox Check2 
         Caption         =   "Capture send/recv bufs"
         Enabled         =   0   'False
         Height          =   255
         Left            =   180
         TabIndex        =   22
         Top             =   2550
         Width           =   1995
      End
      Begin VB.CheckBox Check1 
         Caption         =   "Advance Time Checks"
         Enabled         =   0   'False
         Height          =   315
         Left            =   180
         TabIndex        =   21
         Top             =   2160
         Width           =   2145
      End
      Begin VB.CheckBox chkAdvanceGetTick 
         Caption         =   "Advance GetTickCount"
         Height          =   315
         Left            =   180
         TabIndex        =   20
         Top             =   1770
         Width           =   2205
      End
      Begin VB.CheckBox chkBlockOpenProcess 
         Caption         =   "Block OpenProcess"
         Height          =   345
         Left            =   180
         TabIndex        =   19
         Top             =   1380
         Width           =   1935
      End
      Begin VB.CheckBox chkNoRegistry 
         Caption         =   "No Registry Hooks"
         Height          =   285
         Left            =   180
         TabIndex        =   18
         Top             =   1020
         Width           =   1845
      End
      Begin VB.CheckBox chkNoGetProc 
         Caption         =   "No GetProcAddress"
         Height          =   285
         Left            =   180
         TabIndex        =   17
         Top             =   660
         Width           =   1725
      End
      Begin VB.CheckBox chkIgnoreSleep 
         Caption         =   "Ignore Long Sleeps"
         Height          =   315
         Left            =   180
         TabIndex        =   15
         Top             =   300
         Width           =   2055
      End
   End
   Begin VB.TextBox txtArgs 
      Height          =   315
      Left            =   1020
      OLEDropMode     =   1  'Manual
      TabIndex        =   13
      Top             =   360
      Width           =   5145
   End
   Begin VB.TextBox txtIgnore 
      Height          =   315
      Left            =   1020
      TabIndex        =   11
      ToolTipText     =   "comma seperate value list of strings to ignore logging of"
      Top             =   1410
      Width           =   5115
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Stop Logging"
      Height          =   375
      Left            =   1020
      TabIndex        =   9
      Top             =   3720
      Width           =   1245
   End
   Begin VB.CommandButton cmdContinue 
      Caption         =   "Continue"
      Enabled         =   0   'False
      Height          =   315
      Left            =   6240
      TabIndex        =   8
      Top             =   1080
      Width           =   1305
   End
   Begin VB.TextBox txtDumpAt 
      Height          =   285
      Left            =   1020
      TabIndex        =   6
      Top             =   1050
      Width           =   5145
   End
   Begin VB.TextBox txtDll 
      Height          =   285
      Left            =   1020
      OLEDropMode     =   1  'Manual
      TabIndex        =   5
      Top             =   720
      Width           =   5145
   End
   Begin VB.CommandButton cmdStart 
      Caption         =   "Inject && Log"
      Height          =   315
      Left            =   6240
      TabIndex        =   2
      Top             =   30
      Width           =   1335
   End
   Begin VB.TextBox txtPacked 
      Height          =   315
      Left            =   1020
      OLEDropMode     =   1  'Manual
      TabIndex        =   1
      Top             =   0
      Width           =   3885
   End
   Begin VB.Label Label7 
      Caption         =   "Args"
      Height          =   285
      Left            =   60
      TabIndex        =   12
      Top             =   360
      Width           =   945
   End
   Begin VB.Label Label6 
      Caption         =   "Ignore (Slow)"
      Height          =   285
      Left            =   30
      TabIndex        =   10
      Top             =   1470
      Width           =   975
   End
   Begin VB.Label Label5 
      Caption         =   "Freeze At"
      Height          =   255
      Left            =   60
      TabIndex        =   7
      Top             =   1110
      Width           =   915
   End
   Begin VB.Label Label3 
      Caption         =   "Inject DLL"
      Height          =   315
      Left            =   60
      TabIndex        =   4
      Top             =   750
      Width           =   975
   End
   Begin VB.Label Label2 
      Caption         =   "API Call Log"
      Height          =   255
      Left            =   60
      TabIndex        =   3
      Top             =   3870
      Width           =   1035
   End
   Begin VB.Label Label1 
      Caption         =   "Executable"
      Height          =   255
      Left            =   60
      TabIndex        =   0
      Top             =   60
      Width           =   975
   End
   Begin VB.Menu mnuPopup 
      Caption         =   "mnuPopup"
      Visible         =   0   'False
      Begin VB.Menu mnuFind 
         Caption         =   "Find"
      End
   End
   Begin VB.Menu mnuProcess 
      Caption         =   "Process"
      Visible         =   0   'False
      Begin VB.Menu mnuSuspend 
         Caption         =   "Suspend"
      End
      Begin VB.Menu mnuResume 
         Caption         =   "Resume"
      End
      Begin VB.Menu mnuTerminate 
         Caption         =   "Terminate"
      End
      Begin VB.Menu mnuClearPidList 
         Caption         =   "Clear"
      End
      Begin VB.Menu mnuUpdateConfig 
         Caption         =   "Update Config"
      End
      Begin VB.Menu mnuUpdateAll 
         Caption         =   "Update All"
      End
      Begin VB.Menu mnuKillAll 
         Caption         =   "Kill All"
      End
   End
   Begin VB.Menu mnuCaptures 
      Caption         =   "mnuCaptures"
      Visible         =   0   'False
      Begin VB.Menu mnuLoadSampleApiLog 
         Caption         =   "Load Saved ApiLog"
      End
   End
End
Attribute VB_Name = "Form2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

'License:   GPL
'Copyright: 2005 iDefense a Verisign Company
'Site:      http://labs.idefense.com
'
'Author:    David Zimmer <david@idefense.com, dzzie@yahoo.com>
'
'         This program is free software; you can redistribute it and/or modify it
'         under the terms of the GNU General Public License as published by the Free
'         Software Foundation; either version 2 of the License, or (at your option)
'         any later version.
'
'         This program is distributed in the hope that it will be useful, but WITHOUT
'         ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
'         FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
'         more details.
'
'         You should have received a copy of the GNU General Public License along with
'         this program; if not, write to the Free Software Foundation, Inc., 59 Temple
'         Place, Suite 330, Boston, MA 02111-1307 USA

Private Type PROCESS_INFORMATION
   hProcess As Long
   hThread As Long
   dwProcessId As Long
   dwThreadId As Long
End Type

Private Type STARTUPINFO
        cb As Long
        lpReserved As String
        lpDesktop As String
        lpTitle As String
        dwX As Long
        dwY As Long
        dwXSize As Long
        dwYSize As Long
        dwXCountChars As Long
        dwYCountChars As Long
        dwFillAttribute As Long
        dwFlags As Long
        wShowWindow As Integer
        cbReserved2 As Integer
        lpReserved2 As Long
        hStdInput As Long
        hStdOutput As Long
        hStdError As Long
End Type

Private Enum ProcessAccessTypes
    PROCESS_TERMINATE = (&H1)
    PROCESS_CREATE_THREAD = (&H2)
    PROCESS_SET_SESSIONID = (&H4)
    PROCESS_VM_OPERATION = (&H8)
    PROCESS_VM_READ = (&H10)
    PROCESS_VM_WRITE = (&H20)
    PROCESS_DUP_HANDLE = (&H40)
    PROCESS_CREATE_PROCESS = (&H80)
    PROCESS_SET_QUOTA = (&H100)
    PROCESS_SET_INFORMATION = (&H200)
    PROCESS_QUERY_INFORMATION = (&H400)
    STANDARD_RIGHTS_REQUIRED = &HF0000
    SYNCHRONIZE = &H100000
    PROCESS_ALL_ACCESS = (STANDARD_RIGHTS_REQUIRED Or SYNCHRONIZE Or &HFFF)
End Enum

Private Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)
Private Declare Function OpenProcess Lib "kernel32" (ByVal dwDesiredAccess As Long, ByVal bInheritHandle As Long, ByVal dwProcessId As Long) As Long
Private Declare Function WriteProcessMemory Lib "kernel32" (ByVal hProcess As Long, lpBaseAddress As Long, lpBuffer As Any, ByVal nSize As Long, lpNumberOfBytesWritten As Long) As Long
Private Declare Function CreateRemoteThread Lib "kernel32" (ByVal ProcessHandle As Long, lpThreadAttributes As Long, ByVal dwStackSize As Long, ByVal lpStartAddress As Any, ByVal lpParameter As Any, ByVal dwCreationFlags As Long, lpThreadID As Long) As Long
Private Declare Function GetModuleHandle Lib "kernel32" Alias "GetModuleHandleA" (ByVal lpModuleName As String) As Long
Private Declare Function GetProcAddress Lib "kernel32" (ByVal hModule As Long, ByVal lpProcName As String) As Long
Private Declare Function VirtualAllocEx Lib "kernel32" (ByVal hProcess As Long, lpAddress As Any, ByVal dwSize As Long, ByVal fAllocType As Long, FlProtect As Long) As Long
Private Declare Function CreateProcess Lib "kernel32" Alias "CreateProcessA" (ByVal lpApplicationName As Long, ByVal lpCommandLine As String, ByVal lpProcessAttributes As Long, ByVal lpThreadAttributes As Long, ByVal bInheritHandles As Long, ByVal dwCreationFlags As Long, ByVal lpEnvironment As Long, ByVal lpCurrentDriectory As Long, lpStartupInfo As STARTUPINFO, lpProcessInformation As PROCESS_INFORMATION) As Long
Private Declare Function ResumeThread Lib "kernel32" (ByVal hThread As Long) As Long
Private Declare Sub DebugBreak Lib "kernel32" ()
Private Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long
Private Declare Function GetTickCount Lib "kernel32" () As Long
Private Declare Function TerminateProcess Lib "kernel32" (ByVal hProcess As Long, ByVal uExitCode As Long) As Long
Private Declare Function NtSuspendProcess Lib "ntdll.dll" (ByVal hProc As Long) As Long
Private Declare Function NtResumeProcess Lib "ntdll.dll" (ByVal hProc As Long) As Long



'I used my subclass library for simplicity, you can use whatever sub
'class technique or inline code you desire...
Dim WithEvents sc As CSubclass2
Attribute sc.VB_VarHelpID = -1
Public dlg As New clsCmnDlg
Public fso As New CFileSystem2

Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (hpvDest As Any, hpvSource As Any, ByVal cbCopy As Long)
Private Const WM_COPYDATA = &H4A
Private Const WM_DISPLAY_TEXT = 3

Private Type COPYDATASTRUCT
    dwFlag As Long
    cbSize As Long
    lpData As Long
End Type

Dim cpi As New CProcessInfo

Dim noLog As Boolean
Dim readyToReturn As Boolean
Dim ignored() As String
Dim getTickIncrements As Long
Dim liProc As ListItem
Dim lastPid As String
Dim lastMsg As String

'todo: parse incoming api to: handles -> process/file/socket mapping..,
'                             capture downloads
'                             capture send/recv bufs
'                             switch list to listview to capture more like bufs in .tag
'          capture incoming ***config:handler:1000119f to do on the fly reconfigs with CreateRemoteProcess..

Function AryIsEmpty(ary) As Boolean
  On Error GoTo oops
    Dim i As Long
    i = UBound(ary)  '<- throws error if not initalized
    AryIsEmpty = False
  Exit Function
oops: AryIsEmpty = True
End Function

Function AddPid(hex_pid As String)
    Dim li As ListItem
    Dim pid As Long
    On Error Resume Next
    pid = CLng("&h" & hex_pid)
    
    For Each li In lv.ListItems
        If li.Tag = pid Then Exit Function
    Next
    
    Set li = lv.ListItems.Add(, , hex_pid)
    li.SubItems(1) = fso.FileNameFromPath(cpi.GetProcessPath(pid))
    li.Tag = pid
End Function

Function ignoreit(v) As Boolean
    Dim i As Long
    
    If AryIsEmpty(ignored) Then Exit Function
    
    For i = 0 To UBound(ignored)
        If Len(Trim(ignored(i))) > 0 Then
            If InStr(1, v, ignored(i), vbTextCompare) Then
                ignoreit = True
                Exit Function
            End If
        End If
    Next
    
End Function


Private Sub cmdBrowse_Click(Index As Integer)
    Dim f As String
    f = dlg.OpenDialog(AllFiles, , "Open Executable to monitor", Me.hwnd)
    If Len(f) = 0 Then Exit Sub
    If Index = 0 Then
        txtPacked = f
    Else
        txtDll = f
    End If
End Sub

Private Sub cmdClear_Click()
    lv.ListItems.Clear
End Sub

Private Sub cmdContinue_Click()
    readyToReturn = True
End Sub

 

Private Sub cmdFind_Click()
    Dim f As String
    Dim t As String, i As Long
    On Error Resume Next
    f = InputBox("Enter string to find in log:")
    If Len(f) = 0 Then Exit Sub
    For i = 1 To lv.ListItems.Count
        If InStr(1, lv.ListItems(i).SubItems(1), f, vbTextCompare) > 0 Then
            t = t & "pid: " & lv.ListItems(i).Text & " - " & lv.ListItems(i).SubItems(1) & vbCrLf
        End If
    Next
    Dim fso As New CFileSystem2
    f = fso.GetFreeFileName(Environ("temp"))
    fso.writeFile f, t
    Shell "notepad.exe """ & f & """", vbNormalFocus
End Sub

Private Sub cmdParse_Click()
    
    On Error Resume Next
    Dim i As Long, t, f As String
    Dim li As ListItem
    
    For Each li In lv.ListItems
        t = t & "pid: " & li.Text & " - " & li.SubItems(1) & vbCrLf
    Next
    
    frmLogParser.LoadSampleApiLog CStr(t)
    
End Sub

Private Sub cmdSave_Click()
    On Error Resume Next
    Dim i As Long, t, f As String
    Dim li As ListItem
    
    f = dlg.SaveDialog(textFiles, , , , Me.hwnd)
    If Len(f) = 0 Then Exit Sub
    
    For Each li In lv.ListItems
        t = t & "pid: " & li.Text & " - " & li.SubItems(1) & vbCrLf
    Next
    
    fso.writeFile f, t
    
End Sub

Private Sub cmdSelectProcess_Click()
    Dim cp As CProcess
    Set cp = frmListProcess.SelectProcess(cpi.GetRunningProcesses)
    If Not cp Is Nothing Then
        txtPacked = "pid:" & cp.pid
    End If
End Sub

Private Sub cmdStart_Click()
        
    Dim exe As String
    Dim isX64 As Boolean
    Dim x As String, tmp, y
    
    On Error GoTo hell
    
    lv.ListItems.Clear
    List2.Clear
    Erase ignored
    
    If Len(txtIgnore) > 0 Then
        ignored = Split(txtIgnore, ",")
    End If
    
    If VBA.Left(txtPacked, 4) = "pid:" Then
        exe = Replace(txtPacked, "pid:", Empty)
        If cpi.x64.IsProcess_x64(CLng(exe)) = r_64bit Then isX64 = True
    Else
        If Not FileExists(txtPacked) Then
            MsgBox "Executable not found"
            Exit Sub
        End If
        If cpi.x64.isExe_x64(txtPacked) = r_64bit Then isX64 = True
        exe = txtPacked
    End If
    
    If Not FileExists(txtDll) Then
        MsgBox "Dll To inject not found"
        Exit Sub
    End If
    
    If isX64 Then
        If cpi.x64.isExe_x64(txtDll) <> r_64bit Then
            MsgBox "You can not inject a 32 bit dll into a 64 bit process.", vbInformation
            Exit Sub
        End If
    End If
    
    If isX64 Then
    
        If IsNumeric(exe) Then
            If Not cpi.x64.x64Inject(CLng(exe), txtDll, x) Then
                MsgBox x
                Exit Sub
            End If
        Else
            'dont forget the args too...
            MsgBox "Starting an x64 bit processes with a dll is not yet supported.", vbInformation
            Exit Sub
        End If
        
        tmp = Split(x, vbCrLf)
        List2.Clear
        For Each y In tmp
           List2.AddItem y
        Next
        
        Exit Sub
        
    End If
    
    If Len(txtArgs) > 0 Then exe = exe & " " & txtArgs
    StartProcessWithDLL exe, txtDll
    
    Exit Sub
hell:
    MsgBox "Error: " & Err.Description
    
End Sub

 

 

Private Sub Command1_Click()
    
    If InStr(Command1.Caption, "Stop") > 0 Then
        noLog = True
        Command1.Caption = "Resume Logging"
    Else
        noLog = False
        Command1.Caption = "Stop Logging"
    End If
    
End Sub



Private Sub Command4_Click()
    Dim i As Long
    Dim li As ListItem
    Erase ignored
    If Len(txtIgnore) > 0 Then
        ignored = Split(txtIgnore, ",")
    End If
    For i = lv.ListItems.Count To 1 Step -1
        If ignoreit(lv.ListItems(i).SubItems(1)) Then
            lv.ListItems.Remove i
        End If
    Next
End Sub



Private Sub Form_Load()
    
    With List2
        lvProc.Move .Left, .Top, .Width, .Height
        .Visible = False
    End With
    
    Set sc = New CSubclass2
    
    sc.AttachMessage Me.hwnd, WM_COPYDATA
    
    Dim defaultdll, defaultexe
    
    If isIde() Then defaultexe = App.path & "\..\..\..\safe_test1.exe"
    defaultdll = App.path & IIf(isIde(), "\..\..\..", "") & "\api_log.dll"
    If FileExists(defaultdll) Then txtDll = defaultdll
    If FileExists(defaultexe) Then txtPacked = defaultexe
    
    txtIgnore = GetMySetting("Ignore", "")
    
    If Len(Command) > 0 Then
        txtPacked = Replace(Command, """", Empty)
    End If
    
End Sub

Function isIde() As Boolean
    On Error Resume Next
    Debug.Print 1 / 0
    isIde = (Err.Number <> 0)
End Function

Private Sub Form_Resize()
    On Error Resume Next
    lv.Width = Me.Width - lv.Left - 200
    lv.Height = Me.Height - lv.Top - 500
    lv.ColumnHeaders(2).Width = lv.Width - lv.ColumnHeaders(2).Left - lv.ColumnHeaders(3).Width - 200
End Sub

Private Sub Form_Unload(Cancel As Integer)
    SaveMySetting "Ignore", txtIgnore
End Sub

Private Sub lv_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
    If Button = 2 Then PopupMenu mnuPopup
End Sub

Private Sub lvProc_ItemClick(ByVal Item As MSComctlLib.ListItem)
    Set liProc = Item
End Sub

Private Sub lvProc_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
   ' mnuLoadSampleApiLog.Visible = isIde()
    If Button = 2 Then PopupMenu mnuProcess
End Sub

Private Sub mnuClearPidList_Click()
    lvProc.ListItems.Clear
End Sub

Private Sub mnuKillAll_Click()
    On Error Resume Next
    Dim pid As Long
    Dim li As ListItem
    For Each li In lvProc.ListItems
        pid = CLng("&h" & li.Text)
        cpi.TerminateProces pid
    Next
End Sub

Private Sub mnuResume_Click()
    On Error Resume Next
    Dim pid As Long, hProcess As Long
    If liProc Is Nothing Then Exit Sub
    pid = CLng("&h" & liProc.Text)
    If Err.Number = 0 Then
         hProcess = OpenProcess(PROCESS_ALL_ACCESS, False, pid)
         List2.AddItem "NtResumeProcess(" & Hex(hProcess) & ") = " & NtResumeProcess(hProcess)
         List2.ListIndex = List2.ListCount - 1
         CloseHandle (hProcess)
    End If
End Sub

Private Sub mnuSuspend_Click()
    On Error Resume Next
    Dim pid As Long, hProcess As Long
    If liProc Is Nothing Then Exit Sub
    pid = CLng("&h" & liProc.Text)
    If Err.Number = 0 Then
         hProcess = OpenProcess(PROCESS_ALL_ACCESS, False, pid)
         List2.AddItem "NtSuspendProcess(" & Hex(hProcess) & ") = " & NtSuspendProcess(hProcess)
         List2.ListIndex = List2.ListCount - 1
         CloseHandle (hProcess)
    End If
End Sub

Private Sub mnuTerminate_Click()
    On Error Resume Next
    Dim pid As Long, hProcess As Long
    If liProc Is Nothing Then Exit Sub
    pid = CLng("&h" & liProc.Text)
    If Err.Number = 0 Then
         hProcess = OpenProcess(PROCESS_ALL_ACCESS, False, pid)
         List2.AddItem "TerminateProcess(" & Hex(hProcess) & ") = " & TerminateProcess(hProcess, 1)
         List2.ListIndex = List2.ListCount - 1
         CloseHandle (hProcess)
    End If
End Sub

Private Sub mnuUpdateAll_Click()
    On Error Resume Next
    Dim pid As Long, hProcess As Long, handler As Long, hThread As Long, arg As Long
    Dim li As ListItem
    For Each li In lvProc.ListItems
        pid = CLng("&h" & li.Text)
        handler = CLng("&h" & li.SubItems(3))
        If handler <> 0 And Err.Number = 0 Then
            hProcess = OpenProcess(PROCESS_ALL_ACCESS, False, pid)
            List2.AddItem "UpdateConfig(" & Hex(hProcess) & "," & Hex(handler) & ") = " & CreateRemoteThread(hProcess, ByVal 0, 0, handler, arg, 0, hThread)
            List2.ListIndex = List2.ListCount - 1
            CloseHandle hProcess
        End If
        Err.Clear
    Next
End Sub

Private Sub mnuUpdateConfig_Click()
    On Error Resume Next
    Dim pid As Long, hProcess As Long, handler As Long, hThread As Long, arg As Long
    If liProc Is Nothing Then Exit Sub
    pid = CLng("&h" & liProc.Text)
    handler = CLng("&h" & liProc.SubItems(3))
    If handler = 0 Then Exit Sub
    If Err.Number = 0 Then
         hProcess = OpenProcess(PROCESS_ALL_ACCESS, False, pid)
         List2.AddItem "UpdateConfig(" & Hex(hProcess) & "," & Hex(handler) & ") = " & CreateRemoteThread(hProcess, ByVal 0, 0, handler, arg, 0, hThread)
         List2.ListIndex = List2.ListCount - 1
         CloseHandle (hProcess)
    End If
End Sub

Private Sub sc_MessageReceived(hwnd As Long, wMsg As Long, wParam As Long, lParam As Long, Cancel As Boolean) '
    If wMsg = WM_COPYDATA Then RecieveTextMessage lParam
End Sub

Private Sub HandleConfig(msg As String, spid As String)
    On Error GoTo hell
    Dim cmd
    Dim li As ListItem
    Dim pid As Long
    
    cmd = Split(msg, ":")
    
    If InStr(1, msg, "gettickvalue", vbTextCompare) < 1 Then
        Debug.Print msg
    End If
    
    Select Case LCase(cmd(1))
        Case "nosleep": If chkIgnoreSleep.value = 1 Then sc.OverRideRetVal 1
        Case "noregistry": If chkNoRegistry.value = 1 Then sc.OverRideRetVal 1
        Case "nogetproc": If chkNoGetProc.value = 1 Then sc.OverRideRetVal 1
        Case "querygettick": If chkAdvanceGetTick.value = 1 Then sc.OverRideRetVal 1
        Case "blockopenprocess": If chkBlockOpenProcess.value = 1 Then sc.OverRideRetVal 1
        Case "blockdebugcontrol": If chkBlockDebugControl.value = 1 Then sc.OverRideRetVal 1
        Case "ignoreexitprocess": If chkIgnoreExitProcess.value = 1 Then sc.OverRideRetVal 1
        Case "handler": 'reconfig handler that can be called with CreateRemoteThread()
                pid = CLng("&h" & spid)
                For Each li In lvProc.ListItems
                    If li.Tag = pid Then
                        li.SubItems(3) = cmd(2)
                        Exit For
                    End If
                Next
        
        Case "gettickvalue":
        
                    If getTickIncrements = 0 Then
                        sc.OverRideRetVal GetTickCount()
                    Else
1                        sc.OverRideRetVal GetTickCount() + (getTickIncrements * &H10000)
                    End If
                    
                    getTickIncrements = getTickIncrements + 1
                    
    End Select
        
hell:

    If Erl = 1 Then
        getTickIncrements = 0
    End If
    
End Sub

Private Sub RecieveTextMessage(lParam As Long)
   
    Dim CopyData As COPYDATASTRUCT
    Dim Buffer(1 To 2048) As Byte
    Dim temp As String
    Dim hProcess As Long
    Dim writeLen As Long
    Dim ret As Long
    Dim hThread As Long
    Dim comma As Long
    Dim pid As String
    Dim li As ListItem
    
    DoEvents
    Sleep 8
    
    CopyMemory CopyData, ByVal lParam, Len(CopyData)
    
    If CopyData.dwFlag = 3 Then
        CopyMemory Buffer(1), ByVal CopyData.lpData, CopyData.cbSize
        temp = StrConv(Buffer, vbUnicode)
        temp = Left$(temp, InStr(1, temp, Chr$(0)) - 1)
        
        comma = InStr(temp, ",")
        If comma > 0 Then
            pid = Mid(temp, 1, comma - 1)
            temp = Mid(temp, comma + 1)
            If lastPid <> pid Then
                lastPid = pid
                AddPid pid
            End If
        End If
        
        If InStr(temp, "***config:") > 0 Then
            HandleConfig temp, pid
            Exit Sub
        End If
        
        If InStr(temp, "OPTION_SET") > 0 Then
            List2.AddItem temp
            List2.ListIndex = List2.ListCount - 1
            Exit Sub
        End If
        
        If Len(temp) = 0 Then Exit Sub
        
        If lastMsg = temp Then
            IncrementLastCount
            Exit Sub 'antispam
        End If
            
        lastMsg = temp
              
        'todo: parse api log and do captures here...
        'dm.HandleApiMessage temp
        
        If InStr(temp, "CloseHandle") > 0 Then Exit Sub 'to much spam
  
  
        'heres where we work with the intercepted message
        If Not noLog Then
            
            If ignoreit(temp) Then Exit Sub
            
            Set li = lv.ListItems.Add(, , pid)
            li.SubItems(1) = temp
            li.EnsureVisible
            
            If Len(txtDumpAt) > 0 Then
                If InStr(1, temp, txtDumpAt, vbTextCompare) > 0 Then
                    'sendMessage is a blocking call so we will sit here till user hits continue
                    cmdContinue.Enabled = True
                    readyToReturn = False
                    While Not readyToReturn
                        DoEvents
                        Sleep 60
                    Wend
                    cmdContinue.Enabled = False
                End If
            End If
            
        End If
        
    End If
    
End Sub

Private Sub IncrementLastCount()
    Dim i As Long
    Dim v As Long
    On Error Resume Next
    i = lv.ListItems.Count
    v = CLng(lv.ListItems(i).SubItems(2))
    lv.ListItems(i).SubItems(2) = v + 1
End Sub

Public Function StartProcessWithDLL(exePath As String, dllPath As String) As Long

    Dim hProcess As Long
    Dim lpfnLoadLib As Long
    Dim ret As Long
    Dim lpdllPath As Long
    Dim pi As PROCESS_INFORMATION
    Dim si As STARTUPINFO
    Dim hThread As Long
    Dim writeLen As Long
    Dim b() As Byte
    Dim buflen As Long
    Dim li As ListItem
    
    Const PAGE_READWRITE = 4
    Const CREATE_SUSPENDED = &H4
    Const MEM_COMMIT = &H1000
    
    b() = StrConv(dllPath & Chr(0), vbFromUnicode)
    buflen = UBound(b) + 1
    
    With List2
        .Clear
        
        If IsNumeric(exePath) Then
            hProcess = OpenProcess(PROCESS_ALL_ACCESS, False, CLng(exePath))
            .AddItem "Opening PID: " & exePath & " Process Handle=" & hProcess
            Set li = lvProc.ListItems.Add(, , Hex(CLng(exePath)))
            li.SubItems(1) = fso.FileNameFromPath(cpi.GetProcessPath(CLng(exePath)))
            li.Tag = CLng(exePath)
        Else
            ret = CreateProcess(0&, exePath, 0&, 0&, 1&, CREATE_SUSPENDED, 0&, 0&, si, pi)
            .AddItem "Create Process Suspended: " & ret & IIf(ret = 0, " Failed", " PID: " & pi.dwProcessId)
            
            hProcess = OpenProcess(PROCESS_ALL_ACCESS, False, pi.dwProcessId)
            .AddItem "OpenProcess Handle=" & hProcess
            
            Set li = lvProc.ListItems.Add(, , Hex(pi.dwProcessId))
            li.SubItems(1) = fso.FileNameFromPath(exePath)
            li.Tag = pi.dwProcessId
            
        End If
                    
        lpdllPath = VirtualAllocEx(hProcess, ByVal 0, buflen, MEM_COMMIT, ByVal PAGE_READWRITE)
        .AddItem "Remote Allocation base: " & Hex(lpdllPath)
            
        ret = WriteProcessMemory(hProcess, ByVal lpdllPath, b(0), buflen, writeLen)
        .AddItem "WriteProcessMemory=" & ret & " BufLen=" & buflen & " Bytes Written: " & writeLen
                
        lpfnLoadLib = GetProcAddress(GetModuleHandle("kernel32.dll"), "LoadLibraryA")
        .AddItem "LoadLibraryA = " & Hex(lpfnLoadLib)
        
        'DebugBreak
        ret = CreateRemoteThread(hProcess, ByVal 0, 0, lpfnLoadLib, lpdllPath, 0, hThread)
        .AddItem "CreateRemoteThread = " & ret & " ThreadID: " & Hex(hThread)
                
        Sleep 900
        
        If Not IsNumeric(exePath) Then ResumeThread pi.hThread
        
        CloseHandle hProcess
        
    End With

End Function







Function FileExists(path) As Boolean
  If Len(path) = 0 Then Exit Function
  If Dir(path, vbHidden Or vbNormal Or vbReadOnly Or vbSystem) <> "" Then FileExists = True
End Function
 
 

Private Sub TabStrip1_Click()
    If TabStrip1.SelectedItem.Index = 1 Then lvProc.Visible = True Else lvProc.Visible = False
    List2.Visible = Not lvProc.Visible
End Sub

Private Sub txtArgs_OLEDragDrop(data As DataObject, Effect As Long, Button As Integer, Shift As Integer, x As Single, y As Single)
    On Error Resume Next
    txtArgs = data.Files(1)
End Sub

Private Sub txtDll_OLEDragDrop(data As DataObject, Effect As Long, Button As Integer, Shift As Integer, x As Single, y As Single)
    On Error Resume Next
    txtDll = data.Files(1)
End Sub

Private Sub txtPacked_OLEDragOver(data As DataObject, Effect As Long, Button As Integer, Shift As Integer, x As Single, y As Single, State As Integer)
    On Error Resume Next
    txtPacked = data.Files(1)
End Sub



Function IsHex(it) As Long
    On Error GoTo out
      IsHex = CLng("&H" & it)
    Exit Function
out:  IsHex = 0
End Function



Function GetMySetting(key, def)
    GetMySetting = GetSetting(App.EXEName, "General", key, def)
End Function

Sub SaveMySetting(key, value)
    SaveSetting App.EXEName, "General", key, value
End Sub

