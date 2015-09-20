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
    public partial class TreeView_HierarchicalData_UsingStoreProcedure : System.Web.UI.Page
    {
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        string connectionString = WebConfigurationManager.ConnectionStrings["stringConnection"].ConnectionString;
        SqlConnection con;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            LoadingDatatoTreeview();
        }

        private void LoadingDatatoTreeview()
        {
            con = new SqlConnection(connectionString);
            try
            {
                cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "spGetCategoriesList";
                cmd.Connection = con;
                con.Open();
                var reader = cmd.ExecuteReader();
                // Convert SqlDataReader to DataSet
                var myTable = new DataTable("mytable");
                myTable.Columns.Add("id", typeof(string));
                myTable.Columns.Add("name", typeof(string));
                myTable.Columns.Add("parentId", typeof(string));

                while (reader.Read())
                {
                    myTable.Rows.Add(new[]
                                     {
                                         reader["id"].ToString(), 
                                         reader["name"].ToString(), 
                                         reader["parentId"].ToString()
                                     });
                }
                myTable.AcceptChanges();
                ds = new DataSet();
                ds.Tables.Add(myTable);
                ds.AcceptChanges();

                var parentId = (from myRow in ds.Tables[0].AsEnumerable()
                                select myRow["parentId"]).FirstOrDefault();

                CreateTreeViewDataTable(ds.Tables[0], Convert.ToString(parentId), null);
                //Close connections
                cmd.Dispose();
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        private void CreateTreeViewDataTable(DataTable dt, string parentId, TreeNode parentNode)
        {
            DataRow[] drs = dt.Select(string.Format("parentId = '{0}'", parentId));
            foreach (DataRow i in drs)
            {
                var newNode = new TreeNode(i["name"].ToString(), i["id"].ToString());
                newNode.NavigateUrl = string.Format("~/mydetail.aspx?id={0}", i["id"].ToString());
                if (parentNode == null)
                {
                    tvResult.Nodes.Add(newNode);
                }
                else
                {
                    parentNode.ChildNodes.Add(newNode);
                }
                CreateTreeViewDataTable(dt, Convert.ToString(i["id"]), newNode);
            }
            tvResult.ExpandAll();
        }

    }
}