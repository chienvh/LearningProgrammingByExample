<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DropDownList_Example.aspx.cs" Inherits="LearningProgrammingByExample.DropDownList_Example" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <strong><span class="auto-style1">DropDownList Asp.Net Example</span></strong><br />
            <br />
            <asp:DropDownList ID="ddlResult" runat="server" Height="26px" Width="199px" AutoPostBack="True" OnSelectedIndexChanged="ddlResult_SelectedIndexChanged">
            </asp:DropDownList>
        &nbsp;<asp:Label ID="lblMessage" runat="server"></asp:Label>
        </div>
    </form>
</body>
</html>
