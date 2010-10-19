<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormInsertParkingplace.aspx.cs" Inherits="WebApplication1.FormInsertParkingplace" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <br />
        Name
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnSearch" runat="server" onclick="btnSearch_Click" 
            Text="Search" />
&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="DropDownList2" runat="server">
            <asp:ListItem>ByID</asp:ListItem>
            <asp:ListItem>ByName</asp:ListItem>
        </asp:DropDownList>
        <br />
        City&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="DropDownList1" runat="server" 
            onselectedindexchanged="DropDownList1_SelectedIndexChanged" >
        </asp:DropDownList>
       
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
            Text="save" />
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" >
        </asp:GridView>       
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <br />

    </div>
    </form>
</body>
</html>
