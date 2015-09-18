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
    public partial class Repeater_UsingStoreProcedure : System.Web.UI.Page
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
            try
            {
                cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "spGetPersonList";
                cmd.Connection = con;
                con.Open();
                var reader = cmd.ExecuteReader();
                //Bind data into reapter
                rptMyRepeater.DataSource = reader;
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

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            con = new SqlConnection(connectionString);
            try
            {
                cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "spGetPersonListByName";
                cmd.Parameters.AddWithValue("@name",txtName.Text.Trim());
                cmd.Connection = con;
                con.Open();
                var reader = cmd.ExecuteReader();
                //Bind data into reapter
                rptMyRepeater.DataSource = reader;
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
    }
}