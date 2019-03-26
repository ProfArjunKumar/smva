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
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SMVA"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] != null || Session["TL"] != null)
            {
                if (!IsPostBack)
                {
                    Button3.Visible = false;
                    Button2.Visible = false;
                    GridView1.Visible = false;
                    bingassign();
                    binddata();
                    bindopen();
                    int recentEnquiryId = GetRecentEnquiryId();
                    txtorderid.Text = Convert.ToString(recentEnquiryId);
                    txtdate.Text = DateTime.Now.Date.ToString("yyyy/MM/dd");
                    GridView1.Visible = true;
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }        

        private void bingassign()
        {
            SqlDataAdapter da = new SqlDataAdapter("select * from addemployee", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            ddlassign.DataSource = ds;
            ddlassign.DataTextField = "name";
            ddlassign.DataValueField = "name";
            ddlassign.DataBind();
            ddlassign.Items.Insert(0, new System.Web.UI.WebControls.ListItem("---- Select Employee----", "-1"));
        }

        private void bindopen()
        {
            SqlDataAdapter da = new SqlDataAdapter("select * from addposition", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            ddlopening.DataSource = ds;
            ddlopening.DataTextField = "title";
            ddlopening.DataValueField = "title";
            ddlopening.DataBind();
            ddlopening.Items.Insert(0, new System.Web.UI.WebControls.ListItem("---- Select Title----", "-1"));
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
            SqlCommand cmd = new SqlCommand("select isnull(MAX(wrokorder),0) wrokorder from assign", con);
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                return reader.GetInt32(0) + 1;
            }
            con.Close();
            return 0;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {           
            CreateNewRow();
            GridView1.Visible = false;
            gvradd.Visible = true;
            
        }

        private void CreateNewRow()
        {
            try
            {
                DataTable datatbl = new DataTable();
                if (ViewState["Row"] != null)
                {
                    datatbl = (DataTable)ViewState["Row"];
                    DataRow dr = datatbl.NewRow();
                    if (datatbl.Rows.Count > 0)
                    {
                        dr["orderid"] = txtorderid.Text;
                        dr["date"] = txtdate.Text;
                        dr["company_name"] = DropDownList1.SelectedItem.Text;
                        dr["client_id"] = txtcompanyname.Text;
                        dr["title"] = ddlopening.SelectedItem.Text;
                        dr["number_of_position"] = txtnumberofposition.Text;
                        dr["designation"] = txtdesignation.Text;
                        dr["assigned_to_employee"] = ddlassign.SelectedItem.Text;                        
                        datatbl.Rows.Add(dr);
                        ViewState["Row"] = datatbl;
                        ViewState["CurrentTable"] = datatbl;
                        gvradd.DataSource = ViewState["Row"];
                        gvradd.DataBind();
                        this.Button2.Visible = true;
                        this.Button3.Visible = false;

                    }
                }
                else
                {
                    datatbl.Columns.Add("orderid", typeof(int));
                    datatbl.Columns.Add("date", typeof(DateTime));
                    datatbl.Columns.Add("client_id", typeof(string));
                    datatbl.Columns.Add("company_name", typeof(string));
                    datatbl.Columns.Add("title", typeof(string));
                    datatbl.Columns.Add("number_of_position", typeof(string));
                    datatbl.Columns.Add("designation", typeof(string));                    
                    datatbl.Columns.Add("assigned_to_employee", typeof(string));
                    DataRow dr1 = datatbl.NewRow();
                    dr1 = datatbl.NewRow();
                    dr1["orderid"] = txtorderid.Text;
                    dr1["date"] = txtdate.Text;
                    dr1["company_name"] = DropDownList1.SelectedItem.Text;
                    dr1["client_id"] = txtcompanyname.Text;
                    dr1["title"] = ddlopening.SelectedItem.Text;
                    dr1["number_of_position"] = txtnumberofposition.Text;
                    dr1["designation"] = txtdesignation.Text;
                    dr1["assigned_to_employee"] = ddlassign.SelectedItem.Text;                    
                    datatbl.Rows.Add(dr1);
                    ViewState["Row"] = datatbl;
                    ViewState["CurrentTable"] = datatbl;
                    gvradd.DataSource = ViewState["Row"];
                    gvradd.DataBind();
                    this.Button2.Visible = true;
                    this.Button3.Visible = false;
                }
            }
            catch (Exception ex)
            {

            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            DataTable dt = (DataTable)ViewState["Row"];
            string Date, supliername, total, materialname, RequiredQuantity, Category, assign;
            int enqid;
            foreach (DataRow row in dt.Rows)
            {
                enqid = int.Parse(row["orderid"].ToString());
                Date = row["date"].ToString();
                supliername = row["company_name"].ToString();
                materialname = row["client_id"].ToString();
                RequiredQuantity = row["title"].ToString();
                total = row["number_of_position"].ToString();
                Category = row["designation"].ToString();
                assign = row["assigned_to_employee"].ToString();

                this.InsertRows(enqid, Date, materialname, supliername, RequiredQuantity, total, Category, assign);
            }
            gvradd.Visible = false;
            GridView1.Visible = true;
            GridView1.DataBind();
            Button3.Visible = true;
            int recentEnquiryId = GetRecentEnquiryId();
            txtorderid.Text = Convert.ToString(recentEnquiryId);            
            this.Button2.Visible = false;
            this.ddlassign.SelectedValue = "-1";
            ViewState["Row"] = null;
        }

        private void InsertRows(int enqid, string date, string materialname , string supliername, string requiredQuantity, string total, string category, string assign)
        {
            SqlCommand cmd = new SqlCommand("insert into assign (wrokorder,date,clientid,companyname,position,noofposition,designation,assign) values('" + enqid.ToString() + "','" + date.ToString() + "','" + materialname.ToString() + "','" + supliername.ToString() + "','" + requiredQuantity.ToString() + "','" + total.ToString() + "','" + category.ToString() + "','" + assign.ToString() + "')", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            SqlDataAdapter da = new SqlDataAdapter("select wrokorder,date,clientid,companyname,position,noofposition,designation,assign from assign", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
           
            GridView1.DataBind();
            gvradd.Visible = true;
            Button2.Visible = false;            
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValue!="-1")
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

        protected void ddlopening_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlopening.SelectedValue!="-1")
            {
                SqlCommand cmd = new SqlCommand("select * from addposition where title='" + ddlopening.SelectedItem.ToString() + "'", con);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    txtnumberofposition.Text = dr["noofposition"].ToString();
                    txtdesignation.Text = dr["designation"].ToString();
                }
                con.Close();
            }
            else
            {
                txtnumberofposition.Text = "";
                txtdesignation.Text = "";
            }
        }

        protected void gvradd_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int index = Convert.ToInt32(e.RowIndex);
            DataTable dt = ViewState["Row"] as DataTable;
            dt.Rows[index].Delete();
            ViewState["Row"] = dt;
            gvradd.DataSource = dt;
            gvradd.DataBind();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Clear();
            Response.Buffer = true;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.Charset = "";
            string FileName = "WorkAssignReport" + DateTime.Now + ".xls";
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