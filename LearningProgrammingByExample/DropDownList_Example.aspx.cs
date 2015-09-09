using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LearningProgrammingByExample
{
    public partial class DropDownList_Example : System.Web.UI.Page
    {
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;

        SqlConnection connection = new SqlConnection("Data Source = CHIENVH-PC;Initial Catalog=MyDB;Persist Security Info=True;User ID=sa; Password=123456789;");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            BindDataIntoDropDownList();
        }

        private void BindDataIntoDropDownList()
        {
            connection.Open();
            cmd = new SqlCommand("Select Id, Name, Address From tblPerson order By Id desc", connection);
            var ds = new DataSet();
            da = new SqlDataAdapter(cmd);
            da.Fill(ds);

            //Bind data into dropdown list
            ddlResult.DataSource = ds;
            ddlResult.DataTextField = "Name";
            ddlResult.DataValueField = "Id";
            ddlResult.DataBind();
            //Add the item at the first position
            ddlResult.Items.Insert(0, "---Select---");
        }

        protected void ddlResult_SelectedIndexChanged(object sender, EventArgs e)
        {
            string value = ddlResult.SelectedValue;
            string text = ddlResult.SelectedItem.Text;
            lblMessage.Text = String.Format("Value: {0} - Text: {1}", value, text);
        }
    }
}