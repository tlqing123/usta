﻿<%@ Page Title="" Language="C#"  AutoEventWireup="true" Inherits="Teacher_EditTeacherResume" Codebehind="EditTeacherResume.aspx.cs" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="masterHead" runat="server">
    <title></title>
    <script type="text/javascript" src="../javascript/jquery-1.4.min.js"></script>
    
    <script charset="utf-8" type="text/javascript" src="/kindeditor/kindeditor.js"></script>
    <script charset="utf-8" type="text/javascript" src="/kindeditor/lang/zh_CN.js"></script>
    <script charset="utf-8" type="text/javascript" src="/javascript/kindeditorInit.js"></script>
    <script type="text/javascript">
        KindEditor.ready(function (K) {
            initKindEditor(K, 'Textarea1', "100%", "300px");
        });
    </script>
    </head>
    <body>
<form id="form1" runat="server">
<br />
<textarea id="Textarea1" runat="server" clientidmode="Static"></textarea>
<div style="text-align:center;height:40px;line-height:40px;margin-top:5px;">
<asp:Button ID="btnCommit" runat="server" Text="提交" onclick="btnCommit_Click" OnClientClick="return checkKindValue('Textarea1');" />
</div>
</form>
</body>
</html>


