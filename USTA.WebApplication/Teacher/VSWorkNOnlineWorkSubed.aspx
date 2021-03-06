﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="Teacher_VSWorkNOnlineWorkSubed" 
    MasterPageFile="~/MasterPage/ViewSchoolworkNotify.master" Codebehind="VSWorkNOnlineWorkSubed.aspx.cs" %>

<%@ MasterType VirtualPath="~/MasterPage/ViewSchoolworkNotify.master" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<asp:Content ID="content1" ContentPlaceHolderID="CouserInfoContent" runat="server">
     <div class="ui-tabs-panel">
             <div>
        姓名：<asp:TextBox ID="txtNameSearch" runat="server"></asp:TextBox>&nbsp;分数范围：
        <asp:TextBox ID="txtlow" runat="server"></asp:TextBox>-<asp:TextBox ID="txthigh" runat="server"></asp:TextBox>
        <asp:Button 
                ID="btnSubmitSearch" runat="server" Text="提交" onclick="btnSubmitSearch_Click" />
        </div>
     <input id="dzxBtnSelectAll" name="dzxBtnSelectAll" type="button" value="全选" onclick="selectAll();" />
           <a id="batchMultiFilesDownload" name="batchMultiFilesDownload" onclick="getBatchMultiFilesDownload();" href="#nogo" target="_blank">批量下载当前页中选择的文件</a>
        
         <asp:DataList ID="ddlstSchoolWork" runat="server" DataKeyField="studentNo" Width="100%">
             <HeaderTemplate>
               <table class="datagrid2"> 
                  <tr>
                    <th width="5%"></th>
                    <th width="10%">学生编号</th>
                    <th width="10%">学生姓名</th>
                    <th width="20%">作业</th>
                    <th width="10%">操作</th>
                    <th width="20%">批改后作业</th>
                    <th width="15%">评语</th>
                    <th  width="10%">得分</th>
                 </tr>
                 </table> 
               </HeaderTemplate>
            <ItemTemplate>
                <table  class="datagrid2">
                    <tr>
                    <td width="5%">
                        <input name="chkAttachmentId" type="checkbox" value='<%#Eval("attachmentId").ToString() %>' /></td>
                    <td width="10%"><%#Eval("studentNo") %></td>
                    <td width="10%"><%#Eval("studentName") %></td>
                    <td width="20%" style="padding:5px;"><%#this.GetURL(Eval("attachmentId").ToString())%></td>
                     <td width="10%">
                   <%-- <%#((bool.Parse(Eval("isCheck").ToString())) ? "<a href='CheckSchoolWorks.aspx?isOnline=1&keepThis=true&courseNo=" + Master.courseNo + "&schoolworkNotifyId=" + Master.schoolworkNotifyId + "&schoolWorkId=" + Eval("schoolWorkId").ToString().Trim() + "&TB_iframe=true&height=400&width=600'" + " title='" + "批改课程作业'" + " class='thickbox'>" + "重新批阅" + @"</a>" : "<a href='CheckSchoolWorks.aspx?isOnline=1&keepThis=true&courseNo=" + Master.courseNo + "&schoolworkNotifyId=" + Master.schoolworkNotifyId + "&schoolWorkId=" + Eval("schoolWorkId").ToString().Trim() + "&TB_iframe=true&height=400&width=600'" + " title='" + "批改课程作业'" + " class='thickbox'>" + "批阅" + @"</a>")%>
              --%>
              <%#((bool.Parse(Eval("isCheck").ToString())) ? "<a href='VSCheckSchoolworks.aspx?page=" + pageIndex + "&isOnline=1&courseNo=" + Master.courseNo + "&classID=" + Server.UrlEncode(Master.classID) + "&termtag=" + Master.termtag + "&schoolworkNotifyId=" + Master.schoolworkNotifyId + "&schoolWorkId=" + Eval("schoolWorkId").ToString().Trim() + " ' >" + "重新批阅" + @"</a>" : "<a href='VSCheckSchoolworks.aspx?page=" + pageIndex + "&isOnline=1&courseNo=" + Master.courseNo + "&classID=" + Server.UrlEncode(Master.classID) + "&termtag=" + Master.termtag + "&schoolworkNotifyId=" + Master.schoolworkNotifyId + "&schoolWorkId=" + Eval("schoolWorkId").ToString().Trim() + "'" + ">" + "批阅" + @"</a>")%>
                   </td> 
                   <td width="20%"><%#this.GetURL(Eval("returnAttachmentId").ToString())%></td>   
                   <td width="15%"><%#Eval("remark") %></td>   
                   <td width="10%"><%#Eval("score") %></td>                                   
                   </tr>                   
               </table>
            </ItemTemplate><FooterTemplate><%=(this.ddlstSchoolWork.Items.Count == 0 ? "未找到数据" : null)%></FooterTemplate><FooterStyle CssClass="datalistNoLine" />          
        </asp:DataList>
         <webdiyer:AspNetPager NumericButtonCount="5" CurrentPageButtonStyle="color:#FFF;" ID="AspNetPager2" runat="server" UrlPaging="true" FirstPageText="首页" LastPageText="尾页" NextPageText="下一页" OnPageChanged="AspNetPager2_PageChanged"
                         PrevPageText="上一页"
                         LayoutType="Table" AlwaysShow="true" CustomInfoHTML="当前第%CurrentPageIndex%页&amp;nbsp;总页数%PageCount%&amp;nbsp;共%RecordCount%条记录&nbsp;" HorizontalAlign="Left" InvalidPageIndexErrorMessage="请输入要跳转的整数页号" ShowCustomInfoSection="Left"
                SubmitButtonText="点击跳转" TextBeforePageIndexBox="请输入要跳转的页号：" CssClass="pager"
                CustomInfoSectionWidth="15%" CustomInfoTextAlign="Right" 
                TextAfterPageIndexBox="&amp;nbsp;" ShowBoxThreshold="1">
         </webdiyer:AspNetPager>
     </div>
</asp:Content>
