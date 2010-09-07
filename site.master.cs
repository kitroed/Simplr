﻿using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;

public partial class StandardSite : System.Web.UI.MasterPage
{
  protected void Page_Load(object sender, EventArgs e)
  {
      if (Page.User.Identity.IsAuthenticated)
      {
          aUser.InnerText = "Welcome " + Page.User.Identity.Name + "!";
          aLogin.InnerText = Resources.labels.logoff;
          aLogin.HRef = BlogEngine.Core.Utils.RelativeWebRoot + "Account/Login.aspx?logoff";
      }
      else
      {
          aLogin.HRef = BlogEngine.Core.Utils.RelativeWebRoot + "Account/Login.aspx";
          aLogin.InnerText = Resources.labels.login;
      }
  }
}