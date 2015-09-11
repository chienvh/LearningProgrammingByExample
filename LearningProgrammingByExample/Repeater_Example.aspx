<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Repeater_Example.aspx.cs" Inherits="LearningProgrammingByExample.Repeater_Example" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 61%;
            height: 80px;
        }

        .auto-style2 {
            width: 100%;
        }

        .auto-style3 {
            width: 327px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
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
    <p>
        &nbsp;
    </p>
    <p>
        <strong>Example 2:</strong>
    </p>
    <p>
        &nbsp;
    </p>

    <asp:Repeater ID="rptExample2" runat="server">
        <ItemTemplate>
            <table class="auto-style2" border="1">
                <tr>
                    <td class="auto-style3">ID: <%#Eval("Id") %></td>
                    <td>Address: <%#Eval("Address") %></td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">Name: <%#Eval("Name") %></td>
                    <td>Created Date: <%#Eval("CreatedDate", "{0:d/M/yyyy}") %></td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:Repeater>
</body>
</html>
