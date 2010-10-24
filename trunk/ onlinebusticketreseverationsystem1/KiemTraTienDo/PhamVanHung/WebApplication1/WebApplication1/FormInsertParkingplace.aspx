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
        Status
        <asp:RadioButton ID="RadioButton3" runat="server" GroupName="bca" 
            Text="Avaible" />
        <asp:RadioButton ID="RadioButton4" runat="server" GroupName="bca" 
            Text="Unavaible" />
        <br />
        <asp:GridView ID="GridView1" runat="server" >
        </asp:GridView>       
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <br />
        <br />
        <br />
 ------------------UPDATE------------------------&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        ---------DELETE-----------<br />
        <asp:Label ID="Label5" runat="server" Text="Name"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnDelete" runat="server" Text="Delete" 
            onclick="btnDelete_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtDelete" runat="server"></asp:TextBox>
        <asp:DropDownList ID="DropDownList3" runat="server">
            <asp:ListItem>ByID</asp:ListItem>
            <asp:ListItem>ByName</asp:ListItem>
        </asp:DropDownList>
        <br />
        &nbsp;City<br />
        Status         <asp:RadioButton ID="RadioButton1" runat="server" GroupName="abc" 
            Text="Avaible" />
&nbsp;<asp:RadioButton ID="RadioButton2" runat="server" GroupName="abc" 
            Text="Unavaible" />
        <br />
        <asp:Button ID="btnUpdate" runat="server" Text="Update" 
            onclick="btnUpdate_Click" />
        &nbsp;
        <asp:DropDownList ID="DropDownList4" runat="server">
            <asp:ListItem>ByID</asp:ListItem>
            <asp:ListItem>ByName</asp:ListItem>
        </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtID" runat="server"></asp:TextBox>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
    </div>
    </form>
</body>
</html>
