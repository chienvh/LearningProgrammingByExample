<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdatePanel-With-Repeater_Example.aspx.cs" Inherits="LearningProgrammingByExample.UpdatePanel_With_Repeater_Example" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            width: 176px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div>
            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <table class="auto-style1">
                        <tr>
                            <td colspan="3">ADD NEW FORM</td>
                        </tr>
                        <tr>
                            <td class="auto-style2">Name:</td>
                            <td>
                                <asp:TextBox ID="txtName" runat="server" Width="236px"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style2">Address:</td>
                            <td>
                                <asp:TextBox ID="txtAddress" runat="server" Width="236px"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style2">&nbsp;</td>
                            <td>
                                <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="Add New" />
                                <asp:Label ID="lblDisplay" runat="server" ForeColor="Red"
                                    Style="text-align: left" Visible="False"></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
            <br />
            <br />
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
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
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnAdd" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </form>
</body>
</html>
