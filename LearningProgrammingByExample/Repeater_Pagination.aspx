<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Repeater_Pagination.aspx.cs" Inherits="LearningProgrammingByExample.Repeater_Pagination" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Perfect Pagination With Repeater and ASP.Net C#</title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style3 {
            width: 162px;
        }

        table {
            border-collapse: collapse;
        }

        table, td, th {
            border: 1px solid blue;
        }

        th {
            background-color: dodgerblue;
            color: white;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="MainScriptManager" runat="server" />
        <asp:UpdatePanel ID="pnlHelloWorld" runat="server">
            <ContentTemplate>
                <div>
                    <asp:Repeater ID="rptResult" runat="server">
                        <HeaderTemplate>
                            <table class="auto-style1">
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Address</th>
                                    <th>Created Date</th>
                                </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><%#Eval("Id") %></td>
                                <td><%#Eval("Name") %></td>
                                <td><%#Eval("Address") %></td>
                                <td><%#Eval("createdDate") %></td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>

                <div style="margin-top: 20px;">
                    <table style="width: 600px;">
                        <tr>
                            <td>
                                <asp:LinkButton ID="lbFirst" runat="server" OnClick="lbFirst_Click">First</asp:LinkButton>
                            </td>
                            <td>
                                <asp:LinkButton ID="lbPrevious" runat="server" OnClick="lbPrevious_Click">Previous</asp:LinkButton>
                            </td>
                            <td>
                                <asp:DataList ID="rptPaging" runat="server"
                                    OnItemCommand="rptPaging_ItemCommand"
                                    OnItemDataBound="rptPaging_ItemDataBound" RepeatDirection="Horizontal">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbPaging" runat="server"
                                            CommandArgument='<%# Eval("PageIndex") %>' CommandName="newpage"
                                            Text='<%# Eval("PageText") %> ' Width="20px"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:DataList>
                            </td>
                            <td>
                                <asp:LinkButton ID="lbNext" runat="server" OnClick="lbNext_Click">Next</asp:LinkButton>
                            </td>
                            <td>
                                <asp:LinkButton ID="lbLast" runat="server" OnClick="lbLast_Click">Last</asp:LinkButton>
                            </td>
                            <td>
                                <asp:Label ID="lblpage" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                    </table>

                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
