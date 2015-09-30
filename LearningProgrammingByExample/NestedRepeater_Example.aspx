<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NestedRepeater_Example.aspx.cs" Inherits="LearningProgrammingByExample.NestedRepeater_Example" %>

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
            <asp:Repeater ID="rptProductTypeParent" runat="server" OnItemDataBound="rptProductTypeParent_ItemDataBound">
                <ItemTemplate>
                    <p>
                        <b>Id: <%#Eval("productTypeId") %></b> &nbsp;<asp:HiddenField ID="hdfProductTypeId" runat="server" Value='<%#Eval("productTypeId") %>' />
                        <b>Type Name: <%#Eval("productTypeName") %></b>
                    </p>

                    <p>
                        <asp:Repeater ID="rptProductChild" runat="server">
                            <ItemTemplate>
                                <p> 
                                    - Product Name: <%#Eval("productName") %>&nbsp;
                                    Price: <%#Eval("productPrice") %>&nbsp;
                                    Quantity: <%#Eval("quantity") %>
                                </p>
                            </ItemTemplate>
                        </asp:Repeater>
                    </p>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </form>
</body>
</html>
