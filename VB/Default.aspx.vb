Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Threading
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports DevExpress.Web

Partial Public Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)

    End Sub


    Private Sub SetFormPanelVisible(ByVal visible As Boolean)
        FormPanel.Visible = visible
        SuccessPanel.Visible = Not visible
    End Sub
    #Region "#ClearEditorsInContainer"
    Protected Sub btnAgain_Click(ByVal sender As Object, ByVal e As EventArgs)
        FormPanel.Visible = True
        SuccessPanel.Visible = False
        ASPxEdit.ClearEditorsInContainer(FormPanel)
    End Sub
    #End Region ' #ClearEditorsInContainer
    #Region "#ControilContainer"
    Protected Sub btnSubmit_Click(ByVal sender As Object, ByVal e As EventArgs)
        If ASPxEdit.AreEditorsValid(FormPanel) Then
            ' TODO: Write data to database
            FormPanel.Visible = False
            SuccessPanel.Visible = True
            btnAgain.Focus()

            ' Intentionally pauses server-side processing, to demonstrate the Loading Panel functionality.
            Thread.Sleep(2000)
        End If
    End Sub
    #End Region ' #ControilContainer
End Class