﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Administrator_ImportExcelData" MasterPageFile="~/MasterPage/FrameManage.master" Codebehind="ImportExcelData.aspx.cs" %>

 <asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link type="text/css" rel="Stylesheet" href="../javascript/tab/ui.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
    
    <div id="container-1" style="padding-top: 40px;">
        <ul class="ui-tabs-nav">
            <li id="liFragment1" runat="server"><a href="?fragment=1"><span>导入Excel数据</span></a></li>
            <li id="liFragment2" class="ui-tabs-hide" runat="server"><a href="?fragment=2"><span>
                暂时不使用</span></a></li>
            <li id="liFragment3" class="ui-tabs-hide" runat="server"><a href="?fragment=3"><span>
                暂时不使用</span></a></li>
        </ul>
        <div class="ui-tabs-panel ui-tabs-hide" id="divFragment1" runat="server">
        <asp:FileUpload ID="FileUpload1" runat="server" />
        <asp:Button ID="Button1" runat="server" Text="导入Excel数据" 
            onclick="Button1_Click" />
        
        </div>
        
        
        <div class="ui-tabs-panel ui-tabs-hide" id="divFragment2" runat="server">
        </div>
        <div class="ui-tabs-panel ui-tabs-hide" id="divFragment3" runat="server">
        </div>
        </div>
    </form>
</asp:Content>