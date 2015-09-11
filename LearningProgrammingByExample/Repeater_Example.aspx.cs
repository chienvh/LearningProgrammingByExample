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
    public partial class Repeater_Example : System.Web.UI.Page
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

                rptExample2.DataSource = ds;
                rptExample2.DataBind();
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