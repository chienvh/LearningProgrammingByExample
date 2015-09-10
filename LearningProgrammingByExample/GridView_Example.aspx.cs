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
        SqlDataReader reader;
        string connectionString = WebConfigurationManager.ConnectionStrings["stringConnection"].ConnectionString;
        SqlConnection con;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack) return;
            LoadingDatatoGridView();
            divForm.Visible = false;
        }

        private void LoadingDatatoGridView() 
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
                //Bind data into gridview
                grvResult.DataSource = ds;
                grvResult.DataBind();
                //Close connections
                cmd.Dispose();
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void grvResult_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grvResult.PageIndex = e.NewPageIndex;
            LoadingDatatoGridView();
        }

        protected void grvResult_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string strId = e.CommandArgument.ToString();
            string nName = e.CommandName.ToLower();

            switch (nName)
            {
                //Edit data
                case "_edit":
                    divForm.Visible = true;
                    divGridView.Visible = false;
                    HiddenField1.Value = strId;
                    btnAddNew.Text = "Update";
                    lblFormTitle.Text = "Update Form";
                    LoadDataForEdit();
                    break;
                //Delete data
                case "_delete":
                    try
                    {
                        con = new SqlConnection(connectionString);
                        con.Open();
                        string sql = "Delete from tblPerson Where Id = @Id";
                        cmd = new SqlCommand(sql, con);
                        cmd.Parameters.AddWithValue("@Id", Convert.ToInt32(strId));
                        var check = cmd.ExecuteNonQuery();
                        if (check < 1)
                        {
                            lblDisplay.Visible = true;
                            lblDisplay.Text = "Cannot delete this record!";
                        }
                        cmd.Dispose();
                        con.Close();
                        LoadingDatatoGridView();
                    }
                    catch (Exception ex)
                    {
                        lblDisplay.Visible = true;
                        lblDisplay.Text = ex.Message;
                    }
                    break;
            }
        }

        protected void btnAddNew_Click(object sender, EventArgs e)
        {
            if (HiddenField1.Value == string.Empty)
            {
                Insert();
            }
            else
            {
                Update();
            }
            ResetForm();
            LoadingDatatoGridView();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ResetForm();
        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            divForm.Visible = true;
            divGridView.Visible = false;
            btnAddNew.Text = "Add New";
            lblFormTitle.Text = "Add New Form";
        }

        private void LoadDataForEdit()
        {
            con = new SqlConnection(connectionString);
            con.Open();
            try
            {
                string sql = "Select Id, Name, Address, CreatedDate From tblPerson Where Id = @Id";
                cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@Id", Convert.ToInt32(HiddenField1.Value));
                reader = cmd.ExecuteReader();
                var person = new Person();
                if (reader.Read())
                {
                    person.Id = reader.GetValue(reader.GetOrdinal("Id")).ToString();
                    person.Name = reader.GetValue(reader.GetOrdinal("Name")).ToString();
                    person.Address = reader.GetValue(reader.GetOrdinal("Address")).ToString();
                    person.CreatedDate = Convert.ToDateTime(reader.GetValue(reader.GetOrdinal("CreatedDate")).ToString());
                }
                //Fill data to controls
                txtName.Text = person.Name;
                txtAddress.Text = person.Address;
                //Close connections
                reader.Dispose();
                cmd.Dispose();
                con.Close();
            }
            catch (Exception ex)
            {
                lblDisplay.Visible = true;
                lblDisplay.Text = ex.Message;
            }
        }

        protected void ResetForm()
        {
            HiddenField1.Value = string.Empty;
            txtName.Text = string.Empty;
            txtAddress.Text = string.Empty;
            divForm.Visible = false;
            divGridView.Visible = true;
            lblDisplay.Visible = false;
        }

        private void Update()
        {
            con = new SqlConnection(connectionString);
            con.Open();
            try
            {
                string sql = "Update tblPerson Set Name=@Name, Address=@Address Where Id = @Id";
                cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@Id", Convert.ToInt32(HiddenField1.Value));
                cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());
                cmd.ExecuteNonQuery();
                //Close connections
                cmd.Dispose();
                con.Close();
            }
            catch (Exception ex)
            {
                lblDisplay.Visible = true;
                lblDisplay.Text = ex.Message;
            }
        }

        private void Insert()
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
            }
            catch (Exception ex)
            {
                lblDisplay.Visible = true;
                lblDisplay.Text = ex.Message;
            }
        }
    }

    public class Person
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        public DateTime CreatedDate { get; set; }
    }
}