﻿using System;
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
    public partial class AddUser : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SMVA"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] != null || Session["TL"] != null)
            {
                if (!IsPostBack)
                {
                    binddata();
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
            DropDownList1.SelectedValue = "-1";
            TextBox1.Text = "";
            txtdesi.Text = "";
            txtmobile.Text = "";
            txtaddress.Text = "";
            txtemail.Text = "";
            txtContact.Text = "";
            txtusername.Text = "";
            txtpassword.Text = "";
        }

        private void binddata()
        {
            SqlDataAdapter da = new SqlDataAdapter("select * from addemployee", con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            DropDownList1.DataSource = ds;
            DropDownList1.DataTextField = "name";
            DropDownList1.DataValueField = "name";
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new System.Web.UI.WebControls.ListItem("---- Select Employee ----", "-1"));
        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedItem.Text!= "---- Select Employee ----")
            {
                SqlCommand cmd = new SqlCommand("select * from addemployee where name='" + DropDownList1.SelectedItem.ToString() + "'", con);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    TextBox1.Text = dr["id"].ToString();
                    txtdesi.Text = dr["designation"].ToString();
                    txtmobile.Text= dr["mobile"].ToString();
                    txtaddress.Text= dr["address"].ToString();
                    txtemail.Text= dr["emailid"].ToString();
                    txtContact.Text= dr["emergencynumber"].ToString();
                }
                con.Close();
            }
            else
            {
                TextBox1.Text = "";
                txtdesi.Text = "";
                txtmobile.Text = "";
                txtaddress.Text = "";
                txtemail.Text = "";
                txtContact.Text = "";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("insert into adduser values('" + TextBox1.Text + "','" + txtdate.Text + "','" + DropDownList1.SelectedItem.ToString() + "','" + txtdesi.Text + "','" + txtmobile.Text + "','" + txtaddress.Text + "','" + txtemail.Text + "','" + txtContact.Text + "','" + txtusername.Text + "','" + txtpassword.Text + "')", con);
            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();
            if (i == 1)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('User added successfully');", true);
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
            string FileName = "UserReport" + DateTime.Now + ".xls";
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

        protected void txtusername_TextChanged(object sender, EventArgs e)
        {
            if (Page.IsPostBack == true)
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from adduser where username='" + txtusername.Text + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                   
                    emsg.Text = "Username already exists.";
                    emsg.ForeColor = System.Drawing.Color.DarkRed;
                }
               
                con.Close();
            }
        }
    }
}