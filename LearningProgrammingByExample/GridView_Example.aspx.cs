using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace LearningProgrammingByExample
{
    public partial class GridView_Example : System.Web.UI.Page
    {
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        string connectionString = WebConfigurationManager.ConnectionStrings["stringConnection"].ConnectionString;
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            LoadingDatatoGridView();
        }

        private void LoadingDatatoGridView() 
        {
            con = new SqlConnection(connectionString);
            con.Open();
            string sql = "Select Id, Name, Address, CreatedDate From tblPerson Order By Id desc";
            cmd = new SqlCommand(sql, con);
            da = new SqlDataAdapter(cmd);
            ds = new DataSet();
            da.Fill(ds);
            //Bind data into gridview
            grvResult.DataSource = ds;
            grvResult.DataBind();
            //Close connections
            cmd.Dispose();
            con.Close();
        }

        protected void grvResult_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grvResult.PageIndex = e.NewPageIndex;
            LoadingDatatoGridView();
        }
    }
}