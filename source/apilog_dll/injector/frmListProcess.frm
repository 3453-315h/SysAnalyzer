VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Begin VB.Form frmListProcess 
   BorderStyle     =   5  'Sizable ToolWindow
   Caption         =   "Choose Process"
   ClientHeight    =   3630
   ClientLeft      =   60
   ClientTop       =   300
   ClientWidth     =   6915
   LinkTopic       =   "frmListProcess"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3630
   ScaleWidth      =   6915
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton Command1 
      Caption         =   "Select"
      Height          =   315
      Left            =   5880
      TabIndex        =   1
      Top             =   3300
      Width           =   975
   End
   Begin MSComctlLib.ListView lv 
      Height          =   3255
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   6855
      _ExtentX        =   12091
      _ExtentY        =   5741
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
         Text            =   "PID"
         Object.Width           =   1235
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "USER"
         Object.Width           =   1764
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Text            =   "PATH"
         Object.Width           =   2540
      EndProperty
   End
End
Attribute VB_Name = "frmListProcess"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'License:   GPL
'Copyright: 2005 iDefense a Verisign Company
'Site:      http://labs.idefense.com
'
'Author:  David Zimmer <david@idefense.com, dzzie@yahoo.com>
'
'         disassembler functionality provided by olly.dll which
'         is a modified version of the OllyDbg GPL source from
'         Oleh Yuschuk Copyright (C) 2001 - http://ollydbg.de
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

Dim selli As ListItem
Dim cpi As New CProcessInfo

Private Sub Command1_Click()
    
    If selli Is Nothing Then
        MsgBox "Select processes"
        Exit Sub
    End If

    Me.Visible = False
    
End Sub

Function SelectProcess(c As Collection) As CProcess

    Dim p As CProcess
    Dim li As ListItem
    Dim cc As Long
    
    lv.ListItems.Clear
    
    For Each p In c
        Set li = lv.ListItems.Add(, , p.pid)
        Set li.Tag = p
        cc = InStr(p.User, ":")
        If cc > 0 Then
            li.SubItems(1) = Mid(p.User, cc + 1)
        Else
            li.SubItems(1) = p.User
        End If
        'li.SubItems(2) = p.path
        li.SubItems(2) = cpi.GetProcessPath(p.pid)
    Next
    
    On Error Resume Next
    Me.Show 1
    
    If selli Is Nothing Then Exit Function
    Set SelectProcess = selli.Tag
    Unload Me
    
End Function
 

Private Sub Form_Load()
    lv.ColumnHeaders(3).Width = lv.Width - lv.ColumnHeaders(3).Left - 350
End Sub

Private Sub Form_Resize()
    On Error Resume Next
    lv.Width = Me.Width - lv.Left - 200
    lv.ColumnHeaders(3).Width = lv.Width - lv.ColumnHeaders(3).Left - 350
    lv.Height = Me.Height - lv.Top - 500 - Command1.Height
    Command1.Top = Me.Height - Command1.Height - 400
    Command1.Left = Me.Width - Command1.Width - 400
End Sub

Private Sub Form_Unload(Cancel As Integer)
    On Error Resume Next
    Set selli = Nothing
End Sub

Private Sub lv_DblClick()
    Command1_Click
End Sub

Private Sub lv_ItemClick(ByVal Item As MSComctlLib.ListItem)
    Set selli = Item
End Sub
