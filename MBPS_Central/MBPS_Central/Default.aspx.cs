using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MBPS_Central
{
    public partial class _Default : Page
    {
        MBPSObj _mbps = new MBPSObj();

        protected void Page_Load(object sender, EventArgs e)
        {
            //Session["lanid"] = Request.ServerVariables["AUTH_USER"].ToString();
            Session["errMSG"] = string.Empty;
            Session["valid"] = false;

            //This is for manual override only! Comment the line below before publishing
            Session["lanid"] = "joseed";
               
            try
            {
                if (_mbps.validateLogin((string)Session["lanid"]))
                {
                    Session["errMSG"] = "There was a problem during your login.";
                    Response.Redirect("About.aspx");
                }
                else
                {
                    DataTable dt = new DataTable();
                    dt = _mbps.getLoginDetails((string)Session["lanid"]).Tables[0];
                    if (dt.Rows.Count < 1)
                    {
                        Session["errMSG"] = "You are not authorized to use this tool.";
                        Response.Redirect("About.aspx");
                    }
                    else
                    {
                        Session["valid"] = true;
                        foreach (DataRow drow in dt.Rows)
                        {
                            Session["WDID"] = drow[0].ToString();
                        }
                        if (!IsPostBack)
                        {
                            _mbps.WDID = Convert.ToInt32(Session["WDID"].ToString());
                            Session["MyTeams"] = _mbps.getLoginTeams();
                            //gridSample.DataSource = (DataTable)Session["MyTeams"];
                            //gridSample.DataBind();
                            //gridSample.HeaderRow.TableSection = TableRowSection.TableHeader;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Redirect("About.aspx");
            }
            
        }
    }
}