using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace SMVA
{
    public partial class changepassword : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SMVA"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlDataAdapter da = new SqlDataAdapter("select * from adduser where username='" + txtusername.Text + "' and password='" + txtpassword.Text + "'", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            if (dt.Rows.Count>0)
            {
                SqlCommand cmd = new SqlCommand("update adduser set password='" + txtconfirmpassword.Text + "' where username='" + txtusername .Text+ "'", con);
                con.Open();
                int i=cmd.ExecuteNonQuery();
                con.Close();
                if (i==1)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Password Change Succesfully');", true);
                    Response.Redirect("Login.aspx");
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Username and Password not Matched');", true);
            }
           
        }
    }
}