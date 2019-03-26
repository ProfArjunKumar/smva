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
    public partial class TMWeekReport : System.Web.UI.Page
    {
        string employeename;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SMVA"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["TM"] != null)
            {
                if (!IsPostBack)
                {
                    SqlCommand cmd = new SqlCommand("select * from adduser where username='" + Session["TM"].ToString() + "'", con);
                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        employeename = dr["employeename"].ToString();
                    }
                    con.Close();

                    txtemployeename.Text = employeename;
                    binddata();
                    clear();
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        private void clear()
        {
            txtweekstart.Text = DateTime.Now.Date.ToString("yyyy/MM/dd");
            txtweekend.Text = DateTime.Now.Date.ToString("yyyy/MM/dd");
            txtnumberofposition.Text = "";
            txtcalls.Text = "";
            txtsubmitedcvs.Text = "";
            txtftf.Text = "";
            txtclousers.Text = "";
            txtremark.Text = "";
            txttarget.Text = "";
        }

        private void binddata()
        {
            SqlDataAdapter da = new SqlDataAdapter("select * from addclient", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            DropDownList1.DataSource = ds;
            DropDownList1.DataTextField = "contactperson";
            DropDownList1.DataValueField = "contactperson";
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new System.Web.UI.WebControls.ListItem("---- Select Client Name ----", "-1"));
        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValue!="-1")
            {
                SqlCommand cmd = new SqlCommand("select * from addclient where contactperson='" + DropDownList1.SelectedItem.ToString() + "'", con);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    txtdesignation.Text = dr["desgination"].ToString();
                }
                con.Close();
            }
            else
            {
                txtdesignation.Text = "";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("insert into weekly_mis_report(empid,weekstartingdate,clientname,Designation,numberofpositions,calls,submittedcv,F2F,closureswithdetails,remarks,target,weekendingdate,username) values('" + txtemployeename.Text + "','" + txtweekstart.Text + "','" + DropDownList1.SelectedItem.ToString() + "','" + txtdesignation.Text + "','" + txtnumberofposition.Text + "','" + txtcalls.Text + "','" + txtsubmitedcvs.Text + "','" + txtftf.Text + "','" + txtclousers.Text + "','" + txtremark.Text + "','" + txttarget.Text + "','" + txtweekend.Text + "','"+Session["TM"].ToString()+"')", con);
            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();
            if (i == 1)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Week Report added successfully');", true);
            }
            GridView1.DataBind();
            clear();
        }

        protected void btn_logout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/Login.aspx");
        }
    }
}