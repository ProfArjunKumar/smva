using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net.Mail;

namespace SMVA
{
    public partial class Forgotpassword : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SMVA"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("select * from adduser where emailid=@Email", con);
            cmd.Parameters.AddWithValue("@Email", txtemail.Text);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();
            if (dt.Rows.Count > 0)
            {
                DataSet ds = new DataSet();
                con.Open();
                SqlCommand cmd1 = new SqlCommand("SELECT username,password FROM adduser Where emailid= '" + txtemail.Text.Trim() + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd1);
                da.Fill(ds);
                con.Close();
                if (ds.Tables[0].Rows.Count > 0)
                {
                    MailMessage Msg = new MailMessage();
                    // Sender e-mail address.
                    Msg.From = new MailAddress(txtemail.Text);
                    // Recipient e-mail address.
                    Msg.To.Add(txtemail.Text);
                    Msg.Subject = "Your Password Details";
                    MailAddress copy = new MailAddress("priyankaayinaparthi@gmail.com");
                    Msg.CC.Add(copy);
                    Msg.Body = "Hi, <br/>Please check your Login Details<br/><br/>Your UserName is: " + ds.Tables[0].Rows[0]["username"] + "<br/><br/>Your Password is: " + ds.Tables[0].Rows[0]["password"] + "<br/><br/>";
                    Msg.IsBodyHtml = true;
                    // your remote SMTP server IP.
                    SmtpClient smtp = new SmtpClient();
                    smtp.Host = "smtp.gmail.com";
                    smtp.Port = 587;
                    smtp.Credentials = new System.Net.NetworkCredential("priyankaayinaparthi@gmail.com", "priya1234");
                    smtp.EnableSsl = true;
                    smtp.Send(Msg);
                    //Msg = null;
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Your Password Details Sent to your mail');", true);
                    // Clear the textbox valuess
                    txtemail.Text = "";
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Enter correct emailid');", true);                
                Response.Redirect("~/Login.aspx");
            }
        }
    }
}