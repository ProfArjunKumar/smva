using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace SMVA
{
    public partial class Login1 : System.Web.UI.Page
    {
       
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SMVA"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (txtusername.Text == "TL" && txtpassword.Text == "12345")
            {
                Session["TL"] = txtusername.Text;
                Response.Redirect("AddEmployee.aspx");
            }
            else if (txtusername.Text == "admin" && txtpassword.Text == "12345")
            {
                Session["admin"] = txtusername.Text;
                Response.Redirect("AddEmployee.aspx");
            }
            else
            {
               
                SqlDataAdapter da = new SqlDataAdapter("select * from adduser where username='" + txtusername.Text + "' and password='" + txtpassword.Text + "' COLLATE SQL_Latin1_General_CP1_CS_AS", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    Session["TM"] = txtusername.Text;
                    Response.Redirect("TMMyProfile.aspx");
                }
                else
                {
                    Label12.ForeColor = System.Drawing.Color.Red;
                    Label12.Text = "Please Enter Correct username and Password";
                }
               

            }
        }
    }
}