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
    public partial class NestedRepeater_Example : System.Web.UI.Page
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
                string sql = "Select productTypeId, productTypeName from tblProductType Order by productTypeId desc";
                cmd = new SqlCommand(sql, con);
                da = new SqlDataAdapter(cmd);
                ds = new DataSet();
                da.Fill(ds);
                //Bind data into reapter
                rptProductTypeParent.DataSource = ds;
                rptProductTypeParent.DataBind();
                //Close connections
                cmd.Dispose();
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void rptProductTypeParent_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                var hdfProductType = (HiddenField)e.Item.FindControl("hdfProductTypeId");
                var rptProductChild = (Repeater)e.Item.FindControl("rptProductChild");

                string sql = "Select [productId],[productTypeId],[productName],[productPrice],[quantity] from [dbo].[tblProduct] where productTypeId = @productTypeId Order By productId desc";
                cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@productTypeId", Convert.ToInt32(hdfProductType.Value));
                da = new SqlDataAdapter(cmd);
                ds = new DataSet();
                da.Fill(ds);
                //Bind data into reapter
                rptProductChild.DataSource = ds;
                rptProductChild.DataBind();
                //Close connections
                cmd.Dispose();
                con.Close();
            }
        }
    }
}