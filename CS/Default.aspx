<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <title>How to check the validation state of editors using the AreEditorsValid method</title>
    <style type="text/css">
        .algn {
            margin: 0 auto;
        }
        .text {
            text-align: center;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <script type="text/javascript">
            function RemoveFocus() {
                var input = document.getElementById('inputToMoveFocusTo');
                input.style.display = '';
                input.focus();
                input.style.display = 'none';
            }
    </script>
    <input type="text" id="inputToMoveFocusTo" style="display: none;"/>

    <dx:ASPxLoadingPanel ID="LoadingPanel" runat="server" ClientInstanceName="LoadingPanel" Modal="true" ContainerElementID="RoundPanel"/>
    <dx:ASPxRoundPanel ID="RoundPanel" runat="server" Width="309px" ClientInstanceName="RoundPanel" DefaultButton="btnSubmit">
        <HeaderTemplate>Feedback Form</HeaderTemplate>
        <PanelCollection>
            <dx:PanelContent runat="server">
                <dx:ASPxPanel ID="FormPanel" runat="server" Width="100%">
                    <PanelCollection>
                        <dx:PanelContent runat="server">
                        <table>
                            <tr><td><dx:ASPxLabel ID="lbMessage" Text="Message:" runat="server"/></td></tr>
                            <tr><td>
                                <dx:ASPxMemo ID="mmMessage" runat="server" Rows="5" NullText="Enter message ..." Font-Size="Small" Width="290px">
                                    <NullTextStyle Font-Size="Small"/>
                                    <ValidationSettings EnableCustomValidation="True" ErrorDisplayMode="Text" ErrorTextPosition="Bottom">
                                        <ErrorFrameStyle Font-Size="Smaller"/>
                                        <RequiredField IsRequired="True" ErrorText="Message is required" />
                                    </ValidationSettings>
                                </dx:ASPxMemo>
                            </td></tr>
                            <tr><td><dx:ASPxLabel ID="lbEMail" Text="E-mail:" runat="server"/></td></tr>
                            <tr><td>
<!--region #Validation-->
                                <dx:ASPxTextBox ID="tbEMail" runat="server" Size="49" NullText="Enter e-mail ..." Font-Size="Small">
                                    <ValidationSettings  EnableCustomValidation="True" ErrorDisplayMode="Text" ErrorTextPosition="Bottom" SetFocusOnError="true">
                                        <ErrorFrameStyle Font-Size="Smaller"/>
                                        <RegularExpression ValidationExpression="^\w+([-+.'%]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$" 
                                            ErrorText="Invalid e-mail"/>
                                        <RequiredField IsRequired="True" ErrorText="E-mail is required"/>
                                    </ValidationSettings>
                                    <NullTextStyle Font-Size="Small"/>
                                </dx:ASPxTextBox>
<!--endregion #Validation-->
                            </td></tr>
                            <tr><td>
<!--region #AreEditorsValid-->
                               
                                <dx:ASPxButton ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click">
                                    <ClientSideEvents Click="function(s, e) { 
                                                                if(ASPxClientEdit.AreEditorsValid()) {
                                                                
                                                                // Prevent multiple presses of the button
                                                                    RemoveFocus();
                                                                    LoadingPanel.SetText('Sending data to the server...');
                                                                    LoadingPanel.Show();
                                                                }
                                                             }" />
                                </dx:ASPxButton>
<!--endregion #AreEditorsValid-->
                            </td></tr>
                        </table>
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxPanel>

                <dx:ASPxPanel ID="SuccessPanel" runat="server" Width="200px" Visible="False">
                    <PanelCollection>
                        <dx:PanelContent runat="server">
                            <p class="text">Thank you for your feedback</p>
                            <dx:ASPxButton ID="btnAgain" runat="server" Text="Start Again" OnClick="btnAgain_Click" CssClass="algn">
                                <ClientSideEvents Click="function(s, e) { 
                                                         // Prevent multiple presses of the button
                                                            RemoveFocus();
                                                            LoadingPanel.SetText('Starting...');
                                                            LoadingPanel.Show(); 
                                                         }" />
                            </dx:ASPxButton>
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxPanel>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxRoundPanel>
    </form>
</body>
</html>
