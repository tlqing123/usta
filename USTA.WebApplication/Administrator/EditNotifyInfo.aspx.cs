﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;
using USTA.Model;
using USTA.Dal;
using USTA.Common;
using System.Configuration;
using USTA.PageBase;


public partial class Administrator_EditNotifyInfo : CheckUserWithCommonPageBase
{
    int notifyId = (HttpContext.Current.Request["adminNotifyInfoId"]==null)?0:int.Parse(HttpContext.Current.Request["adminNotifyInfoId"]);
    public int fileFolderType = (int)FileFolderType.adminNotify;

    //已经有的附件数，页面初始化时与前端JS进行交互
    public int iframeCount = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int tryParseInt = 0;
            if (CommonUtility.SafeCheckByParams<string>(Request["adminNotifyInfoId"], ref tryParseInt))
            {
                //获取Url中的参数
                notifyId = tryParseInt;
            }

            InitialNotifyEdit(notifyId);
        }
    }


    //第2个标签；开始
    protected void ddlNotifyType_SelectedIndexChanged(object sender, EventArgs e)
    {
        DalOperationAboutAdminNotifyType dalNotifyType = new DalOperationAboutAdminNotifyType();
        DataTable dt = dalNotifyType.FindAdminNotifyInfoByPid(int.Parse(ddlNotifyType.SelectedValue)).Tables[0];

        while (ddlNotifyTypeChild.Items.Count > 0)
        {
            ddlNotifyTypeChild.Items.RemoveAt(0);
        }

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ddlNotifyTypeChild.Items.Add(new ListItem(dt.Rows[i]["notifyTypeName"].ToString().Trim(), dt.Rows[i]["notifyTypeId"].ToString().Trim()));
        }
    }

    //初始化编辑页面
    public void InitialNotifyEdit(int notifyId)
    {
        DalOperationAboutAdminNotifyType dalNotifyType = new DalOperationAboutAdminNotifyType();
        DataTable dt = dalNotifyType.FindAllParentAdminNotifyType().Tables[0];
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ddlNotifyType.Items.Add(new ListItem(dt.Rows[i]["notifyTypeName"].ToString().Trim(), dt.Rows[i]["notifyTypeId"].ToString().Trim()));
        }

        DalOperationAboutAdminNotify doan = new DalOperationAboutAdminNotify();
        AdminNotifyInfo notify = doan.FindNotifyByNo(notifyId);

        if (notify == null)
        {
            Javascript.AlertAndRedirect("要修改的信息不存在，请检查！", "/Administrator/NotifyInfoManage.aspx", Page);
        }
        else
        {
            //通知或办事流程
            ddlNotifyType.SelectedValue = notify.notifyTypeId.ToString().Trim();

            txtTitle.Text = notify.notifyTitle;

            this.Textarea1.Value = notify.notifyContent;

            hidAttachmentId.Value = notify.attachmentIds;

            int parentId = dalNotifyType.GetParentIdById(notify.notifyTypeId);

            for (int i = 0; i < ddlNotifyType.Items.Count; i++)
            {
                if (ddlNotifyType.Items[i].Value == parentId.ToString())
                {
                    ddlNotifyType.SelectedIndex = i;
                    break;
                }
            }

            if (notify.attachmentIds.Length > 0)
            {
                DalOperationAttachments dalOperationAttachments = new DalOperationAttachments();
                ltlAttachment.Text = dalOperationAttachments.GetAttachmentsList(notify.attachmentIds, ref iframeCount, true,string.Empty);
            }

            dt = dalNotifyType.FindAdminNotifyInfoByPid(int.Parse(ddlNotifyType.SelectedValue)).Tables[0];

            while (ddlNotifyTypeChild.Items.Count > 0)
            {
                ddlNotifyTypeChild.Items.RemoveAt(0);
            }

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                ddlNotifyTypeChild.Items.Add(new ListItem(dt.Rows[i]["notifyTypeName"].ToString().Trim(), dt.Rows[i]["notifyTypeId"].ToString().Trim()));
            }


            for (int i = 0; i < ddlNotifyTypeChild.Items.Count; i++)
            {
                if (ddlNotifyTypeChild.Items[i].Value == notify.notifyTypeId.ToString().Trim())
                {
                    ddlNotifyTypeChild.SelectedIndex = i;
                    break;
                }
            }
        }
    }
    //修改
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        if (txtTitle.Text.Trim().Length == 0 || this.Textarea1.Value.Trim().Length == 0)
        {
            Javascript.GoHistory(-1, "标题和内容不能为空，请输入！", Page);
        }
        else
        {
            DalOperationAboutAdminNotify doan = new DalOperationAboutAdminNotify();
            AdminNotifyInfo notify = new AdminNotifyInfo();
            notify.adminNotifyInfoIds = notifyId.ToString();

            notify.notifyTitle = txtTitle.Text.Trim();
            notify.notifyContent = this.Textarea1.Value.Trim();
            notify.notifyTypeId = int.Parse(ddlNotifyTypeChild.SelectedValue.ToString().Trim());
            notify.attachmentIds = hidAttachmentId.Value;
            notify.updateTime = DateTime.Now;

            try
            {
               
                doan.UpdateNotifyInfo(notify);//修改
                Javascript.RefreshParentWindow("修改成功！", "/Administrator/NotifyInfoManage.aspx", Page);
            }
            catch (Exception ex)
            {
                MongoDBLog.LogRecord(ex);
                Javascript.GoHistory(-1, "修改失败,请检查格式是否有误！", Page);
            }

        }
    }
}
