using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.IO;

namespace SMVA
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SMVA"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] != null || Session["TL"] != null)
            {
                if (!IsPostBack)
                {
                    int recentEnquiryId = GetRecentEnquiryId();
                    txtid.Text = recentEnquiryId.ToString();
                    txtdate.Text = DateTime.Now.Date.ToString("yyyy/MM/dd");
                    Clear();
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        private void Clear()
        {
            TextBox1.Text = "";
            txtdesi.Text = "";
            txtjdate.Text = DateTime.Now.Date.ToString("yyyy/MM/dd");
            txtmobile.Text = "";
            txtaddress.Text = "";
            txtemail.Text = "";
            txtContact.Text = "";
            txttarget.Text = "";
            txtportal.Text = "";
            txtclient.Text = "";
            txtfranchies.Text = "";
        }

        private int GetRecentEnquiryId()
        {
            SqlCommand cmd1 = new SqlCommand("select isnull(MAX(id),0) id from addemployee", con);
            con.Open();
            SqlDataReader reader = cmd1.ExecuteReader();
            if (reader.Read())
            {
                return reader.GetInt32(0) + 1;
            }
            con.Close();
            return 0;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("insert into addemployee values('" + txtdate.Text + "','" + TextBox1.Text + "','" + ddlGender.SelectedItem.ToString() + "','" + txtdesi.Text + "','" + txtjdate.Text + "','" + txtmobile.Text + "','" + txtaddress.Text + "','" + txtemail.Text + "','" + txtContact.Text + "','" + txttarget.Text + "','" + txtportal.Text + "','" + txtclient.Text + "','" + txtfranchies.Text + "')", con);
            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();
            if (i == 1)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Employee Added Succesfully');", true);
                int recentEnquiryId = GetRecentEnquiryId();
                txtid.Text = recentEnquiryId.ToString();
            }
            GridView1.DataBind();
            Clear();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.Charset = "";
            string FileName = "EmployeeReport" + DateTime.Now + ".xls";
            StringWriter strwritter = new StringWriter();
            HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
            GridView1.GridLines = GridLines.Both;
            GridView1.HeaderStyle.Font.Bold = true;
            GridView1.RenderControl(htmltextwrtter);
            Response.Write(strwritter.ToString());
            Response.End();
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
               server control at run time. */
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            if (Page.IsPostBack == true)
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from addemployee where name='" + TextBox1.Text + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    emsg.Visible = true;
                    emsg.Text = "Name already exists.";
                    emsg.ForeColor = System.Drawing.Color.DarkRed;
                }
                else
                {
                    emsg.Visible = true;
                    emsg.Text = "You can choose this Name.";
                    emsg.ForeColor = System.Drawing.Color.ForestGreen;
                }
                con.Close();
            }
        }
    }
}