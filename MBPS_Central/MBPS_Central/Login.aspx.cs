using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Runtime.InteropServices;


namespace MBPS_Central
{
    public partial class Login : System.Web.UI.Page
    {
        [DllImport("ADVAPI32.dll", EntryPoint = "LogonUserW", SetLastError = true, CharSet = CharSet.Auto)]
        public static extern bool LogonUser(string lpszUsername,
        string lpszDomain, string lpszPassword, int dwLogonType,
        int dwLogonProvider, ref IntPtr phToken);

        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!IsPostBack)
            {
                if (Request.Cookies["lanid"] != null)
                    txtUserName.Text = Request.Cookies["lanid"].Value;
                if (Request.Cookies["pwd"] != null)
                    txtPassword.Attributes.Add("value", Request.Cookies["pwd"].Value);
                if (Request.Cookies["lanid"] != null && Request.Cookies["pwd"] != null)
                //    chkRememberMe.Checked = true;

                //if (Request.Cookies["lanid"] != null && Request.Cookies["pwd"] != null)
                    Response.Redirect("Default.aspx", true);
            }
        }

       
        public static string GetDomainName(string usernameDomain)
        {
            if (string.IsNullOrEmpty(usernameDomain))
            {
                throw (new ArgumentException("Argument can't be null.", "usernameDomain"));
            }
            if (usernameDomain.Contains("\\"))
            {
                int index = usernameDomain.IndexOf("\\");
                return usernameDomain.Substring(0, index);
            }
            else if (usernameDomain.Contains("@"))
            {
                int index = usernameDomain.IndexOf("@");
                return usernameDomain.Substring(index + 1);
            }
            else
            {
                return "";
            }
        }

        public static string GetUsername(string usernameDomain)
        {
            if (string.IsNullOrEmpty(usernameDomain))
            {
                throw (new ArgumentException("Argument can't be null.", "usernameDomain"));
            }
            if (usernameDomain.Contains("\\"))
            {
                int index = usernameDomain.IndexOf("\\");
                return usernameDomain.Substring(index + 1);
            }
            else if (usernameDomain.Contains("@"))
            {
                int index = usernameDomain.IndexOf("@");
                return usernameDomain.Substring(0, index);
            }
            else
            {
                return usernameDomain;
            }
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if ((chkRememberMe.Checked ==true))
            {
                Response.Cookies["lanid"].Expires = DateTime.Now.AddHours(12);
                Response.Cookies["pwd"].Expires = DateTime.Now.AddHours(12);
            }
            else
            {
                Response.Cookies["lanid"].Expires = DateTime.Now.AddHours(-1);
                Response.Cookies["pwd"].Expires = DateTime.Now.AddHours(-1);
            }
            Response.Cookies["lanid"].Value = txtUserName.Text.Trim();
            Response.Cookies["pwd"].Value = txtPassword.Text.Trim();

            
                string domainName = GetDomainName(txtUserName.Text);
                string userName = GetUsername(txtUserName.Text);  // Extract user name 
                //from provided DomainUsername e.g Domainname\Username
                IntPtr token = IntPtr.Zero;
                bool result = LogonUser(userName, domainName, txtPassword.Text, 2, 0, ref token);
                if (result)
                {
                    if (string.IsNullOrEmpty(Request.QueryString["ReturnUrl"]))
                    {
                        FormsAuthentication.RedirectFromLoginPage(txtUserName.Text, false);
                        Session["lanid"] = userName;
                        Response.Redirect("Default.aspx");
                    }
                    else
                    {
                        //FormsAuthentication.SetAuthCookie(txtUserName.Text, false);
                        //Response.Redirect("Success.aspx");
                        //Prompt cannot access / error or unauthorized account
                    }
                }
                else
                {
                    //If not authenticated then display an error message
                    lblMes.Text = "Invalid Lan ID or Password";
                    lblMes.Visible = true;
                    txtUserName.Focus();
                }
         }
    }
}