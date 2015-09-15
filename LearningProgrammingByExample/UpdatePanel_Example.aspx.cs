using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LearningProgrammingByExample
{
    public partial class UpdatePanel_Example : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnClickMe_Click(object sender, EventArgs e)
        {
            lblMessage.Text = txtName.Text.Trim();
            txtName.Text = string.Empty;
        }
    }
}