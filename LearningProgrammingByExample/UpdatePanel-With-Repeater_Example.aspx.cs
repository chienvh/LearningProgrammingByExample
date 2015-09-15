using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LearningProgrammingByExample
{
    public partial class UpdatePanel_With_Repeater_Example : System.Web.UI.Page
    {
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        string connectionString = WebConfigurationManager.ConnectionStrings["stringConnection"].ConnectionString;
        SqlConnection con;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            LoadingDataToReapter();
        }

        private void LoadingDataToReapter()
        {
            con = new SqlConnection(connectionString);
            con.Open();
            try
            {
                string sql = "Select Id, Name, Address, CreatedDate From tblPerson Order By Id desc";
                cmd = new SqlCommand(sql, con);
                da = new SqlDataAdapter(cmd);
                ds = new DataSet();
                da.Fill(ds);
                //Bind data into reapter
                rptMyRepeater.DataSource = ds;
                rptMyRepeater.DataBind();
                //Close connections
                cmd.Dispose();
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            con = new SqlConnection(connectionString);
            con.Open();
            try
            {
                string sql = "Insert Into tblPerson(Name, Address, CreatedDate) Values(@Name,@Address,@CreatedDate)";
                cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());
                cmd.Parameters.AddWithValue("@CreatedDate", DateTime.Now);
                cmd.ExecuteNonQuery();
                //Close connections
                cmd.Dispose();
                con.Close();
                LoadingDataToReapter();
                txtName.Text = string.Empty;
                txtAddress.Text = string.Empty;
            }
            catch (Exception ex)
            {
                lblDisplay.Visible = true;
                lblDisplay.Text = ex.Message;
            }
        }
    }
}