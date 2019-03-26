using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace SMVA
{
    public partial class TMMyProfile : System.Web.UI.Page
    {
        string employeename;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SMVA"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["TM"] != null)
            {
                if (!IsPostBack)
                {
                    TextBox1.ReadOnly = true;
                    ddlGender.Enabled = false;
                    txtdesi.ReadOnly = true;
                    txtjdate.ReadOnly = true;
                    txtmobile.ReadOnly = true;
                    txtaddress.ReadOnly = true;
                    txtemail.ReadOnly = true;
                    txtContact.ReadOnly = true;
                    txttarget.ReadOnly = true;
                    txtportal.ReadOnly = true;
                    txtclient.ReadOnly = true;
                    txtfranchies.ReadOnly = true;

                    SqlCommand cmd = new SqlCommand("select * from adduser where username='" + Session["TM"].ToString() + "'", con);
                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        employeename = dr["employeename"].ToString();
                    }
                    con.Close();

                    con.Open();
                    SqlCommand cmd1 = new SqlCommand("select * from addemployee where name='" + employeename + "'", con);                    
                    SqlDataReader dr1 = cmd1.ExecuteReader();
                    while (dr1.Read())
                    {
                        txtid.Text = dr1["id"].ToString();
                        txtdate.Text = dr1["date"].ToString();
                        TextBox1.Text = dr1["name"].ToString();
                        ddlGender.SelectedItem.Text = dr1["gender"].ToString();
                        txtdesi.Text = dr1["designation"].ToString();
                        txtjdate.Text = dr1["joiningdate"].ToString();
                        txtmobile.Text = dr1["mobile"].ToString();
                        txtaddress.Text = dr1["address"].ToString();
                        txtemail.Text = dr1["emailid"].ToString();
                        txtContact.Text = dr1["emergencynumber"].ToString();
                        txttarget.Text = dr1["target"].ToString();
                        txtportal.Text = dr1["portalalloted"].ToString();
                        txtclient.Text = dr1["clientaccount"].ToString();
                        txtfranchies.Text = dr1["franchiseaccount"].ToString();

                    }
                    con.Close();
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnedit_Click(object sender, EventArgs e)
        {
            btnedit.Visible = false;
            btnupdate.Visible = true;
            //TextBox1.ReadOnly = false;
            //ddlGender.Enabled = true;
            txtdesi.ReadOnly = false;
            //txtjdate.ReadOnly = false;
            txtmobile.ReadOnly = false;
            txtaddress.ReadOnly = false;
            txtemail.ReadOnly = false;
            txtContact.ReadOnly = false;
            txttarget.ReadOnly = false;
            txtportal.ReadOnly = false;
            txtclient.ReadOnly = false;
            txtfranchies.ReadOnly = false;
        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {            
            SqlCommand cmd1 = new SqlCommand("update addemployee set designation='" + txtdesi.Text + "',mobile='" + txtmobile.Text + "',address='" + txtaddress.Text + "',emailid='" + txtemail.Text + "',emergencynumber='" + txtContact.Text + "',target='" + txttarget.Text + "',portalalloted='" + txtportal.Text + "',clientaccount='" + txtclient.Text + "',franchiseaccount='" + txtfranchies.Text + "' where name='" + TextBox1.Text + "'", con);
            con.Open();
            int i = cmd1.ExecuteNonQuery();
            con.Close();
            if (i==1)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Details Update Succesfully');", true);
            }            
            btnupdate.Visible = false;
            btnedit.Visible = true;
            TextBox1.ReadOnly = true;
            ddlGender.Enabled = false;
            txtdesi.ReadOnly = true;
            txtjdate.ReadOnly = true;
            txtmobile.ReadOnly = true;
            txtaddress.ReadOnly = true;
            txtemail.ReadOnly = true;
            txtContact.ReadOnly = true;
            txttarget.ReadOnly = true;
            txtportal.ReadOnly = true;
            txtclient.ReadOnly = true;
            txtfranchies.ReadOnly = true;
        }

        protected void btn_logout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }
    }
}