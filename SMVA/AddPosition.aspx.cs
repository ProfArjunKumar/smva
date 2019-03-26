using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace SMVA
{
    public partial class AddPosition : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SMVA"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] != null || Session["TL"] != null)
            {
                if (!IsPostBack)
                {
                    binddata();
                    int recentEnquiryId = GetRecentEnquiryId();
                    txtpositionid.Text = recentEnquiryId.ToString();
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
            txtspocname.Text = "";
            txtspocnumber.Text = "";
            DropDownList1.SelectedValue = "-1";
            txtcompanyname.Text = "";
            txttitle.Text = "";
            txtdesignation.Text = "";
            TextBox1.Text = "";
            txtdesignation.Text = "";
        }

        private void binddata()
        {
            SqlDataAdapter da = new SqlDataAdapter("select * from addclient", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            DropDownList1.DataSource = ds;
            DropDownList1.DataTextField = "companyname";
            DropDownList1.DataValueField = "companyname";
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new System.Web.UI.WebControls.ListItem("---- Select Company ----", "-1"));
        }

        private int GetRecentEnquiryId()
        {
            SqlCommand cmd1 = new SqlCommand("select isnull(MAX(id),0) id from addposition", con);
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
            SqlCommand cmd = new SqlCommand("insert into addposition values('" + txtdate.Text + "','" + txtcompanyname.Text + "','" + DropDownList1.SelectedItem.ToString() + "','" + txtspocname.Text + "','" + txtspocnumber.Text + "','" + txttitle.Text + "','" + txtdesignation.Text + "','" + TextBox1.Text + "','" + txtdescription.Text + "')", con);
            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();
            if (i == 1)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Positions added successfully');", true);
            }
            GridView1.DataBind();
            Clear();
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedItem.Text!= "---- Select Company ----")
            {
                SqlCommand cmd = new SqlCommand("select * from addclient where companyname='" + DropDownList1.SelectedItem.ToString() + "'", con);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    txtcompanyname.Text = dr["id"].ToString();
                }
                con.Close();
            }
            else
            {
                txtcompanyname.Text = "";
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.Charset = "";
            string FileName = "PositionsReport" + DateTime.Now + ".xls";
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

       
    }
}