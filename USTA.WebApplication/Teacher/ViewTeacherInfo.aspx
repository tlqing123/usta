﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewTeacherInfo.aspx.cs" Inherits="USTA.WebApplication.Teacher.ViewTeacherInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server" id="masterHead">

    <title></title>
     <script type="text/javascript" src="../javascript/jquery-1.4.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
      <table width="100%" class="tableAddStyle beautyTableStyle" align="center">    
      <%--<tr>
        <td><asp:Label ID="lblId" runat="server" Font-Size="9pt" Text="教师编号：" Width="80px"></asp:Label></td>
        <td><asp:Label ID="lblNo" runat="server" Font-Size="9pt"  Width="80px"></asp:Label></td>
        <td></td>
      </tr>--%>
      <tr>
        <td><asp:Label ID="lblNames" runat="server" Font-Size="9pt" Text="教师姓名：" Width="73px"></asp:Label></td>
        <td><asp:Label ID="lblName" runat="server" Font-Size="9pt"></asp:Label></td>
      </tr>
      <tr>
        <td><asp:Label ID="lblEmails" runat="server" Font-Size="9pt" Text="E-mail：" Width="78px"></asp:Label></td>
        <td><asp:Label ID="lblEmail" runat="server" Font-Size="9pt"></asp:Label></td>
      </tr>
      <tr>
        <td><asp:Label ID="lblOffices" runat="server" Font-Size="9pt" Text="办公室：" Width="78px"></asp:Label></td>
        <td><asp:Label ID="lblOffice" runat="server" Font-Size="9pt"></asp:Label></td>
      </tr>
      <tr>
        <td style="border-bottom:0px;"><asp:Label ID="lblRemarks" runat="server" Font-Size="9pt" Text="备注：" Width="75px"></asp:Label></td>
        <td style="border-bottom:0px;"><asp:Label ID="lblRemark" runat="server" Font-Size="9pt"  Width="200px"></asp:Label></td>
      </tr>      
     </table>
    </div>
    </form>
</body>
</html>

