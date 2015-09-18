<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Repeater_UsingStoreProcedure.aspx.cs" Inherits="LearningProgrammingByExample.Repeater_UsingStoreProcedure" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

        .auto-style1 {
            width: 61%;
            height: 80px;
        }

        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Name:
        <asp:TextBox ID="txtName" runat="server" Width="277px"></asp:TextBox>
        <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search" />
        <br />
        <br />
            <asp:Repeater ID="rptMyRepeater" runat="server">
                <HeaderTemplate>
                    <table class="auto-style1" border="1">
                        <tr>
                            <td colspan="4"><strong>List Person</strong></td>
                        </tr>
                        <tr>
                            <td>Id</td>
                            <td>Name</td>
                            <td>Address</td>
                            <td>Created Date</td>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%#Eval("Id") %></td>
                        <td><%#Eval("Name") %></td>
                        <td><%#Eval("Address") %></td>
                        <td><%#Eval("CreatedDate") %></td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>

    </div>
    </form>
</body>
</html>
