<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdatePanel_Example.aspx.cs" Inherits="LearningProgrammingByExample.UpdatePanel_Example" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div>
            <asp:UpdatePanel ID="udpMyControl" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:TextBox ID="txtName" runat="server" Width="205px"></asp:TextBox>
                    &nbsp;<asp:Button ID="btnClickMe" runat="server" OnClick="btnClickMe_Click" Text="Click Me" />
                    &nbsp;
                </ContentTemplate>
            </asp:UpdatePanel>
            <br />
            <br />

            <asp:UpdatePanel ID="udpResult" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnClickMe" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </form>
</body>
</html>
