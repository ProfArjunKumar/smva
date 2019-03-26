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
    public partial class TMOnlineReport : System.Web.UI.Page
    {
        string comp2, comp1;
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
                    getcompany();
                    txtname.Text = employeename;
                    txtdate.Text = DateTime.Now.Date.ToString("yyyy/MM/dd");
                    clear();
                    GridView1.DataBind();
                }
            }
            else
            {
                Response.Redirect("~/Login.aspx");
            }
        }

        private void getcompany()
        {
            SqlDataAdapter da = new SqlDataAdapter("select * from addclient", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            ddlcompanyname.DataSource = ds;
            ddlcompanyname.DataTextField = "companyname";
            ddlcompanyname.DataValueField = "companyname";
            ddlcompanyname.DataBind();
            ddlcompanyname.Items.Insert(0, new System.Web.UI.WebControls.ListItem("---- Select Company----", "-1"));
            ddlcompanyname.Items.Insert(0, new System.Web.UI.WebControls.ListItem("---- Empty----", "0"));
        }

        private void clear()
        {
            DropDownList1.SelectedValue = "-1";
            ddlcompanyname.SelectedValue = "-1";
            txtdesignation.Text = "";
            txtnoofcvs.Text = "";
            txtnextdaylineup.Text = "";
            txtnextdayplan.Text = "";
        }

        protected void Button1_Click(object sender, EventArgs e)

        {
            if (DropDownList1.SelectedItem.Text == "12:30")
            {
                SqlDataAdapter da = new SqlDataAdapter("select companyname01 from ontime_report where username='" + Session["TM"].ToString() + "' and date ='" + txtdate.Text + "' and companyname01='" + ddlcompanyname.SelectedItem.Text + "'", con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count == 0)
                {

                    SqlCommand cmd = new SqlCommand("insert into ontime_report (date,name,companyname01,Designation01,numberofcv01,username,time01) values ('" + txtdate.Text + "','" + txtname.Text + "','" + ddlcompanyname.SelectedItem.Text + "','" + txtdesignation.Text + "','" + txtnoofcvs.Text + "','" + Session["TM"].ToString() + "','" + DropDownList1.SelectedItem.Text + "')", con);
                    con.Open();
                    int i = cmd.ExecuteNonQuery();
                    con.Close();
                    if (i == 1)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('12:30 Report Submited Succesfully');", true);
                        clear();
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('12:30 Report Already Submited');", true);
                }
                GridView1.DataBind();
            }
            else if (DropDownList1.SelectedItem.Text == "3:30")
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from ontime_report where username='" + Session["TM"].ToString() + "' and date='" + txtdate.Text + "' and companyname01='" + ddlcompanyname.SelectedItem.Text + "'", con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    comp2 = ds.Tables[0].Rows[0]["companyname02"].ToString();
                    comp1 = ds.Tables[0].Rows[0]["companyname01"].ToString();
                    string s = comp2;
                    string s1 = comp1;
                    if (s == "" && s1 != "")
                    {
                        SqlCommand cmd = new SqlCommand("update ontime_report set companyname02='" + ddlcompanyname.SelectedItem.Text + "',Designation02='" + txtdesignation.Text + "',numberofcv02='" + txtnoofcvs.Text + "', time02='" + DropDownList1.SelectedItem.Text + "' where username='" + Session["TM"].ToString() + "' and date='" + txtdate.Text + "' and companyname01='" + ddlcompanyname.SelectedItem.Text + "'", con);
                        con.Open();
                        int i = cmd.ExecuteNonQuery();
                        con.Close();
                        if (i == 1)
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('3:30 Report Submited Succesfully');", true);
                            clear();
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Please Submit 12:30 Report and insert 3:30');", true);
                    }
                }
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Please Submit 12:30 Report and insert 3:30');", true);
                GridView1.DataBind();
            }
            else if (DropDownList1.SelectedItem.Text == "6:00")
            {
                SqlDataAdapter da = new SqlDataAdapter("select * from ontime_report where username='" + Session["TM"].ToString() + "' and date='" + txtdate.Text + "' and companyname02='" + ddlcompanyname.SelectedItem.Text + "'", con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    Application["val"] = ds.Tables[0].Rows[0]["companyname03"];
                    Application["val1"] = ds.Tables[0].Rows[0]["companyname02"];
                    Application["val2"] = ds.Tables[0].Rows[0]["companyname01"];
                    string s = Application["val"].ToString();
                    string s1 = Application["val1"].ToString();
                    string s2 = Application["val2"].ToString();
                    if (s == "" && s1 != "" && s2 != "")
                    {
                        SqlCommand cmd = new SqlCommand("update ontime_report set companyname03='" + ddlcompanyname.SelectedItem.Text + "',Designation03='" + txtdesignation.Text + "',numberofcv03='" + txtnoofcvs.Text + "',nextdaylineups='" + txtnextdaylineup.Text + "',nextdayplan='" + txtnextdayplan.Text + "',time03='" + DropDownList1.SelectedItem.Text + "' where username='" + Session["TM"].ToString() + "' and date='" + txtdate.Text + "' and companyname01='" + ddlcompanyname.SelectedItem.Text + "'", con);
                        con.Open();
                        int i = cmd.ExecuteNonQuery();
                        con.Close();
                        if (i == 1)
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('6:00 Report Submited Succesfully');", true);
                            clear();
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Please Submit 12:30 Report and 3:30 Report and insert 6:00');", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Please Submit 12:30 Report and 3:30 Report and insert 6:00');", true);
                }
            }
            GridView1.DataBind();
        }

        protected void ddlcompanyname_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlcompanyname.SelectedValue=="0")
            {
                txtdesignation.Text = "NA";
            }
            else if(ddlcompanyname.SelectedValue == "-1")
            {
                txtdesignation.Text = "";
            }
            else
            {
                SqlCommand cmd = new SqlCommand("select * from addclient where companyname='" + ddlcompanyname.SelectedItem.Text + "'", con);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    txtdesignation.Text = dr["desgination"].ToString();
                }
                con.Close();
            }
        }

        protected void btn_logout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/Login.aspx");
        }
    }
}