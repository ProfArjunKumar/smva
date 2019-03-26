using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SMVA
{
    public partial class TMAddClient : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SMVA"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["TM"] != null)
            {
                if (!IsPostBack)
                {
                    int recentEnquiryId = GetRecentEnquiryId();
                    txtclientid.Text = recentEnquiryId.ToString();
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
            txtcompanyname.Text = "";
            txtcontactnumber.Text = "";
            txtdesignation.Text = "";
            txtmobile.Text = "";
            txtalternativenumber.Text = "";
            txtaddress.Text = "";
            txtemailid.Text = "";
            txtindustry.Text = "";
            txtgst.Text = "";
            txtbiiling.Text = "";
            txtaggrementdate.Text = DateTime.Now.Date.ToString("yyyy/MM/dd");
            txtrenewaldate.Text = DateTime.Now.Date.ToString("yyyy/MM/dd");
            txtaggrementpercentage.Text = "";
        }

        private int GetRecentEnquiryId()
        {
            SqlCommand cmd1 = new SqlCommand("select isnull(MAX(id),0) id from addclient", con);
            con.Open();
            SqlDataReader reader = cmd1.ExecuteReader();
            if (reader.Read())
            {
                return reader.GetInt32(0) + 1;
            }
            con.Close();
            return 0;
        }

        protected void btn_logout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/Login.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("insert into addclient values('" + txtdate.Text + "','" + txtcompanyname.Text + "','" + txtcontactnumber.Text + "','" + txtdesignation.Text + "','" + txtmobile.Text + "','" + txtalternativenumber.Text + "','" + txtaddress.Text + "','" + txtemailid.Text + "','" + txtindustry.Text + "','" + txtgst.Text + "','" + txtbiiling.Text + "','" + txtaggrementdate.Text + "','" + txtrenewaldate.Text + "','" + txtaggrementpercentage.Text + "','" + txtcontactperson2.Text + "','" + txtdesignation2.Text + "','" + txtmobile2.Text + "','" + txtcontactperson3.Text + "','" + txtdesignation3.Text + "','" + txtMobile3.Text + "','" + txtcontactperson4.Text + "','" + txtdesignation4.Text + "','" + txtMobile4.Text + "','" + txtcontactperson5.Text + "','" + txtdesignation5.Text + "','" + txtMobile5.Text + "','"+ Session["TM"].ToString() + "')", con);
            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();
            if (i == 1)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Client Added Succesfully');", true);
                int recentEnquiryId = GetRecentEnquiryId();
                txtclientid.Text = recentEnquiryId.ToString();
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
            string FileName = "ClientReport" + DateTime.Now + ".xls";
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

        protected void txtcompanyname_TextChanged(object sender, EventArgs e)
        {
            if (Page.IsPostBack == true)
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from addclient where companyname='" + txtcompanyname.Text + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    emsg.Visible = true;
                    emsg.Text = "CompanyName already exists.";
                    emsg.ForeColor = System.Drawing.Color.DarkRed;
                }
                else
                {
                    emsg.Visible = true;
                    emsg.Text = "You can choose this CompanyName.";
                    emsg.ForeColor = System.Drawing.Color.ForestGreen;
                }
                con.Close();
            }
        }
    }
}